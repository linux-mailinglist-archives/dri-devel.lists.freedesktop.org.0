Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C5976D96E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 23:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0532C10E0AC;
	Wed,  2 Aug 2023 21:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B76010E0AC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 21:24:14 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-4476a9e8812so130539137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 14:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691011453; x=1691616253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eGkan6kKOoMuhY5wkLq1cZqXzfolEtrHhlDhYTOBf2Y=;
 b=5sGr0QQJTvlmwSK/HebXWPOuSSRMw+V+Y6fBEea8/Ap+S1UP1YfovFvbXee1LvbK7k
 IZxXnEs7lYzWSUcvcCxO5oOPDoHbbVgMOUfwuTbiOXQD2K21XdAq5ooonO+IK0uFLSEE
 uEGgbNefuMK0eR4dTfhtDowXTpB7cPtCsggWVnzN/fkfCPcZCfc1BWCbnVUZ6SNS1E/9
 02goZmzcveviFreHJaqv+9AfkV7IW8EDkdREuxSBNqINkE0fGA//eboZg+juNbySHpFG
 ZyQu3BLx0t8RC2tMSMjMnY2FxiKcQOX3cyjV5daDFHrTm62xfJ5EvstYdaxTBq5Oq5Gj
 bKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691011453; x=1691616253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eGkan6kKOoMuhY5wkLq1cZqXzfolEtrHhlDhYTOBf2Y=;
 b=W/0R6thBcWgKgvdZY71MyIiFcT1jDvOLBxIrbFVosmCdOBbZCfR44ZvpgTlpO201HD
 jzCHsHdMx9RjsVSeumbajK+POuskgUqklIJRHFf0JHmloMBoDvb2DzcpKUwAaM/ruBGK
 kvkdIvnDgYnLgik6UTuL7G+6R77aafuooaYFFsmXHGay0Zv5c1mz8mIqNQwH5EiGH0+q
 8ExNp1CYW5WDZ4kHW6GPNPkSsfGB3iSSk8MRjXWBxDTBnDsK6LEwia6H4NylBFfbNKFS
 Zfnx/+JIL30KJE7ivnHQ2Nh3aoUX6lISTTBAoqssALSFjBlaSTIPs5OaEFXnUz+59cXn
 Kv6A==
X-Gm-Message-State: ABy/qLYJMalXBOXv4ZLMQgNdXMjHxe60jaETzE+WJ1jCvBFyP3Ip3P/I
 cLN2zqgIKHwm+NoDmk4vK2LwyXCwJgIQeDJ6LnNqIw==
X-Google-Smtp-Source: APBJJlGZq5UYNgKa8N469Wl7o5dbEEGllcRjv7SqR2bCaUVGIXc3Qc7a6F4MzKYrCq6avEi0oy5NbhAh32s1BZdb2A0=
X-Received: by 2002:a67:be0b:0:b0:443:6180:778f with SMTP id
 x11-20020a67be0b000000b004436180778fmr5937813vsq.33.1691011453120; Wed, 02
 Aug 2023 14:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230731123625.3766-1-christian.koenig@amd.com>
 <CAKwvOdmRm=vOjNXGWeuKw-h78CXMrkcwc5vnCRVqFxMxWzhCcg@mail.gmail.com>
 <20230802104415.7fe64b67@collabora.com>
In-Reply-To: <20230802104415.7fe64b67@collabora.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Aug 2023 14:24:02 -0700
Message-ID: <CAKwvOd=Y2qM+Urh39JDei_STpijUB4wOysTVMuHkShjOsgXZqg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/exec: use unique instead of local label
To: Boris Brezillon <boris.brezillon@collabora.com>
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
Cc: tzimmermann@suse.de,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 naresh.kamboju@linaro.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 mripard@kernel.org, dakr@redhat.com, dri-devel@lists.freedesktop.org,
 trix@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 2, 2023 at 1:44=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Tue, 1 Aug 2023 13:35:13 -0700
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> > On Mon, Jul 31, 2023 at 5:36=E2=80=AFAM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > >
> > > GCC forbids to jump to labels in loop conditions and a new clang
> > > check stumbled over this.
> > >
> > > So instead using a local label inside the loop condition use an
> > > unique label outside of it.
> > >
> > > Fixes: commit 09593216bff1 ("drm: execution context for GEM buffers v=
7")
> > > Link: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1890
> > > Link: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f=
5d096eb3aed7b712f5067
> > > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > > CC: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > Works for me; thanks for the patch!
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > I suspect it's possible to change the indirect goto into a direct goto
> > with some further refactoring (macros can take block statements; if
> > drm_exec_until_all_locked accepted a block statement arg then you
> > could introduce a new scope, and a new local label to that scope, then
> > just use direct goto),
>
> Maybe I'm wrong, but this sounds like the version I proposed here [1].

Nearly; here's what I was imagining:
```
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 977e1804718d..3ea8beb159f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -904,7 +904,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser=
 *p,
                e->user_invalidated =3D userpage_invalidated;
        }

-       drm_exec_until_all_locked(&p->exec) {
+       drm_exec_until_all_locked(&p->exec, {
                r =3D amdgpu_vm_lock_pd(&fpriv->vm, &p->exec, 1 + p->gang_s=
ize);
                drm_exec_retry_on_contention(&p->exec);
                if (unlikely(r))
@@ -928,7 +928,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser=
 *p,
                        if (unlikely(r))
                                goto out_free_user_pages;
                }
-       }
+       })

        amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
                struct mm_struct *usermm;
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 73205afec162..8e32a9b704e7 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -74,14 +74,13 @@ struct drm_exec {
  * Since labels can't be defined local to the loops body we use a jump poi=
nter
  * to make sure that the retry is only used from within the loops body.
  */
-#define drm_exec_until_all_locked(exec)                                \
-       for (void *__drm_exec_retry_ptr; ({                     \
-               __label__ __drm_exec_retry;                     \
-__drm_exec_retry:                                              \
-               __drm_exec_retry_ptr =3D &&__drm_exec_retry;      \
-               (void)__drm_exec_retry_ptr;                     \
-               drm_exec_cleanup(exec);                         \
-       });)
+#define drm_exec_until_all_locked(exec, block)                         \
+       {       \
+               __label__ __drm_exec_retry;     \
+__drm_exec_retry:      \
+               while (drm_exec_cleanup(exec))  \
+                       block   \
+}

 /**
  * drm_exec_retry_on_contention - restart the loop to grap all locks
@@ -93,7 +92,7 @@ __drm_exec_retry:
         \
 #define drm_exec_retry_on_contention(exec)                     \
        do {                                                    \
                if (unlikely(drm_exec_is_contended(exec)))      \
-                       goto *__drm_exec_retry_ptr;             \
+                       goto __drm_exec_retry;          \
        } while (0)

 /**
```
(only updated one macro expansion site in
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c, didn't add proper trailing
tabs to macro but you get the gist).

But I think both compilers can optimize out the unnecessary
indirection when it's obvious, so I don't think it matters much, other
than the tastes of whoever has to maintain this.


>
> > but this will probably apply cleaner. (oh, is
> > 09593216bff1 only in next at the moment? The AuthorDate threw me.)
> >
> > There are some curious cases where __attribute__((cleanup())) doesn't
> > mesh well with indirect gotos.
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D37722
> >
> > May not ever be a problem here...
>
> [1]https://patchwork.freedesktop.org/patch/543077/



--=20
Thanks,
~Nick Desaulniers
