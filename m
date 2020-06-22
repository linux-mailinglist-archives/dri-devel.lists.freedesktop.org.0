Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EADAA202F50
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 06:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309256E0E8;
	Mon, 22 Jun 2020 04:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD206E03A;
 Mon, 22 Jun 2020 04:34:42 +0000 (UTC)
IronPort-SDR: XgELPQxXn5RhkAT92Lhcs/2ErhaU2RCD6hwbAzOe03WSufH6QZcG/R99lbirA4DZJR25DAB0V0
 qTMcv135uTzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="131048271"
X-IronPort-AV: E=Sophos;i="5.75,265,1589266800"; d="scan'208";a="131048271"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2020 21:34:41 -0700
IronPort-SDR: XUihJcKBojJ6OL2tTLikVidEE73o7I4mRlaRPQTzxEE9qKsQBUIk46+i5iyur1SREGjhV+QspP
 3Eblb0rR8NIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,265,1589266800"; d="scan'208";a="478314168"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by fmsmga005.fm.intel.com with ESMTP; 21 Jun 2020 21:34:41 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 21 Jun 2020 21:34:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 21 Jun 2020 21:34:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG8L5GHu0KbtCCaMRIIawr5r0muHC+03tNbrmXuMQbBFNNoCsv8YjHEJJVgwYorOsQWDQXO6rPmvlUwrCfmefwg0pTsYFsy0ruQqQAIjuNzkvLV7QtuvNoi6JQjdwVQ4Tq+34mkHi/a+cELa5vjiRuAtfV0AIQoRTEGzr+/Hs8PoVP5LjDDWiHXSzCMGf9ymTl1AoRgDncmLrursmv+JW/FfYkpxPd1gGO9W255ZEDlqrRmGMd/XbKdf1HBG6PDF8i0InxKQG+ATCZ4Vn023rliDLtn5xcZU90+MC2kSYYi3tF09nGKbmj9UjAh8uYrGMRplwHQ1tr9WEqX86U3fzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNfLHCbMR6UmX2qqA4I1aSCHGwbnyHrixgCO2870Mq8=;
 b=kyZ9KZlU7sVUN/O0Ma1aVkKMdXfTLKxBxWYcYubyEXfEBf+DyPONQc91NO8QtG/2eymT7dq1DopfsWM2w79vuWY/CrbjiOGebm3rABdtD/DXA5iWflzIDP1FiCxF7aWE1UQstScnlrK/0DjLzUej4076xQmPp85JYh5nh/+tuOUw3xOPvSQiedcyRoaDDn78SLJWwRMdYolSVB2ONCuX3UM5uTNKTlakk2UtKevwInwBg+MRjEQrqdr3p8l4cDSWQqWOamVBFY0GPPS54oQf0GtAIAAP2JmNGOYjmtf+KJ3cC2MINLwlIcW24BjNfjpARQI3P4y0xVBpK4vJk0ByfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNfLHCbMR6UmX2qqA4I1aSCHGwbnyHrixgCO2870Mq8=;
 b=ValTLZmo/P2q7pb9DSxlL5tf5ISxv0m4karvNwAl7EKzh2aUsXC2vKyJz3zyBq49skhwFZEi7T8wXirZPPP2SBbdbXDZBtW1nSV16eYCHVc6ei55TZI9wOx29rm0x4WStdhruQRB3aw1O9pMAdcn3qHKzLyvLVR1p3v6CP/ZI2E=
Received: from SN6PR11MB3327.namprd11.prod.outlook.com (2603:10b6:805:bd::13)
 by SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 04:34:36 +0000
Received: from SN6PR11MB3327.namprd11.prod.outlook.com
 ([fe80::29e5:192f:c3d4:527d]) by SN6PR11MB3327.namprd11.prod.outlook.com
 ([fe80::29e5:192f:c3d4:527d%7]) with mapi id 15.20.3109.025; Mon, 22 Jun 2020
 04:34:36 +0000
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
To: "Navare, Manasi D" <manasi.d.navare@intel.com>
Subject: RE: [v8 3/3] drm/debug: Expose connector VRR monitor range via debugfs
Thread-Topic: [v8 3/3] drm/debug: Expose connector VRR monitor range via
 debugfs
Thread-Index: AQHWRj1+jcXTC+8luU6j1aMbO/d8yajgRlWAgAPFaWA=
Date: Mon, 22 Jun 2020 04:34:36 +0000
Message-ID: <SN6PR11MB33278D1F996464CC461921078D970@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20200619212356.19285-1-bhanuprakash.modem@intel.com>
 <20200619212356.19285-4-bhanuprakash.modem@intel.com>
 <20200619184239.GA4000@intel.com>
In-Reply-To: <20200619184239.GA4000@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.79.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81a17dab-f065-43b5-aa51-08d8166591f9
x-ms-traffictypediagnostic: SA0PR11MB4605:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4605A07816D23A9A2B72C4908D970@SA0PR11MB4605.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rKz6Y/PdvCE1PQ7XFmUuO1KTVxDD4bInDFb6MM05YrFA2IFWbG0Ttvs3RX9zjEK9OROEWpLiqrVDxPgwAWinlHmJV8tvBl4e39YEzR04Qu2m4C2h5CeO8QioGhF3apx3f0GtvvWd4YJEd5ysH5Vz5GKVn3uwBaW/dvmovNWRFW3E5jfd2244Zly2Fr3GqA+DfYQW5AZzYFV8KY4CGdr5MbnzNLvaGx//VqyL1WfT4EJ3QUNelMoexq0Mj9ttp1OP9+9I8VJrTE2F8YNw42P2ZvCUOEH9qxE2dl54NmBfXsxaP2RtznpUzIj9faglFiXkPEdocwd0Rmux5umGNL4b2TG40CO1q3XWv0xdH5XMa0w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3327.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(8676002)(478600001)(9686003)(76116006)(66946007)(7696005)(5660300002)(450100002)(64756008)(6506007)(66556008)(86362001)(316002)(52536014)(66446008)(53546011)(6636002)(66476007)(186003)(33656002)(4326008)(83380400001)(71200400001)(26005)(2906002)(8936002)(55016002)(6862004)(966005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: lBfm9dbgH4W7giiFoCHeJuo/Z0j+6yzT9QbEORniobo8nVdmn79m6n62/S4kCxSLebE23P/9XJUVbQH6ruAk6GzLRL7PHh8Qupc2HJd9pXj8GNJuD8Gt2wSRvMUeekWH9HQXXRL4G8xVUxx410RJ8+za7i25pMv/OG2pOQE8/ayu8G49LrV5JPihEuWShyeFFvS+EJ7hbFu6HfDAwNHlAUW88D0/HiuQ343JLNLucu1QMlr8Jpwpdi2EbqYzcCcApA8chQJuFdU3Up3m2OstEMqd70iWqyWh07os7GvYkeEWXSO2xlgH1coumxshgShn3ynaOX6C21NLFjov5Eac0rBmD7sTmKHbXMYk71LH9s6i+db/LisPtbkzXDVm3MGWymRHLo+jirNYQ8TeYSZEbX88CBMhg5SuROnfyESstW4xEJjqwNbEnEEFiILR1/n+DoeOArZiHGuKErn5ozgKjMp1HF1upmde83dLoHV2NaU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a17dab-f065-43b5-aa51-08d8166591f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 04:34:36.8512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yb5s0GN7kpTrvmPE2KlwK+VF3+J0/Hob8i8e2+pLaS1hnv5zbhrVECXi69e1G9O6MOi1kuk2cEBgfo3ou41U8DQ4C8fBzOPANiO07s5YD8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
X-OriginatorOrg: intel.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Navare, Manasi D <manasi.d.navare@intel.com>
> Sent: Saturday, June 20, 2020 12:13 AM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Subject: Re: [v8 3/3] drm/debug: Expose connector VRR monitor range via
> debugfs
> =

> Hi Bhanu,
> =

> Thanks for the patch, functionality wise looks good. Have you tested this
> with kms_vrr IGT, do we see the vrr_range properly exposed?

[Bhanu]
Yes, the vrr_range is exposing properly. I have verified the debugfs node
manually and through IGT.
 =

> =

> Also please find some comments below
> =

> On Sat, Jun 20, 2020 at 02:53:56AM +0530, Bhanuprakash Modem wrote:
> > [Why]
> > It's useful to know the min and max vrr range for IGT testing.
> >
> > [How]
> > Expose the min and max vfreq for the connector via a debugfs file
> > on the connector, "vrr_range".
> >
> > Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
> >
> > v2:
> > * Fix the typo in max_vfreq (Manasi)
> > * Change the name of node to i915_vrr_info so we can add
> > other vrr info for more debug info (Manasi)
> > * Change the VRR capable to display Yes or No (Manasi)
> > * Fix indentation checkpatch errors (Manasi)
> > v3:
> > * Remove the unnecessary debug print (Manasi)
> > v4:
> > * Rebase
> > v5:
> > * Rename to vrr_range to match AMD debugfs
> > v6:
> > * Rebase (manasi)
> > v7:
> > * Fix cmpilation due to rebase
> > v8:
> > * Move debugfs node creation logic to DRM (Emil)
> > * Remove AMD specific logic (Emil)
> >
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > ---
> >  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 20 -----------------
> >  drivers/gpu/drm/drm_debugfs.c                 | 22 +++++++++++++++++++
> >  2 files changed, 22 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > index 076af267b488..71387d2af2ed 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > @@ -820,24 +820,6 @@ static int output_bpc_show(struct seq_file *m, void
> *data)
> >  	return res;
> >  }
> >
> > -/*
> > - * Returns the min and max vrr vfreq through the connector's debugfs
> file.
> > - * Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
> > - */
> > -static int vrr_range_show(struct seq_file *m, void *data)
> > -{
> > -	struct drm_connector *connector =3D m->private;
> > -	struct amdgpu_dm_connector *aconnector =3D
> to_amdgpu_dm_connector(connector);
> > -
> > -	if (connector->status !=3D connector_status_connected)
> > -		return -ENODEV;
> > -
> > -	seq_printf(m, "Min: %u\n", (unsigned int)aconnector->min_vfreq);
> > -	seq_printf(m, "Max: %u\n", (unsigned int)aconnector->max_vfreq);
> > -
> > -	return 0;
> > -}
> > -
> >  #ifdef CONFIG_DRM_AMD_DC_HDCP
> >  /*
> >   * Returns the HDCP capability of the Display (1.4 for now).
> > @@ -1001,7 +983,6 @@ static ssize_t dp_dpcd_data_read(struct file *f,
> char __user *buf,
> >  DEFINE_SHOW_ATTRIBUTE(dmub_fw_state);
> >  DEFINE_SHOW_ATTRIBUTE(dmub_tracebuffer);
> >  DEFINE_SHOW_ATTRIBUTE(output_bpc);
> > -DEFINE_SHOW_ATTRIBUTE(vrr_range);
> >  #ifdef CONFIG_DRM_AMD_DC_HDCP
> >  DEFINE_SHOW_ATTRIBUTE(hdcp_sink_capability);
> >  #endif
> > @@ -1059,7 +1040,6 @@ static const struct {
> >  		{"phy_settings", &dp_phy_settings_debugfs_fop},
> >  		{"test_pattern", &dp_phy_test_pattern_fops},
> >  		{"output_bpc", &output_bpc_fops},
> > -		{"vrr_range", &vrr_range_fops},
> >  #ifdef CONFIG_DRM_AMD_DC_HDCP
> >  		{"hdcp_sink_capability", &hdcp_sink_capability_fops},
> >  #endif
> =

> I think the AMD sepecific debugfs removal should be in a separate patch
> follwing the drm_debugfs addition
> patch because from merging pov that patch will get merged through AMD tree
> and drm patch will get merged through drm_misc
> Also cc the amd dev mailing list for that patch.
[Bhanu] Sure
> =

> @Harry does that sound okay from merging pov?
> =

> Manasi
> =

> > diff --git a/drivers/gpu/drm/drm_debugfs.c
> b/drivers/gpu/drm/drm_debugfs.c
> > index bfe4602f206b..3d7182001004 100644
> > --- a/drivers/gpu/drm/drm_debugfs.c
> > +++ b/drivers/gpu/drm/drm_debugfs.c
> > @@ -376,6 +376,24 @@ static ssize_t edid_write(struct file *file, const
> char __user *ubuf,
> >  	return (ret) ? ret : len;
> >  }
> >
> > +/*
> > + * Returns the min and max vrr vfreq through the connector's debugfs
> file.
> > + * Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
> > + */
> > +static int vrr_range_show(struct seq_file *m, void *data)
> > +{
> > +	struct drm_connector *connector =3D m->private;
> > +
> > +	if (connector->status !=3D connector_status_connected)
> > +		return -ENODEV;
> > +
> > +	seq_printf(m, "Min: %u\n", (u8)connector-
> >display_info.monitor_range.min_vfreq);
> > +	seq_printf(m, "Max: %u\n", (u8)connector-
> >display_info.monitor_range.max_vfreq);
> > +
> > +	return 0;
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(vrr_range);
> > +
> >  static const struct file_operations drm_edid_fops =3D {
> >  	.owner =3D THIS_MODULE,
> >  	.open =3D edid_open,
> > @@ -413,6 +431,10 @@ void drm_debugfs_connector_add(struct drm_connector
> *connector)
> >  	/* edid */
> >  	debugfs_create_file("edid_override", S_IRUGO | S_IWUSR, root,
> connector,
> >  			    &drm_edid_fops);
> > +
> > +	/* vrr range */
> > +	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
> > +			    &vrr_range_fops);
> >  }
> >
> >  void drm_debugfs_connector_remove(struct drm_connector *connector)
> > --
> > 2.20.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
