Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73BC38B739
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92EE6F4FC;
	Thu, 20 May 2021 19:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532096F4FC;
 Thu, 20 May 2021 19:18:51 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so8016587otg.9; 
 Thu, 20 May 2021 12:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k4cJT0t0XqH8XRsIxYqfk56ojXIbxXc2e35W87HcykQ=;
 b=qHh6R09e+J7BzRLsfIkrZMaQF90Gh7tDIXX+qeJYMxDO8auMYJ3XchSJ7PZTfNmgWB
 mzdqLCK4X8jPmwYddiEy/c17ZzX1r6f52WgqcYNpLxnre/4+n7JnLiIOGg6b342lwt/M
 RMLeDi31SjXNTCrr6jKqvsRm/x5lldWcKuzMftPWdqjw/DxJXlp2foLpm/nsqPOZEaPL
 tG0Kj7P+apd+zhYkpPBZz2ka2jU8ZlGEAWURsAH/mXDIRhDNGNMjfR4fAqeQu5dn3be+
 oz1NzWMfb2KNeLNLqypWB5HL77m5jsBd9OCSBbSEzWg2b33NwDdr/lM9Kojo91N+3WDr
 oNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k4cJT0t0XqH8XRsIxYqfk56ojXIbxXc2e35W87HcykQ=;
 b=JC5DXS/fBAILahMRfPy/fESZrFaTT5fevcJK9lyLujL/+t03jE7+WuNpDJaWHU4H1S
 afbuFZwMAzlotVg63Yfrg4MQuw6ESUJx7M3tTXfRUNSLIDyxX/8DRlZVP1LQ9+qCU2bE
 lcQa0k75H+syfh947zwUphk6NhLU4gKpEPNxT3HIXOwzwUNc0qq8AudLGWERa+lpBpRE
 84SfGinhMwPtYxPcAXidGcTkjkxD+GwS+LjRnmvGAykBRcLa028F9K18fjIYVasRQF7G
 xMwKR49EdaCm+O7hBZDQHFNsEynnsNqHfrALM022iKoK7O03ZKAbXKbpKdnt/BnrS6Gj
 OFfA==
X-Gm-Message-State: AOAM5330/2y6+JGcABvviMBORtpwGFhkLP6mtFLCG2YVPzTBuC8JGKvV
 Xw0/ddxXKKW0Eh7BQ7fQIi2BLITIefzs5vAC1zk=
X-Google-Smtp-Source: ABdhPJwbhch6P7kEoQ/7IE2/9EGX+cfUBP3J4UMXaGAyK0/P18gcZ6qVrnDYx1H+9tG35FMsygm5TBUusV0zgaq6Cpo=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr5113995oti.23.1621538330703; 
 Thu, 20 May 2021 12:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-24-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-24-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:18:39 -0400
Message-ID: <CADnq5_M0=6O3jzTZ-fwbwf4fnJM3YzyodsH0_56Kj7vSt1JZ5Q@mail.gmail.com>
Subject: Re: [PATCH 23/38] drm/amd/amdgpu/gmc_v7_0: Fix potential copy/paste
 issue
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c:526: warning: expecting prototype =
for gmc_v8_0_set_fault_enable_default(). Prototype was for gmc_v7_0_set_fau=
lt_enable_default() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/=
amdgpu/gmc_v7_0.c
> index 210ada2289ec9..8e282169f99eb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> @@ -516,7 +516,7 @@ static void gmc_v7_0_get_vm_pte(struct amdgpu_device =
*adev,
>  }
>
>  /**
> - * gmc_v8_0_set_fault_enable_default - update VM fault handling
> + * gmc_v7_0_set_fault_enable_default - update VM fault handling
>   *
>   * @adev: amdgpu_device pointer
>   * @value: true redirects VM faults to the default page
> --
> 2.31.1
>
