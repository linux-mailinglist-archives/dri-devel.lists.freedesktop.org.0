Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075824A8F84
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 22:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8958D10E89E;
	Thu,  3 Feb 2022 21:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9566E10E88D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 21:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643922317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTxNTC4G8tZvfkXYsUOmWJZv2fn/RPNTA7Loz+ScVGk=;
 b=XN6l54G61P8ojRC3rbCiPR2QZY54Qcb3digipnGP7bKz4JZ3dfO8o1wOHCf/l9hI2YxrAQ
 lGYOaI9fGMb5iMZu4X4CakO647eBIf2OEQRUrLy/FsBYTsEeAY+5LCknjodJw+P/BhxGbc
 Nta6c6G3YGXVsD2BJ5VmNLzQ2pb9H18=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-8VqOns1qMI6Mam361fOyqw-1; Thu, 03 Feb 2022 16:05:16 -0500
X-MC-Unique: 8VqOns1qMI6Mam361fOyqw-1
Received: by mail-qt1-f199.google.com with SMTP id
 c20-20020ac84e14000000b002d198444921so3091089qtw.23
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 13:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=wTxNTC4G8tZvfkXYsUOmWJZv2fn/RPNTA7Loz+ScVGk=;
 b=EDuS2P277H9h58/CPAZzzMuUR9/8gm+gKYPeoNHolAbTUNeug81l03E1AW/SyOAHMd
 GV69Yz/C7EIh4EkpbSliiH/xxSN6xQqhxfFQvTFUBoDmpJyP8+6U2GsBME67VOzcsPrk
 tV6InNFc648YAU43e7DQ2PAEPQOgLl6wSS8Su+uT6ixrNKufJQqD8ImjYNInM+EMtKDf
 7PZWAVCYNBwjrj4SacvAb5ivWeJxNAiP0zlDDiBuTUMGWXqcwSYnjjteMYaOCOnzEbXr
 LyeLQeMnRZcVEaCi5JoJxcPgc78PP9eodltCzK22eEiNWC48sHlcHKiFs9S4MBPzgJsA
 I0iA==
X-Gm-Message-State: AOAM532hgisE2DfGZOMbwX/WLt++ghgdzF+cclMRlgYabu3Nd1oGG2cm
 F7mLI5e3l/4oeJI31nJ2BVUHWSOXQt00Nulbw7uNI3YR/Bvmua/1x+bAA8TscGaANcxDzUBpJD9
 McWBPW/T8fYecL+FldJkcbiarEpNI
X-Received: by 2002:ac8:7c4e:: with SMTP id o14mr28037829qtv.637.1643922316308; 
 Thu, 03 Feb 2022 13:05:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeOJe9pNmMZSKwkg3H/lznOtdXYM590bhHQNaVBR0XQtUXcP8pjO6id4B62LZk89cDR0u5Tg==
X-Received: by 2002:ac8:7c4e:: with SMTP id o14mr28037790qtv.637.1643922316027; 
 Thu, 03 Feb 2022 13:05:16 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id f14sm10427270qko.117.2022.02.03.13.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 13:05:15 -0800 (PST)
Message-ID: <8ab27937391733a9027a41af17a4a8155f78d549.camel@redhat.com>
Subject: Re: [PATCH] drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
From: Lyude Paul <lyude@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, thierry.reding@gmail.com, 
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
 linus.walleij@linaro.org,  dianders@chromium.org, ardb@kernel.org,
 naresh.kamboju@linaro.org
Date: Thu, 03 Feb 2022 16:05:13 -0500
In-Reply-To: <20220203091340.20285-1-tzimmermann@suse.de>
References: <20220203091340.20285-1-tzimmermann@suse.de>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: arnd@arndb.de, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2022-02-03 at 10:13 +0100, Thomas Zimmermann wrote:
> As reported in [1], DRM_PANEL_EDP depends on DRM_DP_HELPER. Select
> the option to fix the build failure. The issue has been reported
> before, when DisplayPort helpers where hidden behind the option
> CONFIG_DRM_KMS_HELPER. [2]
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: adb9d5a2cc77 ("drm/dp: Move DisplayPort helpers into separate helper
> module")
> Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simple")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/panel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 434c2861bb40..0aec5a10b064 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -106,6 +106,7 @@ config DRM_PANEL_EDP
>         depends on PM
>         select VIDEOMODE_HELPERS
>         select DRM_DP_AUX_BUS
> +       select DRM_DP_HELPER
>         help
>           DRM panel driver for dumb eDP panels that need at most a regulator
> and
>           a GPIO to be powered up. Optionally a backlight can be attached so

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

