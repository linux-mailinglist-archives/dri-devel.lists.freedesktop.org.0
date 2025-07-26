Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF152B12B7F
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 18:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7A410E392;
	Sat, 26 Jul 2025 16:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZYTzwOl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAFD10E38D;
 Sat, 26 Jul 2025 16:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753548210; x=1785084210;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fdW2rZShIIb19/LIMrtmn/2l8JipdzmHapgBS3wG1ls=;
 b=bZYTzwOlmJi11hPxWX2ln7JKON15FzAO2sjspAxipo7WQ8khMVXSh32C
 v5/17sJJ+nQLf71FY4jyw0a903Eet4sbken/FdhA9wmCSJWkffySItPQ2
 1C4gn81FEK9HpB+aGHe5xsIP/GaTiO9X0o1LG1m01tI2VpLtc0YXWFl4N
 ckKunNTvIrZ9fjnMNmc5LbQOMztG63o6USIFXY+uxJwzIBFO10wg3lsN+
 X1RQO6ICs/eS/Cx8XI5Pd09mpfUIjvs4VDaYCb4nMFjgfys7EmDGvUQU7
 4TLFkSEju6W129k01PXM9XLXV1HGncgPSL91WlP1gEgJal2+/+dDBo9e8 A==;
X-CSE-ConnectionGUID: tp7ZBIW4R6WAiEQuiQDXOg==
X-CSE-MsgGUID: TkE3axc3RT6T+OmEOFTbXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="54936805"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="54936805"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 09:43:29 -0700
X-CSE-ConnectionGUID: Wtpa+zRhS1+cGiz4bO78Fg==
X-CSE-MsgGUID: 1IkrJ4BUSXWbidbL+g9BMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="160848201"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 09:43:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 26 Jul 2025 09:43:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sat, 26 Jul 2025 09:43:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.88)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 26 Jul 2025 09:43:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBHh+HrxjVXWwDTWeVjlbd8tngPit558uHHXJbVLf/5ozE1Uxu73kemf/gmzoYLz/SdXmnsplLWcrR1TQ+1e7TRC2PPcSmy+xVDX7tCLj3Vk/XV/DDVM942dPz/64Ju2v+hWO7PylWHftzApb0r4xQzufsQ3SXMc+PH0L0sayY8ydy+AGBA4G58xx6u4wxyH9KX9jTl0DqINi57J6jAXxy9omq9Wm/L66I91/PoeIcrrzH2t0uAT1hA75QDJ0/m8mhIBLJWrpP3Y+kkZXtSzm7qYKjoOeUfxM6n7CxleNBnDnYIx1bhr6WdaMqRMrieSQpcBpfHsj0ERjvZeHHcKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNNZExlACwu57zh6kPpDgI3bVdNSQGlVBJ98j9tJCHA=;
 b=WkWBR5slhbLQCo9xqA7B75Vjo93BVph8LHdkKjluEP5JusjDjCzuYGAoGlYLVt04FBSzMsuoVzOd36ZYtklo2H8pzu70ozaXYyKgwaJXmXy0uAfxl2bAPNY3klOQ9T6huRvh8EHl63I0n9tlALqMD1kogoOTWANjdSMfs4lblIRr7TIcTSo3krz8IM9qzWT6ZrEzkK8bRDz6skUwuYFpEmXo3ooSLR7bi05IDV3d+h5JOgp3PBNWdnqlm0NV5M86Zc6fyShB7Fdb/1pVsUzqO2XrgjdDbztmSHmKfBotPQnDWqUpgzVA9TL1zoWHmyOE+3NfhPjYSI6dHg+sQWb84Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW3PR11MB4556.namprd11.prod.outlook.com
 (2603:10b6:303:5b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Sat, 26 Jul
 2025 16:43:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.8964.023; Sat, 26 Jul 2025
 16:43:11 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH 02/28] drm/writeback: Add a helper function to get
 writeback connector
Thread-Topic: [PATCH 02/28] drm/writeback: Add a helper function to get
 writeback connector
Thread-Index: AQHb/SGY84ptMKITWU2hbXUI8JyJfLREVPoAgABJOQA=
Date: Sat, 26 Jul 2025 16:43:11 +0000
Message-ID: <DM3PPF208195D8D93CFB788A26D027CF5CEE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-3-suraj.kandpal@intel.com>
 <wntb2pbszt3aavfuztv4wvr3dxwvpuk673d45xefmp6arb5qu3@s22k7yw5ykjm>
In-Reply-To: <wntb2pbszt3aavfuztv4wvr3dxwvpuk673d45xefmp6arb5qu3@s22k7yw5ykjm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW3PR11MB4556:EE_
x-ms-office365-filtering-correlation-id: e3bf06e3-0b9a-4145-f40b-08ddcc63826b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?FqCkyiBrwgGaXgIYrlJ8U7RXutaju+F/4WIrqPVMjMhU9SqjcjRuf33dWYD0?=
 =?us-ascii?Q?EmzmHeA9v96AxBimgftJOwJP2Xkhk0mBHsQN1t3u5KbRRE3HWMNBuki15bxh?=
 =?us-ascii?Q?dz46nlAy+cTjr+qqbiBcBVMoj831kWw3qS1wUtLxiUsfL2L5r4lNTgtJFKFO?=
 =?us-ascii?Q?lsztO8q4MDP93opQ2i5LYFo7ukVkXZEahb/ftkZS0YAb2zVWAH6IQN6ooJKz?=
 =?us-ascii?Q?oB3y1XKDRTPzKNZ+N51Jp9AVbl5w9bUG9RRvpfMIsQZRFdQpH3ee4KxPxiME?=
 =?us-ascii?Q?whku7F3baId6/rLJDNKN+YN9GTsWANLhUjweOHYrSlridHNlLEEf+tRA2e8n?=
 =?us-ascii?Q?Isl9Kr+UvvtxPY1aKe87xblNgMc5AtUoT/Kax2ABa8qQcXFM/No9nhsrtT2S?=
 =?us-ascii?Q?Xi5jB+NvC6qPNjuHegdE20WucbSDOrhlhJqbitltFIM844k2hxAsMLlXQWQX?=
 =?us-ascii?Q?Dn+NO8Ae4QwJjGVXtIyPI2LqpQyg9FNXwpVZ6XXKNtfwzkl2nVv5j53f3mXx?=
 =?us-ascii?Q?QOX2QnYIfCBRh2h92KmAf/OoQWgYfr+/W8B3X5IZENKUl0K+UCv+EF5RKIH6?=
 =?us-ascii?Q?9bVSlQk8cESg2gX5TmcEIQlVW1jqYt5Qn6RdSU1mUaOwPpScQ7MhkvIQkSHq?=
 =?us-ascii?Q?2MhUANFcOmgValf038aipXXcFtFOuROkwcSGuFdEV59h1+vpn3aF9TzWS6pV?=
 =?us-ascii?Q?EKdm12/IkrWv5QvYT1eng4UR1XYajpztxpDBMpWXHt/zziyVB+oxVQMmww+t?=
 =?us-ascii?Q?zlA0WhMp3tu6HVDrHYmOyO1EtK+mxVedGUgud8l6kvcWZI64d8zrv5kJUjMi?=
 =?us-ascii?Q?a4h7Oo4P4Zv1lz5QSMRdb7YROOQV3tYoTHlEBAE2gFoJiHdajTH9ukdh0NQH?=
 =?us-ascii?Q?hbgDimf4/OygK8aif9Y76VVL4TsxMjwNkaBrqZMD5syWZElwzjnigCeKhfk+?=
 =?us-ascii?Q?WEue4T6fmte8Fn+C5iMCnaJ2zD+SgqmD9aXJEi+HY2H3d2rFOz5G6PseLaie?=
 =?us-ascii?Q?Ipzys2c6P0yXN7hJ/XKNMDlC1nrWqrC7vXSk9gn3ww64vpSkMzU9OAT/klz7?=
 =?us-ascii?Q?qlrJ0bP1mqOq8cZri+zO8e68CTt2ZsL4VOEKXROkkaGp9EU8tOZ+/XQeXh1l?=
 =?us-ascii?Q?L+YGiMvFU1EErh5wBT5yahUvzKKkxQ+aAJbCMifIaU+JWKoRXwQlWZe6+xUs?=
 =?us-ascii?Q?7v8/iM28YXh7XkqBCc95/fPmZ23tMeHu/PuFneVMSRMVTOdhBd2PU4KwdPrz?=
 =?us-ascii?Q?3j88wR7gtvcCQBKhhJsffuttiGrqqrFl8VZMP9syuKHO0XYVnGrsad1Jx4SA?=
 =?us-ascii?Q?t9FrhReBroeidfnqxQo3H7h1+B/yfnkmq4V9yypQUS+NCSCNAhZOQM6ck3em?=
 =?us-ascii?Q?Hh4U/iFTUPsLdL/5SCauUL19ks+YddrJZrVbBWx36Ppk9S+XrC9SPwXxW/ek?=
 =?us-ascii?Q?8iiLFEfs9v88ZvmJ4ca9MIomGUxqkzpHLWgc+gEghsNNDSmyAR5PWw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0IZPIkS4vRSmOB4hT5WoIgm6Td0iNWbo6+km9SvNQ8R0frRoLEWqu2FL8eNA?=
 =?us-ascii?Q?kAA0dhk9DRsgMpZeoXKP8+Tw/Ha4WDwFfuNAvcJCTlq3e5cYCkQlG+earJHI?=
 =?us-ascii?Q?s1DQqtu0/BXIAxHkzaP2wvy0TDN+JX4LcyemsZ8dPYLqs68P9DLxCr/UvLfU?=
 =?us-ascii?Q?RBkD6kvTxqiAdJO6H3M6t/nSoacbn9KindpYigtTSe5EPykZTI/6xF4AEm5y?=
 =?us-ascii?Q?n98uV9u2ukoWhXOW40g5/BRmJh3eDbLiex5XQGUH7c4U+TGMSWJthcqzwS5B?=
 =?us-ascii?Q?UF/F82jR4RTJma7/AE5tnGA7rTnqVU01jlfh/3ndTBUJbLsVTdMDKqQNb9d6?=
 =?us-ascii?Q?EY6zuXK2Tg32SuQdE4STS1wDAxx+H5+YFh0ABy8lXhqY/UGWJUb0/zNpI87H?=
 =?us-ascii?Q?b1pbS2rM7D7G+OVFjQ7USOdp5dAGANXMI7PjDYzn3+zbzglWXih0ThZYEbYW?=
 =?us-ascii?Q?fsvCg4nDERmbI/QdNE7irM8lhCnG3qsjVnMWJaZu+yO/8YFpAuZfGfu2H9rc?=
 =?us-ascii?Q?2jxGyjkCDFtH0VAgpQ/wSWOj7TB1/KASTaC4Uj36jwTrkoYyXotFsrZaXPUV?=
 =?us-ascii?Q?gDrgS8yUxzMvsYW5QyPk7n1Foe4bMEdlT8wH6K9fagy1csB7OL74XPASnNzw?=
 =?us-ascii?Q?GOVETXzJwEWgLWBuCz/QRkAfeGdx1JcTKCC/KszZAhYJ2s9f8kuVN3KZm+LK?=
 =?us-ascii?Q?WsQQMWfSdG/C/0IsP3fin08CzZPb3vQm5BDikCoLcgAQaRvj1dqkc/X0gJZu?=
 =?us-ascii?Q?ktqNq54XUnve+mlMA0BSWl+9Zw3h+R+voM8aOEn5Fh/6ERafPtTsBqAIkUMx?=
 =?us-ascii?Q?bElxw0t3vs+vIMzVK8/ScIF91na5ZIA9My07twz/C3QGhOahQDU7bvzoxymJ?=
 =?us-ascii?Q?ZR98855AiD0EeSfKnxFFQXfa31FzaB+hBnKWz1FjO9uyvFjp971kElgR3ZgW?=
 =?us-ascii?Q?zS32RFWFoYAfsHmLdZ6a6j7Otwg4kSaPbnykn5RtwZc1As/1EEZKUtX2Fqkv?=
 =?us-ascii?Q?VKgnSopuJZhH58+1hFtDI+2GRPOwe/Vz9U4ns8S3TncHBVhmnuvLvIYGf5sV?=
 =?us-ascii?Q?BvzxdtfKSc11wkkIqrkAFy5KzBnO1X3sQFNphYh70L4fHhoNW47mnm5ElNC1?=
 =?us-ascii?Q?4bGJe5OcRYLAhe2gJX2RBE6jhrAckr9fzlStJBxWw77Njb4c02yX0tIxq5XD?=
 =?us-ascii?Q?vG1nFsIx3l98h60WvuEzZRuQKY0BaKtnknV5CapGuUPufxJVRO76CiGdEUJV?=
 =?us-ascii?Q?+4U9iIUQP2e0UbZmBgp3ddXeae5q0U3LHw6ySH8MAI6nttt5WKyo/pmDHRbx?=
 =?us-ascii?Q?IP6Zs2Lfw8zwItnzeeb2B86xDJPFAjMh1lbS77imWKnH5fbfEZldLb8lYmpp?=
 =?us-ascii?Q?YDv0fy4gc4o5AAxQLL/v6MDPbjiX/nDc0Za1PxX+Bbc7nDjSsvcoQpxh41aB?=
 =?us-ascii?Q?/ss3E4KhYYwD3rXZVtUpDlRKM46oh+TTnhx+EKwEBLBy6/ed12gY8wBBznQg?=
 =?us-ascii?Q?rFIjN5Egx89QaQeEjRDCy5Di+gjWFtvxCzfJks1ltPekA6KdG4NbFSeK3yMW?=
 =?us-ascii?Q?q4m5+0pY9hBHPa8DVIzBjeuZ2cmQYMLSeLsrOfu6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bf06e3-0b9a-4145-f40b-08ddcc63826b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2025 16:43:11.8286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5v6+/VD+uuSs1scABRqUwblExPmncJcwfd+5ILoR1m4/aYnNPkBxS1RwMwG+LFzrtLsieweCOOdPpUvPy13RIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4556
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
> From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Sent: Saturday, July 26, 2025 5:50 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; inte=
l-
> gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>=
;
> Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>
> Subject: Re: [PATCH 02/28] drm/writeback: Add a helper function to get
> writeback connector
>=20
> On Fri, Jul 25, 2025 at 10:33:43AM +0530, Suraj Kandpal wrote:
> > Now that we can initialize a drm_writeback_connector without having to
> > initialize the drm_connector within it and leaving the responsibility
> > of initialising the drm_connector and maintaining the association with
> > drm_writeback_connector to it. This helper hooks lets drivers return
> > the drm_writeback_connector associated with the give drm_connector.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/drm_writeback.c          | 14 ++++++
> >  include/drm/drm_modeset_helper_vtables.h | 59
> ++++++++++++++++++++++++
> >  include/drm/drm_writeback.h              | 14 ++++--
> >  3 files changed, 82 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_writeback.c
> > b/drivers/gpu/drm/drm_writeback.c index fa58eb0dc7bf..e9f7123270d6
> > 100644
> > --- a/drivers/gpu/drm/drm_writeback.c
> > +++ b/drivers/gpu/drm/drm_writeback.c
> > @@ -107,6 +107,19 @@ static const struct dma_fence_ops
> drm_writeback_fence_ops =3D {
> >  	.get_timeline_name =3D drm_writeback_fence_get_timeline_name,
> >  };
> >
> > +struct drm_writeback_connector *
> > +drm_connector_to_writeback(struct drm_connector *connector) {
> > +	const struct drm_connector_helper_funcs *funcs =3D
> > +		connector->helper_private;
> > +
> > +	if (funcs->get_writeback_connector)
> > +		return funcs->get_writeback_connector(connector);
> > +
> > +	return container_of(connector, struct drm_writeback_connector,
> > +base); } EXPORT_SYMBOL(drm_connector_to_writeback);
> > +
> >  static int create_writeback_properties(struct drm_device *dev)  {
> >  	struct drm_property *prop;
> > @@ -443,6 +456,7 @@ drm_writeback_connector_init_with_conn(struct
> drm_device *dev, struct drm_connec
> >  				       struct drm_writeback_connector
> *wb_connector,
> >  				       struct drm_encoder *enc,
> >  				       const struct drm_connector_funcs
> *con_funcs,
> > +				       const struct
> drm_writeback_connector_helper_funcs
> > +*wb_funcs,
> >  				       const u32 *formats, int n_formats)  {
> >  	struct drm_property_blob *blob;
> > diff --git a/include/drm/drm_modeset_helper_vtables.h
> > b/include/drm/drm_modeset_helper_vtables.h
> > index ce7c7aeac887..6b89b33d2304 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -31,6 +31,7 @@
> >
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_encoder.h>
> > +#include <drm/drm_writeback.h>
> >
> >  /**
> >   * DOC: overview
> > @@ -1179,6 +1180,25 @@ struct drm_connector_helper_funcs {
> >  	 *
> >  	 */
> >  	void (*disable_hpd)(struct drm_connector *connector);
> > +
> > +	/**
> > +	 * @get_writeback_connector:
> > +	 *
> > +	 * This callback is used by drivers to get the writeback connector in
> > +	 * case the init is done via drm_writeback_init_with_conn. Which
> means
> > +	 * the drivers don't have drm_connector embedded in
> drm_writeback_connector
> > +	 * so they need to send the associated writeback connector with this
> > +	 * function.
> > +	 *
> > +	 * This operation is optional.
> > +	 *
> > +	 * This is mainly called from drm_writeback_set_gb.
> > +	 *
> > +	 * RETURNS:
> > +	 *
> > +	 * drm_writeback_connector assoiciated with the drm connector.
> > +	 */
> > +	struct drm_writeback_connector *(*get_writeback_connector)(struct
> > +drm_connector *connector);
> >  };
> >
> >  /**
> > @@ -1192,6 +1212,45 @@ static inline void
> drm_connector_helper_add(struct drm_connector *connector,
> >  	connector->helper_private =3D funcs;
> >  }
> >
> > +/**
> > + * struct drm_writeback_connector_helper_funcs - helper operations
> > +for writeback
> > + * connectors.
> > + *
> > + * These functions are used by the atomic and legacy modeset helpers
> > +and by the
> > + * probe helpers.
> > + */
> > +struct drm_writeback_connector_helper_funcs {
> > +	/**
> > +	 * @get_connector_from_writeback:
> > +	 *
> > +	 * This callback is used by drivers to get the drm_connector in
> > +	 * case the init is done via drm_writeback_init_with_conn. Which
> means
> > +	 * the drivers don't have drm_connector embedded in
> drm_writeback_connector
> > +	 * so they need to send the associated drm_connector with this
> > +	 * function.
> > +	 *
> > +	 * This operation is optional.
> > +	 *
> > +	 * RETURNS:
> > +	 *
> > +	 * drm_connector assoiciated with the drm_writeback_connector.
> > +	 */
> > +	struct drm_connector
> > +	*(*get_connector_from_writeback)(struct drm_writeback_connector
> > +*wbconnector); };
> > +
> > +/**
> > + * drm_writeback_connector_helper_add - sets the helper vtable for a
> > +connector
> > + * @wb_connector: DRM writeback connector
> > + * @funcs: helper vtable to set for @wb_connector  */ static inline
> > +void drm_writeback_connector_helper_add(struct
> > +drm_writeback_connector *wb_connector,
> > +				   const struct
> drm_writeback_connector_helper_funcs *funcs) {
> > +	wb_connector->helper_private =3D funcs; }
> > +
> >  /**
> >   * struct drm_plane_helper_funcs - helper operations for planes
> >   *
> > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> > index 149744dbeef0..77c3c64c132d 100644
> > --- a/include/drm/drm_writeback.h
> > +++ b/include/drm/drm_writeback.h
> > @@ -84,6 +84,13 @@ struct drm_writeback_connector {
> >  	 * The name of the connector's fence timeline.
> >  	 */
> >  	char timeline_name[32];
> > +
> > +	/**
> > +	 * @helper_private:
> > +	 *
> > +	 * helper private funcs for writeback_connector
> > +	 */
> > +	const struct drm_writeback_connector_helper_funcs
> *helper_private;
> >  };
>=20
> Unrelate to the commit? Also, where is this defined?

This is very much related to this commit and defined on top right here in t=
his commit.

Regards,
Suraj Kandpal

>=20
> >
> >  /**
> > @@ -142,11 +149,7 @@ struct drm_writeback_job {
> >  	void *priv;
> >  };
> >
> > -static inline struct drm_writeback_connector *
> > -drm_connector_to_writeback(struct drm_connector *connector) -{
> > -	return container_of(connector, struct drm_writeback_connector,
> base);
> > -}
> > +struct drm_writeback_connector *drm_connector_to_writeback(struct
> > +drm_connector *connector);
> >
> >  int drm_writeback_connector_init(struct drm_device *dev,
> >  				 struct drm_writeback_connector
> *wb_connector, @@ -172,6 +175,7
> > @@ drm_writeback_connector_init_with_conn(struct drm_device *dev,
> struct drm_connec
> >  				       struct drm_writeback_connector
> *wb_connector,
> >  				       struct drm_encoder *enc,
> >  				       const struct drm_connector_funcs
> *con_funcs,
> > +				       const struct
> drm_writeback_connector_helper_funcs
> > +*wb_funcs,
> >  				       const u32 *formats, int n_formats);
> >
> >  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
> > --
> > 2.34.1
> >
>=20
> --
> With best wishes
> Dmitry
