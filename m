Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470F6C77AAD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 08:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2416288A3E;
	Fri, 21 Nov 2025 07:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0LpYdOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02E310E12D;
 Fri, 21 Nov 2025 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763709567; x=1795245567;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I37X2MLkvSim5qK9SSGg49GuhW3LEEjGzbzqDK63rkw=;
 b=B0LpYdORdgYRlKxgM9lacoV9jo6+A8q5fQoW97uiV+XBsSIs2f4a3/m5
 +NHNKXaKYAVPn61H9EsPYiKZd3DvALNnh0lGXr6T26GkuoVVVrTZ/5XUZ
 DtVnKRNwVAZ1ykMOin9Ndgt1UH5wrceHK5kf8/cxw1CMD73Yr3P9y7stY
 S6Q4tvOCvSqqosu8E40jQ86oHleFBeq/6vzP4mlFE9qEn/EQ/yUgcDJ7c
 Hz179uzc7wI1kOzB1F7jlkfXMwFxCOpT2n3OuiXPtSvWdktYAmBWWTJAO
 SFRHq1IlTegzQ20BFChYiwhI/4ZVcHNvEmFIicU14a1Zuxb6gB575SRyg w==;
X-CSE-ConnectionGUID: vBtAaEp9QTiQUyi9PEWkcA==
X-CSE-MsgGUID: Z2beEQCuTbWdM06ZToKiWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64802843"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="64802843"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 23:19:26 -0800
X-CSE-ConnectionGUID: RAs2xe3YR1m/aJvWVBJDDA==
X-CSE-MsgGUID: BTesDzTvQxCJ+6FL/6hIPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191734058"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 23:19:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 23:19:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 23:19:25 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 23:19:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9ZknidBfFnslaspK46UxA2SeTJHnOP83RSHU18g9dPcEBQtniqZG1hESuAiqjL06VVoxAxtuVhmpYR9jtSBQgWri4SgJkMDLEdSGjWkQVDq85vy5pe3yC2ZjDxS6iAHVLr0LHxvzISiiQdCZWlclOgknVJU7P6NvBWq4PXlgrYmuxGDJ49lalNTK/nOKyYUimGL5vjzA/fH79T6D4gNxhNfUD2kO69S1qWgt8GHDIncGIacDCC5dSKT2aHdNspEGL9+9aSXALUCJCQwFcnEWXpVbk5waVYU3u9w3FT94+Ij+7YWh9mig1+QF0+yT3nqUOkuInqaKzGay7oWtoddbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I37X2MLkvSim5qK9SSGg49GuhW3LEEjGzbzqDK63rkw=;
 b=o3d3JSJ9MK1U/fignS95HUbygEvRQbBO/xhHSKiAi8MOY0/stPDnhTYYYM7cef4rCwP7OybNiwoqXHNgUnXmSYK9wb9whEEAPmaNyAMFLqfXNRYzzrVYuIt3iGGiGIwAZKYdumO+DaJ1AyBCHvbczxy4SKSzoo/6TT6Gt31S4lh+BNLsvHjQZx6rSc5i3FB7fpzSqh26oLtW8HZRqlcg2qBNjsiWRYg6njZzH1RjfkAKNCgX/hRoAExyF1ocf/UbB5f4T100IDglrGTXOGIvIs9/jics/nU35ou8RZBETqEL6Dobwta3KvPEgbGQPMuAOCrjwk52mGT+HLy4RMkU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA1PR11MB6822.namprd11.prod.outlook.com (2603:10b6:806:29f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 07:19:23 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 07:19:23 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>, Jason Gunthorpe
 <jgg@ziepe.ca>
CC: Alex Williamson <alex@shazbot.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Yishai Hadas <yishaih@nvidia.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "Christoph
 Hellwig" <hch@infradead.org>
Subject: RE: [PATCH v5 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Thread-Topic: [PATCH v5 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Thread-Index: AQHcUqd+vf1n1dVj5UmyiLVe2Lh3r7TssNbQgABzb4CAABL5oIAB2NgAgAgdW4CABGLiAIABNz/Q
Date: Fri, 21 Nov 2025 07:19:23 +0000
Message-ID: <BN9PR11MB527619CD77F553EE93D514AE8CD5A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-29-michal.winiarski@intel.com>
 <BN9PR11MB527638018267BA3AF8CD49678CCFA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7ig24norebemzdih64rcpvdj22xee23ha7bndiltkgjlpmoau2@25usxq7teedz>
 <DM4PR11MB52784CBB6C5AF6F19E373A278CCFA@DM4PR11MB5278.namprd11.prod.outlook.com>
 <ndd4kt4elbm7ixzyouhorgatjwv73ldyjo6bmrbipxvaqzccjs@ssavf6b5ric3>
 <20251117174117.GD17968@ziepe.ca>
 <5idiblmgmuervob3inen2abfkwmru7aqrqmzjmg3jyjqfhdsig@cokyf522niow>
In-Reply-To: <5idiblmgmuervob3inen2abfkwmru7aqrqmzjmg3jyjqfhdsig@cokyf522niow>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA1PR11MB6822:EE_
x-ms-office365-filtering-correlation-id: fee99b65-d5df-43a5-9aac-08de28ce4bb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WFNwVVVLTnF1NnNKam5DWHU0OHhTcE53eE9Xd2c5eW5MS3dpU2V3UFY3VndM?=
 =?utf-8?B?SU9YdGRodSswR3BvV292UWpsVlVjMUkrTCtLYUhmdXFSTTZMelk1WmlMdUpJ?=
 =?utf-8?B?c0ZrVzVVMTlvY3A4R2ZlS1ErdHlnbmlHdFAvbVV1QzQvbDFCdVo2WWZGdUdj?=
 =?utf-8?B?RDlhQVdxeFBrZXNwKzNUdmdBUjZudDhqYmp1OXZkdXRGTzFYYThWNkpxOUQ0?=
 =?utf-8?B?NnJyTTcwb0JwMnIwbG1CSzhuUXcxNzVUK1pxRU44SU1RcDdRbUpSVVhlYVVy?=
 =?utf-8?B?ZU1ObDBvbDdBNmRWTjQvU1dUd21ETDdTeU9wNVlQa1BzM2pEZFBxUkhZSXEv?=
 =?utf-8?B?SFRFMDc4M3gxQklqdWtzTGNvNWdQblVtRktKb3RkbllPcjlaTk5aQXM0WGwx?=
 =?utf-8?B?dUFpbkNLbXdhMjRNVy9NZm9vNStVN2FTVVVQUjdPNWQ4eDVKUzA4NnBSeXRr?=
 =?utf-8?B?OXFyckdhbkhpUkJZYWtqMHAvVTl1SWQ2VDd2bTJuTk1nSUxwM01yMzBFU2J0?=
 =?utf-8?B?UHNRMGd0eXFHcjdFc1ZVZTlLeGIvQk9tOFJQZlliVW83Rkgxd1h4czFlNk1t?=
 =?utf-8?B?YTBxclJoNGJFMnE0YkdjNXMzaCtLM3VpQ3VHcWx4WjU2V1FTQkNNZi83VDFC?=
 =?utf-8?B?eFlDV0Y4RHBZWHVTRk1uTVV1U0FURnNuaXFNRFp4WG81S1NBK01naVYzWit5?=
 =?utf-8?B?NU1ZM3paVWltVy9PcnUzMWQ4ckNicmRMSEZta2VSNWxBQUlnWC9CYlFjQUwv?=
 =?utf-8?B?N2dNR253eHpESHhQVWxqRVkvYUlnYlphT1I4RlU0V2ZaZ0NJdnZQblR0NFFD?=
 =?utf-8?B?MU00Wk1USk1wQ3BvR1VqcDlkTnQ2R2oxZXB6bGxqcHk5SDBuWnNsN1oxVWMx?=
 =?utf-8?B?TW9mdSt1YkpWVmdoSVQzVGtLS3BWMlhFUXpneUl4ZDkyRWwyU2lSc1c3YU50?=
 =?utf-8?B?b2FRd05jd0JOR3RQQjZZelArcERUc0Jub2J0S1d4aVdFV0MvVmhDcUxDdno0?=
 =?utf-8?B?Mm40OS8vbUw2cEt3bEZheS82OWtIZEtFcSsvbHdKUlVQa2paZndVbVNiaTZR?=
 =?utf-8?B?TlFhL3U0MjFjUkh4WFFsV0tVaUQzVmJyalZWZ2hCZ3YxSTgybkJsSmZ2cWtr?=
 =?utf-8?B?dkNWMFNhZ1RZd2hCR0JsMjlraW9tc3F6aTRXNG5naUJwVElTRzFRMDd2bTZk?=
 =?utf-8?B?ZDNwdGNNcFNmTjdlUEtiNVJFenN1SFlFVit6UnRwTlpiRUlCbUVHcGVST2Ju?=
 =?utf-8?B?cUxoeHJlR2lQMzJxejRReGxaMlZyWnJTZFdsNmtJTGJZbXBrR1lBSytiVFFh?=
 =?utf-8?B?SThNc29wUmdqY2hDMjJGRlNlbG0wdmY2Y1JBUUw0cFFWQkh1bzRzczF0UjJY?=
 =?utf-8?B?aVlMQ1MwYWd0cnlwaWFlTHZaa3JGOGRERlRjdWdncktSR1BneTdYL1E2MFc1?=
 =?utf-8?B?bC9KbW80V1JQeUhrR1V1bFh3WE1aWjE5L2FkL0Y2L1drZTZIcEpHODhTTnh1?=
 =?utf-8?B?TXZNUXE4UEZNWCtKOUdHMmVLQ3RjTmFrTXRlSlF6OXFQeFk0c1FpK1BQNjZO?=
 =?utf-8?B?dis5Mis0SC9PNWZ5aEovRGorbmpLSkllZWZCdXhnSHFrejg1dlNRQlpWWnpD?=
 =?utf-8?B?NldaLzNZWHhxd0VBQW82ZWtoMjF2NTlaWGRNc3gwMVcwdDlkM213aXRoZXEy?=
 =?utf-8?B?eWdRY3hJdHg5TFNmMnlPMUZra0kxS3lGKzEwdUk2WWF6S09aSUFoSll0MFp1?=
 =?utf-8?B?U245aG1MV0tQY3BHYVZSRm9rRWlzK0RiVXBFL2VzTjNqQ2RtbmVjdlFLNytm?=
 =?utf-8?B?cDZ1dUhHV0VIUDhHYXNxUGNjb1ExeGdRUXcraFdoaEpIWGdFdXBGRHRubGh6?=
 =?utf-8?B?elJJWkVSM1l5bnNMT29sTjhiSHNneWxCNzU1MlhaVVpiNmVIbCtlNUIxS01R?=
 =?utf-8?B?b0syb3NLNFd4dWtKeUNLbGVMRlg3UzdaZzdqNzJmOFdOVWs3dUxyL1lnZEV0?=
 =?utf-8?B?REoyWUg2aWhraDBaV2JnUUxQWnVBeXZJTWhma21TSEo1NnIyZEpiZnQ2SlRm?=
 =?utf-8?Q?W+wHGY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWZleHRZUHV5bGwrQVVaRVlVOExzYjIxVWM5S1hOVy8rdnR1cDkyeitFYjRq?=
 =?utf-8?B?dHRySndVdG9ESElUeExRMk5vRFIweGExU3R1Q25RcnJhbEJrdG95NU5FcGRi?=
 =?utf-8?B?ZkVVRFFYeHhyVGtWNE5od1F1WGgxa2RKdHZ6bU93bllhVWZBL0h2SlBWM1pE?=
 =?utf-8?B?Nk9ETHlKV0x2SXRqQUp0aEJFUFJkcjNHeWVWbS9id0R2NGZPSFlpUk8xV2VK?=
 =?utf-8?B?M1BrUDlzYTUvRHV2REh1VFFNTSt0T1BjYWNJQXV3R1hRQnpBVkk3NGFFdFho?=
 =?utf-8?B?Y01VU2JuS2FDKytCaFc0NGFNM2VXcHcvaDE5cVhoTlVNSnJmU29DK1ZiWjN6?=
 =?utf-8?B?YTlvRkY4Slk2UEVXSS9LY2FyVTkzR1NUcDJKclorTW51WUx5M2tGSzlzRWF4?=
 =?utf-8?B?dEFwUFNla0llVW5hR3U5bGtVSzNzZ0dlNXNxSW5NSXQzS3hub1FjbGR3VEhK?=
 =?utf-8?B?UUNPcDNGK3hnV0ZGdU1XR0dib0RLQVpqSTJKSUh5MUtFdUhzVFF5Sm8wWmhq?=
 =?utf-8?B?WmRhUXgxSlFpNEtDbEIyYlBMYVp2cS90bkdqVUtEdDZ1MTZ0VytDcWdZV2Zu?=
 =?utf-8?B?OTUvV21CU1V5TmVjelB0UEF4V2JTcHVnaXl2MVhBYy8wK1JIZllKeU5HWTQz?=
 =?utf-8?B?NFpIWU9UclI3YVA3cmhKeDMwOXpIYjNaNnFldTd3TXd3ZWZtNGhLeHVLYW5k?=
 =?utf-8?B?aVhWcFVqOFVNL3BMZ2RJTVFLeVZCUEVZM2NSeHF3Q25wL2VZcWtkMUNoekRk?=
 =?utf-8?B?aU9RR2xEaWZRaDNDS3hkMmpPTkRVZWFiYXkyZWJhalhxVTNhbjlFcE5yMUo0?=
 =?utf-8?B?ejdJUldmYmJ2ZlkzSWJyRUJrVzdIMzZmSUlFaEtKZWY3d0dKcVQvT240WE5l?=
 =?utf-8?B?L0JCdTQxeTRLN2U5TEhmMmpIc1hGT1IzaG9uOHora215Q1lyNUNOdHVNUWx1?=
 =?utf-8?B?QmtTQUM4ekpqUlBSbWVnNjNZZ1d6VldlOEJiMWQzOUF0bDNFSnNOYjQrK3Yv?=
 =?utf-8?B?Z3NCQ2dSbUZTbEU4NkdqWXErcEQwWVQ2b3pvQ0lMS2ZBZE9Ud2FNNVIra1oy?=
 =?utf-8?B?b05scFVQUWV5MGY1T2pRU3NJOFpSaWZ4aDR0U3hGOTlmVGdxMStQMWRoaEUv?=
 =?utf-8?B?Rzd4SlZIbXY2dk1NN1VQcFRJZjR4b3FJQ3Q0Y1IvTnozSkNWMm1Wdm02TDlU?=
 =?utf-8?B?LzEyaGdQajFhWldzWnZLUWJkTFNQZk9UZWpzVFhtVFRYWmZCbk45bUtlaTNk?=
 =?utf-8?B?UlJUdW5hZnpGbTdSYXlxb3JLanJxQjZRcTFhSVEybUovMlFYZTRQNjk3ZHoz?=
 =?utf-8?B?clNWMTBQU2MxaktxNkFRTkZaeGh1SW5tcHFwdDRlUWswN1ZOSzdiZ3pkVDE2?=
 =?utf-8?B?ZE4wWU9pR0VMbUpxWC8ySGtnaUFnbTVqN25TTTU0ejZRNkFJVE96YXcyKzkw?=
 =?utf-8?B?VUFOM1JpcGlTUVBtdzV6M01USmVZVGd4ZkR2M0ZxaXNkSTZjMExDT2ZCaGVy?=
 =?utf-8?B?ZG42YU1WYXpxKzVWTGFNamgwQXg0QlNOMUtYanFnd3hSSmVJeG5sa2dObHMy?=
 =?utf-8?B?Vk05bXVnOWdLZHdUcjY5MUVxalQ3TThhY1FpVllxVVNSZDMwVGV2cTRVM2hO?=
 =?utf-8?B?dUtmRmR4azRlN1U1THVOZ1BDTFZRQW5CVDhuQ1FLdFVRVlFraGtGR2lpTEVT?=
 =?utf-8?B?ckhxQnkydlhHcDNOa2VXUTNzeDdFdWJLa3BSMGczTWdiVmZwU21PTmFNMkl4?=
 =?utf-8?B?cjVzZkYzYUQxRmZXT0RLQWtCbjd2dFZZTlk3TmRjRCsxbkY4VmNXMGFoVzM4?=
 =?utf-8?B?K3YxVTBvUkZkZ3N0UFNIR2pNZ2NpOVJwYnRJSnlQeDB0WDh5RlRhdHRlYjVD?=
 =?utf-8?B?bDgvN0ZwLzNBallNdk1ZQ2R1ZFo4OTZ1d1poV2FXazZJK2FuanZaT0tWZjlS?=
 =?utf-8?B?VE40SGNjMWQ2dk14R3dnYjhzZ2xCUXVLZlVVSnh0N3RVVTRzRURrQXJvN2ZL?=
 =?utf-8?B?NmF3enA0QUhnUVpXYmRCdStYb3h6SEx3VnEwdXM3clpwa0lOMGdOMTZncDBX?=
 =?utf-8?B?Y0tLY1hqSGh5V0c2aUVZWldwSThTVWNSVGpoaXkrZjFCckVxVFhiKzh5REdz?=
 =?utf-8?Q?wUu93znwhLIfAiG3wj2eCZZ9A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee99b65-d5df-43a5-9aac-08de28ce4bb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 07:19:23.1802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0d7KGFBrvXIqwN7yd0JAeI0eSfMnySOBBT95IRDheLCnYJysPnvvx3uCFdkZSqhN4moHMvui+7OAdWpXorNGkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6822
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

PiBGcm9tOiBXaW5pYXJza2ksIE1pY2hhbCA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+DQo+
IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyMCwgMjAyNSA4OjQwIFBNDQo+IA0KPiBPbiBNb24s
IE5vdiAxNywgMjAyNSBhdCAwMTo0MToxN1BNIC0wNDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6
DQo+ID4gT24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgMDI6NDY6MDhQTSArMDEwMCwgV2luaWFyc2tp
LCBNaWNoYWwgd3JvdGU6DQo+ID4gPiA+ID4gSSBhZ3JlZSB0aGF0IGl0IHNob3VsZCBiZSBkb25l
IGluIHRoZSBjb3JlIGV2ZW50dWFsbHkuDQo+ID4gPiA+ID4gSSBkaWRuJ3QgdmlldyBpdCBhcyBz
b21ldGhpbmcgYmxvY2tpbmcgbmV4dCByZXZpc2lvbiwgYXMgdGhlIGRpc2N1c3Npb24NCj4gPiA+
ID4gPiB3YXMgaW4gdGhlIGNvbnRleHQgb2YgY29udmVydGluZyBldmVyeSBkcml2ZXIsIHdoaWNo
IGlzIHNvbWV0aGluZyB0aGF0DQo+ID4gPiA+ID4gcHJvYmFibHkgc2hvdWxkbid0IGJlIGRvbmUg
YXMgcGFydCBvZiB0aGlzIHNlcmllcy4NCj4gPiA+ID4NCj4gPiA+ID4gd2VsbCBpdCBkb2Vzbid0
IG1ha2UgbXVjaCBzZW5zZSB0byBwdXNoIGEgbmV3IGRyaXZlciBzcGVjaWZpYw0KPiA+ID4gPiBp
bXBsZW1lbnRhdGlvbiB3aGVuIHRoZSBjb3JlIGFwcHJvYWNoIGlzIHByZWZlcnJlZC4NCj4gPiA+
DQo+ID4gPiBUaGlzIHdvdWxkIGdlbmVyYWxseSBtZWFuIHRoYXQgYWNjZXB0aW5nIGFueSBuZXcg
VkZJTyBkcml2ZXIgdmFyaWFudA0KPiA+ID4gd291bGQgYmUgYmxvY2tlZCB1bnRpbCBjb3JlIGFw
cHJvYWNoIG1hdGVyaWFsaXplcy4NCj4gPiA+DQo+ID4gPiBKYXNvbiwgY2FuIHlvdSBjb25maXJt
IHRoYXQgdGhpcyBpcyBpbmRlZWQgd2hhdCB5b3UgaGF2ZSBpbiBtaW5kPw0KPiA+ID4gSnVzdCB0
byBkZXRlcm1pbmUgaG93IHVyZ2VudCB0aGUgY29yZS1zaWRlIGNoYW5nZXMgYXJlLCBhbmQgd2hl
dGhlcg0KPiA+ID4gdGhlcmUncyBhbnl0aGluZyB3ZSBjYW4gZG8gdG8gaGVscCB3aXRoIHRoYXQu
DQo+ID4NCj4gPiBBIGNvcmUgYXBwcm9hY2ggd291bGQgYmUgbmljZSwgYnV0IEkgYWxzbyBoYXZl
bid0IGxvb2tlZCBhdCB3aGF0IGl0DQo+ID4gd291bGQgYmUgbGlrZS4NCj4gPg0KPiA+IEkgdGhp
bmsgaWYgeW91IHBvc3QgYSBzbWFsbCBzZXJpZXMgdHJ5aW5nIHRvIGJ1aWxkIG9uZSBhbmQgY29u
dmVydA0KPiA+IHNvbWUgb2YgdGhlIGV4aXN0aW5nIGRyaXZlcnMgaXQgd291bGQgYmUgc3VmZmlj
aWVudCB0byBsZXQgdGhpcyBnbw0KPiA+IGFoZWFkLg0KPiA+DQo+ID4gSmFzb24NCj4gDQo+IEkg
cG9zdGVkIGEgc2VyaWVzIHRoYXQgYXR0ZW1wdHMgdG8gZG8ganVzdCB0aGF0Lg0KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUxMTIwMTIzNjQ3LjM1MjIwODItMS0NCj4gbWljaGFs
LndpbmlhcnNraUBpbnRlbC5jb20vDQo+IA0KPiBJIHdvdWxkIGFwcHJlY2lhdGUgaWYgd2UgY291
bGQgbW92ZSBmb3J3YXJkIHdpdGggdGhlIHJldmlldyBvZiB0aGlzDQo+IHNlcmllcyBpbmRlcGVu
ZGVudGx5LiBJdCBzaG91bGQgYmUgcmVsYXRpdmVseSBzdHJhaWdodGZvcndhcmQgdG8gY29udmVy
dA0KPiB0aGlzIGRyaXZlciBvbmNlIHdlJ3JlIGFibGUgdG8gZ2V0IGFuIGFsaWdubWVudCBvbiBz
cGVjaWZpYyBjb3JlLXNpZGUNCj4gc29sdXRpb24uDQo+IA0KDQp0aGF0IGNvcmUgc2VyaWVzIGlz
IHNpbXBsZS4gc28gd2hpY2hldmVyIGdvZXMgZmlyc3QgaXMgb2sgdG8gbWUuDQoNCmZvciB3aGF0
IGl0IHN0YW5kcyBoZXJlOg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+DQo=
