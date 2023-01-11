Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFA4665ED8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC3310E2BB;
	Wed, 11 Jan 2023 15:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1538C10E2B7;
 Wed, 11 Jan 2023 15:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673450164; bh=YNrKjl0vmk6HeouqfJhW2pIt2UMY1ihv0siZV1VSDW4=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=QzmGV9ST6Tx/JWgXbB8PKWucyMsszLwRU2XvicoXikQH70DCNTBrUiYlYAtoJVIrB
 OC9S6jkF81gEanWwMdznW0t3Ytl9jGtpTwlEcUN4WKMEIy14UTcfH4GteaXNZSt0hJ
 WmUq/2yjh2K+vmlKWRQO8otcvZTACrCSMdSXjL+s=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Wed, 11 Jan 2023 16:16:04 +0100 (CET)
X-EA-Auth: o5gHe/4cJ51Rp5I5pe1ZiHmrLwLGpoGjvlDg5k9FZ2Oo6L8x+3udqTkDD+PZMVM85Ohmp16ZF4lftHRYojd0ulsezvjfq+jV
Date: Wed, 11 Jan 2023 20:46:00 +0530
From: Deepak R Varma <drv@mailo.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Avoid full proxy f_ops for vgpu_status
 debug attributes
Message-ID: <Y77SsDGaZ8+BjXel@ubun2204.myguest.virtualbox.org>
References: <cover.1673375066.git.drv@mailo.com>
 <188df08e0feba0cda2c92145f513dd4e57c6e6cf.1673375066.git.drv@mailo.com>
 <Y72zVXYLVHXuyK05@intel.com> <Y76JGj0cJpYr6/rv@intel.com>
 <Y77NfeKbLL4s/Ibg@ubun2204.myguest.virtualbox.org>
 <Y77O+0uGm1GRZnZd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y77O+0uGm1GRZnZd@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gfx@lists.freedesktop.org, Saurabh Singh Sengar <ssengar@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 10:00:11AM -0500, Rodrigo Vivi wrote:
> > > Actually, could you please address the checkpatch issues before we can push?
> > > Sorry about that, but just noticed now when I was going to push the other ones.
> > 
> > Hello Rodrigo,
> > The checkpatch warning is associated with the long "make coccicheck ..." command
> > in the commit message. It is not part of the code, so is should not be carried
> > forward into the code base.
> > If you still want me to correct it, I will need to split it into two lines which
> > I think still violates the commit description guidelines.
> 
> This part I would just ignore or fix myself while merging. But the next one about
> the parenthesis alignment need to be fixed in the code so we need another version.
> Since we try to avoid touching the code between CI and merge.

I am sorry, but I am unable to locate the "second checkpatch complaint" you are
referring to. I have received only the following from the checkpatch robot:

== Summary ==

Error: dim checkpatch failed
4c95e9b71212 drm/i915/gvt: Avoid full proxy f_ops for scan_nonprivbb debug attributes
-:21: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#21:
make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
33d68a01cad3 drm/i915/gvt: Avoid full proxy f_ops for vgpu_status debug attributes
-:21: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#21:
make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

total: 0 errors, 1 warnings, 0 checks, 18 lines checked

===============================

> 
> Then, since you need to change that, while changing that, also please break
> the coccinelle line in the commit msg.
> 
> I'd appreciate to have the patch for the pxp as well :)

Sure. As mentioned in the other thread, I am looking into it and would submit a
patch accordingly.

Thank you,
./drv

> 
> Thanks a lot,
> Rodrigo.
> 
> 
> > 
> > Let me know what you think.
> > 
> > Thank you,
> > ./drv
> > 
> > > 
> > > > 
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gvt/debugfs.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > index 03f081c3d9a4..baccbf1761b7 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > @@ -165,7 +165,7 @@ static int vgpu_status_get(void *data, u64 *val)
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > -DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > > > +DEFINE_DEBUGFS_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > > >  
> > > > >  /**
> > > > >   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
> > > > > @@ -182,8 +182,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
> > > > >  			    &vgpu_mmio_diff_fops);
> > > > >  	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> > > > >  				   &vgpu_scan_nonprivbb_fops);
> > > > > -	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
> > > > > -			    &vgpu_status_fops);
> > > > > +	debugfs_create_file_unsafe("status", 0644, vgpu->debugfs, vgpu,
> > > > > +				   &vgpu_status_fops);
> > > > >  }
> > > > >  
> > > > >  /**
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > > 
> > > > > 
> > 
> > 


