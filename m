Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C43F694F0C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 19:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEB710E676;
	Mon, 13 Feb 2023 18:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0611D10E676
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 18:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676312218; x=1707848218;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J4niuSN8gIklKAAL55qUfOPn4HVxFfv9JXS4kugTmWw=;
 b=PZGkXoVj2iAt9sPzdWLoSbf13MEupdL/jy+4cEssO6C0XlOeipUsZqae
 RC3EQWBcjDE3S/aYi0rdI1xKgJSpbChhZ3bDd7sngGPIm5slIFBixSHmf
 BUL6j4mi7vtZUjE3l7U3yKeGmELWFmk5O/AnTO5n3WySjR6xcViDFYNFH
 lTjvufq2aTh/AFrcXLsPocTsALZaSgXWCUnTLxfRhP2rT1TRLMCIRlhgC
 KDqnpJFTM4vy5V3nDMuZVyC8uOJVMVbu9jWcMTpAAUNvTUztZtk8sEATe
 D6H7UVYlZcZwtUboR53EWp33qpsRX1V5pYW5NjLatadTl/L8BGNjI0D+3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="314598942"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="314598942"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 10:16:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="842859181"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="842859181"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 10:16:53 -0800
Date: Mon, 13 Feb 2023 19:16:51 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: Try to address the drm_debugfs issues
Message-ID: <20230213181651.GA2822143@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
 <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
 <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 maxime@cerno.tech, daniel.vetter@ffwll.ch, wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 09, 2023 at 10:06:25AM -0300, Maíra Canal wrote:
> > > [    3.872026] debugfs: File 'v3d_ident' in directory '0' already present!
> > > [    3.872064] debugfs: File 'v3d_ident' in directory '128' already present!
> > > [    3.872078] debugfs: File 'v3d_regs' in directory '0' already present!
> > > [    3.872087] debugfs: File 'v3d_regs' in directory '128' already present!
> > > [    3.872097] debugfs: File 'measure_clock' in directory '0' already present!
> > > [    3.872105] debugfs: File 'measure_clock' in directory '128' already present!
> > > [    3.872116] debugfs: File 'bo_stats' in directory '0' already present!
> > > [    3.872124] debugfs: File 'bo_stats' in directory '128' already present!
> > > 
> > > It looks like the render node is being added twice, since this doesn't happen
> > > for vc4 and vkms.
> > 
> > Thanks for the feedback and yes that's exactly what I meant with that I haven't looked into all code paths.
> > 
> > Could it be that v3d registers it's debugfs files from the debugfs_init callback?
> 
> Although this is true, I'm not sure if this is the reason why the files are
> being registered twice, as this doesn't happen to vc4, and it also uses the
> debugfs_init callback. I believe it is somewhat related to the fact that
> v3d is the primary node and the render node.

Yes, this seems to be because ->debugfs_init = v3d_debugfs_init() uses
drm_debugfs_add_files() which create files for both primary and render.
And ->debugfs_init is called via drm_minor_register() also for both
when registering. 

Probably need to change debugfs_init callback to create files just
for one minor. And if we don't want to use minor pointer directly in
drivers, the callback can take debugfs dir as argument.

Regards
Stanislaw
