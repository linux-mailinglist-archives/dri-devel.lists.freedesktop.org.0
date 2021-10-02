Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4C41FA90
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 11:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194F76E85A;
	Sat,  2 Oct 2021 09:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E5B6E835
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633166060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJ9RXJTGIQ7TnplzhbGhNK6unhn11194McWtsI39dY4=;
 b=VcVtSCtO/4xlbQeqCAeGEAOVwJD/wlSzMZ+wTr9r96Zz4NZ/qSbGHtpjuV5blUUbJ2S9vc
 O7YPoXCVLUX5CYO7aqBDqyV6mDl5xnQfiFSuaVtGlmjzT/0F5OpEE4lk+66ltafd0oFOAv
 9GPCvJTKF7dZ1puo+DZVOSl/dWwLiSo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-umEysV1CPxuFddF7LgubnA-1; Sat, 02 Oct 2021 05:14:18 -0400
X-MC-Unique: umEysV1CPxuFddF7LgubnA-1
Received: by mail-ed1-f71.google.com with SMTP id
 a7-20020a509e87000000b003da71d1b065so12656538edf.4
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 02:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VJ9RXJTGIQ7TnplzhbGhNK6unhn11194McWtsI39dY4=;
 b=v1bBrMCS+R7H0CE9aG2D9uSsoOf7GjMaIjrMIA3kWclztDdgbX53irGylIS6eIk7Bh
 rYExkuMjjQeDmQqMRASdzCC/rVCwNzaeYYnwo9yECYUPh+K7Pdg7XiB9hPVm3rhdEAtK
 67SZ4Jrt3jhKTbmrJZrO0udSkvCg5QCIZ5mvKiLAz3wDsLGDj3WmiAWcF2C+MQc5Vf/u
 CXw/oVdaEb5JckIQP0DVgT2dTicaJK3aAoFIFqgoJxHbg5MOHIi2zCKWtxTeG3Suvzqw
 5mxVVdS50IwWLL4xKulSIaOcqv0R4blCbr4zP0MTyntbinGEnIzyx30tN9SSaLztDx7A
 iUFg==
X-Gm-Message-State: AOAM5326QAN/B9UBb3TZK9Mt0fxsOeZW6a0n/566+JOo7mYnqIyGiZYZ
 04uKS+lT8k3Qvpnfrv/Tl8kM/fhgtDMnK+jDPSTk30X7spwumGwSwgmhLAlmg33Azg7iNj93GwJ
 CSsOiroSTaK3JusGm3N2txUHa0qfQ
X-Received: by 2002:a17:906:2bd0:: with SMTP id
 n16mr3186251ejg.132.1633166057434; 
 Sat, 02 Oct 2021 02:14:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1WcknLHya1hGXb5KcKJOBaUIP1K0/AwOnuQKYVTxuWskWhkeiWUzh9k/0uLVoupeZjj/I0g==
X-Received: by 2002:a17:906:2bd0:: with SMTP id
 n16mr3186232ejg.132.1633166057182; 
 Sat, 02 Oct 2021 02:14:17 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id l23sm3882559ejn.15.2021.10.02.02.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 02:14:16 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH v2 0/4] drm/dp, drm/i915: Finish basic PWM
 support for VESA backlight helpers
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20211001225344.1752203-1-lyude@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a6ea3fa3-fbbd-f5e8-54ab-3929ed9f7294@redhat.com>
Date: Sat, 2 Oct 2021 11:14:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211001225344.1752203-1-lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude,

On 10/2/21 12:53 AM, Lyude Paul wrote:
> When I originally moved all of the VESA backlight code in i915 into DRM
> helpers, one of the things I didn't have the hardware or time for
> testing was machines that used a combination of PWM and DPCD in order to
> control their backlights. This has since then caused some breakages and
> resulted in us disabling DPCD backlight support on such machines. This
> works fine, unless you have a machine that actually needs this
> functionality for backlight controls to work at all. Additionally, we
> will need to support PWM for when we start adding support for VESA's
> product (as in the product of multiplication) control mode for better
> brightness ranges.
> 
> So - let's finally finish up implementing basic support for these types
> of backlights to solve these problems in our DP helpers, along with
> implementing support for this in i915. And since digging into this issue
> solved the last questions we really had about probing backlights in i915
> for the most part, let's update some of the comments around that as
> well!

Backlight control is a topic which I'm reasonably familiar with,
do you want me to review this series for you ?

Regards,

Hans



> 
> Changes:
> * Fixup docs
> * Add patch to stop us from breaking nouveau
> 
> Lyude Paul (4):
>   drm/i915: Add support for panels with VESA backlights with PWM
>     enable/disable
>   drm/nouveau/kms/nv50-: Explicitly check DPCD backlights for aux
>     enable/brightness
>   drm/dp, drm/i915: Add support for VESA backlights using PWM for
>     brightness control
>   drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs()
> 
>  drivers/gpu/drm/drm_dp_helper.c               | 75 +++++++++++------
>  .../drm/i915/display/intel_dp_aux_backlight.c | 80 ++++++++++++++-----
>  drivers/gpu/drm/nouveau/nouveau_backlight.c   |  5 +-
>  include/drm/drm_dp_helper.h                   |  7 +-
>  4 files changed, 122 insertions(+), 45 deletions(-)
> 

