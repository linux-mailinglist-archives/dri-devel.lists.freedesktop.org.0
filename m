Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26024FD321
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DE710FF9C;
	Tue, 12 Apr 2022 08:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E6C10FF99
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:57:55 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 12so18336720oix.12
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 01:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=4FpzyyLj/OdDU3ZmpUpstG+y8CAFSWZd/AR4b2PM65Y=;
 b=O4uumP51JcV7qBCLnK0EA1pkMY6sGD/pTvzvNjou2PgcdwHOFuibGIptBgZ3zJNPCO
 HNcpOraxajhSfH6FKpX+oohFsR9+cAmNzr3raUAIRjIXsDz70WJRGRPe0sBzCtIorZSn
 jwU9hlWq8nhRQgCL+0BDauOseU08SQ6kHBE39slH9gyCacBPIRunwbgJFwT4MEAkgB4u
 XOLgBEcCs1r6ODorwmX7IF0ZhAGaeOSeAxRCXAcIUN8mXCyKnW+FU3R/7MlScEWkf0VY
 ZvjB33mZDqS56xB5bdfVu9Bjy/qdU0l0vvxbk6G4z6AorUZE6E2dkUcfig1wxL70aOEU
 PS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=4FpzyyLj/OdDU3ZmpUpstG+y8CAFSWZd/AR4b2PM65Y=;
 b=KQxt/PXsTaupo/EFTY5l4+fjgbFJeMs2bW6a+/EWYh4JkJFta/2oRpeweQkuc8VW3o
 EEuQMGNCCxXFT0TtcLd3APBov+QOVEkrxegD3Z4COnuqq1mm12GR6J0D65acQmZBdqML
 ig7T3snU7omwx7T5uGGcGcv7iQUj+T5IRDziaoauBBKe8CLSyEvY+NCU6Pzof96IAHTb
 zMbwl+2akS8hSVoUgXdkVLS76LvV+ozGh7skhcD8Zpu7Mp8UEVxAmz4Gymb1gwdX+QZm
 F7tnl73cZjedbf9kJb2mx7VlUf1YFYMvM+6xl1mD5lqf2QqD45OdA+n5vo61wVsDuZdW
 aTEg==
X-Gm-Message-State: AOAM533my7SXhXNzmpu9CVgwcMhjwsw1kfyornVSmIil1+5VhBxPWQdw
 wfjANp2bg6Nd1xaEgiiKJs3q7P+++Gn5f7MO1rsK7w==
X-Google-Smtp-Source: ABdhPJyGsXSnBb0OrYJzuxK+lplYEUvtBMZUA3XN/6JoCjC1Dfht5xOEuqQ6v8izMrWtfTdYVEwhffLY26AWeFbXjVU=
X-Received: by 2002:a05:6808:159d:b0:2da:3946:ab3d with SMTP id
 t29-20020a056808159d00b002da3946ab3dmr1258843oiw.248.1649753874382; Tue, 12
 Apr 2022 01:57:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 01:57:53 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-5-granquet@baylibre.com>
 <0c523ad5-6a71-5c71-17b8-1f15c1860d89@collabora.com>
In-Reply-To: <0c523ad5-6a71-5c71-17b8-1f15c1860d89@collabora.com>
MIME-Version: 1.0
Date: Tue, 12 Apr 2022 01:57:53 -0700
Message-ID: <CABnWg9vxnLqAsoLOSHekwa9q3v=atLJEXpXADMc-bj+z1mkQHA@mail.gmail.com>
Subject: Re: [PATCH v9 04/22] drm/edid: Convert cea_sad helper struct to
 kernelDoc
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 vkoul@kernel.org, 
 airlied@linux.ie, chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, 
 ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, 
 kishon@ti.com, krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de, 
 robh+dt@kernel.org, tzimmermann@suse.de
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022 10:04, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>   include/drm/drm_edid.h | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 144c495b99c4..5d4d840b9904 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -359,12 +359,17 @@ struct edid {
>>
>>   #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
>>
>> -/* Short Audio Descriptor */
>
>Hello Guillaume,
>
>> +/* struct cea_sad - Short Audio Descriptor.
>> +	@format: See HDMI_AUDIO_CODING_TYPE_*.
>> +	@channels: max number of channels - 1.
>> +	@freq: See CEA_SAD_FREQ_*.
>> +	@byte2: meaning depends on format.
>> +*/
>
>I appreciate the effort, but this is not valid kerneldoc.
>
>Please refer to https://docs.kernel.org/doc-guide/kernel-doc.html
>
>Regards,
>Angelo

Hello Angelo,

Thx for your review.
I'm sorry I posted this v9 in a bit of a rush...
but I promise we will get there... eventually :D

Thx,
Guillaume.
