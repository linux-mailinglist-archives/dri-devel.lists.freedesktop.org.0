Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B8867AF03
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 10:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF1F10E766;
	Wed, 25 Jan 2023 09:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE68310E760;
 Wed, 25 Jan 2023 09:57:13 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o20so28053242lfk.5;
 Wed, 25 Jan 2023 01:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hkEniX1ct/+n+Fbp4qMF8TvKN+kXTCeykMBRjyZntcI=;
 b=gogszbKAt5us6cwKcTavv03D+QSES2jK860xqb0o+1RrIHCrqVUPnWSca33xqOkIsA
 mIYESX6HgRtyNySE1HZEBn8BqB+Q9TS+bt36EVVOf7bE4JH79SQxzpYTkofUOR3hXTsQ
 o1hp6i4IZxvcGbfgq1h2qEZopemA0ty0rsvFz3609H3RmyjQ0n2y5ak4YqU3NySA5Ydp
 mKG3HSsdKUP4L+TvELGDV2NQpIqukHWDEADwxOaD54v7lHHcK7EtM1ykMyd/tQM8RcFj
 4pQ+f//wxL/wAbkNXOHp12Lvk5aT+LxVOaHmfv0KcQGCk+DYJ8cYQt68kM0o73rXbxZd
 0wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hkEniX1ct/+n+Fbp4qMF8TvKN+kXTCeykMBRjyZntcI=;
 b=s6zZrmAF9/NoIkC5xJJXJ2PAzuUgZRgdySjLh02dLsQ7cCMORflZBLGPmvmzH0/zWf
 922t1v0PK+5khV376Awblhu+lRzzD4OC9so3zUE9Np5THk6bOCOrcIOUNFbKqZbpsY1a
 vCaq9Q7DVR8R4+BUtbW5shjRT3DETUaK/0Sl4edXhakCdzok8/su4ucn/KVwwssrvFfz
 ENX99Y7x0vSTJ5ljBT4FC3+ydNG7oEoti4wVRmCTyVKoJRDcd2ZEMXteZYRHo6MDJYA4
 2vwkXZTs/1TDv+NJRMQzwBhYbxUL8ObUod2txszuaAbsZQ0EMmSPS5+k0/iX0Vf9zY5B
 sjlg==
X-Gm-Message-State: AFqh2krg8GUDZ4gMscBsvyHplGlJHyn1opifyxCl+1Q0zSs3d+0JyeSF
 veHgBUWx3jra48GnGJsAUH9qwzxBF7IFic3WOAs=
X-Google-Smtp-Source: AMrXdXtaKeGgf6FrxqacAoAw8vKhPZnKNG5YCwV1+FHtL5A+m2bKwckp59Xe5DONTes9BGlKUmGtznM5Z7f37qHfFk4=
X-Received: by 2002:a19:8c19:0:b0:4ca:f3c2:2670 with SMTP id
 o25-20020a198c19000000b004caf3c22670mr2671750lfd.166.1674640632138; Wed, 25
 Jan 2023 01:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20230124125726.13323-1-christian.koenig@amd.com>
 <CAM0jSHNmv-naGqB=R8DZc-3QhTPzzo4pUU2-NxhtiEhXMcAN5A@mail.gmail.com>
 <CAM0jSHMgep0q9=C=fHw+Y8SqpNeN3Gz47u_UvwgJuGG3_0qgBQ@mail.gmail.com>
In-Reply-To: <CAM0jSHMgep0q9=C=fHw+Y8SqpNeN3Gz47u_UvwgJuGG3_0qgBQ@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 25 Jan 2023 09:56:44 +0000
Message-ID: <CAM0jSHNKkAS1+dYJdHk23+Uyoz02G1VPFLpKLxX2HqRe7L2HCA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: audit bo->resource usage v3
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Jan 2023 at 17:15, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Tue, 24 Jan 2023 at 13:48, Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Tue, 24 Jan 2023 at 12:57, Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > >
> > > From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> > >
> > > Make sure we can at least move and alloc TT objects without backing s=
tore.
> > >
> > > v2: clear the tt object even when no resource is allocated.
> > > v3: add Matthews changes for i915 as well.
> > >
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
> Ofc that assumes intel-gfx CI is now happy with the series.

There are still some nasty failures it seems (in the extended test
list). But it looks like the series is already merged. Can we quickly
revert and try again?
