Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6BBA252D9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00A010E3C0;
	Mon,  3 Feb 2025 07:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgzpHyhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EC210E2AE;
 Mon,  3 Feb 2025 07:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738566773; x=1770102773;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=jgzpHyhHKT0vAkbbAZD5MhoiV01qB9RgoDA9/nUh5j93vo7a5jZUz+gm
 molgm2og2yUO/k4RfsMunZYPMpdGmna3D3jpWL+oHCljiK/O4ji5l+N6f
 bqWnXWuLvBKrK9ZIfkXt3eZ9K5kg2ywHeL56a60+ZDSWIMDKWaWacn+Kp
 QLxGaN/9N+eRUbgLfUUvH9mHoRLmtU/uMqz+2c68yRkvOvdAy+4sMNQZP
 l6Gt8W8jlThMu9earawi2XQKjtWL7qfmuISONSK3RSTIFjiVXxpa3fH/d
 FjaRvfAlvy7MTY75lwU8nyEPvP4Q5MaKjIdblXSp6qEwxiNfZU9iFWz/a A==;
X-CSE-ConnectionGUID: GNgaKCf+QSOIHupOjVWyKw==
X-CSE-MsgGUID: 6RlmyyH7SNCqQQWSylIxVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49306399"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49306399"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 23:12:53 -0800
X-CSE-ConnectionGUID: JyJYUrzaRpy84JEuV86Pdg==
X-CSE-MsgGUID: 4y2+sIAnSdaLl1LIF4/Tzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115188371"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 23:12:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 23:12:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 23:12:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 23:12:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBj73/0yrGFq4FdgngDnAjTTBjvKlu5FWR6IOFWU+NVuwoS4C6soUuUXp/Jfm+TV8x1lzr4i/T46s6yjlra56Ato9DMzghLHsq+YRVCbryl0c0E06reMNcCGW2v200sT3l4UIckJHaT9qC3JcKoLPEKLiZyeKLYECome0+hEk43SZH1MoXePPlmBbAYVVfBBIb8IYS9KKNflzz1l6fR8+RYZ9lXQ19k3kJDdTXAEgQlw9S0G1bsBH73SH4vciMCtYWsRBdTsNCTI5102CII5cRa/hdO3p27lKyKcU6wrUg0NoJZFupDUntXTulGez1EIBW2OYsZLF/fayQ+Mz0t86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udBABZtzaEDXKBgkGycw97oFqyIJ1dM2DjDgCYHA+X4=;
 b=FH2aCTfymlSio+QDb8wF/EBqMvBCEQyUN01nej7yXElCfXfamjZbFJuEpUEMksqOJhEst5oLTpNi+vyXmoyGW5cZqmcJAB7cCgI+ynA1dXfZ+7RKT/bJcM7b7bT6Lzd0iNJ7lag+tyYYs/SvMu6pxhI9lg8DL3wmeea7YhpOjhhBPLCmMgD0fT/CGNIezdPsRQdKNCEC9L593iwqwygL2E3n0QIEImU08fGO4DRQQzFHn8lSN9DnjxXU4WajZzxg9ywW20rInDfqgo0JTRy9jPOL/iEYJCg1E32LZYo73dVrnXqJQSZL1znddKIEmSZcHo75ts90RDG85+jPRJtLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 07:12:48 +0000
Received: from IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b]) by IA1PR11MB7343.namprd11.prod.outlook.com
 ([fe80::8fd2:c734:bda9:b14b%6]) with mapi id 15.20.8398.018; Mon, 3 Feb 2025
 07:12:48 +0000
From: "Kao, Ben" <ben.kao@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 6/7] drm/i915/backlight: Setup NITS based brightness via
 VESA
Thread-Topic: [PATCH 6/7] drm/i915/backlight: Setup NITS based brightness via
 VESA
Thread-Index: AQHbbiN7A0ynxEfoZ0+gQIookFwtd7M1ObYA
Date: Mon, 3 Feb 2025 07:12:48 +0000
Message-ID: <IA1PR11MB73434184E16CF6F8C88FCCE8EDF52@IA1PR11MB7343.namprd11.prod.outlook.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
 <20250124054631.1796456-7-suraj.kandpal@intel.com>
In-Reply-To: <20250124054631.1796456-7-suraj.kandpal@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7343:EE_|SN7PR11MB6775:EE_
x-ms-office365-filtering-correlation-id: a67559d6-5158-446c-d42a-08dd44222a40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?savI5imuC3kYk5TX/YCsH1NYPdh06KI6Zk75Xesyfm+HfQ/k9b9irPBdlEXr?=
 =?us-ascii?Q?rE6mUyFjqbqdHwMFX07jhoQnuoXORRsB4SoBneNNbjoO8+vPPFqSBozsF7FO?=
 =?us-ascii?Q?8T7gBKwT06sENET/Z1nzoEceAVzkfAiADkmX7vNYHa3DBqH0p/pL4T6Z2OAV?=
 =?us-ascii?Q?CJqzG77PsViYCqlxzuIkKa499JwW1CN9xl2zmu7n+DHvzZTTEUJr963h/GYQ?=
 =?us-ascii?Q?3ikSldjMq9PFqm1Hy4EnGCp8C92OPI//o8FffXO8kzYbkh0wTjUyvf4oD1rK?=
 =?us-ascii?Q?CH3Ten+rTEmy7i6sedNIcfnpVBihFoIMjPspe4wPW+gopPHfJHS2gKa0o7vk?=
 =?us-ascii?Q?YIRtKjK1sUpgXL5qAFjHVwK7+CchtdTRcrlDA62QJZQAELi1deHSt4vzOsuP?=
 =?us-ascii?Q?3s7P5aeab8R1d357j9hWK3f3fO9OpoQobjqwyJ7lp0008spW8rvlIHMBLnD5?=
 =?us-ascii?Q?NL1gDLVUT+vvRfIRH4JC+QbJyr7hwaD2JgZp2MbwvRvz2+UEJmXzvGipgEbr?=
 =?us-ascii?Q?zh26rlOwXZ0/fzAGX39+Cqet39TqdVYx5fqZCWJpfnEd+1RNwvTuOZY6bro3?=
 =?us-ascii?Q?4A+fzrG4Zb6YtQNY/bx8Ohd9DYi22OT2Xz4gS5yYTbFRHUcOxXaeUOnF9+O3?=
 =?us-ascii?Q?FZfMlGZpa8VIF1Ez87WvBAKhKrkPp561PD2oFbtxNqRfPisKWy6mVWgZxl+i?=
 =?us-ascii?Q?E+sHAIzM6P9rREZSOh/NJas9lO9t3ogO0Ubip37bedJYnfAmA1Nndt/qX3gz?=
 =?us-ascii?Q?xGIejDSMWloYaZnieHAdnk45l2AUmaRXk/OV0w6QdiqT74IPBIGSozxHsJd8?=
 =?us-ascii?Q?DjW5dFRDrNufz3OXdeLMVPSS7j561OJBtBBSdZSVY332g8zBFxMSqt8gzhLi?=
 =?us-ascii?Q?9+15XW1GmAI9TltQ37O5U6jvHHoFVIVPTXtD5r1RJdpbG3BuSoCSmGQ6HZZG?=
 =?us-ascii?Q?vJAKjsdU115bXNQbEIueTDjNiXcuWbKrzhrwqout3jNJu9iJUWi4iZ/SUR8m?=
 =?us-ascii?Q?upn4qgzGokZZnUeQYLtwH9ayjseF10yTgOb1EIon/mhdx1ppiSL1EUA0/E1P?=
 =?us-ascii?Q?OlgeBQnwUX4Km+CfE78e4ZDg9fJfwAJJB/nPwEoTmWq+kagmErHvy0+7vL2x?=
 =?us-ascii?Q?69zWXPkvLLGBXjeCeyfd9uETgimkt7NO0HuzPNqvFMhDw8AHVRMqTk+odM3x?=
 =?us-ascii?Q?BT1FIfJEfAVQs7N84RnCZt1bgGjKrS7Xv4KlhqWCRGfGdTA+6txH6OCPraJO?=
 =?us-ascii?Q?Y56qEYAaVgOuUvDGLakp1trFYQrzl1Z33TmQs97Ud/d/JCf3TKhTb8cH8B/l?=
 =?us-ascii?Q?AWMGyhGcXH8BCoX1NDn+kKH76WRVeFHacZrQX39QJ0V3YToKjOZSyaAHqN1c?=
 =?us-ascii?Q?tfWl8ztdDPcrLF5gCmzn4LQXEfMncwk/HV4qG9TAUxRpYKSAPgyy5DBpEbBU?=
 =?us-ascii?Q?pAFiyfaJoz+9CLpsNwcm9hCm2r5WU33S?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7343.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y/n9jQDggDAfk4c9E+bPlUNV/tPSEVlybZQHkerK8904hekI5zySQRay7KwJ?=
 =?us-ascii?Q?tL5OBXkBrlZf4cpoSD20eTOutAr/flH8gw/f0fmwU4I4U1iYyTgBie9S/GFn?=
 =?us-ascii?Q?kYfvbMq5lIbSApVFiLbU8ZzTjTbJSSI9G+U7jDmu4TEe1G9/3gBk3Oru0ACF?=
 =?us-ascii?Q?vVCkML0tx8AwwdofIes3xrOo3clEv94rtgWdvNsz/EmpOo7f53DpjGnyVlki?=
 =?us-ascii?Q?POfwr932iNWciDyYSUAER5M+Elq3idQN7JKYKiDJcOWsQC9knBv6znU81b/Q?=
 =?us-ascii?Q?Ah43lZDJaXsu1SRBZezbyG7s/2uIKDhahsRI0qll3LCVwHBGHoV3VZd49Vfs?=
 =?us-ascii?Q?qpjOzcv7QD+Zh2q1LIykDm0SAhMjZ37WNPG5PQHy4jDH8/w1F7I8GbD63p36?=
 =?us-ascii?Q?MrUkHmHM3AZBDwqSDmDU4p962WzdwEqlS5vtFB9auUtWLJg1WCB0fRUDfydF?=
 =?us-ascii?Q?ZFZZo5BXaLGZ/KFiTU/ylLCAYmBVmbvguSNsEEVAxGn5sY/oUWvcilLjqpiC?=
 =?us-ascii?Q?dBI1kY9wLHnJBW7nUA2nUC8AHIlO9pOB3YQvz5eJ46FqTKwWY497RVU14a9E?=
 =?us-ascii?Q?EIBZLCtLN19XzHN/sKS2kiTkxtA18ToFevVO+5jINDIhmHw5RARcnRa7ke4Z?=
 =?us-ascii?Q?ivM2ut0DG/ZxfVhDQupRTui40hPNonod06B40xS2FNrtGC4KtuKv3xtO0s2y?=
 =?us-ascii?Q?wsUOz4VbPGldg5O2RMLHPQ2Bfu+UPz16i/vit25L1zmbENrtYBahds512+BB?=
 =?us-ascii?Q?MNbKBZooRonkxl7uBYWef9jEWrII+RXOvuC0Hf5d8qdN72aePV16U48GfMV1?=
 =?us-ascii?Q?koKkN3T/2+9Dov0AjAIHtB+39dFQomwD39khtgAl+UZ6S5QoSwu2D9zB5qYV?=
 =?us-ascii?Q?K94+UOJKNkmO/gzRHbI0NaJTKGPAMBe+NtJgFDrPhcpmQClQLdC622xiGg06?=
 =?us-ascii?Q?xRrBCuUm1hgS1amuVJ13KkzwEK/6K70IznG0hZ/xBSeOUra45qtBgKkHCmYd?=
 =?us-ascii?Q?imkq1/kiuDNkuCA8iHjupS0T6olxuZyGoKNi3n98IS5hOi2XIf1Hr/Wlp6Z+?=
 =?us-ascii?Q?5UumBICO3f3FrMnL8Q1Ar5/mFSPYpRERpltLxVH603NXxYJO7A0z7jSL+/G1?=
 =?us-ascii?Q?D36u/nep3dbZBGfkNlsdYi8CQaMTLQnswPPrd3dsm3qgDSgeBPvgSkT+134G?=
 =?us-ascii?Q?duFbIYyQO157vTaWL0lB0WdaOB+DBkaWI2GNL31PEGjwPlGG2tJRuOXHD8Kf?=
 =?us-ascii?Q?NGpq2sJr7208NpRyV9LGcpUbWuIk48B2wuemSiG1yrzVWd8MjuNQsp30VGaG?=
 =?us-ascii?Q?rB1OdU6VSQaRRI77bS3Rm5bpxivHr3PSu3/Ssbpk3PG2UiVXzyaa5EIV9Qb9?=
 =?us-ascii?Q?EC5kqeo8NLtetdlAd1E/ltq4j0XTuqahCXXFoJtzV20tjhfsmD8EBPyZhEsb?=
 =?us-ascii?Q?XAaWZ/yuRo9AFGtAI9rNdjCYFbQdpelIXf4SegKe1YZB3w/O5OguoPj2YsZN?=
 =?us-ascii?Q?9gSRNgKpOE+aMKm4umO/SpDB3nAJ7jiQF09mTISeraibthwpd17O0DtvgBhJ?=
 =?us-ascii?Q?L4nJs8KLNHqhGwRn4ek=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7343.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67559d6-5158-446c-d42a-08dd44222a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 07:12:48.4837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jKE1Vgu5W+ClNPnV74Fy8L8kKrxSWWoJwAh3rVlxkKbJW0T6sFAmn812+/vZPvDy5sHkLyQHUWXOmrM0MEtUCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

This patch works as expected with 6.13.0-rc7 on Dell Bolan.

Tested-by: Ben Kao <ben.kao@intel.com>
