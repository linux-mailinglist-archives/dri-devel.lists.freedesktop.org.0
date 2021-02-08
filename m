Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B058A312E86
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 11:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21FB6E854;
	Mon,  8 Feb 2021 10:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AF56E854
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 10:08:48 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n6so3520229wrv.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 02:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=0pOHlp3YfmPQ6aHp/8FB8TarZqCW4k9p2xOGz6n9MDg=;
 b=d0kQAFm7tei2XxZSgVD38fMf+wEOst/QXqkIwC7c7+FGD9nWzqN0bib59r4MF5dh5a
 28Bqrogt48urasAsA0+opmN5trx4wdmhECFI5EC4xeMnqyDj3zSZp64O+RP0wjO4TWZv
 3RdQuFtbld1C1h8PdndhUeNBuGZ5FRIEC/2zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=0pOHlp3YfmPQ6aHp/8FB8TarZqCW4k9p2xOGz6n9MDg=;
 b=t2prgQWdGir/vok+UicXdoEWPX9mvDtR7zzo5Vbstc6tzaoOWTrV1s5FnZx7TJgja3
 U2PkeAl4NQNisZEa/vdnOV34/HsE+LUkEFX2U2tv1li1O62D+FiJ7OsaoaXTBLqA1/Tn
 6IXv2pcDl0/ZpV6/ujEsI6jIiNZbxVJbb4sRzBx5JmXbiltJw1WXF7wtngF3D9UPk+/S
 iPecucj5azf3YyqvqhIqPPIF9zcqVbcb8aADuQCTctT15e1yDVl1aGszg2EnOAk3ySYK
 RQPzNULq9zBbvhVseuD3r4xDumT46ok/OXtLCBpX8lk6PeSHUUkqO0pqy729JrumULfu
 lRfQ==
X-Gm-Message-State: AOAM531gHcJX9ofJByf9rgyRxqJWXV6E51tQtHqkEmFRbRelgqk9MqW8
 Pr6gOZZDQgc+6tL3OEge0RwFDA==
X-Google-Smtp-Source: ABdhPJzJ1HgP5N/LeOlDB3NYZUOuI03t3dodjSugSJHVqish8RwUT2TL18EPp5qcKUwbVn1nAmPTYA==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr19274155wri.77.1612778927278; 
 Mon, 08 Feb 2021 02:08:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b138sm19614011wmb.35.2021.02.08.02.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 02:08:46 -0800 (PST)
Date: Mon, 8 Feb 2021 11:08:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Fix the name used when
 exporting dmabufs to be the actual heap name
Message-ID: <YCENrGofdwVg2LMe@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Liam Mark <lmark@codeaurora.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Sandeep Patil <sspatil@google.com>,
 Daniel Mentz <danielmentz@google.com>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Simon Ser <contact@emersion.fr>, James Jones <jajones@nvidia.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210206054748.378300-1-john.stultz@linaro.org>
 <20210206054748.378300-2-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210206054748.378300-2-john.stultz@linaro.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 06, 2021 at 05:47:48AM +0000, John Stultz wrote:
> By default dma_buf_export() sets the exporter name to be
> KBUILD_MODNAME. Unfortunately this may not be identical to the
> string used as the heap name (ie: "system" vs "system_heap").
> =

> This can cause some minor confusion with tooling, and there is
> the future potential where multiple heap types may be exported
> by the same module (but would all have the same name).
> =

> So to avoid all this, set the exporter exp_name to the heap name.
> =

> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: =D8rjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Looks reasonable to me.

I guess the main worry is "does this mean heap names become uapi", in
which case I'm maybe not so sure anymore how this will tie into the
overall gpu memory accounting story.

Since for dma-buf heaps one name per buffer is perfectly fine, since
dma-buf heaps aren't very dynamic. But on discrete gpu drivers buffers
move, so baking in the assumption that "exporter name =3D resource usage for
this buffer" is broken.

So I'm not sure we shouldn't instead name all the dma-buf heaps as
"dma-buf heaps" to stop this :-)
-Daniel

> ---
>  drivers/dma-buf/heaps/cma_heap.c    | 1 +
>  drivers/dma-buf/heaps/system_heap.c | 1 +
>  2 files changed, 2 insertions(+)
> =

> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 364fc2f3e499..62465d61ccc7 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -339,6 +339,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
>  	buffer->pagecount =3D pagecount;
>  =

>  	/* create the dmabuf */
> +	exp_info.exp_name =3D dma_heap_get_name(heap);
>  	exp_info.ops =3D &cma_heap_buf_ops;
>  	exp_info.size =3D buffer->len;
>  	exp_info.flags =3D fd_flags;
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index 17e0e9a68baf..2d4afc79c700 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -388,6 +388,7 @@ static int system_heap_allocate(struct dma_heap *heap,
>  	}
>  =

>  	/* create the dmabuf */
> +	exp_info.exp_name =3D dma_heap_get_name(heap);
>  	exp_info.ops =3D &system_heap_buf_ops;
>  	exp_info.size =3D buffer->len;
>  	exp_info.flags =3D fd_flags;
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
