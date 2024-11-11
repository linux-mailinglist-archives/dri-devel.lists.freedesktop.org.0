Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731529C493F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 23:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82E710E0F0;
	Mon, 11 Nov 2024 22:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N39WGCY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A63C10E0C1;
 Mon, 11 Nov 2024 22:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731365124; x=1762901124;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y0eh7CBr5vjF0aDCL/B1xIR4HCehbRXFV7g7chC2omo=;
 b=N39WGCY+/ALCmfhMSQjXcHwL1TYWsl0kmw888zG5HTAGyJFuOt1VPnpO
 Jt/AYUOWSw5S3YdGIixQJc1rbaoxV4sn6J2c4PqCqHJTuwqix6HpJEWAW
 SnKhqtnyL1PpAagiK7tj5waxGCWIA1DfMEiiBbWBo36KU+AuDDTXXRyVx
 GiHKf4B3Xt4VnbLH8XnUmay95GnC+ilQTP4K28OxOa74+09LoPoYD7T/A
 SGAYcpidf/eGjOyVgufwotgp0R+uMYH4UkYJfLmky9/clRjhDuzhPLyzu
 46hILgB4s5xAYKKfbcbS4jndKnBSrmlRE57tamE3Kvv4a7pbNdJsP1M3M A==;
X-CSE-ConnectionGUID: qCSXaSArQ86py3IhkdS7UA==
X-CSE-MsgGUID: PL9jZir8R+usSxlDjDMAxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31043363"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31043363"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 14:45:23 -0800
X-CSE-ConnectionGUID: PwgIqRx2RV296pGG+5/y1A==
X-CSE-MsgGUID: GwzXLdV8QZWU4xHCIIBMAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; d="scan'208";a="117931470"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2024 14:45:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 14:45:22 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 14:45:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 14:45:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khqSwSUWkf3Mkdz/sfgC6kxgmv7ZFyNwtZkqoz1zoMq0b7Ufl2ZKBValjVMy1r+WgB06r2QA4LymxYxxLG3S1I5z410stBS6t2IYllATT01PanavrVNLLgpigaYeS97TAVVQp2s5+IDeeuHRtFxQ8PjVz34P0tS5MZnGoTCSjPnv32v/2ERC4IvQKNiB+FoSedbvjEToqL7uCdxjTgQfwl3INd7WLoBqdB60MtlIWq0ugfKySCxxCNUsuBQJPrF+SUOd2hFgM9nCiwX5/cu8UFMMmi9en+jQ0ktRFXI0uijn3s8wyRGTs2vIGP8LJzQ33h3VtG+XTufHn6Y6c6w6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wl5WalFgGyRiMdQX1jIFmA+zRyxhftbc573SlNOkDGk=;
 b=mhjQcqQ0Xe7OiNvw2Z/7ukMJ9BH+CCG4NAGHcREYJsX7mocj8J6ISOz7EBceI1tfdtdZXz7YWkmsCMiwJbwXluE4o8DDauFClnBOSkXLOugV4kIvnDlToKUSTd8HhyLtUaAjWOUsSw4CUlEgmbXrYKQ7SkV9gmlU/blONIopjb4IrG3rQ3zQ/PZWDVpVjDn9/NhQsQ2Qe0y8uha7ETfL+T5Gh1Du6re+vC8rssGm2TIjRcQHkRZffk0xPCNj8to2xad/552cNfx1qYlGvLo/dvCDkMAb2MbRp+SmdWgkd8btFZb8p6xdst9/vUNXGIamTXYo+dhnvjz6eQoW9g1XHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4892.namprd11.prod.outlook.com (2603:10b6:806:f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 22:45:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8137.019; Mon, 11 Nov 2024
 22:45:19 +0000
Date: Mon, 11 Nov 2024 14:45:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Huang Rui <ray.huang@amd.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <matthew.auld@intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com>
References: <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
 <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
 <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
 <173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com>
 <8d181425-db3b-46b7-ae73-ae6ef149d185@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d181425-db3b-46b7-ae73-ae6ef149d185@amd.com>
X-ClientProxiedBy: MW4PR04CA0130.namprd04.prod.outlook.com
 (2603:10b6:303:84::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4892:EE_
X-MS-Office365-Filtering-Correlation-Id: 976d2cf9-46d5-41bb-9795-08dd02a284bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmFJbHlJSVd5RndzQ2o2U20yWU03a0ttcjZERFZBNy8xamIyVlA1bmgwK0VV?=
 =?utf-8?B?djg4bDlDQVZlWHIrbUY4SUFlWnhNdUgzOUdUeGJJZ2ZWUi9nT1l6TVRBc0xG?=
 =?utf-8?B?RlY5Ui8yQ1lDVTA2RURzTU5qR3hLdWtMeGhaSzQ3cGIrNTdmV3NZYi83cjFM?=
 =?utf-8?B?YjFicWJTak5RQ1A4TTRhc1hJY1VNZEJwbkRWNGRPTUVMQ0w2NGZZMXNXbDM1?=
 =?utf-8?B?dklpa1pNR3pmdFB6ZGNwYTkrOUYrYUpuZ3liSnFWNitQWUVSdlY0R05oZEJq?=
 =?utf-8?B?YnNpQ1Fqd2EyOWNTS2ttZ2FHQ3FiTzZYUU9sR0JVTHAvK2VEUFNFeXJRN280?=
 =?utf-8?B?YUhTU0RZZTMrdURRaDlqY2lGSm93WTRGZ2h2WGcwVHFrbTNyQkdtWVU2K3Zy?=
 =?utf-8?B?djg0ZE9ONTU1eVVIbitPcjc1VWNZWk9OTXN6UHdsSDM0RzdUTkNsTzV3M3gw?=
 =?utf-8?B?Rk5wQmtNcVJwVnExMnZHOHNxdUVrbjl1b2M4RjB1dE9GeVdrUTlacncxMU16?=
 =?utf-8?B?bElTVkZzemJYc0hRMkNRZHYyZ1NGeVQxRVFaUVdoUDZ0eXYzVWF5RUc3ODYz?=
 =?utf-8?B?V2dUcHBNL1d5NWVXVFFnZGNESkQvNE04enQyWWhCM01GM2k0VHZsZnFMMVhC?=
 =?utf-8?B?NjV3d21oQUxKUkJmbzJZdkNvajRYYkpRQkk5VHgzZ1NkSVJiMzdvMzhBUkYz?=
 =?utf-8?B?S2xVb3NaMVhPQ0w3KzJSVkEyQXlKVzBqYm1rRUdXRktFdnBqZnBsdHJMWjVU?=
 =?utf-8?B?ZkJ4VkNBdWN3WkFDZnNWZHFhLzQxRzlNdFJ4cURiNkRndjF4Qkw0MTljdmtW?=
 =?utf-8?B?NGYxYVlLazlWU0pTMDZsZ05DMWUzck9CSDQyUWdpenlsQVczcTRqQTNxYW16?=
 =?utf-8?B?b1RGZ2ZhcEVSUWhMMmFlWFFoSkdrMkp1NnZBNjhWeHlWRlFyVE5Kb09xNjJG?=
 =?utf-8?B?anUwOThEUDA4NnNhMFhqcTFidWxWRGtIVTlOOEtKVkx2cDRyL05ndnRkb3Rz?=
 =?utf-8?B?Vk1Haytvck10a1FycWlwZnRoa2V0cXZtcmZrQ1hJQkc4MGtQa2VsdTJEU1Bo?=
 =?utf-8?B?bk9wcjBKWllFMG9tS0JuR3JLMnpVYnkzOEFKb2V0cURTdTBtS0hvYjd1WlhF?=
 =?utf-8?B?VDFkMUdwTmpYSTNTbkV4Y2tIdU1wVWpiK3BFUCtpUXZjLzg1Rk9mdjdoYWdu?=
 =?utf-8?B?ZWtrTlRqd3hOdjZzWTVRV0M0c3lNM0g0OGNSaG5GMTNGMEdMVTRkOVVUSUgz?=
 =?utf-8?B?QTFGL1c1ZEpQM2NISXRlVXdFdmV2Nys2ZHZJdHlaL01qNDA2M1VzOTMrYUFv?=
 =?utf-8?B?aDVJRGlqZE9sSEIrbUVSeVhBSThobzdQQks0SzBueEwvb21mOFlkWUc0eHJ2?=
 =?utf-8?B?RTBCYit0aGdNQVZCQnJKL3NjazQzTXRGWEtFMnBjSjhnR1hubDF3MnRrUjd6?=
 =?utf-8?B?OHBZbTZYckd3VDRaRnl0clY2ejlkcGpoNkNrUkFML2hCYnVBUUxhWUFmaWd0?=
 =?utf-8?B?NElPa0RQeFRmYUhvVGU0d1hVZytkR3hXSGZoeFFyOGVab3Z4WWxPT3h3cktz?=
 =?utf-8?B?ekNQbG5rQnFTVU5MdmxsNmdmRmw4aGJjMyt5Kzcyb29qbTYzdFpTOXYwRm9p?=
 =?utf-8?B?R1UxN1pDSGdEckxDT2NqVlIyZmtiYmRuVlpkcFB0bDBKcnhKb2NyNXNnYUJU?=
 =?utf-8?B?MGZhT29WZ0QzT1B3d1IrVHVLNmxHRFVFVUp0YUlNRm80SEswTHBVWHh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUdWcXRVWnRFSEJEVVliU0lkK0FXdlpJdWl1OGN1RmV3cUZ6aDBKR3gvYXdj?=
 =?utf-8?B?eGtjVUlhdi9ZelBmM3Z1MTU1aE5tYlRQNHpndmFlMWxkcitNOGlpdXRNUlpU?=
 =?utf-8?B?MHkrYlVGU2pxZzZQdmo3Tnd2bVdCdGRuSWkycjkyT1ZJeVJLbzZ1Yjc0MHA3?=
 =?utf-8?B?L2Q1Vm1MYnY2aXF1eVF3Uld1a0FXa012U0ZwYS9wTjRYbWh4aGdCbThkNjVn?=
 =?utf-8?B?MjNoYW84ajk5WU56QzNIYXZBWjc3Z3p6Zk4wejZ1a3dFRlpITmUzaUJxaFpk?=
 =?utf-8?B?TDMxYTNnNndHTDNaekwzODRGaWUzMUJ5TG5DaWRzS0VjSjlGQ3JxY1BLeWxM?=
 =?utf-8?B?NEtVWE1VZDQvT3hxODBXdFZrYjlTRG9JWFlYWU9CYWxYckZLdjBDSlhITnpL?=
 =?utf-8?B?TU5XNEpadlo4TUtRQ29sMDhBOVlISGtraXRZQndsbHhnU21ueG16ZG9USmZF?=
 =?utf-8?B?Zkg1d0N2SHhkOGkvZEIrMVFYSktMWGlXOWcycTFwZ1E0YU1YSkMwWGUvT295?=
 =?utf-8?B?RTVEZ2J0Y0hrZnhqOStYQmdwbFQyVC90ZmZQdGZSaUpZSUNQUjBtUjl5dEla?=
 =?utf-8?B?YzRwNFBZTi8vbmgraHJqa2VSc1lNTTJvRXo4dWRIcHo4c25DZGh6S2VMalgz?=
 =?utf-8?B?K0JYQVpPL3dLUTA2eTltZ3FPL3cya0k0Z3ZVbHVWdFZLSkd6cEtoVlFSbWky?=
 =?utf-8?B?T09ETlphOERNbjZiZVNLMm9lSUVuRVZmZHZRdi9TQWNsbEJIZUNmeUtaS0Vy?=
 =?utf-8?B?R2NCN2J2bkRMQ0RwN3E0bGc1QUNYMVYwVStNNjc3YWVwNkZPdG90MDhZcXRp?=
 =?utf-8?B?UjVVUUdnZHFtT05lMjZMWjBDUjA0RUo2ejZiM0x1V0FZMUdJY0ZzdVN4MjFT?=
 =?utf-8?B?NkJkRnlWdWR5clhmTFRIMWx2L0dsQmVDTkkxT1daZmtvWHlBL3ZMMExzTVZC?=
 =?utf-8?B?TTV1OHJrd2JZVXdDY3RpbVkwajVKejhJT1hjV2pvY0pSOVNCdmdFWW1mSEkw?=
 =?utf-8?B?aWN6WWZLWUxUTVk3UmVvS2c4eFN3aE9Uc1Qzd3lONC9keTJ4dGNNeEFaRjJD?=
 =?utf-8?B?Q0FDalpKVm1ObnJmY29PT2JvbmY3Q3NWNjFnWW5ObU1uWnFOSG5DZ3M4ZDBO?=
 =?utf-8?B?ZkFKdFhSQTJwcTBtVzBmTUdyQU9Na08xWjcrZE16VEJwekZobjJJVXVVaCta?=
 =?utf-8?B?Q0tiUFYrblhDZGhvRFpRRzFzMUVNaXMrTXV2V21DZDJpNWVxdS9Id2RQTzI0?=
 =?utf-8?B?SVFUVk0reHpHYUprUkpIeEdDK0Raa2FaMUJqUDU3OGd5RkhHK1h5cGJ0OUp4?=
 =?utf-8?B?RXYySEFpa1VJSlpZWnlRaThrMExrVVdJVFdqOCtvOUxraG90OWRncjJwWWZ1?=
 =?utf-8?B?cEptM285QWpTaDkxbFhPeDV3cUNQbFcxT3FJS1hLekxtaUhHNWpXUEJob3NF?=
 =?utf-8?B?d292dXBmTURJQ2pXSjVWdFhMRC9YZDR2SkRHTVRJeU1VTFZvc2JHRXlPcUFw?=
 =?utf-8?B?ZFFyK0VnYlVha2pFdXhSTGxyUXFIUnZWUXhZOHo0M0ZpT25ZUS8rWUVhd25V?=
 =?utf-8?B?UmxvM1ovRzM5YjdaU3d2bVFla1NYQ1I5VjJDOXF4VnFLYVV5eFVSSzlnUzZv?=
 =?utf-8?B?a3FhNmxiVlRRVlZ4cUY0YWRaNnhvbWlTRnF1QndOVGJnL0lUMlk5SlE5NjNp?=
 =?utf-8?B?RmhmMUhnZGQ2ZDMxeVBUeUJ1blRkakt5aFlCTGV2NGdiZzAzdE5mWHNOT0I2?=
 =?utf-8?B?TE1WK3NJMGVyOWNYRXl2aFRPNHVEVEhqSDhWUUhqVU1jK0x2VlBwTUIzbGlv?=
 =?utf-8?B?bE1wMFY0L3JON1cwRFRaZHZtdW9oYUVlN0tCZHhQclFCdElLaVpJelhqYVpp?=
 =?utf-8?B?SUU3N1VkSnpEUHNJMkZORE56WjhVRGdnenQ1U1FpUmhuQXZseUNyVjFGOUtC?=
 =?utf-8?B?NnhERDJLd3BQbm1HejYrN3pJSDhRRVExVHVDVnJIWjh1TDM0R0VYWmlnMnd1?=
 =?utf-8?B?TGdHVzhrMHpBSiszTjFmL3V4VzBJcUdTUHhJWWNCMC9VOFpTSDl3ZWdxbXBQ?=
 =?utf-8?B?dlhLL1grdXEvd3laZEQrckhWNDZMdHVOcDRoTVkzbTEwdEtSeTYvcXQ0cGt0?=
 =?utf-8?B?MkNQWThlS2RjWXRDUXMrMFlib1VJTjN2RDZjN3U4UTh3NXhqcWpaNVd3L3Ez?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 976d2cf9-46d5-41bb-9795-08dd02a284bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 22:45:19.3646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zb5agTF7UGVXu/tVj/YrZeUjN4KDroVgfELwV8SztRcOwud0lJF6QYxjjhvKPASouP/X9Uf5HlMnsPbadakFng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4892
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

On Mon, Nov 11, 2024 at 04:54:57PM +0100, Christian König wrote:
> Am 11.11.24 um 15:00 schrieb Joonas Lahtinen:
> > Quoting Christian König (2024-11-11 13:34:12)
> > > Am 11.11.24 um 11:10 schrieb Simona Vetter:
> > > > On Mon, Nov 11, 2024 at 10:00:17AM +0200, Joonas Lahtinen wrote:
> > > > > Back from some time off and will try to answer below.
> > > > > 
> > > > > Adding Dave and Sima as this topic has been previously discussed to some
> > > > > extent and will be good to reach common understanding about what the
> > > > > series is trying to do and what is the difference to the AMD debugging
> > > > > model.
> > > > I chatted about this thread a bit on irc with folks, and I think an
> > > > orthogonal issue is the question, what should be in ttm-utils? I've asked
> > > > Matt to type up a DOC patch once we have some consensus, since imo the
> > > > somewhat lackluster documentation situation for ttm is also somewhat a
> > > > cause for these big threads on various different topics. Aside from the
> > > > fact that gpu memory management is just hard.
> > > > 
> > > > On the uapi/design aspect, I think this would serve well with a patch to
> > > > drm-uapi.rst that adds a debugging section? At least once we have some
> > > > rough consensus across drivers, and more importantly userspace in the form
> > > > of gdb upstream (at least I'm not aware of any other upstream debugger
> > > > patches, I think amd's rocm stuff is also gdb-only).
> > > Yeah that seems to be a really good idea. Similar design ideas came up
> > > AMD internally as well but where dropped after pointing people to
> > > pidfd_getfd().
> > > 
> > > But the bigger problem seems to be that the design doesn't seems to take
> > > the dma_fence requirements into account.
> > Where would you deduce that?
> 
> XE is based on a preemption fence based memory management.
> 
> > We specifically limit the debugging to Long Running contexts which don't
> > depend on dma_fences.
> 
> That doesn't matter.
> 
> As long as you don't have a page fault (HMM) based memory management you
> still have that inter dependency and at least the public available XE code
> doesn't seem to have that.
> 
> > > In other words attaching gdb to a pid seems to stop the GPU thread of
> > > this pid without waiting for the XE preemption nor end of operation fence.
> > > 
> > > I mean if the GPU threads are preempted that could work, but yeah not
> > > like this :)
> > For us, hitting a breakpoint inside the workload would always violate
> > any dma_fence timeout for the submitted workload, as the HW context can't
> > be switched out while in the breakpoint.
> 
> That is clearly *not* something you can do without changing your memory
> management.
> 
> > For any dma_fence workload the guarantee is that that it completes
> > within reasonable time after submission (guaranteed by the submitter). I
> > don't see how you could really allow interactive debugging of a
> > breakpoint under those restrictions anyway even if pre-emption was
> > supported as the workload would not finish in <10 seconds?
> 
> Yeah that is the whole point, this is impossible as far as we know.
> 
> > For i915 we did have the "pre-emptable but indefinitely long dma_fence workloads"
> > concept at one point and that was rejected after the lengthy discussion.
> 
> I mean I tried that more than once myself and we have multiple requests for
> this on the AMD side from customers. So far nobody came up with a solution
> which actually works correctly.
> 
> > So I think only way to allow interactive debugging is to avoid the
> > dma_fences. Curious to hear if there are ideas for otherwise.
> 
> You need to guarantee somehow that the process is taken from the hardware so
> that the preemption fence can signal.
> 

Our preemption fences have this functionality.

A preemption fence issues a suspend execution command to the firmware. The
firmware, in turn, attempts to preempt the workload. If it doesn't respond
within a specified period, it resets the hardware queue, sends a message to KMD,
bans the software queue, and signals the preemption fence.

We provide even more protection than that. If, for some reason, the firmware
doesn't respond within a longer timeout period, the KMD performs a device reset,
ban the offending software queue(s), and will signal the preemption fences.

This flow remains the same whether a debugger is attached or, for example, a
user submits a 10-minute non-preemptable workload. In either case, other
processes are guaranteed to make forward progress.

The example above illustrates the memory oversubscription case, where two
processes are using 51% of the memory.

Another preemption scenario involves two processes sharing hardware resources.
Our firmware follows the same flow here. If an LR workload is using a hardware
resource and a DMA-fence workload is waiting, and if the LR workload doesn't
preempt the in a timely manner, the firmware issues a hardware reset, notifies
KMD, and bans the LR software queue. The DMA-fence workload then can make
forward progress

With the above in mind, this is why I say that if a user tries to run a game and
a non-preemptable LR workload, either oversubscribing memory or sharing hardware
resources, it is unlikely to work well. However, I don't think this is a common
use case. I would expect that when a debugger is open, it is typically by a
power user who knows how to disable other GPU tasks (e.g., by enabling software
rendering or using a machine without any display).

Given this, please to reconsider your position.

> This means that a breakpoint or core dump doesn't halt GPU threads, but
> rather suspends them. E.g. all running wave data is collected into a state
> bag which can be restored later on.
> 
> I was under the impression that those long running compute threads do
> exactly that, but when the hardware can't switch out the GPU thread/process
> while in a break then that isn't the case.
> 
> As long as you don't find a way to avoid that this patch set is a pretty
> clear NAK from my side as DMA-buf and TTM maintainer.
> 

I believe this is addressed above.

Matt

> What might work is to keep the submission on the hardware in the break state
> but forbid any memory access. This way you can signal your preemption fence
> even when the hardware isn't made available.
> 
> Before you continue XE setups a new pre-emption fence and makes sure that
> all page tables etc... are up to date.
> 
> Could be tricky to get this right if completion fence based submissions are
> mixed in as well, but that gives you at least a direction you could
> potentially go.
> 
> Regards,
> Christian.
> 
> > 
> > Regards, Joonas
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Some wash-up thoughts from me below, but consider them fairly irrelevant
> > > > since I think the main driver for these big questions here should be
> > > > gdb/userspace.
> > > > 
> > > > > Quoting Christian König (2024-11-07 11:44:33)
> > > > > > Am 06.11.24 um 18:00 schrieb Matthew Brost:
> > > > > > 
> > > > > >       [SNIP]
> > > > > > 
> > > > > >       This is not a generic interface that anyone can freely access. The same
> > > > > >       permissions used by ptrace are checked when opening such an interface.
> > > > > >       See [1] [2].
> > > > > > 
> > > > > >       [1]https://patchwork.freedesktop.org/patch/617470/?series=136572&rev=2
> > > > > >       [2]https://patchwork.freedesktop.org/patch/617471/?series=136572&rev=2
> > > > > > 
> > > > > > 
> > > > > > Thanks a lot for those pointers, that is exactly what I was looking for.
> > > > > > 
> > > > > > And yeah, it is what I feared. You are re-implementing existing functionality,
> > > > > > but see below.
> > > > > Could you elaborate on what this "existing functionality" exactly is?
> > > > > I do not think this functionality exists at this time.
> > > > > 
> > > > > The EU debugging architecture for Xe specifically avoids the need for GDB
> > > > > to attach with ptrace to the CPU process or interfere with the CPU process for
> > > > > the debugging via parasitic threads or so.
> > > > > 
> > > > > Debugger connection is opened to the DRM driver for given PID (which uses the
> > > > > ptrace may access check for now) after which the all DRM client of that
> > > > > PID are exposed to the debugger process.
> > > > > 
> > > > > What we want to expose via that debugger connection is the ability for GDB to
> > > > > read/write the different GPU VM address spaces (ppGTT for Intel GPUs) just like
> > > > > the EU threads would see them. Note that the layout of the ppGTT is
> > > > > completely up to the userspace driver to setup and is mostly only partially
> > > > > equal to the CPU address space.
> > > > > 
> > > > > Specifically as part of reading/writing the ppGTT for debugging purposes,
> > > > > there are deep flushes needed: for example flushing instruction cache
> > > > > when adding/removing breakpoints.
> > > > > 
> > > > > Maybe that will explain the background. I elaborate on this at the end some more.
> > > > > 
> > > > > >               kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
> > > > > >               failing to see the problem with adding a simple helper based on existing
> > > > > >               code.
> > > > > > 
> > > > > >           What#s possible and often done is to do kmap/vmap if you need to implement a
> > > > > >           CPU copy for scanout for example or for copying/validating command buffers.
> > > > > >           But that usually requires accessing the whole BO and has separate security
> > > > > >           checks.
> > > > > > 
> > > > > >           When you want to access only a few bytes of a BO that sounds massively like
> > > > > >           a peek/poke like interface and we have already rejected that more than once.
> > > > > >           There even used to be standardized GEM IOCTLs for that which have been
> > > > > >           removed by now.
> > > > > Referring to the explanation at top: These IOCTL are not for the debugging target
> > > > > process to issue. The peek/poke interface is specifically for GDB only
> > > > > to facilitate the emulation of memory reads/writes on the GPU address
> > > > > space as they were done by EUs themselves. And to recap: for modifying
> > > > > instructions for example (add/remove breakpoint), extra level of cache flushing is
> > > > > needed which is not available to regular userspace.
> > > > > 
> > > > > I specifically discussed with Sima on the difference before moving forward with this
> > > > > design originally. If something has changed since then, I'm of course happy to rediscuss.
> > > > > 
> > > > > However, if this code can't be added, not sure how we would ever be able
> > > > > to implement core dumps for GPU threads/memory?
> > > > > 
> > > > > >           If you need to access BOs which are placed in not CPU accessible memory then
> > > > > >           implement the access callback for ptrace, see amdgpu_ttm_access_memory for
> > > > > >           an example how to do this.
> > > > > As also mentioned above, we don't work via ptrace at all when it comes
> > > > > to debugging the EUs. The only thing used for now is the ptrace_may_access to
> > > > > implement similar access restrictions as ptrace has. This can be changed
> > > > > to something else if needed.
> > > > > 
> > > > > >       Ptrace access via vm_operations_struct.access → ttm_bo_vm_access.
> > > > > > 
> > > > > >       This series renames ttm_bo_vm_access to ttm_bo_access, with no code changes.
> > > > > > 
> > > > > >       The above function accesses a BO via kmap if it is in SYSTEM / TT,
> > > > > >       which is existing code.
> > > > > > 
> > > > > >       This function is only exposed to user space via ptrace permissions.
> > > > > Maybe this sentence is what caused the confusion.
> > > > > 
> > > > > Userspace is never exposed with peek/poke interface, only the debugger
> > > > > connection which is its own FD.
> > > > > 
> > > > > >       In this series, we implement a function [3] similar to
> > > > > >       amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
> > > > > >       missing is non-visible CPU memory access, similar to
> > > > > >       amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up and
> > > > > >       was omitted in this series given its complexity.
> > > > > > 
> > > > > >       So, this looks more or less identical to AMD's ptrace implementation,
> > > > > >       but in GPU address space. Again, I fail to see what the problem is here.
> > > > > >       What am I missing?
> > > > > > 
> > > > > > 
> > > > > > The main question is why can't you use the existing interfaces directly?
> > > > > We're not working on the CPU address space or BOs. We're working
> > > > > strictly on the GPU address space as would be seen by an EU thread if it
> > > > > accessed address X.
> > > > > 
> > > > > > Additional to the peek/poke interface of ptrace Linux has the pidfd_getfd
> > > > > > system call, see herehttps://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.
> > > > > > 
> > > > > > The pidfd_getfd() allows to dup() the render node file descriptor into your gdb
> > > > > > process. That in turn gives you all the access you need from gdb, including
> > > > > > mapping BOs and command submission on behalf of the application.
> > > > > We're not operating on the CPU address space nor are we operating on BOs
> > > > > (there is no concept of BO in the EU debug interface). Each VMA in the VM
> > > > > could come from anywhere, only the start address and size matter. And
> > > > > neither do we need to interfere with the command submission of the
> > > > > process under debug.
> > > > > 
> > > > > > As far as I can see that allows for the same functionality as the eudebug
> > > > > > interface, just without any driver specific code messing with ptrace
> > > > > > permissions and peek/poke interfaces.
> > > > > > 
> > > > > > So the question is still why do you need the whole eudebug interface in the
> > > > > > first place? I might be missing something, but that seems to be superfluous
> > > > > > from a high level view.
> > > > > Recapping from above. It is to allow the debugging of EU threads per DRM
> > > > > client, completely independent of the CPU process. If ptrace_may_acces
> > > > > is the sore point, we could consider other permission checks, too. There
> > > > > is no other connection to ptrace in this architecture as single
> > > > > permission check to know if PID is fair game to access by debugger
> > > > > process.
> > > > > 
> > > > > Why no parasitic thread or ptrace: Going forward, binding the EU debugging to
> > > > > the DRM client would also pave way for being able to extend core kernel generated
> > > > > core dump with each DRM client's EU thread/memory dump. We have similar
> > > > > feature called "Offline core dump" enabled in the downstream public
> > > > > trees for i915, where we currently attach the EU thread dump to i915 error state
> > > > > and then later combine i915 error state with CPU core dump file with a
> > > > > tool.
> > > > > 
> > > > > This is relatively little amount of extra code, as this baseline series
> > > > > already introduces GDB the ability to perform the necessary actions.
> > > > > It's just the matter of kernel driver calling: "stop all threads", then
> > > > > copying the memory map and memory contents for GPU threads, just like is
> > > > > done for CPU threads.
> > > > > 
> > > > > With parasitic thread injection, not sure if there is such way forward,
> > > > > as it would seem to require to inject quite abit more logic to core kernel?
> > > > > 
> > > > > > It's true that the AMD KFD part has still similar functionality, but that is
> > > > > > because of the broken KFD design of tying driver state to the CPU process
> > > > > > (which makes it inaccessible for gdb even with imported render node fd).
> > > > > > 
> > > > > > Both Sima and I (and partially Dave as well) have pushed back on the KFD
> > > > > > approach. And the long term plan is to get rid of such device driver specific
> > > > > > interface which re-implement existing functionality just differently.
> > > > > Recapping, this series is not adding it back. The debugger connection
> > > > > is a separate FD from the DRM one, with separate IOCTL set. We don't allow
> > > > > the DRM FD any new operations based on ptrace is attached or not. We
> > > > > don't ever do that check even.
> > > > > 
> > > > > We only restrict the opening of the debugger connection to given PID with
> > > > > ptrace_may_access check for now. That can be changed to something else,
> > > > > if necessary.
> > > > Yeah I think unnecessarily tying gpu processes to cpu processes is a bad
> > > > thing, least because even today all the svm discussions we have still hit
> > > > clear use-cases, where a 1:1 match is not wanted (like multiple gpu svm
> > > > sections with offsets). Not even speaking of all the gpu usecases where
> > > > the gpu vm space is still entirely independent of the cpu side.
> > > > 
> > > > So that's why I think this entirely separate approach looks like the right
> > > > one, with ptrace_may_access as the access control check to make sure we
> > > > match ptrace on the cpu side.
> > > > 
> > > > But there's very obviously a bikeshed to be had on what the actual uapi
> > > > should look like, especially how gdb opens up a gpu debug access fd. But I
> > > > also think that's not much on drm to decide, but whatever gdb wants. And
> > > > then we aim for some consistency on that lookup/access control part
> > > > (ideally, I might be missing some reasons why this is a bad idea) across
> > > > drm drivers.
> > > > 
> > > > > > So you need to have a really really good explanation why the eudebug interface
> > > > > > is actually necessary.
> > > > > TL;DR The main point is to decouple the debugging of the EU workloads from the
> > > > > debugging of the CPU process. This avoids the interference with the CPU process with
> > > > > parasitic thread injection. Further this also allows generating a core dump
> > > > > without any GDB connected. There are also many other smaller pros/cons
> > > > > which can be discussed but for the context of this patch, this is the
> > > > > main one.
> > > > > 
> > > > > So unlike parasitic thread injection, we don't unlock any special IOCTL for
> > > > > the process under debug to be performed by the parasitic thread, but we
> > > > > allow the minimal set of operations to be performed by GDB as if those were
> > > > > done on the EUs themselves.
> > > > > 
> > > > > One can think of it like the minimal subset of ptrace but for EU threads,
> > > > > not the CPU threads. And thus, building on this it's possible to extend
> > > > > the core kernel generated core dumps with DRM specific extension which
> > > > > would contain the EU thread/memory dump.
> > > > It might be good to document (in that debugging doc patch probably) why
> > > > thread injection is not a great option, and why the tradeoffs for
> > > > debugging are different than for for checkpoint/restore, where with CRIU
> > > > we landed on doing most of this in userspace, and often requiring
> > > > injection threads to make it all work.
> > > > 
> > > > Cheers, Sima
> > > > 
> > > > > Regards, Joonas
> > > > > 
> > > > > > Regards,
> > > > > > Christian.
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > >       Matt
> > > > > > 
> > > > > >       [3]https://patchwork.freedesktop.org/patch/622520/?series=140200&rev=6
> > > > > > 
> > > > > > 
> > > > > >           Regards,
> > > > > >           Christian.
> > > > > > 
> > > > > > 
> > > > > >               Matt
> > > > > > 
> > > > > > 
> > > > > >                   Regards,
> > > > > >                   Christian.
> > > > > > 
