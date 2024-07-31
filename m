Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0D942986
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 10:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431AB10E5CE;
	Wed, 31 Jul 2024 08:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbBufL3s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC96910E5C8;
 Wed, 31 Jul 2024 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722415694; x=1753951694;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Esefh9LsYeJ4/VBKQMxiMglm9WS/90KCRwkO4VMhJWc=;
 b=cbBufL3s7JgkVJgVivJL43IGGcgnqRqqcCVe0YhwaPP+174aW9aIOVbb
 XK+jPW4J4/zPYVgT4dI8OT9scFKLWCPPPgzDFgHGFjnGr4U8087umQw4K
 Zj8cYoI8rb98wXUf3DhrZXL/j8QHZqVQsFBA6B3U60uObSrKELtqAmKN3
 dphUyt2MYAeOtBz/Q26ENi0NekTCBkMKMg68zSzZR/s5gZmSVsi1CLVPS
 d8I6mFz7fN9UF9qBehagCdOBVlOZBEXDoMFFRrvi8vtifc5hD1DAgsnAc
 saYeK2WCMotBu8xfAItA10ZKWBa2fSmoR8JOv5ThRDxI0KQHaFLYsCCLb Q==;
X-CSE-ConnectionGUID: kSqVvgr6Tg2JJY0nEMgZiw==
X-CSE-MsgGUID: fMJp4CV3Rg6h1W8mDC7c4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31428743"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31428743"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 01:48:13 -0700
X-CSE-ConnectionGUID: 5w2g5v7fQp6zZus4kCjJIQ==
X-CSE-MsgGUID: pXdkmLMYScuEpbh8MyIbGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59466764"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 01:48:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 01:48:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 01:48:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 01:48:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O83aMoI5+hpHSB78RKI+5XlY4drxSV5aStOmSWtiQTsi9IvfVqVQyzqwOLYuMCIul+gEPSVbNZZlrL6+DJYhKVE+8neCLlDiekXpHxyp2GSGKf3XNo62HmE1UVhMen9ADldAsjP1jLccL6F+rQbXTAzMP3oilMYN5mIQzH1YsD+VOULQzcK53PTJqxF7msfykc9azRsA45UZtlfOaL75ZFHLy5V6CYpj1QbkgGxbQQwseGs9zsnPFjZqL7uekK+eIDwqmr4PjU9MtxZVnY/Fxd/HjOfxA4TyfpqySTy7dZSoS6eBXCf2Rf81HoXoyFIw6AIhncoo0h9VjR3TJr6xOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Esefh9LsYeJ4/VBKQMxiMglm9WS/90KCRwkO4VMhJWc=;
 b=N5Jg6hYJl3n4PbLFqgUnjswy6SsdKszWtqDtwQf24AYHfZfz+oLo9jwjyEHgeOcs0eJgNhn26u492KDle6KhIyo3Iun7aJWazxznbvjoTheuIEDSoq4/8yV09nEV6kwAaZANIjmzctZ0J7wqwpjp6LFwXX8WtaRw+NkId77ksgWPu+ofEuBCyMX+k5pS+PbKJB96B8BLXRtkIGQejEw4y6P/YMeDWbvuyVCTfS8dRA5HWUDI8IoqTToIh+o80gcOWM8JqCJe7ufGCNbPO4Xu30JR4it++J0mBKm+EXuq5DyKFgoND8PcGqyHWdnmaX+BNZy3T3hcgRFp4YurWPnEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 08:48:08 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 08:48:08 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
 interoperability
Thread-Topic: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
 interoperability
Thread-Index: AQHa0dWUAPOk7QcYUEWdXvrZAsOcWbINRD1wgAErt4CAAFgZkIAB3P6AgAACACA=
Date: Wed, 31 Jul 2024 08:48:08 +0000
Message-ID: <IA0PR11MB7307204A1E7BB969500CAF0CBAB12@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240709074656.1389387-1-arun.r.murthy@intel.com>
 <IA0PR11MB7307E4F207A125F53A23342BBAB72@IA0PR11MB7307.namprd11.prod.outlook.com>
 <jsrh2xyopzcmsi7uardklw2gfzmseq4pldj6bt6ozezhx5qqbs@epk6y7hg6ihv>
 <CH3PR11MB7300ABE65A3E3DCD3CE90DDCBAB02@CH3PR11MB7300.namprd11.prod.outlook.com>
 <CAA8EJppU9GaS8Npy+M5v00BJ4NrZt+BpYG5uAGPgdmZnb1TXnQ@mail.gmail.com>
In-Reply-To: <CAA8EJppU9GaS8Npy+M5v00BJ4NrZt+BpYG5uAGPgdmZnb1TXnQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW4PR11MB5797:EE_
x-ms-office365-filtering-correlation-id: 93a8dfa2-6655-48f2-1a16-08dcb13d8054
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SGVCT3lBUVJycTNvbkVVYUgwNmJwK3l3eHcvdSsvL1ZVYWFuRDF3aVZvVzVa?=
 =?utf-8?B?aCs2dHhUTDZPNDBjYjVSR24xTWpSckllZ3BHblIzcDR5VFVycmp1SGJ4MG5a?=
 =?utf-8?B?TTduUityQnI1TzVTdGV4VE5jeDdnKy9yd1JPUVZhY3pUS3l2VjNzWXV6R0xv?=
 =?utf-8?B?ZjNQRHI2b1VmQnVFT1BMcDI5ckRMSC9hdStDTkNiVktlVUxqQ0tNVEVkSnI1?=
 =?utf-8?B?RXhMTFhsQjJqenZxZ2tqa2h5c0dJNFpkQStGbWYvWnlHNGUvcnRtVVdGRjdm?=
 =?utf-8?B?eXhNRjI4aUlxVXJFV25ZY3pZaERlVzdmbTBJSUVyT0JDY3hsUlk1WmhmcjBC?=
 =?utf-8?B?R084YkJVUHErcFhwcXhodDNJQkF1ZVhaRzBUSE9obW9hUHg0eEpmcUUzcHZh?=
 =?utf-8?B?NmF3SVNnVklWVGt5cDJWNnNhT1RaazRFYlg3aXoxMUhOWTd6SEZUU2k3MXJa?=
 =?utf-8?B?SGdGMkFLcExMa25FbU83eEtHbkRkM3JRTE4vdGhzUzk3MSt3Ym90aWdnM3Y3?=
 =?utf-8?B?N29NWHdnTTdveUh0UjkxVlVNdzNJVDhIeHJiZVp1UVgyNElZM3VpVmVvY2dT?=
 =?utf-8?B?SWZJb1BxekRwZzNxa3Byd09oZXJDRUR0amtzMWp2T2xUTVNFQlozOFdhT1hC?=
 =?utf-8?B?a0hiOXNqUUhlVzdtYVdySFl6YUlOWjQrelVJREtyM3VBNHNzYytuRkNjTHQv?=
 =?utf-8?B?T1NLUE5tejVpNER6WVhYV0NpYlY0eEc4UEFJeEJSa1ovY0F4UHZmWHAzUTEy?=
 =?utf-8?B?bm5wTFlvVCsyeTZEZkJMb1p4VXYvaHJrdlVwY2Q5S2xNQ1MrQ2ZNUFRySk5G?=
 =?utf-8?B?dzhtV0NiNlAxeEhHTjBoblRFd1dpRVR4ZWVSUFpOOGQrY3dpak50RkIrT0xo?=
 =?utf-8?B?TXRCRURtQzRhVVRoeEs5VXZCcit3YVVkQjdXNzM4VHNsYkZpQ2dWdSs4dmg1?=
 =?utf-8?B?U2hOd1RGZzNlM0F2YVA3UnpjeldDTEMzZmtQelU3ZlIxZmpGUHh6TGdwVG1p?=
 =?utf-8?B?WFlOZWd3VnZNWkZxYnZ5T0tBTkhLbWdicURtTytnVXhsN3o0ajJpRkNHbFZi?=
 =?utf-8?B?djI3ZS9ld3ZZUUk5aC9pZkdVaVNteHA1THJnOXhIdmwydmp0bVVnbmxxd3V3?=
 =?utf-8?B?NTVuNzlWWk9TQ2trbW1vWmp4dlFwNUc5UnMrU2p4RGxNS3FIa25nT25IUTBy?=
 =?utf-8?B?cDZ4OFV1SDJzOTFjMzJVVEhpcE8yNTBDQ3ZwLzR1QUZ5TmNOYkRyQWVCTjQw?=
 =?utf-8?B?NDA0SzZwZG8xeEFoUStJL2pESTVhVjhGOXNlK2thcWdNNlVETXFUVnY5Mzhs?=
 =?utf-8?B?U0tCZ2E5dS9majRPcWJFd1FLaEpmTGlnUmhoMUJKYnAxb1VyM0JoOEVRc0J2?=
 =?utf-8?B?NkVQditNNlV6SHE3aitheDRJcW1scVdKOWJGNDJqOS8wcFk3ekg0ZTR6MmJF?=
 =?utf-8?B?cWtFZUNIamZTT3B5Q25VdGluOGhrMWV0Z3lrZjFYaFdUbHFVY1JuQ1dZQ01h?=
 =?utf-8?B?b250eGROUFJ3YXduZE5ZVjdjSzJTSCtWd29NcU8zWXNyM2ZBYnlvZXUrSlRh?=
 =?utf-8?B?SlY3SVVjNmZKaTJiaUJtQ1BrU3dDL1pabDRBM3ZCRkhzUWdYSTVUYWh0ajVi?=
 =?utf-8?B?aTl5UE1ocitGcDM4R1pSeDFGTUVZYzZjTUVlcWJRUzFneGhXaHFVSTBzQ1Fq?=
 =?utf-8?B?cG5LWXhWV1k0QngyYW9uQVNtdjR3SE8rT0pES09UcHQ2aVdJbGlqMUNmNStD?=
 =?utf-8?B?MTg3NStiNUJOM2pTTUZ6clNMVy9xaDNhUytEWlZpNXFoN1VMbWlOUFBhNExU?=
 =?utf-8?Q?75oxBWsTTbMsINXr95jTt+pCt1NOC+ELJ2MPY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXhuTnlGQmVMM2VLSDlZcXhjdm12THR2L2hhU3B6dWNQdjh1M3F6RkY5OVlD?=
 =?utf-8?B?Njd2MlR3M3ZPeitZdlNYKzJ2bXZNNGh1WFlwQWtwVTNHTlV1dmRRTWNQbGNr?=
 =?utf-8?B?SVlHMys0T2xqZGJjOVlHdlNoQkx5SGU5VkNzdmFTZVlDQUxhK2hqK0RvVndu?=
 =?utf-8?B?bitxc1N3Q2lWVnYwQTkrUXBVTTVLalFIdVNBQi9FQzVXa2ZIMzdEV2dSaFp6?=
 =?utf-8?B?WXpDM3lXMXBkalZ1ZlhqS3dJcEcvb3luWDY2WDJJcHdzRThDSFpmbmNERzdx?=
 =?utf-8?B?WlZldVgzSmwrTEdudmRRU1VtM1NGRXAxMmxIZmRQZmR6U25MRFJOM01GY3l1?=
 =?utf-8?B?S2R5RFBsbVBwcFVFZXJxVURJQzJZYWFzMEdETFdXbU9MMmJheU1saUpaZEJs?=
 =?utf-8?B?QmtweVBkaS9oOWgybUVUTGVxaFdaME1pdjAxVzBXZHJkcjFBQ3ZxaHl5MkZB?=
 =?utf-8?B?QTZvaHRwZlprNXZzOGFnQUtsR1VqRXY3YkZWazB6N1dLZGRLb1dFbTNremo5?=
 =?utf-8?B?VzNETkVjOWw4djR3Ynlodkc2K3lDcHhta0dSWFJtOVFhMng4cG16aWcyN2Z0?=
 =?utf-8?B?WG1rQ3NuL3owRUh1WGZON0tiMzJ1WUZkUXphQ0lHbjBURS9YSUFDRUc5VytS?=
 =?utf-8?B?cUZMS0YxQjRBUUJUZ3JnVVZ6Z0lOUkRzWitiNG9Gb1dvdWFJN25zckhDMFVu?=
 =?utf-8?B?aDM0eHhxUkFZeDZ2OFlKYk5QaElpOVUzYVRZanh2d01Yc2hoYk4ycXEzUENh?=
 =?utf-8?B?a3VpYjFTdFBNbG42NDZQcW5wNjFwTUlCb3JBL0NiS1VnN0l4cWFmZ3p0WkUv?=
 =?utf-8?B?b2w2ai8xRmkvV3BMMTNFVnpudzZ3bzBrTWxreXJYS0pJREFhOEkyUHIrWVVT?=
 =?utf-8?B?WDdEUUpUNHRaekJNcnBYcmRPSXJnOWdIdGRlejc4cGtwRWpQSUtFenB2eklC?=
 =?utf-8?B?MEJlampRTzJxcUJoNEhSL25mVHpnYlljQ3RCdTlZTitCbWFEbFdCWFhXUkpR?=
 =?utf-8?B?L3lkaXRTaWdLVUY1Q0owWkw5aWhaN1ROYmRCZlZuNnF4aXdQSk1ZR0tiS2pQ?=
 =?utf-8?B?Y1F0SEtRK1dIbGt3bXpwVHBxRmhxVGZCd3ZLUHNzMkVsR1VuZkdlNGkrdVUy?=
 =?utf-8?B?Nm5ISVkxdk9rSXlxc0FpblZLMzlVN25XeTRzWmF6Q1Q4SU9FbTVLZTVpOUlo?=
 =?utf-8?B?c0k2ZHozMGFrVTg5dWhjVHYyU3BDcjJPSC8yampwRUpTd1ZkTHFjcVc0L0tx?=
 =?utf-8?B?S2hpR3o0dzJXN0I0cHdlTklOYzZMOTlxbzYxYUdabElGTFNmV01NM2Y4OEVu?=
 =?utf-8?B?cXo0TkhaQnh0QlllbE5vUExidWJhUGN1dGlGTTd6b2lJVUpha25UeEU1VUh3?=
 =?utf-8?B?MXBNR0pXSm5OUFUzWGkycGlMYnhvOXNwRUxCVU9yRlF0Zyt5cnU0VTc4OEtP?=
 =?utf-8?B?M0ZsLzg2SGt3ZGhUbmJleTVtYTZ4Mkd2R1FLRGRmc3loVVprOEhpUVBocjhl?=
 =?utf-8?B?cXgxWHIvOGFDaEEvNWhOK0s4V1d0Yk5HSjFqMHdFNjM3N0ltaFJPeGRLMHIr?=
 =?utf-8?B?SDFVRGI5eE9Dbjg4cTJYT055SGtjNDVPSmxWWWE3bDJmZExvcXFvcGplTjJF?=
 =?utf-8?B?QXI2M09kMXhtRC8rRkJwSmE3UldFZ2NOWG0wMFVZWm9KcExqbnlseTE3Z1h5?=
 =?utf-8?B?OVcwc0I4RDczMmFBNVhLWGsxSFB1WFROZHhHZlZVejVXK3JsYlNXM1ZiYVRw?=
 =?utf-8?B?MFVhOERlZzV4a3hPZzhHL1haeEIzK1YzaDlUY1lERFlobTVzc2xwNVEreTJD?=
 =?utf-8?B?VzBPWUU3QXlnZVAvek4zblBhNHRpSEpFY1hiL0ZZZEoxYm05a0tuckhJa3c2?=
 =?utf-8?B?Y3RVZ243WnhjazJNVjRnekJjS0VJVG9yTTRDQXNjc0xtUzdLWlhmVUN0MWxl?=
 =?utf-8?B?ZWxyU09xRlRtL2Fvak1kNjlTeTU3dzRqZkdEcnBhbU9pU1dqcnNJdmhzVHV4?=
 =?utf-8?B?M2tHMHlQK0FtNDlvOU4xUmVLbmNURzVGMDVQRzBUdlRoSVhwQnZnSXpFUVp4?=
 =?utf-8?B?d2tYb0d1SkVzMUNCVm1tNkxkK0pyL051Y0xkN0FIdmtFU2xWd2NrZkdpc3JW?=
 =?utf-8?B?WFU0TDdTa2ZxeUNJZkg4cVRabUpyV29yenNVc3B4cDdtMFJEMnFwSUE4a1M3?=
 =?utf-8?Q?9TbJSWkRwyFCW7SDjurcQ8HK5n9y31CF6AVA6pRXYf4c?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a8dfa2-6655-48f2-1a16-08dcb13d8054
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 08:48:08.3339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZ67DX3l6uWaHFkK2zFzKDCOfJoUQx++0+98Ft5EVPaElLMmAfXC90y74cIhdjvbm0s3XIObB1RRzh04euYrRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxk
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAzMSwg
MjAyNCAyOjA0IFBNDQo+IFRvOiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5j
b20+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFJGQzogZHJtL2RybV9w
bGFuZTogRXhwb3NlIHRoZSBwbGFuZSBjYXBhYmlsaXR5IGFuZA0KPiBpbnRlcm9wZXJhYmlsaXR5
DQo+IA0KPiBPbiBUdWUsIDMwIEp1bCAyMDI0IGF0IDA3OjA3LCBNdXJ0aHksIEFydW4gUiA8YXJ1
bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlz
aGtvdkBsaW5hcm8ub3JnPg0KPiA+ID4gU2VudDogVHVlc2RheSwgSnVseSAzMCwgMjAyNCA0OjIx
IEFNDQo+ID4gPiBUbzogTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0K
PiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFJGQzogZHJtL2Ry
bV9wbGFuZTogRXhwb3NlIHRoZSBwbGFuZSBjYXBhYmlsaXR5DQo+ID4gPiBhbmQgaW50ZXJvcGVy
YWJpbGl0eQ0KPiANCj4gUGxlYXNlIGZpeCB5b3VyIGVtYWlsIGNsaWVudC4NCj4gDQpTb3JyeSBm
b3IgdGhhdC4gU3VyZSB3aWxsIGZpeCBpdC4NCg0KPiA+ID4NCj4gPiA+IE9uIE1vbiwgSnVsIDI5
LCAyMDI0IGF0IDA0OjU5OjE0QU0gR01ULCBNdXJ0aHksIEFydW4gUiB3cm90ZToNCj4gPiA+ID4g
R2VudGxlIFJlbWluZGVyIQ0KPiA+ID4gPiBBbnkgY29tbWVudHM/DQo+ID4gPg0KPiA+ID4gRmly
c3Qgb2YgYWxsLCB0aGUgZm9ybWF0IGlzIHVuZGVyZG9jdW1lbnRlZC4gU2Vjb25kLCB0aGVyZSBp
cyBhDQo+ID4gPiB1c3VhbCByZXF1aXJlbWVudCBmb3IgbmV3IHVBUEk6IHBsZWFzZSBwcm92aWRl
IGEgcG9pbnRlciB0byBJR1QNCj4gPiA+IHBhdGNoIGFuZCB0byB0aGUgdXNlcnNwYWNlIHV0aWxp
c2luZyB0aGUgcHJvcGVydHkuDQo+ID4gVGhlcmUgYXJlIHNvbWUgZGlzY3Vzc2lvbnMgb24gdXNp
bmcgdGhpcyBpbiBVTUQuDQo+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2Ev
bWVzYS8tL21lcmdlX3JlcXVlc3RzLzI5NjE4I25vdGVfMg0KPiA+IDQ4NzEyMw0KPiANCj4gSXQg
c2hvdWxkIGJlIGEgTVIgcmF0aGVyIHRoYW4gInNvbWUgZGlzY3Vzc2lvbiIuIEFuZCBJR1QgcGF0
Y2hzZXQgdG9vLCBwbGVhc2UuDQpUaGVyZSBpcyBubyBJR1QgcGF0Y2ggeWV0Lg0KPiANCj4gUmVn
YXJkaW5nIHRoZSBwYXRjaCBpdHNlbGYuIEl0IGlzIGNvbXBsZXRlbHkgdW5kZXJkb2N1bWVudGVk
LiBUaGVyZSBpcyBubyB3YXkNCj4gZm9yIG1lIHRvIHVuZGVyc3RhbmQgd2hpY2ggb2YgdGhlc2Ug
Y2FwcyBzaG91bGQgZS5nLiBiZSBzZXQgZm9yIHRoZSBkcm0vbXNtDQo+IHBsYW5lcy4NCg0KSSBo
YXZlIGV4cGxhaW5lZCBpdCBpbiB0aGUgcGF0Y2ggaGVhZGVyLiBUaGVyZSBhcmUgY2VydGFpbiBw
bGFuZSByZXN0cmljdGlvbnMuDQpGb3IgZXhhbXBsZSwgY2VydGFpbiBwaXhlbCBmb3JtYXRzIGFy
ZSBub3Qgc3VwcG9ydGVkIGluIGFzeW5jIGZsaXAuIElmIHRoaXMgaXMga25vd24gdG8gdGhlIGNv
bXBvc2l0b3IgYWhlYWQsIHRoZW4gY29tcG9zaXRvciBzZW5kaW5nIGEgZmxpcCB3aXRoIHRoaXMg
dW5zdXBwb3J0ZWQgZm9ybWF0cyBsZWFkcyB0byBhIGZsaXAgZmFpbHVyZS4gSW4gb3JkZXIgdG8g
b3ZlcmNvbWUgdGhpcyBpZiB0aGUgS01EIHNlbmRzIHRoZSBsaXN0IG9mIHN1cHBvcnRlZCBwaXhl
bCBmb3JtYXRzLCBjb21wb3NpdG9yIGNhbiB2ZXJpZnkgZm9yIHRoZSBzYW1lIGFuZCB0aGVuIHNl
bmQgdGhlIGZsaXAgcmVxdWVzdC4NClRoaXMgY2FuIGJlIGFjaGlldmVkIGluIHR3byBvcHRpb25z
LiBUaGUgb3B0aW9ucyBhcmUgbGlzdGVkIGJlbG93IGluIHRoZSBwYXRjaCBoZWFkZXIgYW5kIGV4
cGVjdGVkIHNvbWUgcmV2aWV3IGNvbW1lbnRzIG9yIHN1Z2dlc3Rpb24gYXMgdG8gd2hpY2ggb3B0
aW9uIHRvIHVzZSENCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gDQo+ID4NCj4gPiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+ID4gQXJ1
biBSIE11cnRoeQ0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPg0KPiA+ID4gPg0KPiA+
ID4gPiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+ID4gPiA+IEFydW4gUiBNdXJ0aHkNCj4gPiA+ID4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ID4NCj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5
QGludGVsLmNvbT4NCj4gPiA+ID4gPiBTZW50OiBUdWVzZGF5LCBKdWx5IDksIDIwMjQgMToxNyBQ
TQ0KPiA+ID4gPiA+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+ID4g
PiA+IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+ID4gPiBDYzogTXVydGh5
LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+ID4gPiA+IFN1YmplY3Q6IFtQ
QVRDSF0gUkZDOiBkcm0vZHJtX3BsYW5lOiBFeHBvc2UgdGhlIHBsYW5lIGNhcGFiaWxpdHkNCj4g
PiA+ID4gPiBhbmQgaW50ZXJvcGVyYWJpbGl0eQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gRWFjaCBw
bGFuZSBoYXMgaXRzIG93biBjYXBhYmlsaXR5IG9yIGludGVyb3BlcmFiaWxpdHkgYmFzZWQgb24N
Cj4gPiA+ID4gPiB0aGUgaGFyd2FyZSByZXN0cmljdGlvbnMuIElmIHRoaXMgaXMgZXhwb3NlZCB0
byB0aGUgdXNlciwgdGhlbg0KPiA+ID4gPiA+IHVzZXIgY2FuIHJlYWQgaXQgb25jZSBvbiBib290
IGFuZCBzdG9yZSB0aGlzLiBMYXRlciBjYW4gYmUgdXNlZA0KPiA+ID4gPiA+IGFzIGEgbG9va3Vw
IHRhYmxlIHRvIGNoZWNrIGEgY29ycmVzcG9uZGluZyBjYXBhYmlsaXR5IGlzDQo+ID4gPiA+ID4g
c3VwcG9ydGVkIGJ5IHBsYW5lIHRoZW4gb25seSBnbyBhaGVhZCB3aXRoIHRoZSBmcmFtZWJ1ZmZl
cg0KPiBjcmVhdGlvbi9jYWxsaW5nIGF0b21pY19pb2N0bC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IEZvciBFeDogVGhlcmUgYXJlIGZldyByZXN0aWN0aW9uIGFzIHRvIGFzeW5jIGZsaXAgZG9lc250
IHN1cHBvcnQNCj4gPiA+ID4gPiBhbGwgdGhlIGZvcm1hdHMvbW9kaWZpZXJzLiBTaW1pbGFyIHJl
c3RyaWN0aW9ucyBvbiBzY2FsaW5nLiBXaXRoDQo+ID4gPiA+ID4gdGhlIGF2YWlsYWJpbGlsdHkg
b2YgdGhpcyBpbmZvIHRvIHVzZXIsIGZhaWx1cmVzIGluIGF0b21pY19jaGVjaw0KPiA+ID4gPiA+
IGNhbiBiZSBhdm9pZGVkIGFzIHRoZXNlIGFyZSBtb3JlIHRoZSBoYXJkd2FyZSBjYXBhYmlsaXRp
ZXMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGVyZSBhcmUgdHdvIG9wdGlvbnMgb24gaG93IHRo
aXMgY2FuIGJlIGFjaGVpdmVkLg0KPiA+ID4gPiA+IE9wdGlvbiAxOg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gQWRkIGEgbmV3IGVsZW1lbnQgdG8gc3RydWN0IGRybV9tb2RlX2dldF9wbGFuZSB0aGF0
IGhvbGRzIHRoZQ0KPiA+ID4gPiA+IGFkZHIgdG8gdGhlIGFycmF5IG9mIGEgbmV3IHN0cnVjdC4g
VGhpcyBuZXcgc3RydWN0IGNvbnNpc3RzIG9mDQo+ID4gPiA+ID4gdGhlIGZvcm1hdHMgc3VwcG9y
dGVkIGFuZCB0aGUgY29ycmVzcG9uZGluZyBwbGFuZSBjYXBhYmlsaXRpZXMuDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBPcHRpb24gMjoNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoZXNlIGNhbiBiZSBl
eHBvc2VkIHRvIHVzZXIgYXMgYSBwbGFuZSBwcm9wZXJ0eSBzbyB0aGF0IHRoZQ0KPiA+ID4gPiA+
IHVzZXIgY2FuIGdldCB0byBrbm93IHRoZSBsaW1pdGF0aW9uIGFoZWFkIGFuZCBhdm9pZCBmYWls
dXJlcyBpbg0KPiBhdG9taWNfY2hlY2suDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBVc3VhbGx5IGF0
b21pY19nZXRfcHJvcGVydHkgaXMgY29udHJvbGxlZCBvdmVyIHRoZSBzdGF0ZSBzdHJ1Y3QNCj4g
PiA+ID4gPiBmb3IgdGhlIHBhcmFtZXRlcnMvZWxlbWVudHMgdGhhdCBjYW4gY2hhbmdlLiBCdXQg
aGVyZSB0aGVzZQ0KPiA+ID4gPiA+IGNhcGFiaWxpdGllcyBvciB0aGUgaW50ZXJvcGVyYWJpbGl0
aWVzIGFyZSByYXRoZXIgaGFyZHdhcmUNCj4gPiA+ID4gPiByZXN0cmljdGlvbnMgYW5kIHdvbnQg
Y2hhbmdlDQo+ID4gPiBvdmVyIGZsaXBzLg0KPiA+ID4gPiA+IEhlbmNlIGhhdmluZyBhcyBhIHBs
YW5lX3Byb3BlcnR5IG1heSBub3QgbWFrZSBtdWNoIHNlbnNlLg0KPiA+ID4gPiA+IE9uIHRoZSBv
dGhlciBoYW5kLCBPcHRpb24gMSBpbmNsdWRlIGNoYW5nZXMgaW4gdGhlIHVhcGkgc3RydWN0DQo+
ID4gPiA+ID4gZHJtX21vZGVfZ2V0X3BsYW5lLiBTaG91bGRudCBoYXZlIGltcGFjdCBvbiBiYWNr
d2FyZA0KPiA+ID4gPiA+IGNvbXBhdGliaWxpdHksIGJ1dCBpZiB1c2Vyc3BhY2UgaGFzIHNvbWUg
aW1wbGVtZW50YXRpb24gc28gYXMgdG8NCj4gPiA+ID4gPiBjaGVjayB0aGUgc2l6ZSBvZiB0aGUg
c3RydWN0LCB0aGVuIGl0IG1pZ2h0IGEgY2hhbGxlbmdlLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+
ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGku
YyB8ICAzICsrKw0KPiA+ID4gPiA+ICBpbmNsdWRlL2RybS9kcm1fcGxhbmUuaCAgICAgICAgICAg
fCAgOCArKysrKysrKw0KPiA+ID4gPiA+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggICAg
ICAgfCAyMCArKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQs
IDMxIGluc2VydGlvbnMoKykNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID09PT09PT09PT09PT1PcHRp
b24gMj09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0KPiA+ID4gPiA+IGIvZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jDQo+ID4gPiA+ID4gaW5kZXggMjJiYmIyZDgz
ZTMwLi5iNDYxNzdkNWZjOGMgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9hdG9taWNfdWFwaS5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9h
dG9taWNfdWFwaS5jDQo+ID4gPiA+ID4gQEAgLTYzMSw2ICs2MzEsOSBAQCBkcm1fYXRvbWljX3Bs
YW5lX2dldF9wcm9wZXJ0eShzdHJ1Y3QNCj4gPiA+ID4gPiBkcm1fcGxhbmUgKnBsYW5lLA0KPiA+
ID4gPiA+ICAgICAgICAgICAqdmFsID0gc3RhdGUtPmhvdHNwb3RfeDsNCj4gPiA+ID4gPiAgIH0g
ZWxzZSBpZiAocHJvcGVydHkgPT0gcGxhbmUtPmhvdHNwb3RfeV9wcm9wZXJ0eSkgew0KPiA+ID4g
PiA+ICAgICAgICAgICAqdmFsID0gc3RhdGUtPmhvdHNwb3RfeTsNCj4gPiA+ID4gPiArIH0gZWxz
ZSBpZiAocHJvcGVydHkgPT0gY29uZmlnLT5wcm9wX3BsYW5lX2NhcHMpIHsNCj4gPiA+ID4gPiAr
ICAgICAgICAgKnZhbCA9IChzdGF0ZS0+cGxhbmVfY2FwcykgPw0KPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgIHN0YXRlLT5wbGFuZV9jYXBzLT5iYXNlLmlkIDogMDsNCj4gPiA+ID4gPiAgIH0g
ZWxzZSB7DQo+ID4gPiA+ID4gICAgICAgICAgIGRybV9kYmdfYXRvbWljKGRldiwNCj4gPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgIltQTEFORTolZDolc10gdW5rbm93biBwcm9wZXJ0
eQ0KPiA+ID4gW1BST1A6JWQ6JXNdXG4iLCBkaWZmDQo+ID4gPiA+ID4gLS1naXQgYS9pbmNsdWRl
L2RybS9kcm1fcGxhbmUuaCBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oIGluZGV4DQo+ID4gPiA+
ID4gZGQ3MThjNjJhYzMxLi5kZmU5MzE2NzdkMGEgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvaW5j
bHVkZS9kcm0vZHJtX3BsYW5lLmgNCj4gPiA+ID4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fcGxh
bmUuaA0KPiA+ID4gPiA+IEBAIC0yNjAsNiArMjYwLDE0IEBAIHN0cnVjdCBkcm1fcGxhbmVfc3Rh
dGUgew0KPiA+ID4gPiA+ICAgICogZmxvdy4NCj4gPiA+ID4gPiAgICAqLw0KPiA+ID4gPiA+ICAg
Ym9vbCBjb2xvcl9tZ210X2NoYW5nZWQgOiAxOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArIC8q
Kg0KPiA+ID4gPiA+ICsgICogQHBsYW5lX2NhcHM6DQo+ID4gPiA+ID4gKyAgKg0KPiA+ID4gPiA+
ICsgICogQmxvYiByZXByZXNlbnRpbmcgcGxhbmUgY2FwY2FiaWxpdGVzIGFuZCBpbnRlcm9wZXJh
YmlsaXR5Lg0KPiA+ID4gPiA+ICsgICogVGhpcyBlbGVtZW50IGlzIGEgcG9pbnRlciB0byB0aGUg
YXJyYXkgb2Ygc3RydWN0IGRybV9mb3JtYXRfYmxvYi4NCj4gPiA+ID4gPiArICAqLw0KPiA+ID4g
PiA+ICsgc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpwbGFuZV9jYXBzOw0KPiA+ID4gPiA+ICB9
Ow0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IGRybV9yZWN0DQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiA9PT09PT09PT09PT09T3B0aW9uIDE9PT09PT09PT09PT09PT09
PT09PT09PT0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkv
ZHJtL2RybV9tb2RlLmgNCj4gPiA+ID4gPiBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCBp
bmRleCBkMzkwMDExYjg5YjQuLjBiNWMxYjY1ZWY2Mw0KPiA+ID4gPiA+IDEwMDY0NA0KPiA+ID4g
PiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0KPiA+ID4gPiA+ICsrKyBiL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0KPiA+ID4gPiA+IEBAIC0zMTIsNiArMzEyLDIwIEBA
IHN0cnVjdCBkcm1fbW9kZV9zZXRfcGxhbmUgew0KPiA+ID4gPiA+ICAgX191MzIgc3JjX3c7DQo+
ID4gPiA+ID4gIH07DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiArI2RlZmluZSBEUk1fRk9STUFUX1BM
QU5FX0NBUF9MSU5FQVJfVElMRSBCSVQoMCkNCj4gPiA+ID4gPiArI2RlZmluZSBEUk1fRk9STUFU
X1BMQU5FX0NBUF9YX1RJTEUgICAgICAgICAgICAgIEJJVCgxKQ0KPiA+ID4gPiA+ICsjZGVmaW5l
IERSTV9GT1JNQVRfUExBTkVfQ0FQX1lfVElMRSAgICAgICAgICAgICAgQklUKDIpDQo+ID4gPiA+
ID4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9QTEFORV9DQVBfWWZfVElMRSAgICAgICAgICAgICBCSVQo
MykNCj4gPiA+ID4gPiArI2RlZmluZSBEUk1fRk9STUFUX1BMQU5FX0NBUF9BU1lOQ19GTElQICAg
ICAgICAgIEJJVCg0KQ0KPiA+ID4gPiA+ICsjZGVmaW5lIERSTV9GT1JNQVRfUExBTkVfQ0FQX0ZC
QyAgICAgICAgIEJJVCg1KQ0KPiA+ID4gPiA+ICsjZGVmaW5lIERSTV9GT1JNQVRfUExBTkVfQ0FQ
X1JDICAgICAgICAgICAgICAgICAgQklUKDYpDQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICtzdHJ1
Y3QgZHJtX2Zvcm1hdF9ibG9iIHsNCj4gPiA+ID4gPiArIF9fdTY0IG1vZGlmaWVyOw0KPiA+ID4g
PiA+ICsgX191MzIgcGxhbmVfY2FwczsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gK307DQo+ID4g
PiA+ID4gKw0KPiA+ID4gPiA+ICAvKioNCj4gPiA+ID4gPiAgICogc3RydWN0IGRybV9tb2RlX2dl
dF9wbGFuZSAtIEdldCBwbGFuZSBtZXRhZGF0YS4NCj4gPiA+ID4gPiAgICoNCj4gPiA+ID4gPiBA
QCAtMzU1LDYgKzM2OSwxMiBAQCBzdHJ1Y3QgZHJtX21vZGVfZ2V0X3BsYW5lIHsNCj4gPiA+ID4g
PiAgICAqIHN1cHBvcnRlZCBieSB0aGUgcGxhbmUuIFRoZXNlIGZvcm1hdHMgZG8gbm90IHJlcXVp
cmUgbW9kaWZpZXJzLg0KPiA+ID4gPiA+ICAgICovDQo+ID4gPiA+ID4gICBfX3U2NCBmb3JtYXRf
dHlwZV9wdHI7DQo+ID4gPiA+ID4gKyAvKioNCj4gPiA+ID4gPiArICAqIEAgZm9ybWF0X2Jsb2Jf
cHRyOiBQb2ludGVyIHRvIHRoZSBhcnJheSBvZiBzdHJ1Y3QgZHJtX2Zvcm1hdF9ibG9iLg0KPiA+
ID4gPiA+ICsgICogU3BlY2lmeSB0aGUgcGxhbmUgY2FwYWJpbGl0ZXMvcmVzdHJpY3Rpb25zIHcu
ci50DQo+ID4gPiA+ID4gKyB0aWxpbmcvc3luYy1hc3luYw0KPiA+ID4gPiA+ICsgICogZmxpcHMg
ZXRjDQo+ID4gPiA+ID4gKyAgKi8NCj4gPiA+ID4gPiArIF9fdTY0IGZvcm1hdF9ibG9iX3B0cjsN
Cj4gPiA+ID4gPiAgfTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICBzdHJ1Y3QgZHJtX21vZGVfZ2V0
X3BsYW5lX3JlcyB7DQo+ID4gPiA+ID4gLS0NCj4gPiA+ID4gPiAyLjI1LjENCj4gPiA+ID4NCj4g
PiA+DQo+ID4gPiAtLQ0KPiA+ID4gV2l0aCBiZXN0IHdpc2hlcw0KPiA+ID4gRG1pdHJ5DQo+IA0K
PiANCj4gDQo+IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQo=
