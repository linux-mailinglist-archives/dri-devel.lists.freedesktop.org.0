Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD86F1A7B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 16:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6892F10ED78;
	Fri, 28 Apr 2023 14:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0B610E128;
 Fri, 28 Apr 2023 14:29:41 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-38e12d973bfso32641b6e.0; 
 Fri, 28 Apr 2023 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682692180; x=1685284180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lYzqB28RMSFODBuTMB/KY5cl7Tjsfy3OkCWgNjZ6ZLE=;
 b=kh97gIflH3BI4ERsMSHvjFc0yOO2bt2fLm/uIbDsDrqqCu8s1sBxd1qDVEdBRIXaVx
 iL5RpT2zMNzyg+NFwLpVdMi4AybUyNQoR4/KTIyCNQ6rbL1F0DeQ5KmZHZmRbVrbxMMI
 EVvL2F+CnVM44ANsh30EStkooMTY3pgBJcPpfXLKde2v/nu6v57pykRxydjH1nTW2/FA
 TfRXpk1QRjR02exKoXYK2MUCINulVfTlZ+sUo+7AckhEWV6lOlDp77IYs7xS8lGE0Ir4
 PzdyIuMruilIAnr8RxZgmYIczOd6F8olt3vtZ53rzCG7Ai88S1HDJjafAmDY7EMzhuzg
 t0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682692180; x=1685284180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lYzqB28RMSFODBuTMB/KY5cl7Tjsfy3OkCWgNjZ6ZLE=;
 b=IioYNvqBQnCnBRafVbGN2/hPJZB3zGv5FVXBDA8gdOLKrx745fTYQdWi7fSIf+KAap
 Pa8VnSQZpg8OHvmnrQkAi8e5fCImEN2W8cLyqtaUc9mD3395pqAIUeWGMHMAdHqi5Mmr
 bUDkBNH1KuxLJSTCIDVlUT7IyWWVWeTicmXAqP7uKb7Mb+B7kH/ShSIC6MuLzYlTyNAN
 fWp7954t/9O6ev1b4Q60uOkdJHgX+Zns+bdajin1XWwiyRXDUaR/B3zH8kZ/MFq7nWW8
 WZ7yGAd+v/yhVJtbtQMeoVg9+fbfgUtDV0kWMqv3T7v73FbUZsMxNUny1K3bVwM6c9dj
 eyjg==
X-Gm-Message-State: AC+VfDxBQoPzL2peWNcuBQ16c8lvW+Zim8RigsMpHMu5j06xjov9eQhs
 rrHgP7a0J+JexD6AkOvuwborA2SvmJCsNumQFSM=
X-Google-Smtp-Source: ACHHUZ5KCaCwW1hvzW8OWPVzp040UD7tuDkE/lZ6cadmhT2Hjv5r9AbIl/f2DmSYTc/uRNg/F3c8gxInAbFvh4+1rRI=
X-Received: by 2002:a05:6808:5da:b0:38e:e0c3:5cce with SMTP id
 d26-20020a05680805da00b0038ee0c35ccemr2440343oij.18.1682692180051; Fri, 28
 Apr 2023 07:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230427175340.1280952-1-robdclark@gmail.com>
 <20230427175340.1280952-2-robdclark@gmail.com>
 <0be60cda-6b8b-5844-c4fe-b711e7279cc7@amd.com>
In-Reply-To: <0be60cda-6b8b-5844-c4fe-b711e7279cc7@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 28 Apr 2023 07:29:28 -0700
Message-ID: <CAF6AEGtd=fP1_JnD6-V7U_ZNnD1VG-rZean6mNDTLHsqZJdeYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] drm/docs: Fix usage stats typos
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 1:50=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 27.04.23 um 19:53 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Fix a couple missing ':'s.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Since this is a pretty clear fix I suggest to get this pushed to reduce
> the number of patches in the set.

Thanks, this is fine by me if someone wants to push it for me.  Note
that the later .rst updates in this series depend on this so if/when
they are merged it probably should be the same tree

BR,
-R

> Christian.
>
> > ---
> >   Documentation/gpu/drm-usage-stats.rst | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/=
drm-usage-stats.rst
> > index b46327356e80..72d069e5dacb 100644
> > --- a/Documentation/gpu/drm-usage-stats.rst
> > +++ b/Documentation/gpu/drm-usage-stats.rst
> > @@ -105,7 +105,7 @@ object belong to this client, in the respective mem=
ory region.
> >   Default unit shall be bytes with optional unit specifiers of 'KiB' or=
 'MiB'
> >   indicating kibi- or mebi-bytes.
> >
> > -- drm-cycles-<str> <uint>
> > +- drm-cycles-<str>: <uint>
> >
> >   Engine identifier string must be the same as the one specified in the
> >   drm-engine-<str> tag and shall contain the number of busy cycles for =
the given
> > @@ -117,7 +117,7 @@ larger value within a reasonable period. Upon obser=
ving a value lower than what
> >   was previously read, userspace is expected to stay with that larger p=
revious
> >   value until a monotonic update is seen.
> >
> > -- drm-maxfreq-<str> <uint> [Hz|MHz|KHz]
> > +- drm-maxfreq-<str>: <uint> [Hz|MHz|KHz]
> >
> >   Engine identifier string must be the same as the one specified in the
> >   drm-engine-<str> tag and shall contain the maximum frequency for the =
given
>
