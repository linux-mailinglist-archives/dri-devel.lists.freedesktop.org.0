Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A56A37BD0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 08:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B1410E382;
	Mon, 17 Feb 2025 07:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b+jMNF1W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B6B10E0C6
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 20:06:08 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-471e35c9fbfso2711581cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 12:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739736367; x=1740341167; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAP1KD1zZ0LDFgrnzNE0CA0YlB1kpZiKhEpfx68P448=;
 b=b+jMNF1WeSLq+9vCCjuO/Cg9TaDWfOt55hPy0/SkB2HzYEoJ4CTBmNcTZV4Wze4ox2
 ku20BaPQL1skF0qMUMtd8NNUJhlOj1xdoDsIDcapwJ5zaUotWn18Ossh6C4ivmYT+J+E
 ztcnC7x1ECAgJff2hgeWY/JVHHL/UjKmSij+VoIGpeWqTI3BoVTQMUdoR8vxcIX8DRjA
 bhFLNMiuTFF/HBVUNcctAnBJJ/4qWo+Lmp2/OEdGaIi/G4Y+IwNfn/IEnm97DIOV11Vo
 qe0eCrJp0toPEjzqT0uNOL4EQZXjm3BUxYwMYf/D39OE3qH9cRRQpuoQnSJHT2v1M4Vj
 QssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739736367; x=1740341167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAP1KD1zZ0LDFgrnzNE0CA0YlB1kpZiKhEpfx68P448=;
 b=CXM3FdjOazBMd74z8eC5XzhBhp7NeGJR3vE0E1JDFb9vKUyouNEFNK9EXoZoVPcm9M
 SR8AY/t77szcLma4aOzETRN0inQfjRfItOkuCGMPsbmlq5wDXlqg5VPkMN86+srXfMbK
 /iqj8Sijz0tmGmCtSRtzSuixYBLtkSMiCXBWJtnrHc2GKzfif27diiCA2PoFsDiPYcst
 E25JyCQfqZoZ5nrUrP+DPqF4C5KLLd9Uvoi+9RMCldQLTQ1I6pRJZdRQcWzsF53fQsHW
 5Z/h0OCEXVhFHmthVFtsa7+5QBtE62H2ppIP2SwXYhJFHcFjVAivuIucjW+TL15XOG6J
 ASAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj9iSMJhIVwJV2ENDWA/0mDCGHLU9VBg6sBuc7t2zpYIngqDb+oBZvMgj09v2N4Ju3m0NhsNGGTKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz59syrD3TWkAPBUxXMcdxwGPQRZuGqpj+ZrjcLz6MSQwDM5UDx
 gc7S6zu/qucMNlNGC4/BQdJEa4yxWN0BZQMEmUryXbHmcAB5zw/2lmdzvFaaJ/NhcLaguemZ16H
 WIqs+r7c9TLKFJhxEfxz3RRcSios=
X-Gm-Gg: ASbGnctrsaBPe76YsCHKQi1vMUcusVUjeC5+dAweQ40IK1ohG0bcGGywFiw6cReelDu
 +uitYEN0QXXtvAiA5wsW3cLWToYkHBUj9+HWv9uzFBHC11oKwiJtlraLa5WVslBYdNt+CmeYSKr
 8=
X-Google-Smtp-Source: AGHT+IGMJnTzbXTh9ELT1cBFq6Q+uf6saBfPcbkuFGKb+pRYe6Suqup61hJzj18QOo4GbFyv7cGrTTg73jw91ibrb4E=
X-Received: by 2002:ac8:590a:0:b0:471:ba98:a1d3 with SMTP id
 d75a77b69052e-471dbcc8a65mr96701251cf.11.1739736366922; Sun, 16 Feb 2025
 12:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20250216160644.18924-1-andres.emb.sys@gmail.com>
 <874j0tvm43.fsf@trenco.lwn.net>
In-Reply-To: <874j0tvm43.fsf@trenco.lwn.net>
From: Andres Urian <andres.emb.sys@gmail.com>
Date: Sun, 16 Feb 2025 15:05:56 -0500
X-Gm-Features: AWEUYZmokXvRusmiPvx8MGUmZQXRVUqlYmqkeNqcXe7mK7iCJHEMh-ENyudH4L8
Message-ID: <CAMihqu_uw-51wXMTxo9YLHF8VGcdywzMZukePvbL5m=C37jfBQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation:gpu: fixed spelling mistake
To: Jonathan Corbet <corbet@lwn.net>, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 17 Feb 2025 07:06:12 +0000
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

On Sun, Feb 16, 2025 at 12:24=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Andres Urian Florez <andres.emb.sys@gmail.com> writes:
>
> > Fixed spelling mistake identified by codespell in the drm-uapi
> > documentation
> >
> > Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
> > ---
> >  Documentation/gpu/drm-uapi.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 69f72e71a96e..64e002c6383c 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -518,7 +518,7 @@ ENOSPC:
> >  EPERM/EACCES:
> >          Returned for an operation that is valid, but needs more privil=
eges.
> >          E.g. root-only or much more common, DRM master-only operations=
 return
> > -        this when called by unpriviledged clients. There's no clear
> > +        this when called by unprivileged clients. There's no clear
> >          difference between EACCES and EPERM.
>
> This is a fine patch, but it should really have been copied to the DRM
> maintainers; I think scripts/get_maintainer.pl should have told you
> that?
>
> Thanks,
>
> jon

Sorry, including missing maintainers.

Thanks,
Andres
