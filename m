Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17DA264219
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C90A6E8C7;
	Thu, 10 Sep 2020 09:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88FB6E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:32:49 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t10so5942818wrv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BY50J/xImP9jC8qppHKYYW5+18xB3DL4bUmc2v20QLs=;
 b=OWTCDiFM80BwvcXoW36uXacwLGsaAbwjDWxpayNtRDzntrxwceUgDJSIGy66eh4IR5
 feOyQgXSpX5vLQ4F5ceynCDeOdgziu0PD+NZX83kDAoN77chSecGtz+O2Z/SP7MBzUGu
 ++JPz2CBCrq1Wo/97Vz/WEbw4A1MvThRgfW76tGGAqnnXxQiY/3Jp7YMSENAR6yyIa8X
 f5wH/71i0jTwnla3dqjAE4IY7ikEK6Q2HDtIWjmfE2KSH63ylhH+4x2/mi/tYUauPPVo
 N5H0l177IBEfxDpdz6TqQSFWWBtuoGoEaLifMqdcjIwSS/yDh4lDqm1tanbiYLSFqsFT
 RN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BY50J/xImP9jC8qppHKYYW5+18xB3DL4bUmc2v20QLs=;
 b=JtulCOH83CKx9S69m+YcV1qjeZ8s7fj7l75LIplVa6Kv5qSjPQz7yHgWnLb5w0/1Mw
 nd9/wBpgGHE2G1e/DmDwl+zENRW6floZsyYsKCMovU6aD5Z+q88AtKiD4d38+mC7F3vQ
 QlL9OYIL98Z4Iwgd15cXbeWKPXqWnLpbMn4/ijzJC7sj1wIunmCuH+vNwfVpDTl0HKz6
 W9XxaUwYTnMJlg3HRfRm/f8ltLF1SGM7BsDcU6cnC9h4qyUiiv0ZyJJTApmK8slcdQA1
 Cm5oAD7qN/VwmzcgjGB+SDP437HqjsepJUQnokGtMBJhqsrVEnfoDqyI17yJxA61DM5S
 aEJA==
X-Gm-Message-State: AOAM533NIVxqEtihOlvG4FUfFInz/EPiBvz3T2fApjkBAXtsExhedJIz
 xoXrJAZBsIb0dMJ3mJOzENDO7g==
X-Google-Smtp-Source: ABdhPJxBjYw6y+d5EpeVKzQPPJKFcKv+zUG7ZAJeovGKi80/WiBu8YjJsdgPG1Us270LoqPXnpIT+w==
X-Received: by 2002:a5d:6a42:: with SMTP id t2mr7601140wrw.425.1599730368276; 
 Thu, 10 Sep 2020 02:32:48 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac?
 ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id y1sm8555107wru.87.2020.09.10.02.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 02:32:47 -0700 (PDT)
Subject: Re: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 dri-devel@lists.freedesktop.org, bob.j.paauwe@intel.com,
 edmund.j.dea@intel.com
References: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
 <1598904172-30865-3-git-send-email-anitha.chrisanthus@intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <a1e50102-f400-c45c-9111-5b8afdba614c@baylibre.com>
Date: Thu, 10 Sep 2020 11:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598904172-30865-3-git-send-email-anitha.chrisanthus@intel.com>
Content-Language: en-US
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
Cc: daniel.vetter@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/08/2020 22:02, Anitha Chrisanthus wrote:
> This is a basic KMS atomic modesetting display driver for KeemBay family of
> SOCs. Driver has no 2D or 3D graphics.It calls into the ADV bridge
> driver at the connector level.
> 
> Single CRTC with LCD controller->mipi DSI-> ADV bridge
> 
> Only 1080p resolution and single plane is supported at this time.
> 
> v2: moved extern to .h, removed license text
>     use drm_dev_init, upclassed dev_private, removed HAVE_IRQ.(Sam)
> 
> v3: Squashed all 59 commits to one
> 
> v4: review changes from Sam Ravnborg
> 	renamed dev_p to kmb
> 	moved clocks under kmb_clock, consolidated clk initializations
> 	use drmm functions
> 	use DRM_GEM_CMA_DRIVER_OPS_VMAP
> 
> v5: corrected spellings
> v6: corrected checkpatch warnings
> v7: review changes Sam Ravnborg and Thomas Zimmerman
> 	removed kmb_crtc.h kmb_crtc_cleanup (Thomas)
> 	renamed mode_set, kmb_load, inlined unload (Thomas)
> 	moved remaining logging to drm_*(Thomas)
> 	re-orged driver initialization (Thomas)
> 	moved plane_status to drm_private (Sam)
> 	removed unnecessary logs and defines and ifdef codes (Sam)
> 	call helper_check in plane_atomic_check (Sam)
> 	renamed set to get for bpp and format functions(Sam)
> 	use drm helper functions for reset, duplicate/destroy state instead
> 	of kmb functions (Sam)
> 	removed kmb_priv from kmb_plane and removed kmb_plane_state (Sam)
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
> ---
>  drivers/gpu/drm/kmb/kmb_crtc.c  | 224 +++++++++++++
>  drivers/gpu/drm/kmb/kmb_drv.c   | 676 ++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/kmb/kmb_drv.h   | 170 ++++++++++
>  drivers/gpu/drm/kmb/kmb_plane.c | 480 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/kmb/kmb_plane.h | 110 +++++++
>  5 files changed, 1660 insertions(+)
>  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
>  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
> 

[...]

> +
> +static const struct of_device_id kmb_of_match[] = {
> +	{.compatible = "intel,kmb_display"},
> +	{},
> +};

As I already commented on v1, a proper YAML bindings files
is mandatory here, to check if the bindings are correct and if
the drivers uses them correctly (port/endpoints, etc..)

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
