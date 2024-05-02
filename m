Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3658BA385
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 00:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA4710F85E;
	Thu,  2 May 2024 22:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ck6FBQ1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A9010F85E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 22:54:35 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5724736770cso1995a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 15:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1714690474; x=1715295274;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PyICWSI1cM8GOz3sU1eVA0B3CS15+lbjDpFSuRGR+Cg=;
 b=ck6FBQ1ONLmuBF8qXDgM9Pj2+ogpOjwjk8cVB3mKKGwIlsEK/Iuv7Z9BsbxZyIGej2
 enIeS3PRcPOfM1NlF8r8keJYXu+yjRuaUTYkwwLOzcqZ1aRqQMGZwrHGUOlwE9koklxy
 VVripSIlbBT7PXBQhmoAtXIPy3k7/XcUqBEBIvBue9pve4yDnLJ1pCJv7KR9GNK/FZwl
 zNVPou08p/WdhmvYaY05I5lMVnmUb58ZPw+WQys0rh343VqKhgV5So4NyZq80qyPQr9z
 WbEtszGKGLy3jl+gJ25W9lhTidh//+cZS9V5JIAlcWRlRCx/lFm39HEna5GaLE0plsWt
 IEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714690474; x=1715295274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PyICWSI1cM8GOz3sU1eVA0B3CS15+lbjDpFSuRGR+Cg=;
 b=bE6CBl0RaxELf/EegjKZYWIc9tiOD/Un+8pEVHNjMx+bo1lq/34Giz+kWZQdf/3ftT
 g25w6vY6joQant7lGa7Nil7D2VmsvJbIjv2cy5irSAD7jwJtmKTtBvWmz4ymckgIf3md
 qcHTfPVxAWUkzJ4aeUs6HkcoEJT/8srirRpkpe7eAV3H4Q+t7M6AbyoSpGiQqFH9UhZX
 PCi0r0NhD+V7OuWNr1gIIs59mlsLoblhQMVE+uZIa65UTRF2kdjJsHcTcmXya1/PJ8gY
 tA0xwPEAwa++pB44V9H0Qir6daurPxOw2XvoLy/AMhX89RVSEhL90bIjJ/BdsWP16rR/
 b+1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf8HXeYBPIPhMJaXoA0e9LyBOzmxxlsV5NDm2UqALk2GaeCNyF6M1O9b6L72n3oo55Cltid0dbHD7E97GrSIC+vt/cDikn8ptUsURzzgOa
X-Gm-Message-State: AOJu0Yxdb+pg4NxxCKdlci8BC3CQIsKdVbJzlHmLrVh/Kt3DgW53DA7h
 RIp+BEWwIHCtfmXnR0sAKoMw29Af0rFghXqQrfYRJnxHpfcYIzp2LFqj6WCuHH0NzeMPWA8cxzb
 ALyvSoHMFxeodJphgQw5D+Tb2pKBziS2KIzMg
X-Google-Smtp-Source: AGHT+IHUpFN1HwN88U/dPawni2hB3Y1RKlrNTuS1Z087x30/mKoL8VMzPAwnvWTcOTSQDXoDRVAyK4o1cHhfwp6nPtI=
X-Received: by 2002:aa7:d448:0:b0:572:a1b1:1f99 with SMTP id
 4fb4d7f45d1cf-572d0c0e124mr33966a12.1.1714690473701; Thu, 02 May 2024
 15:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240502222252.work.690-kees@kernel.org>
 <20240502223341.1835070-1-keescook@chromium.org>
In-Reply-To: <20240502223341.1835070-1-keescook@chromium.org>
From: Jann Horn <jannh@google.com>
Date: Fri, 3 May 2024 00:53:56 +0200
Message-ID: <CAG48ez0d81xbOHqTUbWcBFWx5WY=RM8MM++ug79wXe0O-NKLig@mail.gmail.com>
Subject: Re: [PATCH 1/5] fs: Do not allow get_file() to resurrect 0 f_count
To: Kees Cook <keescook@chromium.org>
Cc: Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 linux-fsdevel@vger.kernel.org, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Mark Rutland <mark.rutland@arm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>, 
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Andrew Morton <akpm@linux-foundation.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org, 
 linux-hardening@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 3, 2024 at 12:34=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
> If f_count reaches 0, calling get_file() should be a failure. Adjust to
> use atomic_long_inc_not_zero() and return NULL on failure. In the future
> get_file() can be annotated with __must_check, though that is not
> currently possible.
[...]
>  static inline struct file *get_file(struct file *f)
>  {
> -       atomic_long_inc(&f->f_count);
> +       if (unlikely(!atomic_long_inc_not_zero(&f->f_count)))
> +               return NULL;
>         return f;
>  }

Oh, I really don't like this...

In most code, if you call get_file() on a file and see refcount zero,
that basically means you're in a UAF write situation, or that you
could be in such a situation if you had raced differently. It's
basically just like refcount_inc() in that regard.

And get_file() has semantics just like refcount_inc(): The caller
guarantees that it is already holding a reference to the file; and if
the caller is wrong about that, their subsequent attempt to clean up
the reference that they think they were already holding will likely
lead to UAF too. If get_file() sees a zero refcount, there is no safe
way to continue. And all existing callers of get_file() expect the
return value to be the same as the non-NULL pointer they passed in, so
they'll either ignore the result of this check and barrel on, or oops
with a NULL deref.

For callers that want to actually try incrementing file refcounts that
could be zero, which is only possible under specific circumstances, we
have helpers like get_file_rcu() and get_file_active().

Can't you throw a CHECK_DATA_CORRUPTION() or something like that in
there instead?
