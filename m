Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D53170CB0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 00:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171DC89FC9;
	Wed, 26 Feb 2020 23:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6F489FC9;
 Wed, 26 Feb 2020 23:41:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 15:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,489,1574150400"; d="scan'208";a="241846928"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga006.jf.intel.com with ESMTP; 26 Feb 2020 15:41:06 -0800
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 26 Feb 2020 15:41:06 -0800
Received: from fmsmsx117.amr.corp.intel.com ([169.254.3.129]) by
 fmsmsx111.amr.corp.intel.com ([169.254.12.118]) with mapi id 14.03.0439.000;
 Wed, 26 Feb 2020 15:41:06 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>, "mikita.lipski@amd.com"
 <mikita.lipski@amd.com>, "alexdeucher@gmail.com" <alexdeucher@gmail.com>
Subject: Re: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
Thread-Topic: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
Thread-Index: AQHV7M2WwWV35CHi+0qigzwC8zvE7KguqSiA
Date: Wed, 26 Feb 2020 23:41:04 +0000
Message-ID: <06d506c1449a59a422fd9f246c7ed9d299139cf9.camel@intel.com>
References: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
 <CADnq5_OUt5XaJ_Nf23F2zsKeuPgoka8p2S6ny-H2WK==Ncg7vA@mail.gmail.com>
 <b0181c20-017b-7e3f-13c0-3ea5b98cadaa@redhat.com>
 <CADnq5_MjaOD+QrupjQwjdu-MgVZm1sg1x9=4uxdv92u1xuSdvQ@mail.gmail.com>
 <77b812d5-5b87-49b7-87dc-16d50a5666df@redhat.com>
In-Reply-To: <77b812d5-5b87-49b7-87dc-16d50a5666df@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.14.234]
Content-ID: <3CF5227A6AA94041B9CC7C734181333B@intel.com>
MIME-Version: 1.0
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans

Just commenting in the "[    3.309061] [drm:intel_dump_pipe_config
[i915]] MST master transcoder: <invalid>" message, it is the expected
behaviour for anything older than Tigerlake, from TGL+ this will be set
in MST mode.

On Wed, 2020-02-26 at 18:52 +0100, Hans de Goede wrote:
> Hi,
> 
> On 2/26/20 5:05 PM, Alex Deucher wrote:
> > On Wed, Feb 26, 2020 at 10:43 AM Hans de Goede <hdegoede@redhat.com
> > > wrote:
> > > Hi,
> > > 
> > > On 2/26/20 4:29 PM, Alex Deucher wrote:
> > > > On Wed, Feb 26, 2020 at 10:16 AM Hans de Goede <
> > > > hdegoede@redhat.com> wrote:
> > > > > Hi Lyude and everyone else,
> > > > > 
> > > > > Lyude I'm mailing you about this because you have done a lot
> > > > > of
> > > > > work on DP MST, but if this rings a bell to anyone else feel
> > > > > free to weigh in on this.
> > > > 
> > > > Might be a duplicate of:
> > > > https://gitlab.freedesktop.org/drm/amd/issues/1052
> > > 
> > > Looks like you are right, reverting the commit which the bisect
> > > from that issue points to:
> > > 
> > > cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST
> > > atomic check")
> > > 
> > > Fixes the issue for me. I will add a comment to the issue.
> > > 
> > > Note I'm using integrated Intel gfx, so that means that this
> > > issue
> > > definitely is not amdgpu specific.
> > > 
> > 
> > I'm not too familiar with the mst code, but I wonder if we were
> > exceeding the bandwidth limits in some setups and it just happened
> > to
> > work, but now that we enforcing them, they don't which is correct,
> > but
> > a regression from some users' perspective?
> 
> I seriously doubt that is the case according to:
> https://support.lenovo.com/nl/en/solutions/pd029622
> 
> The gen 2 tb3 dock can handle 2 external
> displays at 3840*2160@60Hz together with the internal
> panel being on and both my external displays run at
> 1920x1080@60 so I'm consuming less then half of the
> maximum bandwidth.
> 
> There definitely is a bug somewhere in the
> cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST
> atomic check")
> commit (or somewhere else and triggered by that commit).
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> 
> > Alex
> > 
> > 
> > > Regards,
> > > 
> > > Hans
> > > 
> > > 
> > > 
> > > 
> > > > > I'm currently using a Lenovo X1 7th gen + a Lenovo TB3 gen 2
> > > > > dock
> > > > > as my daily rider for testing purposes. When 5.6-rc1 came out
> > > > > I
> > > > > noticed that only 1 of the 2 1920x1080@60 monitors on the
> > > > > dock
> > > > > lights up.
> > > > > 
> > > > > There are no kernel errors in the logs, but mutter/gnome-
> > > > > shell says:
> > > > > 
> > > > > gnome-shell[1316]: Failed to post KMS update: Page flip of 93
> > > > > failed
> > > > > 
> > > > > With 93 being the crtc-id of the crtc used for the monitor
> > > > > which is
> > > > > displaying black. Since then I've waited for 5.6-rc3 hoping
> > > > > that a
> > > > > fix was already queued up, but 5.6-rc3 still has this
> > > > > problem.
> > > > > 
> > > > > gnome-shell does behave as if all monitors are connected, so
> > > > > the
> > > > > monitor is seen, but we are failing to actually send any
> > > > > frames
> > > > > to it.
> > > > > 
> > > > > I've put a log collected with drm.debug=0x104 here:
> > > > > https://fedorapeople.org/~jwrdegoede/drm-debug.log
> > > > > 
> > > > > This message stands out as pointing to the likely cause of
> > > > > this problem:
> > > > > 
> > > > > [    3.309061] [drm:intel_dump_pipe_config [i915]] MST master
> > > > > transcoder: <invalid>
> > > > > 
> > > > > Regards,
> > > > > 
> > > > > Hans
> > > > > 
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
