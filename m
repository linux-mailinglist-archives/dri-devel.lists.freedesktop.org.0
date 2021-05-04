Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF763730B5
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 21:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780456EB6A;
	Tue,  4 May 2021 19:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46376EB69;
 Tue,  4 May 2021 19:21:31 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id d21so7774724oic.11;
 Tue, 04 May 2021 12:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l0MpBQXXQXovBmumhU+vevXuEERixPQDIBphGMJ/1Eg=;
 b=eS9ZIMjKfbA79gkqM/if0o/ll0b0hJg4orJQPJNRFHk7eYNAbu8O/2wS892rhv/0i0
 ydt7KLieBtrj44E712kqAVQIiJ/mTOsrTzGB8ohvG6HSoZfZEs1rUyhZHv+s8On1/n9Y
 WUNnW8cdZzFM5sYmOR5BF+BYrCvEoH2DXPjr6p1YQmIlqypJ7w7aNwz2yjaaU+JERf9Y
 8RJuZS8q69DExe7dpglbq+PIoBtNixQR88bJM7+qdO7xaXIM8N+/LZ9Tq7mukJxUrDnC
 nnbXiXCDvG4OhqkvobGzMduzQ/1ZlAtXUi979RvD/2Bk93iQNjNT233LXmSIDPBUPPBF
 qx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l0MpBQXXQXovBmumhU+vevXuEERixPQDIBphGMJ/1Eg=;
 b=ILRixHVkna3IleylT7sOMge6M9WEAy/VAD6lxMXnrMCBPLWRSUYv4/H/VnWi19T8eo
 rV/KgjfKJ/LmzG5aiY3ZB4OOtY94r+V4m5uHxzQyeETEnLD9xIsYtXfc9nirAllVj3Hb
 K3Y7HeyHPW10pZAHvplkpN5dgyCezjeEuoNNvNFNO0ButhDtfdUW32YqtYDmHIhRBojI
 otU7tX3cRNMpGPEVjKSfanot2IvIJn6M26B7JOTmymnwnVWxJO0/5mVUelYN+NuuKe6J
 6SJrFi0Vqf8qg3n1HG+6cMG6EjMrKpAwu86h6DLFcu4UdGS5e4Cdprgmc53hBEtU7Ynd
 RzeQ==
X-Gm-Message-State: AOAM532UPkghiDlmu81SEhSFbZoQVZO/K/5dXNgnUzJBP/6+5IRdHsBM
 tj9B8Vcnr11pQMx3JnvDm0Aqb3RgF/uBkd6F+rI=
X-Google-Smtp-Source: ABdhPJywFB9WXlrVjqngMggBTfwS/CosEWD+ccvn0Upp/auCBQw09pw14KzZN0/jk1umIf2aCBqXfO/ZcKNq5aix8v8=
X-Received: by 2002:a05:6808:68a:: with SMTP id
 k10mr18402833oig.120.1620156090910; 
 Tue, 04 May 2021 12:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210427094449.14730-1-fmdefrancesco@gmail.com>
In-Reply-To: <20210427094449.14730-1-fmdefrancesco@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 May 2021 15:21:20 -0400
Message-ID: <CADnq5_NGWrsxaxJqE+_y7Lm4Fdx=BkZYAaYWz_VACAVSgV-ivQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/amd/amdgpu/amdgpu_drv.c: Replace
 drm_modeset_lock_all with drm_modeset_lock
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Hawking Zhang <Hawking.Zhang@amd.com>, outreachy-kernel@googlegroups.com,
 Luben Tuikov <luben.tuikov@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 shaoyunl <shaoyun.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 5:45 AM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> drm_modeset_lock_all() is not needed here, so it is replaced with
> drm_modeset_lock(). The crtc list around which we are looping never
> changes, therefore the only lock we need is to protect access to
> crtc->state.
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Applied.  Thanks!

Alex


> ---
>
> Changes from v3: CC'ed more (previously missing) maintainers.
> Changes from v2: Drop file name from the Subject. Cc'ed all maintainers.
> Changes from v1: Removed unnecessary braces around single statement
> block.
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 80130c1c0c68..39204dbc168b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1595,17 +1595,15 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
>         if (amdgpu_device_has_dc_support(adev)) {
>                 struct drm_crtc *crtc;
>
> -               drm_modeset_lock_all(drm_dev);
> -
>                 drm_for_each_crtc(crtc, drm_dev) {
> -                       if (crtc->state->active) {
> +                       drm_modeset_lock(&crtc->mutex, NULL);
> +                       if (crtc->state->active)
>                                 ret = -EBUSY;
> +                       drm_modeset_unlock(&crtc->mutex);
> +                       if (ret < 0)
>                                 break;
> -                       }
>                 }
>
> -               drm_modeset_unlock_all(drm_dev);
> -
>         } else {
>                 struct drm_connector *list_connector;
>                 struct drm_connector_list_iter iter;
> --
> 2.31.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
