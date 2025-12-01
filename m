Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CDEC9652B
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB29310E37E;
	Mon,  1 Dec 2025 09:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kgg2BWei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DC910E37D;
 Mon,  1 Dec 2025 09:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764579963; x=1796115963;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CEbLg56P+HMCosmdtSGLi/PYSKuZzNnIALA5M/nhe5s=;
 b=Kgg2BWeiPrdgFsjmPfP9UqyRZ0aDhed89Si0zD5yJKJtW4hBP4HZeWyr
 sICaKogdbJGsCwkLRkWYh8+0Xyu+S9sYaDQGVBK8hpnGDFkkTCXavvffg
 EaquRa3VBDARJBkDXmQge5ZkGeBck4qzAQcjbeHYpLndOsj9uNoChu6nL
 GXj3KRHBsoCBRC5WDqcZGzQI4WtvReAe5+nBiWVYjwXFf+/MJMwzVOzSe
 wDUXWhzDJ9lZZZAxN+mfqFiw4qQoYuJmXS87p8CbAXmlL7XKPOUFlxD1P
 yw66ky7+nejN8Isi/3PyRySAfrr7CLOnpGoiCue+yU3C4GcMkXFQBt7zf A==;
X-CSE-ConnectionGUID: PDMCTd2PRLWVwoKG3wl7/g==
X-CSE-MsgGUID: wQU76+9pTWyTbEwtC8TofQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77864348"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="77864348"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:06:03 -0800
X-CSE-ConnectionGUID: zxoTk2AWT2C/JTT5m4xlAQ==
X-CSE-MsgGUID: wJJ/36wDS5G9EUJx8lSk/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193833670"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:06:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:06:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 01:06:01 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:06:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/uonFAFxKrH+0mJuz57Tse2l2k+sAYJyNg8OFLWLpmglEoINWy69biN4oUjAgX9U1GsnxDj/MbC8DJ63ziiwnY6CjNoZaOp/XK94pJLXClxqkpoJucHiPnqCoQHQzPLH/k5v5UCyTIUmbSzN/RXsAw2vnRyHycrHF4YeFkf+wJO7LtH6FBhpT1XPc6amY7pGGM78t6xEDJqcPr3Z0wKn2JnjX7G6lzX5R6byesl/Nzoc/VFpd21CGQx/5l9UFOkmxYhw6ukhupLkub1np56TrPZcPmkMv10HJIuoKz5i4T+RbxuudR+UtIpIAkWAe02lojGgIH3WATH8xPv/Cp1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45rBx1hjyIgwZDbbmwY3/tzsb+dvEi3WfbE4pdWs3oQ=;
 b=ie0rUjyhUvpyGKUaNqqpjqySUwwrsnWjG1xgTIVIMmRUUE7kQElGFav3ccgHq0YYC6fgltGQa51MncTMYiz3bwYgcrWuLy9gqZuYR4ImVNxTEeeb/a/Z/rpQIp1wzSRM2UA7EhHZFXSUGJKD51emVmX6fLIl4sLLLZhhzB85MeViu5DNbCx4+wXCqJ3dl8MMuusFpNRjhA9or3RrNqLc/kHinSzZFhorMAKjrsemLK7o9ixhoXATRzD7SDxw/rD5oSLIp92BzFuMJrGcWPFw9Esv63lug9Z9FA91myDh2X8yVHcKqbUKiJq8qEPWur2V/sAXKamxPJ/Ed6DfErTZIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW4PR11MB6959.namprd11.prod.outlook.com
 (2603:10b6:303:228::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:05:59 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 09:05:59 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [v7 05/15] drm/i915/color: Add framework to program CSC
Thread-Topic: [v7 05/15] drm/i915/color: Add framework to program CSC
Thread-Index: AQHcYozDQ3luCCqkSk+KhgcKnmj3cLUMfgpw
Date: Mon, 1 Dec 2025 09:05:59 +0000
Message-ID: <DM3PPF208195D8D8E3E1CD0512A24E95518E3DBA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-6-uma.shankar@intel.com>
In-Reply-To: <20251201064655.3579280-6-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW4PR11MB6959:EE_
x-ms-office365-filtering-correlation-id: 073e32cf-4c7f-4115-2d6c-08de30b8d81b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IMRqTSTb6IgOzc2Rp+6dyuDSzFw7gActQiXVORVhwNRpRkySyOBv0WAycVYF?=
 =?us-ascii?Q?fVJctFP/o1OF2GuBAyez/aVdzqKqOKB9d+Y+ge59lL7FFcE6Ss5/wZmUD8ZF?=
 =?us-ascii?Q?0GvSADMuy4IOcoyjYIt5eeXVrdt7rAvA1+PHhOh9RwgnNJa7UxtZoWzZ5vfo?=
 =?us-ascii?Q?OlE4zKms2lznK85FQIw4n/cbp4pRV0fpsnTHOMbX6ann7Ga2kE1Tuq5vC8Me?=
 =?us-ascii?Q?pE1KFRwzMfY4fQgAJiXIW17qvR+k5U+2VZbnqtJhmtqpg4k5ajSRxckMYDlq?=
 =?us-ascii?Q?IyftUn5kzqZHsh+ISMUWV7wzKbuWAhCr+vh6rdpUpvHPkKm3w/qOUVgv0X3a?=
 =?us-ascii?Q?k6jGzwbxUOUm3KELJ5jEYE2l0T+LuuWqVBFEc4r9liv0ixGPSCU4sQ36S7sc?=
 =?us-ascii?Q?M7Lhv+dUDW5LmUliXolbQhXLZekOmaxqW2fXvZWrn522Rl/8TGfGh2s4rNd6?=
 =?us-ascii?Q?aFfpzSJ0Jx+ioWNcNJ24UXkxCrYcJir92a/3NC62I3URzfIMlG1BlowvlUMi?=
 =?us-ascii?Q?i1N/BGtFUycVvPewf7A3/rEQqGTL5WSnhKgvDnNaRDSQucU+XjTv1ymZwJko?=
 =?us-ascii?Q?kDoYK7qeEhMsCgNRVH3gAkB6+JLkB2ydUv4pFB3j02AV5+bUTjuqMOW1r7jY?=
 =?us-ascii?Q?O58KomiOxYyR+rXN/AxQsfRSWsFsms9CVFe3cg0rPjXslqBVZIWhERxaVcv0?=
 =?us-ascii?Q?I2d28kOxX9i51zopZfm7XQeIeGMQfAbpVmf8qT4UzDSAS5MUHTx2UJizlCr/?=
 =?us-ascii?Q?ro9e8VGnUOIknJNPT2XWTrh5AVvzm2sZ7rbneHxYPljnF5O5pjwrlIfO83Lk?=
 =?us-ascii?Q?HsM3xxFK0TwJLUXWOtP7TscGP9iGKx0y4Y/L8vwMQTvqtb6lDa9TAUT/NAym?=
 =?us-ascii?Q?E/j+FZXk4SPNRJtmV6G3zCDtCr34PYUJ0SVOHsneGt53XlMrjdr5csH/TU7t?=
 =?us-ascii?Q?33HGq/Kzvp7PtvRgIQEZT/k2xZon/UaOpQDgQ6HCV9HZZZfXjRAkny8PGN1a?=
 =?us-ascii?Q?nlqTcmt5SYM8KY3bVCBgkHoqz26ng0Qjed/PElEJ68mJH3WfD0927pyz4CSA?=
 =?us-ascii?Q?/QRnOCUxLg6NH7WnQYNaHs47DPCfKikHuBagrDZ4XK0iDzNQJUC/KwVgdlFp?=
 =?us-ascii?Q?3SzEbPUcHeowTpgxoK+awF9BXZLqxHiDs5Cdtg2FnKDSD2rG9AknNaaramzX?=
 =?us-ascii?Q?sLNl2kkkFItoYWIDl7lgtz6m6AHVn0/UqNtpgD33sOfPYaMsYPLC2i4yRE93?=
 =?us-ascii?Q?IM/RxflXKKwNQDPbLXXRK4/XBve6Wbps4PsPlDEwrgHIfCHBulrOcd/gVoKo?=
 =?us-ascii?Q?zCw0ZxwJ3pzfxzfn+qLaqqGg5S47ID2/rcOwfIgb58qEfnedISbsvnMRntLs?=
 =?us-ascii?Q?Vo2dg/jJUg1fXS4rZK7OYAeCGnrMJepVgtLdGfzyvs+MqplCCXznNpCrNPfl?=
 =?us-ascii?Q?jsGzioSU0h7w6rbNmSDB1pbpB+gkQCHbgYyQwaojD85pQYnFHUjY1LbqkqWz?=
 =?us-ascii?Q?uG2CtSk5NTTXXp+WZ9RJNFlu7g3SuI/1njzb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QJsSfmG62tr0DNGb8nn7A6cSpyNzFKj4o42Jt6BaLgqihmLo4C8Ic2QmZe1f?=
 =?us-ascii?Q?OfyhBRtYoFsDTtpAWXWoftG578BfMXVodYcVXzVPOqLOfl46dtm8JkyXFYTq?=
 =?us-ascii?Q?Sh15ulIXPjIPYxcmjEOLKLkE8w63OCDIvF2UsCB/ttgU/3OZGan1RQMpOHFH?=
 =?us-ascii?Q?VugNZcXoDP2XK/glb/rdpz+uNjh58BMWF9KFCBuHmPikv8bOdg6Ow4WvJOel?=
 =?us-ascii?Q?x53I4UTU46o86pqmwpSxQgdhAc1XgiO1pek6RmmH5L30Ht/yLHLBr/85WG9Y?=
 =?us-ascii?Q?CfceMHo/+9SpFbm0apAPq3BIgPaA3ECIwf7Zkgscr0SwJ+KVbhDgw1S00SFV?=
 =?us-ascii?Q?SM0loY78EaQjsXiJvAQIeRZPIbo2F5rZ760Vg4vgyTd+SMZXy0H8Z3jIZvd0?=
 =?us-ascii?Q?CYpU2LiNNomkjalUpNEIfavxFi4vWATbcecmYlMHDtlUWB400A98yJe5PUQ6?=
 =?us-ascii?Q?mqzeO6h02KUpSqar+CHcj6gR/CIC/naLdariVBPps5E4Ef0f9ai8AjRDkMn1?=
 =?us-ascii?Q?pVlkEpxBDhdllo4g5jgMFoN0mTtOvnO4uzsE8zIBVJi+Ca2VJsI/emznguZI?=
 =?us-ascii?Q?fnvfmY/tCPEeZVHa/nfMNxztCKnJ7ppJR0l6jgcMJXOTh6mFRV6L0Phs7T48?=
 =?us-ascii?Q?HJKwbfkU8fIT2O7OxuZHMHJEB5E1PBKDen2fXPJArbmsPUoWg5zraAMde0qA?=
 =?us-ascii?Q?5oaTllIammAlUn0EfqqdB5Y9XCvWa/JmZg75IbhtNTjBUYhDQrm0CLE/sQkS?=
 =?us-ascii?Q?YHn2ay7mUHgRFHlILZLI8aXhcT5IkN/STxTNxFd5f3oKJk+3sAHqioad2DHc?=
 =?us-ascii?Q?aj4ALvFJHweQRh6t6akPDMtYZ+TdxDTn6c9YHGIGNQQEURVCNQuhMSlfpFNN?=
 =?us-ascii?Q?do+ix8KqNsxfU+AeokBn8om4sSQ3STBkaHTTp+tsQl+3svCX72rUHxU0u4Ye?=
 =?us-ascii?Q?jQr9ay7XxUF4IMYu9SVDx6DPSNvSPvRLjiJYa+qYQ16lCkxw2LVTCImGsL6W?=
 =?us-ascii?Q?nWlhKU6sFvh9xaPzeFoUq6hvYTTJ7gE9BgkfS2G5vt4CJjXiXHisuw3t6QZp?=
 =?us-ascii?Q?6ZpI/cxnPsXE8OepRhiGclMCs+34mwWbEmxmls2H1qnzzsBXDYqfYXYinYc5?=
 =?us-ascii?Q?o6eI7BQzYnZYX2ZZkvcQa4/H3YBB+NwMgkprhdjLcgNcoQRipk8ZqHe74iES?=
 =?us-ascii?Q?YSrWaOth9fRT+zMih9WZ/qZ508vTpI6kkF9sv1PiDZXBwpYJglrDzUdIcB/M?=
 =?us-ascii?Q?tV8UXs5PM7k5t7Tt0jshWLh48AsAlnu8kNZjTZspQcME3ElmK61er2WNIHqm?=
 =?us-ascii?Q?Fj4zZYdwZlsE7HFmMRWARWFBHY2sRlQhf4TqwiPmCd468uyBIYkY6bpzzjwn?=
 =?us-ascii?Q?i/g8dbfOOi3mxMpV08U32e8+KnXKaXXbFcd/3rFbotuTLudLnln3o1jN9HHl?=
 =?us-ascii?Q?AVGBXOaYFgbyGPpsEvmurPBQoh3c3LweTgGFOCEJ0pSl8N1N8ZA98u9uJ5iv?=
 =?us-ascii?Q?BVGUMrBXumPnJXGEZyDN8Uv6oct1ic8tATKox/XtC6FS2eHl8trYmOhVDcnu?=
 =?us-ascii?Q?TUbA6Zub0z4eZausF+rqAnK5b1wFz2eLrfX/61ow?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073e32cf-4c7f-4115-2d6c-08de30b8d81b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 09:05:59.0374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ju4g8bUMB2NRtNL+3Y4xaEtkJm//OFA4J9sr4O66FbKUd1pBkgedPNcCQzV7zd4jalJnAJp7BCa1ltn18m9oJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
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

> Subject: [v7 05/15] drm/i915/color: Add framework to program CSC
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add framework to program CSC. It enables copying of matrix from UAPI to i=
ntel
> plane state. Also add helper functions which will eventually program valu=
es to
> hardware.
>=20
> Add a crtc state variable to track plane color change.
>=20
> v2:
> - Add crtc_state->plane_color_changed
> - Improve comments (Suraj)
> - s/intel_plane_*_color/intel_plane_color_* (Suraj)
>=20
> v3:
> - align parameters with open braces (Suraj)
> - Improve commit message (Suraj)
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c    | 21 ++++++++
>  drivers/gpu/drm/i915/display/intel_color.h    |  4 +-
>  .../drm/i915/display/intel_display_types.h    |  4 ++
>  drivers/gpu/drm/i915/display/intel_plane.c    | 49 +++++++++++++++++++
>  4 files changed, 77 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index a217a67ceb43..33fe5c9b4663 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -87,6 +87,10 @@ struct intel_color_funcs {
>  	 * Read config other than LUTs and CSCs, before them. Optional.
>  	 */
>  	void (*get_config)(struct intel_crtc_state *crtc_state);
> +
> +	/* Plane CSC*/
> +	void (*load_plane_csc_matrix)(struct intel_dsb *dsb,
> +				      const struct intel_plane_state
> *plane_state);
>  };
>=20
>  #define CTM_COEFF_SIGN	(1ULL << 63)
> @@ -3963,6 +3967,23 @@ static const struct intel_color_funcs ilk_color_fu=
ncs
> =3D {
>  	.get_config =3D ilk_get_config,
>  };
>=20
> +static void
> +intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
> +				  const struct intel_plane_state *plane_state) {
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +
> +	if (display->funcs.color->load_plane_csc_matrix)
> +		display->funcs.color->load_plane_csc_matrix(dsb,
> plane_state); }
> +
> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
> +					const struct intel_plane_state
> *plane_state) {
> +	if (plane_state->hw.ctm)
> +		intel_color_load_plane_csc_matrix(dsb, plane_state); }
> +
>  void intel_color_crtc_init(struct intel_crtc *crtc)  {
>  	struct intel_display *display =3D to_intel_display(crtc); diff --git
> a/drivers/gpu/drm/i915/display/intel_color.h
> b/drivers/gpu/drm/i915/display/intel_color.h
> index bf7a12ce9df0..8051c827a1d8 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -13,6 +13,7 @@ struct intel_crtc_state;  struct intel_crtc;  struct
> intel_display;  struct intel_dsb;
> +struct intel_plane_state;
>  struct drm_property_blob;
>=20
>  void intel_color_init_hooks(struct intel_display *display); @@ -40,5 +41=
,6 @@
> bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
>  			   const struct drm_property_blob *blob2,
>  			   bool is_pre_csc_lut);
>  void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
> -
> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
> +					const struct intel_plane_state
> *plane_state);
>  #endif /* __INTEL_COLOR_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index bb8b8466235a..6d8217497583 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -646,6 +646,7 @@ struct intel_plane_state {
>  		enum drm_color_encoding color_encoding;
>  		enum drm_color_range color_range;
>  		enum drm_scaling_filter scaling_filter;
> +		struct drm_property_blob *ctm;
>  	} hw;
>=20
>  	struct i915_vma *ggtt_vma;
> @@ -1391,6 +1392,9 @@ struct intel_crtc_state {
>  		u8 silence_period_sym_clocks;
>  		u8 lfps_half_cycle_num_of_syms;
>  	} alpm_state;
> +
> +	/* to track changes in plane color blocks */
> +	bool plane_color_changed;
>  };
>=20
>  enum intel_pipe_crc_source {
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
> b/drivers/gpu/drm/i915/display/intel_plane.c
> index 7b7619d59251..328b12af4d27 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -48,6 +48,7 @@
>  #include "i9xx_plane_regs.h"
>  #include "intel_cdclk.h"
>  #include "intel_cursor.h"
> +#include "intel_colorop.h"
>  #include "intel_display_rps.h"
>  #include "intel_display_trace.h"
>  #include "intel_display_types.h"
> @@ -340,6 +341,52 @@ intel_plane_copy_uapi_plane_damage(struct
> intel_plane_state *new_plane_state,
>  		*damage =3D drm_plane_state_src(&new_uapi_plane_state-
> >uapi);
>  }
>=20
> +static bool
> +intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
> +				 struct intel_colorop *intel_colorop,
> +				 struct drm_property_blob *blob)
> +{
> +	if (intel_colorop->id =3D=3D INTEL_PLANE_CB_CSC)
> +		return drm_property_replace_blob(&plane_state->hw.ctm,
> blob);
> +
> +	return false;
> +}
> +
> +static void
> +intel_plane_color_copy_uapi_to_hw_state(struct intel_plane_state
> *plane_state,
> +					const struct intel_plane_state
> *from_plane_state,
> +					struct intel_crtc *crtc)
> +{
> +	struct drm_colorop *iter_colorop, *colorop;
> +	struct drm_colorop_state *new_colorop_state;
> +	struct drm_atomic_state *state =3D plane_state->uapi.state;
> +	struct intel_colorop *intel_colorop;
> +	struct drm_property_blob *blob;
> +	int i =3D 0;

Nit: move this below bool or just above it keep all the struct together
Other than that LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> +	struct intel_atomic_state *intel_atomic_state =3D
> to_intel_atomic_state(state);
> +	struct intel_crtc_state *new_crtc_state =3D intel_atomic_state ?
> +		intel_atomic_get_new_crtc_state(intel_atomic_state, crtc) :
> NULL;
> +	bool changed =3D false;
> +
> +	iter_colorop =3D plane_state->uapi.color_pipeline;
> +
> +	while (iter_colorop) {
> +		for_each_new_colorop_in_state(state, colorop,
> new_colorop_state, i) {
> +			if (new_colorop_state->colorop =3D=3D iter_colorop) {
> +				blob =3D new_colorop_state->bypass ? NULL :
> new_colorop_state->data;
> +				intel_colorop =3D to_intel_colorop(colorop);
> +				changed |=3D
> intel_plane_colorop_replace_blob(plane_state,
> +
> intel_colorop,
> +
> blob);
> +			}
> +		}
> +		iter_colorop =3D iter_colorop->next;
> +	}
> +
> +	if (new_crtc_state && changed)
> +		new_crtc_state->plane_color_changed =3D true; }
> +
>  void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state
> *plane_state,
>  				       const struct intel_plane_state
> *from_plane_state,
>  				       struct intel_crtc *crtc)
> @@ -368,6 +415,8 @@ void intel_plane_copy_uapi_to_hw_state(struct
> intel_plane_state *plane_state,
>=20
>  	plane_state->uapi.src =3D drm_plane_state_src(&from_plane_state-
> >uapi);
>  	plane_state->uapi.dst =3D drm_plane_state_dest(&from_plane_state-
> >uapi);
> +
> +	intel_plane_color_copy_uapi_to_hw_state(plane_state,
> from_plane_state,
> +crtc);
>  }
>=20
>  void intel_plane_copy_hw_state(struct intel_plane_state *plane_state,
> --
> 2.50.1

