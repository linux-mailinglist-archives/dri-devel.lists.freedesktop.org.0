Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483A4A1356E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF48D10E8FB;
	Thu, 16 Jan 2025 08:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c6ip6D20";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2779210E8FB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:34:24 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401c52000dso730824e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 00:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737016402; x=1737621202; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4GtrLs/JdAhT5E21XSIEp9RiTdRnRO6c3w6s2evGg+k=;
 b=c6ip6D20Gyb1fnEtQeE890YEUKcScQN0/zrsuFCvqPBUk/cljH8h9CNhhfsBCfrI8p
 MygJCDK/a83klIA2FB+1dfypWIXjFWIOeWq3V+Wtrqjp3CIGDJoVwkyvitr1BHtOR0Qx
 +w/CEJ+MQHnddcjQ3599+2ne6N5bigIzA4M65anGjuiXQEPC2pP3G9vDqQy2fl3KrIne
 +ZqL3cnMyUVAHuFaXTqouJotqoUHZMjEdSR3yr41NGOLMcAidj4k7kYj7S/YkSLw+hf1
 6srlDPrND1Uvnb4uInLoaM8G5+kpSdVRIbtY8/9AZ/l4tpJtRZOkUhZkLUvrF9C6iIJu
 lLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737016402; x=1737621202;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4GtrLs/JdAhT5E21XSIEp9RiTdRnRO6c3w6s2evGg+k=;
 b=levs6w/Ty3cFRfdjJKm5RYyGQz3KiDyEslBINZEpuaqWVxQY4hfWRxMVgTCqcF2+V2
 ERCX7zgCnOaTpNQYKFgNd/YnQHaLMJs00OVB2rEgfXhM8LvuT5TXayKMmzWruMNm6TQs
 Tw/tH0FIDf2NdFlItAhm8RtYi0ERuPVWyZPr9RoHCMmBg17BsZ97fO1ya/Wdo2I6o6Up
 SSKlJ26rxNOE0H9Bl/YUWXd5l6zk0K6tS5XkPuBrFaSgZtf5IdDcvmWBUToVM7JvrEPT
 5jRl6vYjM3uysB1GZ86eKhOTfc0wCMX6ddZvwULfTAKonafQLV7AGuX8nR+7ExeJriFA
 d5PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLBfZ63yn73rVN0u0Uqfc8L7dcfdSL0C8Ht5jEGhuKOYwy1J6xr1lMT9MhjzcjGpuwKuvGHu4kzpU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa8OHSEuimHxYrWZ8MPmDemZrok/tMbR+0TIsYi8b//qipEwNi
 qzY/k6GURdcKVhU4osPgJ/qbGohTJHv6Cbv2Ap9NdmkzJyZYIyhT+KQ5Ei1BH0M=
X-Gm-Gg: ASbGncuALnL7+hkDyt0/9b5O74By0rz7Wi+UO+qyeXIknFeU6FwzdKSVDATn27AR39b
 2TynrzdIsDRrgWnv3oOJdwulpSEPvwKAdXovp6FMziTWJ+wRVXfk/GjIKFgCjZbS9jlUXZoW6Y7
 cO/kEruiMBupU2LHbEDiB2NjlluVQq3U8Rx3al/P8auFIeOLzRkExYHv3Yj9Hv63qNDMhn5+K3T
 exP0B+4swf71kCSUQHTRtIBfNYuYX5U8RwAk8FgbaJOfHmmpJColCVA25bwEgPwxxGL9rRFlTlJ
 Eio3YyuoNCuY373Gk8tyXjnyvQ67qNf41W8K
X-Google-Smtp-Source: AGHT+IGQASPKaYP6KIVQm+H6BHBRdUuFKKyOqy7nvo9C44O2LFg1xVqqwUucruyjGkUQyzdP3IpPGg==
X-Received: by 2002:ac2:4c4a:0:b0:542:9636:298a with SMTP id
 2adb3069b0e04-54296362a71mr6518193e87.26.1737016402516; 
 Thu, 16 Jan 2025 00:33:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec3ee8sm2228516e87.226.2025.01.16.00.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:33:21 -0800 (PST)
Date: Thu, 16 Jan 2025 10:33:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rolf Eike Beer <eb@emlix.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] drm/sti: remove duplicate object names
Message-ID: <ypp4mmw5iezttetboilvvuglklt5sx5eyjccd426en4thfnudt@av2s6chke3hf>
References: <1920148.tdWV9SEqCh@devpool47.emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1920148.tdWV9SEqCh@devpool47.emlix.com>
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

On Wed, Jan 15, 2025 at 09:58:59AM +0100, Rolf Eike Beer wrote:
> When merging 2 drivers common object files were not deduplicated.
> 
> Fixes: dcec16efd677 ("drm/sti: Build monolithic driver")
> Cc: stable@kernel.org
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---
>  drivers/gpu/drm/sti/Makefile | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
