Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA43318F0E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 16:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2629D6E1A5;
	Thu, 11 Feb 2021 15:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF786E452
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 15:46:51 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b3so4641472wrj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 07:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nY+6J3Lni5j32PA6qgM3UZvNti0mgSQgms4QX/hsfpg=;
 b=ZoK+kJT8UEeR5WBOwzfboAjYZGKMSRkCgEqLf8V+XqLENr1KRRYoXEWGqn2rKUJ9Jb
 p4xvP2y16cdoZQrPXJMV4RfzTFOIpmEA5b0NS1sEL375AzHpKRgpfUAgSnJZpuDWlUNe
 mjOBRTYiXIl59MJBSDWUEtfVMycvlBL3gv44k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nY+6J3Lni5j32PA6qgM3UZvNti0mgSQgms4QX/hsfpg=;
 b=WoSuZ2yQh0Tcrdpt8aOjn90jTj9NqbPlmXHc9oKmNC6uCGG4c/AG9O8MkVd10ambej
 rX2p7nvQvgK3PuGwsDOC1xvbuadWX0HC8z7g7SfCH696NfG+h86rnnfJYDo+dqRdkgrP
 Wz64AVutKGVy1cxN8ocSxM7TWIpx5SDHsD1PrDM42qpguoo1BDAMb5rKx2B4Dk3BbpwO
 ISO14seP8ksgwzPYnQpAYqO3aKJV0D+OOrGSynQL8GpfP2/ASJJy6RMKYeOkvBtbRh+B
 QDsLwW/Ol3Im43/dYQfTie76WwKKF3Z9aaStf8apyPgPl1xKHV9Hmyb87g9nF1Tga00/
 E0BQ==
X-Gm-Message-State: AOAM533E5YHuq+UFyLBqsHf1N2Fs7dpAZKyL4WtcFQkbjbljVFPyAw/x
 8DKfN+Ypu3DL45n8S2UcbRYHvw==
X-Google-Smtp-Source: ABdhPJwTHDWFdU70sq9QR0Crcp/1jwyZPvx3z1eP8dF7+S7zuGrVUs46bq28oxFYZ0Y4gzjNeOQ/nA==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr5747842wrp.177.1613058410023; 
 Thu, 11 Feb 2021 07:46:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s6sm10464461wmh.2.2021.02.11.07.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 07:46:49 -0800 (PST)
Date: Thu, 11 Feb 2021 16:46:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/atomic: document and enforce
 rules around "spurious" EBUSY"
Message-ID: <YCVRZ0j21uovLJOV@phenom.ffwll.local>
References: <20210210001401.463-1-manasi.d.navare@intel.com>
 <YCPcrusmPxj0iGxz@phenom.ffwll.local>
 <vpyQ2PWoypdzSDLBjlqvQW_zi3sOkPdCOWS_MuxLId4i5HFb3ulnEWkVreU1mEYxcN9bKIB0iV_TpgMBEDaREA7bhZVUFVkTaA5d1DJHhLI=@emersion.fr>
 <YCP2l7PDMTE2a0Eh@intel.com>
 <20210210232600.GA5116@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210232600.GA5116@labuser-Z97X-UD5H>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 10, 2021 at 03:26:00PM -0800, Navare, Manasi wrote:
> On Wed, Feb 10, 2021 at 05:07:03PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Wed, Feb 10, 2021 at 01:38:45PM +0000, Simon Ser wrote:
> > > On Wednesday, February 10th, 2021 at 2:16 PM, Daniel Vetter <daniel@f=
fwll.ch> wrote:
> > > =

> > > > On Tue, Feb 09, 2021 at 04:14:01PM -0800, Manasi Navare wrote:
> > > >
> > > > > These additional checks added to avoid EBUSY give unnecessary WAR=
N_ON
> > > > > in case of big joiner used in i915 in which case even if the mode=
set
> > > > > is requested on a single pipe, internally another consecutive
> > > > > pipe is stolen and used to drive half of the transcoder timings.
> > > > > So in this case it is expected that requested crtc and affected c=
rtcs
> > > > > do not match. Hence the added WARN ON becomes irrelevant.
> > > =

> > > The WARN_ON only happens if allow_modeset =3D=3D false. If allow_mode=
set =3D=3D true,
> > > then the driver is allowed to steal an unrelated pipe.
> > > =

> > > Maybe i915 is stealing a pipe without allow_modeset?
> > =

> > No. All page flips etc. will have to get split up internally
> > between multiple crtcs.
> > =

> > So I think there's basically three options:
> > a) massive rewrite of i915 to bypass even more of drm_atomic stuff
> > b) allow i915 to silence that warning, which opens up the question
> >    whether the warn is doing any good if it can just be bypassed
> > c) nuke the warning entirely
> > =

> > a) is not going to happen, and it would any way allow i915 to
> > do things any which way it wants without tripping the warn,
> > rendering the warn entirely toothless.
> > =

> > Hmm. Maybe there is a d) which would be to ignore all crtcs
> > that are not logically enabled in the warn? Not sure if that
> > could allow something to slit through that people want it to
> > catch?

Yeah it's option d), because the warning is meant to catch funny uapi that
compositors don't want to deal with. So if this bigjoiner stuff in i915 is
_really_ fully transparent, then it's ok.

And excluding completely disabled CRTC from this check makes imo sense,
since userspace
- is not allowed to issue an atomic flip on these (it's off)
- is required to set allow_modeset to enable (at which point i915 can
  internally move CRTC assignments around however it feels like and it's
  all fine). Once that fully modeset is done we'd again be in sync with
  userspace's understanding of what's going on.
- hence there cannot be a spurious EBUSY to userspace

I think what this needs is a big comment in the code explaining why we can
afford to not check this.

> So as per the offline IRC discussions,
> - We can check for crtc_state->enable and only use the enabled crtcs
> in the affected crtc calculation. And this enable would only
> be set when modeset is done. So in case of bigjoiner no modeset on Pipe A,
> even if Pipe B is stolen, since no modeset and because that pipe doesnt
> get enabled the affected crtcs would still be 0x1.
> =

> This should solve the problem. =

> Ville, Danvet - I will make this change?

I think you volunteered :-)

Pls Cc: all the people involved in the original patch discussion, so that
they can ack the change too.

Cheers, Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
