Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4019F8A1A81
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 18:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C934A10F23E;
	Thu, 11 Apr 2024 16:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEzxcgjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C757A10F23E;
 Thu, 11 Apr 2024 16:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712854537; x=1744390537;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sqpDI+nith4zE04ekr6SOM96vl1EyVf1uHwXBOz+1sw=;
 b=QEzxcgjAawQQdVkcHmZmDHxnfeSyS09wM1aD/KNKpEvVSlZyhTPeiTR/
 MfD6W8jnZeQDKABtpSdomsLlnTa6CMce02x/SainsN8TF+fNr0u4hOtVb
 U0VGeF9o0SimBPWUmEE4vRbgc3eNdFI0BByTOhpDOg3002iz6fsI8cGPl
 mtCyq3BjdHbBC6ZOw9Zy2Rw164FADV2jNXkNuNYB9kYnReGprhdtclX5/
 VE1w2PErzvf4vSa3QsaxLw9aWZjB1QKPz6em+qwYU+NxR+sr1sNzhm1KX
 oXEx19vilzFdN/Gw1gniMIK4mGl0EHAjdSRxS3YO8Kyeg1CXQmGpvUySM Q==;
X-CSE-ConnectionGUID: epZIjYW1RwepZ3myD2ir9g==
X-CSE-MsgGUID: pblGCfEcTDeqMbqa2dgYYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18887271"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="18887271"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 09:55:32 -0700
X-CSE-ConnectionGUID: 9rc2ccV6T6Ki6ihoqQ5M+w==
X-CSE-MsgGUID: Uslv5jl+Q8KyxNJbsizV9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25613646"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 09:55:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 09:55:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 09:55:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 09:55:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/YqU/NVrITuQPdY9etFEreEdRsHjQpXe4bIUnZ8VYbDBBp0Zz66hA8gzpZWvFSSYeo+zFCWTAqDbw07JblbU3NoAQ0ZweLoxD6FEQyscBqlGVSYn6WUB8k4iSNbfdcUE87m0ozaLZaprRXCDg/OxUqydm8IhPSovJOpy9KOCqDcucjef2AxG7t2hfm3A+0c9dsXIQXNjZZmkvQ4ZD8C0AoBlif+TvddLXLsPgFG6l9zNItEFtj00q1SAzF4LQMhnrAwJA8LvqxX+GWHj9YBX9HQVeuyOBU+XW1HpdGM+QpSjVxBf1MEMaK3o6n1IcltToVE+/6Oq9fa2/ZHHcaGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8lBt11uH3bFhe0BHqQ+yrtlIxB09fd7OQU+ONw0Ns0=;
 b=UnpDKR7nbTRHHA4JrQkYyQQeduZ7Yeb65rK6FqeX6Awcy+FXpmP5bTKR/aZP2SoW8g0jddEOM5902FVBP2gq7Jm5uYGTm+4E6k4jFpNY7Uht4Zq9GoWYDGocCTNJyjsrVnc7Kqlx0CxoPSjrL452Xedr0/mhqiiHfZemwdcnXgkyGsus9tKkZq4DcMPZwqYF8DPZcansR7sxvWzptzbKjALP+47RdiD4euixda7NweMlKMisS/Qc2V3Ma/ygjvhvRXunm7nnDF4C1FsL003sOVaCsrHoIizgXm4o3VGrStCNqoTk4zd6ay5nfzPI8NVp13wqJ36B2+pSTulCpWADrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 11 Apr
 2024 16:55:29 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::e014:f1f0:90ca:359c]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::e014:f1f0:90ca:359c%3]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 16:55:29 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH] drm/dp: correct struct member name in documentation
Thread-Topic: [PATCH] drm/dp: correct struct member name in documentation
Thread-Index: AQHahyavaHSTPAJPrU6E1bsmYP78WrFht0wAgAGa81A=
Date: Thu, 11 Apr 2024 16:55:29 +0000
Message-ID: <IA1PR11MB6348E9B9AFE0EED886F7F240B2052@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20240405065159.439145-1-mitulkumar.ajitkumar.golani@intel.com>
 <Zha79kKYTltfOtDA@intel.com>
In-Reply-To: <Zha79kKYTltfOtDA@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|SJ0PR11MB4799:EE_
x-ms-office365-filtering-correlation-id: c0a70e1f-77fa-4251-6477-08dc5a4831a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: orJqkwkGqsQWv4AAxqnSKQM9J4ShPZFaCikICjAhMPUWWBk+Bwu9p+kkSfcg/1YkWkInyZ7K3eo9grhS75Ju7h8Zb1eTrK/6Eo2EqB1VSSGZ5YfCxQgaTV9BFE7jfwQ6XyrQxFgD/7eH948JhoqFuLPKmIl8lnvv2kqBijMN7IKDaS+ziH9Ne5U2ywG9f6SdfdPAcChmVz6InlHed/+2z0NewlZ7SHBOxF9vEzlUNOSOFVkwRRIsVxxnf+Tb3BRv8N1ADh+EROjlsIXwuiJXEbAftA3QrKYYdV0crWjxBFEgFh7MWmpZzoFgx7XDEyMVTD1ZVLm1FF8UkgPfgIpX9536MCrK+fZzMDVnPlcgl9/JkE8lLvWvAUZoimdi09/zDRx7nlwFR4TjGRAjkiV0Rb8a2qAV0aQ8boWUfqBn8DJu+J53Yq6x52pUxYXtEWC4w865iHwVrodyIVRhU5DzxKFtq3S5ctxIKgikAbzNDpYRWQiB4DVKMBkdfPX5npn7Pr+lEym2Nrih8Jnwal6Z5mHng3KRnKsokgt3yM5wkpbYR68RqV+bgSh5N54Mie6iQfje9OIWYyV8UqtV+qOEMI97VNPLQRQg6qB1yhKAc5PwyBKb5qXm8Bcqnf6nlo/nLOJ3YP+J8148RQOXmCwbaYSIUNtd3IshcSbmaS+UtLobodK9cN0afrYLkZezs81v8lE8CW0z2BaopvFNu/IMxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cX55r/IR0oN/8IWDCruJh15eWsZNARrCNc05R5Q0jEP59A/mUtoByKRotLv0?=
 =?us-ascii?Q?urHGFS3sIko+eiUL2vtaTzU8+6IDnkqzo7KeOP5a0zQclwfenDgnTwgq7/8g?=
 =?us-ascii?Q?DvJvpdzwgcmZ8l8dCK7cgb74Elj2PdaDzlXM2ablH6wOlG37zT0eJI3U8dvF?=
 =?us-ascii?Q?LcT/HznTYbau+B2xyKlaYEk3WwxJREvFg/IpKlsgtf7VdnsKoFrjQeMALyFr?=
 =?us-ascii?Q?uDgqHdLtUieRCkceKyxniPzoQB0NfEi+uVa+izP4dQFDOzQuif6lJosREFNN?=
 =?us-ascii?Q?HHbOa5jZ5DyLH+KzhrI7VfU4T77IygrwDrpg9FwJ3orCqz1I7MpOd12/8MvJ?=
 =?us-ascii?Q?ckyHMaBf66+npuOkdUSfrFKl8Xq6GVNnHvRvoM/LOGFV8mVAj7cYvN+V0Y46?=
 =?us-ascii?Q?fS7tI8SiVFl7lwfkpksNIqEo+LnWPxS0zkVCTMPaNqnT3IbGT3Fi/tj2d8Dt?=
 =?us-ascii?Q?fuMtyzukr+FXKHBhW9UWKNeBE2IJ4LaC9sfgiTkHVWRYeh8o2x66jclQDA0q?=
 =?us-ascii?Q?Sa7B6Yd219I0k5kKSEW+Ds441KY/dM3lvYQZMLxV5mWWx7nL3XZIhtrq+x4Q?=
 =?us-ascii?Q?TtBeTmgC/JNQEcHMoTExxm4uDteKHVW7K0A0dvhj/nVHc9DmFMClU0pwZjz2?=
 =?us-ascii?Q?rq1zNkgYqQgn7hz0lK8tXOGcZOdCZJspAjy0KoyFpGRBMr/Vtcw2eZ4De/FO?=
 =?us-ascii?Q?Gm/tzJo3w/U82SrALzXdTJph47cgeDUe1/I0o+ni93bl3I0UgDenWGPnbvPQ?=
 =?us-ascii?Q?FxxOZ/mqsO6UZum+zcKQc0DLaz3yDg6pdonm4O8YQtnxqUF5VV63ekgpBH8a?=
 =?us-ascii?Q?xg1Npoa70odwTLzWRMsgIsdihkECYrMgxpB8hwoPrR0e5IkEH2TeHwWreAKB?=
 =?us-ascii?Q?KNOTJHm5p+zRtniwl7q6aABKx9SE+Ekm7AUyoIpP7owK0M7YQbb4O9wC8uaO?=
 =?us-ascii?Q?CM9DPp6WmbWYLjI3vPcMpZJ41MReDAe4k+7sJYhKE/bsHcEHhvDnnavN92hM?=
 =?us-ascii?Q?RRQwkePtQAjL+EVeegQ1WZ+fszGrnZORd/bF/rVG2HjkbaRClow5tP3bq+gK?=
 =?us-ascii?Q?R9AISSSwfHQd98kE6h2nm19S4WBfs2uGaiF/RseRvBVp5cfd9Hn2aSj7IcYt?=
 =?us-ascii?Q?sTOPYlMiVBDfBfilG4jTd3AnfWd7JQhfLtV4Y4uWiSiZwMlWtzBUDzePYXLa?=
 =?us-ascii?Q?7BABQHtS4GMskgGaqKJTXKVCJQgI6WqDO7TKearRTWn4GiBq8tkuAnBGAIco?=
 =?us-ascii?Q?GGipSbaa1yTulv40w8Kb5NXIOcfrsa3dEa8FOKSnu7imuTnr/cTu2yQLWOlZ?=
 =?us-ascii?Q?zUL64rmUCS/X+1VIBOd6DLE8VVYITgqfzMlVdhWHDXQ3dPx6eqd4SMvR6o8u?=
 =?us-ascii?Q?PCR73NbLuv+dkO0RlYk4Wr7iqlq5p+Wu8F7b1mt7rysjyjDxq7YUuJScX4SE?=
 =?us-ascii?Q?aMPbBC/aVvTYVpJzCagB35pTRdGRNf+wRgoo8RFhy6/TaPJn/ndSWmokz/PL?=
 =?us-ascii?Q?e4DYGpVfS1TbLie1hl/9kKQ32USEvyviB9vQTQZTynjWNsQ3lWPWOOKCE0sR?=
 =?us-ascii?Q?JjamxHAYQrSsW9v4wihpRF3hUW1wQft1HiTTfZHrkDKvnvBLY0epduqQ7mMt?=
 =?us-ascii?Q?Z0SXCVgZVqAUdLKGvi8YJNY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a70e1f-77fa-4251-6477-08dc5a4831a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 16:55:29.6564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pi8O0BJBrbIj96nu3OCvAjCeHB3voRZj02PuYPzp5L4pBQCMDUzvLJNyy7Ed9t2P/ub/vsPtE85vpuQxpFlui4mYb5VBMPsNfLlQtchgh6W67ANU4h8hBFeJUmUSChGw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, April 10, 2024 9:49 PM
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> tzimmermann@suse.de; mripard@kernel.org;
> maarten.lankhorst@linux.intel.com
> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; Nau=
tiyal,
> Ankit K <ankit.k.nautiyal@intel.com>; Nikula, Jani <jani.nikula@intel.com=
>;
> sfr@canb.auug.org.au
> Subject: Re: [PATCH] drm/dp: correct struct member name in documentation
>=20
> On Fri, Apr 05, 2024 at 12:21:59PM +0530, Mitul Golani wrote:
> > Correct struct member name to 'mode' instead of 'operation mode'
> > in 'drm_dp_as_sdp' structure description.
> >
> > Fixes: 0bbb8f594e33 ("drm/dp: Add Adaptive Sync SDP logging")
>=20
> Probably good to avoid this 'Fixes:' tag, and only use that for real code=
 bugs.

Thank you for inputs.. I understood and I will take the future note. Please=
 suggest if required to update the change with new revision or we can take =
care while merge.. ?

>=20
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> drm-misc folks, ack to get this through drm-intel-next, where the origina=
l patch
> is?
>=20
> Thanks,
> Rodrigo
>=20
> > Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>=20
> > ---
> >  include/drm/display/drm_dp_helper.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/drm/display/drm_dp_helper.h
> > b/include/drm/display/drm_dp_helper.h
> > index baf9949ff96f..6799f57d635c 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
> >   * @target_rr: Target Refresh
> >   * @duration_incr_ms: Successive frame duration increase
> >   * @duration_decr_ms: Successive frame duration decrease
> > - * @operation_mode: Adaptive Sync Operation Mode
> > + * @mode: Adaptive Sync Operation Mode
> >   */
> >  struct drm_dp_as_sdp {
> >  	unsigned char sdp_type;
> > --
> > 2.25.1
> >
