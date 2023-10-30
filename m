Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E887DB929
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 12:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C83210E29D;
	Mon, 30 Oct 2023 11:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC93C10E28D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1698661409; x=1699266209; i=wahrenst@gmx.net;
 bh=f+PEb2WT3mpEcXgUlwJ7gpe8kKmIQ6CsounQuI5cQMw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=Pq1DRqBZD0uDIsHVpJkA+BkTT9H6RqCTYwi9OKc/sLr6lBMtAuJOWnmzt03jyI9T
 lY2LI02ZUplg8G9sSVqEzIxsM+8JMEP/M1FQidsN3ONjXkRbNnYKyMegDKyZlfj3Y
 q/ubVtzPfDF4gm3lmHGAuRp/ItNaq5xrjs4L1xsp3OYf1vmQ+iWjB/uys4hkiH0KB
 svyWPL3sQevgNz4By+9UA4ywmWtK8JdtaXIH4g1QbnRWqea9+SH67LXzoE373VC2I
 xCfethw2Grlswe8Bz27NutSwkglRQ5D/7BC4gP27UVObftiZl5/agID217atIe3C8
 c4UIF/7VpMViWqAf/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJVDM-1rCsyv1UO8-00JuhF; Mon, 30
 Oct 2023 11:23:29 +0100
Message-ID: <37588c20-79a7-4d4d-a40c-7fd79b989061@gmx.net>
Date: Mon, 30 Oct 2023 11:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: gpu: v3d: Add BCM2712's compatible
Content-Language: en-US
To: Iago Toral <itoral@igalia.com>, Maira Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
References: <20231030082858.30321-1-itoral@igalia.com>
 <20231030082858.30321-4-itoral@igalia.com>
 <1d926740-74d8-4114-85c7-30b2e986ba8a@gmx.net>
 <641b573516a2d22dfe082b1c25b26e4e68d6a68b.camel@igalia.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <641b573516a2d22dfe082b1c25b26e4e68d6a68b.camel@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fE0r/yURANaw20RD2rom1OYKMxN/QFSBbQ1EV/83HzpnTfqqeT1
 LlZp5R8KIjyehYfCGv+zcOHmA8CmPqwkWqe024rYVCb616Hi/b2M/KtnnbST0+dk+NtfEqZ
 wHNM0lLGEFThzGk7EgMxHivksujs0pQSjFLxkXfUp7GpkFAqSFLpsWOdDSewI8/91/yCLT6
 XFy/ok9kcuLHCrN3sdHcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qmqLTz2vblw=;tliapOyy3RtlCXThXgVSYo8IolN
 CuV9dCenEoiiAY0xjnWRoJHfnBMBl+N0nTs7fIgxQ4dKtk7Tnf8To+gdYMldUOpfj02QJOx1t
 whRmpjJZjgKyObT3A/ST0Zl+fXcRyjn90fZJyxvLGUMW3P3AkOoFk6WeU+avL7/tkQxIct4kB
 nLp+qJnzSOIIuAB71NrSEx9Lq6iVP545i/Js/iGkSU5BCqYRM0yxjWgzayZBlMA+8qQ2BEGVI
 8lJY+1NQmsnPDqdjawCsRliW2jOo3fyBQTLcXioHZKGAupm3VrsAYQ4Fx5o5Vhc4XpIrH66t7
 e9fpSrSG/HJz0/7orsX7TjaN7Pnk7avHQ5u8DO0GS3aqsht1PHtamEnSiWg+slIgvpdUc14DK
 JcV+pzTjpfDo4vi1MqVCfRhGy1f21fWE1XsdCIziWGxqWKEWbH4mOn2wolbbeUA9h6pP9RIKM
 6cXlD+dvRZh/O8ESKgZ5vg+P/ScKGe1FDbgwmpoFWEkz0w90vbBYxN7sScVWjP5Cnzt7yPLuF
 4ZzG0JhEEYn1E9uZHzmk4jjJlEjQcjvmXFOqO0C3gSOETefWXUZPI8xHCc8ANwHmVzSwpiDwA
 cWdzkli7ComtG8fHuZipsNHoqb/vEK17VlGtTuxYoc4aEy2Xc85wl18X4COL2628/cnLLzenM
 b1+lNuPB9e/jw/1NcMMuWm9XwEoiLv67losO51fD4DkPfhf5bUrq65ZYuBdh1NGSjkM8xL7Yv
 +AavyQi9Epx2tPNyXUItixfHHm0nuR7APwuN8EH+dfcELGLfnz+tpHLRmteNuJ4yKb4W1zb1X
 6GyJJrThlm40ZPoqvu3ncba95C7i8Yo8e7QBw8EPsLkAavjQoRU1b/A6d46ezQuQsWNkAPoRd
 /VIZh7toAqazHy4c5pFkqE80RZnyn3kZwHLghOVI7R7Q7mDBEJ4DkRCKeVLSkl8ZtLae3Fx04
 AfAWnfvfBEIFsXOLfRYO1B9CgBE=
X-Mailman-Approved-At: Mon, 30 Oct 2023 11:41:13 +0000
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iago,

Am 30.10.23 um 11:18 schrieb Iago Toral:
> El lun, 30-10-2023 a las 10:57 +0100, Stefan Wahren escribi=C3=B3:
>> Hi Iago,
>>
>> Am 30.10.23 um 09:28 schrieb Iago Toral Quiroga:
>>> BCM2712, Raspberry Pi 5's SoC, contains a V3D core. So add its
>>> specific
>>> compatible to the bindings.
>>>
>>> v2: new, requested by Stefan Wahren.
>> Thanks for sending this but the line above belongs below --- since
>> it's
>> not relevant after the patch has been applied.
>>> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
>> Unfortunately this patch will be ignored because the relevant
>> devicetree
>> people are missing to give their Ack.
>>
>> Please use scripts/get_maintainers.pl
>>
> Sorry about that, my bad, should I resend the patch (as part of a v3)
> or is it enough to add the relevant maintainers in a reply to the
> original v2 patch?
since the merge window for 6.7 is open, please resent as part of v3.
>
> Iago
>
>> Best regards
>>> ---
>>>  =C2=A0 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 1 +
>>>  =C2=A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-
>>> v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>> index dae55b8a267b..dc078ceeca9a 100644
>>> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>> @@ -17,6 +17,7 @@ properties:
>>>  =C2=A0=C2=A0=C2=A0 compatible:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - brcm,2711-v3d
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - brcm,2712-v3d
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - brcm,7268-v3d
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - brcm,7278-v3d
>>>
>>

