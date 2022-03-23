Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9ED4E501E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AD910E669;
	Wed, 23 Mar 2022 10:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C14510E669
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 10:12:49 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id c15so1134905ljr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=A8hD1/tFFB4rgwz87Q4K65j6MtDksDJ6SuyPOc0I8WI=;
 b=voGSg26fPYddMSZ76hiQWACMZW+nmFMTLjq+ORhoRrUNqN4WkRY/Dc49Ffnpf9YLF1
 ANIf+d2EPF2h1txEALTPZwxLUNhk4hHzwGHOQYh8pcZRcNL0syjVrWy+sApdrrHjdEuI
 n/lWxunH8v2mvRKBxPiQ8mh59NYqU8VBkzSN1H/F5IGc85upCYNCNoxe743UkMZLut+H
 oPkdnA3rNkvKSI8yK6iEcBNzrLLuXdB+er83dBQCTEiVUkwW8c1dlJ6OYLfhiZRSHGMh
 Gg4xqH5/7K1aM28hZP1Tuna1Epfe2eN9c4DskLza+7vz92y0o7BDApVHPUEpvxWYd5rT
 vNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A8hD1/tFFB4rgwz87Q4K65j6MtDksDJ6SuyPOc0I8WI=;
 b=pnyIFujyj+6iUOvAJV3/vOk21HBFqWkYZUbgDJM9ygHNF7CgaoQ7nDs3GBiKHpbhHC
 AcHze/pWXtjKK8c27wqJwWeua7hw9xRN4WTW0s/v/DudcHzEDg63lM+Em7zU2WWltf4q
 6ap7gFU29R7NverYT2aMgH68Z6ryj7a/yzdJNh6L4b7225UC3TeldchUvFTLbU0/Hfel
 Sb2DdX7AJy6ljQxtIXl8jYrUzOwe06Qn6YxPG6D+sIzWym1tOHrZfVT2K/+fytjwV+RM
 WaUOYYrmgD9f84KZRkDS9QREadebWCvz+yicflsHnAFX/cb9iBxq4PkUHdUFwaVLN/GD
 zgaw==
X-Gm-Message-State: AOAM5338uqVcQWotkQJRRpxWNkLaUIr7Haes2lwkVSI44NLlAb/fq+TG
 IH0rfWSFhxRe/BHHR7dVjsM28g==
X-Google-Smtp-Source: ABdhPJwpcO0qcr4Yl6r71Htzu887GjSBGMS7k4TepkH3iSwqlMC0gokbq3Qmjt5IFN01sRKjHDvhaA==
X-Received: by 2002:a05:651c:50b:b0:249:8cac:11ff with SMTP id
 o11-20020a05651c050b00b002498cac11ffmr7564050ljp.484.1648030367399; 
 Wed, 23 Mar 2022 03:12:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0044a211622aesm1302537lfe.282.2022.03.23.03.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 03:12:47 -0700 (PDT)
Message-ID: <3b874b88-837b-bf72-0888-9464396a6ab7@linaro.org>
Date: Wed, 23 Mar 2022 13:12:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 12/22] drm/msm: Use drm_mode_copy()
Content-Language: en-GB
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-13-ville.syrjala@linux.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220218100403.7028-13-ville.syrjala@linux.intel.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/02/2022 13:03, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> struct drm_display_mode embeds a list head, so overwriting
> the full struct with another one will corrupt the list
> (if the destination mode is on a list). Use drm_mode_copy()
> instead which explicitly preserves the list head of
> the destination mode.
> 
> Even if we know the destination mode is not on any list
> using drm_mode_copy() seems decent as it sets a good
> example. Bad examples of not using it might eventually
> get copied into code where preserving the list head
> actually matters.
> 
> Obviously one case not covered here is when the mode
> itself is embedded in a larger structure and the whole
> structure is copied. But if we are careful when copying
> into modes embedded in structures I think we can be a
> little more reassured that bogus list heads haven't been
> propagated in.
> 
> @is_mode_copy@
> @@
> drm_mode_copy(...)
> {
> ...
> }
> 
> @depends on !is_mode_copy@
> struct drm_display_mode *mode;
> expression E, S;
> @@
> (
> - *mode = E
> + drm_mode_copy(mode, &E)
> |
> - memcpy(mode, E, S)
> + drm_mode_copy(mode, E)
> )
> 
> @depends on !is_mode_copy@
> struct drm_display_mode mode;
> expression E;
> @@
> (
> - mode = E
> + drm_mode_copy(&mode, &E)
> |
> - memcpy(&mode, E, S)
> + drm_mode_copy(&mode, E)
> )
> 
> @@
> struct drm_display_mode *mode;
> @@
> - &*mode
> + mode
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---


-- 
With best wishes
Dmitry
