Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3C25100DF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 16:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BA510E3EA;
	Tue, 26 Apr 2022 14:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C43310E3B6;
 Tue, 26 Apr 2022 14:48:09 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e68392d626so14516062fac.4; 
 Tue, 26 Apr 2022 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DpnqB2AGxqyw3CoghEbJ2vm3YwFMuogHkt07765d/4Y=;
 b=h909C1DU4Y9hMLFITeZRFzhAHAaMyz19mocTiohQwpgkCha4ONej9EKuUPpjNZB+yo
 vu1EfhlAWA8mbuJTvlOdv3/80apueEWsh9Ub8i0+PKlnnRQEKJMqQE2ic1Hd3bZad047
 jri7ooT5HWOq1GlgFbyWHpX09AxYt5Wf5NtwB8uUZrH/VjcTyClTrWr7I6AtfaqGZrA8
 W2XP/6XZoMBke5EGQ4TGnV7x9AxEyrn4nfaMiBITpL+usINt+BxyHtAZJM2Zvl1lHIlA
 zLWDpjL6NwRBgB1MPOXXFodoJKzqea0k+A7d3Tbp13h6ZCPXh/hwNPke5X+4pjGJ82+k
 Ctmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DpnqB2AGxqyw3CoghEbJ2vm3YwFMuogHkt07765d/4Y=;
 b=HdzC8g9+NlfAC51TYeayHizv0AENZHqlZahJ7+BahcbVhUw5ijEKhC6Uc08LDlh3gM
 1SWu0Xr8rm6BcWUrRN/QiDKqGX4Sn/k0fHcMAkhAROY+a+ju2Wq1g8J30lv7KS5eiLQr
 vdBOog2EfoIFd3F2LqYSoJOW42cNq17JouEFTBqjMNslwFJq5kPSMAXGfNN/xWdXLtnN
 O9REUZTOlxmyoYcUQdapgxIyp0n9/HJ6LdFscfGbnFZ5JOsbIDxKLSYMQAZ0tqS+ZZaD
 JUr+RuzZH0oFWZG33gYY5HsqJCCSqH415YOVvHI0fOP7/ZYwx+hTn6e9AQcxoMuBv/ap
 0Wdg==
X-Gm-Message-State: AOAM533BrrAaA2xN1ypyoZFhlpanAGOR7jh2wb+4ZlxrCesVZWStFQTM
 /byTCXvILByaGYOJDRlQA3uvPRB6l2BYUNoonyQ=
X-Google-Smtp-Source: ABdhPJxFZ1eTsOp1jW5ozMJ2r23INM9MidyGZO+m3ftYvOYdGMzSgXchHTKbRpG06n7GC5DcvbYoEu8DHzJ624Cw3u0=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr12934047oaa.200.1650984488340; Tue, 26
 Apr 2022 07:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <Ymexw96moFElQvqG@kili> <YmeyEF4djrguNMEF@kili>
In-Reply-To: <YmeyEF4djrguNMEF@kili>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Apr 2022 10:47:57 -0400
Message-ID: <CADnq5_PmoHWzJ9Mh=-ghMzOexv20h-Du2hGsoaR0owdDBnc8iw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: debugfs: fix NULL dereference in
 ta_if_invoke_debugfs_write()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: Tao Zhou <tao.zhou1@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Candice Li <candice.li@amd.com>,
 John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Tue, Apr 26, 2022 at 4:49 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If the kzalloc() fails then this code will crash.  Return -ENOMEM instead.
>
> Fixes: e50d9ba0d2cd ("drm/amdgpu: Add debugfs TA load/unload/invoke support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This would look nicer as:
>
>         shared_buf = memdup_user(&buf[copy_pos], shared_buf_len);
>         if (IS_ERR(shared_buf))
>                 return PTR_ERR(shared_buf);
>
> Probably eventually this will be sent as an automated Coccinelle patch?
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
> index 32bcc20b9e3f..6806deb098d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
> @@ -254,7 +254,7 @@ static ssize_t ta_if_invoke_debugfs_write(struct file *fp, const char *buf, size
>
>         shared_buf = kzalloc(shared_buf_len, GFP_KERNEL);
>         if (!shared_buf)
> -               ret = -ENOMEM;
> +               return -ENOMEM;
>         if (copy_from_user((void *)shared_buf, &buf[copy_pos], shared_buf_len)) {
>                 ret = -EFAULT;
>                 goto err_free_shared_buf;
> --
> 2.35.1
>
