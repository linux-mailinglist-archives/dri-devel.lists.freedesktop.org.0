Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97828CF0C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 15:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789296E8E5;
	Tue, 13 Oct 2020 13:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2171D6E8E5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 13:19:26 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j136so21740016wmj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8B+0WtYgA7UeCgdHhqNVOekRpYFEf1vC2587zk4d0MY=;
 b=QhM8Yr0/b9eLK5UJ81fkSr6KAy4hIe4AyujsbxECrW/9PeIenMIlOTh8nc5Uep6G6I
 E3x+Ql1+ZC1Id4hrgbehvsp3X7oYj+A50ES2iRD0rXpT0z1FGnEFAmHlUBcmLwx7MADt
 a101pFNdTjs0rYm7u06xVPJUD53huilrrJgQ2GoR06trQfvJ/cpcY3cZ1u/VWXDWpHcf
 ZLbomTb6xPigrsuCE9sTTYI17skaj3wAAduFVc/MsejnbM5QCahGHao0NkzC/sDVPMcp
 nFMMQxh95HTL/9gXvB4Ya3nIUvFFTt25AAjKX+3fmTGkxdOVeZooHzElp3upWmOavb2z
 Pf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8B+0WtYgA7UeCgdHhqNVOekRpYFEf1vC2587zk4d0MY=;
 b=BOKN8Rt2Aa9YIkm0auM01PN1X17DxzIDJ1mfMhI8KwmKwWxPGBm6SqOt0QXT5E6AF+
 nLzNu/wBipmwXHOzY1PZA8B0RaV2fdOaUce6ZTV1f/SIaJhDvh+Zt8oxRKnPZfca4oY4
 Gk+ORwYWovybz4eDRrPzWOlJW9k27Maf6uMAyhHEF9FyC7Nz54aAKhX7poVeAhaAb2vl
 LPOeCiaRzusw2NuaUE2lDyYKZ0TnhO+aWe6lqlTdDfGmHYvQAdmsuUaRmdRAZ0+iSblq
 zRhPe2BkCb7uIvyQbkToAKjJBbQQJmhtjimwnXEmyKANeJl8V4I+44B1i3kBjyuFNuoG
 2QNQ==
X-Gm-Message-State: AOAM5318Hg4X2dJ/NlDZF8PH5NMJn6QUePf2/PLVzjhBraTc7uWiVfRh
 fzxwAI/c3uQrTIXR2iBHjOo5/0JrDtWFFrdPra0=
X-Google-Smtp-Source: ABdhPJxxSyht6Y7/wEQ5OVHDCml+oVdMZYIvBSFPYZ52jZrh7e8w8C8sY6IoaVu8tniA4jmPFgzc40uxHg3h7Wenwn8=
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr15334045wma.70.1602595164758; 
 Tue, 13 Oct 2020 06:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
 <6e511c1938e4b5e312474ea50bdde964770c1e44.1602589096.git.mchehab+huawei@kernel.org>
In-Reply-To: <6e511c1938e4b5e312474ea50bdde964770c1e44.1602589096.git.mchehab+huawei@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Oct 2020 09:19:13 -0400
Message-ID: <CADnq5_ND_6uRzxkeXZBo-QpGvB+azZMxPB=6vhF6xGvkOptZaw@mail.gmail.com>
Subject: Re: [PATCH v6 65/80] docs: amdgpu: fix a warning when building the
 documentation
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Oct 13, 2020 at 7:54 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> As reported by Sphinx:
>
>         Documentation/gpu/amdgpu.rst:200: WARNING: Inline emphasis start-string without end-string.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/gpu/amdgpu.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst
> index 17112352f605..4ed8ecf1cd86 100644
> --- a/Documentation/gpu/amdgpu.rst
> +++ b/Documentation/gpu/amdgpu.rst
> @@ -197,8 +197,8 @@ pp_power_profile_mode
>  .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>     :doc: pp_power_profile_mode
>
> -*_busy_percent
> -~~~~~~~~~~~~~~
> +\*_busy_percent
> +~~~~~~~~~~~~~~~
>
>  .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>     :doc: gpu_busy_percent
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
