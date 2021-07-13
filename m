Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603D3C77E6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 22:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484166E030;
	Tue, 13 Jul 2021 20:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851AB6E030
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 20:22:47 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 f12-20020a056830204cb029048bcf4c6bd9so118253otp.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=me3a+Vld6OfwdM0Xrl8lyRxgmOKdqCHJ1/SVJAB758M=;
 b=OF8jtx4rVIcTvfmnFxYDgZiPN/FC2dFcWWiUEt57fLKxxv32N65zzd37nZFttJvtzl
 khC5JfNRktg96zt5SLXzHjDzcbPmpnqGQoYuFMEm3Z9DC+W/0xzVc1VfQgj/TlnFkFDF
 AixtQhjLhTo1m2Po2BLx20ZZgGdN1UGBJXdec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=me3a+Vld6OfwdM0Xrl8lyRxgmOKdqCHJ1/SVJAB758M=;
 b=VUnM6faBu4GH0TN6KIFtENGBbBnfnhIcPpcvw37B6EgCqZATVuE+F5A10A/mw5zmCA
 gAqZ6144kg9TR/bX8IOHikAXko0UiOEzbimxjDl/zhYtWY55yOq2iENHH52paYKKVAl2
 goBhJU8IG5Q8RpctI9mBtipCwDbxQDH6URJ3+ACUjbxUM1d9Nu9E68tC7XOkHkh2m++Q
 Hn9YzzXCg9he6Iszfkwg8TRUtdyI0X5+lgowDyIFa4p8UlADm2J5Dd2d/7gbHUTD1WWW
 JtiUTos8SZDkxXfVqNduO/upF0YE+Z0DqlwcXU/7VTFO4VQikc+FTD1Jax8s5vTdlNcZ
 jYmQ==
X-Gm-Message-State: AOAM532aUVeU1itPqpyRUyAHmDchipUIw9ufKy/ot+RAandNO3XCKpaH
 ycFCjXUQX6nS/Ofu6NKB5TNcVNTD9iaqshEtNxASKpuUk6k=
X-Google-Smtp-Source: ABdhPJx4f16h6U8xH/qnZMT0G7Rydz14ZGoEE99+A9gB7JywGyVohkBB19PL1eP8PgbjdKWGE9LcdB9oVFgbaGe9up0=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr5195147otb.281.1626207766759; 
 Tue, 13 Jul 2021 13:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210709081116.4170288-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210709081116.4170288-1-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 13 Jul 2021 22:22:35 +0200
Message-ID: <CAKMK7uGq26uL6sJBAKRTAPeB=ZJccmB2yvd0z6-9C5BZcEKK9w@mail.gmail.com>
Subject: Re: [PATCH] dim/drm-misc: Add rule to not push patches with issues
To: DRI Development <dri-devel@lists.freedesktop.org>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 9, 2021 at 10:11 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> We kinda left this out, and I like the wording from the drm-intel
> side, so add that. Motivated by a discussion with Christian.
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Pushed, thanks for all the r-b/acks.
-Daniel

> ---
>  committer-drm-misc.rst | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/committer-drm-misc.rst b/committer-drm-misc.rst
> index 9497a5d26a9d..110ca8b0525e 100644
> --- a/committer-drm-misc.rst
> +++ b/committer-drm-misc.rst
> @@ -21,6 +21,9 @@ Merge Criteria
>
>  Right now the only hard merge criteria are:
>
> +* There must not be open issues or unresolved or conflicting feedback fr=
om
> +  anyone. Clear them up first. Defer to maintainers as needed.
> +
>  * Patch is properly reviewed or at least Ack, i.e. don't just push your =
own
>    stuff directly. This rule holds even more for bugfix patches - it woul=
d be
>    embarrassing if the bugfix contains a small gotcha that review would h=
ave
> --
> 2.32.0
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
