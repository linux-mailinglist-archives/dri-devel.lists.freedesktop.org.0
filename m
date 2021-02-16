Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 900B931C802
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 10:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2DA6E3F0;
	Tue, 16 Feb 2021 09:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1DF6E3F0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 09:25:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id m1so13755369wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 01:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Exh3jg3n/TtKnZWGfFfDIiOa1Lq+MYGlC1ET8Iputzc=;
 b=FChGD3IiT+eQbJpCR9t7O50n/LmrueYQUvA0eedPnhjL5FwTbBAttUChubzubHzzE+
 TeFuh3DkLKYTv67VzE91ha47D+tgaEiPVy7rJ8lWsQfLHaZRVt0jwRWzxCBbPr4HwnVv
 asszquvZj2WmDxHU3OWs1baFcapv1QK36SGy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Exh3jg3n/TtKnZWGfFfDIiOa1Lq+MYGlC1ET8Iputzc=;
 b=GADJA0JjfNdxKCeXF5+KzQDXKwm3Sx9s3DF7LLJt2UDVARi1OVoEAv70JW+rAmmeuY
 QsMqZPhJjgMLKPeWHyoIxRqGyo+Fan/O/Fm674InW1WDXAZw4R51juKQr3wjD0yZDgcw
 /I1YSHB8KQd/6gGcVHb5vejj0wTV24KDjWLR/LW0aUweIgP5fNUKUhQo6ywO6iFR70hW
 mnsYaqy1C8t7aanZalDhD95pESjqvwrSzhWFUgIsAXayCCEahotaoEhoodUMSvwvE2sm
 sdWySAXesEzl5fRRjyz2+hh61QEKyRKaWztBQ9ILEN2tFxQjdi8sUpfmJ6RNFKYzQ+Cu
 NP1g==
X-Gm-Message-State: AOAM532Taa1aJE/KkyxedCPN+013aL/kd3Ilh37VEwuJPVKp4TIzb/Bg
 0QwEs0dAljtA69hE2d8yf9NcfQ==
X-Google-Smtp-Source: ABdhPJxCH8w9nrCrGj6DLgq7mUqO7jid+0L9+xJ/lCXaA3/b39BYFgNSlxIAXTKGgH2NqCvGcPhA6A==
X-Received: by 2002:a7b:c010:: with SMTP id c16mr2501284wmb.134.1613467526735; 
 Tue, 16 Feb 2021 01:25:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k11sm26838869wrv.51.2021.02.16.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 01:25:26 -0800 (PST)
Date: Tue, 16 Feb 2021 10:25:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: DMA-buf and uncached system memory
Message-ID: <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, lkml <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 09:58:08AM +0100, Christian K=F6nig wrote:
> Hi guys,
> =

> we are currently working an Freesync and direct scan out from system memo=
ry
> on AMD APUs in A+A laptops.
> =

> On problem we stumbled over is that our display hardware needs to scan out
> from uncached system memory and we currently don't have a way to communic=
ate
> that through DMA-buf.
> =

> For our specific use case at hand we are going to implement something dri=
ver
> specific, but the question is should we have something more generic for
> this?
> =

> After all the system memory access pattern is a PCIe extension and as such
> something generic.

Yes it's a problem, and it's a complete mess. So the defacto rules are:

1. importer has to do coherent transactions to snoop cpu caches.

This way both modes work:

- if the buffer is cached, we're fine

- if the buffer is not cached, but the exporter has flushed all the
  caches, you're mostly just wasting time on inefficient bus cycles. Also
  this doesn't work if your CPU doesn't just drop clean cachelines. Like I
  thing some ARM are prone to do, not idea about AMD, Intel is guaranteed
  to drop them which is why the uncached scanout for integrated Intel +
  amd discrete "works".

2. exporters picks the mode freely, and can even change it at runtime
(i915 does this, since we don't have an "allocate for scanout" flag wired
through consistently). This doesn't work on arm, there the rule is "all
devices in the same system must use the same mode".

3. This should be solved at the dma-buf layer, but the dma-api refuses to
tell you this information (at least for dma_alloc_coherent). And I'm not
going to deal with the bikeshed that would bring into my inbox. Or at
least there's always been screaming that drivers shouldn't peek behind the
abstraction.

So I think if AMD also guarantees to drop clean cachelines just do the
same thing we do right now for intel integrated + discrete amd, but in
reserve. It's fragile, but it does work.

What we imo shouldn't do is driver private interfaces here, that's just
going to make the problem worse long term. Or at least driver-private
interfaces that spawn across drivers behind dma-buf, because imo this is
really a problem that dma-buf should solve.

If you do want to solve this at the dma-buf level I can try and point you
at the respective i915 and amdgpu code that makes the magic work - I've
had to fix it a few times in the past. I'm not sure whether we'd need to
pass the dynamic nature through though, i.e. whether we want to be able to
scan out imported dma-buf and hence request they be used in uncached mode.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
