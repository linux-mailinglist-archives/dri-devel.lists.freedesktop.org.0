Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E99253A15E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF9210EE9F;
	Wed,  1 Jun 2022 09:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AF310EE9F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654077462; x=1685613462;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=d5MLOLxbeFBRaJbZ6BWLljMNTb2cc13kSGwyb57RFLk=;
 b=aKsP+aafs6+3ZUUZmmGfJG+aP+i4zmC2loNAmY3uTAb4Cf/HipAU9vX4
 CtdKCkBGQiBxC/htRgLMJrSpfhusE4pp79e65Z/xzPIcOOB9z7G5PqGhr
 hYD444+9h8/E0ed9ETYhYvArLzyfM+nu6Zku660qjZr9DfKaOYSKLaiDN
 Path+KVvqiO5WKlB9tiygXHGz1gFCXTtqbNMtNBg+bQADhog2om56XTlh
 GyrzJfYACy5A2CMHp/D57r40emG6Iv9D97aoQbR3i2pj5WrO7gYlNz4G8
 i5LzUd8uDLnm2SnHXI/tCinyNm79Oa5w2sa1C8u8loiKauWqDBis4NBeL Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275258858"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="275258858"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 02:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="823679101"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2022 02:57:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 02:57:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 1 Jun 2022 02:57:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 1 Jun 2022 02:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKp09MQEhC9IzneE9ECDYXVhlpqeGkDbZzeaU8d+XPUbGK8PsbQgcJXiUQfuyGgbuLWtOBkJXxHhqwVKYRZqmGW36SeUdCbbBddAfR41D/oyhrOlfEW3xYpV49E31t0Q+mLE2Ptez3pZcxccozeGjZAkJOW8CWpKwOZI8BIYqO0/srvXccKov0dmWQBx5W5NZ6WXVJIeudB11QLvVBaCKuOGEozF2dYpuF4kMstd8Tu7ODwpCBSDUdHq/LyYdnBgxzTDfTVQ4w8/qYnmy9H57t06lFzE4BamGrxlP8eEKxW5ulaw8P7zigYJDFe7hwDLX5kLluTn8hcU2fCl/AVMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9sKvWVH3h9AbQT3rNKtadKeIQ/vDoCTT2piXLt2s6Q=;
 b=BYAJcNDieH25WdEm1QP0s6uga64rjqvgaarfYPupxSh9+XB1ZyvvZaAcA8Nl9xqliNbAEIykUw06rfbqCmyN6Q7dEMKs8eoVB2GGj9M7B+MK7R7AeyTCktL9fue5b5m31+l5W+HNLlMOULXEZtwSfEzavJRUK7bu5xhWG/SZMZoND2eHexyu95zZ7tML+MF5TfoKCbiLM3FIocB4hIAeITBn0mAocuxsjAvrThevZTa8uxzeI5zZg/u4V5qxpdAnXpct8zkfQP5SAgthZYp+2Rita1kymkfVbmZdzRd90GXhg7MF1ft8yCHWK6UmeT7P/UYK61uvDFJt0h5S8JVJ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 by BN8PR11MB3777.namprd11.prod.outlook.com (2603:10b6:408:8e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 09:57:38 +0000
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b]) by SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 09:57:38 +0000
From: "Tseng, William" <william.tseng@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Topic: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Index: AQHYdNoDFbj7+FwOkEGNuWjZxEpXuK05MQ2AgAEdVpA=
Date: Wed, 1 Jun 2022 09:57:38 +0000
Message-ID: <SJ0PR11MB5894BE8E5E3747AE1EBB68E0F1DF9@SJ0PR11MB5894.namprd11.prod.outlook.com>
References: <20220531103421.11363-1-william.tseng@intel.com>
 <YpZFZcoTNy4cDBBV@intel.com>
In-Reply-To: <YpZFZcoTNy4cDBBV@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11163faa-f856-4e5a-e72d-08da43b528f5
x-ms-traffictypediagnostic: BN8PR11MB3777:EE_
x-microsoft-antispam-prvs: <BN8PR11MB37779979D06A43E0774997F8F1DF9@BN8PR11MB3777.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: esuQGRWKX+Cv8UCakpGoNqgDnY2n5r1b13iGopkIYbHma9xwBRPwLxJulFZ64DfuusgHq27cLdfHsAwbjIDQ3hoy6MoaJi7oX7Kzvfs9Fxz9z3bjdBa6lgM+BSJN2OPRy9OLR4Ei0Z2nLaOpHyBxdNfBCWC2Nl2xRPpjusu6GejzO5cxfT0TcQAVt0bVwQMU5cGQ7ekwnLLUGVhWIBox5JaScWw1VpVcmscQ6bmg91q9jh624ZssM/oqlSNpnP+c5p7rwvxW+/A6hNocL1dyngVztcgwcHfn0NlJrNvFH3ccSstYuvSPeJktvdBDGre8TTeKKYH02CDnOrLbcEnCqqab4yxapcUR1M31SoKdcHuU/pcjYOH+RgV0jQSY4j8SHbbjSGNYPvIq5X5rRnP/28D87f1X6aoxp9fvLYgeiKveZx5C6CTMBA/OtLEdcvQfLAPK3OUJDyhVcaigUCJjb3HDB6iIenUKbV5xjU3Q76eMsdSELdG33HmIBSYW7ztrOCgXA3EsRlAGYrjKNMX7Upo5PdtVX5XJdw8GLNFkIewxg7bDa0+ER6UFJulOHmS5V9w6ffoiz7Z1JXxpue2HliCxor/8xzBisMmOND2kMlieFmXsNg6U57LojwPEHhiIqgkwPwBW+j3oCiGVwEUn6pbADso9YBfx0asA7PxASQewUHG9le7lz2l6XfgtCw7Emclu60Bo6qjNuOW0YrhMRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66574015)(186003)(83380400001)(53546011)(38100700002)(122000001)(82960400001)(55016003)(38070700005)(33656002)(86362001)(7696005)(6506007)(66556008)(66946007)(54906003)(66446008)(6916009)(508600001)(316002)(76116006)(71200400001)(64756008)(2906002)(4326008)(26005)(9686003)(5660300002)(8676002)(52536014)(8936002)(8796002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Y3wvsZF1pOWWb1eVufoKNSyKkwqMoDsufvFbrGCEVPRGiLAWQeJF6A28Lr?=
 =?iso-8859-1?Q?UrI6f2+XBhhLwP3smThfBFOG80QYn++p6z8bG1E1M/VQK8AP0Z0ajhYH/E?=
 =?iso-8859-1?Q?gWJj0XUXP6yqknbuvmgEkyHbXu6gMjKgRvtunVB0/Rm/lPqTSxEh3VfIRz?=
 =?iso-8859-1?Q?whLYuHdXO3rI75IG6qafWfAjAGEHnhfeXPVQLeUMnYx2UnWuCsAQ01lRwE?=
 =?iso-8859-1?Q?1xd90C4NxSr0mHkGIgR4GWtttDgoDztLeyiunTKHnff0mxberyfT8Snbev?=
 =?iso-8859-1?Q?HkQyQpNUUTrIwPU6Q7AUU1McLzSVqc4MXptN+YnkrjhSW+z1yeLuOnLEIg?=
 =?iso-8859-1?Q?l4sd4Q+Y1QkRRPlk7U+lYZomAPmy0eG9mp4/0k4bY9WSqWolqAdlaFSPv0?=
 =?iso-8859-1?Q?lnh1JbRqKOCxEUv2+xFcBW7LAuTMuB1NTKKvZCXrOK0oJk8Y6oAzLFH4vt?=
 =?iso-8859-1?Q?34ZH62IP5OtpyibA3tECsPt6cZ6Hdi5+Pv6CfZ1gI/2LMiqQM+vvl3cimU?=
 =?iso-8859-1?Q?Qyq5nmmIlypZhJNkI+ClhaWYdYCfZOvMZFICbMgEyHwFA6ZyC1Zuv2iPM9?=
 =?iso-8859-1?Q?ISrg3YxCY/mXo5SehUAMo41Ib637zIMNQ2XHFDSMvtdo7P79pNULA94e9a?=
 =?iso-8859-1?Q?LsDZcuiaIaU28PqAgwBX1DahaiDhFg9sJCXhEiO+7iGLLJdgqCBdnERXc6?=
 =?iso-8859-1?Q?Jt8rCAyCTDQbPCJyH5wofRZJNSpQiynQ3MOfZbJBx0Mai9HJ2x5UFo40xC?=
 =?iso-8859-1?Q?Eaxgz3M70CY3tPea9l/qzadaZfTK1BGjASSYDK1b+MkhJMLvWENGUAOxyh?=
 =?iso-8859-1?Q?knG0IPE0+wcZqcxqDgZv+ZApPkEh6Fm28vF3OvVARtvUnsX90qcq7o6Zcq?=
 =?iso-8859-1?Q?c+89QdHlkOdBuP1vEEx5Q/n94ejTxCgRPON/o2UX4lxG+gr56MIKmQDV6Y?=
 =?iso-8859-1?Q?IVbUJpvxFYAI3Qo+K/AmHG+kJ0TesEvX84N1DNYm1aPaVnKnYzJ9aUbsmP?=
 =?iso-8859-1?Q?oLoCe2ZWvhMdFPK2DOgLUsAALe3wyxGKeSCFMhCv+vPG4FcL7LP+ufA87A?=
 =?iso-8859-1?Q?Jtv893f2wvtqRGOPYCJAOTK/nCl2jxru10v/F1HU+PsTLl4rfebObxgM08?=
 =?iso-8859-1?Q?noJCzZj7rHyxH3hdXehSQ6YuoejQG0H256HlmC2RSAZyxjyJPNIEIzZweK?=
 =?iso-8859-1?Q?zVCUDuiR3SxKOyJEV59dR7JUHWg26g0xetAJKZ+7djnpk9VUPHt+19EDGU?=
 =?iso-8859-1?Q?W45KFpE6ziOzjjU/+FK40wjAzmOmfJ/Xyt7IBZ7Xqx416nU6h04DIDraar?=
 =?iso-8859-1?Q?Emrvp/SOPzz0aQxO/5Nx8p+ajed8CyMt+aZHYXEx5t6Y+zZJM2aLmph9jI?=
 =?iso-8859-1?Q?teXJgCp/P0UpPd5CQhhib7/85fTioruME5I3St6tB+JiVtIj9lSTSXVV24?=
 =?iso-8859-1?Q?tjzh5T3k5v8YNLrqdYgz85m0zMt94D2oboRGc7D4zdBvDLBaG4dg1Y9nch?=
 =?iso-8859-1?Q?/i3v5QI1xF4qKLdCBJpKdZ2DhHwfBjbrSwo+fTPVNGhjfo3vw4sB6OdFRH?=
 =?iso-8859-1?Q?vIMambJawbTsSWTbEFy1LXT2q7Q2Uqn/i8doQBaL2+l4ZCrgL8C8oSuFVs?=
 =?iso-8859-1?Q?VyNuNfedepcvKy6t/woM4ODkrgbpECG7BPKzgk2Es8N0RT+x47KlHAZD0k?=
 =?iso-8859-1?Q?u8g/HzifWTnaFGb77oJuGrl3pQnPviFaA8mpC7GP7wCPQnq+igpZNZtDYF?=
 =?iso-8859-1?Q?Wt8S0mQbdn+UcYC4EWjEOiYGpkwYIISRapF/6RCUOLtyM0ITCsKxVLAUop?=
 =?iso-8859-1?Q?aKVQPxB8Jg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11163faa-f856-4e5a-e72d-08da43b528f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 09:57:38.1066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ui6u9bAQ5Cp6KrcaAw1SF9nfsjKqW9mHREx/N6uuLr70zXbfw3w4+aHppKAkU5v8BWyoYnYFXECjitDE3r9rtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3777
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
Reply-To: "20220531103421.11363-1-william.tseng@intel.com"
 <20220531103421.11363-1-william.tseng@intel.com>
Cc: "Lee, Shawn C" <shawn.c.lee@intel.com>, Wayne Lin <waynelin@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, Ville Syrj=E4l=E4.

It seems the change regarding drm_mode_cea_vic() works for the issue.

If so, three video formats with the same resolution, say 2560x1080, may be =
probed; two from SAD and one from DTD.
Then, depending on which is selected, any of the three video formats may be=
 set to the HDMI 1.4 sink.
I am wondering if this works for all the other HDMI 1.4 sinks.
What do you think of it?


Regards
William

-----Original Message-----
From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>=20
Sent: Wednesday, June 1, 2022 12:42 AM
To: Tseng, William <william.tseng@intel.com>
Cc: dri-devel@lists.freedesktop.org; Wayne Lin <waynelin@amd.com>; Lee, Sha=
wn C <shawn.c.lee@intel.com>
Subject: Re: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-=
D

On Tue, May 31, 2022 at 06:34:21PM +0800, William Tseng wrote:
> This is a workaround for HDMI 1.4 sink which has a CEA mode with=20
> higher vic than what is defined in CEA-861-D.
>=20
> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be=20
> displayed and the video format is indicated by both SVD (with vic 90=20
> and pictuure aspect ratio 64:27) and DTD.  When connecting to such=20
> sink, source can't output the video format in SVD because an error is=20
> returned by drm_hdmi_avi_infoframe_from_display_mode(), which can't=20
> fill the infoframe with pictuure aspect ratio 64:27 and the vic, which=20
> is originally 90 and is changed to 0 by drm_mode_cea_vic().

Hmm. I think either we need to change the logic in
drm_hdmi_avi_infoframe_from_display_mode() somehow to accept this or we nee=
d to strip the aspect ratio from such modes when we probe them.

The first option might be nicer, and something like this might even work:

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c index =
929fc0e46751..3d5c76acf42a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6082,7 +6082,8 @@ static u8 drm_mode_hdmi_vic(const struct drm_connecto=
r *connector,  }
=20
 static u8 drm_mode_cea_vic(const struct drm_connector *connector,
-			   const struct drm_display_mode *mode)
+			   const struct drm_display_mode *mode,
+			   bool is_hdmi2_sink)
 {
 	u8 vic;
=20
@@ -6102,7 +6103,7 @@ static u8 drm_mode_cea_vic(const struct drm_connector=
 *connector,
 	 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
 	 * have to make sure we dont break HDMI 1.4 sinks.
 	 */
-	if (!is_hdmi2_sink(connector) && vic > 64)
+	if (!is_hdmi2_sink && vic > 64)
 		return 0;
=20
 	return vic;
@@ -6133,7 +6134,7 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_=
avi_infoframe *frame,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		frame->pixel_repeat =3D 1;
=20
-	vic =3D drm_mode_cea_vic(connector, mode);
+	vic =3D drm_mode_cea_vic(connector, mode, true);
 	hdmi_vic =3D drm_mode_hdmi_vic(connector, mode);
=20
 	frame->picture_aspect =3D HDMI_PICTURE_ASPECT_NONE; @@ -6177,7 +6178,7 @@=
 drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 		picture_aspect =3D HDMI_PICTURE_ASPECT_NONE;
 	}
=20
-	frame->video_code =3D vic;
+	frame->video_code =3D drm_mode_cea_vic(connector, mode,=20
+is_hdmi2_sink(connector));
 	frame->picture_aspect =3D picture_aspect;
 	frame->active_aspect =3D HDMI_ACTIVE_ASPECT_PICTURE;
 	frame->scan_mode =3D HDMI_SCAN_MODE_UNDERSCAN;

But I don't quite remember off hand how the CEA VIC vs. HDMI VIC decision p=
lays into this, so there might be some issues with that approach.

--
Ville Syrj=E4l=E4
Intel
