Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D699FF867
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 11:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A8510E4B8;
	Thu,  2 Jan 2025 10:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUDBdhEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1BB10E423;
 Thu,  2 Jan 2025 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735814976; x=1767350976;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CNum95md4Tr6VWpPR6wp4ApfRvv/52NUtjaFucscT+k=;
 b=dUDBdhEGrGQXeZiP5UB9IMyPPKFYtYas3Mq8DGAW0C1CNnF9onNobfSx
 rh2HkNrqE4XTd/1mHOFlIh5Q68kwXhk7rNSv2OkmnuhNiyFoIE4a/voYv
 ush2WQbv52ydUWRBa+wYAyPL7H0SVXVm3z7WAWDF1N1p7Ix3F79ewx7pr
 w+aHJzEOqF/rnNangZYTRTQEvFTbXTUeT63P8uiLavoLm3tDjRS29GBi7
 Hsp/ToF4y15Gnvm+qgebkYuL1z+YBMjixk+5yUaKIQoV+ytoZWUuJSGo5
 W3HyPONgPXPa9lJxVP/cvi6D1J62FXKkaJOw1I5Z8BVCJ8ogT7WsT6/tx A==;
X-CSE-ConnectionGUID: MH4iiOQeRtiDPPFkCLWBBQ==
X-CSE-MsgGUID: rK/xum4bTby8ASg7pfk7JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="53445484"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="53445484"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 02:49:35 -0800
X-CSE-ConnectionGUID: 91Q6qy9iTJyzNss40+nHFg==
X-CSE-MsgGUID: Gzh4ruOZQYW60Eh9HpNv8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="101659344"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2025 02:49:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 02:49:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 02:49:34 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 02:49:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POtLoB5MlPoACvUVVqu0d3wGQC9OfbarKx6nciv/mzrQJb42aI8E/HDOOt2NouqxdF0H7N+Doafz5cZMB60BbcJL31PmIF3PAP9AFDqsRiA9Hc6nGGJKf+Q+bAYa1RZ4FPbtPAQpkan99YcOlHX/Tt+AGYJ9HwAHFTknqwB1PlPOfH9hpGs0sKtbWFBgek3SqFcQ1tab7QFITdhMJXnL2nODX6aLQWcihqk1pTfcrywIuQ3Vq7vl6BfCgGNbXDGKikoEa3hLqJOf6wrd/kvqNzyKHbCzaNcyt0zKnkOamKwbbZce6K81NI6G9vadU2ojbeDFJG51VEEL8q3Bq9v4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNum95md4Tr6VWpPR6wp4ApfRvv/52NUtjaFucscT+k=;
 b=GXiMDWpRbielfvkRu9DszuWW73W532REBh1sq1/ecBvx6Y+k/iww7GcPGvnL7Wn84smnzNf0RqmxuDF/J3AnNm/w2vmGKkWgmsDowOtd5xGpERsZm2m/0mmRd1r+bZBpy/HQVtPwlnWsFr2FeJiE0ieOIbJphZBUPZRRvNeRgWf9g4szdG9NintSY7GDy6mBiPFsID9ZJuoLEfabDhLO4pRqeyo09QVXEGfpghLzsvvioVIb2H2poiBY+KIV2GK4cK1fjqlzBlMJ296z95rCC9lAHuv6O9Qjhsuc+e0vutkqHfb5BnJ+JQdtuGagDXE34LWiN9uK0U25VOhn2Yr6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ2PR11MB8297.namprd11.prod.outlook.com (2603:10b6:a03:539::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 10:49:28 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 10:49:28 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Tomas Winkler <tomasw@gmail.com>
Subject: RE: [PATCH v4 03/11] mtd: intel-dg: implement region enumeration
Thread-Topic: [PATCH v4 03/11] mtd: intel-dg: implement region enumeration
Thread-Index: AQHbXGTzbaPg+BVbeESS0Jhqyip8LLMDS+uAgAAC7sA=
Date: Thu, 2 Jan 2025 10:49:27 +0000
Message-ID: <CY5PR11MB63669457E0CEF348A97324F7ED142@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-4-alexander.usyskin@intel.com>
 <022418c7-f2b2-47b7-9b61-da3f4b7dffab@wanadoo.fr>
In-Reply-To: <022418c7-f2b2-47b7-9b61-da3f4b7dffab@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ2PR11MB8297:EE_
x-ms-office365-filtering-correlation-id: c1fbc0f2-7d2a-4fd0-c398-08dd2b1b215a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|7416014|1800799024|376014|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?eFFOYU0yNFAwa21GWVI3QnhOM0dtajhGUnZnS0pJZTdkRWJoN2ZNTFpOamxr?=
 =?utf-8?B?SFJTQkk2Qm9kclRuSEZFMnk3blVQWjJPQm94OThDcWtDNU0wZDJZdXQ1dTY5?=
 =?utf-8?B?RjBEVEZrcnhVbXJXSGpOMEpaeWJKalZMUHVLcGFMVkZRQ3gvRjY3azlUbXVW?=
 =?utf-8?B?eENLZ2tPRjFIZDRhejVrT25ZTmJSSGtoUjNqcGg3TGtmQ2Q2bkJzMUtlRjh0?=
 =?utf-8?B?Y0o5dERtWVRnU0xkM2FkTzFEa0FDdUpNbFJjRks2a05mK3hGb2ZuWGJNK0FJ?=
 =?utf-8?B?bERkNmR5dHNuOTc5djl3K05XKzdBLzBMUzE3bDRxcUVMTXk0c1UycjBUTmc1?=
 =?utf-8?B?Z1NZeExwbkdaSHBUSS9ITlRiUjVFK2FRNHhadmFvZmZMRkc5R1l2WnF2NUJ3?=
 =?utf-8?B?TjRIa0k5NGpVY2NEbFdtN2dibDRzY1RNc1p4QmtUKzJmMWcySDRrU21kVkpH?=
 =?utf-8?B?RThubXhhSGNUTVVmME8vWUJ6dHQ0QUZaRG9BK2pjNTZOaUFiSlJqMnVGQlUr?=
 =?utf-8?B?RzFocmp4b05TMzMxSGRwQm1HaTFJQlI3K2ptSk1RUXJHRkhDMmtYYkk0TGRF?=
 =?utf-8?B?SUJzeXJyOUR5UUswMFBvVjM4SVR5Rmtud2pOZlFyZUhXZS92ZEhtRDBIQnIx?=
 =?utf-8?B?ajkxak9WYm9PWThrcTJ0U3VqWUJDYnlaeDdmdG1YNU9xMjV5MXMzTVh0Z3Jj?=
 =?utf-8?B?L0tMSVVBN3RMQ0ZLSUhpbGdkMjFSVU9nZkg2K0xWbUtEdExDamZPTkM4YnFT?=
 =?utf-8?B?TURyRzdKblR6R2V4K0tlUlNBVm01bS95bVArellQSmlRQVR1MGtUYi8zSU8z?=
 =?utf-8?B?OHoxT2w0cmtRMnR2TTFRaVd0VHRWN0hnbHNCajVsdFpENkJDQldxTE56SmpH?=
 =?utf-8?B?RXV0T0xVSHVRYk0zT1FHTitMcXJSWXBCdm9YSjdMYmZkVVljWkt0elkyU2I5?=
 =?utf-8?B?L1dJbm9SSjNTWCt1T1JmNmpzaHlmQWtPR3lFVUlVVjNxVzJ4TkVpNG9pRGF0?=
 =?utf-8?B?ZmM5QjdqKzRtUlRWME45SkpidHU1akZVSVZmRUljUEFqdk9ZcXF6SjBQUmVv?=
 =?utf-8?B?dDdMWkhLUkJYSC9uNVZUMjVlT1o3b1NHUjI5T2dYaC85UUJReFZ0c0ZKbUgv?=
 =?utf-8?B?YnlEWnFkVzRRcVFCaWtuY25IZVI0dmU3OHdGNmtHZDJqNXdKMldpeTFoOVZZ?=
 =?utf-8?B?ajhuWlNlZk5iOHpCTHZHVlByQjMxSWt2UUhkZ3N6QzkxK0pneDFHY2ppeUt2?=
 =?utf-8?B?d2hrdFByVnl4OGlBNUFTK1RPTDJ4bmVYV3J4RElJSUxyOEgxdjVRNndyWlJS?=
 =?utf-8?B?OUJzVlpJRVpHTlk0SWczeDIxQ2kxWm02MmMzYmlwbDRlY0UveFdmbUdzVGd3?=
 =?utf-8?B?eUlrdHRyLzUvWkdXTWswUTR3YzFyVjFvMms2aHZWUklPcWMzMHhwVXBjYmZU?=
 =?utf-8?B?NTU1S1pBV3IwZ2dVN3BERTZSSzFtKytKQXFPdWhLOUZNOTFEZVArK0lrZGVS?=
 =?utf-8?B?OHlvbFFCbG0zc25vc0tXUGFRV1J6aWtYY1RHZ1BqZGxtVVlKVld6TjZYcUtD?=
 =?utf-8?B?amM1RG54ajYwUjFrZUVJVUFLbnZPeXJkb05mc0QxcitzWTgyczRhUi9xcmlL?=
 =?utf-8?B?QU4yM2kyaXNwQ0pieUxMckNSMjRjdW5nY3cxNUw5dmN6a0NiK2FnVlRPL3Zt?=
 =?utf-8?B?em5BbWtPOWZySVA5Z2RBVnd5K3F3M0ROWEc5YzU5dzlkejd6Z2VwU2xpM1Jl?=
 =?utf-8?B?VHo5bE5IY1BPVWpLbG82eVl1ZlBoejA1QnRVOHRjZkVnQ1I1VnVDb0VPajZj?=
 =?utf-8?B?OUd2VHp0ejRBZk15YkpvMnhORFdzOTBGT2xtcHljdW9EOG9OdVB3a1VlVW5a?=
 =?utf-8?B?ajY4OWIxdVZtc2JtRU9hNUhMSkpwRnZIbDRGRGpjNHlubEtqYTFMcWJlOUR5?=
 =?utf-8?B?ZkF4MkpqL0YxU1VrWXByTG9MN3dIcmlMNDJvbmxsTEM3dFJzTDExeGJlQ2VL?=
 =?utf-8?B?eDlZK0swZkhnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(1800799024)(376014)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2NDNXUzbmZYbTJzb0JMUHkvMnBtWUZYOGp1V0FzOThKak5QOW92QlZSUGw0?=
 =?utf-8?B?dXNGR09kNGNuVmFXS2JXNGM3b1haL0dhZkJlOGNuOUxJUi9CNVRWVjBSNncz?=
 =?utf-8?B?WmtaUDUyVjRtbDVDQVo4VnpxOVJyUUdudzcwYkZ0SUQrenFXcWttQnZNL0ti?=
 =?utf-8?B?R3dZWHpGT0VlUkpEY2k0Yk1LeVJwMmRnZmxJRXl1ZnV2UTc0aDZHOE1ndE5K?=
 =?utf-8?B?NjNDcVlNK3lFbVVBMnVhV2JjWjFrU0dQZFNjMEJ6MEI3UksrSEZjQ3NncDZB?=
 =?utf-8?B?ZWhtWHdMY2RBS0tMMnNJbEFEZXZNNnlVL2M4eWo4clYwVWQrZGI1TDlIK2NL?=
 =?utf-8?B?SlVIQWw1YzlpQVdoU0ZTSEVMVTBTMFZvRmMyMUNNQkFPRk9rVlJiKzJMRFZE?=
 =?utf-8?B?WDQ2WjVVOVhZTWtnUzluUFNpYnlpT3RIYkVOSlRFbDhMOFBIK1AyRm4zSy9C?=
 =?utf-8?B?cGVlUEhLQTlsQTNlandFZmR2NUVHSnNZMENYZFJtUWlXclpzK21PR3gwYm92?=
 =?utf-8?B?d3llc2k0MzBEWGRNb2tlcjZJTGpLQTU4NjQvRis5VzRDVFVNbVp5dEhPWTZr?=
 =?utf-8?B?V2orTS91T0F6WnNBMVBZekwrTThXVm5oUlZTYnB4T1o0RkowNUJtT01hS0M2?=
 =?utf-8?B?bW1DQmw4L0w2NXNVZ3ZLeTJhRE5OeGd1WFE0RmtubzVVclpYU3pFZkJ2M1Nj?=
 =?utf-8?B?dWRKMTBGU1pseWZnYUVUenovSlBIaTNobEc0VmduVDVmRFBlcmUwZ2YxRldM?=
 =?utf-8?B?SmcvN3g0bGw3TTRORE9uUFhrYklJRzg3VFVpV2Y1WDVmNW03RTFxRWh1MUw2?=
 =?utf-8?B?S1JKRlhOTnFpZTlwZ29CQ2JiMHBubHl6Mm1lZEZHeXpRblI2am5uTVJUM3NM?=
 =?utf-8?B?QnBlSE02NVNpSmNmNnBTcktJQk1LQ2pmTXNRL1FDeFoxaWtzZGxraVFLZjRj?=
 =?utf-8?B?V3ViOXV0RXpQYWJsa1laYzN0M1l0alR3cHZHZlVoNnN2a1U4Y3dOT3hJRE90?=
 =?utf-8?B?SU1hd2lySFRBZm5zWUxmSlY5eGlTbVRZbGZyVnFsZjBoWk5mNDdxZU9tOHVp?=
 =?utf-8?B?c0RYWGpNSEcrUVVXcWt0bTZGcHhSL3k1L3ZHaFJIVlNqRk9vTmZFOThyTXY2?=
 =?utf-8?B?eE13Uk5uU0hRNk1xZHZTMWhqNmVtZUQ4OGRmem0yN2kyVm1kSFJYakV4eklX?=
 =?utf-8?B?WnhZWlpaZS85SUVKNlRxaitEbDY1V2ZiS1NwUDA5RE5ScTZ2eXd5aERKSk5D?=
 =?utf-8?B?aWpOSStuWkpPU3k0K1JyUGRoay9NelY1MWtFS2NpSDFjMGlUbFhYb0lRZ2tH?=
 =?utf-8?B?QllVOC92dXBCWUpKZFdOeVNkK3Jha0xpQ3o5aFdNUjFPb2M4eFJZbmZieUc3?=
 =?utf-8?B?aDV2Z2tpUkhqVWsxRkFwTnhPcnhmM3ZYbWVKYW11aTh6N3BMcTNMa1gyZlRV?=
 =?utf-8?B?QzBOWHlRRm9LN004dzZ2bVNGeGNKOGgwaGRHU2F6L3lIbFBvWHVlT1pVcThY?=
 =?utf-8?B?ZDVYNUwreDNScS9DclY1ZTFKUDRvclNaUjlhQ1BieHlMaVlHNlJwQlFBSEMr?=
 =?utf-8?B?Q05yV3RyZ05hTlZLNTYvNWlJSXVNMU9yR2t1UzE2Qmg5VW1MQW5LUnhWRWNZ?=
 =?utf-8?B?U08vVzRpM25BNHpzY21FeXVTaTBpUE0yWkY5TU9USmdLMDlCeG1VMGZjSEdj?=
 =?utf-8?B?emlhVW5acU9zQWx5dHl6ZkFJRkFKMExwQzl0KzUxdlNaTUlwRm40OE92WTNN?=
 =?utf-8?B?Q0RlRVdiTGUzd09laXFGTEJNdkJucWdONms3Y3h2N0tnWkwybVM4bTlXZWtI?=
 =?utf-8?B?QnJHdHBqODZtN3Z2QW1vN0JyUDhRbDVoUVdrZlJlcFRyL0VkOTFWTXY4Z1dT?=
 =?utf-8?B?WkNScUhkckJkQ0xXYWlmNk45ZE1FMWsxaWJRREhNVXlpRXg4VHdVSFJ6R2ZQ?=
 =?utf-8?B?UWlNMSsyVkRCNUhxcmxBNVp3WVZsdUFqa29uMTFwRDlNa0RKUWN0N2ZXS0NW?=
 =?utf-8?B?WjdRRExoMmtBZHU0RXhrSEU3RFYvRXVYZkdIWEZLTGtGVmdZUUNiSUM4aXhJ?=
 =?utf-8?B?NUlOclNrK1J0MG9POUxoenZtKzMvT2QyWStrVElKTHl5SDIzNmJDVGlXZ1hl?=
 =?utf-8?B?UFIxK3UzWXd2elp4ajIxNDlZODk4ZTdHaHJsRnl2NDhNbVhUQWlqeWtybkdj?=
 =?utf-8?B?SWRBc0JjVlpvand4N2M0eFUxTnhaRCtCK3N1djBmMEJuY0M1YkdVa3FLZERS?=
 =?utf-8?B?Q0VBdmRIemJDZEZOeUsyQU03c3JnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fbc0f2-7d2a-4fd0-c398-08dd2b1b215a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 10:49:27.9735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SjS00ntRv8RksT+DsQFYWUSyAtTQDqFfT4Xq3zv8uCTEOHi2nyf8HGN8xpslDRchYMM7pRdkvxooFm1Bi/upWbIWndptsZ4eAYaOOr3ZnzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8297
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

PiANCj4gPiBAQCAtODksNiArMjgxLDEzIEBAIHN0YXRpYyBpbnQgaW50ZWxfZGdfbXRkX3Byb2Jl
KHN0cnVjdA0KPiBhdXhpbGlhcnlfZGV2aWNlICphdXhfZGV2LA0KPiA+ICAgCQlnb3RvIGVycjsN
Cj4gPiAgIAl9DQo+ID4NCj4gPiArCXJldCA9IGludGVsX2RnX252bV9pbml0KG52bSwgZGV2aWNl
KTsNCj4gPiArCWlmIChyZXQgPCAwKSB7DQo+ID4gKwkJZGV2X2VycihkZXZpY2UsICJjYW5ub3Qg
aW5pdGlhbGl6ZSBudm1cbiIpOw0KPiA+ICsJCXJldCA9IC1FTk9ERVY7DQo+IA0KPiBXaHkgc2V0
dGluZyB0byAtRU5PREVWPw0KPiANCg0KWW91IGFyZSByaWdodCwgZm9yIHJldCA8IDAgd2UgY2Fu
IGtlZXAgZXJyb3IgY29kZS4NCldpbGwgZml4IGluIHRoZSBuZXh0IHJldmlzaW9uLg0KDQotIC0g
DQpUaGFua3MsDQpTYXNoYQ0KDQoNCg0KPiA+ICsJCWdvdG8gZXJyOw0KPiA+ICsJfQ0KPiA+ICsN
Cj4gPiAgIAlkZXZfc2V0X2RydmRhdGEoJmF1eF9kZXYtPmRldiwgbnZtKTsNCj4gPg0KPiA+ICAg
CXJldHVybiAwOw0KDQo=
