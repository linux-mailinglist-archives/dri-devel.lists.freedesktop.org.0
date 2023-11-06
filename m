Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F1A7E2C0B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5B510E3A6;
	Mon,  6 Nov 2023 18:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D026E10E3A6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 18:32:23 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53e2308198eso8056393a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 10:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ncf.edu; s=google; t=1699295542; x=1699900342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=soe8+lEThbuxrauS3i3IgwpF8YYQwLOsQWEzb/VsikE=;
 b=T9E09N9Y1TLmKV0Sc8WJFZ9CfQWgSA80Zd8aiWrqaqvltzS+o7uIC2loW8YLVY+HhU
 H0AZoB8zCeWYqjWtWKNcVZTmwnOOiXOhBMTaGE+bRhsnPqffIWZc5wFfayYYF7MYAuMT
 8nshc9AIVWRTkUNA1NzSn5dKxzL4ywZ5rn1ETPe79+Gu6ppRrFshBnenU7nDdDNy0JDg
 uMKe8w8wFoHaeCJOqwP4mpIUxRM1pqXV59oDGKqlzQMiUxqQv9Nu/xn1m5fAE/em0YRu
 TIyKWz6Z+r6FAOmUPZjJzeu3sNnLl5GQ+MnfAanBl/TXCk63VMUHdlq9zAhwkK+pSuky
 66Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699295542; x=1699900342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=soe8+lEThbuxrauS3i3IgwpF8YYQwLOsQWEzb/VsikE=;
 b=W+Qip9c8M1x16r8k5DDmjccDGiqUNziVlEg6iaWCkr+wcb6WZe/e736bVLwshzIYbG
 8rqhZre+Mz2/D4NYb0BzbuJ36sNZVMZaUkEChelUSJw0IvyrwZ4F+v2sMC1wF2Coc8NH
 PpNJURWf4AY5y50WJpb8+mc1wvU3BbYXwPLG0utpPVdWWKG/wQj3b+HnYxLLF7CaPmJq
 g49LSc8MKJIU4GHugdf6gkUlLF/RXPlhiU+hfHbuL6bz0FA41vyhdBNhzkOpk3w10HKy
 B2NpZf6FE0FPbqs3zHXRhmZgtaH78Tl6RR/aZFLbb9VkPeCRMj9xhSHYfVzW84fCj7+f
 AmPQ==
X-Gm-Message-State: AOJu0YwrO2dYdHHlWa0S2k+8ePs7HqZIjZbequfggWHEo3pY/LDTCLU8
 G/pfGXSCzFN0QujdQtYHf27Ti3rQtzGy9zYZN9TCsw==
X-Google-Smtp-Source: AGHT+IE3COqO7suPYWfkaoTj6yDKUl996sDTArem8FR8xxzofLxH2XDlLxKp5WUB3vgbmOm3yFfyau3xkkh6Cxyv/u0=
X-Received: by 2002:a17:907:9413:b0:9b2:b691:9b5f with SMTP id
 dk19-20020a170907941300b009b2b6919b5fmr14911910ejc.41.1699295542171; Mon, 06
 Nov 2023 10:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
 <ZUhvj2uj_PvaDxIM@debian.me> <8734xj18ck.fsf@intel.com>
In-Reply-To: <8734xj18ck.fsf@intel.com>
From: Hunter Chasens <hunter.chasens18@ncf.edu>
Date: Mon, 6 Nov 2023 13:32:11 -0500
Message-ID: <CAFJe6O1oJnQvLVSJZP6MMXULGrX=a3SEO1X5b4xff06WhqLw_g@mail.gmail.com>
Subject: Re: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused
 directives for namespacing
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, corbet@lwn.net, tzimmermann@suse.de,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mripard@kernel.org,
 Luca Coelho <luciano.coelho@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When running `make htmldocs` the following warnings are given.

```
Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING:
Unknown directive type "c:namespace-push".

.. c:namespace-push:: rfc
Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING:
Unknown directive type "c:namespace-pop".

.. c:namespace-pop::
```

The kernel test robot also reported it here.
Link: https://lore.kernel.org/all/202311061623.86pTQrie-lkp@intel.com/

Last year Maryam Tahhan <mtahhan@redhat.com> from Redhat noticed something
similar. "The missing support of c:namespace-push:: and c:namespace-pop::
directives by helper scripts for kernel documentation prevents using the
``c:function::`` directive with proper namespacing." From the context, it
sounds like this was brought about from a Sphinx update.

Link: https://lore.kernel.org/all/20221123092321.88558-3-mtahhan@redhat.com=
/

When compiled the `.. kernel-doc::` literal gives it the same formatting wi=
th
or without the namespace directives present. Due to the above information I
think it safe to remove these, as they don't seem to do anything but
throw warnings.

On Mon, Nov 6, 2023 at 5:31=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> On Mon, 06 Nov 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> > On Sat, Nov 04, 2023 at 09:47:08AM -0400, Hunter Chasens wrote:
> >> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/=
gpu/rfc/i915_scheduler.rst
> >> index c237ebc024cd..23ba7006929b 100644
> >> --- a/Documentation/gpu/rfc/i915_scheduler.rst
> >> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> >> @@ -135,13 +135,9 @@ Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
> >>  drm_i915_context_engines_parallel_submit to the uAPI to implement thi=
s
> >>  extension.
> >>
> >> -.. c:namespace-push:: rfc
> >> -
> >>  .. kernel-doc:: include/uapi/drm/i915_drm.h
> >>          :functions: i915_context_engines_parallel_submit
> >>
> >> -.. c:namespace-pop::
> >> -
>
> What makes the namespacing unnecessary?
>
> $ git grep '.. kernel-doc:: include/uapi/drm/i915_drm.h'
> Documentation/gpu/driver-uapi.rst:.. kernel-doc:: include/uapi/drm/i915_d=
rm.h
> Documentation/gpu/rfc/i915_scheduler.rst:.. kernel-doc:: include/uapi/drm=
/i915_drm.h
>
> And you get [1] and [2].
>
> >>  Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> >>  -------------------------------------------------------------------
> >>  Contexts that have been configured with the 'set_parallel' extension =
can only
> >
> > The warnings go away, thanks!
>
> What warnings go away?
>
> BR,
> Jani.
>
>
> [1] https://docs.kernel.org/gpu/driver-uapi.html#c.i915_context_engines_p=
arallel_submit
> [2] https://docs.kernel.org/gpu/rfc/i915_scheduler.html#c.rfc.i915_contex=
t_engines_parallel_submit
>
> >
> > Fixes: f6757dfcfde7 ("drm/doc: fix duplicate declaration warning")
> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> --
> Jani Nikula, Intel
