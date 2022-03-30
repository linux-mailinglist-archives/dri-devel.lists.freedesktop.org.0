Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD55A4EBD1F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881B910F7F3;
	Wed, 30 Mar 2022 09:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5863310F7F3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:02:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7BE285C0190;
 Wed, 30 Mar 2022 05:02:24 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute1.internal (MEProxy); Wed, 30 Mar 2022 05:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=tuz6s6EWNZ0Esh
 nRWti89Elty7LEZNweVZZiB9p+PU8=; b=Ays+hhe7LU/RWsUh7Jq3ipCyb6QZDv
 QWtwS5zW8ob/gZx0ANtxxJgT3yGE+7p/4wMOlfV5oDYGy6fKWMqkXum6YSK6NEax
 KQM+tT1CMsx36Hlqlqy39xX88YuRaQsOZsz2oDrNnJkoyqnggghgx4/bNYRwwsnD
 /pkRDJW9h8QTWJOTs+6WPifJqRaPlNkWPuqkt5jVa3vG7extFFeqk1DvltMiGCLt
 KUZuBf/Wo6ZNBqHlKqNUd+vnoNfUeO7TkNcmJ4FPFb2qkfPFD7BlJNS1Zw32jRM8
 /N5YVVq+YDkuVX4/V2NzCyYeX1s55+Uk7cLPMRoaYLX1F/+cJjkNUKFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=tuz6s6EWNZ0EshnRWti89Elty7LEZNweVZZiB9p+P
 U8=; b=jbKyovw/syyihbCeFXLJA6UtNM+SezgJS4+LoIdhD78+gktuUHoPYr95T
 0n3oYLLHHd/o4XGgP1kjXzVVMdC4jdnfotnfvwsuFFb1OT7irwtYXzOVhUv2wddO
 iVaqZ1SHT8AZTlLjyzDV1B42ydWnZCfHq8XDHyAkW8VtRjBLrBk4///X9mCZqq67
 hExfBIxPYF0cVtQhO2k4pNTk8neocVEk47i1J+OH8xMQh6hEfYYv4oPjfh5NQn7n
 V/MOtiJ4UBnKT4k8etOe94AHM9G11Q3PRq8dM1S/0op/Fh+yAtgIiq+wyZhfEoei
 THTS3VBboNWNW6LyQC0ck2LwcMV7A==
X-ME-Sender: <xms:nRxEYgh6LdPrCa7m3JG_HI0DR7bJP47S2GutXYOyXUtiQjmXGR37Pg>
 <xme:nRxEYpBBVn1Dy7CmwHGlWdyDunLV2_Hng8HR2qZlvtL8gVFwAT_eIixoesmOgNFpT
 8Zt_rMoNM_FYU7UusY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeivddgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepgeehgfehgeffffehtefffeevjeeifefhheejledtfeel
 fffggedvfeekteekteevnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihu
 nhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:nRxEYoGiwSRhKaE89IDQ2q4BWTWceBGWRUg4oR0g6TdSqaIJAvR9bA>
 <xmx:nRxEYhSDQZAVg8gAVTHnhdq8aJ_v9EOZSwNyX4jDmkF11T9Twv1EbQ>
 <xmx:nRxEYtyLXLI7mk0pw6WpFjP9NcQss3I88XpJm3t1hcNzS7-SWsTavQ>
 <xmx:oBxEYjpxpULllUwb1F0o7W7TAv8jWaikJvTFNQ_z0Ehn9_iZWDgEdA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 41CDBFA0AA5; Wed, 30 Mar 2022 05:02:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <a777b827-32a2-46f8-9074-3f43c0bd87ba@www.fastmail.com>
In-Reply-To: <0a3a29af-ad2f-9ccc-3a56-3e5b7e4c7c83@189.cn>
References: <20220328022835.2508587-1-15330273260@189.cn>
 <20220328022835.2508587-3-15330273260@189.cn>
 <CAL_Jsq+zO7RXzQLoPXR7Zm0mcsKCydK=8EFaNFGu-_THgJuh7Q@mail.gmail.com>
 <0a3a29af-ad2f-9ccc-3a56-3e5b7e4c7c83@189.cn>
Date: Wed, 30 Mar 2022 10:01:51 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Sui Jingfeng" <15330273260@189.cn>, "Rob Herring" <robh+dt@kernel.org>
Subject: Re: [PATCH v13 3/6] dt-bindings: display: Add Loongson display
 controller
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



=E5=9C=A82022=E5=B9=B43=E6=9C=8830=E6=97=A5=E4=B8=89=E6=9C=88 =E4=B8=8A=E5=
=8D=884:46=EF=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> On 2022/3/29 21:27, Rob Herring wrote:
>> On Sun, Mar 27, 2022 at 9:29 PM Sui Jingfeng <15330273260@189.cn> wro=
te:
>>> Add DT bindings and simple usages for Loongson display controller
>>> found in LS7A1000 bridge chip and LS2k1000 SoC.
>>>
>>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>>> ---
>>>   .../loongson/loongson,display-controller.yaml | 321 ++++++++++++++=
++++
>>>   1 file changed, 321 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/display/loong=
son/loongson,display-controller.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/loongson/loon=
gson,display-controller.yaml b/Documentation/devicetree/bindings/display=
/loongson/loongson,display-controller.yaml
>>> new file mode 100644
>>> index 000000000000..34060ed55a25
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/loongson/loongson,di=
splay-controller.yaml
>>> @@ -0,0 +1,321 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/loongson/loongson,displa=
y-controller.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Loongson LS7A1000/LS2K1000/LS2K0500 Display Controller Devic=
e Tree Bindings
>>> +
>>> +maintainers:
>>> +  - Sui Jingfeng <suijingfeng@loongson.cn>
>>> +
>>> +description: |+
>>> +
>>> +  Loongson display controllers are simple which require scanout buf=
fers
>>> +  to be physically contiguous. LS2K1000/LS2K0500 is a SOC, only sys=
tem
>>> +  memory is available. LS7A1000/LS7A2000 is bridge chip which is eq=
uipped
>>> +  with a dedicated video RAM which is 64MB or more, precise size ca=
n be
>>> +  read from the PCI BAR 2 of the GPU device(0x0014:0x7A15) in the b=
ridge
>>> +  chip.
>>> +
>>> +  LSDC has two display pipes, each way has a DVO interface which pr=
ovide
>>> +  RGB888 signals, vertical & horizontal synchronisations, data enab=
le and
>>> +  the pixel clock. LSDC has two CRTC, each CRTC is able to scanout =
from
>>> +  1920x1080 resolution at 60Hz. Each CRTC has two FB address regist=
ers.
>>> +
>>> +  For LS7A1000, there are 4 dedicated GPIOs whose control register =
is
>>> +  located at the DC register space. They are used to emulate two wa=
y i2c,
>>> +  One for DVO0, another for DVO1.
>>> +
>>> +  LS2K1000 and LS2K0500 SoC grab i2c adapter from other module, eit=
her
>>> +  general purpose GPIO emulated i2c or hardware i2c in the SoC.
>>> +
>>> +  LSDC's display pipeline have several components as below descript=
ion,
>>> +
>>> +  The display controller in LS7A1000:
>>> +     ___________________                                     ______=
___
>>> +    |            -------|                                   |      =
   |
>>> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monit=
or |
>>> +    |  _   _     -------|        ^             ^            |______=
___|
>>> +    | | | | |    -------|        |             |
>>> +    | |_| |_|    | i2c0 <--------+-------------+
>>> +    |            -------|
>>> +    |   DC IN LS7A1000  |
>>> +    |  _   _     -------|
>>> +    | | | | |    | i2c1 <--------+-------------+
>>> +    | |_| |_|    -------|        |             |             ______=
___
>>> +    |            -------|        |             |            |      =
   |
>>> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Pane=
l  |
>>> +    |            -------|                                   |______=
___|
>>> +    |___________________|
>>> +
>>> +  Simple usage of LS7A1000 with LS3A4000 CPU:
>>> +
>>> +    +------+            +------------------------------------+
>>> +    | DDR4 |            |  +-------------------+             |
>>> +    +------+            |  | PCIe Root complex |   LS7A1000  |
>>> +       || MC0           |  +--++---------++----+             |
>>> +  +----------+  HT 3.0  |     ||         ||                  |
>>> +  | LS3A4000 |<-------->| +---++---+  +--++--+     +---------+   +-=
-----+
>>> +  |   CPU    |<-------->| | GC1000 |  | LSDC |<--->| DDR3 MC |<->| =
VRAM |
>>> +  +----------+          | +--------+  +-+--+-+     +---------+   +-=
-----+
>>> +       || MC1           +---------------|--|-----------------+
>>> +    +------+                            |  |
>>> +    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
>>> +    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DV=
I/HDMI
>>> +                      +-------+                      +------+
>>> +
>>> +  The display controller in LS2K1000/LS2K0500:
>>> +     ___________________                                     ______=
___
>>> +    |            -------|                                   |      =
   |
>>> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monit=
or |
>>> +    |  _   _     -------|        ^              ^           |______=
___|
>>> +    | | | | |           |        |              |
>>> +    | |_| |_|           |     +------+          |
>>> +    |                   <---->| i2c0 |<---------+
>>> +    |   DC IN LS2K1000  |     +------+
>>> +    |  _   _            |     +------+
>>> +    | | | | |           <---->| i2c1 |----------+
>>> +    | |_| |_|           |     +------+          |            ______=
___
>>> +    |            -------|        |              |           |      =
   |
>>> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Pane=
l  |
>>> +    |            -------|                                   |______=
___|
>>> +    |___________________|
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^display-controller@[0-9a-f],[0-9a-f]$"
>>> +
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>> +          - enum:
>>> +              - loongson,ls7a1000-dc
>>> +              - loongson,ls2k1000-dc
>>> +              - loongson,ls2k0500-dc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +  i2c@6:
>> NAK on made-up bus numbers. See v11 discussion for details.
>>
>> Rob
>
> I am worry about when this driver is loaded before the hardware i2c(on=20
> the ls7a1000 bridge) driver,

That=E2=80=99s the problem that EPROBE_DEFER addressed.

>
> and when there is no DT support. in such a case, if i2c bus number is=20
> dynamically assigned,
>
> it may incurring troubles.=C2=A0 Made the bus number fixed is benefit =
to the=20
> whole system.
>
> DT=C2=A0 serve as a purpose to passing parameters to the kernel.=C2=A0=
 bus numbers=20
> just a kind of parameters.
>
> this is my understanding toward DT. why you are so disagree about this=
?=C2=A0=20
> what's the benefits of
>
> disallow put bus numbers it DT? to the whole world of developers who i=
s=20
> using DT?

There is nothing more to discuss.
You lack understanding to the fundamentals of the DT because you didn=E2=
=80=99t work
on thousands of platforms and being trapped by previous design failures.

Just follow the instructions from Rob, he is the expert. Is it that hard?

Thanks
--=20
- Jiaxun
