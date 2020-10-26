Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F3C298BB1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 12:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EA66E02B;
	Mon, 26 Oct 2020 11:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053B1883A9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 11:19:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h5so11941127wrv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 04:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/VW2HRuEabTUpCEA7FydXfQ0d9IISOMPldNqgaRvsIo=;
 b=G/P42ZHyLJJPyxAGV4NV00rmPIX3EQaX/im1cRDfb4i/6BmLZElOpYnlhEJ0+PiO8x
 xOQdCZJNv03klVs8ldysh7UH954Qz42qTrRF285BK3vaSBcbg1QxBRCJzRO0EjSOiwrp
 WigDtnaUNG328d9723PXI+B99Pdp6/Oh1Lzv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/VW2HRuEabTUpCEA7FydXfQ0d9IISOMPldNqgaRvsIo=;
 b=pNTMqR1cea77ZFYj37N+fiPyzOKT+MJrOwRDDBH24v+TgujySVnCrDhXMMHC02vPQe
 JGtWFtr4IbSGknB32tvYCSK+8KTCkW1Nfu06hQw7aOLGVgvS7rlD7j5GvHbCMoQ1QwEC
 DDMgk/p9NkpKoAlm0/kXl9+ZxMg4wh3cK0NaqepAodYIQjHkC0vAG9nYLqKoSjOkXwC0
 iorubvKlC12R33xk0b2vOs3fj3oyZCZQjB0ASbLqACnMXkxkPjFPFDdvRaQgPpjHKTAL
 dDRu0Xdcnc/M7VyKOTxhgH79igVs3lkgPo4u4smmELQbCzDfzKEVdTnF/jwHYokr7pf8
 NFng==
X-Gm-Message-State: AOAM533vTunxC0caK4qj0fV9BOBhRxAUXmn4bzwS2OZfNbJ6iOP4tyqJ
 Fikm2eAH+pJKiyKhfEN6RuLmpuMLmfx+gnh9
X-Google-Smtp-Source: ABdhPJzckuP8n7twSipb2BG2NbUDON/F9BL6IEaU5QUpJYVsOpV9fDu4ADIiJwevpvjxS5MW/jWETw==
X-Received: by 2002:adf:93c1:: with SMTP id 59mr17008807wrp.369.1603711163749; 
 Mon, 26 Oct 2020 04:19:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u9sm969489wrp.65.2020.10.26.04.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 04:19:22 -0700 (PDT)
Date: Mon, 26 Oct 2020 12:19:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] Implement .format_mod_supported in mxsfb
Message-ID: <20201026111920.GH401619@phenom.ffwll.local>
References: <96f62304bad202e4f920d2f4ed62c485@abrecht.li>
 <20201025155201.GA25070@bogon.m.sigxcpu.org>
 <CAKMK7uEX38yzJGy6PWBs-L375kUGAPQK7SMPjT8Ze+3oKk38Mg@mail.gmail.com>
 <20201026105207.GI6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026105207.GI6112@intel.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dl-linux-imx <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 Daniel Abrecht <freedesktop-linux-dri-devel@danielabrecht.ch>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 12:52:07PM +0200, Ville Syrj=E4l=E4 wrote:
> On Mon, Oct 26, 2020 at 10:05:17AM +0100, Daniel Vetter wrote:
> > On Sun, Oct 25, 2020 at 4:52 PM Guido G=FCnther <agx@sigxcpu.org> wrote:
> > >
> > > Hi Daniel,
> > > On Sat, Oct 24, 2020 at 04:59:16PM +0000, Daniel Abrecht wrote:
> > > > This will make sure applications which use the IN_FORMATS blob
> > > > to figure out which modifiers they can use will pick up the
> > > > linear modifier which is needed by mxsfb. Such applications
> > > > will not work otherwise if an incompatible implicit modifier
> > > > ends up being selected.
> > >
> > > Since this got broken by the switch away for the simple display
> > > pipeline helper (ae1ed0093281939b80664a687689f12436c0e874) could
> > > you add a fixes tag?
> > =

> > mxsfb is also missing setting the allow_fb_modifiers flag, without
> > which all this modifier stuff won't work great.
> =

> drm_universal_plane_init() automagically adds it if a modifier list
> is passed in.

Oh right I missed that :-/ I guess then removing the explicit setting from
drivers would be good, and maybe adding a comment to the kerneldoc about
that.

And more of a mess indeed ...
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
