Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEA8A748EB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AC510E9E8;
	Fri, 28 Mar 2025 11:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ivHQ7WQY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9BE10E9E7;
 Fri, 28 Mar 2025 11:04:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F2BBDA417EE;
 Fri, 28 Mar 2025 10:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7DDC4CEE4;
 Fri, 28 Mar 2025 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743159897;
 bh=xbBDfvoHPjXsPnxNu0jxmSFBxISJDceHastTCXhL2kc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ivHQ7WQYt1VuHpHJC9cXlvdRdOhAgT601+jK+EGF5l4TBolYFwCI9NqYaigOuFI8P
 tZQh4Id0h13lrj1eR391xAs70u+0P6zn5i7hQiP/orWRsswHUTHyvRGAP7lDctFqfR
 SBF2hexsW0xIlgqR3n6RZreHWc0pZ6xHqR3cYH9D9M5ZORD1wFPR8SLjkzZTFCQAsD
 zX5rfTRLmVA763iXDy0w4/HUBj7jl/CpEXlko4Qts4kd134s2tV6k/vD+oeHIaBl6T
 qP2qy1FdL2shCIXKtYYKClwQHjSQHR0BmY4We1J4zQFichEI/CVY8yOyAdz3EKPARX
 P9tGDxFrSHqEw==
Date: Fri, 28 Mar 2025 12:04:53 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: M Henning <mhenning@darkrefraction.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
Message-ID: <Z-aCVZYcEkxJHBle@pollux>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com>
 <Z9x0NLY6HHsvxOFD@pollux>
 <CAAgWFh1VzRnt9QdCR9xOVhar7vEYAGPBcMHfqXGq_QHm0A6H8Q@mail.gmail.com>
 <Z-VK8eeA_7BURiBy@cassiopeiae>
 <CAAgWFh1yGZkEi+Fr9htOp+iXJjLo6Q1B+rszKKAcxgw4Y0D1RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAgWFh1yGZkEi+Fr9htOp+iXJjLo6Q1B+rszKKAcxgw4Y0D1RQ@mail.gmail.com>
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

On Thu, Mar 27, 2025 at 02:26:09PM -0400, M Henning wrote:
> On Thu, Mar 27, 2025 at 8:56 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Tue, Mar 25, 2025 at 07:40:56PM -0400, M Henning wrote:
> > > Okay, that sounds reasonable since I don't expect this to change very quickly.
> > >
> > > Since I don't fully understand, is the suggestion here to:
> > > 1) add the interface as a function on nvkm_gr using the nvkm_gr_func
> > > vtable and store the actual data on r535_gr
> > > or
> > > 2) add the interface to NVIF (which IF?) and store the actual data on nvkm_gr
> > > ?
> >
> > I think we want both.
> >
> > 1) I think the suggestion was to store the data directly in nvkm_gr, however the
> >    structure is indeed specific to r535, so I think, unfortunately, we need the
> >    vtable and store that data in r535_gr.
> 
> Well, NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS is r535-specific, but we
> need to convert it into a common structure and combine it with info
> from NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES at some point, so
> I think it makes sense to do that conversion+combination before
> storing it on any structure. In that case, maybe we store the
> structure on nvkm_gr directly during r535_gr_oneinit and then the call
> to get the info only goes through NVIF?

Sounds good to me! It means you need an intermediate structure though, we should
avoid using uAPI structures in NVKM code.
