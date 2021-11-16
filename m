Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB120453824
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 17:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC276E02A;
	Tue, 16 Nov 2021 16:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F366E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 16:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1637081704; bh=o5DW5NEgNaVGgWJUnae154kfQtrw6Y9/21ddz6gwSJg=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 b=hVFokHlREFjAQefLLopEmJB9NYFTpZisEDUV7U9PsJ2A/KlwrT0qmuTuKn1YOhUZg
 3Fqx4SF13YMHNB7hceLvTH9K965PQLNfSKFbc5eil/NbakEcQKz4a83E7mJpKNAfGW
 H2GZ0xgROVgJIQTvYCh64n1OVhjQ/R1q/Ik9jOvw=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Tue, 16 Nov 2021 17:55:04 +0100 (CET)
X-EA-Auth: yHuU6BQXXvdLI6egHtnpSWsU21KUczczdqSpXmE8eApKSsIpFyRaBS4lGLMEwI2HWT34YCDxaQB1YjSyFpCYgrJyI4vjpaZJ
Date: Tue, 16 Nov 2021 17:55:00 +0100
From: Claudio Suarez <cssk@net-c.es>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm: change logs to print connectors in the form
 CONNECTOR:id:name
Message-ID: <YZPiZCBHxk+QAKm0@gineta.localdomain>
References: <YZARol5A5hS+5a5m@gineta.localdomain>
 <YZAikieq4bwrJ58c@ravnborg.org>
 <YZFIvfY1j0f3pVQt@gineta.localdomain> <87fsrx3eed.fsf@intel.com>
 <YZK3nPgQRYl8ys8t@gineta.localdomain> <87fsrx18cp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsrx18cp.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 10:17:58PM +0200, Jani Nikula wrote:
> On Mon, 15 Nov 2021, Claudio Suarez <cssk@net-c.es> wrote:
> > On Mon, Nov 15, 2021 at 12:24:26PM +0200, Jani Nikula wrote:
> >> On Sun, 14 Nov 2021, Claudio Suarez <cssk@net-c.es> wrote:
> >> > On Sat, Nov 13, 2021 at 09:39:46PM +0100, Sam Ravnborg wrote:
> >> >> Hi Claudio,
> >> >> 
> >> >> On Sat, Nov 13, 2021 at 08:27:30PM +0100, Claudio Suarez wrote:
> >> >> > The prefered way to log connectors is [CONNECTOR:id:name]. Change it in
> >> >> > drm core programs.
> >> >> > 
> >> >> > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> >> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> >> >> 
> >> >> While touching all these logging calls, could you convernt them to the
> >> >> newer drm_dbg_kms variants?
> >> >> DRM_DEBUG_* are all deprecated.
> >> >> 
> >> >
> >> > Yes, I can, but it is recommended to do it in a different patch:
> >> >
> >> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#separate-your-changes
> >> >
> >> > C&P:
> >> > "Separate your changes
> >> > Separate each logical change into a separate patch.
> >> > For example, if your changes include both bug fixes and performance enhancements..."
> >> >
> >> >
> >> > I will study and send a new separate patch with your suggestion.
> >> 
> >> I feel these logging changes are the types of changes where I'd err on
> >> the side of fewer patches than strictly following the above guidelines.
> >
> > To size the problem:
> > - there are about 3434 references to DRM_DEBUG_* in all the drm code, all drivers.
> > - there are 413 references to DRM_DEBUG_* in the drm core code, only 66 of
> >    them are related to connectors.
> > - there are 62 references to DRM_ERR* and 7 references to DRM_INFO in
> >    the drm core programs.
> >
> > I meant I can make two patches:
> >  1 - this one with the change to CONNECTOR:id:name (29 changes)
> >  2 - a new and bigger patch to change 413 + 62 + 7 references to DRM_{DEBUG,ERR,INFO}
> >      in the drm core programs.
> 
> The second one is an on-going change that will have to happen gradually,
> file by file. Changing connector references while at it seems like a
> reasonable drive-by-change to me. (Others may disagree.)

There are about 50 files = 50 patches. It seems excessive to me, but
I get the point: smaller changes, so they are easier to control/review/...

I am going so send the patch 1 and one of the patches 2 and we can see.

Thanks,
Claudio Suarez



