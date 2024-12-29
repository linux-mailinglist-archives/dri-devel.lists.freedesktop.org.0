Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229659FDF8F
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 16:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B80210E158;
	Sun, 29 Dec 2024 15:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnR+W/Nq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AD510E158;
 Sun, 29 Dec 2024 15:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735484985; x=1767020985;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yT//qZ9QeXu6qQ6P4rIr8qrQKLHDWMMalGWO/L+dz8I=;
 b=dnR+W/Nqsww9nRnqrl+grbafG1H9KfjGlICCxHvhd3vcrDlmLPqagXhO
 PrcoWpWNKGDq0iQ7RP7/cgXiq/BhM4Cy/Z8BFIYwlXmujW48RcHACBLEQ
 7IhUKG5ntMNlr4cZqpN//w0RBUp95ppS46+xGcSXodn0gVjZcqX3j9Q9U
 34MolSr+GWMGXnaj0b58pmh8piBYRriRfNzHXUVYyrjFPvKh8VzM4omrr
 08R/0kqjaY+9RvMmuYps+WdWo0De//PuWbeISWZ548LFwIVuUGnXtXAkK
 BCo48J9rWoGPt1lwEVjInlB4krwaQjZH9iGdDi2+rG6KfN3HHKa0pAfQQ g==;
X-CSE-ConnectionGUID: rOKvQTE0RgKwlMnisy4VEg==
X-CSE-MsgGUID: 23hjKrEQQwuE5CC2ofr0EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35941059"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; d="scan'208";a="35941059"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2024 07:09:45 -0800
X-CSE-ConnectionGUID: CNWYIXrNRaC6SQ4GWWwCJg==
X-CSE-MsgGUID: T5kVl3YsRGyYs7Sep5AEAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105187640"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Dec 2024 07:09:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 29 Dec 2024 07:09:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 29 Dec 2024 07:09:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 29 Dec 2024 07:09:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGEHBPE8j6wpV2SNhdqzVOCyaa7a1dQnfaAmiS9VpNhCmmFY++yabVO16CLDL5y4aNsazCvWo7ZFl5o20W55Zf+2I69s2EAECoqNPhStUouztzcGRXp2pvKM7k80atilvlRJLqSYegSuw2KFldiO4hq7KrsFo4qzpJKW3+gXatU20nRvnf3tOqYiDw85mPHcTfNi2zBHYjFHR+I8b6Shzvxn33HpwY4Z24pnu8zmWX7t1g5IC46624eTuQhFi878fSvhhZH508wcpDTFXi1lxxpEKZNuOz4VeR+BAa7k7jE2nbTMyQuynftgiMV1vpNGdS2dDmmix6fO2ExGpyhAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yT//qZ9QeXu6qQ6P4rIr8qrQKLHDWMMalGWO/L+dz8I=;
 b=VNrAhP6mZU2WiDe8EYPt/xAjdNOgU+u4bDdsF1fCjQvvn5nTxI5dlmVrubYgAnyuEeC3Zc6KEPSkzp9/egNUej/GrMKodiYM9I4ptpy6UTYzWkFqZAWsgDw3W3f8i6y7zAdpwI46GPh5b3vguL7DXPK0/36y0gLGFqBTGOCRSJrAnW+GcfcD0WjYRZkVwA+V7Iapj1FCtpA0TfSaM+DTnv/O/LpPxKtLifeDuzb6VP2V6kNXAOFJ6mcDKo50FBELc4YXRbmdr0keKMSvWlns2XFaZpNVMD24m4esHdvzlL+GcJEEs9dyW/4EAET2ER5lMX3HHEOfHQoDHw4x4seZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CY8PR11MB6916.namprd11.prod.outlook.com (2603:10b6:930:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Sun, 29 Dec
 2024 15:08:56 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%4]) with mapi id 15.20.8293.000; Sun, 29 Dec 2024
 15:08:56 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
Thread-Topic: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
Thread-Index: AQHbOo1AUWIZth7q1kuLhA0cCsqn17LrNrOAgABrRYCAACSGoIAAjmVQgAgV2q+ACSSYkA==
Date: Sun, 29 Dec 2024 15:08:56 +0000
Message-ID: <CY5PR11MB63663D73FA8ED331F8229AA1ED082@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-7-alexander.usyskin@intel.com>
 <Z2H_7Xry3R2fWpMZ@intel.com>	<24725a85-47c2-49c3-b2ae-443279b2bd13@intel.com>
 <CY5PR11MB63663382E44A258B0BAEF1BAED052@CY5PR11MB6366.namprd11.prod.outlook.com>
 <CY5PR11MB6366CBE2D1AA392AD3F745F7ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87cyhiqk7a.fsf@bootlin.com>
In-Reply-To: <87cyhiqk7a.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CY8PR11MB6916:EE_
x-ms-office365-filtering-correlation-id: b7b383f7-cdc6-4112-85ad-08dd281ab70c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MGZTOExjS2NhbENHLyt2ZjE4MEpHNkxOV1ExVEFrZ0FKRndGYlNvREV5NkhB?=
 =?utf-8?B?OXpid1ZUVUpWQmJieUVyYUt2VUlLaGp1UjlaK0paZm5iTFNTTDVmclJYN1RQ?=
 =?utf-8?B?SVEvZ2tHenpLdmJCaVNhcFFlNXRORXFpU2F6UTRUNWMxSzV4QWZmMWFhNWNh?=
 =?utf-8?B?TXdLcHF6a3gyWFhJWWN4QjBJeHI4b29LNlpLSzdtL1VualhWVEhLTWsxa3dH?=
 =?utf-8?B?TTFVTU9uYVIxSmpEREpiVzRlc09SMDZORFRab2cxenE4Um84MDQ5V2ZUTkta?=
 =?utf-8?B?RlBZOFZBalZFQXExRklsZWU2OThycnhEejRBL3d6R1FwK3JhN1NXZlY0UnVs?=
 =?utf-8?B?MjRCckJWVWd6YVZybVRBeWlTWHhYOHR0Yng3VTI4TXZZaVh5SmFmTXJJdWtm?=
 =?utf-8?B?VlJQQnQxTEtMWWNDbUZrQ1BOVjBlVzUzZWFieUFoaUJBalcwS2FtYlZHUVZ4?=
 =?utf-8?B?ZVplU1JNbUpFS205aDM4TDV0SWJWb0RoSm1RNUR6ZDBZelZOUy9BRkN6aEZl?=
 =?utf-8?B?QWUvWjVtWEMwcE9MYXBHRVl2WmMvYlhmbnBVUGJlUFFoakpXUnFRYVdNbVRy?=
 =?utf-8?B?MGFPNjArcE1qbmlqWEFGNnRsZXIyU1NDVVRlUWlqcEpzRXU2UWxFbUE2OGtr?=
 =?utf-8?B?RlhMaklVdFQ2L0pUMVVnSmpnWkNFR0ZjY2U0cDVhTFB6V0pSVFhRbWxLR1U5?=
 =?utf-8?B?MjV6NGZDcXBNNGM1aFo0dHdkdG8rU1NsZGhOSWZyYkxaSDh2elM3WE9lZmJG?=
 =?utf-8?B?dFI0RTRIMGhLT2JGOVF0UUQ3dzFaaGp4SXpnVXFqZElXR2llOEw5OGRBMld3?=
 =?utf-8?B?SkNZZU5SWi83WkxJUjg0RjhSYXJ3eXoxL05Pa3JVMzZhUXp4QXJaSmswMGQv?=
 =?utf-8?B?QUx6cUtpSDZYOFAzUFMyMUNPYStUTjVpVThFUkZkZ1JISTFEQ1lXRVdCSGVR?=
 =?utf-8?B?SS81SERTMm56UnFEK3hmZUpVWXVMWnp1RFRQQXVUcWpFTDdIUUVrMFdrbjg5?=
 =?utf-8?B?WWtSL0JhZytJNGR1NndpbHo4cDQ4NndrSkk1ZFlLNkFGS1J0Q1FWY1NWM04x?=
 =?utf-8?B?aWRCMmluWnA0WTVFUi9wQktVd3lTbkVCZVB2dmM4cDZhbUhEODBzd1ZHQnMx?=
 =?utf-8?B?NWtGWEN3Sm93bWNuNWFVN3c2YzJVRnhGVEdPa1hUYkNCb3Z1K0NYUndWaUt3?=
 =?utf-8?B?dmgvV25mMFdIWTFzYjdtWjFXZTJKak9jSjJyd1NsV2V5UlBrc09WbnlKcE53?=
 =?utf-8?B?a043T0dlK1c0WEFHOFhxQ3I3eEdWSzdOU0Z2VjVDdWZaYktBNUN0TzlGc2JE?=
 =?utf-8?B?RXpXZ3VGUDROcG0zRUV5eW1iUU5jNXJzL3ZOMGVCRmEwc1p1ZEhWalFncTR2?=
 =?utf-8?B?VFllUlVjUVpZbHRsVUI4RS9ydk40cmhSYjVyMWp5bDZsUkRrZWVvb2YyU1RG?=
 =?utf-8?B?Q252c2NHNkZjanAwZExRQTlyOTk3Z2RqdjJtRnJmL1N1MDV0NUVpVnQ3OGRw?=
 =?utf-8?B?QmkxZ2paODdkSzMzTWlpdnBMdnBwQmVsUFh6cDVsQkFmSGxKQUExVmhORG40?=
 =?utf-8?B?UG9mdWlNL0ZVZTkwL0pKNUxDK0I5dnFadGR0bVduNFVRZjAwMzVXWmorSUha?=
 =?utf-8?B?b0thQkh5bTcwcDI5SVYyVjVodm5VQXV6WWRDRG5BdXhQSTE2dGN6RkUrZHls?=
 =?utf-8?B?THFXYUhpMnFoUUZKcjBFQmxyT3FsMWxHU3hMeGV6ekVjTHR6S2M3aHZGWmNl?=
 =?utf-8?B?dXBMSXZjY1lraEV4R1dxL2dETERMeE5mdktQRVhMbGdZREJBc29oVDNqZWdU?=
 =?utf-8?B?YTNNUFVJV0xXOUNhczJzVUZyZDZEejFKRkhSeVBRK2NNeGQrUVpMQjJSaUxa?=
 =?utf-8?B?YlR5SGJMT2l3TUdsSnBJU28wOEFNTmR4SHhJYnJ3VkY4amFkWWJyWGIzVXNz?=
 =?utf-8?Q?yWNgxJ099tvwhT98JuwrnYVYjsoTgFqz?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ykx2bFZ6TkZScWVzS3RvR2pmKzVMZ29xY0ExNko2ZGsyUVRqQldUUW00dlJH?=
 =?utf-8?B?bmxiUmRET205S0dRd1YyTDVLQVk3ck40V2tRcVVkNzE5RTZySlVwaWk4Wkl4?=
 =?utf-8?B?VzRtcUdtSUpFMkNxZDRTNnpTRVo2NUpETkZHaFMyZ01NTHJ5SFpGZEpSL2Zt?=
 =?utf-8?B?SFJXdDRLcU45djFCU1VxcEZUaXpYdXl0Uk1OZ0I4M3JiemNlOHErbXdobzdV?=
 =?utf-8?B?ZGxjWklFZ1ZYTG5QOXN0YWVlbGlaazRNT1E3ek1WbFhnekt0TjgrUzVmbUhj?=
 =?utf-8?B?eVQ2bFdUanorYjFuYmhGWisrVUExeVBVaUk1QmIzd0Z1LzBQbVBXRE5CY0F5?=
 =?utf-8?B?clVnMTRRa3JaeVNQeHA4SkJoU1lZSXB4QmxtblluU3ZCVmtvL2l5T1MxeUFt?=
 =?utf-8?B?Q05xa0R0ZlNOQ3J0RkFUdjM1QVRFb1VpZWFQZ3VTYStla1dnOEh4UWNlNDlZ?=
 =?utf-8?B?VHNJaUE2eGZ0TlFld0lSbEMzTHVjSVBwbVFMVHkzRUhEdC9yUjJ3TnYzTEYy?=
 =?utf-8?B?eXVoWXIxTE1EektpaEI0anBWWFVESWFKVlJNMFBJN1NFNlNwNk15OUo2bHNs?=
 =?utf-8?B?WnFydlJTcSt5K05sZldHNmxQTTc4VmxXazNnY1pzdHYxNVk4MEJJdUtjRlpU?=
 =?utf-8?B?Rms1blFmdHQrMm9CbDZQRWh6RlBtZGJtL3pCd050M1ZxSXZDNE10emxqbndV?=
 =?utf-8?B?YVNObDZvV2FwWlp4Z05WUGw4TzE1bmRjSGE3b3htQkJGeEdaa1NtaTlBT3Ni?=
 =?utf-8?B?enFZSmJaWit2SmV1WENjcTBqdVV5dXp3NEU5ZEhrQzF0dVo5Q21aMi9uR2lt?=
 =?utf-8?B?SnVCTkZPdmFEWm5kRkxmcUZmREhLVk1WbVpYVytRRFZVaGpUbytVR2lMSWVL?=
 =?utf-8?B?WnlrcUltUGZDelZVRmV6YjV6d25YZzl3eFBGOXlFN1ppZm9iM284c0d2bElh?=
 =?utf-8?B?QVpaSHNXSm9laVRRT1RYUVUvN1lvUUlUbHgzaTYxWjNRMCtZTmhlSXU4RXAx?=
 =?utf-8?B?d2hTTmdXOTVLc28wcWd6N2ZBYzhrMTZIcnVPTktJSUZEQ2FVWFVzK2trbWRS?=
 =?utf-8?B?cVRIQS9SaTJlcUlZWmxjekl0SFlBK0p1eWxWVnREN21wMlNnaUprWjBIYU9F?=
 =?utf-8?B?bnNkTnZscXJtM2prRjNuZC83Sk9BTVRMZEs4c0QzWEg4dE83ZWk3VGNoWVBz?=
 =?utf-8?B?MnVBQTI2c3VEV0UrbGVKeDFJbkhRS2Q5cHNBQU9QRm4rR0dSNUJDNTA2d1k0?=
 =?utf-8?B?MnRHVjI0R3VhYXF6b1RVYytKTnQ5elBxSmlvTUxoTkZlTTN2OUtzZ3BENXR1?=
 =?utf-8?B?SytsMGpUZEdGOXRzK244eUZROUhjWENiRmtlS01yOW1TREtZKzFxRnRLd04z?=
 =?utf-8?B?ZnJuRW00VllWQWdVVWdYWTZJM3JvN24xNlorcW55YnZmbnpuSHVFdnFsbDUv?=
 =?utf-8?B?MjZhWWNDZFFWdXpYK1dGVi9DdEl5ZWtha1NrQ2RyMWIyR3QzeTI2OElmZFY3?=
 =?utf-8?B?cURua2NUTE1UdkNUYy8veCtLQnBQOW1icVNkb0ljdENoS1owd1hoc282b3Uw?=
 =?utf-8?B?Yi9VVEZhSDhDVG0rc1YvdnhpZUxsSXJjZW9GbXdpWk9zN1NSbkNXWTVIRkVh?=
 =?utf-8?B?Vy9aejFia2lUNzhxRTMyajlvNUtCWVJSUkhlMzhMU1FjNFZVWk9oQzNMS085?=
 =?utf-8?B?UW1ZSW1mZHdGNldSNHRmbU9nRXZ1ZG43bW1tckFsbnF6S1dSWm1YMGF5bEdY?=
 =?utf-8?B?c0NCMG1nMVhSY3FMaDlpOXFtTXZzSUFsSVJ2UHFKSWlzMWkwb0FwNjA2bThv?=
 =?utf-8?B?aGJYWHFZSnRoZUQwMEk3ZU1odjh3WVlTN1lLYmt4b3l2Mmh6ZSsxVVlKZW9u?=
 =?utf-8?B?b1NKYW1XSkZ5OHhNSTNoZ2l1djVJbWtuemxRNEZ3U2s5ZFE0Wm9MREdDbFhO?=
 =?utf-8?B?WUVLb1c5VVhCaHcyRk12Ky9vN1g1d0lDWExNQzJZay9tTXVYUHhRUS8wM1Zz?=
 =?utf-8?B?djI1VHJWQU95cUxUdDZMck1JaHpuRjMreDR1a1NuWmhMMU5qSWdkZ2wwcWFs?=
 =?utf-8?B?UFd5K29hM3ZFVFVoeUlTVENFd1FPUlBmZHRwQVQxclpQUVJQVVdYM2hOS2Za?=
 =?utf-8?B?enZlUHNRM1JxcXdhNU92Z1o1V0kvVWxoN2xESlYwQlBtM2ZkZ25ydVVTbnN1?=
 =?utf-8?B?ZHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b383f7-cdc6-4112-85ad-08dd281ab70c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2024 15:08:56.1456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OGxHSVW+Aq7kE7Efb7nSwMJSvumW2fD8ELcSu4E5i6wrfB6+hvgoxBf3RnYlDNSlT6QdxwR7cLFf3/xFAHSctZS9FIZoJScJ4NOyuocOgCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6916
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

PiANCj4gSGVsbG8gQWxleGFuZGVyLA0KPiANCj4gPj4gSWYgc28sIEkgaGF2ZSB0byBhZGQgcGF0
Y2ggZm9yIG10ZCBzdWJzeXN0ZW0gdG8gYWx3YXlzIGhhdmUgZGV2aWNlIGZvcg0KPiBtYXN0ZXIN
Cj4gPj4gaW5pdGlhbGl6ZWQgcmVnYXJkbGVzcyBvZiBrZXJuZWwgZmxhZy4NCj4gPj4gT25seSB0
byBpbml0aWFsaXplIHN0cnVjdCBkZXZpY2UsIG5vdCB0byBjcmVhdGUgZnVsbCBtdGQgbm9kZS4N
Cj4gPj4NCj4gPj4gTWlxdWVsIC0gYXJlIHlvdSBhZ3JlZSB0byB0aGlzPw0KPiANCj4gQ29uY2Vw
dHVhbGx5IHllcywgYnV0IHBsZWFzZSBtaW5kIG9uZSB0aGluZzogd2UgZG8gbm90IGJyZWFrDQo+
IHVzZXJzcGFjZS4gU28gaWYgeW91IHdhbnQgdG8ga2VlcCB0aGUgbWFzdGVyIG10ZCBkZXZpY2Us
IGZpbmUsIGJ1dCB5b3UNCj4gbmVlZCB0byBkbyBpdCBpbiBhIGNvbnNpc3RlbnQgd2F5IHNvIHRo
YXQgcGVvcGxlIG5vdCBlbmFibGluZyB0aGUga2VybmVsDQo+IGZsYWcgd29uJ3QgZ2V0IGEgbmV3
IGRldmljZSBpbiB0aGVpciByb290ZnMsIHNoaWZ0aW5nIGFsbCBpbmRleGVzDQo+IHVwd2FyZHMu
DQo+IA0KPiBUaGF0IGJlaW5nIHNhaWQsIHlvdSBhcmUgcHJvYmFibHkgZ29pbmcgaW4gdGhlIHJp
Z2h0IGRpcmVjdGlvbiBieSBkb2luZw0KPiB0aGF0Lg0KPiANCj4gVGhhbmtzLA0KPiBNaXF1w6hs
DQoNCkkndmUgbG9va2VkIGludG8gdGhpcyBlbmRlYXZvdXIgYW5kIHNlZW1lZCB0aGF0IHRoZXJl
IGEgbmVlZCBmb3Igc3BlY2lhbA0KZGV2aWNlIGNsYXNzIGFuZCBjYXJlZnVsIGF0dGVudGlvbiBp
biByZWxlYXNlIGZsb3cgdG8gdXNlIHJpZ2h0IGNsYXNzLg0KSXQgd2lsbCB0YWtlIHRpbWUgdG8g
ZG8gcmlnaHQuDQpNaXF1ZWwsIFJvZHJpZ28sIEthcnRoaWssIEx1Y2FzIC0gbWF5IHRoZSBERyBO
Vk0gY29kZSBiZSBtZXJnZWQgaW4gdGhlIGN1cnJlbnQNCmZvcm0gYW5kIHRoaXMgZGV2aWNlIGJl
IGFkZGVkIGxhdGVyPw0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoNCg0KDQo=
