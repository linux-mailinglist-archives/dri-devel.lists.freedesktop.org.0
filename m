Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C8294D27B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 16:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE7410E93F;
	Fri,  9 Aug 2024 14:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="q8cLDSTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567FD10E93F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 14:49:06 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5b9fe5ea355so12563a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 07:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723214945; x=1723819745;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWu0PqvJqy7ANrJoPRSlf+01g7voIPMxy2M0Jv3xRKc=;
 b=q8cLDSTp1Rp0qkHABsLbekQ8pP3T8uIodSuHXq7MxVuh19qdKenz2ZUKL1/Mt/VSKg
 pzdBkV0xxLuYhbSkDKkCjT6xMquhyWR+ebX357QVcLiXLKqWv+edGonTIuKdaiDfr1t6
 c22r4ajxSQQgjF9JshDK/F0N3J7y6HDnrPs51rMPssNJVGFUxEhD5eoVahbNAVBmKPI8
 68SY+nOrtvs4JDbT55h3jwxhOIAeCN+43CO10EPMqmT7v9eFMuGSreGMWQHkkbeaJWXi
 sFAxDfzZW66B84n2FjPCS8OIlmtgfTSQbjEVq/3sV2Hs4dKGtzrA/yXuQy62esfrcekV
 V3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723214945; x=1723819745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWu0PqvJqy7ANrJoPRSlf+01g7voIPMxy2M0Jv3xRKc=;
 b=VktNan53fawR2FwkOE8QawBCM5mwggMuuCj2T0FoqEd9HOKEKM5z2zftoBz3HdI+mZ
 NQMHSJHvWmvYeU9GQ82fBKWCVXlsqa/8DjzsKwCgb9rh1ne4vCmsy08jmw4wv1sI90AW
 LKeJxMmrUQKBNyyXv+O0nVhZkicOXsNQJOfBTsAv/P4yt4S+2VoR+hS7+dzSoPtDvbAV
 LSmZUe+TtNHz94euTKwT0V75ZO0iYc+hspTdISHsq43Ql13Ixl9x2OXuXbM2A5+tBuYk
 g5+9VT0yDxNCG06Ju5JL2aLVjtXBcvFBKFdziP7jCDEgbTH2U+qLwYg0iTgCb2lj86dh
 BaaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGSNHIhf+ATLUWhb1hrglayUR9v/85WLsGDsGmg8RCbNEE3WeaO2UACY+9mPOqjFDvgoyC86NsBkcYkwRTM6ecD3OB18h7h44Ecoj9CIay
X-Gm-Message-State: AOJu0YwpNYsyXDwuyhc9hzXCu99nC32ZlRlmmZyqZLrjJ8y3wgfrQHXS
 cYNd6/X26ADcsJXtdU/RKOL3D8tFYg/MTq8mohTPRBxNjbz0oXBcc0gUaSNOTP95/jCQrZaRrn5
 Tmlz9yk4QvAmmjXFeogg5RrJZM1mD1grBWAcmD7G4Dczw7AsKfd/Y
X-Google-Smtp-Source: AGHT+IECeH1cZlQzjGqD9qdmVUlYo0LxpDD50/DKWuzjwSacUn3F7RKkWO9Xw7m/MkhVAtg96a9zx9DleSDxUp7jCCI=
X-Received: by 2002:a05:6402:350b:b0:58b:90c6:c59e with SMTP id
 4fb4d7f45d1cf-5bc4b4363f2mr105419a12.7.1723214943937; Fri, 09 Aug 2024
 07:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240805102554.154464-1-andi.shyti@linux.intel.com>
 <ZrFMopcHlT6G7p3V@ashyti-mobl2.lan> <2024080640-landfall-doozy-e0d2@gregkh>
 <ZrHw3y8QKPT87LxP@ashyti-mobl2.lan>
 <172294612086.38654.15621922821489001205@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <172294612086.38654.15621922821489001205@jlahtine-mobl.ger.corp.intel.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 9 Aug 2024 16:48:27 +0200
Message-ID: <CAG48ez0P6juWnVL-m6A33X2GTsrm6CO4okN0s7Y_YT01yTqkrA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix mmap memory boundary calculation
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
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

On Tue, Aug 6, 2024 at 2:08=E2=80=AFPM Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:
> Quoting Andi Shyti (2024-08-06 12:46:07)
> > Hi Greg,
> >
> > same question without the stable mailing list not to trigger the
> > automatic reply.
> >
> > > Andi Shyti (2):
> > >   drm/i915/gem: Adjust vma offset for framebuffer mmap offset
> > >   drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
> >
> > I have forgotten to actually Cc the stable mailing list here.
> > These two patches need to be merged together even if only the
> > second patch has the "Fixes:" tag.
> >
> > I could have used the "Requires:" tag, but the commit id would
> > change in between merges and rebases.
>
> The patches were the top two in drm-intel-gt-next and committed
> only few hours ago so I fixed up the patches adding Cc: stable
> and Requires:

I'm not very familiar with how the DRM trees work - shouldn't fixes in
i915 go on the separate drm-intel-fixes branch so that they don't have
to wait for a merge window?
