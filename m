Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA89ACC215
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 10:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBE210E6F1;
	Tue,  3 Jun 2025 08:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlLrvUxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1038A10E6C5;
 Tue,  3 Jun 2025 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748938857; x=1780474857;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FfVw7xP2Pxwbc74tvfDRLD62XzQiA184CbKuk7SrdS0=;
 b=dlLrvUxt46xx722Ly9Y17SExQqF6xS2E+3PgzGsITtMDoirr6Jzpds33
 V5I3l1IAbl/+GK8bHjffGYsfVW1piKREo76H8z1biDKHL7szh2iwLfZ3D
 fW1ML7PNc1Hw7APNDjXlHzYHlEMpO6+sIT+7iUtTJyx8BnoayAVxjy71v
 3XhisxYr4z0Zlx8UwgVGKUxcVw8UguA1Hqs9JVnFnUBkExj7/v8mEnX3O
 SpRGbSTXMbc5+OdmNOaMDBCf6KkC1fnxzUITuZezodEs0QOmPSTHo+WL+
 gdUTm91+B82SVA1af4Mc7udtG9XXtd08WQPtnifhjCoUesnse2Z8H4V26 w==;
X-CSE-ConnectionGUID: Qz7sFOLdQaqMWMV7+cgcZQ==
X-CSE-MsgGUID: zJrEcI0TT5KAyZKlDNkfYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62023247"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="62023247"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 01:20:56 -0700
X-CSE-ConnectionGUID: PIXyRXOiToiIXe12F8Jx5w==
X-CSE-MsgGUID: lKAL915OQSKx6yhm+h+toA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="145417687"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 01:20:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 01:20:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 01:20:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.81)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 01:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qquS8YE36apBeaz5X1/Socq4uv+8UYUAwLUkonJfVCoD6XgqAHjTju2HyNUsEXWrdN+50rMOaqwwFUpBf2DQCH0YBL3uTRae1GofaLQSS5sNY7V8A8r/hlv78TE5KufZiDFetVxHJW2kMkbnmIfZWf+NrTdu1qBKBJF3F4siz3S16BUj2REHTLHjTi5omJP6qiBh4v8DMphrD/VriwbXYgOrq3yN2Vmu42OtPcRGjYF+oE1Bv505f7kXYg/HwxOhclrs876EUf+toVPlKn/NPdAjEr349D1TnoB8u/Acpyv7fACR9aKfI5So7xHRT9pUpJEMK1FCxQ3r3brOk2yofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfVw7xP2Pxwbc74tvfDRLD62XzQiA184CbKuk7SrdS0=;
 b=bxwkGngPp0+CPK37aZZ6lhHN3LwZ1PMkDf8/YX/A+J14ZpFfANmwn9+SPHbZRe8H28osNJ3B+iEkiyd6WWw4XJ8q/WnSkBooreOOrO/+h687LBMIHxUYqqdx7VrfV52z+9GKFFDFF4Fu1v99xv9fnVa/56E573A6oHiPAecVNjSSDH5QEE/xsksfHdpogLR+fkZejSWGiahuZ4wimN7m6Ouuci8/HUrzxk+EiC6vJe0AghZmcDOCXElJFsQ4nm+/XbDazzSs3NLa4Em6V08varq9cllTdMExZAapIM67mKu+3E1hC10KxNKgCmERyFrQoT+GnCj23wxNM8oU0LNAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 08:20:24 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8769.031; Tue, 3 Jun 2025
 08:20:24 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v11 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Thread-Topic: [PATCH v11 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Thread-Index: AQHbz9mkygYLLZi1TUaCjRbwRsx96rPrLNGAgAXk/3A=
Date: Tue, 3 Jun 2025 08:20:24 +0000
Message-ID: <CY5PR11MB6366659755FEBF265C892CF0ED6DA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
 <20250528135115.2512429-9-alexander.usyskin@intel.com>
 <1d7eb70c-7752-411f-8e20-f41f85438d31@linux.intel.com>
In-Reply-To: <1d7eb70c-7752-411f-8e20-f41f85438d31@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|MN2PR11MB4645:EE_
x-ms-office365-filtering-correlation-id: 7a7ba6b1-bb76-4a8e-a4e7-08dda2777d5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cHR2MUQrU2Z5NkpCVjlhYXkzSUlOSkZYV0ZiU0RXRzdMeHZrQ3FFT0FXNjRs?=
 =?utf-8?B?T1lBN1k5T2tET0M1WXN0MGd0NjhvZWZNN2ZpellyRytsaElkYkxwc1VQNGlo?=
 =?utf-8?B?SnZscTFmOTlmVC9KK2tmdTBaRDZUc1VYek5FckdmMXUzU0grOXFwUlRnM1U3?=
 =?utf-8?B?RG1POUtUYk1BVEtSWUs5SmVqMUtVSFVFTUhwdlRiT3ZLaGNNZ2taZkVqQWtk?=
 =?utf-8?B?RUdidmM1c2hoQ0VYU2I3S3FxeUw5K3E0QXhFajRQQ0NPY1QxbnV5cmxWSnhT?=
 =?utf-8?B?T1gyZUZzaDhLam9zODVacHpoeVhiMkJPQjJzV3NmckViMXJuQ0cvMnlyWHZt?=
 =?utf-8?B?ZGtEaFpWRVV2M3VsOS9wKzhVSjBYMG9oUEUvdkhnWWZnbTZydlRFeXJwU3hj?=
 =?utf-8?B?TkhBMklVK1p4cm9saFF5OFpXMnZLeHJXRi82K01PVzlYaUJMOCs5N3ZkT1hh?=
 =?utf-8?B?TkJrTTU3S2FpdWkvTUdEdFlXVTVBYllkY1hYS2tHZkwvcW9pRjhuNWw5eXFG?=
 =?utf-8?B?ZDJUTjhVTEZFTytnWFQ2OE42NW9vY01zWndzejF1TFdscy83SnZJZS8wOUlv?=
 =?utf-8?B?UTFtNjhZdmwvR2RtTFRTNzF2Mkg4cmIwSEZ3ZUFjL3pDRXg4d2FYU0Rka0di?=
 =?utf-8?B?ZlBRSUFlNlNOMHVDOEdHbHZvZERmcVI1S2F1TmtnTjU0bGQ3dWt0WHZYU1VI?=
 =?utf-8?B?aVg1czFJOU1xMitVMk0vNzQ3aDk5RThRenFubjhSaWswZFlLKzJiaW1PT0k1?=
 =?utf-8?B?L2h6SUppeUdYS2ZYWm1hb3hjaUJia3dseWhHcHgyVWRDUzF1bHlPVXQ2ZitF?=
 =?utf-8?B?dXhvVE1IaFVtSFp6WXFjcWNnVnR6aUhLT1k4ZFF1dFFScFZ2ZFkrWUw4bUxB?=
 =?utf-8?B?L0RjRkszeWtldzg5SnhjOHFwb3NmaVJSQjU5czlLTldDQWhsb2N2aWl0bDJh?=
 =?utf-8?B?cnZwOWNXbVlGa0lOU3FHa1hLd2FVSXl2aGl0ZWFKMlZGb1piNmdTOHMzOC93?=
 =?utf-8?B?VnBRMFVtN3hkSm5JZG5SK0lIejFDQ0ZwY1U5Y3hlejhUTFdPekRMMUp5Z2Vy?=
 =?utf-8?B?cVVEdWs2UlVtelhpM1BUSFpHRUQ4dUxhdDFGRDYrQXJhcEFPOCtWRnZ4VU15?=
 =?utf-8?B?L1ZkK0pLN1FNWnowaFhZQ1dETVNYQUMwRzE2ZE5BaXlLd1cyUUZ6VDkyZHQv?=
 =?utf-8?B?RDRGR2tlOXp0YjIwVnN0dWZ5Ull1MWtXVElOd01wOThkNnV1VmFDSnFiTzFM?=
 =?utf-8?B?VExua0xIVWJ5TStBNzV0dG9acHRWNWlxSE40cDd6a1U1bnRzZllodWJiS3FL?=
 =?utf-8?B?ZDVzamJ2YUJPNlJMU1IvSWRaWWtVSGZPNERNL3F2aWJIRmVZSmFrK3R3bTIv?=
 =?utf-8?B?bGhCb1E2UHFBTG41a0s4WEdBZmpWQzVXaGVnMUdjeitFdUJqWStqUCs1NmRJ?=
 =?utf-8?B?b0tOODV6L1pFUmo0VWJ5dnl2WnMzL3ZudXRXUjg5SVlJV2hScXVaZ215R2I5?=
 =?utf-8?B?cDFjTnphSDFxNXFCS2dQbzRqM3lVdE8wbENydm03WlJoRWNHd3R5NWQ5NW9C?=
 =?utf-8?B?S3RWRkFidncrRVVxa0ZrMDlaMWNRUEw3dHJMa1lHQVpZVEVsTWhYSExRdjBw?=
 =?utf-8?B?NHdUdGJJRDgzWDVCS253eEZqb0U1cTh4VjgxKysyblFXZVpVL093SGpYSzNT?=
 =?utf-8?B?dFpVMTNSZUJOV09lZm1raEtLRkpmcU8yQ243aTkrOVk1UlVQUjZkUlVlQWVh?=
 =?utf-8?B?VWZhZVhkeVJYanNHZythUldNUk1rSVdkNi9HTFIyR2JtbXUya1l4N3NsNGFv?=
 =?utf-8?B?NDM0OENWdGU4Um15TkpIdjhxRzk4aFZzc3hydjN5MlF4SnRWVklOK2paYUdR?=
 =?utf-8?B?MnZIUitIMHVBQ21HTVdMZmNKZ1k2R2N3TWpGQmpndktIWFdBaTJRdSs4cjhQ?=
 =?utf-8?B?MWgzcUluUVRDcFAwc1BYNlpWZ0R3UElNdEs0YU9teUJJWnVyU0VSRWY0eXAz?=
 =?utf-8?Q?fn4aVwf6OIS4/mbjr41wL3tp4P4nak=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzJlM0sxQ2lwdXpIVWhSZElFREd2MWx2WmlNYzZIeWs3Y1VsNWUxdkZuYzQ5?=
 =?utf-8?B?L1Ryb0VVZU9LVG5RWVl2VUVLazZXTisxRTFQMWRkY0pMNnBmU2l5akdvbkNq?=
 =?utf-8?B?cFZTSlR3SEpEMTN3bk9zTjNxb05LVFFpSkVCalh2V2dkYURmSHVmblNYR3VP?=
 =?utf-8?B?am1YTUs2WEx0ZXhZbzdidnZqczdTWndEVWMrdldOMUtROUtGYmh2K1FHMnVE?=
 =?utf-8?B?VEZsUlZ5SmVrMWtoMGJVazRMRG5MTXJEbTBuT2wyeDVhRzRBZlZJaHo5aVZP?=
 =?utf-8?B?azRxNkVpM0ZwenNKZGZVVm8wU3BXVW5oaHRGcmpCNWF5ZkRVYkhYQTg4ZjlU?=
 =?utf-8?B?ZThzNFlaZCtEUGtaL0RmbkR0ajJ4cWljZ3hXaml0OE5iamR5Y0tNKzRkVk5l?=
 =?utf-8?B?Yi9JQXFSZFRwdGhxcGo1VXZuOXg3ckxDZTlhUWcwVGZuQkZhWDV4amN6V0xw?=
 =?utf-8?B?anNLNjNpUzRqYTBvN2ovYjhVWTMxK0szUnVqK1grcmpYY2Q0ZkVweUd0NWpm?=
 =?utf-8?B?d09HVjl6OEYxWjdKc2JaMzdqcnQ1SkNBZ3N2ekZNZkpBWDRXNXRpRDNGYVZi?=
 =?utf-8?B?bENCdmtrOVVGd2lob2dzNytlZUdyZnNucm1ha0lwWXdlbXYzYXdCZEludEh1?=
 =?utf-8?B?ME56ODRYdmJJc1FuWDlMTXdqZmh3bitsYW9ZTnc2TVloQzlUWlV3N010b2xN?=
 =?utf-8?B?Q1JWUExabFdsZk5EanhGWFlNTlV4ZzNhL2VuZzFLMk4vM2dZZVpTVnlYVE1p?=
 =?utf-8?B?QjNDSlRxaExqVzNldHVEN1l5VzVCMlM2NVBWRm1rMlRXbnhZUUZPYWpyK3NF?=
 =?utf-8?B?cklYckJtSXdWQ0ozcy8wOWJwYnh3QWdyMlFwYTA4MG9VYktxZ0hmcFdDd2Ra?=
 =?utf-8?B?c2RBV2NLcWNBczhXOHBYR0ROcVRxWDY1VlNhNmFNYTIwVENKYVhKTW9OdStN?=
 =?utf-8?B?SUpWUFR2SCtVaWFSSTlXSmtjSWo0c2dmZWVDcWsvTHU1a2lucHdnUDE3MHpw?=
 =?utf-8?B?bjRzTGx3bXA4Mi9wU2lSSWdMajZvZVRhQXVBMEs4VUdMeHFYSlZLb3VzdlZ4?=
 =?utf-8?B?N2JYM0s5bkxZODhodlUwcUU3Z2VNZlpveGVZdk5DWFg5TVN5K291WnFoRjdO?=
 =?utf-8?B?ZWpDQ3BlNy83QisrbkhScUcxajhxYkVLSm1tLzRRTEh6SW5UVDNCWGQxWVhs?=
 =?utf-8?B?T0VWb2NlcHJRMFNqbkk0NGtxTFIxdGhkejBNUm1tOElrT09paVV4d0QxN2Vr?=
 =?utf-8?B?MlNUSWdKYzRnY3k4QWc0YmtLNktCei9pU01WM2tTNlY2MnlTV0VWdHVwRUVE?=
 =?utf-8?B?eDVPV2JGS1VsUWtneXhEVFpmYkVlSyt2WHRGbmtwTUlHS3JzNlptVWliTGs5?=
 =?utf-8?B?OVgrMmRZUkZCK3Fld2FOa2RKVjFZd01pdVZyUW9xcVZJMDJBWEhtc0tuZDIw?=
 =?utf-8?B?Q3pQbTNTODAzMjFrVThJK0hJc0hBRHo2NzR5aloyTzF2TzJUQ01qVkQ0UUNy?=
 =?utf-8?B?TkVHWElIeHNjbndxanppT3k4SjdNbWRiclFmNEZXcWhTZHFYM1ljOVI5dXdv?=
 =?utf-8?B?d2p3S1hTNnpNTEVCNmRoYXdIMnJZUVI0MXNTUml4V0pNbDlEeTMzaGJ4RzY0?=
 =?utf-8?B?MkpISjZvOTYwNVNXaTkwOTRrcUlkZ2dWalFUb1FtVEZ2K3o1T1A0SzU1MEIz?=
 =?utf-8?B?QVJqUXZsRlVnQWUyTmZidnlFR1VrcjZ5VllnYSsvNTdsak9tR0FyZXJIeWI5?=
 =?utf-8?B?U0Y4dUo2VTN5TGZCQ0diMTJZekNRRU14VjVvdWdjTTV5WmFvZzNJQ3pTQVlN?=
 =?utf-8?B?S0lKS1J3ZkdxWlNBMUY0YVNhQjZPVlhWdGtvZEg1VnpRYVorVnAyRCtMdW9L?=
 =?utf-8?B?MGx0TjVxanRSRy9Jc203bnlLV1NJTnIwWGU0M2E1d25iUWp3UEUyT2JzZmJL?=
 =?utf-8?B?YU5qckE3bjVGallMeXlOdDRuVUNVN0I2Ry8yWklNcTI0ZlZINkpRUXRmQXlp?=
 =?utf-8?B?T0IxTDJBS2tvTlZRbFpheHNWOHVCRTVxeUdOTHkwUkxhQVdTeDdZZGR5eDB5?=
 =?utf-8?B?T3lRd1piblF1eXpmTGlUTlRJZ3hxdmRIRkZ6UERnRnNrTUNuTndEZmp1TFVu?=
 =?utf-8?B?Z2xnNTBZMmxkMTZ4ZUVRK2lORmU4ejVFekszMk1XUThYVnJtQXRMeFZ1dmF2?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7ba6b1-bb76-4a8e-a4e7-08dda2777d5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 08:20:24.4054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VEQmGC0Kiuojwv43zUckoLIwHuB6E/Vqaa5CNVxTb/TnNZbmntT+R8KRLBAV9UOdCqvbo0wyPzwFEzWHuRQHKWOgSzCBryCdwL6/tQ3OXbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMSAwOC8xMF0gZHJtL3hlL252bTogYWRkIG9uLWRpZSBu
b24tdm9sYXRpbGUNCj4gbWVtb3J5IGRldmljZQ0KPiANCj4gSGV5LA0KPiANCj4gSSB3YXMgbG9v
a2luZyBpbnRvIHRlc3RpbmcgdGhpcyB3aXRoIHRoZSB4ZSBjb2RlIG9uIFBWQywgYW5kIG5vdGlj
ZWQgc29tZSBzbWFsbA0KPiBjaGFuZ2VzIHRoYXQgd291bGQgYmUgdXNlZnVsIHRvIGludGVncmF0
ZSBiZWZvcmUgbWVyZ2luZy4NCj4gDQo+IE9uIDIwMjUtMDUtMjggMTU6NTEsIEFsZXhhbmRlciBV
c3lza2luIHdyb3RlOg0KPiA+IEVuYWJsZSBhY2Nlc3MgdG8gaW50ZXJuYWwgbm9uLXZvbGF0aWxl
IG1lbW9yeSBvbiBER0ZYDQo+ID4gd2l0aCBHU0MvQ1NDIGRldmljZXMgdmlhIGEgY2hpbGQgZGV2
aWNlLg0KPiA+IFRoZSBudm0gY2hpbGQgZGV2aWNlIGlzIGV4cG9zZWQgdmlhIGF1eGlsaWFyeSBi
dXMuDQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPg0KPiA+IEFja2VkLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lz
a2luQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxl
ICAgICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jICAg
ICAgIHwgICA1ICsrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8
ICAgNiArKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbnZtLmMgICAgICAgICAgfCAxMDcN
Cj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9udm0uaCAgICAgICAgICB8ICAxNSArKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
Y2kuYyAgICAgICAgICB8ICAgNiArKw0KPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDE0MCBpbnNlcnRp
b25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfbnZt
LmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9udm0uaA0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBiL2RyaXZl
cnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+IGluZGV4IGU0YmY0ODRkNDEyMS4uNGM1MWZlMzUy
MGRjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+IEBAIC04MCw2ICs4MCw3IEBAIHhl
LXkgKz0geGVfYmIubyBcDQo+ID4gIAl4ZV9tbWlvLm8gXA0KPiA+ICAJeGVfbW9jcy5vIFwNCj4g
PiAgCXhlX21vZHVsZS5vIFwNCj4gPiArCXhlX252bS5vIFwNCj4gPiAgCXhlX29hLm8gXA0KPiA+
ICAJeGVfb2JzZXJ2YXRpb24ubyBcDQo+ID4gIAl4ZV9wYXQubyBcDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2UuYw0KPiA+IGluZGV4IGQ0YjZlNjIzYWE0OC4uODQ1YjM4YWVhNjkyIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IEBAIC00Niw2ICs0Niw3IEBADQo+ID4gICNp
bmNsdWRlICJ4ZV9tZW1pcnEuaCINCj4gPiAgI2luY2x1ZGUgInhlX21taW8uaCINCj4gPiAgI2lu
Y2x1ZGUgInhlX21vZHVsZS5oIg0KPiA+ICsjaW5jbHVkZSAieGVfbnZtLmgiDQo+ID4gICNpbmNs
dWRlICJ4ZV9vYS5oIg0KPiA+ICAjaW5jbHVkZSAieGVfb2JzZXJ2YXRpb24uaCINCj4gPiAgI2lu
Y2x1ZGUgInhlX3BhdC5oIg0KPiA+IEBAIC04ODQsNiArODg1LDggQEAgaW50IHhlX2RldmljZV9w
cm9iZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiAgCQkJcmV0dXJuIGVycjsNCj4gPiAgCX0N
Cj4gPg0KPiA+ICsJeGVfbnZtX2luaXQoeGUpOw0KPiA+ICsNCj4gPiAgCWVyciA9IHhlX2hlY2lf
Z3NjX2luaXQoeGUpOw0KPiA+ICAJaWYgKGVycikNCj4gPiAgCQlyZXR1cm4gZXJyOw0KPiA+IEBA
IC05NDEsNiArOTQ0LDggQEAgdm9pZCB4ZV9kZXZpY2VfcmVtb3ZlKHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlKQ0KPiA+ICB7DQo+ID4gIAl4ZV9kaXNwbGF5X3VucmVnaXN0ZXIoeGUpOw0KPiA+DQo+ID4g
Kwl4ZV9udm1fZmluaSh4ZSk7DQo+ID4gKw0KPiA+ICAJZHJtX2Rldl91bnBsdWcoJnhlLT5kcm0p
Ow0KPiA+DQo+ID4gIAl4ZV9ib19wY2lfZGV2X3JlbW92ZV9hbGwoeGUpOw0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBpbmRleCA1MGIyYmZhNjgyYWMuLjkzOGNm
MWE0NDBkZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5
cGVzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4g
PiBAQCAtMzUsNiArMzUsNyBAQA0KPiA+ICAjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV9kZXZpY2Uu
aCINCj4gPiAgI2VuZGlmDQo+ID4NCj4gPiArc3RydWN0IGludGVsX2RnX252bV9kZXY7DQo+ID4g
IHN0cnVjdCB4ZV9nZ3R0Ow0KPiA+ICBzdHJ1Y3QgeGVfcGF0X29wczsNCj4gPiAgc3RydWN0IHhl
X3B4cDsNCj4gPiBAQCAtMzE5LDYgKzMyMCw4IEBAIHN0cnVjdCB4ZV9kZXZpY2Ugew0KPiA+ICAJ
CXU4IGhhc19mYW5fY29udHJvbDoxOw0KPiA+ICAJCS8qKiBAaW5mby5oYXNfZmxhdF9jY3M6IFdo
ZXRoZXIgZmxhdCBDQ1MgbWV0YWRhdGEgaXMgdXNlZCAqLw0KPiA+ICAJCXU4IGhhc19mbGF0X2Nj
czoxOw0KPiA+ICsJCS8qKiBAaW5mby5oYXNfZ3NjX252bTogRGV2aWNlIGhhcyBnc2Mgbm9uLXZv
bGF0aWxlIG1lbW9yeQ0KPiAqLw0KPiA+ICsJCXU4IGhhc19nc2NfbnZtOjE7DQo+IElzIHRoaXMg
ZmxhZyByZWFsbHkgbmVlZGVkLCBvciBpcyBJU19ER0ZYKCkgZW5vdWdoPyBJdCdzIGxpdGVyYWxs
eSBvbmx5IHVzZWQgZHVyaW5nDQo+IE5WTSBpbml0LCBzbyBhbnkgY29uZGl0aW9ucyBjb3VsZCBw
cm9iYWJseSBqdXN0IGJlIHB1dCB0aGVyZS4NCj4gDQoNClRoZXJlIGFyZSBzb21lIERHRlggdGhh
dCBkbyBub3QgaGF2ZSBHU0MvQ1NDIGFuZCBjb3JyZXNwb25kaW5nIE5WTS4NCg0KPiA+ICAJCS8q
KiBAaW5mby5oYXNfaGVjaV9jc2NmaTogZGV2aWNlIGhhcyBoZWNpIGNzY2ZpICovDQo+ID4gIAkJ
dTggaGFzX2hlY2lfY3NjZmk6MTsNCj4gPiAgCQkvKiogQGluZm8uaGFzX2hlY2lfZ3NjZmk6IGRl
dmljZSBoYXMgaGVjaSBnc2NmaSAqLw0KPiA+IEBAIC01NDQsNiArNTQ3LDkgQEAgc3RydWN0IHhl
X2RldmljZSB7DQo+ID4gIAkvKiogQGhlY2lfZ3NjOiBncmFwaGljcyBzZWN1cml0eSBjb250cm9s
bGVyICovDQo+ID4gIAlzdHJ1Y3QgeGVfaGVjaV9nc2MgaGVjaV9nc2M7DQo+ID4NCj4gPiArCS8q
KiBAbnZtOiBkaXNjcmV0ZSBncmFwaGljcyBub24tdm9sYXRpbGUgbWVtb3J5ICovDQo+ID4gKwlz
dHJ1Y3QgaW50ZWxfZGdfbnZtX2RldiAqbnZtOw0KPiA+ICsNCj4gPiAgCS8qKiBAb2E6IG9hIG9i
c2VydmF0aW9uIHN1YnN5c3RlbSAqLw0KPiA+ICAJc3RydWN0IHhlX29hIG9hOw0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9udm0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9udm0uYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAw
MDAwMDAwLi4zM2JhNjM1Y2UxMTYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX252bS5jDQo+ID4gQEAgLTAsMCArMSwxMDcgQEANCj4gPiArLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQoYykg
MjAxOS0yMDI1LCBJbnRlbCBDb3Jwb3JhdGlvbi4gQWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4gPiAr
ICovDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8bGludXgvaW50ZWxfZGdfbnZtX2F1eC5oPg0KPiA+
ICsjaW5jbHVkZSA8bGludXgvcGNpLmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAieGVfZGV2aWNl
X3R5cGVzLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV9udm0uaCINCj4gPiArI2luY2x1ZGUgInhlX3Ny
aW92LmgiDQo+ID4gKw0KPiA+ICsjZGVmaW5lIEdFTjEyX0dVTklUX05WTV9CQVNFIDB4MDAxMDIw
NDANCj4gPiArI2RlZmluZSBHRU4xMl9HVU5JVF9OVk1fU0laRSAweDgwDQo+ID4gKyNkZWZpbmUg
SEVDSV9GV19TVEFUVVNfMl9OVk1fQUNDRVNTX01PREUgQklUKDMpDQo+ID4gKw0KPiA+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IGludGVsX2RnX252bV9yZWdpb24gcmVnaW9uc1tJTlRFTF9ER19OVk1f
UkVHSU9OU10NCj4gPSB7DQo+ID4gKwlbMF0gPSB7IC5uYW1lID0gIkRFU0NSSVBUT1IiLCB9LA0K
PiA+ICsJWzJdID0geyAubmFtZSA9ICJHU0MiLCB9LA0KPiA+ICsJWzldID0geyAubmFtZSA9ICJQ
QURESU5HIiwgfSwNCj4gPiArCVsxMV0gPSB7IC5uYW1lID0gIk9wdGlvblJPTSIsIH0sDQo+ID4g
KwlbMTJdID0geyAubmFtZSA9ICJEQU0iLCB9LA0KPiA+ICt9Ow0KPiA+ICsNCj4gU21hbGwgYXNr
LCBjYW4gd2UgZW5hYmxlIFBTQyBmb3IgUFZDIHRvbz8gT3IgYXQgbGVhc3QgYnVtcCByZWdpb25z
IHdpdGggMSBzbw0KPiBpdCdzIGRvYWJsZS4NCg0KTGV0J3MgZW5hYmxlIFBWQyBhcyBmb2xsb3ct
dXAgcGF0Y2ggYXMgdGhpcyBzZXJpZXMgaXMgZGVsYXllZCB0b28gbXVjaCBhbHJlYWR5Lg0KDQo+
IA0KPiA+ICtzdGF0aWMgdm9pZCB4ZV9udm1fcmVsZWFzZV9kZXYoc3RydWN0IGRldmljZSAqZGV2
KQ0KPiA+ICt7DQo+ID4gK30NCj4gPiArDQo+ID4gK2ludCB4ZV9udm1faW5pdChzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSkNCj4gPiArew0KPiA+ICsJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lf
ZGV2KHhlLT5kcm0uZGV2KTsNCj4gPiArCXN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICphdXhfZGV2
Ow0KPiA+ICsJc3RydWN0IGludGVsX2RnX252bV9kZXYgKm52bTsNCj4gPiArCWludCByZXQ7DQo+
ID4gKw0KPiA+ICsJaWYgKCF4ZS0+aW5mby5oYXNfZ3NjX252bSkNCj4gPiArCQlyZXR1cm4gMDsN
Cj4gPiArDQo+ID4gKwkvKiBObyBhY2Nlc3MgdG8gaW50ZXJuYWwgTlZNIGZyb20gVkZzICovDQo+
ID4gKwlpZiAoSVNfU1JJT1ZfVkYoeGUpKQ0KPiA+ICsJCXJldHVybiAwOw0KPiA+ICsNCj4gPiAr
CS8qIE52bSBwb2ludGVyIHNob3VsZCBiZSBOVUxMIGhlcmUgKi8NCj4gPiArCWlmIChXQVJOX09O
KHhlLT5udm0pKQ0KPiA+ICsJCXJldHVybiAtRUZBVUxUOw0KPiA+ICsNCj4gPiArCXhlLT5udm0g
PSBremFsbG9jKHNpemVvZigqbnZtKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIXhlLT5udm0p
DQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsJbnZtID0geGUtPm52bTsNCj4g
PiArDQo+ID4gKwludm0tPndyaXRhYmxlX292ZXJyaWRlID0gZmFsc2U7DQo+ID4gKwludm0tPmJh
ci5wYXJlbnQgPSAmcGRldi0+cmVzb3VyY2VbMF07DQo+ID4gKwludm0tPmJhci5zdGFydCA9IEdF
TjEyX0dVTklUX05WTV9CQVNFICsgcGRldi0NCj4gPnJlc291cmNlWzBdLnN0YXJ0Ow0KPiA+ICsJ
bnZtLT5iYXIuZW5kID0gbnZtLT5iYXIuc3RhcnQgKyBHRU4xMl9HVU5JVF9OVk1fU0laRSAtIDE7
DQo+ID4gKwludm0tPmJhci5mbGFncyA9IElPUkVTT1VSQ0VfTUVNOw0KPiA+ICsJbnZtLT5iYXIu
ZGVzYyA9IElPUkVTX0RFU0NfTk9ORTsNCj4gPiArCW52bS0+cmVnaW9ucyA9IHJlZ2lvbnM7DQo+
ID4gKw0KPiA+ICsJYXV4X2RldiA9ICZudm0tPmF1eF9kZXY7DQo+ID4gKw0KPiA+ICsJYXV4X2Rl
di0+bmFtZSA9ICJudm0iOw0KPiA+ICsJYXV4X2Rldi0+aWQgPSAocGNpX2RvbWFpbl9ucihwZGV2
LT5idXMpIDw8IDE2KSB8IHBjaV9kZXZfaWQocGRldik7DQo+ID4gKwlhdXhfZGV2LT5kZXYucGFy
ZW50ID0gJnBkZXYtPmRldjsNCj4gPiArCWF1eF9kZXYtPmRldi5yZWxlYXNlID0geGVfbnZtX3Jl
bGVhc2VfZGV2Ow0KPiA+ICsNCj4gPiArCXJldCA9IGF1eGlsaWFyeV9kZXZpY2VfaW5pdChhdXhf
ZGV2KTsNCj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkcm1fZXJyKCZ4ZS0+ZHJtLCAieGUtbnZt
IGF1eCBpbml0IGZhaWxlZCAlZFxuIiwgcmV0KTsNCj4gPiArCQlnb3RvIGVycjsNCj4gPiArCX0N
Cj4gPiArDQo+ID4gKwlyZXQgPSBhdXhpbGlhcnlfZGV2aWNlX2FkZChhdXhfZGV2KTsNCj4gPiAr
CWlmIChyZXQpIHsNCj4gPiArCQlkcm1fZXJyKCZ4ZS0+ZHJtLCAieGUtbnZtIGF1eCBhZGQgZmFp
bGVkICVkXG4iLCByZXQpOw0KPiA+ICsJCWF1eGlsaWFyeV9kZXZpY2VfdW5pbml0KGF1eF9kZXYp
Ow0KPiA+ICsJCWdvdG8gZXJyOw0KPiA+ICsJfQ0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gKw0KPiA+
ICtlcnI6DQo+ID4gKwlrZnJlZShudm0pOw0KPiA+ICsJeGUtPm52bSA9IE5VTEw7DQo+ID4gKwly
ZXR1cm4gcmV0Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICt2b2lkIHhlX252bV9maW5pKHN0cnVjdCB4
ZV9kZXZpY2UgKnhlKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGdfbnZtX2RldiAqbnZt
ID0geGUtPm52bTsNCj4gPiArDQo+ID4gKwlpZiAoIXhlLT5pbmZvLmhhc19nc2NfbnZtKQ0KPiA+
ICsJCXJldHVybjsNCj4gPiArDQo+ID4gKwkvKiBObyBhY2Nlc3MgdG8gaW50ZXJuYWwgTlZNIGZy
b20gVkZzICovDQo+ID4gKwlpZiAoSVNfU1JJT1ZfVkYoeGUpKQ0KPiA+ICsJCXJldHVybjsNCj4g
PiArDQo+ID4gKwkvKiBOdm0gcG9pbnRlciBzaG91bGQgbm90IGJlIE5VTEwgaGVyZSAqLw0KPiA+
ICsJaWYgKFdBUk5fT04oIW52bSkpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCWF1eGls
aWFyeV9kZXZpY2VfZGVsZXRlKCZudm0tPmF1eF9kZXYpOw0KPiA+ICsJYXV4aWxpYXJ5X2Rldmlj
ZV91bmluaXQoJm52bS0+YXV4X2Rldik7DQo+ID4gKwlrZnJlZShudm0pOw0KPiA+ICsJeGUtPm52
bSA9IE5VTEw7DQo+ID4gK30NCj4gSW4geGUsIGluc3RlYWQgb2YgZXhwb3J0aW5nIG52bV9maW5p
LCBpdCB3b3VsZCBiZSBnb29kIHRvIHVzZSB0aGUgZHJtbQ0KPiBpbnRlcmZhY2UsIGxpa2UgZHJt
bV9remFsbG9jIGZvciBhbGxvY2F0aW5nIE5WTSBzbyBpdCBkb2Vzbid0IGhhdmUgdG8gYmUgZnJl
ZWQNCj4gb24gZmFpbHVyZSwgYW5kIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCBhcyBsYXN0IGFj
dGlvbiBpbiBkdXJpbmcgaW5pdC4gVGhhdA0KPiBhbHNvIHJlbW92ZXMgYWxsIGNoZWNrcyBmcm9t
IGZpbmkoKS4NCg0KQ2FuIGJlIGRvbmUsIGJ1dCBJIHByZWZlciBpdCB0byBwdXNoIGFzIGZvbGxv
dy11cCBwYXRjaCB0byBub3QgZGVsYXkgd2hvbGUgc2VyaWVzLg0KDQo+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbnZtLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
bnZtLmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
N2YzZDVmNTdiZWQwDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9udm0uaA0KPiA+IEBAIC0wLDAgKzEsMTUgQEANCj4gPiArLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IE1JVCAqLw0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQoYykgMjAxOS0y
MDI1IEludGVsIENvcnBvcmF0aW9uLiBBbGwgcmlnaHRzIHJlc2VydmVkLg0KPiA+ICsgKi8NCj4g
PiArDQo+ID4gKyNpZm5kZWYgX19YRV9OVk1fSF9fDQo+ID4gKyNkZWZpbmUgX19YRV9OVk1fSF9f
DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgeGVfZGV2aWNlOw0KPiA+ICsNCj4gPiAraW50IHhlX252bV9p
bml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gPiArDQo+ID4gK3ZvaWQgeGVfbnZtX2Zpbmko
c3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+ICsNCj4gPiArI2VuZGlmDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
Y2kuYw0KPiA+IGluZGV4IGI2OGM5MDkxMGQ4Mi4uNmFhOTg1MGJiMzQyIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wY2kuYw0KPiA+IEBAIC02Myw2ICs2Myw3IEBAIHN0cnVjdCB4ZV9kZXZpY2VfZGVz
YyB7DQo+ID4NCj4gPiAgCXU4IGhhc19kaXNwbGF5OjE7DQo+ID4gIAl1OCBoYXNfZmFuX2NvbnRy
b2w6MTsNCj4gPiArCXU4IGhhc19nc2NfbnZtOjE7DQo+ID4gIAl1OCBoYXNfaGVjaV9nc2NmaTox
Ow0KPiA+ICAJdTggaGFzX2hlY2lfY3NjZmk6MTsNCj4gPiAgCXU4IGhhc19sbGM6MTsNCj4gPiBA
QCAtMjcxLDYgKzI3Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgZGcx
X2Rlc2MgPSB7DQo+ID4gIAlQTEFURk9STShERzEpLA0KPiA+ICAJLmRtYV9tYXNrX3NpemUgPSAz
OSwNCj4gPiAgCS5oYXNfZGlzcGxheSA9IHRydWUsDQo+ID4gKwkuaGFzX2dzY19udm0gPSAxLA0K
PiA+ICAJLmhhc19oZWNpX2dzY2ZpID0gMSwNCj4gPiAgCS5yZXF1aXJlX2ZvcmNlX3Byb2JlID0g
dHJ1ZSwNCj4gPiAgfTsNCj4gPiBAQCAtMjgyLDYgKzI4NCw3IEBAIHN0YXRpYyBjb25zdCB1MTYg
ZGcyX2cxMl9pZHNbXSA9IHsNCj4gSU5URUxfREcyX0cxMl9JRFMoTk9QKSwgMCB9Ow0KPiA+ICAj
ZGVmaW5lIERHMl9GRUFUVVJFUyBcDQo+ID4gIAlER0ZYX0ZFQVRVUkVTLCBcDQo+ID4gIAlQTEFU
Rk9STShERzIpLCBcDQo+ID4gKwkuaGFzX2dzY19udm0gPSAxLCBcDQo+ID4gIAkuaGFzX2hlY2lf
Z3NjZmkgPSAxLCBcDQo+ID4gIAkuc3VicGxhdGZvcm1zID0gKGNvbnN0IHN0cnVjdCB4ZV9zdWJw
bGF0Zm9ybV9kZXNjW10pIHsgXA0KPiA+ICAJCXsgWEVfU1VCUExBVEZPUk1fREcyX0cxMCwgIkcx
MCIsIGRnMl9nMTBfaWRzIH0sIFwNCj4gPiBAQCAtMzE4LDYgKzMyMSw3IEBAIHN0YXRpYyBjb25z
dCBfX21heWJlX3VudXNlZCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MNCj4gcHZjX2Rlc2MgPSB7DQo+
ID4gIAlQTEFURk9STShQVkMpLA0KPiA+ICAJLmRtYV9tYXNrX3NpemUgPSA1MiwNCj4gPiAgCS5o
YXNfZGlzcGxheSA9IGZhbHNlLA0KPiA+ICsJLmhhc19nc2NfbnZtID0gMSwNCj4gPiAgCS5oYXNf
aGVjaV9nc2NmaSA9IDEsDQo+ID4gIAkubWF4X3JlbW90ZV90aWxlcyA9IDEsDQo+ID4gIAkucmVx
dWlyZV9mb3JjZV9wcm9iZSA9IHRydWUsDQo+ID4gQEAgLTM0Niw2ICszNTAsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjIGJtZ19kZXNjID0gew0KPiA+ICAJLmRtYV9tYXNr
X3NpemUgPSA0NiwNCj4gPiAgCS5oYXNfZGlzcGxheSA9IHRydWUsDQo+ID4gIAkuaGFzX2Zhbl9j
b250cm9sID0gdHJ1ZSwNCj4gPiArCS5oYXNfZ3NjX252bSA9IDEsDQo+ID4gIAkuaGFzX2hlY2lf
Y3NjZmkgPSAxLA0KPiA+ICAJLm5lZWRzX3NjcmF0Y2ggPSB0cnVlLA0KPiA+ICB9Ow0KPiA+IEBA
IC01ODksNiArNTk0LDcgQEAgc3RhdGljIGludCB4ZV9pbmZvX2luaXRfZWFybHkoc3RydWN0IHhl
X2RldmljZSAqeGUsDQo+ID4gIAl4ZS0+aW5mby5kbWFfbWFza19zaXplID0gZGVzYy0+ZG1hX21h
c2tfc2l6ZTsNCj4gPiAgCXhlLT5pbmZvLmlzX2RnZnggPSBkZXNjLT5pc19kZ2Z4Ow0KPiA+ICAJ
eGUtPmluZm8uaGFzX2Zhbl9jb250cm9sID0gZGVzYy0+aGFzX2Zhbl9jb250cm9sOw0KPiA+ICsJ
eGUtPmluZm8uaGFzX2dzY19udm0gPSBkZXNjLT5oYXNfZ3NjX252bTsNCj4gPiAgCXhlLT5pbmZv
Lmhhc19oZWNpX2dzY2ZpID0gZGVzYy0+aGFzX2hlY2lfZ3NjZmk7DQo+ID4gIAl4ZS0+aW5mby5o
YXNfaGVjaV9jc2NmaSA9IGRlc2MtPmhhc19oZWNpX2NzY2ZpOw0KPiA+ICAJeGUtPmluZm8uaGFz
X2xsYyA9IGRlc2MtPmhhc19sbGM7DQo+IA0KPiBLaW5kIHJlZ2FyZHMsDQo+IE1hYXJ0ZW4gTGFu
a2hvcnN0DQoNCg0KLSAtIA0KVGhhbmtzLA0KU2FzaGENCg0KDQo=
