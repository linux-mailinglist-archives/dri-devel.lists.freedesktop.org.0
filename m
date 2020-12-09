Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ACD2D4A9C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 20:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927316E18F;
	Wed,  9 Dec 2020 19:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF1F6E147
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 19:41:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x22so2566235wmc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 11:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wBPB0wWpzZwPMzHWTvAOphgnK21XoYfKx4TAHghRoMY=;
 b=d5SMWV9gwF8vqFTTBRwaN/iM1yddbBkA0WqCp9WUMGiGaz0ifv3PjyIk4qzt70R9i5
 7/MnJQuhc7eWEuhWqhORLPYYPREf7cuC4sQj7Em9zSCUv+QuT/17FD8ozEPeFAdX2Rkz
 /rLgytgMBYBNdKlwoYTfi02ANx24sorQ+E6rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wBPB0wWpzZwPMzHWTvAOphgnK21XoYfKx4TAHghRoMY=;
 b=cQsDUrZLAzWRyqWXWtqrMqAoDQALX7WV1Vti3ClQmFJ3SUVnrV7Ya8qocPkHCQBfxM
 dLhJaYrE/G1FugSLnzgEI8BEGGsiE7uNTg8G/GVDGLUC6isV03xstVbCjZqjh3EVcspz
 KYP9rZuM0E3DUdiOvq1uUjTDSKao7o7LsVZ8hTVx2q1QVFXXLTPL02/TiYR1Y7Lu5eGn
 97cPP3Gs0s2fmlr+1ll5oR9e6hVsHNDUdAfuP7O7pl+OxcdKkIAdE21D4l+ftvwkdWg9
 u1lJwGSUEg7GluELNzKW5AW4z1a25YZlKK5kIpLA5SYgT5hxnFyFqMhIPIsf6K8Wp0Aj
 jkVQ==
X-Gm-Message-State: AOAM533Gmz5BdIUIsLknFxgXipWi0CWr2SxYDFaXdAvZDNlxbY8KVuVz
 VanGPFQcca2iABAyhXc5DPuViQ==
X-Google-Smtp-Source: ABdhPJxh0r5amakXi3A/sjPJ3gbEQZiyISaak0g3NJ5z+BevDJJqjJMCrFyExct29DBLG7M2TSQ6/A==
X-Received: by 2002:a1c:7f52:: with SMTP id a79mr4351690wmd.157.1607542881433; 
 Wed, 09 Dec 2020 11:41:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h3sm5425912wmm.4.2020.12.09.11.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 11:41:20 -0800 (PST)
Date: Wed, 9 Dec 2020 20:41:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 0/6] drm/dsc, drm/dp, and /drm/i915: rc model size updates
Message-ID: <20201209194118.GW401619@phenom.ffwll.local>
References: <cover.1607429866.git.jani.nikula@intel.com>
 <87im9b9vbf.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87im9b9vbf.fsf@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: manasi.d.navare@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 09, 2020 at 11:34:44AM +0200, Jani Nikula wrote:
> On Tue, 08 Dec 2020, Jani Nikula <jani.nikula@intel.com> wrote:
> > For whatever reason this old series was never merged. Please let's get
> > this done.
> 
> Daniel, Maarten, may I have an ack to merge patches 1 and 4 via
> drm-intel?

Ack.
-Daniel

> 
> BR,
> Jani.
> 
> 
> >
> > For i915 DP this still needs a patch to start using the model size from
> > DPCD.
> >
> > BR,
> > Jani.
> >
> > Jani Nikula (6):
> >   drm/dsc: use rc_model_size from DSC config for PPS
> >   drm/i915/dsc: configure hardware using specified rc_model_size
> >   drm/i915/dsc: make rc_model_size an encoder defined value
> >   drm/dsc: add helper for calculating rc buffer size from DPCD
> >   drm/i915/bios: fill in DSC rc_model_size from VBT
> >   drm/i915/dsi: use VBT data for rc_model_size
> >
> >  drivers/gpu/drm/drm_dsc.c                 | 30 +++++++++++++++++++++--
> >  drivers/gpu/drm/i915/display/intel_bios.c | 11 +++------
> >  drivers/gpu/drm/i915/display/intel_dp.c   |  8 ++++++
> >  drivers/gpu/drm/i915/display/intel_vdsc.c |  4 +--
> >  include/drm/drm_dsc.h                     |  1 +
> >  5 files changed, 41 insertions(+), 13 deletions(-)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
