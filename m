Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC58D8CCFF4
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 12:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3E310E5D4;
	Thu, 23 May 2024 10:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7mUXddx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2256B10E5D4;
 Thu, 23 May 2024 10:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716458845; x=1747994845;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IJeG61+qPys+Rv803T+8E3P7fdLVR7Pe8GijCSguKxE=;
 b=U7mUXddxGek8t6wr9LzE7CsFzH8CiTax8jVQd/16yC+lZdT0aqlweZ5O
 nQvASyyLzqaKSwu4HQ9VGJ+6w0MPnKMQWbC3HKZFDLYtoXHo5CrEYKj2z
 WzvPo3fv7QBGkkK2Mz0vYEFTk526OAG1SbCgIH/7CzbgjskrGeSz/2llQ
 TArAEfhXmUTs49N8hpMOiTWP4ILL0RPTtyKlaNwbnSGaL+EjrtU1RWknS
 eaB8Vhx7xJxwIyfpMuDLqPX9BD7PuJxJf/7wyeSVkZlZOI9di/GY4OoAt
 jgAXEGarVpXt17OdxDZV+ZMzf/VxHDdqW17kqYmO64Ojx2l4sfO2KR963 w==;
X-CSE-ConnectionGUID: dtyUp+68Q4GsTl7v4hZiBg==
X-CSE-MsgGUID: CbV9bRDfSZ2myn2+dYJueA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="11660011"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="11660011"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 03:07:24 -0700
X-CSE-ConnectionGUID: rHlz0wGpTS6YcHuTZ8+pEA==
X-CSE-MsgGUID: XYBJVPydTsSTPy9Wh+Q3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="38597894"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 03:07:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 03:07:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 03:07:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 03:07:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRTg423HwxI63ggglACuLEtGjvbHTacG6/5FqlwbReyy4yfTggeTJyZdIXpL+AVtxxoLKPKL9L/y6heuL4vAiZWsEHUkXwSGD2r0NtbpdCGVRwKeMHK6/csRCCOgX3joGeO3m9dAiu61BnRyvU6kPrEeX4EC0dLzDJleCaQxpjOspNvyEdjmLbCKp7N2zJnPhwU7uNr5bRk1k/KyFSHhGpAU39JgHu/9Dn5bXDuzqgkTSEyu4ZHqwajfGQI3O//QpTcNYQP+xmV4/NZn/jKyjsV1xQQw75dSpYzM38ARdhCL6XhxBh12uozZMa3ZvtHNPDifC+6nrYwQlU4wmv/hzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuXR3Nhdzpgb06gyxR5Srm94OYQxhmfwpF+4qCN+B0w=;
 b=b6Z2MSI+8zKo3xd1qSaZdD6qiKBtiRCkEc6qYygV97u8sh/jmDLYjOGv+AuotKGtDZwNY/8XboACAaNOV2PNyaXsGSmMJddliibzP/Ga5LNXYVDy3BgH7d9NW50sMmZcPsfYUkB1XTDG4TFVqbYy/CbuDhs7QTzcsb+iZF8Eq/LMg0K9zIVTNtqeP/F1fZ2K7DO4Ey+bdEikFHfGPJFT2OzOKwDE13UxWYgFobKRw9Qz5N6bMmjdmjLOGwsSJz+JTEC2Xv3ZglkJWRUyAFUc4sf+l4+zehXTeQHZ15jXTL9v0xE0NNcIyXZgh62jWDSfmERDUe0VTx3O04/IDq+UxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 10:07:21 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 10:07:20 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Nikula, 
 Jani" <jani.nikula@intel.com>
Subject: RE: [RESEND 5/6] drm/edid: add a helper for EDID sysfs property show
Thread-Topic: [RESEND 5/6] drm/edid: add a helper for EDID sysfs property show
Thread-Index: AQHaouwV3PnZRXsSKUKTzlDgJuKjjrGkq/Kg
Date: Thu, 23 May 2024 10:07:20 +0000
Message-ID: <SJ1PR11MB6129B9E6A82AC16880838C4BB9F42@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <cover.1715353572.git.jani.nikula@intel.com>
 <902c8e09d25b99391fd9c92d95af07c01d7b7cbd.1715353572.git.jani.nikula@intel.com>
In-Reply-To: <902c8e09d25b99391fd9c92d95af07c01d7b7cbd.1715353572.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB5818:EE_
x-ms-office365-filtering-correlation-id: 17605617-c2f6-46e3-fa60-08dc7b102289
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?aKHjH4RjmqyqBDPgRGJYT6eMWDAYvWv6l0oI4dzerFU7dZa5OGV+bw8UTEvS?=
 =?us-ascii?Q?3KokzPE1NPP2A05TOEyQEKGtP6wPN8kiCQT0wsOxakTmqCOVJBGD+Jf5h/+e?=
 =?us-ascii?Q?ZDIZjmFlbI+CpleuM5UM+smFrycIgH8J0n+tRRu8GAU7gqOttqWw9RVHxtuw?=
 =?us-ascii?Q?PvHPkJMthhi+m089ReE8ZSw+bnXTv3lQNlpNgG8M2j33PyVqOFTLonFaBP7+?=
 =?us-ascii?Q?PDY/tFXVobrogpk40D8KE/2GyiL+0bO41KMKBDZTx3P9s9s+CdIZdg8ue18+?=
 =?us-ascii?Q?q5mA5qniUJUX6CL9b3+VqyKnbx+YK00RySXgm5OJE70vWfRkfBpGEldAXB1q?=
 =?us-ascii?Q?vMAi3kCPmtvSKQ0xRPuAH8/kpzKoJOVsKremSjxizEKmaHiuIbsZwasmAicr?=
 =?us-ascii?Q?pCbKv/llOnuEOle8tt5XaXvpEaF81hvICPRbwcyioznC6p1ssDTxTdDUBIuz?=
 =?us-ascii?Q?e6uv6ex2BcdBvrLrJuYr1AKM27Z5WcYuKumZyvapZ7uzwDRnvA+LI8wSHITD?=
 =?us-ascii?Q?j2I8BtelyZiQGSTW9kigVYNJQOnj+uE3yjYgA//OzZlo1on/hneYxytoVFF4?=
 =?us-ascii?Q?t1Lq5/CkHpob9EdbYwJvPQqQb0BA2SGbby76wRnDGM3mQc0/jgNeT3ZESEhK?=
 =?us-ascii?Q?qf4PUxvhDcMSLiJniVvrQXf0tOH/OGEefx9q0KAyWSur4p8L+Cvhw7CgGRcC?=
 =?us-ascii?Q?TiEm8s9U9KC7hcNSC0rKWn3DWoZyjEdNbpoUZvbXrKY+7kP1GI6t4YqKHYD4?=
 =?us-ascii?Q?4ucyjJTSjPMcqKU3NkaqxpyUrDKDuPSTWpNFbosyR0Y8Dvx707xMSng/WeKh?=
 =?us-ascii?Q?2cEPK+TBED9dActJZ58ijI/7CuRk+kSEGqt8kyh80BmU/vfA3gieClkQlOYK?=
 =?us-ascii?Q?lBwjNiUQlXLBM2SPNreX96Gc3aC4v1AGoDv2ucZwoI6K/nujbHeR0TNzPZae?=
 =?us-ascii?Q?ukFEIbWyclSTqWW7xnhF11KLFZy84xG4yVK9Xlemjq7Qyw+v+aBZL5L47NU3?=
 =?us-ascii?Q?76I2KhIFFm9UgiEOoOA2Il/UJZUnNu7N58ed7CYIeMSXNAV2CCR9ZfqzHv+W?=
 =?us-ascii?Q?T8Jupsain5Km6EDG+Q1jVerhZ0wJAj77GGFnRNvSOvSk/JufpvEG9Z7z2mfd?=
 =?us-ascii?Q?bAC00ymWYN2cVTCatCBArNZq+fxPgysqLpuii0QClQPlwJeHPv16ffN2sxyM?=
 =?us-ascii?Q?miF9jsAcT2B1Q8ks21BkhtFMIOSOsg9QkDDSsQSL90JKSO+URF3SOn2THQoo?=
 =?us-ascii?Q?K4LPqlHTNZtM90TPmJg0HbjTPYZf0Z4xQO/kyUWoS87AVzr/iGLVRaSHnDmU?=
 =?us-ascii?Q?HLSi9aw3WeHX0xERUV5tzOv+SOEVW3cbClb3DWR4IK9C0w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pXmLTHUiBT+Z+nFE3BeFbT94xc0nrAPaM7gjNzdlhsSYd+nM7OOiTuH50LGf?=
 =?us-ascii?Q?/26gQZFvDbs5w/RdvRCBrWldRmAEgqOiQUSIJfrQZm67Fkt7a0QsO7IRD8uT?=
 =?us-ascii?Q?ooZ3LBDYZC0PsU4C6UfDz4BhsI6FlxdMYHI/6Md6iDVCeug1QMmvwZKlzCUc?=
 =?us-ascii?Q?T+AqvMGK+LeWPGj+HnDyzLJBF3pj3ZOtEqdEilbfqeo53yxCjT5vHYkL8jtL?=
 =?us-ascii?Q?kaYzJ4GDejccCN8nUQGRpnKEZtL3CujXwhJaVnzDgg2taeHduYZfYlEEuuDW?=
 =?us-ascii?Q?cNcV1phkDIVivulV3qsz0A/mvrbemD85OWCeONizONenS/4/+lA00b8StmX6?=
 =?us-ascii?Q?//sU52uuI6qcqO1+k4RPqOXTuokaAOjZK9wZ02TjKR7st6wMClNbToS/wz/9?=
 =?us-ascii?Q?hxRm52kofibl+qSFaIgGHvsQa9OmJT/OPwWHNIRSH88IMhTiT6rX0MDOvlDk?=
 =?us-ascii?Q?+QVRorAUb9UL1/wGslVjJOHRu/nT+2OX8zoraAaDqzmTDdWpQGH0xSA2yhU1?=
 =?us-ascii?Q?pmsputIKCuWQ4WuXvstpuorQYyPZDUNXsQJzIi2kNPTHrnawg1iRP09Tg11w?=
 =?us-ascii?Q?TWRDA3X3aednp1fFtWZKLVYLmQi0G9q7vSCOHnG4Zs95S29GhdpZ3HOLH68w?=
 =?us-ascii?Q?HMfS2zTLBubo3yqP+/G7rHE3zZOwnISfDRLKdQ2MgYLcEQyxJW2Q7RYQeEIj?=
 =?us-ascii?Q?/b99euDh7jkN/AuIeZYh9iVr0rxvV2rplJlC1B+pJ/7redRNT7jcXAMRFQIS?=
 =?us-ascii?Q?+DI36Z+D1T1M/Nz8MkhgbntgJP2TXoDCTvg3Yhe1HGmlCtwd/b/qEVJPEUDi?=
 =?us-ascii?Q?F3+oMfX9UMM7FduQfvHijpz4VAufqxtCHmSPZms84pcdBPtGVGd9ZuzF49kY?=
 =?us-ascii?Q?TcN+pQ3PTDSvLK2M5t2Za1DbBbyhWQ62Km4happ64+GqVj9vvmkg6mUR2jyt?=
 =?us-ascii?Q?cE+Xdh7kD3yQjHRdswlCo3l76kaFw5TLK4r+iFUr0X5+9NKOLbhf0KSN/SAe?=
 =?us-ascii?Q?jr/8aai+xkgl1jFV1R5DDSJpTfLUlBWFtR14HkebeaKzicDJwXI06cZh6Bhs?=
 =?us-ascii?Q?p5VlwF4Kz+Vzpnr//d/qO5T3e9KRsSWnHdhi2ydC8zby6tWe9X8AYTXXgshO?=
 =?us-ascii?Q?XoiCNp8okNiSnaSRCoqOXUDgSJG3odiUWmhDEDqBhGeNBHJAQGI2SuI+ZhxU?=
 =?us-ascii?Q?iWIg3QYgk5hhsD+PrXaYlARSmlvLZbwr1hwCTXFfHuX4ahj6cJur7vNaNFZE?=
 =?us-ascii?Q?vAISW9u7CJZbu/vstvbybytE4tO0oHl708CfeAS+Elb0JJn+yFj6GqTV2IHW?=
 =?us-ascii?Q?OfEoE0OFydTa/AYqg+5fVPwqEUIQ6U78ia5/FdI4xrs4XhWJDkUuHhAqtzC4?=
 =?us-ascii?Q?fTMjFecbC5Wsxof6ytvGPLCRUgxXNq1/EMdPcw+pLncfeJ3Jyj3STxMngBxe?=
 =?us-ascii?Q?J5mRjUEWVThycp+HIw93lDgkRybHDuIFHeOdyKGbvWPJYRxOf+HxwqM0eBT7?=
 =?us-ascii?Q?Cyl58ZSy8wdeXJ0wcdD2UBYWnNPtSC3OADpQDB4rYTCdbgvJ5NUtFfj7iprt?=
 =?us-ascii?Q?zQCrbclTfgV1PTXjKQj478vs3yYkWjzby7pHHMXv5g+hzNxTaOQaZwGKMpEi?=
 =?us-ascii?Q?Fg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17605617-c2f6-46e3-fa60-08dc7b102289
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 10:07:20.8394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQNBzof5BkwVXNvIN8aHrzo/Zs5yl9UUx8EkJGHAEzv4nqD57Pncp9NSoqFR5SjsnyTQLIQ4sDbi3ff1mzGSK+r/HaitPCX7pSb5Bqs8idg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni
> Nikula
> Sent: Friday, May 10, 2024 8:38 PM
> To: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org; nouveau@lists.freedesktop.org; intel-
> gfx@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>
> Subject: [RESEND 5/6] drm/edid: add a helper for EDID sysfs property show
>=20
> Add a helper to get the EDID property for sysfs property show. This hides=
 all
> the edid_blob_ptr usage within drm_edid.c.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>



> ---
>  drivers/gpu/drm/drm_crtc_internal.h |  2 ++
>  drivers/gpu/drm/drm_edid.c          | 33 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_sysfs.c         | 24 ++-------------------
>  3 files changed, 37 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h
> b/drivers/gpu/drm/drm_crtc_internal.h
> index 25aaae937ceb..20e9d7b206a2 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -303,6 +303,8 @@ const u8 *drm_edid_find_extension(const struct
> drm_edid *drm_edid,
>  				  int ext_id, int *ext_index);
>  void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad);  void
> drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad);
> +ssize_t drm_edid_connector_property_show(struct drm_connector
> *connector,
> +					 char *buf, loff_t off, size_t count);
>=20
>  /* drm_edid_load.c */
>  #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c inde=
x
> 4f54c91b31b2..97362dd2330b 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6969,6 +6969,39 @@ static int
> _drm_edid_connector_property_update(struct drm_connector *connector,
>  	return ret;
>  }
>=20
> +/* For sysfs edid show implementation */ ssize_t
> +drm_edid_connector_property_show(struct drm_connector *connector,
> +					 char *buf, loff_t off, size_t count) {
> +	const void *edid;
> +	size_t size;
> +	ssize_t ret =3D 0;
> +
> +	mutex_lock(&connector->dev->mode_config.mutex);
> +
> +	if (!connector->edid_blob_ptr)
> +		goto unlock;
> +
> +	edid =3D connector->edid_blob_ptr->data;
> +	size =3D connector->edid_blob_ptr->length;
> +	if (!edid)
> +		goto unlock;
> +
> +	if (off >=3D size)
> +		goto unlock;
> +
> +	if (off + count > size)
> +		count =3D size - off;
> +
> +	memcpy(buf, edid + off, count);
> +
> +	ret =3D count;
> +unlock:
> +	mutex_unlock(&connector->dev->mode_config.mutex);
> +
> +	return ret;
> +}
> +
>  /**
>   * drm_edid_connector_update - Update connector information from EDID
>   * @connector: Connector
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index bd9b8ab4f82b..fb3bbb6adcd1 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -266,29 +266,9 @@ static ssize_t edid_show(struct file *filp, struct
> kobject *kobj,  {
>  	struct device *connector_dev =3D kobj_to_dev(kobj);
>  	struct drm_connector *connector =3D
> to_drm_connector(connector_dev);
> -	unsigned char *edid;
> -	size_t size;
> -	ssize_t ret =3D 0;
> +	ssize_t ret;
>=20
> -	mutex_lock(&connector->dev->mode_config.mutex);
> -	if (!connector->edid_blob_ptr)
> -		goto unlock;
> -
> -	edid =3D connector->edid_blob_ptr->data;
> -	size =3D connector->edid_blob_ptr->length;
> -	if (!edid)
> -		goto unlock;
> -
> -	if (off >=3D size)
> -		goto unlock;
> -
> -	if (off + count > size)
> -		count =3D size - off;
> -	memcpy(buf, edid + off, count);
> -
> -	ret =3D count;
> -unlock:
> -	mutex_unlock(&connector->dev->mode_config.mutex);
> +	ret =3D drm_edid_connector_property_show(connector, buf, off, count);
>=20
>  	return ret;
>  }
> --
> 2.39.2

