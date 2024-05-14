Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43E88C4F7E
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 12:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F4910E0B7;
	Tue, 14 May 2024 10:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="mjaQ6/uH";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="BNMDBRwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 14 May 2024 10:48:50 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9165110E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 10:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1715683730; x=1747219730;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9VgSsl8zHlgOD1GX2zkvDuANp8mo4shEuxcCt983+3c=;
 b=mjaQ6/uHjmUQaa290S974ghc/Kub7KOa6s62wDvG/2woxhxi7OEZxtv1
 lh+DqTbeMJ1+0E7rub24LiAPLKl2RoZ09zdXSOyKPoW/0w1H16GMw9Uer
 TTZRPFJ8WS1giwjsG7h1f6ghx9L5OMXpJumeNu2NQn9ocaU2BQzzzHgt6
 AFqSQBwP7sjPOOorPgyIfDxmxyKeMKOOwLxIFUlLAH2ev8IGykqRZ2UkP
 0J2nEkIOSdBRsCibwYUM2fSkvGB5Z6BjkykRretbwtlBdbiLkESmjwjP5
 CYeqEkvZp7xPMbJI7Wmfb26yjx5rEuqzsZHmjZfjnYRfewBM9wdYgqJUg w==;
X-CSE-ConnectionGUID: oqn5JUD2RdObj34vtscERg==
X-CSE-MsgGUID: 9W9dvLBtQouhtUevL9R7aA==
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="24625638"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 May 2024 03:41:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 03:41:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 03:41:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQvmCAHGj5CZtfBzWUE2jK6kDwRdOjVZawnU10ZyPp/CyW1z9wFhaOaZKHebT96KnyrPkpv1wC1FPFv7LupxBglwT3tDPrNIsIJSefMtsvK80suEyUfHqcXXgLHhBdVl69TSOtzJKP9JIHy78Bt8xfUh5ddMKQbo1Q0HCJuvjHZyr3p5UoR2rl+UIt58Hr0bU1wcnt97IMY87ngHGf8YIY7RPC3GRhdmydGUFJYBF0QB8bwXKfa9a8yZr+UZmMqk85BQQBJZna+ULHWSJBwo0ln2U/lHhJ2wfXIQRsXH+gSYXkXLNMmS8K9ZjnzneFh7KSoYyeiUcMXsIO2gJirgwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VgSsl8zHlgOD1GX2zkvDuANp8mo4shEuxcCt983+3c=;
 b=ec2YWiHy4EPS3H/KmF5pwimMLfiTmw95S/fjJTYBGtEXyGZzd3jIjiZBAsT3uz4nSQl4xvj7Te7VQVwzfdIwobBikVnLxWSsVaCpVNENIcH70S2g63+BR1U50YXYhlAgwtnBBiyYFHDLgRwaY6A/uXyCp8zi1Wm0S1lFF2sxL1mYSO61fB/ye5qQXrQ1UPM0bCBIi0YKel+a4lqP89l/IHSC3TcBdqO0MDvTV/eQGWgjcGZp4VRtHg0i48NX8a7n45Swia9KBOU1YapLN754Vwj4fikmktEOMInjAdfHumc2B2K1g9dl3M2E04OROiuGTTg9kTbFj7xAQuAAlv3JTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VgSsl8zHlgOD1GX2zkvDuANp8mo4shEuxcCt983+3c=;
 b=BNMDBRwyztf0CpshTW1ScBtRotdmrqJJ1UOFd3bb0w2GsRLb/84XdK7SsYMgj1A/UlJ+PHYyzpyTAlaJZ0T6Y5+zmimSlldpJQ9LG9FDzi5r+5unp+x4FgK5K6y/mFX5AkJxoBO/5Wrefctr0nR+1+7RaTD81ExXeOCA+ezzAFlf0ON9ac+sVDI3FL2bIYnqz/HZ5iEOiPo7fl3aFgkb0dPqLEIhemJSDdU69ETvaD9DngySuAbiwZOqQgN5K1WVoPhrGyNOwfAGjUPT0cSV4m9sAqFJMF9IPJvQEv93Lhb0Hj9C7FO5+S9bc95XjVIs8n8k5tJjVhVRC7QiyNmM6A==
Received: from DM6PR11MB4185.namprd11.prod.outlook.com (2603:10b6:5:195::29)
 by CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 14 May
 2024 10:41:23 +0000
Received: from DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::1692:c829:d50b:8c30]) by DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::1692:c829:d50b:8c30%4]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 10:41:22 +0000
From: <Hari.PrasathGE@microchip.com>
To: <Manikandan.M@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>, 
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Balamanikandan.Gunasundar@microchip.com>,
 <Durai.ManickamKR@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
 <Dharma.B@microchip.com>, <Varshini.Rajendran@microchip.com>,
 <Balakrishnan.S@microchip.com>, <Charan.Pedumuru@microchip.com>
Subject: Re: [PATCH RESEND v9 3/8] drm: atmel_hlcdc: replace regmap_read with
 regmap_read_poll_timeout
Thread-Topic: [PATCH RESEND v9 3/8] drm: atmel_hlcdc: replace regmap_read with
 regmap_read_poll_timeout
Thread-Index: AQHalglRHbH5e33XzEmDxSPr87yu9bGWqnMA
Date: Tue, 14 May 2024 10:41:22 +0000
Message-ID: <072a27fd-2d7f-47f8-8f22-d2814e4ea1a1@microchip.com>
References: <20240424053351.589830-1-manikandan.m@microchip.com>
 <20240424053351.589830-4-manikandan.m@microchip.com>
In-Reply-To: <20240424053351.589830-4-manikandan.m@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4185:EE_|CY8PR11MB7010:EE_
x-ms-office365-filtering-correlation-id: 2c3353d2-be7c-42b0-d0a4-08dc740265e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|366007|38070700009|921011; 
x-microsoft-antispam-message-info: =?utf-8?B?ck1XTEZFejlGYVpMcDZraHJmRE4rWDVURk8xYjBrbzAwUW1lcXBSMG41aWt2?=
 =?utf-8?B?c3JXYkxxd2J2aEVnK3pXaURkMmcvRmxZdjA4ZjE0dGdHOWFlQ2NrU0ErNDRN?=
 =?utf-8?B?WE1COWp6ZVZqcHJiNkd4VUVwcTZib2F1eGpPcG9NcDVwNUZubkkyRHUwWlE3?=
 =?utf-8?B?NGVIVEFyUzhzcEUxcW4waTNSSjJnNElZV3VNeFlRb2l5cGlhSlQyQ2NRK0tQ?=
 =?utf-8?B?VHVDczVjSVMwRkVKaGs4dW1ra3ZaSDNmK0t6K3dLNWd0TmRyMGIxVnVlSWkw?=
 =?utf-8?B?bTFkYVh0YzBqOUloWlhYakhmalduUU5KYk1qaHlXWlQyZGJUOFN5Y21iMVZ0?=
 =?utf-8?B?aXI5VlltNHY2ZUJMSnA5UDMrRDNkcGgwRlFsQ1JsdlMwbzNCdFNweDhKNm1P?=
 =?utf-8?B?dExMRWl1bG0xcDF5M3JZT1E0USsycjZraFFGeVFpVFBrUCtsTXhQZ2VpWGMw?=
 =?utf-8?B?V2FvNmYrSHZUQmkyZkpLR09LdEV5Q1N2SFA3aHlVYTM2RXFmTnRtODRlT1pM?=
 =?utf-8?B?VlJrZkNZd0Vad1dNN2JFeU9KeDRvTUlvbEdla0RPamZQUXJRb0NPZGFRWHZk?=
 =?utf-8?B?VDVIVGhrWDV1TjB0ckVoWUlsVGJ4aEFXeTBEYm9BeUJqY043VU9GdWtaa0tT?=
 =?utf-8?B?QVdMQURqYmEzREQ4eE9WVjBidVpBb3NYRldMTE5PQTNOcjZyQmUrZmNHMytY?=
 =?utf-8?B?NS93ckdoY0FnSGxQTFVYS3lhbHRmT05FZGlhRHlqLzhXZHU3NWNNZ1FkeW0x?=
 =?utf-8?B?em5hQ2dsTXpFc0RDK09xR3FjdXBOVWUva1hnTWQxenF3SlFmTStFd1F1dkpE?=
 =?utf-8?B?cmFTbDdHWjFwR2RrdHFvWVRoWjNUaWExZnF0UTVvelE4cU5PbGhCaStPRitF?=
 =?utf-8?B?TE5YeSs2SjVMRDVHYWkzMk1aNDZ2cXIvZE5taXFvaEhsdlZZS0RjQkJOZTZM?=
 =?utf-8?B?MFNmWVNld0djeGRRUlJVU3djWmFucXFER0VZT3dERm03VDRHSVQvcmMzMTIz?=
 =?utf-8?B?dXI3ZnRVVXNmUW13SGExdmFGYnhjQlBPaDVvSUdDVGMwV2duMy9ObUNHeTla?=
 =?utf-8?B?RDJjRGhCWE1iUUdNQ25UZFhaWjJxNktSZkhHRFVPVGkwSWlmSjlFbkNsOGZY?=
 =?utf-8?B?NHFIblZ3OVJZNzlRNmFUWXY2azI5a3YzQmU5ZEtKRGFHZU4yUjFkeVd5L2l1?=
 =?utf-8?B?dml6azVCajdVaGc5RzB6azloV2tpOXhXRmJzemgrbFZrb0F2emhBUGhxSmw2?=
 =?utf-8?B?QUF5OFFERThINXd2N3MvV3Z6ODFFMTdWNXM5UHJmUWdSSWZicXhPK2dueHNk?=
 =?utf-8?B?ZWlvaE9PVjFzcTYvZTZOaGR4cWQzcFE3akdWLzVRRWZvZ0N5T29LVHRNcCtX?=
 =?utf-8?B?MlZ0bzNyUkp6dmloQnIzcWdkbW8ySVE3QWd6NjlQL1dpNTFPcmxWN2Z3Y1Fs?=
 =?utf-8?B?VkwwV202bXJnMmt5YVhKa0lQOTRRTFNXbkRwQnZRTzVKVjBUcWZMWWx4NG1l?=
 =?utf-8?B?bTgrUFNQSnZ4bGJZUE5OcHVpS1dUdkF4NWliWHhkcUZ0YXEzYjBWVzJKRGt1?=
 =?utf-8?B?cVNnUUJPNFJjVCs5R3BUaU1zNmlCN2k2T1Q1Uy9PQ2hCdTRjWkxrSGV6TUVU?=
 =?utf-8?B?cW5VZEVnWHByYlNkYU9IWXdlby9uaEFQczVrYWhCK2I5akR0bEx0MDB0dTVF?=
 =?utf-8?B?TzVlMGJZdytZYnVPTXl2ais0NHptNTZJYldQK0Y2OVlCNys2SmJ1Yk1jMnpv?=
 =?utf-8?B?YXZDQi91RFhhL3BKbmg0UXRyUUwrMUY4OGV3Mm5UMVRFd3hLbkJBUkhWWEJQ?=
 =?utf-8?Q?EVlJHwkMgQEndfjSTaRICbdIO7BwcyOQ73dxA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009)(921011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlkwYkR1dmFLaGtXSytiL2taR2U4UWVnUm1ucjlYVnd6VUtvVGY1ZEFZcXRm?=
 =?utf-8?B?NUVndFBFSUJpdUY1M1MxSzNlam5GQlQ5MTRNa3pCZk5tcERpSmREMFU1RU8w?=
 =?utf-8?B?MytHcDBFNXN4b2gxN2RWRGo0bFplWVlBK3Bsckw1bFdDeFlMdGJvWkgzSHRw?=
 =?utf-8?B?S1hDMzF3aGpteUlLdHQwd3hmdEhUZEViR2NsaWVqSFRsOHY1bkZNMjY1TDlT?=
 =?utf-8?B?cmtkb1RJeXd0RzBxck14STJBTG9Ua1JhSDlQc3hGck56RjFwL0RzNW9sWkF5?=
 =?utf-8?B?aEZWak5KYnZ4eFZxWUlSN0o4WDJIajNON2x3NVNlbDRLVCtkNGJvR3VrbXBE?=
 =?utf-8?B?VVRzZHhYN29qZnV2cVRJeVFyQktiYnNzcTJHS1UrY2t1c1Z2ekpHN3Rjam95?=
 =?utf-8?B?S2JDYktSTE9iSHJHeGN1S3RkL3pLQnhtRXNNYnNaSkNtUEdBSjNJUVRXRWIx?=
 =?utf-8?B?RVNta2xCZ0ttbHBmQmFtWHhSdUhqcGczcnM3bTQ2Z3Rnb2YxVzIyM01NV1Az?=
 =?utf-8?B?ajM2WnNtT1M1Sy92Um9UZzhLZVNLNlJVaERLTUQzWFdUbXZaWU96UWZSMEh5?=
 =?utf-8?B?THh6eHBoM0dGamlHaUtXRTA0c3VKSWk1c1Z1UU84eEF6RWZqdmVWUnJzR21w?=
 =?utf-8?B?YzdoTWpIK2VYTytqanpib1NXVHM0UDlrSXRzQlZFR0o4eXdZQURnKzk0M0ZH?=
 =?utf-8?B?eWRneUsrUlppQ3JCYUpVTE0yYkdYSm5xZWR3VDFjckZDQktENDNIdlgyTFZF?=
 =?utf-8?B?OEo3NngwOTM1ajNySUIzRDV3dFNXZ0NhWmZZSWVXbUdhNnVBK0V0MEJoamRW?=
 =?utf-8?B?NkdWVXZJTm92VXZMTUZ1N2RxYk91S1RRNjg3TjBQajUxRlpVNS9tRHhQNjJN?=
 =?utf-8?B?SElJeHlQakRPeFEyUmNjanIveGE4RkNnVXZRUzd4a1FuR2RBN1IwYm81MEsy?=
 =?utf-8?B?VVBrZ0VFTlQ5YkFPZm9wdytVZlpoK3FBMFpEazl3SERlT3hUczlDcmtvTWRm?=
 =?utf-8?B?TUZGdHhMMWVGYTRucUQzNHhZUHNudlhMcTJtZzFHbC9hM3VmdmlNUHUwWWJY?=
 =?utf-8?B?VndhNWdPc0pUNFFRSk9HWmx2V3JIV0d0T2Z3WkM3U2hwUlBwOUFKS2pTRkZX?=
 =?utf-8?B?ZUhYWHQvMXNHWFBDcmtwUjVGQ2xQLzZ3eWc2QmVmNUxMbmE3NWx2aE5HWkwv?=
 =?utf-8?B?QVF6N3R1WHkzS1JTU0ZhM1lnMytFSFJkYlVwUVowWXNUT25ab252enVldytL?=
 =?utf-8?B?ZGJBeEpCd2xWNFZ5b3NYSmlOWXUyTEt4TzZyb3ppd3BqWWxuNSt2ZGlvVENK?=
 =?utf-8?B?V2lqY2JMMXhFbkJER2wzMXZFSTJtRmpqeDRad1hnbzZVRVBFNi9rSUlBc2RS?=
 =?utf-8?B?NllqVFlucE15YXlFTm40OFBzSGVaeWVsNEpBWUpqdjJoVnpqRlJSb0E5NjR5?=
 =?utf-8?B?VUw1eVFEU3NIdldaU1hYbGFhY1ZLYjFudDZ1bFFwWVVkcDBxSjZyTG1RUEY2?=
 =?utf-8?B?NmJlZTYxT08vRFVOUkowdWxTblR2S0hSZkhpTld5Umw2dkRxYkE5QnlsbXBI?=
 =?utf-8?B?bHJqeG1DQkc1OXZRd21DT09YNFNEclpBeHFxRkpDNExyNU5rTGdnb2wxdGw1?=
 =?utf-8?B?bnRPaHZ2UWMrTHlvTmJidTY5Q0hsSTZvcEpzdFFRZm9QTzhOc1ZtakQwQnFK?=
 =?utf-8?B?WjNQcEJMcHVuN0RYZ1JyUlNVaVNBTzV2TkxmUVNhRkR3eG9tR3dFSElyUjVK?=
 =?utf-8?B?cHo5dyt6SFJWUVZBTjVYdzVYRzI4a1V3Zm1VY2YxcXprK0dvcnRWTWEyUFho?=
 =?utf-8?B?dDVJL0E5RUkzRkhGWmFhRjdqbURXY2xiNEZRUXBWdnVsMFIxZHY0Qk5ydTBo?=
 =?utf-8?B?SVhhd0xsYXhuMnBmZktYTFdaa0R2ZHVFYUx4Njd6cDNQSng1MDFrWFFTUGVr?=
 =?utf-8?B?TTZockJXK21EdHZaSmdFVjVoMERqZ2NRb1JwTGZOYTJNUXQ1Y2tqSXdSL2VL?=
 =?utf-8?B?U0RlcGN3cWJRcjBNV2xnR3B6akJGdjdIQ05YR3J1SWs1YlhUODZROFhYVmVT?=
 =?utf-8?B?S0V2T3d1ZEtsQWtDeTJ1Mld5MnE0TG5KcU1sei9IN08xczRJcG1qU1R2V1ZM?=
 =?utf-8?B?TndlNWRqUk9SYVBYajNCYTJTaEdtb0RLTklSOTJsek1EYUlHZitNZERQOGhC?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5EB03E210A57D47A49222D8E555DE0E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3353d2-be7c-42b0-d0a4-08dc740265e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 10:41:22.7767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGZ/CBnB/1rFS1PZPCVDvTUbetNzmWrEM7PakoAAY23GXFMLRVnOW0RSolTDoT7OqgkerYJwq5e/FYqXRAZ214LlFljQ8U8b6Ut/Bnuzxko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7010
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

DQoNCk9uIDQvMjQvMjQgMTE6MDMgQU0sIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIHdyb3RlOg0K
PiBSZXBsYWNlIHJlZ21hcF9yZWFkIHdpdGggcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0IHRvIG5l
YXRseSBoYW5kbGUNCj4gcmV0cmllcw0KPiANCg0KUmV2aWV3ZWQtYnk6IEhhcmkgUHJhc2F0aCBH
dWp1bGFuIEVsYW5nbyA8aGFyaS5wcmFzYXRoZ2VAbWljcm9jaGlwLmNvbT4NCg0KPiBTaWduZWQt
b2ZmLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5j
b20+DQo+IC0tLQ0KPiAgIC4uLi9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2NydGMu
YyAgICB8IDQ0ICsrKysrKysrKysrLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5z
ZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
dG1lbC1obGNkYy9hdG1lbF9obGNkY19jcnRjLmMNCj4gaW5kZXggY2M1Y2Y0YzJmYWY3Li5iMjI5
NjkyYTI3Y2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1l
bF9obGNkY19jcnRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVs
X2hsY2RjX2NydGMuYw0KPiBAQCAtMjAzLDE5ICsyMDMsMjIgQEAgc3RhdGljIHZvaWQgYXRtZWxf
aGxjZGNfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmMsDQo+ICAgCXBtX3J1
bnRpbWVfZ2V0X3N5bmMoZGV2LT5kZXYpOw0KPiAgIA0KPiAgIAlyZWdtYXBfd3JpdGUocmVnbWFw
LCBBVE1FTF9ITENEQ19ESVMsIEFUTUVMX0hMQ0RDX0RJU1ApOw0KPiAtCXdoaWxlICghcmVnbWFw
X3JlYWQocmVnbWFwLCBBVE1FTF9ITENEQ19TUiwgJnN0YXR1cykgJiYNCj4gLQkgICAgICAgKHN0
YXR1cyAmIEFUTUVMX0hMQ0RDX0RJU1ApKQ0KPiAtCQljcHVfcmVsYXgoKTsNCj4gKwlpZiAocmVn
bWFwX3JlYWRfcG9sbF90aW1lb3V0KHJlZ21hcCwgQVRNRUxfSExDRENfU1IsIHN0YXR1cywNCj4g
KwkJCQkgICAgICEoc3RhdHVzICYgQVRNRUxfSExDRENfRElTUCksDQo+ICsJCQkJICAgIDEwLCAx
MDAwKSkNCj4gKwkJZGV2X3dhcm4oZGV2LT5kZXYsICJBdG1lbCBMQ0RDIHN0YXR1cyByZWdpc3Rl
ciBESVNQU1RTIHRpbWVvdXRcbiIpOw0KPiAgIA0KPiAgIAlyZWdtYXBfd3JpdGUocmVnbWFwLCBB
VE1FTF9ITENEQ19ESVMsIEFUTUVMX0hMQ0RDX1NZTkMpOw0KPiAtCXdoaWxlICghcmVnbWFwX3Jl
YWQocmVnbWFwLCBBVE1FTF9ITENEQ19TUiwgJnN0YXR1cykgJiYNCj4gLQkgICAgICAgKHN0YXR1
cyAmIEFUTUVMX0hMQ0RDX1NZTkMpKQ0KPiAtCQljcHVfcmVsYXgoKTsNCj4gKwlpZiAocmVnbWFw
X3JlYWRfcG9sbF90aW1lb3V0KHJlZ21hcCwgQVRNRUxfSExDRENfU1IsIHN0YXR1cywNCj4gKwkJ
CQkgICAgICEoc3RhdHVzICYgQVRNRUxfSExDRENfU1lOQyksDQo+ICsJCQkJICAgIDEwLCAxMDAw
KSkNCj4gKwkJZGV2X3dhcm4oZGV2LT5kZXYsICJBdG1lbCBMQ0RDIHN0YXR1cyByZWdpc3RlciBM
Q0RTVFMgdGltZW91dFxuIik7DQo+ICAgDQo+ICAgCXJlZ21hcF93cml0ZShyZWdtYXAsIEFUTUVM
X0hMQ0RDX0RJUywgQVRNRUxfSExDRENfUElYRUxfQ0xLKTsNCj4gLQl3aGlsZSAoIXJlZ21hcF9y
ZWFkKHJlZ21hcCwgQVRNRUxfSExDRENfU1IsICZzdGF0dXMpICYmDQo+IC0JICAgICAgIChzdGF0
dXMgJiBBVE1FTF9ITENEQ19QSVhFTF9DTEspKQ0KPiAtCQljcHVfcmVsYXgoKTsNCj4gKwlpZiAo
cmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KHJlZ21hcCwgQVRNRUxfSExDRENfU1IsIHN0YXR1cywN
Cj4gKwkJCQkgICAgICEoc3RhdHVzICYgQVRNRUxfSExDRENfUElYRUxfQ0xLKSwNCj4gKwkJCQkg
ICAgMTAsIDEwMDApKQ0KPiArCQlkZXZfd2FybihkZXYtPmRldiwgIkF0bWVsIExDREMgc3RhdHVz
IHJlZ2lzdGVyIENMS1NUUyB0aW1lb3V0XG4iKTsNCj4gICANCj4gICAJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGNydGMtPmRjLT5obGNkYy0+c3lzX2Nsayk7DQo+ICAgCXBpbmN0cmxfcG1fc2VsZWN0
X3NsZWVwX3N0YXRlKGRldi0+ZGV2KTsNCj4gQEAgLTI0MSwyMCArMjQ0LDIzIEBAIHN0YXRpYyB2
b2lkIGF0bWVsX2hsY2RjX2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmMsDQo+
ICAgCWNsa19wcmVwYXJlX2VuYWJsZShjcnRjLT5kYy0+aGxjZGMtPnN5c19jbGspOw0KPiAgIA0K
PiAgIAlyZWdtYXBfd3JpdGUocmVnbWFwLCBBVE1FTF9ITENEQ19FTiwgQVRNRUxfSExDRENfUElY
RUxfQ0xLKTsNCj4gLQl3aGlsZSAoIXJlZ21hcF9yZWFkKHJlZ21hcCwgQVRNRUxfSExDRENfU1Is
ICZzdGF0dXMpICYmDQo+IC0JICAgICAgICEoc3RhdHVzICYgQVRNRUxfSExDRENfUElYRUxfQ0xL
KSkNCj4gLQkJY3B1X3JlbGF4KCk7DQo+IC0NCj4gKwlpZiAocmVnbWFwX3JlYWRfcG9sbF90aW1l
b3V0KHJlZ21hcCwgQVRNRUxfSExDRENfU1IsIHN0YXR1cywNCj4gKwkJCQkgICAgIHN0YXR1cyAm
IEFUTUVMX0hMQ0RDX1BJWEVMX0NMSywNCj4gKwkJCQkgICAgIDEwLCAxMDAwKSkNCj4gKwkJZGV2
X3dhcm4oZGV2LT5kZXYsICJBdG1lbCBMQ0RDIHN0YXR1cyByZWdpc3RlciBDTEtTVFMgdGltZW91
dFxuIik7DQo+ICAgDQo+ICAgCXJlZ21hcF93cml0ZShyZWdtYXAsIEFUTUVMX0hMQ0RDX0VOLCBB
VE1FTF9ITENEQ19TWU5DKTsNCj4gLQl3aGlsZSAoIXJlZ21hcF9yZWFkKHJlZ21hcCwgQVRNRUxf
SExDRENfU1IsICZzdGF0dXMpICYmDQo+IC0JICAgICAgICEoc3RhdHVzICYgQVRNRUxfSExDRENf
U1lOQykpDQo+IC0JCWNwdV9yZWxheCgpOw0KPiArCWlmIChyZWdtYXBfcmVhZF9wb2xsX3RpbWVv
dXQocmVnbWFwLCBBVE1FTF9ITENEQ19TUiwgc3RhdHVzLA0KPiArCQkJCSAgICAgc3RhdHVzICYg
QVRNRUxfSExDRENfU1lOQywNCj4gKwkJCQkgICAgIDEwLCAxMDAwKSkNCj4gKwkJZGV2X3dhcm4o
ZGV2LT5kZXYsICJBdG1lbCBMQ0RDIHN0YXR1cyByZWdpc3RlciBMQ0RTVFMgdGltZW91dFxuIik7
DQo+ICAgDQo+ICAgCXJlZ21hcF93cml0ZShyZWdtYXAsIEFUTUVMX0hMQ0RDX0VOLCBBVE1FTF9I
TENEQ19ESVNQKTsNCj4gLQl3aGlsZSAoIXJlZ21hcF9yZWFkKHJlZ21hcCwgQVRNRUxfSExDRENf
U1IsICZzdGF0dXMpICYmDQo+IC0JICAgICAgICEoc3RhdHVzICYgQVRNRUxfSExDRENfRElTUCkp
DQo+IC0JCWNwdV9yZWxheCgpOw0KPiArCWlmIChyZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQocmVn
bWFwLCBBVE1FTF9ITENEQ19TUiwgc3RhdHVzLA0KPiArCQkJCSAgICAgc3RhdHVzICYgQVRNRUxf
SExDRENfRElTUCwNCj4gKwkJCQkgICAgIDEwLCAxMDAwKSkNCj4gKwkJZGV2X3dhcm4oZGV2LT5k
ZXYsICJBdG1lbCBMQ0RDIHN0YXR1cyByZWdpc3RlciBESVNQU1RTIHRpbWVvdXRcbiIpOw0KPiAr
DQo+ICAgDQo+ICAgCXBtX3J1bnRpbWVfcHV0X3N5bmMoZGV2LT5kZXYpOw0KPiAgIA0K
