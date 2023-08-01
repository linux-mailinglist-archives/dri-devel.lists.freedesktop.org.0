Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B7D76C631
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041B210E4CB;
	Wed,  2 Aug 2023 07:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0DC10E138
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 17:12:55 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-447a4316052so563113137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 10:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909974; x=1691514774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tjQ83+bP/eZvrnu5mLPteL9v32upNHucn015ldMT4Lg=;
 b=eqleB+PpZKRzf07CkM3xQAVn2NofBi6SMHQMVVOvtjj1yAdQkkEpzST4P2npF+ejbz
 6OeHxWZxrhXtqLOSpyOOfUpXFH2lHhWamSLonMZ1o9NLYn5M31P6SwoZhQMpsBD3Rgxi
 jKQMJxbGcSSl685ayD3GcRoQfH5mg2NTm8mJ0XSQfkMgIrKRafZUto7la0ReRcyYsYF5
 6g7JxTndHY8g7HTBuN5JR1VCzQCKdRmiz2umjOQr40oPXi6MbozGZp1POTJ+c2RgDyqb
 MBwz+LZfTd0zNq7XYymhuV448iJei5cgunB3imBi/pb/Bc6n3nGlkvRDpu8PdAC/v1zX
 /Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909974; x=1691514774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tjQ83+bP/eZvrnu5mLPteL9v32upNHucn015ldMT4Lg=;
 b=SYGOhZsm1tp1qEfJogzXwX/wTGXEyU7j2UGqNV4csblnrcDgFnuA2jKWlUB1ORaaVf
 fXxljCM63x5NbMsVsbLQRk3QRry1qpkoAPzBIdFV7oqYTNU8aAet4zR0G4XEtoiEG7hk
 s95aHWCPRLUDAff3p2UaEs+VZQVqKoyQZ/+pyeELXPKXrqM1HmC81d2fC9kJ1+jBYTaQ
 E1CNH/EkW3rX0t0vx9iaLfhHs37sdIWMHxnWcbdv7yjR8V1VysYdtAqZIwEwPnk+yi16
 nsqw1+Ca4H8IvB6hIqkWFlLypDdhsE18FBIC7p1PaztuNOWw8YhZV2t0UzJfJVuvWH5j
 jxUg==
X-Gm-Message-State: ABy/qLbfN3EbJ3B053ODl79njfO6OGwCZ2zATxg4UdvSULTibAUWr9nC
 Zc+ZeaIXbQRa1Yd1iUhMA1Vcm3PoCvLCi4F996w=
X-Google-Smtp-Source: APBJJlGnBieFRVxRgawFgQeh8nMkgg8VXaX2ymYIkKzgsSDMdNymXxpqVlXrzhUS5zrV6ie9HEECZVtXFldDoVWXz7k=
X-Received: by 2002:a05:6102:8f:b0:447:48ab:cfe9 with SMTP id
 t15-20020a056102008f00b0044748abcfe9mr2671039vsp.5.1690909974270; Tue, 01 Aug
 2023 10:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <1690598115-26287-1-git-send-email-quic_pintu@quicinc.com>
 <20230731112155.GA3662@lst.de>
In-Reply-To: <20230731112155.GA3662@lst.de>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 1 Aug 2023 22:42:42 +0530
Message-ID: <CAOuPNLjnfq1JefngtNrg0Q+JdMTSRz+eEqxGQJFfx9+af+k9WA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-contiguous: define proper name for global cma
 region
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 02 Aug 2023 07:14:07 +0000
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
 linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
 Pintu Kumar <quic_pintu@quicinc.com>, akpm@linux-foundation.org,
 Laura Abbott <labbott@redhat.com>, robin.murphy@arm.com,
 Sumit Semwal <sumit.semwal@linaro.org>, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,
Thank you so much for your review and comments.

On Mon, 31 Jul 2023 at 16:51, Christoph Hellwig <hch@lst.de> wrote:
>
> Hi Pintu,
>
> On Sat, Jul 29, 2023 at 08:05:15AM +0530, Pintu Kumar wrote:
> > The current global cma region name defined as "reserved"
> > which is misleading, creates confusion and too generic.
> >
> > Also, the default cma allocation happens from global cma region,
> > so, if one has to figure out all allocations happening from
> > global cma region, this seems easier.
> >
> > Thus, change the name from "reserved" to "global-cma-region".
>
> I agree that reserved is not a very useful name.  Unfortuately the
> name of the region leaks to userspace through cma_heap.
>
> So I think we need prep patches to hardcode "reserved" in
> add_default_cma_heap first, and then remove the cma_get_name
> first.

Sorry, but I could not fully understand your comments.
Can you please elaborate a little more what changes are required in
cma_heap if we change "reserved" to "global-cma-region" ?
You mean to say there are userspace tools that rely on this "reserved"
naming for global cma ?
