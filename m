Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EF376C4FC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 07:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB56510E493;
	Wed,  2 Aug 2023 05:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ADF10E493
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 05:39:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe32ec7201so14135e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 22:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690954755; x=1691559555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWYJKDdolz+W7APxSZcge8Mpis/01h5Go/3E39ja9gE=;
 b=u2D4gxeakPR8NuViuxq7UOiZsXAZW1EeAxq+260enPXoslZIKgTJbxTZZoltObc9L6
 d6pMxqUZsWU0dbrDwyykja+xGR30Gljw+lz1PRzPjM5gBPHycl4nmSLnVV7ShP+3RLv8
 N7iahaTTeK5z+s2r4WzxLyBIXNZrj8OMhzvDjL3k3QrlbULDJh6qFaBn92vNfZxl1XJm
 F29l5WQb1DIyMP4Y30lGQ/WhqONeInAjmuRC2xCDT8eThE13MwYY4eIXVAuk9hVqRzCO
 DSJQYanSQWCDcHa3e//iXzl0PWct1NPh6MBHFYCZuhrmxOR5AtQ4ekJyHv6Ppg60BKDI
 nN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690954755; x=1691559555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWYJKDdolz+W7APxSZcge8Mpis/01h5Go/3E39ja9gE=;
 b=eiGdyEzkFeCiGHg34qnsXkVH7QR9tpBFdXBP5ddaxxIhNZq6JqRKzXYvq007EsL+Vq
 +y30C95ULdOkKufycTtLCsaN5RRqv9dC+MOvR0z+BmBH27/8UwLdl/7BuE/9S5ZWeDip
 kcDyBPWzUrYSRVhdv7JJrXFttSTVTpiVTIZw54wP1OOZXPpFnX2OvxjWU95mDrDluso7
 HMjt5k8DpEZXIS+qOHJ2/IKTSDnFEmAHy41NHgHxlSFj/Q5KNFzRVPVRW/raPlf6xstK
 aTbqwHDckWuSj51aoIazK1B8VHRnqdPQB80tjbeKUHXCM3/BsA+pKnU32nSZfFlHUEsu
 OWhw==
X-Gm-Message-State: ABy/qLa6qogCBiB64+7syW9uXlG2hG7+5mleU8U/k00m5q4bTrwQBIg+
 z1KHK2VoAM+NRf2rtVNKII3GMyPttSfoc2E9GkgW
X-Google-Smtp-Source: APBJJlGB2VlfuxW3dK4WzHju6fp7PuJyl70BB7fOeK4klgHs3vDqzuSrKB0hMKQEoXT8t+Zp/UAztaUSZM5ue3QKmJs=
X-Received: by 2002:a05:600c:3415:b0:3f7:e463:a0d6 with SMTP id
 y21-20020a05600c341500b003f7e463a0d6mr341983wmp.0.1690954755562; Tue, 01 Aug
 2023 22:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <1690598115-26287-1-git-send-email-quic_pintu@quicinc.com>
 <20230731112155.GA3662@lst.de>
 <CAOuPNLjnfq1JefngtNrg0Q+JdMTSRz+eEqxGQJFfx9+af+k9WA@mail.gmail.com>
 <20230801171838.GA14599@lst.de>
In-Reply-To: <20230801171838.GA14599@lst.de>
From: John Stultz <jstultz@google.com>
Date: Tue, 1 Aug 2023 22:39:04 -0700
Message-ID: <CANDhNCq+3OEosUcQJ5GFgk+5OyG+JqXKM43UAo0aPz-V27OgAA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-contiguous: define proper name for global cma
 region
To: Christoph Hellwig <hch@lst.de>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Pintu Agarwal <pintu.ping@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pintu Kumar <quic_pintu@quicinc.com>, akpm@linux-foundation.org,
 Laura Abbott <labbott@redhat.com>, robin.murphy@arm.com,
 Sumit Semwal <sumit.semwal@linaro.org>, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 1, 2023 at 10:18=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Tue, Aug 01, 2023 at 10:42:42PM +0530, Pintu Agarwal wrote:
> > > I agree that reserved is not a very useful name.  Unfortuately the
> > > name of the region leaks to userspace through cma_heap.
> > >
> > > So I think we need prep patches to hardcode "reserved" in
> > > add_default_cma_heap first, and then remove the cma_get_name
> > > first.
> >
> > Sorry, but I could not fully understand your comments.
> > Can you please elaborate a little more what changes are required in
> > cma_heap if we change "reserved" to "global-cma-region" ?
>
> Step 1:
>
> Instead of setting exp_info.name to cma_get_name(cma);
> in __add_cma_heap just set it to "reserved", probably by passing a name
> argument.  You can also remove the unused data argument to __add_cma_heap
> and/or just fold that function into the only caller while you're at it.

So, forgive me, I've not had a chance to look into this, but my
recollection was "reserved" is the name we see on x86, but other names
are possibly provided via the dts node?

I believe on the hikey board its "linux,cma" is the name, so forcing
it to reserved would break that.

Maybe instead add a compat config option to force the cma name (so x86
can set it to "default" if needed)?

thanks
-john
