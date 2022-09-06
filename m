Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058895AF4D6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C17710EA6E;
	Tue,  6 Sep 2022 19:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303FD10EA65;
 Tue,  6 Sep 2022 19:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662493957; x=1694029957;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXh+N8yFDnZSCWq7iaCGkV9oRPhO8WRuXHEx8NhlGzY=;
 b=kuSSo0H9mnkkvMCozJPwPSyShICCeHb6jcHqx1zpQx1IR/YxjVkH2FTG
 eYrvmA/l7o9LcADVXh7Zz/xuR68S2961yPAVOykIe8UwCFec3JH5bAcwH
 lmMWSSiTQO6TvzaGj+yNYnX/WsMLGiY4EH1aWwbnpiEl7QOu3GfVlDyu0
 l5/9vJN+96Mgi4mGG7EhXuqFgio94qkAMQwSI+EspF1WwBFUoUX7i5bTO
 i0eYonJbpcxCm0pZSXD18mqmx4BxBaUAPpYKTS7b0Hy/BRj/hb34Poeq6
 CrI95VNhpXQH5u5G3WMfE+Xba2WA0IKeXfPb2ONHE76dsCoC0MBZDv5vg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="382987128"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="382987128"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 12:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="614216271"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 06 Sep 2022 12:52:35 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.44.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DBFA3580583;
 Tue,  6 Sep 2022 12:52:32 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:35:18 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 30/39] docs: gpu: i915.rst: gt: add more
 kernel-doc markups
Message-ID: <20220906213509.6093e904@maurocar-mobl2>
In-Reply-To: <YvIwkaYRbrd5+vtj@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <d7d1f6d6516eb3a82041af1d5f40c2f550de40db.1657699522.git.mchehab@kernel.org>
 <YvIwkaYRbrd5+vtj@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Aug 2022 06:01:53 -0400
Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:

> On Wed, Jul 13, 2022 at 09:12:18AM +0100, Mauro Carvalho Chehab wrote:
> > There are several documented GT kAPI that aren't currently part
> > of the docs. Add them, as this allows identifying issues with
> > badly-formatted tags.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> > 
> > To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> > 
> >  Documentation/gpu/i915.rst | 43 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 42 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> > index 2ad7941a79f2..afd8c0e3c689 100644
> > --- a/Documentation/gpu/i915.rst
> > +++ b/Documentation/gpu/i915.rst
> > @@ -149,7 +149,6 @@ Misc display functions
> >  
> >  .. kernel-doc:: drivers/gpu/drm/i915/display/skl_scaler.c
> >  
> > -
> >  Plane Configuration
> >  -------------------
> >  
> > @@ -308,6 +307,48 @@ Multicast/Replicated (MCR) Registers
> >  .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> >     :internal:
> >  
> > +GT engine
> > +---------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_types.h
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > +
> > +GT context
> > +----------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_context.h  
> 
> why does the context deserves a separated section and the
> many others below no?

Good question. The patches adding stuff to i915.rst are the
hardest ones to produce, in the sense that it is not easy to have
a common criteria about when creating or not a new section.

I tried to follow the same as other things for the same type, but
it is hard to classify.

The main point is that they should be somewhere there, in order to start
producing errors when building the docs. Reorganizing those markups should
be easily done once all files with kernel-docs gets added there.

Anyway, I'll keep this under:

	Other GT functionality

Section. We can shift things later on as needed.

> > +
> > +Graphics Translation Tables
> > +---------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_ggtt.c
> > +
> > +Other GT functionality
> > +----------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gsc.h
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gtt.c
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gtt.h  
> 
> Why aren't these gtt ones in the above block? why only
> having the global gtt there?

Makes sense. I'll place GTT together with GGTT.

> 
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_migrate.c
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_mocs.h
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rc6.c
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_reset.c
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rps_types.h
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rps.c
> > +
> > +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_sseu.c
> > +
> >  Memory Management and Command Submission
> >  ========================================
> >  
> > -- 
> > 2.36.1
> >   
