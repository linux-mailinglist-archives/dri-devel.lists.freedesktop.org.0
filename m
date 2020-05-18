Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A111D8B2B
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 00:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2775B6E109;
	Mon, 18 May 2020 22:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756F36E109
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 22:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589841836;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPJtTaxx/J3TNGtNDl0JEepte/rdyFM9JlRng7crbx4=;
 b=SNslIcBCZk5JMvO6NNvwcL20MboUhHy4iYQQRKhGOLMdTDp3v6g9m8dvjDWCBHHzfD4KeF
 BGQhPZCsGY/I0CxDsZwV6Pr1OKTbcbobm6x1+NPl+0h12PfQnPA+7GlfpzuXM6FrUYIMj8
 yBIaxeOTZDMpZdoFEgF77mNcU52pDso=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-M3yGM9ogMamZTUv9lLm32w-1; Mon, 18 May 2020 18:43:55 -0400
X-MC-Unique: M3yGM9ogMamZTUv9lLm32w-1
Received: by mail-qk1-f198.google.com with SMTP id j83so10200363qke.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 15:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=fPJtTaxx/J3TNGtNDl0JEepte/rdyFM9JlRng7crbx4=;
 b=d+m7NpQnbwiqblbwloXZ9Eglq/7zHQ0djFVeAUo9vMraBCaMlb2auKsx8MFPzLMBBR
 oDdp2PzSjuL/Q8NIiM5xisMg5paCCSqK/ogvCS39AiKhy3wgPaAaM1NBX7GPvbfBMsHI
 UJKtzPCtizFvXzKGTsTbV+Aem1vURIgTDzW3UemXYT25g33RHRxsUDV5mnUv3/P6cM+I
 dy+TxsD+tfqDRc4bW6r4HHy+Fw2OUrZRGZL3bqRud+baeSIv7yors+S3GMG36NTc5tH2
 XoMBC3tTMWLzXkLASJI1r/JQLNCTvSxrqF8smrvaymc6PXlVE39K7dAMP2QD9zllmxbv
 OjKg==
X-Gm-Message-State: AOAM531gaXbWCNVwaE9q3C3Ytt3NH18/p9nTLEFGwmbVR/nIlWxsHjtY
 sbh44r0Xe/y0leUrb+tg2tlrSX/EtMtEO6TReRIkaS7xwb95FmUxaJnN/6F0rlC4E2zOWQh50PH
 RRB1ok8SSpklqWpwqdteGywacbvzk
X-Received: by 2002:a0c:eb49:: with SMTP id c9mr18727260qvq.123.1589841834548; 
 Mon, 18 May 2020 15:43:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBoZ/T3Cm040vrb4KlmqUVzFLG5UiARWXcuA8Tambx0yscTdBHZmOgxeeMcIeK3FusURtvNw==
X-Received: by 2002:a0c:eb49:: with SMTP id c9mr18727246qvq.123.1589841834295; 
 Mon, 18 May 2020 15:43:54 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id r128sm9375316qke.109.2020.05.18.15.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 15:43:53 -0700 (PDT)
Message-ID: <720829f7946b42fb50ca071b0321cf89650affa7.camel@redhat.com>
Subject: Re: [PATCH] Lenovo X13 Yoga OLED panel brightness fix
From: Lyude Paul <lyude@redhat.com>
To: Mark Pearson <mpearson@lenovo.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Mon, 18 May 2020 18:43:52 -0400
In-Reply-To: <SG2PR03MB3324FE6FB77A226167E9BC31BDB80@SG2PR03MB3324.apcprd03.prod.outlook.com>
References: <SG2PR03MB3324FE6FB77A226167E9BC31BDB80@SG2PR03MB3324.apcprd03.prod.outlook.com>
Organization: Red Hat
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yeah, git send-email is kinda :(, but unfortunately the entire kernel uses this
workflow. Hopefully freedesktop's gitlab efforts will change this someday...

also - in the future, if you don't want comments to appear in the patch when
they're applied put them below the ---, e.g. the one before the Reviewed-by:
tag.

Anyway-I'll go ahead and push this, thanks for keeping this list up to date!

On Mon, 2020-05-18 at 00:06 +0000, Mark Pearson wrote:
> Hi,
> 
> Patch to fix an issue controlling the brightness of the OLED panel on the
> Lenovo X13 Yoga 
> Please let me know any feedback or questions.
> Note - apologies if this message has shown up before - I had some mail client
> issues.
> 
> Mark Pearson
> ---------------------------------
> 
> Add another panel that needs the edid quirk to the list so that brightness 
> control works correctly. Fixes issue seen on Lenovo X13 Yoga with OLED panel
> 
> Co-developed-by: jendrina@lenovo.com
> Signed-off-by: jendrina@lenovo.com
> Signed-off-by: Mark Pearson <mpearson@lenovo.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
> drivers/gpu/drm/drm_dp_helper.c | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index c6fbe6e6bc9d..41f0e797ce8c 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1313,6 +1313,7 @@ static const struct edid_quirk edid_quirk_list[] = {
>                { MFG(0x06, 0xaf), PROD_ID(0xeb, 0x41),
> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>                { MFG(0x4d, 0x10), PROD_ID(0xc7, 0x14),
> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>                { MFG(0x4d, 0x10), PROD_ID(0xe6, 0x14),
> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> +             { MFG(0x4c, 0x83), PROD_ID(0x47, 0x41),
> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> };
> 
>  #undef MFG

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
