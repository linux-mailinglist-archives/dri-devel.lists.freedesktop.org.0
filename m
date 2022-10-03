Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C115F32BC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 17:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D3610E400;
	Mon,  3 Oct 2022 15:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3546810E400
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 15:39:26 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so15670073pjs.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date;
 bh=sBjMELHhs7ootP+M1ePzkemYasHrxvoQKWyxZ5SKdJc=;
 b=6TeHRYpKr4iA6ltAvmCjUEoPS1XHVEd06IoCPr9cBmfj4KcCCpxO4crfMKOV3j+ttD
 nSeOZOMohexUm4wDctC02d16DMakiBRtjI4eW7FpPc2+VsURaV8CZmi/Rv50Ju0O6bDZ
 mdJ6TzLmnXN/GWGyzbrtYytsMwPzUJ4T13JD1nY6dCnb/sWc4wLvd3XZoRV5ZBtrJSXZ
 NYuEIairpytFb3UeLbZhZryD3bGVjUZEKacG8YLZDJT1Z/e2blxmqYGhx6Od824QDPR1
 oAdtoO8RRJNF37qDOUwsRz2nYEHUq2YFqJ+davPWQhI4GkSOm08p1XzZO+oufH7CzHlN
 JmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
 bh=sBjMELHhs7ootP+M1ePzkemYasHrxvoQKWyxZ5SKdJc=;
 b=dbwT6CQGyOqCmpr1IyLT0lgCpL8ANCsh86VWVitWxWZCIDmgUQwwQq1X5Qhd/80bL2
 Hgx5oR7u40CvkoeRuJARaZdR1aQd2QCFOpGY7BGW8YPqYGSovCM9f0TN2cU6iPaFMGwc
 O8/C/A/oGgEy9n2LAK1nrljbqgDeJ5nJe60d3vm9YQFmeEV7VJYYVkwSmtyO+mh0z1F6
 0lQ/RUrC0uVFtPYD9jdIhHPSsD8FF8M14/2rTtZDMI/AsaV9dBFeotbwNExU1B6EbdGs
 ZJCy1rbQFUM6mO3eDIQD/ywZXaeZgvZGT+ZLbX5hWI2MOGE/3RYdJxH3kWiLGyikydUK
 GE8w==
X-Gm-Message-State: ACrzQf0Q+cjuZMgJi3oBjyCmixbYSkD0nL0jFq0N0/OqlI6SXwQb+2M+
 gKOGO4RzUABD1zTf3Jz4213LQ4SLbqSiPWSlY+0F9A==
X-Google-Smtp-Source: AMsMyM67n5/JfkI+ezU4sEpOAQkHL4Lr8SNXTP6tBMjqPf4oPEqHcs7Y4we6Zo0o6qrkQaDBeTf58h4qBuFfOWQ+eNE=
X-Received: by 2002:a17:90b:2643:b0:205:bd0d:bdff with SMTP id
 pa3-20020a17090b264300b00205bd0dbdffmr12433645pjb.99.1664811565787; Mon, 03
 Oct 2022 08:39:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 Oct 2022 17:39:25 +0200
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-9-4844816c9808@baylibre.com>
 <5920ba96-886c-1195-656a-a98d7b1f6623@collabora.com>
In-Reply-To: <5920ba96-886c-1195-656a-a98d7b1f6623@collabora.com>
MIME-Version: 1.0
Date: Mon, 3 Oct 2022 17:39:25 +0200
Message-ID: <CABnWg9vdYYgxPxMY=qm=JSd4ZV4hHB7g8M4he3GzUj6-rzmfQw@mail.gmail.com>
Subject: Re: [PATCH v1 09/17] drm/mediatek: hdmi: add connector flag
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Sep 2022 12:38, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>> Add a flag to indicate support for an external connector
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> index 86653ebaacfd..30407603d693 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> @@ -199,20 +199,22 @@ int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
>>   		goto put_device;
>>   	}
>>
>> -	remote = of_graph_get_remote_node(np, 1, 0);
>> -	if (!remote) {
>> -		ret = -EINVAL;
>> -		goto put_device;
>> -	}
>> -
>> -	if (!of_device_is_compatible(remote, "hdmi-connector")) {
>> -		hdmi->next_bridge = of_drm_find_bridge(remote);
>> -		if (!hdmi->next_bridge) {
>> -			dev_err(dev, "Waiting for external bridge\n");
>> -			of_node_put(remote);
>> -			ret = -EPROBE_DEFER;
>> +	if (hdmi->conf->has_connector) {
>
>If MT8195's DPI uses the internal HDMI->DP converter, I say that the external
>DP has HDMI input and DP output.
>Logically, you can't have a HDMI port that's connected to nothing.
>
>Please, rethink this change.
>
>Regards,
>Angelo

Hi Angelo,
Sorry for the late answer.

I have reworked this for V2, to use an hdmi connector device node to "bind"
both the hdmi and hdmi-ddc driver together as with "legacy" code.
So this patch is dropped in V2 (hopefully ready soon).

Just to make things clear, the hardware path on mt8195 is:
DPI1 -> HDMI Tx -> HDMI Phy
DP Intf1 -> DP Tx -> USB Type C Mux -> DP over USB-C

So there's no HDMI->DP converter involved.

Thx,
Guillaume.
