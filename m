Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3AE660B69
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 02:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1942B10E2D8;
	Sat,  7 Jan 2023 01:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5131710E2D8
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 01:21:23 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso3585910pjd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 17:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fGp7XQc2VGbBDxiW6oPsPSq8rd+Pp+GUF89FSmtguMY=;
 b=ctHCqkF8lWWCEMvSMP9SB71dYd2YSRUg9u4uNjoTKAZOuhG9kNvAcXTqwBn8Pl6rDm
 o/rzUuIRcux5YaDdSV5Ygdm16fu+ymgygpIhROQBk1CdYiXLc6BAV0oHyT4CP24tQoAP
 BJLKuFdc8n/R4v9FAHU85MgPACIAHu0IsRGws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGp7XQc2VGbBDxiW6oPsPSq8rd+Pp+GUF89FSmtguMY=;
 b=LKgbW3VBIBD06oxRSkfuTsLR3k8BcUMHSax6f5fEH0KGuYFHGMBSLtfD2k9+a7xGlM
 agzu/EWxDDc5ViobG6O0DfEGcND667O+AvuYPqFGByXTJobX0R5vnLlNMFplCf1dwB4I
 G2zeIp23UfhMMMZyrm7YCAsEgLXpISiyiWIU+c8OB7wFiAjZleQTXXYd/mrnDTy8DgKx
 4zXeSWurDxL1NvBG9UwUU+elMHqkOrza64sKUlebPXLXBx+v/G/NYVnwwua832G0cJ49
 7t6ny/+oXJME/k84+EEJ6GuJ/yCwgd/eMWUnFv1xt+7XY2sHG+u0hc11wx/LxJAo2o+R
 gBsQ==
X-Gm-Message-State: AFqh2kpc/rJs9y6ZAbyZt1MJGee0leL1JijswAhSiPMjHEbQpcxxMhRZ
 OjgWq2Es1eDfTRrSR63EL+4SEA==
X-Google-Smtp-Source: AMrXdXucd5QiL3Gpmu1dQs5wApEskRuwAtx0qubwZvtkLbZyghXUapggu1smjFX+LjoGpUNSoGZhlw==
X-Received: by 2002:a17:902:e354:b0:192:6aa8:e3d8 with SMTP id
 p20-20020a170902e35400b001926aa8e3d8mr46653793plc.28.1673054482918; 
 Fri, 06 Jan 2023 17:21:22 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:bc4e:2cc9:68b3:15dc])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a170902db0700b00192b0a07891sm1545055plx.101.2023.01.06.17.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 17:21:22 -0800 (PST)
Date: Fri, 6 Jan 2023 17:21:19 -0800
From: Brian Norris <briannorris@chromium.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: [PATCH 2/2] drm/rockchip: vop: Leave vblank enabled in
 self-refresh
Message-ID: <Y7jJDw4RcNceyLbR@google.com>
References: <20230105174001.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
 <20230105174001.2.Ic07cba4ab9a7bd3618a9e4258b8f92ea7d10ae5a@changeid>
 <9455bc5b-2074-4f48-71a7-5c816ee19a78@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9455bc5b-2074-4f48-71a7-5c816ee19a78@mailbox.org>
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
Cc: "kernelci.org bot" <bot@kernelci.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 12:42:54PM +0100, Michel Dänzer wrote:
> On 1/6/23 02:40, Brian Norris wrote:
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > @@ -719,11 +719,11 @@ static void vop_crtc_atomic_disable(struct drm_crtc *crtc,
> >  
> >  	mutex_lock(&vop->vop_lock);
> >  
> > -	drm_crtc_vblank_off(crtc);
> > -
> >  	if (crtc->state->self_refresh_active)
> >  		goto out;
> >  
> > +	drm_crtc_vblank_off(crtc);
> > +
> >  	/*
> >  	 * Vop standby will take effect at end of current frame,
> >  	 * if dsp hold valid irq happen, it means standby complete.
> 
> The out label immediately unlocks vop->vop_lock again, seems a bit pointless. :)

Oops, of course. Will change that in v2.

> AFAICT the self_refresh_active case should just return immediately,
> the out label would also send any pending atomic commit completion
> event, which seems wrong now that the vblank interrupt is left
> enabled.

If I return immediately and drop that completion, I hit a warning:

[    4.423876] WARNING: CPU: 5 PID: 58 at drivers/gpu/drm/drm_atomic_helper.c:2460 drm_atomic_helper_commit_hw_done+0xe0/0xe8
...
[    4.424036] Call trace:
[    4.424039]  drm_atomic_helper_commit_hw_done+0xe0/0xe8
[    4.424045]  drm_atomic_helper_commit_tail_rpm+0x58/0x7c
...

I plan to leave it as-is for v2.

> (I also wonder if drm_crtc_vblank_off doesn't take care of
> that already, at least amdgpu doesn't do this explicitly AFAICT)

I'm not sure.

Brian
