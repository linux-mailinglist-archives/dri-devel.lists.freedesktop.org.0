Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A5FA13394
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9F410E8B6;
	Thu, 16 Jan 2025 07:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVXcT7AP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECF110E8B6;
 Thu, 16 Jan 2025 07:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737011334; x=1768547334;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZMANZRUpwzNZT2IVd2XNt5asSPDamOy4h08vTPOHG8I=;
 b=DVXcT7APOezcGclnkSo9upDYBPYrB0u6BalID9J4jq8PeDUe75OH0ae8
 sNe/4ISOHsfRb3nk8SlGTFkqb0DL3m4Da6L4ktj6WkItG8UMYKSO4liCt
 qIiDfnXshKtAulFDJW6pQ2NvmUfukZHjzfSRfXamid5Z8PYcZ1htD1yOV
 YgU3ny8SgBB2pBDzmqDvsNb1vh6cJSKjBRmlZnkTlb/pEU8uUXTwNMKHu
 6G6SCpJJw9uJqsiQS/NzZeo833xhFNO7sS1kOq6beMNPs8WL7kz6tu3hu
 KghOXUk5eSUcsU6XoystHgLGBkinZyVF25FbXBcfuO05PP9mwphMr8IRO Q==;
X-CSE-ConnectionGUID: DYAOcLmjSXqJvPxRTrjBYA==
X-CSE-MsgGUID: K6n9W0AZR4e5me6pDmWRhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="62751970"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="62751970"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 23:08:49 -0800
X-CSE-ConnectionGUID: QZk0pGzsTKir2V22RdbfkQ==
X-CSE-MsgGUID: 8Dzr50oJR8qb/keumObRsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="136239203"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 23:08:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 23:08:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 23:08:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 23:08:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVQuMLDVciFKcgAtzHO6YXrYYjKBSESo8u0+cevjDcbbfAyLT2HNCTY/zViFUmQfzkNmLmJxVS+83DwDwQ3kao1GOpdLXYg9sp9wYxPlgipDnzLhSIWshur4dfRWg51KUCvA0h6rafT1Q8B7FdVvoyIzDfxtYNmB5slxa2O6gNQyXm4TKuS+hTS8eo2qHRWl+PuD32klUZEkN4aPhRLfCTD/e8TI9nsvNpQ0/4M8whu8y6bhYePlXO4Vu3mgpn2OI16ubss2I9rD9vF1Z1Uj5b3n/NBzkhNHHiYAV26wlalRw+ZCBHivLxBRMEqCG/i7XV/fkdA8UFPhCmojsV49bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrR0/1eDIQYAYwNJFBUDjlpRFdkCoKs/TEUFX/kWOpI=;
 b=lbZBfiC5V/B/ZiKq0r84UydtduFLpfAhiZ81vpgNahGqXtUrXjwwNFE/C3rwQS/g1MXGlR3OrrLmzGbb2dgCISfwi7R/beXlV1OeloQc4DGeGAGCWGl69goBTKH+VEULxiNXBdgPdueY5Xxf62tAwpT9LVbJyIhzM9DihtKeRrmTWA3U0MqtZ3ochlQh6IWvEsRo/0rgDh3PBZFqICbmbpe77Z1oEG7Bzj8+rb5Igc7RXWqKQ5p/Ck54Z1dWoz1nvt30ZdLDseFLniIe9IudK98YUMnHwS30o6a0/buGZ12QrB2xyYyVG/MjuikAZALW+nAzy2jyiER5/VCi8NpfbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 07:08:46 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 07:08:46 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
Subject: RE: [PATCH v7 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
Thread-Topic: [PATCH v7 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
Thread-Index: AQHbYtFEgXOdJTxz0Uatj2h0T3Y1k7MYSSEAgACcqVA=
Date: Thu, 16 Jan 2025 07:08:46 +0000
Message-ID: <IA0PR11MB73075A89DAA5BF7D783125EEBA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-2-605cb0271162@intel.com>
 <i6j3zi5tlnyk2eonmpa5h5qitwgzs2nuzrvsasde3dci6a4ngl@qhbtsjbhq6xr>
In-Reply-To: <i6j3zi5tlnyk2eonmpa5h5qitwgzs2nuzrvsasde3dci6a4ngl@qhbtsjbhq6xr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ1PR11MB6156:EE_
x-ms-office365-filtering-correlation-id: 4c4b5283-05cf-4ac3-f721-08dd35fc9e73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/ZipUyQKorWHnrO4HUOFwyJqobGKzFOQzKfTMhL+0/uyCl4pRmaLA9s15idv?=
 =?us-ascii?Q?j+LN0jReWbS2QfEy9mN9k7OGna/LbDK8iPRHLZSZ98w62QR1UHrlxfLTLI8r?=
 =?us-ascii?Q?hDLNu8R+Ma6JIDwEMuot+r6+e62/P5KirJ9uNjmvAaHSjNL1iFFSatRdKjoK?=
 =?us-ascii?Q?g6jjfjvYevjgMkvD2vgBeYugWaonYzMfjVP654U3YPVgtkHcruxPqj6h33O2?=
 =?us-ascii?Q?pLDnmXwUthGdsqsHW5OalPShScVD937R1Af+x1816q3cr1zm6PUu+5RuT4Nd?=
 =?us-ascii?Q?FTS9cRSwTEqZxt/sHxCKM2usVuIXMrMLYD8ZNkAUHCIUKzSGhJK37uy6arI0?=
 =?us-ascii?Q?TfdWFgcj7uxU8XkUorTkjVIcmPwvCEx6aBiHXTlEvE9DG78J8Cmf3cmYux9h?=
 =?us-ascii?Q?rJSlXMPbOwK1bHzoEZ7KbEnbRPdMV7UJyAsx4EQilM5xvGbGDMyNZbUL/cLB?=
 =?us-ascii?Q?6FRwv6mHFCxoZ3Wd5ASIcH7D0qzCJot35byn/osCqwwU8yvUui5snoKb4ERG?=
 =?us-ascii?Q?jUhLThTIiiIl6pCS2omQbQNYlkfBtgm5JpUdJyJE4HZta4+c+eh3wGAskrg/?=
 =?us-ascii?Q?M5orpFXPCSTO7i4nsG2wZtVFHOQAGiIi/gbts8+tYPdMxGhavFsTFWrH8LTz?=
 =?us-ascii?Q?yqBUMdm3efMRlhOm2xOYzLr3Ze4yS1X4KmvrF2IkLS3D53oGAGvI0tv06PdZ?=
 =?us-ascii?Q?H2N++N+9CLKhf9hiQySB04S4hFBXD0/pyycQ5tPMKU1hlVrFhPTxVTI9x6fm?=
 =?us-ascii?Q?0IqHxDGTNnheC/dAK/aGNO6nyS3LhXLWbk+TeejpHJOFatVH1pAPFbZmPuXL?=
 =?us-ascii?Q?eGgqg2Uc1/S5uHriEfCdntnx1fFisGANTAoI/Y0AmJ1FEpVHl/NYUDw4PEuH?=
 =?us-ascii?Q?YqOIlZ0EGZRJkzW9HwIn6nKiJgNaMoUq8uRhf++Uq385PvOxEvXJaaYn+siR?=
 =?us-ascii?Q?NTNfLDtaMtl1AiHLizggWGCWqgGfrSfAhBwdC2AzJnLelf5EluLD+uI/MlwC?=
 =?us-ascii?Q?w/UVs4A7FaMPGFNz7XFFQB2SCHBW/1ZB/sjxcLkODyHzg8pw+JoG61+YhoO5?=
 =?us-ascii?Q?7sMIOnS8fZEhc67GRiQCtBPXHdUV3RpNgN0uT6y+BCNX4NX7etc/eVQutnm0?=
 =?us-ascii?Q?WZWDy8e0Ij0bPaWLRHdbs66f+MnhKVA9adEqTDfNBdIBrhXRxtUiwAtUpETq?=
 =?us-ascii?Q?ATPnQNCYTrEHhblGSG6cC6bfbKO/2Ao6w8WGK2P+lrcdu/BX9hhxfFnqCiHP?=
 =?us-ascii?Q?+7vfDiMl1t3xd5MpVUUDUyl6p1DAeuosWwOJaN9ctJrlhKuW97EJ+4IdBnyn?=
 =?us-ascii?Q?bpI7VtL0rPUV8SItRntyJBQTm3rNia1w8RGdsj/66LZk0nmug3B4jzQnp9wt?=
 =?us-ascii?Q?/8KU7rQqX49aYz2XswN+Cn75OEEn6TiVnDg0HEG2Q/Tg3h829/dU/luveFo/?=
 =?us-ascii?Q?NPs+74FjcNa5/lqZ2H1cJPh53UnN/elX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HZNN+/Fy9V97ImWuxFgbOcrqTWmxQepvAW1rqTnjTCzPQtTq1pp65PMxhc2X?=
 =?us-ascii?Q?d12fkW/6tHlTB6z84UECTj54mGrDf3qq8hY3bbvF5G1C84XXrEW/jC290w7z?=
 =?us-ascii?Q?4B2pJNDw1q5y/ggol7ZDW4iFgpa9c8qjGwDZRclTbnSBMEcLVJobFbrLnJvl?=
 =?us-ascii?Q?Q0P9W0IHKueDDJ7c1wfuexwhKcDLDxt3WRbRaPzEbirc3l8OZKTG3yAqt1++?=
 =?us-ascii?Q?sOAwryLhykE0oWzCi8hDyztIr64EUVq3dc4mT0vVvKvjdAxJV2PSTiuw8aBa?=
 =?us-ascii?Q?hbmARK5nuTdCBCJDYL2roj14nsUHN66zDnEH2SoIkfXLOzCMtT+I2ltN0/tR?=
 =?us-ascii?Q?StKm8avfMktGXSLxHuNABUgtewTJWXpJcOEqmdz+TIdDd+gQZj47pQ6NZzTA?=
 =?us-ascii?Q?ojr8MPybGHAQoloImtqEBXjiLayYa5DoOSkLr+i2aWV+2mgfPis+ucJw3z3Q?=
 =?us-ascii?Q?MDBGLoSbtYNyNzavlAnsdHBoUAcFtkFgIs2k60lDNBfufunCGWlQ3rENMICs?=
 =?us-ascii?Q?FEE63Lz90jmVoGheJWwRrgHxeLRq4c8hO5ZyjTu90QbTyvu1i7wxz1i/o0qI?=
 =?us-ascii?Q?9N+3lg6cweBgNXdD/+km2X7pTam3Nod/f+xBWG5EVKHMuhBF+fcBaOx7v8QL?=
 =?us-ascii?Q?atBE6y7ElTu3taj/ekruSSdcPKQc8HZlxMVLbonqDJi/GHa4GUnz25cKWggl?=
 =?us-ascii?Q?/OP8r+nioi781SIWf29ivqDjTnsIooIilUmlOU9bNMSOLTKpQUaMs0hB/H6W?=
 =?us-ascii?Q?0a6eOTUhUVRF8KIjsw6UqCsH90sJcwAv2S8nA47GcSN2uWSNo31s5f7MRASw?=
 =?us-ascii?Q?rIuDGvgjJFT0l0Y+6AA9b4VQwg3klzqul8nhjknYJWa6pgi1XmSrmlZGpNWg?=
 =?us-ascii?Q?GFODkkY9sN1fg7dKJPMAsovX2M5OoNuYfySd8eIL5PWnQPcOsiOKUy3uixbV?=
 =?us-ascii?Q?LX7vzw0umx6nZJmAp246M4IXkoMgrg0Jw7l/SBWkhPjONG+rQWSschyhR2tt?=
 =?us-ascii?Q?P80XlFjDd2liWyuClQmzlES59X77fw2eD95ydlSvKlEn5iZQ0CZiwYPb/GLE?=
 =?us-ascii?Q?+HuYMSA1N2FeS6wZUcjLfgjoyS9p7Bj9taM2jyLJVwQpejpPHYmEmAf/ipZ4?=
 =?us-ascii?Q?xEbbn62TaEdC5rdgWffMt7Ff/Y0DH+OQfBTk6fRcexmpAI056gphKfFkMnnq?=
 =?us-ascii?Q?azpUHbo6NcIq2AMRTEMHOpwSj+lSRMhJ6KYSvv3dnVNdcgIU4OV8B3SaZRxA?=
 =?us-ascii?Q?+IaowS63sDk0n1ZXzrxQKA+alyq45DDwYiEERMkY2jW1u4xdBAaiOQzQ4yCY?=
 =?us-ascii?Q?v6Qy3e9Pqi6oYBTxtHFQiIegAiW43ktwTFqC5a1/1eBuBHA50NFupBKJgbfF?=
 =?us-ascii?Q?AlXLLhqKTtSoKwkR9LqTfSh3oFxVh3Kx27FhTQTuGNLaTKy3otzkmCX4rsXy?=
 =?us-ascii?Q?ga+TiF8v4P6xguP8FXbpJHEbXhg1LeUIs5aTa+jgwx+jETv8f+d2J/c/eWW8?=
 =?us-ascii?Q?hM8bZijdioKN8uXsyNH4R7mRmzJpNHU74gFLJWskq1FeN4939OLQZ7w9GN5L?=
 =?us-ascii?Q?+g2VxImX/WrfBGVTuMdhS6O38LUnYiGkmSv0SwFyXdJY8QySz41NjxXlF+aS?=
 =?us-ascii?Q?taFW8nqGcieosF0BKpCvQfdQl1baGOyLNSokte2GvMi8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4b5283-05cf-4ac3-f721-08dd35fc9e73
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 07:08:46.2478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ld4vrOOJxUioGpV+wp58/b8fCSIrj8XrB6Nl7GJazygsW8aN01wgXOSdxDPsztTjCFEt3ohpxP5I0TjlDfNQGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
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

> On Fri, Jan 10, 2025 at 01:15:30AM +0530, Arun R Murthy wrote:
> > ImageEnhancemenT(IET) hardware interpolates the LUT value to generate
> > the enhanced output image. LUT takes an input value, outputs a new
> > value based on the data within the LUT. 1D LUT can remap individual
> > input values to new output values based on the LUT sample. LUT can be
> > interpolated by the hardware by multiple modes Ex: Direct Lookup LUT,
> > Multiplicative LUT etc The list of supported mode by hardware along
> > with the format(exponent
> > mantissa) is exposed to user by the iet_lut_caps property. Maximum
> > format being 8.24 i.e 8 exponent and 24 mantissa.
> > For illustration a hardware supporting 1.9 format denotes this as
> > 0x10001FF. In order to know the exponent do a bitwise AND with
> > 0xF000000. The LUT value to be provided by user would be a 10bit value
> > with 1 bit integer and 9 bit fractional value.
> >
> > Multiple formats can be supported, hence pointer is used over here.
> > User can then provide the LUT with any one of the supported modes in
> > any of the supported formats.
> > The entries in the LUT can vary depending on the hardware capability
> > with max being 255. This will also be exposed as iet_lut_caps so user
> > can generate a LUT with the specified entries.
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  include/uapi/drm/drm_mode.h | 50
> > +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index
> >
> 7a7039381142bb5dba269bdaec42c18be34e2d05..056c2efef1589848034afc00
> 89f1
> > 838c2547bcf8 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -1367,6 +1367,17 @@ struct drm_mode_closefb {
> >   */
> >  #define DRM_MODE_HISTOGRAM_HSV_MAX_RGB			(1 <<
> 0)
> >
> > +/* LUT values are points on exponential graph with x axis and y-axis
> > +y=3Df(x) */
>=20
> Huh?
>=20
This f(x) can be the algorithm defined  by the user space algorithm to gene=
rate the lookup
table. Generation of the LUT value is left to the user space algorithm.=20
When this LUT table is passed to the hardware its just signifies how hardwa=
re should
use this table to get the LUT value. In this mode it's a direct lookup tabl=
e.

> > +#define DRM_MODE_IET_LOOKUP_LUT				(1 <<
> 0)
>=20
> Again, what is the reason for a shift? Can these values be OR'd?
>=20
Yes can be OR'd values as well.
Let me know if this has to be changed?
Just chose bitwise shift to denote the multiple modes.

> > +/*
> > + * LUT values, points on negative exponential graph with x-axis and
> > +y-axis
> > + * Y =3D y/x so upon multiplying x, y is obtained, hence
> > +multiplicative. The
>=20
> Can't parse this sentence.
>=20
We need x and y points in the exponential graph.
For retrieving the value Y on the graph the value passed by the user is in =
the format y/x
In order to get the Y points on the graph the value has to be multiplied by=
 x.
This is a floating point value when compared with an integer value with the=
 direct
lookup mode.


> > + * format of LUT can at max be 8.24(8integer 24 fractional)
> > + represented by
> > + * u32. Depending on the hardware capability and exponent mantissa
> > + can be
> > + * chosen.
>=20
> What does that mean? How is it choosen?
>=20
The max value that these kind of 1DLUT can be is 8.24
Hardware design can choose anything within this range. This depends
on the accuracy required by hardware keeping in mind the hardware cost for
implementation.
Just a precision for 32bit value.

> > + */
> > +#define DRM_MODE_IET_MULTIPLICATIVE			(1 << 1)
> > +
> >  /**
> >   * struct drm_histogram_caps
> >   *
> > @@ -1414,6 +1425,45 @@ struct drm_histogram {
> >  	__u32 nr_elements;
> >  };
> >
> > +/**
> > + * struct drm_iet_caps
> > + *
> > + * @iet_mode: pixel factor enhancement modes defined in the above
> > +macros
> > + * @iet_sample_format: holds the address of an array of u32 LUT sample
> formats
> > + *		       depending on the hardware capability. Max being 8.24
> > + *		       Doing a bitwise AND will get the present sample.
> > + *		       Ex: for 1 integer 9 fraction AND with 0x10001FF
>=20
> ?? Can hardware support 16.16? 32.0?
>=20
No, for a 1D LUT maximum floating number can be 8.24
Hence hardware will have to adhere to anything within this range.

> > + * @nr_iet_sample_formats: number of iet_sample_formsts supported by
> the
> > + *			   hardware
> > + * @nr_iet_lut_entries: number of LUT entries  */ struct drm_iet_caps
> > +{
> > +	__u8 iet_mode;
> > +	u64 iet_sample_format;
> > +	__u32 nr_iet_sample_formats;
> > +	__u32 nr_iet_lut_entries;
> > +};
> > +
> > +/**
> > + * struct drm_iet_1dlut_sample
>=20
> Is it supposed to be used with DRM_MODE_IET_MULTIPLICATIVE only? Or is it
> supposed to be used with DRM_MODE_IET_LOOKUP_LUT? In the latter case
> what should be the iet_format value?
>=20
The struct iet_1dlut_sample will be used for all the IET modes i.e direct l=
ookup and
multiplicative.
The element iet_sample_format will not be applicable for direct lookup. Thi=
s will be
used for multiplicative and the value what it can hold for multiplicative i=
s mentioned=20
in the above description.
I missed adding this info in the description, will add it in the next versi=
on.

> > + * @iet_mode: image enhancement mode, this will also convey the channe=
l.
> > + * @iet_format: LUT exponent and mantissa format, max being 8.24
> > + * @data_ptr: pointer to the array of values which is of type u32.
> > + *	      1 channel: 10 bit corrected value and remaining bits are rese=
rved.
> > + *	      multi channel: pointer to struct drm_color_lut
> > + * @nr_elements: number of entries pointed by the data @data_ptr
> > + * @reserved: reserved for future use
> > + * @reserved1: reserved for future use  */ struct
> > +drm_iet_1dlut_sample {
> > +	__u8 iet_mode;
> > +	__u32 iet_format;
> > +	__u64 data_ptr;
> > +	__u32 nr_elements;
> > +	__u32 reserved;
> > +	__u32 reserved1;
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> >
> > --
> > 2.25.1
> >
>=20
Thanks and Regards,
Arun R Murthy
--------------------
