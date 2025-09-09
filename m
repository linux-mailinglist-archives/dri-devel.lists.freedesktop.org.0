Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E782B4A0E8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 06:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A297110E400;
	Tue,  9 Sep 2025 04:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgBy3nWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F4010E22B;
 Tue,  9 Sep 2025 04:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757393451; x=1788929451;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5XjLTmsR9zIXC4E2sBmUGvnTLyTtpic+W5LGxgQjFT0=;
 b=YgBy3nWOFrt6R6PeqcTAlS+CHIlVPV4JS1c3jfNn3J3HDtOclMsWaycV
 u68OVE6s+HGTQSfwjugCX6efwYShX32ENYo87fTA7ZxLJb0G3lbSfni8m
 12WgcgPEnHNOjBl780vgu5/dcjo0bUIsaeeABycbsCx3q5acQdvpJ6QmD
 UymruFKHvbvhj8+aNDjwZWttFQr6I98HtVAEJRwbSogOSG9t2W3k5M/40
 xWBtoe6riFnQgVtO3FHhZ4nu7hxKbCiqIfJ4hZoRQxVw1nb+IbvsNwUR0
 aI1qydxa26lqDR5nR12NinFzmUd01gnxoQFiniwWbwrFsCJSFzlOATVrN g==;
X-CSE-ConnectionGUID: 3nRtvilyTwStVrTxTExmVQ==
X-CSE-MsgGUID: OpK+VG8sRsSVK1X9B16XOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59813591"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59813591"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 21:50:51 -0700
X-CSE-ConnectionGUID: /cYKow/lSDqN9OqmTUQ+2Q==
X-CSE-MsgGUID: ZysJR7gnSd+P5eXh4c63Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="178183615"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 21:50:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 21:50:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 21:50:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.75) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 21:50:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfQGjSK7HTrnTqEmHLZRbL7IwrCmYB6B8ezXuD76YMplMvF3rcTSoI0oCxPFbQ3BiixJqq7QKCecIMx0sXQvxvN6sT1Oa7VI+Iz8fmPRNL/njgkvObLahtvPcz30TSzcAsPuH80Mi+Fo/SVmDIcUW1s1BhEB7py4QouZ9Uvgk6MvDn9iDKOi6GN8+P0FzFBj52RX2l6IcBNggYshIPxYMvIil5BhGea5691iHV3CGw9aD4ifrqAT8bGkSNOtor6nOTbLqXYp0Q+XfT/jPC2sCIcgQKK1yMbM8lJh8e7o508JV573sqZrRd2cGTymgTTEdK2nLbnGKl7snvkbpsjCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XjLTmsR9zIXC4E2sBmUGvnTLyTtpic+W5LGxgQjFT0=;
 b=nK2+1zDsJ8EHTfZxoPuBQCelmOCyZv9nRvdsQplGFIM820HXit1A2qwuyTqN181zsizMrm4N33yBquYigpK4Win8XXHYOsDKZSd9UDULZiwH1+tcgRHPk2Z+hyLbNrsxESaQMTIY9lbTlcXf9kHPkiP24ebq6MF6nkPtLZEzQGEsS5gfE05sd6HHZmn35pASB6vCjkaBA7U+OCHqZh8qlaH7dmT1kZPh+jKTeNWmTgt/ORFwr1tb+e9yfwLcKTDffZsqTX2jhVdz4s8AhRQwFw2jSKlo9d5T4hp5zjrRXb1q/bx7qJcpfWpBSeEC7ThPyFyNIgiMOmruIHTXoCRfGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH3PPFE80710477.namprd11.prod.outlook.com (2603:10b6:518:1::d5a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 04:50:41 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 04:50:41 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH v9 2/9] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v9 2/9] mei: late_bind: add late binding component driver
Thread-Index: AQHcHnwg5/ADEIhSEkuDI26E4cauP7SJfYWAgADPCrA=
Date: Tue, 9 Sep 2025 04:50:41 +0000
Message-ID: <CY5PR11MB63665FAB1FE8D8CBE17C31CEED0FA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250905154953.3974335-1-badal.nilawar@intel.com>
 <20250905154953.3974335-3-badal.nilawar@intel.com>
 <tbflj3r6picnz7pzhiz77gzhrdnmfxlruhtas4rfrvm27dapss@3wqf4dd2lmsx>
In-Reply-To: <tbflj3r6picnz7pzhiz77gzhrdnmfxlruhtas4rfrvm27dapss@3wqf4dd2lmsx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH3PPFE80710477:EE_
x-ms-office365-filtering-correlation-id: 2dbe1f23-3771-4510-6231-08ddef5c6dd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WEdaSHdYMkQ3eEFQMllBRVYrc21WdGh0dDl5RVRzV2J6eEZUK3pxemRNNHcr?=
 =?utf-8?B?OFZmWEwrTnJaRHZ5NU85Rlh0TUE4OHhJNmYxL0Z4WmgyR1JJTDR5MFlKMG5z?=
 =?utf-8?B?STUzWDU2WlpzSlJua2MxUWs4RWY0QTZKRWFXcVBISitpOUc3TWJPdzY5VVhs?=
 =?utf-8?B?LzhiME5HTWJVTWlSTmR6ajlWRG5vYkdtSHNVelBacXY1MGRvVThsSWxUSVl4?=
 =?utf-8?B?RU5YRzlmV0VmdGJSWWczcUhmY1dTWC9pV2p2emhEc2FwTHhadFMwR2RKSmpi?=
 =?utf-8?B?T2kwblF6V0JrdHo5eEVxTTJqQk5mZmxtUitXMm52T1pseitEdW5UMzhhMnF2?=
 =?utf-8?B?STZ4c1ZFdWJSaXZMMkRjRi9jOTFpUVF4b0NrQndYcnhtTDB1YkRpalV4Vndh?=
 =?utf-8?B?ZDhGTStONlZ0YkxrcVAwbjQ2V05EaGd2b1dhUThSWklKaTIxVEdWNWM4MTZE?=
 =?utf-8?B?ejFLRVEvUXVFMGx5RTgwTithMFZqbGhsdzZVVzQ0QUdHYzE5T2NkdFlPSjNm?=
 =?utf-8?B?YXdaTG1MK3FBS3EzUVVVMkQwN2dHcmprclp2aldWdUFlMzZaMjBEMWxSSnJS?=
 =?utf-8?B?WUZxR3V0cStodkhhazJxYWNXd2kzbnF3amt0QTZhVkw0QzQvTXhtNTVjKy96?=
 =?utf-8?B?bnFVNlJhS3JNMkttYTNqTlAybm1wMDE2RXpmanl5WGFqcXcxSEJjSUV5K1h4?=
 =?utf-8?B?YU9Hb293UWdSc010cC9XaFM0TEdXdDVzejhFS2psZG5XeG1YKzFrY0kxUVM0?=
 =?utf-8?B?dFhsODdoTnBaWGNhUVBvdmU0Tk1TeHM4ZjdMZEJ6cTR1QjhiWktUaEVqRXV1?=
 =?utf-8?B?dzRYeWRmNjJVeWMrYlI2SFdvZlVGeEtwbzN6Rm5ka2UvLzdzVEJvbGE5aWdX?=
 =?utf-8?B?a0Z4am9mSDlzc3RJbCttbEFOeFBHc2pvdVdxSkYyb3Q3a291K0hEM2pRZWVK?=
 =?utf-8?B?VE1QNzc4K3MvSFMxVFpiS2R2aEowVFBObmZLSnZaV2w1cnQ2SXhsUmJRU21h?=
 =?utf-8?B?OXlTd3hUTkFWcGpkV21YOVNyS1VYWUJzbVV3cVFpdWdWOTlkajlyMk9MQWNO?=
 =?utf-8?B?S0FIZ2FKeGNuQXJvUCtGeVQwWk92aW9tSzgyamlVbUJxM0dEV1cra2dUMHl5?=
 =?utf-8?B?Ync1NmhncjlYZHNrTlRzaWxWZkVMdzI4S3dJMlpkOUNubnZsWHUremFnUVVi?=
 =?utf-8?B?R3MreFV0TEFpcEI1M0JQSlNGdTlCb096Q0xGNkFqZHgzK2tMemRMSHhHTWpG?=
 =?utf-8?B?SGxoeXNONkdqYm01TVBwNU9EbWQ4MVV4T1o3bThUMUFRN2xlWS9nQXlocTNT?=
 =?utf-8?B?eFZGRnRlUmZmNXBIM1hPcWlsS3BEZXduTSt6ZmlaVHJrQmlPMEUxdWhqamVz?=
 =?utf-8?B?eEYrWnFtdGovenB1ejNBN3BZNTlTNmorREdpNDh6Z3NoMHNacE5XMXYwTnp2?=
 =?utf-8?B?TndBSExnY0NiNUMyVkF6c3kwZWlXTWdrTUNsTWdVZ1lJNmtIcXBJVExVRVZQ?=
 =?utf-8?B?QkplV1BueVA5K1JIajgwSFk5K2VwSnlUN3UvRWg0TG5lRlBnU0RDaFNTWnVp?=
 =?utf-8?B?RXQzcFRRRGhsM0E0YTdIV003Z3BEd0pGdVJVaE9ucVhEWG1Yemt1b3pGTEVH?=
 =?utf-8?B?SmwxT2ovZERNZHRxdlVMRjVXN3FOQlJ6a3JpK3F6QkhFVGtLOVBHZGJ3U0hX?=
 =?utf-8?B?a1NmWmFtOHRMeGpGUzBMbFJVWmZJaEp4dGpKUDFKYnU0bDNXdFd3azFuaUpl?=
 =?utf-8?B?WFRpWUhtd0Y2dERDcFc4OHlpRlB4dTUxZE95KzhiNUUwZ3JibmpWamdlVWlB?=
 =?utf-8?B?cTk1WHU0SWJ4S2VuWjZVcXlrR3F0djJhZnhjejhlbG1zcFV5aGphZVdSSDNl?=
 =?utf-8?B?QU11TUdrUVJLcHA3UFgzeEx4RlRSdHNxUmNvbTl3UWI0Q09PUUJLZUY1UUY4?=
 =?utf-8?B?ajk2Q2hUYThad2lqREN6VzNSSEE3VVVWT2lhR2xjU0JlbGpWVUlJbC9mVGRJ?=
 =?utf-8?B?dFFBTWZCOHRBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WW5VRFQvRUxJN0x0NU1WckRGVWs4SXhKckdVeSs1YWZjWDI3UnVYRkZJZWNi?=
 =?utf-8?B?TzhvMGRFR0dzQVFxU2RLSVFZb3A5aXJnd1BocTU4c0E3R1d2bVFDVWViUzhv?=
 =?utf-8?B?bmdDV2FRSW5vbDk3RmQwYmNEQjAvOTlFK3pvRVdacG9scGNBV3BLbWdtQ2pL?=
 =?utf-8?B?eC80bzFDazdhRWxZRlF0VDZDcnlMblU1K2Y3ZWR3Z1J1UzVsb2ZmVkkyV0VS?=
 =?utf-8?B?SXJnOHV1WjdWK1hPSEEwWGhKZkZ1dTVWYWIwYWtGazFzV24vRFlic0RTNVZD?=
 =?utf-8?B?THdzdEtoK3lwSGVOWDFubUhlRitHb2cwV0ZjM202N2Z5cnVDcDJmd0VWVHhY?=
 =?utf-8?B?ZzNaU0twbkFFbVB4emFpY0JHU0tMS2RFMXZUKzJMM3ljLzdISXA0cU1EL1c4?=
 =?utf-8?B?UEhrYXc3V2cxNnpGZWZ2VXZyK1pGSTVqMW9RVVdLZzRGbHQzS3EreHJ1RU5I?=
 =?utf-8?B?QTB4N2hmZlJIc3Y4c1pyMUdoemdwbmFTWWM4TWZWdzdwb3BLMFJsSkF3dlAz?=
 =?utf-8?B?K0o0TExaWE1zWVFWUWNtc011RllMbERBckZkUXhYcEx5a2tKU2N3NHEwZUFa?=
 =?utf-8?B?TVUwaE1sWUphengxK0VhbFJuMUhGMFpYS2pZU1VaZXpqSW1aTU5aRzd3eEsx?=
 =?utf-8?B?bEhkU1ZEcldhdFFta3UxYVBrWHlRd2ZaWkU0ZnJaWlRVYk9EcnBZNUpqaDc5?=
 =?utf-8?B?UFI1VmFDRmttdlpTZ01NYkV3cVJLUnp0WWJubEZBc2FvdE9rb2Z6QmNCQmVu?=
 =?utf-8?B?dW02eTA4OGkyUk1XUmtmQW94UU1KWUFoUjBUcFk5N1h6aVpMRkMwZVNRSVJ3?=
 =?utf-8?B?anlCRHBlcWhTK2U3RkNNZzlvOG9QZWVSUmU1cEFzMlZrYXcxVXB3b0QreWQ5?=
 =?utf-8?B?aHIvYVgyMUNySkdwZ1JaY01aLytBZUNQMHVOOFkweXBzaTV6d3orQy81NmFz?=
 =?utf-8?B?UXdDZ3pVK0RKcHNkZXJJVWlDTWJ4VGlhLzRic3Y2TmxoZ044U01aajM1V2lZ?=
 =?utf-8?B?VThKSkpVNUkzTGJ6ckZCekZYNXdVOUtrZlJheEc1Z25IUTNncjNoT1RyRm01?=
 =?utf-8?B?akVxR1hqRW4rV285SFRQOUE1RnAvSm1vb0EvMGxQSnk1bzdnM084LzA0MUFy?=
 =?utf-8?B?T3o4cnptTmx0USs5c1FKaVIxU2t2NUM2MHltR0JONTRrb0J2L2k3VkZReVFH?=
 =?utf-8?B?cVJYMm12MlhsUHd3NHFDcGMxckxxQVI1Q1Z0aURDdVd2QmY3S0ZLNUNOWFN0?=
 =?utf-8?B?WVdJVm1EZW0vcGpnN0tocE1kZk90N0lYQ3NLQjg1ZVl0NDJWWHJ1dDlDdXVi?=
 =?utf-8?B?bVZuSXRnSnVvRUJlK0IrcjY2SDdWTlJ1M2hYd3ptOGdkSVhkQ0wvUkhLWUN4?=
 =?utf-8?B?cWppV2U4UXBYc2dBdGdQSjlwd1BySDNuRnRyUW14MG01ZkhzM015V2Y4N2hS?=
 =?utf-8?B?K2c3ZGRDVjZjeEh6a0F6Vit5bEthNVVieVAvcG5WYVgzcFU3MzRDMEJJUnY5?=
 =?utf-8?B?MytOaGI5dlNQZHBTckUxNUh3aVRCd1FhLzFZU1Q1ZDJ3Skp4VkpHR3Bia2k5?=
 =?utf-8?B?aG5RRjNEUnZ3akM2M0RlbStVS2hxdW5LYVlzU0JVZ2FXV1JSRWhvVXBubzRQ?=
 =?utf-8?B?Q0NERVFVVFJuZHd3TEwwQ2RRNlVwQUt2emQwd1dRck9KY3RDYWhZL0ZraG95?=
 =?utf-8?B?SHBnOEVGYzVNbUw2WlVLV1RtRDJ1Q1BFU0tUWUp4eWdheHZjZHpsWS9QYWE0?=
 =?utf-8?B?dVBYZlA4REl0SXMyYi84aVpmbTA4N3hjenpMaDJPT0wxZTJ6SnNIb2xIejkr?=
 =?utf-8?B?MCtqR2xRTVNiMCtkZGxEVzJEKzNld1FhczBMZ3hhZ3VxSmM4U3ppRjJJdnoz?=
 =?utf-8?B?Nm5VcEcxR3FiaGRmSzNESkpSZkZsRGdxNW9BVG5yTlhmRWRmZjJXS1VEM1Jk?=
 =?utf-8?B?TWxqWWZDQXZMWngrTWpvYnZzeVZiOFRLdkIybm9menFQMWVQa0lyQVZWeEdr?=
 =?utf-8?B?aCt0amRPVkljeEZYTWNGL21oRWw3T1oxZVBiMzMvR0lxNy8xLytPWUVkM2l1?=
 =?utf-8?B?QnRJYmp6eHYvRERRcUFXdHo1SzZMa0F0L3FsTWdaZnVTSTZBQ1p1dThLZW1x?=
 =?utf-8?B?Q096UjNxZGxuemtNSzJGOWRBWGNSNGZnWmIrYmRXR25rQTVWaUVEM0llZkl0?=
 =?utf-8?B?c2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbe1f23-3771-4510-6231-08ddef5c6dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 04:50:41.4238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JrqHa2ykFOilmyBsJutv6UUPm8q6/b9BE2JsFi0ZECsEZZPLkod8vRjZ7Pxfhh4hNKHC6+MDbfyIGaZOSBJCShuVB2zl1ZBfS4iXOedOrrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE80710477
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

PiA+K3N0YXRpYyBpbnQgbWVpX2xiX2NvbXBvbmVudF9tYXRjaChzdHJ1Y3QgZGV2aWNlICpkZXYs
IGludCBzdWJjb21wb25lbnQsDQo+ID4rCQkJCSAgdm9pZCAqZGF0YSkNCj4gPit7DQo+ID4rCS8q
DQo+ID4rCSAqIFRoaXMgZnVuY3Rpb24gY2hlY2tzIGlmIHJlcXVlc3RlciBpcyBJbnRlbCAlUENJ
X0NMQVNTX0RJU1BMQVlfVkdBDQo+IG9yDQo+ID4rCSAqICVQQ0lfQ0xBU1NfRElTUExBWV9PVEhF
UiBkZXZpY2UsIGFuZCBjaGVja3MgaWYgdGhlIHJlcXVlc3RlciBpcw0KPiB0aGUNCj4gPisJICog
Z3JhbmQgcGFyZW50IG9mIG1laV9pZiBpLmUuIGxhdGUgYmluZCBNRUkgZGV2aWNlDQo+ID4rCSAq
Lw0KPiA+KwlzdHJ1Y3QgZGV2aWNlICpiYXNlID0gZGF0YTsNCj4gPisJc3RydWN0IHBjaV9kZXYg
KnBkZXY7DQo+ID4rDQo+ID4rCWlmICghZGV2KQ0KPiA+KwkJcmV0dXJuIDA7DQo+ID4rDQo+ID4r
CWlmICghZGV2X2lzX3BjaShkZXYpKQ0KPiA+KwkJcmV0dXJuIDA7DQo+ID4rDQo+ID4rCXBkZXYg
PSB0b19wY2lfZGV2KGRldik7DQo+ID4rDQo+ID4rCWlmIChwZGV2LT52ZW5kb3IgIT0gUENJX1ZF
TkRPUl9JRF9JTlRFTCkNCj4gPisJCXJldHVybiAwOw0KPiA+Kw0KPiA+KwlpZiAocGRldi0+Y2xh
c3MgIT0gKFBDSV9DTEFTU19ESVNQTEFZX1ZHQSA8PCA4KSAmJg0KPiA+KwkgICAgcGRldi0+Y2xh
c3MgIT0gKFBDSV9DTEFTU19ESVNQTEFZX09USEVSIDw8IDgpKQ0KPiANCj4gdGhpcyBkb2Vzbid0
IHNlZW0gcmlnaHQsIHdlIHNob3VsZCBhbGxvdyBvdGhlciBQQ0kgY2xhc3Nlcy4gQUZBSUNTIHRo
aXMNCj4gY2hlY2sgY291bGQganVzdCBiZSByZW1vdmVkIGFuZCBqdXN0IGxlYXZlIHRoZSBJTlRF
TF9DT01QT05FTlRfTEIgYmVsb3cNCj4gdG8gcHJvdGVjdCBmb3IgY29tcG9uZW50IG1hdGNoDQo+
IA0KPiBMdWNhcyBEZSBNYXJjaGkNCj4gDQoNClRoZSBzdWJjb21wb25lbnQgaXMgdW5pcXVlIG9u
bHkgaW4gaXRzIG93biBpbnN0YW5jZSBvZiB0aGUgY29tcG9uZW50IGZyYW1ld29yay4NCk9yIEkn
bSB3cm9uZyBoZXJlPw0KV2UgaGF2ZSB0byBlbnN1cmUgdGhhdCB3ZSBoYXZlIEludGVsIGRpc3Bs
YXkgZGV2aWNlLCBub3QgYW55IG90aGVyIGRldmljZSB0bw0Kc3ViY29tcG9uZW50IGNoZWNrIHRv
IHdvcmsgY29ycmVjdGx5Lg0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoNCj4gPisJCXJldHVy
biAwOw0KPiA+Kw0KPiA+KwlpZiAoc3ViY29tcG9uZW50ICE9IElOVEVMX0NPTVBPTkVOVF9MQikN
Cj4gPisJCXJldHVybiAwOw0KPiA+Kw0KPiA+KwliYXNlID0gYmFzZS0+cGFyZW50Ow0KPiA+Kwlp
ZiAoIWJhc2UpIC8qIG1laSBkZXZpY2UgKi8NCj4gPisJCXJldHVybiAwOw0KPiA+Kw0KPiA+Kwli
YXNlID0gYmFzZS0+cGFyZW50OyAvKiBwY2kgZGV2aWNlICovDQo+ID4rDQo+ID4rCXJldHVybiAh
IWJhc2UgJiYgZGV2ID09IGJhc2U7DQo+ID4rfQ0KPiA+Kw0K
