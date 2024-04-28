Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98438B4EA2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 00:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B17112A55;
	Sun, 28 Apr 2024 22:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NXgppMad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B98E112A55
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 22:36:53 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41b5dd5af48so26666115e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 15:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714343812; x=1714948612; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UKYx+oWNKFvba+FkqjDcxw7eUfXCIKcYAEx9pzsmkH0=;
 b=NXgppMadog7mFrKISFPMyRltO2O4qyWaqSYoOYlB1LjQ2uWehK2pxcFyINLmiYrXEz
 sFHU4bq8f8wlQm+z+KLaj088v4QX/ASKj555xC2D9SCQZMVULlIlb95vtDjf7zuNAFwK
 UcP4+RI/pgjkpGZDwMpfWkPtWhksfC5MpJ3Sqf5RHs2PycxzEVmRkj/JIU/Wmk5hHTF1
 z0jp+9IiUVPY7FFKLp6TrJ9n0g9pNVIHLnCob0vuqZ96VmZlSYMj2WxBs2uZFG8tsTFB
 rtRJczoFckTCrjjbpuMpfQiC174yZytKxKgFWN0WSTcqS5JmnYfdhAZUxEoqdFs4/Mjh
 QlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714343812; x=1714948612;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKYx+oWNKFvba+FkqjDcxw7eUfXCIKcYAEx9pzsmkH0=;
 b=mAe+Ubi87rpgnzPwPKfi/3ZjR4BRPpyE22/Khz2/N4lCB4S/1k7kRfnkEtb5tW5dty
 ZqilWlJf2g0u67P5ZFLMF/DyJhm8UhbV7fxYu4EPhBVW6NnUhkkKfgU24Y0Dytq3mQTv
 y8pWD2G5DrLbVhTc4K4tNP9hoEu8coudz0SUpL8bdInaNTWcEdR7BSSpc4ew1+kglvBt
 9q9nA4z/6MqQGfhiGf9hTfYB6h8dQCHxwkSvgYIA4Xs5IEYcQtJYd1TGujogOMofrsAi
 LFk2EG21/ZFCc23mTgLByrYQFcjnxNbpFl9EPPZY2xidcB7hFIAUfDiSKfAZo4kfnqh8
 1xQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfbGJAOVOt8PTB5xR3fecCIVGu2kFiFo3nqvz7xSSbyBwUSq5RvWHRk6j65XucOYXDEJampvjtJcQJMs1BKu3dY3PR46wGjkiepTapKXWb
X-Gm-Message-State: AOJu0YxkKYNELY+u6xKhYoIFa8SJ3VY/iqwdX1haoeTN8Mhncgd8Aeli
 vhdwX7/EE+5WqSfTcqoeRFMh11y4KSIgqWU0fGWOj/hYAe4uaW8e
X-Google-Smtp-Source: AGHT+IHWbeqF6rpVr6YcpYOuodyKpdSccQX6Ap+he1yUQz9M3z2grcMRRxdq2zrCxtPQyQo+/WTDmA==
X-Received: by 2002:a05:600c:4f08:b0:419:f3f9:8ed6 with SMTP id
 l8-20020a05600c4f0800b00419f3f98ed6mr6579236wmq.4.1714343811435; 
 Sun, 28 Apr 2024 15:36:51 -0700 (PDT)
Received: from debian.local (80-44-68-74.dynamic.dsl.as9105.com. [80.44.68.74])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c45c800b0041be9cb540esm6038632wmo.18.2024.04.28.15.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 15:36:51 -0700 (PDT)
Date: Sun, 28 Apr 2024 23:36:48 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: Jeff Layton <jlayton@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wayne.Lin@amd.com,
 alexdeucher@gmail.com, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: use mgr->dev in drm_dbg_kms in
 drm_dp_add_payload_part2
Message-ID: <Zi7PgLmTp5lJWS91@debian.local>
References: <20230419112447.18471-1-jlayton@kernel.org>
 <d0b9654c756069a6f0edcca6f4d410f7af592784.camel@redhat.com>
 <4400e47d6555ed773d1e9cab5566c03429d43ae9.camel@kernel.org>
 <dd8edd9405049b09cd30ea13e5ae5562a437a2d3.camel@redhat.com>
 <3d47da79a59817b69d5ed7cdaf4fbec227be00d9.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d47da79a59817b69d5ed7cdaf4fbec227be00d9.camel@redhat.com>
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

On Tue, Jun 20, 2023 at 03:59:24PM -0400, Lyude Paul wrote:
> Also since I forgot, so patchwork picks this up:
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> On Tue, 2023-06-20 at 15:50 -0400, Lyude Paul wrote:
> > Eek - this might have been a situation where everyone involved assumed someone
> > else would push it, whoops. I'll make sure this is pushed upstream :).
> > 
> > FWIW: You could definitely send an MR to the fedora kernel's gitlab to get
> > this included earlier. If you don't get to it before me I'll try to do that
> > today
> > 
> > On Tue, 2023-06-20 at 07:18 -0400, Jeff Layton wrote:
> > > I've noticed that this patch is not included in linux-next currently.
> > > 
> > > Can I get some confirmation that this is going to be included in v6.5?
> > > Currently, I've been having to rebuild Fedora kernels to avoid this
> > > panic, and I'd like to know there is a light at the end of that tunnel.
> > > 
> > > Thanks,
> > > Jeff
> > > 
> > > On Wed, 2023-04-19 at 16:54 -0400, Lyude Paul wrote:
> > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > 
> > > > Thanks!
> > > > 
> > > > On Wed, 2023-04-19 at 07:24 -0400, Jeff Layton wrote:
> > > > > I've been experiencing some intermittent crashes down in the display
> > > > > driver code. The symptoms are ususally a line like this in dmesg:
> > > > > 
> > > > >     amdgpu 0000:30:00.0: [drm] Failed to create MST payload for port 000000006d3a3885: -5
> > > > > 
> > > > > ...followed by an Oops due to a NULL pointer dereference.
> > > > > 
> > > > > Switch to using mgr->dev instead of state->dev since "state" can be
> > > > > NULL in some cases.
> > > > > 
> > > > > Link: https://bugzilla.redhat.com/show_bug.cgi?id=2184855
> > > > > Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> > > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > > > ---
> > > > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > I've been running this patch for a couple of days, but the problem
> > > > > hasn't occurred again as of yet. It seems sane though as long as we can
> > > > > assume that mgr->dev will be valid even when "state" is a NULL pointer.
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > index 38dab76ae69e..e2e21ce79510 100644
> > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > @@ -3404,7 +3404,7 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
> > > > >  
> > > > >  	/* Skip failed payloads */
> > > > >  	if (payload->vc_start_slot == -1) {
> > > > > -		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
> > > > > +		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
> > > > >  			    payload->port->connector->name);
> > > > >  		return -EIO;
> > > > >  	}
> > > > 
> > > 
> > 
> 
> -- 
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
> 

Hello, this patch regressed in Wayne's 5aa1dfcdf0a42 commit:

$ git show 5aa1dfcdf0a42 | grep -A6 'Skip failed payloads'
 	/* Skip failed payloads */
-	if (payload->vc_start_slot == -1) {
-		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
+	if (payload->payload_allocation_status != DRM_DP_MST_PAYLOAD_ALLOCATION_DFP) {
+		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
 			    payload->port->connector->name);
 		return -EIO;

$ git tag --contains 5aa1dfcdf0a42
v6.7
v6.7-rc1
v6.7-rc2
v6.7-rc3
v6.7-rc4
v6.7-rc5
v6.7-rc6
v6.7-rc7
v6.7-rc8
v6.7.1
v6.7.10
v6.7.11
v6.7.12
v6.7.2
v6.7.3
v6.7.4
v6.7.5
v6.7.6
v6.7.7
v6.7.8
v6.7.9
v6.8
v6.8-rc1
v6.8-rc2
v6.8-rc3
v6.8-rc4
v6.8-rc5
v6.8-rc6
v6.8-rc7
v6.8.1
v6.8.2
v6.8.3
v6.8.4
v6.8.5
v6.8.6
v6.8.7
v6.8.8
v6.9-rc1
v6.9-rc2
v6.9-rc3
v6.9-rc4
v6.9-rc5
