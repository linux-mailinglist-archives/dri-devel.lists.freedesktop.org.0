Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21253390E44
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 04:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5B56EB66;
	Wed, 26 May 2021 02:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8AD6E471;
 Wed, 26 May 2021 02:23:30 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id y76so82755oia.6;
 Tue, 25 May 2021 19:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D7TryFyV+eLaRQPE4j490XHNdMtGWKF1gYzaD13cJNU=;
 b=TVE1+KH60aAJDxWS1E4vLRcQK+0VEUSKdAPjIHcWaG1OwdjbalLO/lcZyWqgGTZxaK
 lD4+Fy2qu4K6DA2mDEHKyrFxqtltV7RXrZ+FUa1OpE0PN7XZZYWsr3QTb/KiTjVtodlK
 Kf7e1oTT/xgYCegrwUyxl4uQiGwfwfzO61L1ukuMfUqbCh9BpDq/31mOZdDmpVgRpYCp
 4lzVuki8Qh9BsP0qC2WUGBDbWtFQlTZi/Cxi9Mn1xfLcm993vNQN9xeckCci9saFBJOO
 K0ZC26+D3CvMCe07KDpwZm+13pTK457D5/lYfMDTGEjAhgvqVbEC7r4JC3475oVb7dPp
 du/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D7TryFyV+eLaRQPE4j490XHNdMtGWKF1gYzaD13cJNU=;
 b=iGjHO5Z+k27XtV6g1mbZfIuQZmmXiiI9k6Z4V4m5+38SCkymyeTEmtzmWJjC9MxYOn
 vd9DqPBO6xCd7328Q5YttQvvEDv5l1FEfj0UaPzmAklPH2M++ao2QngeDDtkgG2pqF83
 jBqGcxufm2MCdq9w7WBwlMoLhkzEWlVYA8BwGgLE02CSAC+qbz7vtwnw71dB7m15L2Ok
 3vxAuKmeczUr15uVB9CC0Qp7bPTRakZ+7NBaK1IWGh10KAJByU14/AS4XGSoP3wcX7TM
 9mYTtl7CnNFd6TgbbAX+Wbx7ZS9AhUA8vt78Tzy3v8qlJY/7AaHjnW8a5zoDE26aDybF
 LxGg==
X-Gm-Message-State: AOAM532K8N+Hh5JLkrv5YO4984Os4O1DJAL7XLY+3lI05vAi7UoHPmzN
 WGvOKkXRMDAvTQwiSSa8oQD982+jd2ne0cAI0Cs=
X-Google-Smtp-Source: ABdhPJzHUs+eGFzokNVHbrK6uFO0bv09up0cTV0ACBYAUAhnEAEJiApcU5dA04B7Xrnf10loHK9VJiigxj95QyKzXQI=
X-Received: by 2002:a05:6808:249:: with SMTP id
 m9mr402763oie.120.1621995810261; 
 Tue, 25 May 2021 19:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <1621945944-52797-1-git-send-email-zhangshaokun@hisilicon.com>
In-Reply-To: <1621945944-52797-1-git-send-email-zhangshaokun@hisilicon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 May 2021 22:23:19 -0400
Message-ID: <CADnq5_Ow8P-znest+-DHwejP_xyChYNTTwjsaEssVbS=pJeL4w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/evergreen: Remove the repeated declaration
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 8:33 AM Shaokun Zhang
<zhangshaokun@hisilicon.com> wrote:
>
> Function 'evergreen_print_gpu_status_regs' is declared twice, remove
> the repeated declaration.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/evergreen.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/evergreen.h b/drivers/gpu/drm/radeon/=
evergreen.h
> index 4025a4e474d1..b07befe14458 100644
> --- a/drivers/gpu/drm/radeon/evergreen.h
> +++ b/drivers/gpu/drm/radeon/evergreen.h
> @@ -45,7 +45,6 @@ void sumo_rlc_fini(struct radeon_device *rdev);
>  int sumo_rlc_init(struct radeon_device *rdev);
>  void evergreen_gpu_pci_config_reset(struct radeon_device *rdev);
>  u32 evergreen_get_number_of_dram_channels(struct radeon_device *rdev);
> -void evergreen_print_gpu_status_regs(struct radeon_device *rdev);
>  u32 evergreen_gpu_check_soft_reset(struct radeon_device *rdev);
>  int evergreen_rlc_resume(struct radeon_device *rdev);
>  struct evergreen_power_info *evergreen_get_pi(struct radeon_device *rdev=
);
> --
> 2.7.4
>
