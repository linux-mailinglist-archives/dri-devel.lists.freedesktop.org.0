Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0D176E1D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 05:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CF56E4BA;
	Tue,  3 Mar 2020 04:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2216E4BA;
 Tue,  3 Mar 2020 04:40:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 20:40:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,510,1574150400"; d="scan'208";a="412607362"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga005.jf.intel.com with ESMTP; 02 Mar 2020 20:40:13 -0800
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 2 Mar 2020 20:40:13 -0800
Received: from bgsmsx151.gar.corp.intel.com (10.224.48.42) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 2 Mar 2020 20:40:12 -0800
Received: from BGSMSX107.gar.corp.intel.com ([169.254.9.58]) by
 BGSMSX151.gar.corp.intel.com ([169.254.3.26]) with mapi id 14.03.0439.000;
 Tue, 3 Mar 2020 10:10:09 +0530
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: RE: [Intel-gfx] [PATCH v2 0/7] drm: drm_fb_helper cleanup.
Thread-Topic: [Intel-gfx] [PATCH v2 0/7] drm: drm_fb_helper cleanup.
Thread-Index: AQHV8LBL8+V2W+0rDEejJ760teGdoag1QS2AgAEIjNA=
Date: Tue, 3 Mar 2020 04:40:09 +0000
Message-ID: <E92BA18FDE0A5B43B7B3DA7FCA0312860577DFC2@BGSMSX107.gar.corp.intel.com>
References: <20200302162151.52349-1-pankaj.laxminarayan.bharadiya@intel.com>
 <CACvgo50_0ZE3dxbwwv2g6937F3mA15thM_qXv=BBVodYy=mbxg@mail.gmail.com>
In-Reply-To: <CACvgo50_0ZE3dxbwwv2g6937F3mA15thM_qXv=BBVodYy=mbxg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Emil Velikov <emil.l.velikov@gmail.com>
> Sent: 02 March 2020 23:51
> To: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>; Daniel Vetter
> <daniel@ffwll.ch>; Intel Graphics Development <intel-
> gfx@lists.freedesktop.org>; ML dri-devel <dri-devel@lists.freedesktop.org>
> Subject: Re: [Intel-gfx] [PATCH v2 0/7] drm: drm_fb_helper cleanup.
> 
> Hi Pankaj,
> 
> On Mon, 2 Mar 2020 at 16:33, Pankaj Bharadiya
> <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> >
> > This series addresses below drm_fb_helper tasks from
> > Documentation/gpu/todo.rst.
> >
> > - The max connector argument for drm_fb_helper_init() isn't used
> >   anymore and can be removed.
> >
> > - The helper doesn't keep an array of connectors anymore so these can
> >   be removed: drm_fb_helper_single_add_all_connectors(),
> >   drm_fb_helper_add_one_connector() and
> >   drm_fb_helper_remove_one_connector().
> >
> > Changes since v1:
> >    - Squashed warning fixes into the patch that introduced the
> >      warnings (into 5/7) (Laurent)
> >    - Fixed reflow in in 9/9 (Laurent)
> >
> For the future, include the changelog in the respective patches. This makes it
> easier for reviewers...
> Plus you're already changing the commit - might as well mention what/why :-
> )
> 
> Also do include the R-B, Acked-by, other tags accumulated up-to that point,
> when sending new revision.

Noted, Thank you for the feedback. Will send new series with tags accumulated
after 1-2 days. 

> 
> 
> That said, if you're interested in further cleaning this up, one can cleanup the
> drm_dp_mst_topology_cbs hooks.
> In particular ::register_connector is identical across the board - create a
> helper function using it directly in core, killing the hook.
> 
> While for ::destroy_connector - there's some amdgpu specific code in
> there... which I'm not sure if it should stay or not.
> To be on the save side - create a helper which will be called for drivers where
> the hook is !=NULL (aka everyone but amdgpu).

Will take a look.

Thanks,
Pankaj

> 
> HTH
> Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
