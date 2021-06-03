Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF239AACB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 21:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553FC6F4EF;
	Thu,  3 Jun 2021 19:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F286F4EF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 19:17:17 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 q9-20020a9d66490000b02903c741e5b703so5687446otm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 12:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lVZkEcekhqbnYW1h79/086gtCptoM6ZVrjdw+tbtwF4=;
 b=m0lJeGNhBjHYCOQzf6QJ7imtzvshgDNhXRa/Qu6sOJchVPKw+XP8AlBbhEfZEz21Hl
 JsSa+UYTN32cuGukTWFZaj2uZHXdhCOyfM+AlOZXXhYWFp2wN1A1oT1YGKtFIoY9s1lS
 /cNpqGAu0Sh7e39Pqk6ZhcH3wRIdiSnW09xLSW05P4bnB8lwfpecABd2ldHJNWItVuKC
 4SkXE5AzudSdshpLnbpXsuMBjr1EIVGDIMCJAq3ltvMhtAMl+3Pl637XACOiJRnnezBD
 w/nd1wBOO/mAyRISu005O4MG7pVnZjY4Dtb3b8h1iO4jfDUNmgiGkU1VYCGspxJYRCCH
 4kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lVZkEcekhqbnYW1h79/086gtCptoM6ZVrjdw+tbtwF4=;
 b=rpGFn5/aGesAD5A6RmlUkhoyf4aEqKpE7iQUIDolpGHQUHR+rlUR6BqTgI8HmeVCGh
 FD8EArk2Bmjtmr/E+O1F+1Gurr8NjUPzSbCkOIHyzW7v2MVR6vIg2gH/C00UDp5e8R+9
 IymBYkLnMhpIbjuxKTyUjh/XBROc/nu6j6gemMur42Ez4Ke++GDYl1DK1aejrR5AS6MO
 CKi2AFKnJysKXONK7CXYkyyaeQRyhKpn83/2mxGkzAx3U0cS7vIbK6UzCF4LSwJ7wxQU
 dT7OGrW1BPil1f6lA0M/1/kxGKz/owJVxyQo/x43dFbpHLUa6dn1ZtXC7WYXuy3RFFg+
 GAuQ==
X-Gm-Message-State: AOAM530fYpRJfW6qULiieeR8s05B3+XN1IeEFCZGXiIZ4ocYQGTqkipf
 eRVsuDCo27QAGBPmJRDuojHHr81tHtZKgwkRqxk=
X-Google-Smtp-Source: ABdhPJx9480g6CnPMdSfd014SVi7Vj/41AaOlvBl8yste0UcbI4xfPH0kRwOyOaYfayw8sJLEzijOximmwsLL+OQu28=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr672501oti.23.1622747836678;
 Thu, 03 Jun 2021 12:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210603192238.0bbc6686@canb.auug.org.au>
 <20210603113051.2095866-1-yukuai3@huawei.com>
In-Reply-To: <20210603113051.2095866-1-yukuai3@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Jun 2021 15:17:05 -0400
Message-ID: <CADnq5_NgNgQFTWM6soPjhPSce-JwVMh5jpc4RBZyxv+NU5J0Ow@mail.gmail.com>
Subject: Re: [PATCH] drm: fix doc warnings in drm_atomic.h
To: Yu Kuai <yukuai3@huawei.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, yi.zhang@huawei.com,
 Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jun 3, 2021 at 7:21 AM Yu Kuai <yukuai3@huawei.com> wrote:
>
> Add description for parameters for
> for_each_new_plane_in_state_reverse to fix warnings:
>
> include/drm/drm_atomic.h:908: warning: Function parameter or member '__state' not described in 'for_each_new_plane_in_state_reverse'
> include/drm/drm_atomic.h:908: warning: Function parameter or member 'plane' not described in 'for_each_new_plane_in_state_reverse'
> include/drm/drm_atomic.h:908: warning: Function parameter or member 'new_plane_state' not described in 'for_each_new_plane_in_state_reverse'
> include/drm/drm_atomic.h:908: warning: Function parameter or member '__i' not described in 'for_each_new_plane_in_state_reverse'
>
> Fixes: a6c3c37b661d ("drm/amd/display: fix gcc set but not used warning of variable 'old_plane_state'")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  include/drm/drm_atomic.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 8f1350e599eb..1701c2128a5c 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -898,6 +898,10 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
>  /**
>   * for_each_new_plane_in_state_reverse - other than only tracking new state,
>   * it's the same as for_each_oldnew_plane_in_state_reverse
> + * @__state: &struct drm_atomic_state pointer
> + * @plane: &struct drm_plane iteration cursor
> + * @new_plane_state: &struct drm_plane_state iteration cursor for the new state
> + * @__i: int iteration cursor, for macro-internal use
>   */
>  #define for_each_new_plane_in_state_reverse(__state, plane, new_plane_state, __i) \
>         for ((__i) = ((__state)->dev->mode_config.num_total_plane - 1); \
> --
> 2.31.1
>
