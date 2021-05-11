Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66EA37AA5E
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 17:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381846E0AF;
	Tue, 11 May 2021 15:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E496EA59
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 15:13:01 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a4so30342512ejk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 08:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ik4fQq3wXEcE9WqYP+rg+5V8mDoz7waC0/PsoWo+xXs=;
 b=E/9T4Zp3wM0DxziXJ9XmZvnNb0x2kfhPzNIfNyIHD7LowB2GbvB323jq677MXWJJQ1
 RWzzGBcyL9YL8GHpTFrxx2Mqez7PgXifmXco+Yc1ft8aqhxxri7O7npkISLUGLnFN2+p
 pJrHE49dsWnffpdqVSC+vcwKJHqUG1WYox9M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ik4fQq3wXEcE9WqYP+rg+5V8mDoz7waC0/PsoWo+xXs=;
 b=jfOTyKYTt6S3mEOKCFWokEMC7l6Rggg18GKdAtsW7jwaP5zIpbgcDEVnqFzKbg3sc+
 23/LTHA+iG1BSQfe+TsOdIv+JdAgMZPSm4Faxs3TDMPAlnXCbDb4aSwHubmXMS10XQ/K
 u29upTXphnuPlyOEpXpAO9Vjh02C6sDkwZjmlDtiUizg3wy61ilyXlGc+cyuDOlT7Ri4
 vi+qWawaNXYoV4FSjhNHukShrWJw1u/pP3+8kbCuhIyrZsbBW2O3zc6DaKMW0f37Tdd1
 3deviPgrp+5vgaGLArvUTPgAYZiSqajX9lSWUIOaSzZT3G9fHZnVSUo8f6NE0p0KMdb7
 NJEA==
X-Gm-Message-State: AOAM531yXKstfYoV6RPV6+bs1PNBbxxvaM8D+W92OlCmGzrFhQkRdkg8
 kmOchlgh8xXTif4wAe0nI4gceA==
X-Google-Smtp-Source: ABdhPJwIFlY/J1RVv7s5hxxaaLromAN0smhld1zIbXQWTkPSxyF7s7+79pHBOfVeGgj0xIBcZ7awVA==
X-Received: by 2002:a17:906:a88f:: with SMTP id
 ha15mr10374074ejb.246.1620745980588; 
 Tue, 11 May 2021 08:13:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id di7sm524007edb.34.2021.05.11.08.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:13:00 -0700 (PDT)
Date: Tue, 11 May 2021 17:12:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [Intel-gfx] [RFC PATCH 1/5] drm/doc/rfc: i915 GuC submission /
 DRM scheduler integration plan
Message-ID: <YJqe+tMPyQlFyXHM@phenom.ffwll.local>
References: <20210506173049.72503-1-matthew.brost@intel.com>
 <20210506173049.72503-2-matthew.brost@intel.com>
 <YJqV5rzTCRNKwPf1@phenom.ffwll.local>
 <CAPj87rOdCJMXmCXL9VoJcqvHKWQjLKnwqZ=F=wZ9knGC_8QSNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rOdCJMXmCXL9VoJcqvHKWQjLKnwqZ=F=wZ9knGC_8QSNQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, carl.zhang@intel.com,
 Jason Ekstrand <jason.ekstrand@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 03:58:43PM +0100, Daniel Stone wrote:
> Hi,
> 
> On Tue, 11 May 2021 at 15:34, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, May 06, 2021 at 10:30:45AM -0700, Matthew Brost wrote:
> > > +No major changes are required to the uAPI for basic GuC submission. The only
> > > +change is a new scheduler attribute: I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP.
> > > +This attribute indicates the 2k i915 user priority levels are statically mapped
> > > +into 3 levels as follows:
> > > +
> > > +* -1k to -1 Low priority
> > > +* 0 Medium priority
> > > +* 1 to 1k High priority
> > > +
> > > +This is needed because the GuC only has 4 priority bands. The highest priority
> > > +band is reserved with the kernel. This aligns with the DRM scheduler priority
> > > +levels too.
> >
> > Please Cc: mesa and get an ack from Jason Ekstrand or Ken Graunke on this,
> > just to be sure.
> 
> A reference to the actual specs this targets would help. I don't have
> oneAPI to hand if it's relevant, but the two in graphics world are
> https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context_priority.txt
> and https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/chap5.html#devsandqueues-priority
> - both of them pretty much say that the implementation may do anything
> or nothing at all, so this isn't a problem for spec conformance, only
> a matter of user priority (sorry).

Good point, Matt please also include the level0 spec here (aside from
egl/vk extensions). Might need to ping Michal Mrozek internally and cc:
him on this one here too.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
