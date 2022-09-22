Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB06C5E6839
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B015B10ECA6;
	Thu, 22 Sep 2022 16:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B9B10EBA6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663863290; x=1695399290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nNKUuMo+gWIyLZqyO1tvgp1xtdDdH9ogs0LqkJcJhU0=;
 b=eNZnhOvemuGgTiUpA01aNo7r+tI7noq09kQM+NdrXEBDPs5vdt8RSNNi
 pqk+77FcGd+MFhZlsUl7cBF8TGYob/WHk3lb7EbDrSrUr4bJvzm/n1Y7b
 x9Isv8KZIZzGkjazFLDKByoofGRzxcvpbrUWqShpfMdv11fdTsPx4NUej
 WpgqpYCYZz5PzHH4EgtfFZ499/wYPbbxl8czQoyW1muTaeB3jnpjBSQkV
 LDvgqO4aWpCPNn+OgeYpJ46PbMzRhbC3d0mIhkvtOKXWSx+qaCAoESrGZ
 TWorkbiTbO397LKTNCTxL/I7WiOiLL+HF8iY9Oi0q1373vAvxcwALt+QW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280715133"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="280715133"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 09:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="688353904"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2022 09:12:24 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 09:12:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 22 Sep 2022 09:12:23 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 22 Sep 2022 09:12:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Moc5MKsvxO4k5Z7jSsuCWxucG2pkqaeIWCEVVbtjKlUlr8/dcnhcRJivaoxkLa2EShUPUUh7zAK80X0STJqfkWkaWPWtnJxO8L2H6qaR2Rw6tSwdzPlkEe+yWa2OxGYUzcQZfoQwvbYLjdv4P246oF3NXOSO4Ggdp6XMJ+MSZboDnQqrGg0JMOR1L0+nDxKF/KXbI5TH06JCNCmTWMKNY3FIh4YykgKcc+NsvyhsGAXFyrhEZTPeO1jiznw0a8yco/Rrlh7pLyni5vxPjutMMf1loBWYa0YQl/1usi04Svbhwl0Itt+iOBsJq7/9d12XopofzrkkHUj3TQlUgPdYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSI0qrYUTdpu/DeqwMCJWbl15KJl0K7WrwEQro2GPbk=;
 b=Fdp/A7GduXm4Dgh9vvHh3SXgIECbVT+Q9FGiDBgmG1j0/vib5PXOeuJ2pbgn9L33H5zcNmid4qGdrcuekrQPTcALj//lJP8KI8znucpgS0bb6nrbSCSClnKo5s/dL8y2WXjA8KS/CwUF/E05O2S3J5Ode4stEVyE4F5DRg8Jn+ZlEH0WAnFv79sK1yAHB+dlLpvsVypMe6WM74Xf6jzASfs5ts0F9Ou+qnXMAwDwNPUSHxJhlrZHKNPzYAJLSpK18W6CzW/ls78CpUiR2CeWXHNmSeeiYQM6de6V2a6A38ZQJFfnZCjYUMy9+hfA/IajE3cz9xfuIboNRm4AAvM8rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 BL1PR11MB5383.namprd11.prod.outlook.com (2603:10b6:208:318::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 16:12:16 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756%3]) with mapi id 15.20.5654.014; Thu, 22 Sep 2022
 16:12:16 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "javierm@redhat.com"
 <javierm@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH 2/5] drm/simpledrm: Use drm_atomic_get_new_plane_state()
Thread-Topic: [PATCH 2/5] drm/simpledrm: Use drm_atomic_get_new_plane_state()
Thread-Index: AQHYzoStC26UzvqWsk+e88H/KdOWRq3rnNgw
Date: Thu, 22 Sep 2022 16:12:16 +0000
Message-ID: <DM5PR11MB1324460C022C2BF66196D4F8C14E9@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-3-tzimmermann@suse.de>
In-Reply-To: <20220922130944.27138-3-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB1324:EE_|BL1PR11MB5383:EE_
x-ms-office365-filtering-correlation-id: 90fffb2b-ded4-45e1-cfa9-08da9cb537a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jRAob0ozAdl0u0BKGHI7MoXFy3FVa7gzXWfQ3jJG9JWDnaO0YFi5y8fiMWspdstqcbybx4qK9vwnKkL3TLXlETSLpzzqZDbD1DSSV/rRAX3gZXmH4s02Lg0BjDHCH3AoABjIt4r/GaD3P/j5eodMhtbJr1eJaqmTnOjWOYmjAeLoNm+wF1CwqB3s6nWH18cLnQ/QiQHssOS5mVbvBDvkcI3GJ4++k6+TeBLGJvkMM8mt8mCtTyzVWtKOzSCeKy97bMj15xoL8tXpEteoAM+2wLKIyj+8t5mh+4RSymUNcTSt/oU8HPgpJMT96Hd5Xd/TclG0MsUExViEYFMHJvLA4hsI3NaxO2+2t0PyRRiEezi9LNa8uahNc32zxYXOylGxmQkiA2hC2iQC3639kO1eTiWd99ZJoVgaqb+WaE6F9fuODRvmii/pu7RXDh0veodv6MU3O8TbwBh8sC9qrlf44whsykrZmUCvnqYx7t2VYy6Xwe64pMEkjEe9wMkS/OydsRMl47Zxtx5KoZrwutC0eysaD3ifl5d77TyAwYxOCaZrdeoUfmuvDWp2xzyzwBQlUe6mYR8enc/Pi/jCsYJjFn0YWCNjh70PvZHXkj4KtO0+RM2fCf2y12WHfX2fn7momWwBn5r1JvEYRo56uIr7e/1pDstk5GHPIN6hYahxjbgKgqLoYVcSa7rAIvkPlEitwEcLnhxGQLQpMEFBDF5s5xROtLIv8MSoOBzKPRjfsYwssi32hSPadC88t7UzvxYELnH15a9lPiopEyLVmSNQ8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199015)(66476007)(38100700002)(82960400001)(64756008)(26005)(6506007)(66446008)(7696005)(55016003)(9686003)(66556008)(4326008)(8676002)(122000001)(52536014)(86362001)(186003)(478600001)(8936002)(110136005)(2906002)(41300700001)(316002)(76116006)(66946007)(38070700005)(5660300002)(33656002)(83380400001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4HAeVx14g+gJmFNU1t8d2/iziTOweSAT55O5EOqh/CQXK7e4OxkFeZqSyKHe?=
 =?us-ascii?Q?jbjSv1i10H+Z0Z1FbqZMjW3MiWDHNE6btikGLVBzOct4jJECs08IEWRmfHlE?=
 =?us-ascii?Q?Uw0C/3Ov4Nc2FbpMWKJPsISqyVBbWvTlCPR1hBwyJB2tZ5UodllKaQmrAj4g?=
 =?us-ascii?Q?2BFX5cVjiE2zo0ukQGl2Mc4xuCagiGCLgJO7iJaBYIFpfmPINSW1wGWv9BeX?=
 =?us-ascii?Q?u894e0LCfX8MOZ/F0W2NOaqCGnDdWxuhyJuYGn/GhhSHg7E3v1y8zqzmP+mX?=
 =?us-ascii?Q?wCqvvh24CZWajLdVLyWGcyEJ3KdjO6vxTtNqwQsBiNcdpRYAeIx0XS2U1fm1?=
 =?us-ascii?Q?Uk6gUabFLekRSkITM0LH/NTXJ5Rdg4x7cqU7QCxmDxu8HD+rDvbANF7IUtxi?=
 =?us-ascii?Q?GRBpySNb9zLvmHjlEwT+uuVMoyzoZ8bFpn7LuyZIQQKtisjjZvE1g369cv3b?=
 =?us-ascii?Q?OxiVeQa7kkgODl+OcQ3cq/DHwfx+nigZwEL6tiSY7vlgSgHgYtXfwNmbCoM9?=
 =?us-ascii?Q?pL9yMdzZIB9SbW6nLMT04W7WTaVs9WasDmvOU5qZCnmKNk69hfD4iG4CWYO8?=
 =?us-ascii?Q?zsYSzxzO1nkpCJgw7kafy1hBV2h3H8AaUJUso+IHdJDHTBp/R6mPug8lia7l?=
 =?us-ascii?Q?32oYSCqAOvmnKgAKDAcuwR/1GDsJAploxxsDDHd3LuNcqAhXZiE63vQumlOU?=
 =?us-ascii?Q?hhp9PRgshQw8ZUJ+DApS9H+1PN35l4+XYaQ+wV2jMYJG5c8iWL0F2KvN1V0O?=
 =?us-ascii?Q?JCsoiM5NKY6TGY58Cv/1Hh/iFlnV4fFzT1ko0TKzUjke8Z6jW4X2YNSVrLF8?=
 =?us-ascii?Q?kf5Fk8XvUrcrODGQK08C5UqapljetcackT0saXTiEbqN7gV0PXQL76Zb9ab5?=
 =?us-ascii?Q?B7GdTHGSEhtggeoSuOwgBgBshI/d99v5DQ2hWn+ZL94HjSBJBF++CA754e7A?=
 =?us-ascii?Q?KNqNYVWtmZ9TydKSq0w1tAP20x3HrDRlCojvR4ClER47FS1KN2w2w3RTeg0O?=
 =?us-ascii?Q?2LmbK6RfAOE6+oFOyHIwCm3EMvdqWJZ5OGxJNPDGDmDCNiVPpJKBA64mLPbB?=
 =?us-ascii?Q?EF9CeiF2rj9cuBmgNSzwfUkXE7DJr+u1MFCeDMcfwBcB+o/5uScGIKXrNAxz?=
 =?us-ascii?Q?YoYj7DkxC7InKe6ECAyMEBiwvhoH8lOGhOCpIatliIkEhgwYqkntU/1oO9Dd?=
 =?us-ascii?Q?UkPtqAdPcbUnVOn+AnKNf5i0y4g8lz3/xXGmIblOTR/xEIDot/bA158PxvIx?=
 =?us-ascii?Q?oK9H52kb9P0dM9WYxKgloLTaPnascR2JM02Z09x9F6IgoEqww28j3C/QImvG?=
 =?us-ascii?Q?FVaSq3zOdrHOirZYFWdSiz1xcDc0MYuLqforVBiJeg1WPio89ChqoGrXRHKl?=
 =?us-ascii?Q?tVkeufbmNlB37JxcwVkiLncRbjBwBFU0nlOCm5znzRVerKs0xQFBzCuX6T5C?=
 =?us-ascii?Q?erox32HYcIzCV9YvyOF2nqlpUqRIFBo+290jlI5ydeh9CC32LgDvCvUcytb8?=
 =?us-ascii?Q?3/CXQLScPa8Q2qndCamhflcLGcF6a4bubu5J2g9D665NRyzW7I10ntcxfEkH?=
 =?us-ascii?Q?fwTwdR6/k51OG+iUtBSeiKthDC/CJf+DnDbh9YjT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fffb2b-ded4-45e1-cfa9-08da9cb537a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 16:12:16.2464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5HgOklaqTq8CRsULWR7d16Y6fgSPz5eXvJ/CFcZdRBysFP1hjM4vSvNLRGsiZMjPz1Zl28mT/Oro6p9TUK7zCt6yuHnJy3Jg/aANHo0DnRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5383
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Thomas Zimmermann
>Sent: Thursday, September 22, 2022 9:10 AM
>To: javierm@redhat.com; airlied@linux.ie; daniel@ffwll.ch
>Cc: Thomas Zimmermann <tzimmermann@suse.de>; dri-
>devel@lists.freedesktop.org
>Subject: [PATCH 2/5] drm/simpledrm: Use
>drm_atomic_get_new_plane_state()
>
>Lookup the plane's state in atomic_update with the helper
>drm_atomic_get_new_plane_state(). Also rename the helpers'
>state arguments. No functional changes.
>
>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>---
> drivers/gpu/drm/tiny/simpledrm.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/tiny/simpledrm.c
>b/drivers/gpu/drm/tiny/simpledrm.c
>index 51d01e34d5eb..14782a50f816 100644
>--- a/drivers/gpu/drm/tiny/simpledrm.c
>+++ b/drivers/gpu/drm/tiny/simpledrm.c
>@@ -470,10 +470,10 @@ static const uint64_t
>simpledrm_primary_plane_format_modifiers[] =3D {
> };
>
> static void simpledrm_primary_plane_helper_atomic_update(struct
>drm_plane *plane,
>-							 struct
>drm_atomic_state *old_state)
>+							 struct
>drm_atomic_state *state)
> {
>-	struct drm_plane_state *plane_state =3D plane->state;
>-	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_sta=
te(old_state, plane);
>+	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state(s=
tate, plane);

Going from plane->state to drm_atomic_get_new_plane_state seems like a slig=
ht function change.

If this is the equivalent and the "right" way to do this, should the ->stat=
e part of the data
structure be pruned?

The comment for drm_atomic_get_new_plane_state also says that it can return=
 NULL.

would plane->state be NULL in this case?

Thanks,

M

>+	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_sta=
te(state, plane);
> 	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_plan=
e_state(plane_state);
> 	struct drm_framebuffer *fb =3D plane_state->fb;
> 	struct drm_device *dev =3D plane->dev;
>@@ -503,7 +503,7 @@ static void
>simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
> }
>
> static void simpledrm_primary_plane_helper_atomic_disable(struct
>drm_plane *plane,
>-							  struct
>drm_atomic_state *old_state)
>+							  struct
>drm_atomic_state *state)
> {
> 	struct drm_device *dev =3D plane->dev;
> 	struct simpledrm_device *sdev =3D simpledrm_device_of_dev(dev);
>--
>2.37.3

