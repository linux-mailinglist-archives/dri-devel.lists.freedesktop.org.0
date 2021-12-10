Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9031346FC9F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C8A10E405;
	Fri, 10 Dec 2021 08:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A784710E40F;
 Fri, 10 Dec 2021 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639124439; x=1670660439;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+w0es0lvsrOpMQqSv4ZUI6mTVfFNsvI436JgedIx6xw=;
 b=nMOygMSDP1r7prVlWemdE8DCgyxeOu4SDcTsEDZ0QMmW2fOKpoeJqTPS
 nSHOwKihKLMI2saA2SBDhpPC/S/s4v+rroGUSS9BT7KZ0r4+Ly/81dtsm
 SPCIIpeM6kpHBHUG90tZ1ZRAgO2VKc40nuS+9/mawF4z9GcOfGHaalwgh
 MQWnpVqIjsZbQUbnxniZ+Ii1O8iez5rv0U9lOsJH/ukhERJ9q4CD/BwQ2
 P7sfQ/ZypSH0l1kx4b82ZFA8XeOgUnQM9wzOAuSC+TKkLMUSVp37GfuMS
 a8ot/odeH3MQ69JojOXvLm2qujqBphnL+9V22WWLcGkJ1zXhBxtclcO9x A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="238104383"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="238104383"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 00:20:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="750674013"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 10 Dec 2021 00:20:38 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:20:37 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:20:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 00:20:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 00:20:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+2yiuiljGhH6VE7uryCjVC1AyZ7WSElsFzXsw0RR9IQqMiwJjxtmYtauWTLubrKaKFz2a3rDFeeW5pos/if+L8IAS1uziHeObXMvB5FCZR8k1lIjn+fWQrEnZ+/dcfqXOzCysNUhyBKrw67FfubkN2L1ZLi7nHPjDWFSPGIWpY5q76+umOuZkQJfPrHUBJbjek7l76jEy6CPPasDwoKikcgYHiguw3DM2nX4WXyTsvPpmr6wcF0tCFTYR4TIQ0rHyaSqJcWcMCk4NJ6lsAYuoypaJKRcMLdDCLcC7UPi4D5L26tR+5Kwdtkyp//mrAs1VxmbbofKHyDoUocDbWcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+w0es0lvsrOpMQqSv4ZUI6mTVfFNsvI436JgedIx6xw=;
 b=m+o04T8SosEIs7skF0XHdQes+3xEEL6+zVGa+mODJYDTqztqndcBDGfvdsEUD1u/O6oZl/UglrHbqRZvdUeFZzXXAZ9Z36+zH99si5Vqo7LxCmiE7Bchz/jQh0hbkMw/XgiQpWZ8yqwD0DbueC34YDU6ZbllSV/vC9SiZB3/twOW9L7Nrk823pt03CUyxw5CRu0Bvsu8Rk0Paeh4p8YOKwokXCQEVBeXN/Cag06LcpVmIBW9geiJbwMOtmh8G9vM8kHe2sxQ3w1p6C6BNjwsibVO1GqWW4cOzhHQC/923l6J0rjv48glO7L85QqFWC7XR3Qg2Hhey/9GW/2UlPcNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+w0es0lvsrOpMQqSv4ZUI6mTVfFNsvI436JgedIx6xw=;
 b=Z/Tcu6GyvEx1vwXDMEmdHoKORO/JrUqoCa4W3s3V2sFHYeC27tlsqSXpDimVuSykHga/vx9rE7AJr77w6B8zWqtL5uPMQmTZjyrgId1MZ2b0Qx8IffXcYLeSmAgV6aDEi0fyukdpgDvwgAqWllwPxjbNUEk4tnM6mPS5/4726Bo=
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by BN6PR11MB4178.namprd11.prod.outlook.com (2603:10b6:405:84::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 08:20:36 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd%9]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 08:20:36 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 8/9] drm/i915/gvt: Constify gtt_type_table_entry
Thread-Topic: [PATCH 8/9] drm/i915/gvt: Constify gtt_type_table_entry
Thread-Index: AQHX6P2AtMG4xHoNYEygyqnZ+GQQ1Kwra6GA
Date: Fri, 10 Dec 2021 08:20:36 +0000
Message-ID: <ca1e18e8-4d03-2d16-0406-b7b35619db8f@intel.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
 <20211204105527.15741-9-rikard.falkeborn@gmail.com>
In-Reply-To: <20211204105527.15741-9-rikard.falkeborn@gmail.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 829a2210-59d0-4def-8c82-08d9bbb5f148
x-ms-traffictypediagnostic: BN6PR11MB4178:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB4178BDDA10F6172770110C03CA719@BN6PR11MB4178.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K8JElQytKJnz5mNx5B72/M18UOwBSBjp041F4pvk3YB7VYF5dJRLmxiqpleMVhjpWXRoFSK7QZa6TnABH/5tnOjxb62sr53X7G0eCkD5ehKyeu1EuIIc8xjeaLO46t+nXdjzfoTsGN26758qK/lepRVRWvy54X2kJRzUiLox0Hqtx0vhECYv5XOFWMaMeag5HumQUxegc2SkCc4v21xt/LTI4gtbp5PMYBI0dVG86PF/Mmd26sQ2a/HLlS2r2/jIhzdBZEmyhKbwrS/oTWNgm3wXHvG/eSg6dOp8aSpOdv/l8FaLe87i6Kg3wFNQnCEMQ3PKlfEk5eMu7a0FU+DtkNWfECmjxC2uiNswKxhmVPAfZ75ycoOcnlx45l8umkZ2PFMIPHQhKlUNyQmpurUy0SI66/x7tfaSd4RvA9gonWazsiCEwtE03euBS3JDIkQ5nQYMbYa5gLlWdmkFHz10AKLmtwON05JK49Xi0uoKwy+AwxOYI/yQkQJbdsTAcjkNxMzYlDoo7g+tFN+lXEU0v0pjH1wnefAfVSntVpUR6cJDbqZPNuZk1qYs+5hdFFLOYhiI9lEPaRC6n/TrEr4WpYnLZpypiSi93UhQJ6te7rTVV+2jz7fkeqebHFlDWxhwOi2JTuG18RcPHsgOG/F1iJcdeJPz+RyFL745YQ/VEW1jXmyk37tBXPkYEerKPTpGL17jscBMXycsDjZirXMjdMgkoT8j+y24e5vK9JBPm97yuHE4MNECrpeFpigp0oaVlsezZCfebJkS0tjus6ZX/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(83380400001)(38070700005)(31686004)(2906002)(36756003)(7416002)(64756008)(186003)(54906003)(86362001)(316002)(31696002)(8676002)(66476007)(71200400001)(91956017)(76116006)(110136005)(508600001)(66946007)(66556008)(38100700002)(4744005)(26005)(2616005)(82960400001)(53546011)(6512007)(6506007)(5660300002)(4326008)(122000001)(6486002)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjlnN1FGZVZFR2NzdXBCN05xcDE2aVRUZXRXSkpiY0ZxQVIyQ0lVK29vT1BM?=
 =?utf-8?B?OEQ0eWJSQ21JZEtBY3dQaUkyMjdacHh3SlJkWEZrSjd6Mm90MHVPZnhYaE5a?=
 =?utf-8?B?SmdsdnV5M2diZUxJZlBtdGdUTGtXY1RhWk9RVmxJSXBxck9GODFpMmxJcUNu?=
 =?utf-8?B?NG9WTklsZThzODE0TFNWZUdGT0IyZnprREpIOFJYTkJXR0paS0tSUldtTnAy?=
 =?utf-8?B?TzVYenRhaGROaXRDd01EL1hDazg1WG5SbjBlY2VFSURrV3pBd2tvdUdXTGx1?=
 =?utf-8?B?WTlzNzYyYmY1L3BKTWlGdHNqN3VuUWRGbHZFSkE0dXJjT09TYmhSazNYYkpZ?=
 =?utf-8?B?QVZPR0RsRFpzTlZ2Y1VZTEZlQVhhYTBVSVRVdVZYaGZKTU1qRnRpTUlneGRk?=
 =?utf-8?B?dklGRjF0bnVKd0xrZm1JZ2hLUnBxN1lWYTIyTHY3RkpDQUFMalVJQUNnTU1H?=
 =?utf-8?B?WnRQc2NycUYzNWo0SitOYzJ5bTgxVHdWZ1crekZFNHMwTGs4cEtVWjh5bm1j?=
 =?utf-8?B?V3ZIRHlHMWJXR3UvNWVCZGZxNTZhZERJanNIZzlQSG9lMzRRYlo2RkU4V08x?=
 =?utf-8?B?SVFmZVdPRGw1VThDZDAyWFlaM1U0TDRGZ21IY2dMZ3hSUUQveDRuVUlGa2lP?=
 =?utf-8?B?SzdnR2w3Rnl2S1VSTzVjOEJYTkJOZ0JTblBSUktvT09CS3JEc2ducXdZV1VS?=
 =?utf-8?B?a1FweFovOWVtc3ZEVW4zN09oTHFvdTBGdit5NVlFVE5RcmI1aUxlSm1veXFu?=
 =?utf-8?B?dS85VWxkSG5NdGc2V3FTend2NzA2SzlwUzhzeEI0eUYwQ3g3VU0xeXBjR0RV?=
 =?utf-8?B?SHhtMWdMcUlLYlJzVElUdVVMOHlNUDNXYy8xNjV4Um9VNjM3TW82TU5IRGFv?=
 =?utf-8?B?NnVqcTE0Nk9TbEhUOVZlZTI5aDJkZm5vL0U5Q0pzK2RwOTRFaXo4QnFGTzdH?=
 =?utf-8?B?ZzRjWFU2NlRyTEdrUVF4My9IdW1qYzJ5YldsZVZoYkc3TXNCa1M0ZU9sV2px?=
 =?utf-8?B?L2poaFBjS0RvQU5PSDlTMHlSQlJwT1c0Y01ZRUNhMXAyMmhXQ0dYYU40eWtT?=
 =?utf-8?B?MTc4VWFQeHBwWUhlK2h4NzVKckdGMlYvZGt3Z2JPWDUwc21ZNXhFMFJST3lR?=
 =?utf-8?B?TFAra2JmdUdhMnpINUZEZ1pOWkFnSHZYTEF1T1I5d3hXdHQ4ai9SZ0dNKys4?=
 =?utf-8?B?UE14cmp3NHlleTJ2MFVHTnl3L3pEZDRwNldidW52c2hBZGRPcnhwUEVtWjdu?=
 =?utf-8?B?elZSbDkyRURraG5FWk9VZi9SUmlDUjlsQUdXNVVtTDlidzlGdE1jWUZjS05P?=
 =?utf-8?B?bGZnT1ZqTFJHT3EwSi93Rk5Ta2k0NWc0bFMrQitOM0RIVU9aUXlvNnJVKzBO?=
 =?utf-8?B?L3hsMnNCRVFaMy9TZnFFMERjWlFJWmpnelR6dm5KbWJrRWUrMVJCaStUa0FE?=
 =?utf-8?B?SFRsWm9ZTzBIMi9ET3hrdU96ZGdnTjlMa241cnJKRGlFWmR2YTk0M1labFpK?=
 =?utf-8?B?UStmV2NQRlZjZnF6bGRxU1dOSng1Z3dZR0tmZlFDaGFBNm1GSm5SZ255Y3dy?=
 =?utf-8?B?NzBNQ1VPUU9BTmZPT2dKZ0xDNHo2SXcveGRUZ2tveExOdTQzSUZhSVdKVFky?=
 =?utf-8?B?Sm14UFMySm1jWHIxU3NsWnEwaUVwcVN2SklMTHBTZEFDT1IwRThRcm5nUXVs?=
 =?utf-8?B?YnJzbzFnd3pSMmF2M3NIZ1hOc0YwMlo1Y3pXcEQ0VythOVRNMlpBQjRDWUk4?=
 =?utf-8?B?N0wvQmdWUTkxRUFBLzR5VVhiS0NuaUV2bkJtbjVNamFLSXp3WlYreEx0bS9v?=
 =?utf-8?B?dmZXWEJjTlNlU3RwOHB0d3lGNC9FWktUbC9CdWYrdHdtdDcveWxiS0Z6UTFO?=
 =?utf-8?B?TWtTOU5oSGNJSThmRndDMXRERUVtV3Jtejl2d2NmNnJ4eWJuSzVXWWVLamM1?=
 =?utf-8?B?NGVwZUw5VG9NRDNiSXl1Wkh0dUhGT2NKN0FUb0RGb2hHVDBrVFZtQlV5V3hX?=
 =?utf-8?B?eFVMUzUrSTV6TFRwYmhBbVBJbCtEdUpqUmE3YUprR1k2TGllZCtvZHdYb29u?=
 =?utf-8?B?cWp4QW5vc0Vxb2pHOVl4bElmNzhMc3dDT3ZHZ1B5b2Q0ejRhaExpYTVlU285?=
 =?utf-8?B?Q2w5U2xyKzFlSkdUR25pTGh3ZFk4djc0VmNWN2txcVhOWDVZRXY4a0owL2Yx?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C35A8444936DF24C86F48230EDFE8B61@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 829a2210-59d0-4def-8c82-08d9bbb5f148
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 08:20:36.0248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TO+oJCes/zbxedTqFP/0fMjt8P7JGIKl9bpdLRzAvVQUQCfrfoPtSHColEUCG1qz3TC1YZsO1oqkETX/ww3JZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4178
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvNC8yMDIxIDEyOjU1IFBNLCBSaWthcmQgRmFsa2Vib3JuIHdyb3RlOg0KPiBJdCBpcyBu
ZXZlciBtb2RpZmllZCwgc28gbWFrZSBpdCBjb25zdCB0byBhbGxvdyB0aGUgY29tcGlsZXIgdG8g
cHV0IGl0DQo+IGluIHJlYWQtb25seSBtZW1vcnkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFJpa2Fy
ZCBGYWxrZWJvcm4gPHJpa2FyZC5mYWxrZWJvcm5AZ21haWwuY29tPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMNCj4g
aW5kZXggYzhjZDZiZjI4ZWE4Li42MTQxNTY4NTZmMTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndHQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmMNCj4gQEAgLTE4NSw3ICsxODUsNyBAQCBzdHJ1Y3QgZ3R0X3R5cGVfdGFibGVfZW50cnkg
ew0KPiAgIAkJLnBzZV9lbnRyeV90eXBlID0gcHNlX3R5cGUsIFwNCj4gICAJfQ0KPiAgIA0KPiAt
c3RhdGljIHN0cnVjdCBndHRfdHlwZV90YWJsZV9lbnRyeSBndHRfdHlwZV90YWJsZVtdID0gew0K
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBndHRfdHlwZV90YWJsZV9lbnRyeSBndHRfdHlwZV90YWJs
ZVtdID0gew0KPiAgIAlHVFRfVFlQRV9UQUJMRV9FTlRSWShHVFRfVFlQRV9QUEdUVF9ST09UX0w0
X0VOVFJZLA0KPiAgIAkJCUdUVF9UWVBFX1BQR1RUX1JPT1RfTDRfRU5UUlksDQo+ICAgCQkJR1RU
X1RZUEVfSU5WQUxJRCwNCg0KUmV2aWV3ZWQtYnk6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVs
LmNvbT4NCg0K
