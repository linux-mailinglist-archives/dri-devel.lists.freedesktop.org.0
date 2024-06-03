Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DB38D86D9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 18:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A5010E180;
	Mon,  3 Jun 2024 16:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vw3FULDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C356F10E180
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 16:02:06 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-57a16f4b8bfso23964a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1717430525; x=1718035325;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3pPvxS6gC0j0wLGI+tY2V3qvQ3+8OtijuhMmjKJ6yQo=;
 b=vw3FULDcjx9U+5A4AkLcywvNyH3Na9Dbp1ebzIkagYeDhw7RoPEDFvqMCaC9DTNe2g
 WAv84Z/M05qK1Bs40sn1omIpSUdQsWHLVKbWEmkvx6SAkgkws0gekWJ9wj0BKkSmasR2
 pjVN1xbo/XcnkxmnEKgP7LK2NzhRCNNsq/H8NcBockfI/8Ne8CMX5TKJrwhUJ59sFrYi
 eSFVLlwINETLt43Ss1mymOfG4X9wd8GEvjt4rrFLTyKS1L4gc/yCbUq/c/viVA2oqE2m
 e1G+JvTesbzFk6gpEhK5PduVOjIs3yIy1Qsn+/edt9aSFGRYI2s/dJxfFt2k8tYZJlOW
 4x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717430525; x=1718035325;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3pPvxS6gC0j0wLGI+tY2V3qvQ3+8OtijuhMmjKJ6yQo=;
 b=mdxxaf+u8UMoosJk9YB9KUJq0TqFj6GK2/44DFEvQQ1WwYhxP9tmWv/7AsMyaigUrx
 Ab1f9Xjr/pprBamMq0QgK+Ciex0ve5XyMxiEXJzdVcnppL0CnIqUptVVXzk9NZl/WcoM
 PBl5UxbyiGXGIk6TOix7P+JC7x3PfCWMbmiIcag8ypswtrXwpyDADSRvbtC2O64ZfOmq
 QhjsjW6kKQY9TmlmSYf3g++22Dg1xGhRThPQaZq6pZDfz6vyN5zVzMxwIHLJt1qyo7D+
 Wg53c628oigc9DHl2B1qy/pJzp2OQJwUDuL0SBFB9GRiQ6ZNsgtow1ZhUq9D5JoSbh65
 OgCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSiXaZQzFu1+4C7eYHZ09yvB5tOWNeUd0AUO0zsALY0O8wvduZZ0gfh173miW+cdS5+FIhhxEjltYcB8jwmD3wiET0bV4cim8iIXV2NwR9
X-Gm-Message-State: AOJu0YxKYaxBQdQlwRNwdNijpAH8tYUu3Z8Bj7LRAGAfjXp9viGNfbMB
 iFyIzrlEUrm1sNQ4A7iFfaO+B9XVbNsG4ilfoBjXRVsQXxpK6Tz/KXuDK0BXJNzfxFWN7JjTiHu
 ARftRY02aZR1wbo7vBJCVbA8hvBkA6pZ00Tc=
X-Google-Smtp-Source: AGHT+IE2ygUL2gxko1zx9nZ3F9o7d4GPZHrXPzUVa/BVxhglHJFXHF4Y/LFsOuSgzTNV+PzRLjHurcbX0Q3lsDSwxtg=
X-Received: by 2002:a05:6402:1803:b0:572:e6fb:ab07 with SMTP id
 4fb4d7f45d1cf-57a49645b32mr266898a12.7.1717430524539; Mon, 03 Jun 2024
 09:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240603114008.16235-1-hailong.liu@oppo.com>
In-Reply-To: <20240603114008.16235-1-hailong.liu@oppo.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 3 Jun 2024 09:01:52 -0700
Message-ID: <CANDhNCq50zPB+TS+_Oo0HY0aUuBAdik2KrC8eJRTygbis293sw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] dma-buf: heaps: move the verification of
 heap_flags to the corresponding heap
To: hailong.liu@oppo.com
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 21cnbao@gmail.com, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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

On Mon, Jun 3, 2024 at 4:40=E2=80=AFAM <hailong.liu@oppo.com> wrote:
>
> From: "Hailong.Liu" <hailong.liu@oppo.com>
>
> This help module use heap_flags to determine the type of dma-buf,
> so that some mechanisms can be used to speed up allocation, such as
> memory_pool, to optimize the allocation time of dma-buf.

This feels like it's trying to introduce heap specific flags, but
doesn't introduce any details about what those flags might be?

This seems like it would re-allow the old opaque vendor specific heap
flags that we saw in the ION days, which was problematic as different
userspaces would use the same interface with potentially colliding
heap flags with different meanings. Resulting in no way to properly
move to an upstream solution.

With the dma-heaps interface, we're trying to make sure it is well
defined. One can register a number of heaps with different behaviors,
and the heap name is used to differentiate the behavior. Any flags
introduced will need to be well defined and behaviorally consistent
between heaps. That way when an upstream solution lands, if necessary
we can provide backwards compatibility via symlinks.

So I don't think this is a good direction to go for dma-heaps.

It would be better if you were able to clarify what flag requirements
you need, so we can better understand how they might apply to other
heaps, and see if it was something we would want to define as a flag
(see the discussion here for similar thoughts:
https://lore.kernel.org/lkml/CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyci=
VXMXQ@mail.gmail.com/
)

But if your vendor heap really needs some sort of flags argument that
you can't generalize, you can always implement your own dmabuf
exporter driver with whatever ioctl interface you'd prefer.

thanks
-john
