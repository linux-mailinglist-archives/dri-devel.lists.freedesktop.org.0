Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9F667012
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CD410E16A;
	Thu, 12 Jan 2023 10:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D912D10E16A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 10:45:27 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id az20so24637818ejc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 02:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cuzTzZ03P0QGmVspRx2p0C6lFbbSqqGjjFFgXbBZyTk=;
 b=Av9Eoi77hR6xQa46QqVS/pLdPS7NFfiyL6m+kPkbxCWJgOGkUIfQpulSv2NDENvTOp
 xSgGhk66Me/WHWUiIDP8ub7PscD9WaO8Dvot2UKxn7WhYl12rVdvi7+VHlIOi/Lxby24
 VtkJWQcfZmqsiS0OHhiR94bs8IEvoNBryi4TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cuzTzZ03P0QGmVspRx2p0C6lFbbSqqGjjFFgXbBZyTk=;
 b=kj9cg6GfZpPZlttSUZVKU3xEq58jtVMwe4XRXwdUv1E8hLxT5qAvS9sZHtz+qiXNWg
 YhEwR1Ycp2X8Rm+1uKXeX0HG30/O6gDfy+wIpsM4d3mCRImxOlrbOUKgaiG+I9BiFxne
 yEnZL7iMZOC7N+pE2+dZ9i5jTeDqTjbaIOFFro7RPVUthr2NRxhDwUZuTDbij0NiAIhf
 flBVCWHlPLV+lZRI6DUSPGc6WHmtvwRy0NrWBBN44CoYlnbyOVW/nF33x5qb9yYlwL+O
 S+Bumg2pxlsvyUoL8JwBFUhAXOXB6d5VN8N/56qtkP9vGjAv/2uh2UEASUDmH1KOTv6E
 ojag==
X-Gm-Message-State: AFqh2koXvkbhb7GO72XoySRhbbx53lQ9pk3MKF5ikJHGlvEVBc9PwGOX
 3/JjjxuJzf1T/ld0+46QXWNnNw==
X-Google-Smtp-Source: AMrXdXu1mYlFlCMCkAkoySt3WvN7dwwpzURynpb0OiqDp1kO1A9YaHV07fyU074WwIyQCcsrCf0JhA==
X-Received: by 2002:a17:906:6d47:b0:7c1:311f:3533 with SMTP id
 a7-20020a1709066d4700b007c1311f3533mr60140576ejt.60.1673520326387; 
 Thu, 12 Jan 2023 02:45:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170906308b00b007c0f217aadbsm7209578ejv.24.2023.01.12.02.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 02:45:25 -0800 (PST)
Date: Thu, 12 Jan 2023 11:45:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/11] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Message-ID: <Y7/kw+JdGCHJdptI@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-2-daniel.vetter@ffwll.ch>
 <bad82927-1c58-4c2a-c265-571e10d1f67d@suse.de>
 <Y7/Z5dvADG6AspV3@phenom.ffwll.local>
 <8a154783-b433-c9b8-bfe5-286dde1258e9@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a154783-b433-c9b8-bfe5-286dde1258e9@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 11:24:13AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.01.23 um 10:59 schrieb Daniel Vetter:
> > On Thu, Jan 12, 2023 at 10:04:48AM +0100, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 11.01.23 um 16:41 schrieb Daniel Vetter:
> > > > This one nukes all framebuffers, which is a bit much. In reality
> > > > gma500 is igpu and never shipped with anything discrete, so there should
> > > > not be any difference.
> > > > 
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/gma500/psb_drv.c | 2 +-
> > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> > > > index cd9c73f5a64a..9b0daf90dc50 100644
> > > > --- a/drivers/gpu/drm/gma500/psb_drv.c
> > > > +++ b/drivers/gpu/drm/gma500/psb_drv.c
> > > > @@ -429,7 +429,7 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > > >    	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
> > > >    	 *       might be able to read the framebuffer range from the device.
> > > >    	 */
> > > > -	ret = drm_aperture_remove_framebuffers(true, &driver);
> > > > +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
> > > 
> > > This does not work. The comment just above the changed line explains why.
> > > The device uses shared memory similar to other integrated Intel chips. The
> > > console is somewhere in a 16 MiB range, which has been stolen by the BIOS
> > > from main memory. There's only a 1 MiB memory range on the device to program
> > > the device. Unless you want to refactor as described, this call has to cover
> > > the whole memory for now.
> > 
> > Uh. So it's maybe not so pretty, but what if I just call both functions?
> 
> That's ways more ugly IMHO.
> 
> > That way we get the vga handling through the pci one, and the "make sure
> > there's no fb left" through the other one. Plus comment of course.
> > 
> > Otherwise we'd need to somehow keep the vga stuff in the non-pci paths,
> > and that just feels all kinds of wrong to me.
> 
> With your patch applied, aperture_detach_devices() does all the work of
> removing. I'd add the following internal functions:
> 
> static void aperture_detach_head(bool is_primary)
> {
> 	/*
> 	 * lengthy comment here
> 	 */
> 	if (is_primary)
> 		sysfb_disable()
> }
> 
> static void aperture_detach_tail(bool remove_vga)
> {
> 	if (remove_vga) {
> 		aperture_detach_devices(VGA_PHYS_)
> 		vga_remove_vgacon()
> 	}
> }
> 
> And call both of them at the beginning/end of
> aperture_remove_conflicting_devices() and
> aperture_remove_conflicting_pci_devices().
> 
> You'd still need to primary argument to
> aperture_remove_conflicting_devices(), but there will be no code duplication
> with the aperture helpers and the purpose of each code fragment will be
> clearer.

Yeah I don't want the primary argument. Aside from this one case here it's
not needed. Also by pushing this special case into the one driver that
needs it we keep it contained, instead of spreading it all around.
Inflicting a parameter on every (and in total we have a lot of callers of
this stuff) just because of gma500 does not seem like a good idea to me.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
