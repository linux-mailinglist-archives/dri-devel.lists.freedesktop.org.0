Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBA07145D8
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 10:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646F510E061;
	Mon, 29 May 2023 08:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB26910E061
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 08:02:33 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 79C1C6605961;
 Mon, 29 May 2023 09:02:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685347352;
 bh=A4ZNREQoh5/KC7x7Aai+h2epscmtPk1u6BBSzcPw1yE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dX6SHWyOxgUzPCOpqEMFwfU+oDrE2Q9SSL6ricQ3zd7lGcaD3r9IwZdbfbjLB40Ik
 Sp4UqpDoKXrblE28lnsvwltd+8w2d1o57AMCrzERi6Zr3wrjVGUhC+zN5y5Tpk1kD6
 eOpc8OW1TZ+ytBLa4U0aLa/o2vJCU+gXldjU5EoOJB8mUwz08lgUMnRqyw811AxiRX
 k4EIiiMVX3rQP1iElyi+w4xNvoFcIfxZAzWHGN+5I1x9LAg0ZCUnAp+6f3dN5rJ7BN
 X6qv/9KC+Oc3PFU/EKQzH+OcXUw0LAmu+4wh/6fRoIt/mkdD5khf6bc9v01SLa+C3B
 fLDu65wLzWeSg==
Message-ID: <f4a9e090-3712-200e-bd09-70090c9cccbc@collabora.com>
Date: Mon, 29 May 2023 10:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model
 number in DT
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Icenowy Zheng <uwu@icenowy.me>,
 Pin-yen Lin <treapking@chromium.org>
References: <20230526100801.16310-1-uwu@icenowy.me>
 <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 26/05/23 16:24, Doug Anderson ha scritto:
> Hi,
> 
> On Fri, May 26, 2023 at 3:09 AM Icenowy Zheng <uwu@icenowy.me> wrote:
>>
>> Currently a specific panel number is used in the Elm DTSI, which is
>> corresponded to a 12" panel. However, according to the official Chrome
>> OS devices document, Elm refers to Acer Chromebook R13, which, as the
>> name specifies, uses a 13.3" panel, which comes with EDID information.
>>
>> As the kernel currently prioritizes the hardcoded timing parameters
>> matched with the panel number compatible, a wrong timing will be applied
>> to the 13.3" panel on Acer Chromebook R13, which leads to blank display.
>>
>> Because the Elm DTSI is shared with Hana board, and Hana corresponds to
>> multiple devices from 11" to 14", a certain panel model number shouldn't
>> be present, and driving the panel according to its EDID information is
>> necessary.
>>
>> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> We went through a bunch of back-and-forth here but in the end in the
> ChromeOS tree we have "edp-panel" as the "compatible" here in the
> ChromeOS 5.15 tree and this makes sense.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> ...in theory one would wish for a "Fixes" tag, but I think in previous
> discussions it was decided that it was too complicated. Hardcoding the
> other compatible string has always been technically wrong, but I guess
> it worked at some point in time. The more correct way (as you're doing
> here) needs the DP AUX bus support and the generic eDP panels, both of
> which are significantly newer than the elm dts. So I guess leaving no
> "Fixes" tag is OK, or perhaps you could do the somewhat weak:
> 
> Fixes: c2d94f72140a ("arm64: dts: mediatek: mt8173-elm: Move display
> to ps8640 auxiliary bus")

I remember I didn't change the compatible to panel-edp because it didn't
work at that time, but it does now... I'm not sure what actually fixed that
and if the commit(s) was/were backported to that suggested point, so I
would leave the Fixes tag out, as that may break older kernels.

Anyway, for this commit:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
