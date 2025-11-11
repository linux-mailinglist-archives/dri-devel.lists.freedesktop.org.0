Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC70C4CC6D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 10:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7DC10E527;
	Tue, 11 Nov 2025 09:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ff2I6sLf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CB510E04C;
 Tue, 11 Nov 2025 09:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762854800; x=1794390800;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LYheSfwC2hHnuuI2JC1h2Klhhmj20aT+vXRQWitoNxg=;
 b=ff2I6sLffp5WMhmzP4UM/1AbJWt0iGrS0ZpYENpjeZ+URcPuYFjRvSyl
 n7tTy7f5zCSrtR5b27NshyUtc+a3HUcbGuXMtSDwEuDe01P7AN7HiQp/F
 HC4bEkBvKs2/z3v8cCfhxre999n4kiRsgI6SmyOHTyrteURrJ+j5Jeg9M
 Psji7zp04TVN7QuyhzfmiIzx0PBovrWhOw9e0GWDAdFqrvy+fQ8+wHcqV
 mK5lOjlf4XsSYnUG1wiF16IUFwL9QGPgmKJOSAl/OBjJkT3/4xS3ceEmQ
 6ikn18WBA9F1ULJlJIe0lDNrGrvGTZoQzkFD4TnggSIsUDzFhcTKYNGhu A==;
X-CSE-ConnectionGUID: zCflBtJzTXeqeZjRVNQMgw==
X-CSE-MsgGUID: jhTe0DRtTHOlCOeEJZmG8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76368323"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="76368323"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 01:53:20 -0800
X-CSE-ConnectionGUID: vC6T2X1zQjy+HKgJ8v9q7A==
X-CSE-MsgGUID: A79h238+QU+kxLNheEEipg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="219640438"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 01:53:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 01:53:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 01:53:18 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 01:53:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNJHWA+OPEycHrHvw3C4XfIZYhYpWFSiTw6JX0/sGzq6NH5k45+9GcvCouMFs3pGqdoCnwKneu7rJWUKxdb/CHNphxSOOxrKhaqv1T27yhvIulI2b16V4scKbb2ZqmDX4oOQuCyONTgnK1rWg1ORtsbQ+ApBsbxjU8eMomg2t5kI67X5BDHio+Y0TKqrhF1QpOb6l7idaVWQtxo57mJ40B5sZ0SvEdzDEMh13jOC7Fv78Bq8sBu63wll/IknCd204EuZRavfk/a+cMVD8rXg3hokCIuu0f7M6tP6kM1413m52AaJJCkMGMtONEaxvBTleuLUKH8xW4lmdEv1+1p0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYheSfwC2hHnuuI2JC1h2Klhhmj20aT+vXRQWitoNxg=;
 b=CI6jhunNUsqbBFiIzJKi+d6+BpgJE4VfKhFHhspKvu3h4t2Y7upFsqU9y1KISFk0YoOTZIUsTTv28/M/ihd7K85610DOc+MdxG6OPjS94aCnalcvSgIO0z6cSd6W9Oocf2+4rMH9kML0LsSycOE1otG/8HDKsXWRaoadwcmvpGSNFSYlf9678CVyf83zytJPX7l9oyixo9B1DSDcsWUSlCn786vs1FXqVGg1VYKZ7Iz59XCxhdc/MPmDjCyoeJC+ZU/CVjBm8p+sTE3/egS7FDoTdEBMi5Nb6/iVXtbEONTCCA/mjNcAgcQhihYThDaFDjX9v2zP7O8br46HlJGhjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5278.namprd11.prod.outlook.com (2603:10b6:5:389::19)
 by DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:53:16 +0000
Received: from DM4PR11MB5278.namprd11.prod.outlook.com
 ([fe80::5bec:aa9e:987f:5466]) by DM4PR11MB5278.namprd11.prod.outlook.com
 ([fe80::5bec:aa9e:987f:5466%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 09:53:16 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>
CC: Alex Williamson <alex@shazbot.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, "Shameer
 Kolothum" <skolothumtho@nvidia.com>, "intel-xe@lists.freedesktop.org"
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
Thread-Index: AQHcUqd+vf1n1dVj5UmyiLVe2Lh3r7TssNbQgABzb4CAABL5oA==
Date: Tue, 11 Nov 2025 09:53:16 +0000
Message-ID: <DM4PR11MB52784CBB6C5AF6F19E373A278CCFA@DM4PR11MB5278.namprd11.prod.outlook.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-29-michal.winiarski@intel.com>
 <BN9PR11MB527638018267BA3AF8CD49678CCFA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7ig24norebemzdih64rcpvdj22xee23ha7bndiltkgjlpmoau2@25usxq7teedz>
In-Reply-To: <7ig24norebemzdih64rcpvdj22xee23ha7bndiltkgjlpmoau2@25usxq7teedz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5278:EE_|DM6PR11MB4545:EE_
x-ms-office365-filtering-correlation-id: 15ed76dd-0ed0-4a3d-5beb-08de210822f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?b0d6NGRmeWVVQldVOEJROENtdkV5NEZPVjdibXB1TXlXTEs3dHdUVUlPOGM4?=
 =?utf-8?B?N1puaTlIRTBWN2luWXRYM3UzaGE4ZGFrd1p2bURlRTBvMVNPN292TS9UbDlD?=
 =?utf-8?B?VXo1Z2Zkc25FVks0RThCOG93ZWVzbmRKL0pQTjlhRFhBbkdZTTBDS05oNTZF?=
 =?utf-8?B?Tm1JYlMyeWNuTHBkcUN5UHA4K2pMTHFHS0dubk5PM2NTQ2dCYTZ3MW1sdmdN?=
 =?utf-8?B?Z1l2L3VnSDFMVERJaXJWbnppaXFnZmplYTN4ZkNvcDJnNXNBRjRRV1dBY0pW?=
 =?utf-8?B?YnU2bnljaEpVV0VKR05Qb3ZTZktnOGtGQTRDTENJT2xQZlUyRkxuVVdTd0Z2?=
 =?utf-8?B?TmhaSTB1S0NVU1FvYW9Eb1RqQmpQM0VtbmRHQVNrcjhoOTc0SkZ6bHpwK2Ey?=
 =?utf-8?B?KzRUZlJGU21HVEJtUVIreC9HMjBKNEExMFNhU1ZOaUNrekpJZlZySm9lVFRV?=
 =?utf-8?B?TVc2c2hOQ01OclpKbU9ER2JwZ2czc2xuOU50b2s4bkNGeFY4dVNocGN3UTF3?=
 =?utf-8?B?VlZRcnJSOWROZnExRng5WTN5UlN2c200QVJLdm5yemVxKzZLRHBCcE0veWRj?=
 =?utf-8?B?VmZzam5ESUlSc24rc0ZHNnNDUlZwZ3NTbXgvVDU0Y1pwUzlPa2JaWDViMnB6?=
 =?utf-8?B?d25BZm04VjU5SzhmdlEzbjhsZGxMMnRCL04zaEN0SmF4ZmhvYmJoSktOL2Np?=
 =?utf-8?B?OTIwVDgxNitybDZYekJMMklTcDJLMzJEdnhNeWR5bGVkOXY1eFFJelNFUnZl?=
 =?utf-8?B?bnpXdEpqVFIyYms0cVBpZmpYWTFZWlJTVXJTQytacW9Ycm41cjhpT1VVVHRC?=
 =?utf-8?B?Y1haL3FPNG5abkpYeFY2WmlSR090aFdseERBckpsMEpKUFpwdTVtQk1nLzh3?=
 =?utf-8?B?UFJBMWF5azNrQzJja2xSL0pjV1NuN25JcXRJbWd6SEFuQU1Qcko4MlI2MnRn?=
 =?utf-8?B?djFOcHI5NytnNmorV1YyYVl5UjY5QTJ1T2ZGRmRQa3ErQ2JjK0c5U080K2Mr?=
 =?utf-8?B?c2VUcnI2cVJoNG5mNG44U2wyT1g1UHVNTkZmRjlKc3F4Um9lYkdpbTZyNW5r?=
 =?utf-8?B?Mml5cFBYaEd3T3VYM0lSWnJoR01LTlhzcFYzL3M3VHBMQnl3TEVvdm5ZWjIv?=
 =?utf-8?B?UHBxTm5YamN0T2hQZkk0MnVZTG5McUlMRnpGSVR3QjVUZlRHTWR2WWZDY2xT?=
 =?utf-8?B?OFNBWForY09TdXU1dzlPNk1WK0gybmU5Vm8xS3BxREpLZUlhSUZiN002ZGJY?=
 =?utf-8?B?VElWY0hHUFY0bkhUWmhyUmplUmlQWmZXeGxtWGFtQU5KcUJlb1hvT3FQdE9S?=
 =?utf-8?B?ZzFFMm5QczFuS2I3MTRFeUZsTXlYcmJPcFFFMVlSVi9DTzFPL3dCZGtLbFpQ?=
 =?utf-8?B?dU9sNHlmWE4rYllGam5qMWEyVnd3WHRGeUtaYmJKbkpIUE9aODlZQ0hNU3ll?=
 =?utf-8?B?Q21DL2ZCTVoxZ0hUUElqNTY3d3phS2pyVHJWdFA0KzVQeFZLeE9rZ1hzWVo1?=
 =?utf-8?B?dUw5ZUYvd0M0RWdBU0VyZU0vSHVnRDNvekdTMjBmVnIzcE5KKzh6cGFZSTEz?=
 =?utf-8?B?dnZBczh4YlloclNLVGZtbFIxM0RmVG1lSlBmeCtUUEhpK0VuMWJtd00vMGRL?=
 =?utf-8?B?emdmcU1VdURCOWkzbllKTTJWNDZCS056ZWJRb3RoVUFuL3VOelRaN3FnMUpx?=
 =?utf-8?B?VjhVOUVPbndxbVdBT3RiZFpxUFRaaFB0OE9IaFQraHdRaE9kNERGZUxNaDlJ?=
 =?utf-8?B?Z0x0NmphbjN5bm0wRjJxWHZQVWVBN2lHd2htQitkVGQzRGtFM01IdndCcGE3?=
 =?utf-8?B?cWE5VlhpRWtoalMxdWlBSnM4SHJhYUtMRUJrU3ZqRjFGNERZQmNzNlV0aVA0?=
 =?utf-8?B?d29NNGRSU3BETHZZTm5CYSs5QkFVREVxenZqR0JZSXNqQVJJS1ZUSG1Sa2ky?=
 =?utf-8?B?Z3JYY2dmdThrMUJpajRzSk92VjdLQ3g0ckdHdVIwVGNOQWJCYTZZKzVSKzlT?=
 =?utf-8?B?REpyWnNsQzZGb2VzRE9lQjJqNC9nUU40Z0tqdzk0ZkJNRGo1N2M0Nzltc1Zj?=
 =?utf-8?Q?brj8F9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVhTM1h6ZXZjeFRVSklidW8vNmhqZXVoUzFOL2kxaHFlNENTanFuZ0JFUHVl?=
 =?utf-8?B?d0lSRk1XcnRLRlZrWXpaZDljYjZYaU5sWXdUVVBTWjlvVkN3YS8zbTNhKzdo?=
 =?utf-8?B?eExFYXp6ZitieGJzK2xheC9sSnV5ckJtN1lMTGxYalQ0a2ZhVUEyOE9vbS9s?=
 =?utf-8?B?Z1lqVEpYZjB5UDhKWFdMZDQyZ1llSGFQSmh4RmN0dXpHNWU3N3kzNllRQUdC?=
 =?utf-8?B?L2syb0N6elBVUm56QTY4UFNYeHNQWmxwVitpb0xGNDBpZW1rVVhQMis1NU85?=
 =?utf-8?B?QU40cGJXU1N2OE85UmhmRTZUSGFsWTJ1VHFHV2FPS2JxaWhRQ2FybXpTbDZk?=
 =?utf-8?B?ZlJmSXdPeVZkNVlXOHlYWUE4QVlCQmZXZkY2K0Mzd1VOL0g0dTJIZzBwVXJk?=
 =?utf-8?B?UzlVSXQrYll0V1dFVEFPRDVlY0YwUm43TXlmWDNRajZWa2VPVExqMjFvT01q?=
 =?utf-8?B?dkJIVnNERlgyYXpheTM5MG9VRjlXd0RLclppVVVNTzA1ZWJKeTRHUHphaUlT?=
 =?utf-8?B?TitISklXaHl4RTZqZ2k0cEpaZkRGMk5YOVkyTnNJSDNOY1lBcDUrQjlNb1Bm?=
 =?utf-8?B?a1U4dVNJZjl6azRBMmU5MWNGWUZqSExHcGhBSW9ET1VRSGhnYngyMFJEN052?=
 =?utf-8?B?VFdmQmJkTDhHcVVpZFU4UXNiaHdoVFdxT2V5bWtqa21ZVVBMeU1yY1B5Y2th?=
 =?utf-8?B?OVJwTnc2R1ExaE5CRTVvM2VIY3c0Q3FkOGZrS0toejhkRk1iR2dOR2lvNlVC?=
 =?utf-8?B?VGZGT3JoUG9FTjNOd0cvWFlHV1d2bFVHZWU4LzNmaTBmYkI5ck8wNEt3ZXZL?=
 =?utf-8?B?WFc4bHZsZGhqcDJtY1M3dVpjSG0vS0xIQkcvMk8vczcxK0k4VCtKVDJNN0RY?=
 =?utf-8?B?RmxRWW1qVEx3N21La1ZacFBIbGdjRUU0aDNkL1FlbGVMV1oxTkJCbDBhTCtY?=
 =?utf-8?B?N21DaW5weXR0QWNZQm1ERFBhc3JHNGExdzRmQWh6Wjh3b2lxWm9SakN0NHc5?=
 =?utf-8?B?U0Z2TU1qeUdaSjJacDFDOGVSbnY1WjJnOUk3SEhoaXVxRzFvdjc5eXpxQ3Vk?=
 =?utf-8?B?YmxFNlNuZUdnd3kzYTJRTVczUWdmcVRTOE8rS25CYW9mY3ZpOEZJRHVRT3FE?=
 =?utf-8?B?UkhPYm5IQ3F5WjVDQmxCdldsMnYyREZnelc1TE9lS2xuL2MzM1A0TTdQNXRl?=
 =?utf-8?B?VExBcXo2VHNWTkI3Vm5ucEFGRDdjS2d1bnlxL1VEVGVkOWhtdTFiSERSMEp4?=
 =?utf-8?B?N2tGMG5sTm9uMHQ5Ukx1cTA3ajFOcEpSaExneHhTVkNaQ25ZV3JPZ0ljUlln?=
 =?utf-8?B?Q2ZMT215QmxyYVZjYS9HWlo0b1NOLzk3WU1XR0M3SFp0MUZJK3IzQ01XUTJE?=
 =?utf-8?B?U3lQOEdLajBzeEhNa2V3VzZicGRhSmRoMFVnVHR0b3FNTGt5SE5udlc5TDZL?=
 =?utf-8?B?WHpISnJ1VDJPcGVkNHZaWlhHbExNU2xuV0hJVThIK0I2eVBrZFY5Vm1QVG5O?=
 =?utf-8?B?UDJCc1BJMUZjSWRucjNqTzNqWDhHWml5aWc4ZEVNaG9zU0JjSjcrL3ZtRG5P?=
 =?utf-8?B?WmxKSnppdElrYUdBN0FjcWVDaDZZODdtWmZwR0hocWV6azFFWFdqYVg4TlZU?=
 =?utf-8?B?bkNzTmhWeXQvb3hsZEFGR3YxTG1HK3FaY1FReXZYQm96S1ZMd2hsRmlqdWRW?=
 =?utf-8?B?UTRta0dkQmVSR2ZwZjdZV2NBVUN5cjNxVFoyckNlRDFmTlBhbU53OWt6MXh0?=
 =?utf-8?B?Nmh2cG13VnNmR2lLdEpKYWZVWm1GUnpLcFJBSmtaUzh1bno4eGFxN0hKMFlZ?=
 =?utf-8?B?d1BJSTRocFdkRlk1SGhpR2NDNXhVUHVSZjlDY3RlSnpFa0pFSjNKVWdvdFdq?=
 =?utf-8?B?RW52Wms0VU5lY2MxWXpZYm4rd0txWDBaeDJUNHJhblY4dU9pQUdmbjBUQllE?=
 =?utf-8?B?TzQvVm00S3VqNTRNWm9ITDBqaWphVisxM2RLQ3R0aC8yd09rWVhBWDd1YjJv?=
 =?utf-8?B?MjFJZ3ZOdGlFY20ySndRL2daN25UZWlDcUdIbjFvQmNlSDM4TW1rM3BvYWZL?=
 =?utf-8?B?c0FHY09DZ1BzRVM3K0ZUYjVsQVBNN1RIV3NQLzZJUHFDTjBRdytNc290ZkZE?=
 =?utf-8?Q?HCfgKKfcnIccAkIsVdf1ZmKtN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ed76dd-0ed0-4a3d-5beb-08de210822f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 09:53:16.2562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gHM9fAMgC+YVZC0NFv/ro+Gdbl5FDR+cv2GgXY1bjbNEkvKzmm4jsCYPFvE7u7WXrzefJX4/ezjSFkXt4dUwsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4545
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
IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDExLCAyMDI1IDQ6MjYgUE0NCj4gDQo+IE9uIFR1ZSwg
Tm92IDExLCAyMDI1IGF0IDAyOjM4OjE5QU0gKzAxMDAsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+
ID4gRnJvbTogV2luaWFyc2tpLCBNaWNoYWwgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPg0K
PiA+ID4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMTEsIDIwMjUgOTowNSBBTQ0KPiA+ID4gKw0K
PiA+ID4gKwkvKg0KPiA+ID4gKwkgKiBBcyB0aGUgaGlnaGVyIFZGSU8gbGF5ZXJzIGFyZSBob2xk
aW5nIGxvY2tzIGFjcm9zcyByZXNldCBhbmQgdXNpbmcNCj4gPiA+ICsJICogdGhvc2Ugc2FtZSBs
b2NrcyB3aXRoIHRoZSBtbV9sb2NrIHdlIG5lZWQgdG8gcHJldmVudCBBQkJBDQo+ID4gPiBkZWFk
bG9jaw0KPiA+ID4gKwkgKiB3aXRoIHRoZSBzdGF0ZV9tdXRleCBhbmQgbW1fbG9jay4NCj4gPiA+
ICsJICogSW4gY2FzZSB0aGUgc3RhdGVfbXV0ZXggd2FzIHRha2VuIGFscmVhZHkgd2UgZGVmZXIg
dGhlIGNsZWFudXANCj4gPiA+IHdvcmsNCj4gPiA+ICsJICogdG8gdGhlIHVubG9jayBmbG93IG9m
IHRoZSBvdGhlciBydW5uaW5nIGNvbnRleHQuDQo+ID4gPiArCSAqLw0KPiA+ID4gKwlzcGluX2xv
Y2soJnhlX3ZkZXYtPnJlc2V0X2xvY2spOw0KPiA+ID4gKwl4ZV92ZGV2LT5kZWZlcnJlZF9yZXNl
dCA9IHRydWU7DQo+ID4gPiArCWlmICghbXV0ZXhfdHJ5bG9jaygmeGVfdmRldi0+c3RhdGVfbXV0
ZXgpKSB7DQo+ID4gPiArCQlzcGluX3VubG9jaygmeGVfdmRldi0+cmVzZXRfbG9jayk7DQo+ID4g
PiArCQlyZXR1cm47DQo+ID4gPiArCX0NCj4gPiA+ICsJc3Bpbl91bmxvY2soJnhlX3ZkZXYtPnJl
c2V0X2xvY2spOw0KPiA+ID4gKwl4ZV92ZmlvX3BjaV9zdGF0ZV9tdXRleF91bmxvY2soeGVfdmRl
dik7DQo+ID4gPiArDQo+ID4gPiArCXhlX3ZmaW9fcGNpX3Jlc2V0KHhlX3ZkZXYpOw0KPiA+ID4g
K30NCj4gPg0KPiA+IEphc29uIHN1Z2dlc3RlZCB0byBkbyB0aGlzIGluIHRoZSBjb3JlIGdpdmVu
IGl0J3MgY29tbW9uIFsxXS4NCj4gPg0KPiA+IElmIHlvdSBkaXNhZ3JlZSwgdGhlbiBwbGVhc2Ug
cmFpc2UgaXQgYW5kIGdldCBjb25zZW5zdXMgaW4gdGhhdCB0aHJlYWQNCj4gPiBpbnN0ZWFkIG9m
IHJ1c2hpbmcgdG8gcG9zdCBhIG5ldyB2ZXJzaW9uLi4uDQo+ID4NCj4gPiBbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMTA4MDA0NzU0LkdEMTg1OTE3OEB6aWVwZS5jYS8NCj4g
DQo+IEhpLA0KPiANCj4gSSBhZ3JlZSB0aGF0IGl0IHNob3VsZCBiZSBkb25lIGluIHRoZSBjb3Jl
IGV2ZW50dWFsbHkuDQo+IEkgZGlkbid0IHZpZXcgaXQgYXMgc29tZXRoaW5nIGJsb2NraW5nIG5l
eHQgcmV2aXNpb24sIGFzIHRoZSBkaXNjdXNzaW9uDQo+IHdhcyBpbiB0aGUgY29udGV4dCBvZiBj
b252ZXJ0aW5nIGV2ZXJ5IGRyaXZlciwgd2hpY2ggaXMgc29tZXRoaW5nIHRoYXQNCj4gcHJvYmFi
bHkgc2hvdWxkbid0IGJlIGRvbmUgYXMgcGFydCBvZiB0aGlzIHNlcmllcy4NCg0Kd2VsbCBpdCBk
b2Vzbid0IG1ha2UgbXVjaCBzZW5zZSB0byBwdXNoIGEgbmV3IGRyaXZlciBzcGVjaWZpYw0KaW1w
bGVtZW50YXRpb24gd2hlbiB0aGUgY29yZSBhcHByb2FjaCBpcyBwcmVmZXJyZWQuDQoNCj4gDQo+
IE5vdGUgdGhhdCB0aGUgdjYuMTkgZmVhdHVyZSBwdWxsIGZvciBYZSBpcyBsaWtlbHkgZ29pbmcg
dG8gaGFwcGVuDQo+IHRvbW9ycm93LCBzbyB0aGF0J3MgcGFydCBvZiB0aGUgcmVhc29uIGZvciAi
cnVzaGluZyIgdGhlIG5leHQgdmVyc2lvbi4NCj4gSSB3YW50ZWQgdG8gY29sbGVjdCBhbGwgdGhl
IHItYnMgb24gWGUgc2lkZSB0byBiZSBwcmVwYXJlZCBmb3IgdGhhdC4NCj4gSWYgYW55IHBhcnRz
IG9mIHRoaXMgc2VyaWVzIG5lZWQgdG8gZ28gdGhyb3VnaCBYZSB0cmVlLCBpdCB3aWxsIG5lZWQg
dG8NCj4gYmUgbWVyZ2VkIHRoZXJlIHNvb24gKG9yIHdhaXQgYWxsIHRoZSB3YXkgdW50aWwgdjYu
MjAgLyB2NykuDQoNCmF0IGxlYXN0IHRoZSB2NSBjb3Zlci1sZXR0ZXIgc2hvdWxkIHRlbGwgc29t
ZXRoaW5nIGFib3V0IHRoaXMgcGxhbi4NCmluc3RlYWQgb2YgbGVhdmluZyB1bmFkZHJlc3NlZCBv
cGVucyBpbiBwcmV2aW91cyB2ZXJzaW9uIG5vdA0KbWVudGlvbmVkIGF0IGFsbC4NCg0KdGhlbiBJ
J2xsIGxlYXZlIHRvIEFsZXggYW5kIFJvZHJpZ28gdG8gZGVjaWRlIHRoZSBtZXJnZSBwbGFuLiBG
cm9tDQpteSBzaWRlIEkgZGlkbuKAmXQgZmVlbCB2ZXJ5IHJpc2t5IGhhdmluZyBYZSBwYXRjaGVz
IGFuZCBWRklPIHBhdGNoZXMNCmdvIGluIHRoZSBtYWlubGluZSBzZXBhcmF0ZWx5IC0gdGhlIHJl
bWFpbmluZyBvcGVuIGlzIG1vc3RseQ0KY29udGFpbmVkIGluIHZmaW8gc2lkZS4gDQoNCkJ1dCBu
b3cgb25seSBvbmUgVkZJTyB2YXJpYW50IGRyaXZlciByZXZpZXdlciAobWUpIGxvb2tlZCBhdCB0
aGlzDQpzZXJpZXMgaW4gZGVwdGguIEphc29uIGdhdmUgc29tZSB2YWx1YWJsZSBpbnB1dHMgYnV0
IEknbSBhZnJhaWQNCmhlIGhhc24ndCBkb25lIGEgdGhvcm91Z2ggcmV2aWV3IHlldC4gTm90IHN1
cmUgd2UgYXJlIGF0IGEgcG9pbnQgDQp3aXRoIGNvbmZpZGVuY2UgdGhhdCB0aGUgaW50ZXJmYWNl
IGJldHdlZW4gVkZJTy9YZSBoYXMgYmVlbiBmaW5hbGl6ZWQuLi4NCg==
