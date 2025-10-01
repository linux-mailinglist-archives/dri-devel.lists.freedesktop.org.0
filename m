Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D70BB1492
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 18:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3746D10E116;
	Wed,  1 Oct 2025 16:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKll7myV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A6C10E116
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759337170; x=1790873170;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WmyBbySqjpsLToRsmB9QVfa98ej+5MMHaunGnn7mayk=;
 b=DKll7myVFbg4p+N6/MWdrTidro/VWAhXE0VfFlvJOSFmeJgEbu7GaRaf
 hoHtu5AYSqd+yAB6vX2GMqyYnJ9tE1RJpLk8u8xrYYLW/vqiRg6cZK3eU
 LVqQNBY1mNiWUd2rKuqq21H/RZutOo25TQ4anGm+RtcTI2EM2vtypslA4
 0OR9J9l7//i6cLf+tN6cziQpFfQu8y1aTG4GghnjH5vJUQLhvj/4j3Kfm
 oeR20ITlZzmxbVZMPToo9s5biiOjk7H+LKD7/7QpLRcr+EptJqSENUCoP
 RLL8a6pltPMbGstl8ykFcuVBGs7yYAbL0OpfNn3yR14coyTvlLX+Vgdu8 A==;
X-CSE-ConnectionGUID: aDfLnG3ASF6H/asZFaYaAA==
X-CSE-MsgGUID: Bbl5TNJYQFyp++eKoI8+rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61655298"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="61655298"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 09:46:10 -0700
X-CSE-ConnectionGUID: BmcwMlOfTNaBx13SX6lsug==
X-CSE-MsgGUID: sdxqTFdNR2K+n2CpOu62+g==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 09:46:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 09:46:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 09:46:09 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 09:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPjbbOB3corILNw9mChc8KAa3i5HHU0MeqPpw8+YjzYHp70DtTIhGn+RBf3WbZla3uE0XKxkLPj2dQuXcs/7GqyttVDBa5sonWaYfsNYqtkqHYHeGQhY6YnvKAzgaVB6Fgkkl1N7hvs0dtMPMT6fEfyD2cslFlA5WbwknAoZ8qYcfjuiI12ShkaOV29bBFowf+3h5tBvar1hdMdkuHPHRHmV0flbYbvol6KmIsJLOEAs5gJ17Q1+VT5K3Tf0nzs6FzfY+hCA0TR5cHXAEbt0MWCo7ej72mjnctDDo6ylfB6bKb5SqYyZVilyuqKvuszOjFEmv4YVT3MOyl0fifD5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmyBbySqjpsLToRsmB9QVfa98ej+5MMHaunGnn7mayk=;
 b=qc6Oq2pYyH1fmyTjXHWiZK0QH9P/lR0ld1atdGxEbQzWeslI6V0Fyoj/63uGklqWgD1HqTlN6/ftFnSoNnU7vfEgsuJoFtthWwxvV4xDTLTM6Kw1URSzuhhsvy+4NF47YPe7Ao1b6dWF+fqV60YeRBocDM/KPKY8NWgHEM/B64jB6Po7F77+d2QRel3zEcctvZMzv/vBZfwcVM/KvhhpfmFT7ps2gsHLZLDoydvFiLWMKsHpChG+29MlRDPHh2O4WBgjXd+U0J6RGWk1H9Lh+iZbKwXbXDoavvoVfIryG/OujYnzG6aXCljcRGinbydTrEbj6kAcBQDby7XDbHOoQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by DS0PR11MB8164.namprd11.prod.outlook.com (2603:10b6:8:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 16:46:04 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 16:46:04 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 3/3] drm/virtio: Restore Virt-GPU res on hibernation
 resume via PM notifier
Thread-Topic: [PATCH v4 3/3] drm/virtio: Restore Virt-GPU res on hibernation
 resume via PM notifier
Thread-Index: AQHcMt/bovM9tMR1qE+dA93qVCn89bStf7Hg
Date: Wed, 1 Oct 2025 16:46:04 +0000
Message-ID: <PH0PR11MB511235D586E3DC67C52E215DFAE6A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <20250924194755.1265531-4-dongwon.kim@intel.com>
 <40772acf-6a9c-4049-9c27-5fa4b1312aaf@collabora.com>
In-Reply-To: <40772acf-6a9c-4049-9c27-5fa4b1312aaf@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|DS0PR11MB8164:EE_
x-ms-office365-filtering-correlation-id: 5602b4ee-55d3-4c83-d7d2-08de010a032a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZVp0VmN0Ulc1bXZ2bU9Idis1VGYreHJjd0xMb2xIdkR5cXhJZ1NxOENiUHlC?=
 =?utf-8?B?R3lhbWdGSFdIc1FRYktrZUtxYllKMStCK0s4MnhZU0NEcGNCTStvbGliMnB6?=
 =?utf-8?B?SHQvZ04zNjM3R2RnM3hBU1o2MHAyeEV1eGNGV0RmdGpBQm1zMkF1QkdTU3Er?=
 =?utf-8?B?eG5LMk8ycHJNWEJiTjQrZ2FIeW1wSk1FeEtjWU9jaTBEZlp4N3NTejRuTGxq?=
 =?utf-8?B?OWhGcVB2ZnBPa2NlWkZ5aWw3RlZtSjk0SFp6Qmk3eHNqeXlIVDZ5bzRsTDZ3?=
 =?utf-8?B?WWxZMkMxQnN4a2xWeHVlS2NPNHBQUFBPeWVBcjZDUkZkbkl1bWJGenI4d3Zo?=
 =?utf-8?B?QzRmU2pGc0M1MkloaitYL09rUFBOSno4MmtBTTQ4elRzL2NCaVBJZG5TdXRR?=
 =?utf-8?B?emRsVFVlZG9keGszM0FRL3JBUGtJRjh1MWtadEJBbzMvNEQzclFUbFZzRlZX?=
 =?utf-8?B?L3FIeTk4ckdOVWdyaG9YKytyV01OVW92b1M3emw2SWVhQWtPS0hjbU1vSFdh?=
 =?utf-8?B?OGtnaGRoVVRla2JZWmF3a0tvTjRNdEdhR0NxNTNzK0xGTnVtSnF6YkpJMTlD?=
 =?utf-8?B?MXdqZmpKbkJibk1aWWthWGVnbnVZREd4dWNRUGhDMnREMDB4MHlrS0NMZStP?=
 =?utf-8?B?U1kwTkh1SHlpdzJERFRKRk1LNExoSDArNnZQVStPeG50Vm83alMzZTRxS1pD?=
 =?utf-8?B?M1laWkJmUXpSeWRBOGR2TVB4Rm1VTHQ1dGo0NGJyNTgraUdMb1RjUWY2RTZU?=
 =?utf-8?B?YjlhQkpMTmJlV1JBZ3d2VDMwWll5c2h3RDVCS3dPTXlueVdNTWpFTmd2NkNa?=
 =?utf-8?B?b09PY0RPa3M4elpWQi9rdHZwcm5acVp2RHIzL1lmcCttbEFtbXF3MVM1NUxV?=
 =?utf-8?B?UmZUWWk2R2tKMXRxTUdtRWxuclBxWW1HVVZxRS8wT1dlTi81OFNtajFZSTU3?=
 =?utf-8?B?SmpUUTJVR3FEcm13VGpBWjN1T1NwQ1U2MUJCNE54aUx6OHhKSmN5ZHJkL0JK?=
 =?utf-8?B?WlU3OG9LM2NNYTNVSWxialJ5SXg3T2FqdGJ0Ym1Pc0FINllERnhtQmJ2dzVv?=
 =?utf-8?B?UUpvZnNRbXRTZU9uMnFtZ2N0M01jTVlqWmtxRkJHa29Rc1V3Z2ticVNmTkw5?=
 =?utf-8?B?SGxock9oSExDWHVRblR6TnV3U1VmQkpVQW9RY3VWbHhDcmYrUDk2NVA1OWVz?=
 =?utf-8?B?eVE1UGJxVjE0VnU5RFJiQjdqcytDM3pGMUtoTlNINE9Ca3JDbS9Ya2Era0RQ?=
 =?utf-8?B?bzV6dEhma1NOczFMWGpkS2d3bjViN0lOM3JXOXpvbmZTLzJLcjVhc3RsVy9P?=
 =?utf-8?B?cFdpK0k0dUtScERKVWl4ZEpqS2Q1WlRSbWowVFZQNFplcTJSYlN2eTFJZm9s?=
 =?utf-8?B?aFdtMUd3eUdTRVNhUkVtK3IyUS90eDJ0YVpuTmR1VjRDMWVJZHJFVXBxYmdL?=
 =?utf-8?B?SGFQT010TDNhaXBSWFQrTXhzc2ZkTE0xNFZMNjhYN2NDRktlMStoZHFIV1J6?=
 =?utf-8?B?YlhSUVljYUFaWVdxdzBtNlRtUmRjQjduU2dRTlArbE4ydDhrSUxaUGtxenhy?=
 =?utf-8?B?MGQzU0pxTTNzRlNMaERlbzBZZnJOWmM2UkxMd3RrM2cyODlxKzcwVFEvYXpH?=
 =?utf-8?B?U0RJaWJ4YjJqaWNMUG5oalFtUFNVamFPbmRDdzBnVFBtMkdMb3JCU1hvTXFi?=
 =?utf-8?B?bkRnZk9Gek83aklVVHdxS2Z4cGU5c1dtcTJDVTVralZYS3Eza1NLSkJWQ0ph?=
 =?utf-8?B?YjA5VVoxT0tlM1cwbm8wcVZHR1o4VjFtUFBSeWZxLy9hc0hSSjdVb3VKMlk4?=
 =?utf-8?B?Z1VNeTltWU5wTUViTmsvMk5hMXlMMGEwWXlSS1lxa1ZQSzh1QW5FOEpRQWVk?=
 =?utf-8?B?RzNFWXpFSlcxV2xuaTJCNEhyTzZxbUI5VmpVdStBY0RqeTEyK1YvWTY0NzBH?=
 =?utf-8?B?NURHZ3ZPNDZLQVA3RXF6MStjQ1RFTVlyMzlhWE1aUkJoWUFIN1pOVXlEejRk?=
 =?utf-8?B?UWhCUG9tMEhES2pqUU9tSFdzRzQ5WjJvMUpRWElCU1c2UWtLZUsyckIrRUhC?=
 =?utf-8?Q?02fbQZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkVCb2FDU1lsRmtKVFdiYnExZlR3dmd2RnRKc2xBSDBKb0lMNFFNYkpvdDY2?=
 =?utf-8?B?MmxUeGpHWXVLckxHaHo5NVlxcjFrVEc1M1BidVhvbXM0RmJyNXgyc1BrREp6?=
 =?utf-8?B?NDhNK3NmazdBN3JQRG4rd2pUWWNIcmQremZCUFRKQllaV2xjNFBQc1dZS05I?=
 =?utf-8?B?K2tYS25uU0FRd0pFV3MwT0JYS1MxUVdkZFRHMHl6TDlXYUxvOFpjK0lhMklq?=
 =?utf-8?B?Q29NVVR4RFlDc2dRTXMxOUQ1a1Z1Q1Z4MGQwQjJNS3pIWWhiVnNiUzJ5MEpS?=
 =?utf-8?B?bGllUjVWb2w5R3lLQThyeWJkV2dwdUUxaTFXUGJiV1lIdEhrOFZoYU84WktX?=
 =?utf-8?B?Qm1jMzU1Q1huM01CUlFobGtqaEtwb09wUlpLdlVrWVF4N0tMaEsrVU16YmxC?=
 =?utf-8?B?Y093bVEzYXhhaTVKOGJVeTYrZklGQytLbUpSekhPZTBENWFBSlUvZWZVaEJO?=
 =?utf-8?B?OHFIa3BKemRWQzRJV1FSOWR4OHA1RU10SndDcVFFSzd2d091OEtHOXI1ek5H?=
 =?utf-8?B?ZU1MV0JIczhLSXUzWGRqQ2VNNVkzemVBTVYzbUVsd1UyUUM2VitNejQzZ21H?=
 =?utf-8?B?VUk2aHdwbGRJNmV3SDVwTi90akJsSkQ5YUpGN3ZrOWE5Zk9JTS9BOVFpZjJk?=
 =?utf-8?B?cXlqSW94ZDBPdTNXWkFmVnNaS21wOEJld3lnVm91V3F2OHdEa3JqYTQ3dDRk?=
 =?utf-8?B?UE5lbWlUTkM1c1YzNmhBRE1zRE52MGJPWUFmbUlvd1djM09BR1F2NTBRRlpW?=
 =?utf-8?B?cDd4R0hJcTJ0T0JoS2dBUEVhOXJaSE5oYzM3TDJzVkNaTUU0M0tXek16VlVl?=
 =?utf-8?B?Z2J0bDJoOVhkenYwWVNvTjlmcDltNVZES3JvSExvQ1p6RG1TSE1IZGRucHpq?=
 =?utf-8?B?T1FlTG13OE5yMFQrWUMrSjFhdDJZaUdpMnFXeTMrWTR6eEd2ODRkTjQ1Z2dy?=
 =?utf-8?B?OWFNSnV4WmZzanhTbkNsVWpQNjZqNlBWRWNNZjFhRUlPLzdoMGk5aVpTM0RF?=
 =?utf-8?B?WHprMGhQU25RRXRHcEIzNUhMUFpTZHVZTTBTVS9ZeEFHd3U2WlRXUFFabHRE?=
 =?utf-8?B?bTFZQ1A4d3ZUbFpHZEFCdmpaWWhpb2U4K0xoNC9nbWNpMkdaYmxsUUlOVGZN?=
 =?utf-8?B?TTEvOFYzQU9BSG1qRWQ5NE5oRzIyMFRjWWMvT3ZMZXRvVFpKWmNLUmNzdE5p?=
 =?utf-8?B?L0lCaEVRSCttaWQxaEdPMzk4STc1TUFCcExuK0dMeklSZTY3R1RSdGZva1Jh?=
 =?utf-8?B?cXpkQXZsY24waGt1QUZIVVpKRnFRNnN4Umk1aUpidTdlV0E0NkJUVzBWWFVU?=
 =?utf-8?B?ZWNzWUsrU2NJcGF6dGlIdk93aXRkUlN4UnR4VnVWM00wanRML2l5bEFubWhq?=
 =?utf-8?B?ZUxGK0paUExmbDRiVmoxWUNScjN2bm0xRmRLREdCWEJMWHhWdGhvK2hEVXRt?=
 =?utf-8?B?NTN0TDNZTWMyTE9KSUh5ZXYra21jUkhOZEs3SUtjR2xmNWREMHB5U1h1SkYw?=
 =?utf-8?B?YWxMNyt2L3hTemRxME1NeEkzUXFBZ28wQ0RUMkdaWXBOU1Z6Q3BubmtKS1h5?=
 =?utf-8?B?YnhMc3RvMktxVklTRC9qbkJOKzB1Nnh3U2haTmNmZXIvQnloOFpnUjB3Y3Jo?=
 =?utf-8?B?QlIrNWlNK0tQV3AvemdjTm1rUGNNMEE5R3JZellQT2dQNGorejhwODNCT3lt?=
 =?utf-8?B?OUtmYis2b01RcDhSdmJuUDZjL0xyRWk1TWpSNm9vSVJwZlJwZWFSWUl1U2wx?=
 =?utf-8?B?WDNTdzVyMExnNjFtTEFlWU1hdFFhVGQrMTlTOEVHbW5HNkl3dXI3K3MrUHEz?=
 =?utf-8?B?OVhLMWhyMnEwcHpCT0U3eXNJU0Q5SlRkRUZwWTZZR2dGNEhmNnJjaUJBZkg1?=
 =?utf-8?B?NmlYNkVtS2E2Uy91SXkzalIrb1BNdmlvU0hqQklOV2F4MWJGRFl2ZkdCUnJY?=
 =?utf-8?B?TW5hNlN0RFBVM0t6NGJyVGsrQ2t0OE0wMncwcTUrSXFPS1l4c2MvdnM1OFZN?=
 =?utf-8?B?QkxNT2NDWWYzY0NxdEdNV1RRRmc3ZXA5Q0xDb1dTZzVTWTl4c0Q3VVZseW1T?=
 =?utf-8?B?eGZiMHlXT0h0L01Vd3k1c05PYlNOOUgvZDBwQndodElHTnFIUndnVFF0dGZX?=
 =?utf-8?Q?j9M+eItKFmKsNXM+yMinsGXgN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5602b4ee-55d3-4c83-d7d2-08de010a032a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 16:46:04.7312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CJM1SSZm6tywQLmRIdICmb1z3ENTpR+B0FE99zC+5OM0g+Cjgz1EyFz4jEbqTElP995CbWyZ/6/zL4GVl1LWNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8164
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMy8zXSBkcm0vdmlydGlvOiBS
ZXN0b3JlIFZpcnQtR1BVIHJlcyBvbiBoaWJlcm5hdGlvbg0KPiByZXN1bWUgdmlhIFBNIG5vdGlm
aWVyDQo+IA0KPiBPbiA5LzI0LzI1IDIyOjQ3LCBkb25nd29uLmtpbUBpbnRlbC5jb20gd3JvdGU6
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYw0K
PiA+IGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jDQo+ID4gaW5kZXggMDhm
OGU3MWE3MDcyLi5lMWIyY2VlMzBmYTMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2ttcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2ttcy5jDQo+ID4gQEAgLTI2LDkgKzI2LDEyIEBADQo+ID4gICNpbmNsdWRlIDxsaW51
eC92aXJ0aW8uaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19jb25maWcuaD4NCj4gPiAg
I2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19yaW5nLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9zdXNw
ZW5kLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ID4NCj4gPiAgI2lu
Y2x1ZGUgPGRybS9kcm1fZmlsZS5oPg0KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+
DQo+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4NCj4gDQo+IFRoZXJlIGlz
IG5vIG5lZWQgdG8gaW5jbHVkZSBkcm1fYXRvbWljX2hlbHBlci5oLCBBRkFJQ1QuIFBsZWFzZSBj
b3JyZWN0IHRoaXMgaW4NCj4gdjUgaW4gYWRkaXRpb24gdG8gYWRkcmVzc2luZyBjb21tZW50cyBm
cm9tIE5pcm1veSBEYXMuDQoNCltLaW0sIERvbmd3b25dIFllcywgSSB3aWxsIGRvIHNvIGluIHY1
LiBUaGFua3MNCg0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBEbWl0cnkNCg==
