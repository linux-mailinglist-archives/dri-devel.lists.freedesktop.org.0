Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199B876BE7D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 22:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16C810E03C;
	Tue,  1 Aug 2023 20:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09BD10E03C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 20:35:25 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-63cf3dcffe0so36638316d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 13:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690922125; x=1691526925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nf9b5ArRYyIVdrw7rdZ9H8YQljZ2dhYx/WgjJXtbi90=;
 b=zt+nePwElf098r6sKk/gQOji9C+o+MPTbAwCfrY9GUmRgmE4TTHLRZOV+JPrB0kICg
 uRiUNQANWEg+KHmRuhggtdxFTvqv9ZANBUuUxTbWx4+kYyQiMVlIQSKe7ZqoFVPmHfDl
 hDkj10yRFkQNJ9vfIpZTqvyu3xMBjPO01C8VHwDIO51fFt+hBOCj7L7DgPBFEW2/EvFP
 e84SDiS539tMsKja/psGxarB8iEYt/GZ93WPHy1iyioyR9c4lCVvbGtwYkcZOnk/QI7Q
 VSM7lb47Gx8vQheU4x9PcqS5DzUKkUya3Xiq26LtFCZ3Offt3FsWu87mf6kTtXydQ+aZ
 /i7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690922125; x=1691526925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nf9b5ArRYyIVdrw7rdZ9H8YQljZ2dhYx/WgjJXtbi90=;
 b=ZQ1STTTv2wtid1mWpNKGhBwin80TF2eAC2STiH99CliS/HKSrPIyvBlsbQmai0XjR3
 1COoUNxk5JiPjLpJml3GHQ7maW/7NZctziM3NKCKv2EFrYIqS6zQtgHHvltTX7v/rWqh
 fFsX6mvQqkNAczT27z2aLzCnzlgumXMqP1aIUapoleSrLvMm3f45UW/z/9fN1X4ZFMFY
 R+8vieQgpe/IvoYSmGA3cGsCCRAsG56l2wt55T1Oo7GsFRDpFF6iE7LMzeQYTCKRJUgU
 M/3QoPndZrq0/fFR6F5Lrlhw+5/uc7Jq4RqDecKuQwgyDyyWZUV6/5/CuMxEcEImCcl7
 HCcw==
X-Gm-Message-State: ABy/qLYh2ttFN73f5BEgwg9jdIHeIrEsDNQWEeuzwK0Y7Xh/jR0+rx04
 s3Fk4sQXCgpwULaMLMRyaNfXK3eI3jdEcqGqi/DfTA==
X-Google-Smtp-Source: APBJJlEuoeiPGNMDv5kGiNrPu5wxV6+seqvoAcOaJ4oQ4V9hKgcO2ZE6cIhNx9OxQVoXVwVoyH3whzrqhk+OfvfkWMg=
X-Received: by 2002:a05:6214:84d:b0:63c:f5c0:cd14 with SMTP id
 dg13-20020a056214084d00b0063cf5c0cd14mr12573306qvb.49.1690922124679; Tue, 01
 Aug 2023 13:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230731123625.3766-1-christian.koenig@amd.com>
In-Reply-To: <20230731123625.3766-1-christian.koenig@amd.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Aug 2023 13:35:13 -0700
Message-ID: <CAKwvOdmRm=vOjNXGWeuKw-h78CXMrkcwc5vnCRVqFxMxWzhCcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/exec: use unique instead of local label
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: tzimmermann@suse.de, trix@redhat.com, naresh.kamboju@linaro.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, mripard@kernel.org,
 boris.brezillon@collabora.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 31, 2023 at 5:36=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> GCC forbids to jump to labels in loop conditions and a new clang
> check stumbled over this.
>
> So instead using a local label inside the loop condition use an
> unique label outside of it.
>
> Fixes: commit 09593216bff1 ("drm: execution context for GEM buffers v7")
> Link: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
> Link: https://github.com/ClangBuiltLinux/linux/issues/1890
> Link: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d09=
6eb3aed7b712f5067
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> CC: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Works for me; thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I suspect it's possible to change the indirect goto into a direct goto
with some further refactoring (macros can take block statements; if
drm_exec_until_all_locked accepted a block statement arg then you
could introduce a new scope, and a new local label to that scope, then
just use direct goto), but this will probably apply cleaner. (oh, is
09593216bff1 only in next at the moment? The AuthorDate threw me.)

There are some curious cases where __attribute__((cleanup())) doesn't
mesh well with indirect gotos.
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D37722

May not ever be a problem here...

> ---
>  include/drm/drm_exec.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index 73205afec162..e0462361adf9 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -3,6 +3,7 @@
>  #ifndef __DRM_EXEC_H__
>  #define __DRM_EXEC_H__
>
> +#include <linux/compiler.h>

If you wanted to be more specific (if this addition is due to
__PASTE), then `compiler_types.h` is more precise.

>  #include <linux/ww_mutex.h>
>
>  #define DRM_EXEC_INTERRUPTIBLE_WAIT    BIT(0)
> @@ -74,13 +75,12 @@ struct drm_exec {
>   * Since labels can't be defined local to the loops body we use a jump p=
ointer
>   * to make sure that the retry is only used from within the loops body.
>   */
> -#define drm_exec_until_all_locked(exec)                                \
> -       for (void *__drm_exec_retry_ptr; ({                     \
> -               __label__ __drm_exec_retry;                     \
> -__drm_exec_retry:                                              \
> -               __drm_exec_retry_ptr =3D &&__drm_exec_retry;      \
> -               (void)__drm_exec_retry_ptr;                     \
> -               drm_exec_cleanup(exec);                         \
> +#define drm_exec_until_all_locked(exec)                                 =
       \
> +__PASTE(__drm_exec_, __LINE__):                                         =
       \
> +       for (void *__drm_exec_retry_ptr; ({                             \
> +               __drm_exec_retry_ptr =3D &&__PASTE(__drm_exec_, __LINE__)=
;\
> +               (void)__drm_exec_retry_ptr;                             \
> +               drm_exec_cleanup(exec);                                 \
>         });)
>
>  /**
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
