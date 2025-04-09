Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF0AA82115
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 11:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E598910E837;
	Wed,  9 Apr 2025 09:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aKk2Fybi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9D610E81F;
 Wed,  9 Apr 2025 09:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744191222; x=1775727222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MKiONanr/XYBwMRd8gXnGNInqHZ6hciEso3Xfv9Mq5U=;
 b=aKk2Fybi+R1YkwCJTJQu+NKLxrodXR+KqtlC/NXPE3jbQh819J4U2XKU
 6ct4Lt6DLM0uFMzMijAHIYJh7p82DMQYychKZjGKUoD+eWc6rTrycJpHd
 yfqxTU/uoRXMyamJvfpKXBnAYsayJThCPMvk6o1Mw2zN55PI+J318cAVr
 gXvuWZV3FEwgo0lGw6E3ephCXleqSHluRKRfPzfvR2mLlVoBWQ7AtIYOj
 SissgYuseMb9XzIoTf2/kfVyGCGt0ko+DgmrarMTIJQa1CtQs35XUBd5H
 zQb59QRr7f+oAy9ue5yBXWXQeOn2IRQiomuPSLPs0DeXD5Fe/qVZpKaZ3 g==;
X-CSE-ConnectionGUID: +HWaphNNRomductyTHu44w==
X-CSE-MsgGUID: qApNUCg/TYG7DGK8vrFnjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45670215"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="45670215"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 02:33:40 -0700
X-CSE-ConnectionGUID: PzY14DsaTgaT5JrJit4RxA==
X-CSE-MsgGUID: T3XT0J+XRoScQNEBkitrlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="128444747"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 02:33:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 02:33:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 02:33:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 02:33:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYDlvxlLIM2wF7wwfXxVY5w3/LKUklGgEJtscxb1EDmeq7/WqKLTtpKxtKxWzQ++YUGik9w9npDTNU7wQOh2hLwncEtGeGgSML12hPEnrn3NUUvkI1HC9AIsboeL9/Rs4nAjHIall4OMroTs8BYhEDyTHKT56KryBkhkc3ar8usSkKSGSKmkvyn4rdRSQTX5lrV8r4Hen/iHpDn9nZmJBsixaR3dm0veLExTChFC40W51ur1ydBpzoToQY2QgMe6CmfI/OdvCt6WEdpSFqC/t2xdR6aJTx74dlFa0/Ra7VpytrESGNJc4A3g5lc85z2wcduUDwZvpq3O+8maHVr/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKiONanr/XYBwMRd8gXnGNInqHZ6hciEso3Xfv9Mq5U=;
 b=ZD2JCSzsTL7VUA1Bcdy4mgd7YTB1M+jADw5Hs0Ok4L74jDVMyu4GP1burhy+hcA6Juv8e+LN7oABGgIZgRiuXoN0XSi4GG4WarwoE2rG0BZmTG3CSlu+emLLxjP5gTAQtlT85cRXJhdp2QwnO/i+esi0+YboatReq9Pb4gHp+5VJW12qkXKQostm9cRuEdeCZgEruSIydiMwpSz4xjZZYpN90dThxrSlBNxY32EI/XL2z3DsbEWDxtBuIub2zaZEuF/fgQfb+FU9rHV3DBbKBXTuVV9T+SLIZhdFjknoMgVkhJiK0e8ejYoEDi2ay1AIUQZIHgKBoDV9P6DC7MIPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 09:33:12 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8606.035; Wed, 9 Apr 2025
 09:33:12 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, 
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 00/12] mtd: add driver for Intel discrete graphics
Thread-Topic: [PATCH v7 00/12] mtd: add driver for Intel discrete graphics
Thread-Index: AQHbnmT6FzF2AWGKfUOq+wjcS0j5p7OFzCuAgBVZc0A=
Date: Wed, 9 Apr 2025 09:33:12 +0000
Message-ID: <CY5PR11MB6366C5723305E479BE00494BEDB42@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
 <Z-RUEVrst6WWzDUa@intel.com>
In-Reply-To: <Z-RUEVrst6WWzDUa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DM3PR11MB8683:EE_
x-ms-office365-filtering-correlation-id: 0adbcbbd-bc54-44dd-7c27-08dd77498c12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bXg1M1NFcFdiV3FHTGRtUGhtMDZBY0ZPRjBxN2lZU1RDSWZWUnUxVDJMSHdX?=
 =?utf-8?B?T213L1BOTmRMZThIb2JUdVZTWlE1djh2NjNJNDVUWkYyMTFxVWdFa3lBbnlU?=
 =?utf-8?B?bE9tOThJd3hrbHFoa2NMTEt3WkhZNkxYeEV6dURqZ1FKVHlpd0FkeERkQ04z?=
 =?utf-8?B?REZlRTJmSjRMNTlaQjlpSDhHbS9OYXJZRmNCWU9xdm1NcVhVU0Z6am1mQnc4?=
 =?utf-8?B?VU96S28xckJIM25SY1hjSHk3QUhtZU0zRWN5KzlVSmFGb2xRV3RCbWR4UzVj?=
 =?utf-8?B?clR0NGtwNjlXNEhHempXdEk2WHhaVDF5QjBURzVQTnV0b3hwUy9NUmJtZlZS?=
 =?utf-8?B?ZE4wdE9FYTEya1BsR2JmNnFFdU1aZjU4bmN2S0ZYd3BmMHRIajdsZ0FrT2l5?=
 =?utf-8?B?REtuakJPczd5Wm93Q0YrT3JTZ3hGZ1ZqQkNlZmVPeGJCUTIzSTBwdmhhUWFD?=
 =?utf-8?B?cEFlUnF6NlRQU3RKWXErcjh3eHV6RDA0eU8zYjNzOElUSExRSU11MFJVMG9n?=
 =?utf-8?B?UE5nR1U1TVBlSjRTR3RyWGpRZUpiczJkVUkxaSt1L3k1STRPaWRLRURaR21v?=
 =?utf-8?B?Sm94aUlYWDV5bUFvYmMwa0dUYm8xeVJjRlZmR1MrcFpBKzNqblRoM1ByWm1T?=
 =?utf-8?B?eENlT3JUdkt2YWpxMCtwbFpFL3RoTVQxZlNidFJsNElBWHdTZG9hcC9aTDBs?=
 =?utf-8?B?WkV1ZVM4VnBqRUdJeTU5ak16TzlGZWFUWmhlZldzNHpaVUl0MzVURlNGWGRh?=
 =?utf-8?B?d1hZdVA3MHI4UzRCcXczSlVuVk1UQXB0ckNycnpHVjFTMUplL0x6cXdtcE1Y?=
 =?utf-8?B?UFlxQXhyS0ROOEY1RlF2SEFDdmxoVjlzOVFxODYvOGF1U2hyNHhyZW51blMr?=
 =?utf-8?B?S04zVGNpSXhRK0ovR1RCMG5Hc0dXRXlQMFVScmdpN1pRTlRNajU1bnUwQ0JS?=
 =?utf-8?B?dUR0S1orOFJIYTRobWhuS29WbDh5RmJhbVNrN2d0dWEzNmxaRGdPZ3lXbFNY?=
 =?utf-8?B?QkxTZVpXdi9hUG1MTld5dktnVzhoS25LSkd5QklZOHBDUWRjREJjMUZNYmhy?=
 =?utf-8?B?OHhiYjNsczlic0prV0RCWTl1cmVIdFJHblRHckpXY0lvTHc1WEpwcXM4OVlt?=
 =?utf-8?B?WTNiTXNPeDR5UGRpRE9Yczk5WFZKQkVGcU9nYWdMbDdIWk9WR210elFrWlZI?=
 =?utf-8?B?QXFqNDM1TVlha1BaZWxFNGIwaXBYTUl2TFEzOXl4WkxEU3QvT3U0VDlnanF0?=
 =?utf-8?B?QVhRaFhOQUJNWml1WU8xY3R5VEdHVWRONWVXMVNGaFBTR1hkZjg0V2dUUzRy?=
 =?utf-8?B?YVpiYTNuRFk5S3EvczV1YldUclpta0J5Q0FhcDFWNHM0aGtBajU5eXVVZ3gr?=
 =?utf-8?B?V0c5bUg3ZEhSTDh4amlZUW96c2tDaTBwZitrZTNpUUwrN05aTThyWXV2T3JG?=
 =?utf-8?B?S2VIbVAvS2o5NktMZ3BTQmdIYm1OQnI3UXlVeWlxSWhUSEE5VE1IWUU3WUg1?=
 =?utf-8?B?UlJydG5LV2w4YnFhbGphQVJhZFE5RFU5QkVJc1dxS1RoQTFNOFNyOEVaYlBG?=
 =?utf-8?B?ejJSWUw5YmNocFd2OUJmdUJCVVlWd0tvSEtzcnpTbUxVUml3dHlON2diTElw?=
 =?utf-8?B?SllPSFZRT3ZZNlB4TTN4eDE4T0tNQ1lWMXJtMm1wTGRrYkt1VzNmQzd1d0Zk?=
 =?utf-8?B?MEdFZkJibVJhMWVDN09DOEVRR3RFWnNBNDJNamMwY25hK3k5VllWOUF1SThY?=
 =?utf-8?B?d0RXMmJJWUZuZ2M3MjBlRngvVTZBWHArSEczSjVxNnljaHZMTjlGTDh6WDUy?=
 =?utf-8?B?Z015dk1Rc0p0T05haXVQQ0ZTQ25LMzE1bjRIdkVSb3dBRUhqaDk3dkVneUVt?=
 =?utf-8?Q?tEu5FlAKbH5wd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0ZtT0h0Z0RCMmNvNDFyR3IzZTBDaVR5MnZVaEozSkNUWkN6UWV4VWU3VXc1?=
 =?utf-8?B?eGlNQ2pkQWNxTkQ0Y3RSc0ZWOHNReE9XSDVBckNncjZ6bkpNUmt3NGljODRQ?=
 =?utf-8?B?bUltMGY3S2txT2QxNmhBSENzZXN4QnFUZWp6UWZjeFlVQkRBUHpNdythSGJk?=
 =?utf-8?B?ZzhVdjgwTFJ4NkRFbzlWT0d6TEJCYURjYWNrQytia29LemlRb1BPRnN2SWNC?=
 =?utf-8?B?K0NqSFptTWRDc1g0c1NXZzk1REhCSzRDUlpLK3lSSVZhMEg1bXQ4bnU0VU1V?=
 =?utf-8?B?M2VCTnROT1VMb1FwaGFpZVRzZm8xcWtUL1ZYYVBaSGRuUVFRWjRrUnRSL3c5?=
 =?utf-8?B?cW5lQXI0RnE1MjBkcE90VFBWbHVzN3BSS2dkbUtwU2RiL0FUTTNOMk1YczdO?=
 =?utf-8?B?aENwdW5jRGVXYytUazZvVnVQL21hTGNrWHpMRDc3VitJY2pzeFRLc2IydkJT?=
 =?utf-8?B?TVE3Wk5QN1daRko0am9lS2o5Sjcra3FTR2l6ek0yR1FGemZBWG1leVh4b1p2?=
 =?utf-8?B?UjJQNWxhbTVFcktJUmVrZ1FZOVBLVDFPVVVBSTYvZ3ZHMCtjeU9oRTE2UGxK?=
 =?utf-8?B?UlVzMytuTVZiY2l0bU1PUHZON0ZxWXBvdmxEbzQyZFRqMEFCdlEzSTk2SDM0?=
 =?utf-8?B?MGV1SE5QK0ZjMHFJaHdrNzkxV1V1ZEQ3c1ZyLzQ2U3AxWVB1dWpVb3d5MVRm?=
 =?utf-8?B?NmhmUm50bU1yVStYYkhJNEI3c1lGMUZiSHB2SzlzWlZVWkYycTdaaU1zaWJ2?=
 =?utf-8?B?aFFrTmJDY0pzZ2o1M2V5QnBmR3JYVERBTjRXU1NyUFYyS1NFeWozMTlkTmFG?=
 =?utf-8?B?RG5EQVlWb2Y5c0paWXRPTm1rNGw4dlJoc3dkWUtmZVNvNDgveXRDb0JZNWZ1?=
 =?utf-8?B?djhBa3Z0MnlLR2RhZmZHYTQzVi8wVXpJOWt1dDdvOTljSnJJWlNSa0hxbTRP?=
 =?utf-8?B?TzhmbThTTHYwV1pnODNqdzR1YzRyTnRsNTAvQ0dsc2l6OCtQUWJwdHUvOGpD?=
 =?utf-8?B?c2FUZ3l1WXFuS0dpNWFIZVZuZzlxUHdwbTFoK3lzMTlGUnJFNFYxaEIrcGli?=
 =?utf-8?B?MWJaZXJZSW5ZZkpJTXJlMHpXMWV5dFY0UWJvanhnVElJZjg2bzJ4WFJ2MHA3?=
 =?utf-8?B?NmJ3N0UwWkxJeXMvUXU2bG1HcWszdUJBRG1LSnoyczMvRjRoT0o0QlhuN1FX?=
 =?utf-8?B?RHlISzdNbkNWQTNJMVg5cytYQU5ZR29jTElFSVJZc1RLa1RjZUNFWDdVc2Zh?=
 =?utf-8?B?MXVEcTRpbVVWbTF5RGdwTXNiVVFWRUtVbVc2MjdSbDRnRHRaTm0wSWpmVDhW?=
 =?utf-8?B?bFpsTnVna2NtV043Y3k2cFJhUGFubmpxVVpEU05yK0o5eHBPNUErYm16d3g0?=
 =?utf-8?B?Qm45NDMycmdFOGlza2lkQ1NyZ3RZOUVFMWg5QnVpZnpKYk96TGlUS1lvdkNz?=
 =?utf-8?B?Rk5FTyt6aVUzOXo4ZndySXdyN3FnNXhLV3VWNnVOTnFkNnlpOGFNdUFJbCto?=
 =?utf-8?B?ZWZ4Wm4vblAwdUhhNUFzZVRteVlxRElPdm5PR05VRTVwOEhRUjRzbkhldjgr?=
 =?utf-8?B?YXA3alloeFVmalYrQk9pdmhyeHFhNitWc3J4eXBRTURGcW1mdlR2R1RDbXU4?=
 =?utf-8?B?UWREQ1RwN3EzRjB0aitDMFZ2YUxOcEJHbjJ4d1RYczdvUGprcGpRRVVVcW83?=
 =?utf-8?B?WVk1MlpsbWdsaTM0NTZrelU4T1U5NDVmNlRPN0VyZ3NIcEFPWWcyMjVuRkhp?=
 =?utf-8?B?cXdqVHBJSFlOT1VSK1U0YTN0eC9hckpIUFBxVFNMV0FVN0FnMUN5ajhzcjdl?=
 =?utf-8?B?ZmpwMWp3YjNJVHR6K0NIeXhpY1Y5UEZCamFDMzFrUlAyMmtJS2RtaWtYb1pL?=
 =?utf-8?B?UUd2UlltTEhPQW9GLzZXMHRxakh5RlFqZHNTRm1vaFloU0VFU1YxYldKK3lZ?=
 =?utf-8?B?bkdxYWQvZzVIUElxVXk5Z3JTRktkT3haeW9qRXNaaEhHM1dlUWlQejlzM0Rh?=
 =?utf-8?B?OTV6TWZNOTZXN0JQTTR2Ulc4Wm4vRjNweVRNRTFtZXlNdG5BcmxKT08yZDZX?=
 =?utf-8?B?SDhoMklpOWg3SGFZS29oOHFrSVZTYjNPc2RyY28rM2ZiY0dnWDVRSDhEOVly?=
 =?utf-8?Q?rbWkAcmKmc11PubGDueblt3kK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adbcbbd-bc54-44dd-7c27-08dd77498c12
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 09:33:12.2634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DC2dAkpokUVucnyxzKNKS9SaDwmHS3Gng0cQHzUgeA12cu82j6B9yE/GWsjjkXosXF72AzWC4K64vxs/8jcltbC4FFJvG1dm3lknEX9RznM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
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

PiBPbiBXZWQsIE1hciAyNiwgMjAyNSBhdCAwNToyNjoxMVBNICswMjAwLCBBbGV4YW5kZXIgVXN5
c2tpbiB3cm90ZToNCj4gPiBBZGQgZHJpdmVyIGZvciBhY2Nlc3MgdG8gSW50ZWwgZGlzY3JldGUg
Z3JhcGhpY3MgY2FyZA0KPiA+IGludGVybmFsIE5WTSBkZXZpY2UuDQo+ID4gRXhwb3NlIGRldmlj
ZSBvbiBhdXhpbGlhcnkgYnVzIGJ5IGk5MTUgYW5kIFhlIGRyaXZlcnMgYW5kDQo+ID4gcHJvdmlk
ZSBtdGQgZHJpdmVyIHRvIHJlZ2lzdGVyIHRoaXMgZGV2aWNlIHdpdGggTVREIGZyYW1ld29yay4N
Cj4gPg0KPiA+IFRoaXMgaXMgYSByZXdyaXRlIG9mICJkcm0vaTkxNS9zcGk6IHNwaSBhY2Nlc3Mg
Zm9yIGRpc2NyZXRlIGdyYXBoaWNzIg0KPiA+IGFuZCAic3BpOiBhZGQgZHJpdmVyIGZvciBJbnRl
bCBkaXNjcmV0ZSBncmFwaGljcyINCj4gPiBzZXJpZXMgd2l0aCBjb25uZWN0aW9uIHRvIHRoZSBY
ZSBkcml2ZXIgYW5kIHNwbGl0dGluZw0KPiA+IHRoZSBzcGkgZHJpdmVyIHBhcnQgdG8gc2VwYXJh
dGUgbW9kdWxlIGluIG10ZCBzdWJzeXN0ZW0uDQo+ID4NCj4gPiBUaGlzIHNlcmllcyBpbnRlbmRl
ZCB0byBiZSBwdXNoZWQgdGhyb3VnaCBkcm0teGUtbmV4dC4NCj4gPg0KPiA+IFYyOiBSZXBsYWNl
IGRldl8qIHByaW50cyB3aXRoIGRybV8qIHByaW50cyBpbiBkcm0gKHhlIGFuZCBpOTE1KSBwYXRj
aGVzLg0KPiA+ICAgICBFbmFibGUgTlZNIGRldmljZSBvbiBCYXR0bGVtYWdlIEhXICh4ZSBkcml2
ZXIgcGF0Y2gpDQo+ID4gICAgIEZpeCBvdmVyd3JpdGUgcmVnaXN0ZXIgYWRkcmVzcyAoeGUgZHJp
dmVyIHBhdGNoKQ0KPiA+ICAgICBBZGQgUm9kcmlnbydzIHItYg0KPiA+DQo+ID4gVjM6IFVzZSBk
ZXZtX3BtX3J1bnRpbWVfZW5hYmxlIHRvIHNpbXBsaWZ5IGZsb3cuDQo+ID4gICAgIERyb3AgcHJp
bnQgaW4gaTkxNSB1bmxvYWQgdGhhdCB3YXMgYWNjaWRlbnRhbGx5IHNldCBhcyBlcnJvci4NCj4g
PiAgICAgRHJvcCBIQVNfR1NDX05WTSBtYWNybyBpbiBsaW5lIHdpdGggbGF0ZXN0IFhlIGNoYW5n
ZXMuDQo+ID4gICAgIEFkZCBtb3JlIFJvZHJpZ28ncyByLWIgYW5kIE1pcXVlbCdzIGFjay4NCj4g
Pg0KPiA+IFY0OiBBZGQgcGF0Y2ggdGhhdCBhbHdheXMgY3JlYXRlcyBtdGQgbWFzdGVyIGRldmlj
ZQ0KPiA+ICAgICBhbmQgYWRqdXN0IG10ZC1pbnRlbC1kZyBwb3dlciBtYW5hZ2VtZW50IHRvIHVz
ZSB0aGlzIGRldmljZS4NCj4gPg0KPiA+IFY1OiBGaXggbWFzdGVyIGRldmljZSBjcmVhdGlvbiB0
byBhY2NvbW9kYXRlIGZvciBkZXZpY2VzIHdpdGhvdXQNCj4gPiAgICAgcGFydGl0aW9ucyAoY3Jl
YXRlIHBhcnRpdG9uZWQgbWFzdGVyIGluIHRoaXMgY2FzZSkNCj4gPiAgICAgUmViYXNlIG92ZXIg
bGF0ZXN0IGRybS14ZS1uZXh0DQo+ID4gICAgIEFkZCBhY2sncw0KPiA+IFY2OiBGaXggbWFzdGVy
IGRldmljZSByZWxlYXNlICh1c2UgcmlndGggaWRyIGluIHJlbGVhc2UpDQo+ID4gICAgIFJlYmFz
ZSBvdmVyIGxhdGVzdCBkcm0teGUtbmV4dA0KPiA+ICAgICBHcmFtbWFyIGFuZCBzdHlsZSBmaXhl
cw0KPiA+DQo+ID4gVjc6IEFkZCBwYXRjaCB3aXRoIG5vbi1wb3N0ZWQgZXJhc2Ugc3VwcG9ydCAo
Zml4IGhhbmcgb24gQk1HKQ0KPiA+ICAgICBSZWJhc2Ugb3ZlciBsYXRlc3QgZHJtLXhlLW5leHQN
Cj4gDQo+IFRoZXJlIGFyZSAyIHRoaW5ncyB0aGF0IEkgc2hvdWxkIGhhZCBub3RpY2VkIGVhcmxp
ZXIgYW5kIG1lbnRpb25lZCB0byB5b3UuDQo+IEknbSBzb3JyeSBmb3IgZm9yZ2V0dGluZyB0aGF0
Lg0KPiANCj4gMS4gUmViYXNlIG9uIGRybS10aXAgYnJhbmNoIG9mIHRoaXMgcmVwbzoNCj4gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS90aXANCj4gV2UgbWVyZ2UgdG8gZHJtLXhl
LW5leHQsIGJ1dCBkZXZlbG9wbWVudCBhbmQgQ0kgaGFwcGVucyBvbiBkcm0tdGlwLg0KPiANCj4g
Mi4gUGxlYXNlIGFsc28gc2VuZCB0byBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcgWGUg
Q0kgb25seSBydW5zIG9uIHRoYXQNCj4gbWFpbGluZyBsaXN0LiBpbnRlbC1nZnggaXMgZm9yIGk5
MTUuDQo+IA0KPiBObyBuZWVkIHRvIHJlYmFzZSBvciByZXNlbmQgcmlnaHQgbm93LiBMZXQncyB3
YWl0IGZvciBhIGZldyByZXZpZXdzLA0KPiB0aGVuIHdlIHJlYmFzZSBhbmQgcmVzZW5kLg0KPiAN
Cg0KRG8gbm90IHNlZSBmbG9jayBvZiByZXZpZXdlcnMgZm9yIHRoaXMgb25lLi4uDQpDYW4geW91
LCBwbGVhc2UsIHJldmlldyB0aGUgbGFzdCBwYXRjaD8gVGhpcyBvbmUgaXMgYSBuZXcgb25lLg0K
QWxsIG90aGVyIGFyZSBhbHJlYWR5IGFja2VkLg0KVGhlbiBJJ2xsIHJlLXNwaW4gdGhlIHNlcmll
cyB3aXRoIHJpZ2h0IGJhc2UgYW5kIGNjLg0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoNCj4g
VGhhbmtzLA0KPiBSb2RyaWdvLg0KPiANCj4gPg0KPiA+IEFibGl5ZXYsIFJldXZlbiAoMSk6DQo+
ID4gICBkcm0veGUvbnZtOiBhZGQgc3VwcG9ydCBmb3Igbm9uLXBvc3RlZCBlcmFzZQ0KPiA+DQo+
ID4gQWxleGFuZGVyIFVzeXNraW4gKDExKToNCj4gPiAgIG10ZDogY29yZTogYWx3YXlzIGNyZWF0
ZSBtYXN0ZXIgZGV2aWNlDQo+ID4gICBtdGQ6IGFkZCBkcml2ZXIgZm9yIGludGVsIGdyYXBoaWNz
IG5vbi12b2xhdGlsZSBtZW1vcnkgZGV2aWNlDQo+ID4gICBtdGQ6IGludGVsLWRnOiBpbXBsZW1l
bnQgcmVnaW9uIGVudW1lcmF0aW9uDQo+ID4gICBtdGQ6IGludGVsLWRnOiBpbXBsZW1lbnQgYWNj
ZXNzIGZ1bmN0aW9ucw0KPiA+ICAgbXRkOiBpbnRlbC1kZzogcmVnaXN0ZXIgd2l0aCBtdGQNCj4g
PiAgIG10ZDogaW50ZWwtZGc6IGFsaWduIDY0Yml0IHJlYWQgYW5kIHdyaXRlDQo+ID4gICBtdGQ6
IGludGVsLWRnOiB3YWtlIGNhcmQgb24gb3BlcmF0aW9ucw0KPiA+ICAgZHJtL2k5MTUvbnZtOiBh
ZGQgbnZtIGRldmljZSBmb3IgZGlzY3JldGUgZ3JhcGhpY3MNCj4gPiAgIGRybS9pOTE1L252bTog
YWRkIHN1cHBvcnQgZm9yIGFjY2VzcyBtb2RlDQo+ID4gICBkcm0veGUvbnZtOiBhZGQgb24tZGll
IG5vbi12b2xhdGlsZSBtZW1vcnkgZGV2aWNlDQo+ID4gICBkcm0veGUvbnZtOiBhZGQgc3VwcG9y
dCBmb3IgYWNjZXNzIG1vZGUNCj4gPg0KPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA3ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUgICAg
ICAgICB8ICAgNCArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJpdmVyLmMgICAg
fCAgIDYgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oICAgICAgIHwgICAz
ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICB8ICAgMSArDQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX252bS5jICAgICAgfCAxMTUgKysrKw0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9udm0uaCAgICAgIHwgIDE1ICsNCj4gPiAgZHJp
dmVycy9ncHUvZHJtL3hlL01ha2VmaWxlICAgICAgICAgICB8ICAgMSArDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS94ZS9yZWdzL3hlX2dzY19yZWdzLmggfCAgIDQgKw0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlLmMgICAgICAgIHwgICA1ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZV90eXBlcy5oICB8ICAgNiArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9o
ZWNpX2dzYy5jICAgICAgfCAgIDUgKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX252bS5j
ICAgICAgICAgICB8IDE2MSArKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbnZtLmgg
ICAgICAgICAgIHwgIDE1ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jICAgICAg
ICAgICB8ICAgNiArDQo+ID4gIGRyaXZlcnMvbXRkL2RldmljZXMvS2NvbmZpZyAgICAgICAgICAg
fCAgMTEgKw0KPiA+ICBkcml2ZXJzL210ZC9kZXZpY2VzL01ha2VmaWxlICAgICAgICAgIHwgICAx
ICsNCj4gPiAgZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRfaW50ZWxfZGcuYyAgICB8IDg4NA0KPiAr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL210ZC9tdGRjb3JlLmMgICAg
ICAgICAgICAgICAgIHwgMTQxICsrLS0NCj4gPiAgZHJpdmVycy9tdGQvbXRkY29yZS5oICAgICAg
ICAgICAgICAgICB8ICAgMiArLQ0KPiA+ICBkcml2ZXJzL210ZC9tdGRwYXJ0LmMgICAgICAgICAg
ICAgICAgIHwgIDE3ICstDQo+ID4gIGluY2x1ZGUvbGludXgvaW50ZWxfZGdfbnZtX2F1eC5oICAg
ICAgfCAgMjkgKw0KPiA+ICAyMiBmaWxlcyBjaGFuZ2VkLCAxMzg1IGluc2VydGlvbnMoKyksIDU0
IGRlbGV0aW9ucygtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5
MTUvaW50ZWxfbnZtLmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX252bS5oDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfbnZtLmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9udm0uaA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRf
aW50ZWxfZGcuYw0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9pbnRlbF9k
Z19udm1fYXV4LmgNCj4gPg0KPiA+IC0tDQo+ID4gMi40My4wDQo+ID4NCg==
