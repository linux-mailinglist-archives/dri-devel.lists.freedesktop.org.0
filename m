Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FAC34A5A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70541899EA;
	Tue,  4 Jun 2019 14:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-rs2-vallila1.fe.helsinki.fi
 (smtp-rs2-vallila1.fe.helsinki.fi [128.214.173.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305B7893A2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 08:12:40 +0000 (UTC)
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 by smtp-rs2.it.helsinki.fi (8.14.7/8.14.7) with ESMTP id
 x548AKOS058582; Tue, 4 Jun 2019 11:10:21 +0300
Received: by whs-18.cs.helsinki.fi (Postfix, from userid 1070048)
 id D6EA73600CB; Tue,  4 Jun 2019 11:10:20 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by whs-18.cs.helsinki.fi (Postfix) with ESMTP id D4AF836004D;
 Tue,  4 Jun 2019 11:10:20 +0300 (EEST)
Date: Tue, 4 Jun 2019 11:10:20 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: Harish Chegondi <harish.chegondi@intel.com>
Subject: Re: DRM/AST regression (likely 4.14 -> 4.19+), providing EDID manually
 fails
In-Reply-To: <20190604061511.GA22758@intel.com>
Message-ID: <alpine.DEB.2.20.1906041106090.29321@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi>
 <878surn919.wl-ashutosh.dixit@intel.com> <87sgsz593p.fsf@intel.com>
 <alpine.DEB.2.20.1905291127350.24401@whs-18.cs.helsinki.fi>
 <878sup5zmh.fsf@intel.com> <20190604061511.GA22758@intel.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1766036455-1559635820=:29321"
X-Mailman-Approved-At: Tue, 04 Jun 2019 14:26:35 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1766036455-1559635820=:29321
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Mon, 3 Jun 2019, Harish Chegondi wrote:

> On Wed, May 29, 2019 at 01:22:30PM +0300, Jani Nikula wrote:
> > On Wed, 29 May 2019, Ilpo Järvinen <ilpo.jarvinen@cs.helsinki.fi> wrote:
> > > On Tue, 28 May 2019, Jani Nikula wrote:
> > >
> > >> On Mon, 27 May 2019, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> > >> > On Sun, 26 May 2019 12:50:51 -0700, Ilpo Järvinen wrote:
> > >> >>
> > >> >> Hi all,
> > >> >>
> > >> >> I've a workstation which has internal VGA that is detected as AST 2400 and
> > >> >> with it EDID has been always quite flaky (except for some time it worked
> > >> >> with 4.14 long enough that I thought the problems would be past until the
> > >> >> problems reappeared also with 4.14). Thus, I've provided manually the EDID
> > >> >> that I extracted from the monitor using other computer (the monitor itself
> > >> >> worked just fine on the earlier computer so it is likely fine).
> > >> >>
> > >> >> I setup the manual EDID using drm_kms_helper.edid_firmware, however,
> > >> >> after upgrading to 4.19.45 it stopped working (no "Got external EDID base
> > >> >> block" appears in dmesg, the text mode is kept in the lower res mode, and
> > >> >> Xorg logs no longer dumps the EDID info like it did with 4.14). So I guess
> > >> >> the EDID I provided manually on the command line is not correctly put into
> > >> >> use with 4.19+ kernels.
> > >> >>
> > >> >> The 4.19 dmesg indicated that drm_kms_helper.edid_firmware is deprecated
> > >> >> so I also tested with drm.edid_firmware it suggested as the replacement
> > >> >> but with no luck (but I believe also the drm_kms_helper one should have
> > >> >> worked as it was only "deprecated").
> > >> >>
> > >> >> I also tried 5.1.2 but it did not work any better (and with it also tried
> > >> >> removing all the manual *.edid_firmware from the command line so I still
> > >> >> need to provide one manually to have it reliable working it seems).
> > >> >
> > >> > I believe there is a bug already tracking this, here:
> > >> >
> > >> > https://bugs.freedesktop.org/show_bug.cgi?id=107583
> > >> 
> > >> Ilpo, does video=VGA-1:e command-line option work around the problem for
> > >> you?
> > >
> > > Yes it does; together with the modeline stuff for Xorg (after reading the 
> > > referenced bug report I realized I can fix the X side with it). So I now 
> > > have the desired modes/resolutions in use. Thank you all!
> > 
> > Great! It should be enough to just have the replacement firmware EDID
> > for the modes, as long as you have an EDID that represents the
> > capabilities of the display. The modelines for Xorg should not be
> > needed.
> > 
> > BR,
> > Jani.
> > 
> 
> Ilpo,
> 
> I have a patch which I think will fix this problem without needing
> the video=VGA-1:e command-line option work around. Will you be able to
> help me with testing it on your system?
> 
> Thank You!
> Harish.

Yes, if it applies fine to 5.1. ...Also, it will take a week or so.


-- 
 i.
--8323329-1766036455-1559635820=:29321
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--8323329-1766036455-1559635820=:29321--
