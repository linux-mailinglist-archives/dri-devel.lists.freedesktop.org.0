Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24B713A03E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 05:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003D56E209;
	Tue, 14 Jan 2020 04:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37BF6E209
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 04:29:19 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id m13so5269876pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 20:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yXrCm5kVYOEmylazK18T+P+2YnE2e0RIkXwo12Gyq9U=;
 b=F8v2wFpwLrjM8KrVCiNA8uGzHjIJsmwNNo5w8NcWPmh5nvGgIVqinLe9X0nnjjLbOI
 zHn3OqMR/7BgzStozTUjn7+uFAyWhtpRbwKdyiDxqTUP8hZ9D+7QCbsgZHm7ltLW4A/w
 8Qn/tAiixtvt24c23FQLjfGu/P+8bWuVZ4eBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yXrCm5kVYOEmylazK18T+P+2YnE2e0RIkXwo12Gyq9U=;
 b=Nc0sguKK83EFbArTynt5Tin5Hdaf5SWYxRKbX4LknAKD/3vAeKXBODqylIuJV9suc9
 CYrg7Gj8besS/ZVntZjPqP7QebEUh1J/wByeH81QxIljRWzrm9SRDk2cL5mH0PPmIf2F
 xjL4DkwiGe46Ac+LblSNUEPIVtjMlz4Ij+2xciFrQVbhlD+xsGZsmHHv2TfrApV3y4DR
 Q4rfcN3H0Ya7TJdBxY33KgB/K8r2IFJJeJu48P6W/a02chPfFl/FxYN63UEXyv81Imb/
 uHavNB4LkNVZ/JoNGoZyT8b4z72PEpyJUk/ldy3z9muiRqKlsJitd4NVJNnw+1kQGBx6
 4ODg==
X-Gm-Message-State: APjAAAXdwXxpsQ6WEMP0QlLq6KvRJeDX1AJ58Bgj5kRr9ukQt7tqkeqR
 aYE7NbVGrRkXnJmr/dMdd1rBng==
X-Google-Smtp-Source: APXvYqzQ2bL8nZaP9pP/CcsPUaMelMvhx1Fkmj1QRZIqWGvOKd1yE3HS8jJSICcVdaBclviT/CYMTA==
X-Received: by 2002:a17:902:8a85:: with SMTP id
 p5mr24609701plo.154.1578976159564; 
 Mon, 13 Jan 2020 20:29:19 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id o17sm14849131pjq.1.2020.01.13.20.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 20:29:18 -0800 (PST)
Date: Tue, 14 Jan 2020 05:29:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: DRM driver and runtime suspend-resume handling?
Message-ID: <20200114042913.GF5340@dvetter-linux.ger.corp.intel.com>
References: <df769d2e-5fea-403f-2d04-b3239f89256f@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df769d2e-5fea-403f-2d04-b3239f89256f@ti.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
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
Cc: "Valkeinen, Tomi" <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 13, 2020 at 01:03:11PM +0200, Jyri Sarha wrote:
> Hi,
> While working with CRTC color related properties (gamma and CTM for
> instance) and making them persistent over suspend-resume cycle it
> occurred to me if I am just wasting resources by storing the property
> values in the driver and restoring them in dev_pm_ops runtime_resume()..
> 
> Wouldn't it work if I would just:
> 
> 1. Add a flag in the driver to indicate that the context may have been
> lost since the previous atomic commit and set in runtime_resume().
> 
> 2. And write the color properties to HW if the context lost flag is set
> even if the drm_crtc_state color_mgmt_changed is false.

Still feels a bit too complicated, but might be needed for your hw. The
usual approach is:

- runtime pm within modeset enable/disable. Since atomic helpers always
  enable the entire pipeline for a crtc enable/disable you can put the
  runtime pm into each component (drm_crtc/encoder/bridge/...).

- just unconditionally restore everything in modeset enable, assuming
  everything got lost.

- drm_atomic_helper_suspend/resume for system suspend/resume.

And you should be covevered. State save/restore in your driver code is
indeed an anti-pattern for modeset drivers, don't do that - ime at least
with fragile hw you'll get divergence between the two paths in minor
details, with some really hard to track down bugs as a result.

Ime tracking state changes and trying to be clever with when to restore
stuff (maybe outside of some atomic flip fastpath) in driver code only
attracts bugs :-)

> The color property values are there despite the color_mgmt_changed ==
> false, aren't they?

Yes.

Cheers, Daniel
> 
> Best regards,
> Jyri
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
