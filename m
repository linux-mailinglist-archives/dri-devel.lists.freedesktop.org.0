Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1670AC730E
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 23:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4541510E6CF;
	Wed, 28 May 2025 21:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FJ9BhsMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7818010E6CF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 21:54:08 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so38267566b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748469247; x=1749074047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+xKIJHpRZUYAQcHdz5JRA5co6xhNDP+uimCIlW0WOTE=;
 b=FJ9BhsMoI9v2hpqdRAVVLVbTxiCBzg1ZclpJzTJj6Oj6xuqjv/A/Zww63z026QQjZm
 s3d4f6sTaPh7K5Qamh/Y7rlTK76knb3mdYPdi2JXufRUVud10eK8fb1oucPA+ZEk4ntn
 8tffMtxSIzej3VwN164F4+VKX/iASqKJ9aSEDM8SeqMW0VkF74ysmdQfqQXQEKaq8Twd
 SpJiCqiXY6FHCkH8yDsD4677kj4OFH4wxrXjGMeMvXwySWFtsil3D6A7K/TGcuChuea+
 NuUM6Y2h+6HHDOvSYfI6MAiOf++1zGz7/1fadDaUO4oudzV1tHneiMdhe7sJ9gczk7VA
 K7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748469247; x=1749074047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+xKIJHpRZUYAQcHdz5JRA5co6xhNDP+uimCIlW0WOTE=;
 b=k9wkozSF8+4M5pUQGHhpPCe64PhT3SA968fI8KYohEKF9o+70XB2L5iobKJEh+SlX5
 HSt8hCcSBEoJtplD5LMfXS3WLsf3PcloXSo79BTN61XHWbNxGYWHak+ImOea8Rr1BYtf
 qM246fimtkYEwCZvE90JyYyaQz9hChdeTo5mWUF+nZXwnlWfRZBfmJA+Ytt4c1hCP1xQ
 bofXzTTTUENynKBH+pm0DD743TeZiTuWK/0pNsX+GZw/nQofWyC49kE+7oEr3Dr7MUiX
 Kl3oZiKDCZhjgKL/JyNY8MRLhyk3BU2cPDpmARYR/Mk3pYvCgFBAZVvvH9VqjMfJXKKM
 xBKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVizCPZW4fQGT3mziXexAvlo7WPtOt0E/hAdN+rP21GBv7CKqf5AvRAOcDJu8Ob8d1JGAvpa9Oo4xg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxghCRNL6mn+dJM8d6m+eT2WDJoAcLyNjPL2ZfxMXuwxRys0/9V
 7tXtqyvLyTSk4DAPOtL9zreh3DrhSn95e17OUz4nViBOe7j2vZh2dlKaW3H5rPJ4sRuQu4bmt1p
 1rnet+RBEsNuVwxjTmC8UreIkf7hbmFM=
X-Gm-Gg: ASbGncvwiimXY4a7c/Jy6vDV3CoyDRd2eabJQfuIRcJounsJ8NWBrErDMqP0BougbKZ
 MrkM+yVl3itBqpceWqxW+BjZdfM88/n5W0Xhklcab7efI9tizvuVIrdHEiOGLZyV0VWq4puxfla
 R1dldvS+L8HD4O1Pv4aFUyRcrq3u5fSLWEE8RttEWpeg==
X-Google-Smtp-Source: AGHT+IHilvWPc1i9kj1JVRf8jImOl5jvc6e/EVln0RgVdW3HIOsgdhHHAw0OOKfo6hkzITJyK6xZybT0/yMbZzm9tdY=
X-Received: by 2002:a17:907:3d16:b0:ad8:e4ab:7715 with SMTP id
 a640c23a62f3a-ad8e4ab77d6mr87072966b.37.1748469246718; Wed, 28 May 2025
 14:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyJgHPp5N6XpauFRL1hZDLCG8L+9Gmi7RCLRaK4BN4tzA@mail.gmail.com>
 <aDTmUw-CQYuZ1THd@dread.disaster.area>
 <CAPM=9txBdeJmAhZb1XW=3m-uxPxfDdQgb=PCBvssoJkQQDAdFw@mail.gmail.com>
 <aDT-B0EqqDeqXYFh@dread.disaster.area>
 <b20606e9-fc73-4f8c-91a7-e059a9fbce1a@amd.com>
In-Reply-To: <b20606e9-fc73-4f8c-91a7-e059a9fbce1a@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 29 May 2025 07:53:55 +1000
X-Gm-Features: AX0GCFu7KPpZf9ejhtFTrLYN1YKQkvbS2C7pFvfJvELW80bWNbLgBBbHf5gthwg
Message-ID: <CAPM=9txMcS4TsU5M8v6yGH7T7vbAFJM_yw0CVdZWPUpWfNLqmg@mail.gmail.com>
Subject: Re: list_lru operation for new child memcg?
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, kasong@tencent.com,
 nphamcs@gmail.com
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

On Wed, 28 May 2025 at 17:20, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Hi guys,
>
> On 5/27/25 01:49, Dave Chinner wrote:
> > I disagree - specifically ordered memcg traversal is not something
> > that the list_lru implementation is currently doing, nor should it
> > be doing.
>
> I realized over night that I didn't fully explored a way of getting both =
advantages. And we actually don't need list_lru for that.
>
> So here is a side question:
>
> Is it possible to just have a per cgroup counter on how many pages a cgro=
up released back to a particular pool? E.g. something which is added up to =
the same counter on the parent when a cgroup is released.
>
> Background is that the pages are not distinguishable from each other, e.g=
. they are not cache hot or cold or anything like this. So it doesn't matte=
r which pages a cgroup has released but only how many.
>
> If it would be possible to get such a counter then it would be like just =
a few lines of code to add the isolation and still get the advantage of sha=
ring released pages between different cgroups.

I think numa is the only possible distinction I can see between pages
here, even uncached GPU access will be slower to further away numa
nodes,

But indeed this might be a workable idea, just make something that
does what list_lru does but just for the counters, and keep the pages
in a single pool.

Dave.
