Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424B8AEBCC9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 18:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03B010EA69;
	Fri, 27 Jun 2025 16:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKGVFeqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE7610EA69
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751040287; x=1782576287;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xPYDyj7xWN369t4x7isU437SGu5GsibK1/RBPBB/oSc=;
 b=FKGVFeqdjhEQTMdixz/Qyi2wRfuikODRl6jQgf8uoLQDIVsVdld8gyiX
 b1EO+eCy+uM1qpAVJl57E5jHZauXGNSeESxnxLAQ5p8Fw5sADvxU9utsG
 z8gdmtyx8CRLw3femdB6kUj19EoznTNoRvTSvDNSmSFK0Y08c5jY4YrOb
 PmGtW7xqvWJSUD8FKhh2qdmpieo8vrmIN0NgLimVHbW54jju+Ehw1I6Vj
 hvG2hOySr8ZzktBBlrEpMv57liBQfvLAVB/+3n46qARmKy9v4C5cxzq3f
 0S9wmKlTGAHfTjBZ13bqCdB5bvM/yzpK2DWj4kL2gsvsGthUY01YFjv3g w==;
X-CSE-ConnectionGUID: sQmNvo6eTWGiv9m6XgrLVw==
X-CSE-MsgGUID: QD0rq1P5QJeoVlKW70SzOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="63613805"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="63613805"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:04:47 -0700
X-CSE-ConnectionGUID: OvnJtt+2TcmmCTIMjRCc5w==
X-CSE-MsgGUID: 828QG1DbQBOaYEi75Y8M+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="157380268"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:04:44 -0700
Date: Fri, 27 Jun 2025 19:04:40 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 airlied@gmail.com, simona@ffwll.ch,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v2 2/2] drm: Add missing struct drm_wedge_task_info
 kernel doc
Message-ID: <aF7BGBE1Gf7vBHDC@black.fi.intel.com>
References: <20250619140655.2468014-1-andrealmeid@igalia.com>
 <20250619140655.2468014-2-andrealmeid@igalia.com>
 <aF6WpMe9Ar8jmXOX@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aF6WpMe9Ar8jmXOX@black.fi.intel.com>
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

On Fri, Jun 27, 2025 at 04:03:32PM +0300, Raag Jadav wrote:
> On Thu, Jun 19, 2025 at 11:06:55AM -0300, André Almeida wrote:
> > Fix the following kernel doc warning:
> > 
> > include/drm/drm_device.h:40: warning: Function parameter or struct member 'pid' not described in 'drm_wedge_task_info'
> > include/drm/drm_device.h:40: warning: Function parameter or struct member 'comm' not described in 'drm_wedge_task_info'
> > 
> > Fixes: 183bccafa176 ("drm: Create a task info option for wedge events")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > ---
> > v2: Add Reported-by tag
> > ---
> >  include/drm/drm_device.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index 08b3b2467c4c..aae0800ccef1 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -33,6 +33,8 @@ struct pci_controller;
> >  
> >  /**
> >   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> > + * @pid:	the pid of the task
> > + * @comm:	the command name of the task
> 
> Redundant tabs. A whitespace is ususally good enough for docs.

Also, let's be consistent with struct drm_device for member description.

Raag

> >   */
> >  struct drm_wedge_task_info {
> >  	pid_t pid;
> > -- 
> > 2.49.0
> > 
