Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619029EBFBC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 01:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D874810EA10;
	Wed, 11 Dec 2024 00:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="nIgvEsPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616FC10EA10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:04:38 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e39fb8548e2so5054738276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 16:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google; t=1733875477; x=1734480277;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OCHV6HmvuE1qzKNAPSoYhRL/7FV4ReXNkxuSygUjwFc=;
 b=nIgvEsPj0MXexeLmsZQaez/0CQ/jSLnCBLiomIII6Js0qTucn/BoS3ytQJwlTu93R0
 B10NzfzWBD08BsnatRfC/edkKwTncY9A41ziCwnEeHk3nKk2aRIH55eSAErzr9GOCimB
 pZziDXidPKTjVAaO3d8+Mvi7999KLuO2UDmQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733875477; x=1734480277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OCHV6HmvuE1qzKNAPSoYhRL/7FV4ReXNkxuSygUjwFc=;
 b=RvP3OQ8lP3CVdXK5sAd2SNm0osDDcze98bexNnxOQ+e/GE7qp0An1tMd/1qGw0QJ33
 EsDigyxXkMsQK8EAt7Qvpv0ewMwmoqo16YWLQSh627yRv5ka5t5oimnJ8H/rOVpayKXI
 fsQNPN4ARLrbKLWlQXqVP/I72EIDgl8jrFbeYERdH7P8kZmahiBeFzV+gKIu30zzJVwa
 t1eVYaoUk+W/+gnTQd+MblZtl1PaOs+xaT4keVC/pQ/sSJFlwr3YoGE/jO5MsLuchSLk
 lEtCDLtAJvDIOwqBKgpIUnDLw9KdO1GxVKChIMdvDs/FK40SSjoDiBOQj1J9i9yAAFK3
 SxkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+mvHCoFAxdyQNe66LfbFfalIoek8/nwBsEOxFdIyWPmGDPu7KP97CHJc7W4ZPOgpAfzNhBCeRftA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9g6bmypHcnN+jRGCk0JrrmLMQWYC+tWQwvQnYuhVwaCZ7w13E
 9Saog8gab4a99expKqYv0Dh9mPwPCt9D8wcR9UmOnDm/VJ8sAreHuIrvVv2FQCSC5ze4kpwUsr7
 K8m5T1HV8wRA/R3VlfDR9VByzmWFM90v3lXs8sg==
X-Gm-Gg: ASbGncuC7ZkgxWNhQlMrJwj1dIAtvCHacbh/RV81R2Zob/lvWYY0Wxl2pGKqBxR/Dl9
 EoaQtIbsOKQm355eFBaccOMPBUHXkwmepczGr
X-Google-Smtp-Source: AGHT+IHAdKnSSZvTjoIr7mwXDQmX65FsKpemA7psolWqer3VHIGe/o3rpMktPHVLVXQ+RdM6hXLdwcEW5U5tsp0AJDI=
X-Received: by 2002:a05:6902:120c:b0:e2b:e0ba:d50 with SMTP id
 3f1490d57ef6-e3c8e42e3a6mr1140093276.5.1733875477096; Tue, 10 Dec 2024
 16:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
 <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com>
 <CAEXW_YRb4PsFgEvHW2QBDY5dxJ+aoMTn3qtj5v9eboxO3SxPLg@mail.gmail.com>
 <CAG48ez2cTrD2_4iKo3+zrPH=e29znYOKLBkC4OLA3yhsu5oMNA@mail.gmail.com>
In-Reply-To: <CAG48ez2cTrD2_4iKo3+zrPH=e29znYOKLBkC4OLA3yhsu5oMNA@mail.gmail.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 10 Dec 2024 19:04:26 -0500
Message-ID: <CAEXW_YRUVwWxuoWs1fU8OCsOf+vAWc__csX2Ed0W+yVr0Y49aA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] udmabuf: fix racy memfd sealing check
To: Jann Horn <jannh@google.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Julian Orth <ju.orth@gmail.com>,
 stable@vger.kernel.org
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

On Tue, Dec 10, 2024 at 6:12=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Tue, Dec 10, 2024 at 11:51=E2=80=AFPM Joel Fernandes <joel@joelfernand=
es.org> wrote:
> > On Wed, Dec 4, 2024 at 11:27=E2=80=AFAM Jann Horn <jannh@google.com> wr=
ote:
> > > The current check_memfd_seals() is racy: Since we first do
> > > check_memfd_seals() and then udmabuf_pin_folios() without holding any
> > > relevant lock across both, F_SEAL_WRITE can be set in between.
> > > This is problematic because we can end up holding pins to pages in a
> > > write-sealed memfd.
> > >
> > > Fix it using the inode lock, that's probably the easiest way.
> > > In the future, we might want to consider moving this logic into memfd=
,
> > > especially if anyone else wants to use memfd_pin_folios().
> >
> > I am curious, why is it not possible to have a reproducer for this
> > issue, is it not reproducible and is theoretical?
>
> Sorry, I think I must have forgotten about this part when I wrote the
> cover letter: The original bug reporter (Julian) linked to a
> reproducer that is linked in the bugzilla bug report, at
> <https://github.com/mahkoh/udmabuf-seal>. I haven't tried running it
> myself though.

Thanks, I appreciate the pointer to the reproducer.

Acked-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel
