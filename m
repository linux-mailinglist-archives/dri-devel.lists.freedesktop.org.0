Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC9117B98A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 10:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ACF6ECAB;
	Fri,  6 Mar 2020 09:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DF66ECBF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 09:46:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s17so635140wrs.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 01:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=yGNU/jf35HfUN1T3ElSIUZGcBSwx9/JHjFsWgRm1Y2E=;
 b=jnIT+socjgr9cPbT4XrpWv7ubWcUkBphwCf0eqfxw27pV7C0pajc7+MCzNveg3MqOT
 Bo+ZH57LY87Po2xLVlHTwqmpGKqM725ZWDPXaCGlHIvOil+KMj/rmE1X/OZT7zxcua4i
 icq267LAuWY8SCfFSaOg1HSQ1z1VyAJGNKPDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=yGNU/jf35HfUN1T3ElSIUZGcBSwx9/JHjFsWgRm1Y2E=;
 b=OG0NOQtwimVbCUfjGW9Ncnq4Hd83Rlyb2ZU7bXDnBT7VZfq9zs+V/XFSgqn16zhocp
 x+y5qofVRYVFE4H/oNJmzRQ2ujSl6kNw1+HBzmeab3KOyM8ZxwoXM5oKOsZp8ac+FrrZ
 vUsXpOM65H5xKF9H3AKAeLlAF07ysKDbGvo86qjwqHoWzlAV8ZER8WMdhiddjv+IlnGQ
 40/nPPWtiyqkBNN9tSLRUJGdJxYS0ra/wAmZYi01gCPJo4o4GxN0MUhcPsVlOrXR+o21
 BgZ1Q96UYISvFTqJA6qq2L050QOIaA+UdD6OA13RW+8ZmbYqu6Ig1sC7Vx93aSQfsSis
 OyCA==
X-Gm-Message-State: ANhLgQ1HIj/f/wBF7RmwsQD2VZM1Kt7Q4pnORFfp0P/OVytIHVVVCPQe
 EECMEwvz1sM62YdZSsY17uNmIg==
X-Google-Smtp-Source: ADFU+vuIEN9MLH6slybeE1LymTIs37lzdw0hWqe3qk3qZpxFmaQBX2lUCJZ/2uWCAzAVsjS2Tm6HOA==
X-Received: by 2002:adf:f611:: with SMTP id t17mr3374329wrp.38.1583487968475; 
 Fri, 06 Mar 2020 01:46:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y3sm13758055wmi.14.2020.03.06.01.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 01:46:07 -0800 (PST)
Date: Fri, 6 Mar 2020 10:46:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Subject: Re: [PATCH] gpu: drm: context: Clean up documentation
Message-ID: <20200306094605.GQ2363188@phenom.ffwll.local>
Mail-Followup-To: Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@linux.ie>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20200131092147.32063-1-benjamin.gaignard@st.com>
 <CACvgo50=Wt9LFWDjkJa99T8r8A64JWgfqApmir8kX=kSXd1yog@mail.gmail.com>
 <f8af37a1-ff6b-9a09-7b24-a7e3f9a981c2@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8af37a1-ff6b-9a09-7b24-a7e3f9a981c2@st.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Dave Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 04, 2020 at 04:42:09PM +0000, Benjamin GAIGNARD wrote:
> 
> 
> On 3/4/20 5:07 PM, Emil Velikov wrote:
> > On Mon, 3 Feb 2020 at 08:11, Benjamin Gaignard <benjamin.gaignard@st.com> wrote:
> >> Fix kernel doc comments to avoid warnings when compiling with W=1.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> >> ---
> >>   drivers/gpu/drm/drm_context.c | 145 ++++++++++++++++++------------------------
> >>   1 file changed, 61 insertions(+), 84 deletions(-)
> >>
> > Since we're talking about legacy, aka user mode-setting code, I think
> > a wiser solution is to simply remove the documentation. It is _not_
> > something we should encourage people to read, let alone use.
> >
> > Nit: prefix should be "drm:"
> Should I assume it is the same for drm_vm.c and drm_bufs.c ?

Yeah. In other legacy files all I've done is replace the /** with /* and
that's it. That shuts up kerneldoc validation for good with minimal
effort. Just not worth it to spend any time and polish on these :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
