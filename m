Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9572F962246
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 10:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09C710E4DA;
	Wed, 28 Aug 2024 08:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="PC22ZiWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D4310E4DA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:25:01 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724833488; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=C5TgH6Po65HEXc6einX4yEVx062T4x2kOD2wuZzWncGhyIo2feil2zRmkZ1kvSY3rKGqktC3estaoFHQyoyrkay+P0ze6hUvYNVjYaa7WE2aCMivIiMERqM1Xtl+/zgVM7L3rw+God5qLwkV94nBIUXeoxmh8aSnbB0kalE2WWE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724833488;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=T2HtZOq/Dm024xV1xLGCEztRUtVIMeJSGLIxvADeSC0=; 
 b=mrdasLoch9ZzSpsTZCjo9KIEjjxK19PDmGbV3yPhK+pdJC9x9eUHQOWPwRE/VTYDFyjJSEqvQt6QranIjVbX1vccsV12GSapbxe6chEnyyymA2VNMAXu8je5cbtnrg0JqTsjshLUYU3k0HdBkPVqldYY8JVdcCCI7f0XkvfjcR4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724833488; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=T2HtZOq/Dm024xV1xLGCEztRUtVIMeJSGLIxvADeSC0=;
 b=PC22ZiWOXh1MRC9tycKIT5D3R1m5ij291pO6gPpCEkFdU2x5PfiOli1SIRGeiFsq
 ENi83FuSZ953ELrgP4iDlNUXWij+xwo5oUwoqYxbaY69jtspHJDe3XCSsLHuwQFM3j4
 qocwMSO7QDGJcxnIybDkC77J16d5PADDcZibi4eE=
Received: by mx.zohomail.com with SMTPS id 1724833486164592.3014591788459;
 Wed, 28 Aug 2024 01:24:46 -0700 (PDT)
Date: Wed, 28 Aug 2024 10:24:40 +0200
From: Mary Guillemard <mary.guillemard@collabora.com>
To: Mihail Atanassov <mihail.atanassov@arm.com>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nd@arm.com
Subject: Re: [PATCH v3] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
Message-ID: <Zs7d2-NHTy-A_oLL@kuroko.kudu-justice.ts.net>
References: <20240819112508.67988-2-mary.guillemard@collabora.com>
 <4538ba23-ee8b-4e15-8857-d653d581bc18@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4538ba23-ee8b-4e15-8857-d653d581bc18@arm.com>
X-ZohoMailClient: External
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

Hi Mihail,

On Mon, Aug 19, 2024 at 03:25:48PM +0100, Mihail Atanassov wrote:
> > diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> > index 926b1deb1116..944f5618aa05 100644
> > --- a/include/uapi/drm/panthor_drm.h
> > +++ b/include/uapi/drm/panthor_drm.h
> > @@ -260,6 +260,9 @@ enum drm_panthor_dev_query_type {
> >   	/** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface information. */
> >   	DRM_PANTHOR_DEV_QUERY_CSIF_INFO,
> > +
> > +	/** @DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO: Query timestamp information. */
> > +	DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO,
> >   };
> >   /**
> > @@ -377,6 +380,22 @@ struct drm_panthor_csif_info {
> >   	__u32 pad;
> >   };
> > +/**
> > + * struct drm_panthor_timestamp_info - Timestamp information
> > + *
> > + * Structure grouping all queryable information relating to the GPU timestamp.
> > + */
> > +struct drm_panthor_timestamp_info {
> > +	/** @timestamp_frequency: The frequency of the timestamp timer. */
> > +	__u64 timestamp_frequency;
> > +
> > +	/** @current_timestamp: The current timestamp. */
> > +	__u64 current_timestamp;
> > +
> > +	/** @timestamp_offset: The offset of the timestamp timer. */
> > +	__u64 timestamp_offset;
> 
> Are you sure you don't want the cntvct_el0 and cntfrq_el0 values here, too,
> as separate fields? While they're not values coming from the GPU, they are
> related. Getting the lowest delta possible between querying one timestamp
> register and the other is quite useful for tooling. Requiring userspace to
> do two separate queries, one for CPU time and one for GPU time, doesn't feel
> optimal, your max deviation will necessarily be higher that way.
>

Exposing arch dependent values in the uapi feels wrong to me too but
maybe that could be done with just the cpu timestamp with a frequency of
1 on other platform if needed?

In any cases, I think that if we ever need it we can extend this query
with more values. (as we are retrocompatible thanks to PANTHOR_UOBJ_SET)

--
Mary

 
