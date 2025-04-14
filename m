Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A8AA87BD0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 11:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE0910E4FB;
	Mon, 14 Apr 2025 09:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="gTuK79W6";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="nFrlJX8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA8610E4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 09:26:13 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E70FAI031106;
 Mon, 14 Apr 2025 10:25:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=A7CCTFF3NFBrCgLjlY1IbGvTv
 xjz7OLxVzngFg5yMhI=; b=gTuK79W6ldljRAb2PHcnei1KNMYro1d4mBA3RQKOA
 zdX3pnGtG31nK4MS461sbsy1MTtSCKNpJIJb29jL9dIcZvtiXwc802DLvaGnMgwc
 QZBbTYCdQjqnf52iTkunL/2UaOTjiPjxnBPqzq6ERdmHkqeXCgy0GfufInNer9nZ
 V5rF2VcLZ1elQXr0nXgBrR+Ko/k0k589qtSqjZ6ATdi69gZLIhfbjHdzXx6AvcP3
 tebSqzX0DO5I0FYmvybU+zzyaFpRaHoiLE7rHY3jJO2oEzDcNWnXuByOL4ie9vu6
 pql1WcZONCZ6v+HbMqCUJGswjZM5Xwbt2oBapFy7t5Kng==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazlp17010007.outbound.protection.outlook.com [40.93.68.7])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45yeeu93h7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Apr 2025 10:25:52 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2AYQ6THNKhX1j9IYQHGBBGHlq+716cjRFahlM41cZku2Fsq+SkX/yPADhdJMBuaQrQtO5VKa2CfR2A8/sHd0bCIsz1YNXtPlfqvwPUajVqEV+/WJW44Wk5Usg/uLCuMXyfRY++0k8AaUe6rmYb5jVPnf7j2t8AjGgZQdZ8MM6quUr/PiW7StwePnEhvEmD5NVY3N+0hQIH0AUkJDY3eNb8RVi/68oVeZ2Guj3bNk6CrrU7AhwyXRJIuccik1fU9UA8qfueCF2It9nUiiuXSpkhcWu2yiaGKtgR4gj9tAvk5eGlDFqyn+oaHL+o0ReNQs5DUZJaFaLBMDzPV/RH5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7CCTFF3NFBrCgLjlY1IbGvTvxjz7OLxVzngFg5yMhI=;
 b=jzfIdFtgbDQT0HghvGazfkelzmxKJMbtgk+fV/oH3AP5PHR74HQ8GlQ2PdcRGhkLb87plBw81hPQM5TnpkRurQH9bGdED7OjtkpcdTbQlEi4XpRrz4nU6kjHmLBb6gRBVr5ZDDYNZ/54Ag1Mhy/i1/5voarvz7BhaQ7CtjHy2PDDUWaGw8MWsVUfvEfbTJbYhYN119csXoNyXo/k3do/Rr2x3faYLDm7VVF5pvzJ+9vn60gl1ziNznjjtMZFLI8a6KGyK63gWeGewaugcUc7fGIx214aGZN0eznys4kwhOEVB/N60+YO0jK4UhEeZZ3+zah9Q/V9GFgE5xUITJlGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7CCTFF3NFBrCgLjlY1IbGvTvxjz7OLxVzngFg5yMhI=;
 b=nFrlJX8Okmj4E38wPWiFWaQoiXjx1zf4VZy/gUSycC4hVsO23Mx4Pev7CJLF+N20+oix0MgPNRS22ejKRg+8Yil2X5Xbr0nZGGSA/zrJvbgQN5LlJ4vvYIPM6y9AOiL10moqK30Xw6eMaFNg/rDr6W/H6ja0Jj90dJNtyhk0yvM=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2883.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:cd::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.18; Mon, 14 Apr 2025 09:25:50 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8655.018; Mon, 14 Apr 2025
 09:25:50 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Randolph Sapp <rs@ti.com>, Darren Etheridge
 <detheridge@ti.com>, Tero Kristo <kristo@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v5 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
Thread-Topic: [PATCH v5 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
Thread-Index: AQHbrR82WN4Z+oVZxEGOZ9WAaaTFcQ==
Date: Mon, 14 Apr 2025 09:25:50 +0000
Message-ID: <2358944e-4114-4319-b2bb-0c463b18d5bb@imgtec.com>
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
 <CGME20250326164909eucas1p1525faf017c81554f0d3739123edc1298@eucas1p1.samsung.com>
 <20250326-sets-bxs-4-64-patch-v1-v5-1-e4c46e8280a9@imgtec.com>
 <a9716af2-2403-44a4-b1a7-c3ab832c3c1c@samsung.com>
In-Reply-To: <a9716af2-2403-44a4-b1a7-c3ab832c3c1c@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2883:EE_
x-ms-office365-filtering-correlation-id: 301c6d27-ea71-426e-76c7-08dd7b36588c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OWdoRTdHMmx2QjBnL3NZVVBMbURYUXRaNnNJbDhnY09OMVZ6OWZKeDJzektS?=
 =?utf-8?B?RWJGdGg5ZjhvYk1ya1NGQnVQa0QyczdXZXlvcHZQY1Y3NzloZFhDMlBzTVZT?=
 =?utf-8?B?bkVTM3owYXY5UEgvaTVOdGJJd1hjTDFEUDVBNmlubTVJZzNXd0dUelRuUmxx?=
 =?utf-8?B?ZVVPZ1g5SWRTUmdmdmd6dkRZRFQ3enJQNng2b0IrQXFsY2hlaUluN2pkWGp1?=
 =?utf-8?B?UXpmUlNMWk9WNzlUUXpUam1abG9lNEtMbFhvQThQYVFyV3hsa3JSU2hYbUxE?=
 =?utf-8?B?TTNRZWs1Q0Z4VFhuUmpqNDVHaE5FTXlNRis3RThtZlZHTVdneTR0T3QvbXJF?=
 =?utf-8?B?TkJzYktvRFlmcSs1d3dxejhNb2JoUUtBclJMMU9hbXVaeXQ2U0pvOERPWmZt?=
 =?utf-8?B?YVpqUFpOWkFpVE8xT1lNWk5ydTA2MFFiRjFOaytWb3BSTWc3TEEySHZlb1ZT?=
 =?utf-8?B?ZnJKN1RUQXNIVnZudE44MFpDaHRreFRVTlAvOVJaZ0hhOVVRcW9UWEpFaXlQ?=
 =?utf-8?B?aGp2d3l5cVdxOEVmM1ZwamEzUXVRbmJFelhTczB2S1JZVDJOSUxHK1JXUTRw?=
 =?utf-8?B?QU1xaDE1cUtCdFlVSXVPNVduNXpRMUVCNittSFdxamVnRFpPNk45Vk45RXN5?=
 =?utf-8?B?N2UzYWZ3MUp0aHZqcktqUWlMVVFVbUM2bnFzTUNySDYxdU9uU0NjTVRlTVBU?=
 =?utf-8?B?NEw5Um9RNThacnNiYVJyclJHbWV3R2Zrb05sSHlHTXhobmFDMTdmT3R2Ykpv?=
 =?utf-8?B?QzFuZkp4TUh5ems2L3pBOUIxZUFNbnBmK2JoaUFlWDRzMTBjL2grYzFCNmdp?=
 =?utf-8?B?TDhUNlB3dG9yZk85cmpQaTk0UmhLc25oLzB2aHpXQ2NzNThpdW5uNzZ0WG1u?=
 =?utf-8?B?WlFkQU9DTXFGOUhjM1FyODVEUnJwam13eEkxZFdhVFNXU3pVVS9PdWtGZ3ZZ?=
 =?utf-8?B?RlM1Y2NJZlhPZlVUVXdWdCt0MlZNQTczM1Y3VGl1RGpYUzJFVE9keE9vR0I5?=
 =?utf-8?B?eXNVNjNrb3N0TndtY1pWU3ZydC9DU2pqcFFoYTBXUVg2QnI0K1BpV0Zkdmp0?=
 =?utf-8?B?dEJhSDE3QjFOUkZNb1psS2M0UnVSTm1HQWNmNlJjdWVuUThoVTBWY2NvQ2Rq?=
 =?utf-8?B?WU4wekVSSGZSejAwb29BdmZVSXpvZHlMNEplNk4wczRoQkRPMDk5bzAyVVVv?=
 =?utf-8?B?Tk80M3FVdVRBVVFzUklMd09KMDdLZUFrSGk2TmhRRGd1SGVDZHhjZ1NsVGdm?=
 =?utf-8?B?ejQrOTdsZHNJMUhLTTk0a093bEVtMDRZOGFYUVozNU56bkVaREJvSzdicEVT?=
 =?utf-8?B?WVoxcGlRakloY0JCbWpWN1RSK0ZscmxnYzlqbVVFM1RmNTdHcFl2bXZwV0Y2?=
 =?utf-8?B?L2hCQ2lFYXI4L0UySFhWYitWTzZhTi9LUU5Fb01FWWl0M3J3RG02dGlPTGpv?=
 =?utf-8?B?QWhTMEg3UWpoQ25kVzErcUFQd1ZJc1MrSndjSUIxTTEvbm5INjBmOGJwNU5y?=
 =?utf-8?B?VklIcGRhUXFYckdQR1NJS3JUdzU1eTByZ2hMODNaU1hSTWxUSW44czBGYllS?=
 =?utf-8?B?R2szcFNZMHI0SEtHVU9uMENFd1lERTgyVmVJNFVCVVFDNU1oRy93NFFDMDdR?=
 =?utf-8?B?bnl3TjMrWmZEeGpKRFR3WVZPZWM5T2Z3V3VZT3VkcmdEeVA0dWxnT1NJa2ps?=
 =?utf-8?B?R3BJNVFybEJhNXBqTDdjL2U1SzJoQTFkdzlKYm9TeEFRYWZac0Z5SjdHR09q?=
 =?utf-8?B?MlVJRkZOeWtwcUtncm52WGU1WHNhMzVnQzZGaXNHd0l1OTdEbHcvZHJvV3NZ?=
 =?utf-8?B?ckZLVVFobXhrK2ZudmpDV252bWZQa2NSZFRYWDczcW9IVGV2WDYwNGZybHVi?=
 =?utf-8?B?YkNReWdUcUl5YWRrK2k4Z1ZCTms4RFVQMG51Z1dxcjBGQjFGT1BmTnREd1Jh?=
 =?utf-8?B?UUsrZDhGbzJNdkFsbHdvZm82YVFTVjRBTXM4OUZYcjV6bllWb3VidFVQdGE1?=
 =?utf-8?Q?4NAL3nnnzIp9tGz6mRCBG5yMwnrj60=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1FNVGtiMXBmQU1tV3VWdDFWalp0enJPUXRjVkNnaUlHOHQ5ajdmOFI4UTY0?=
 =?utf-8?B?UTNWcEpsY2xBRnYyQVlmMDZsbjNwYnp0RkUwOU50cEwxZXZrdzFOZDRwcnIr?=
 =?utf-8?B?N1p3cC9nWXhwdEVKRUprU1lMelQzSVNoM3paZXhSem1nVUxtZ0x1d0F2K2li?=
 =?utf-8?B?akJ6eWZCYVpaYTdwbkNTdElKRS9JQ0hUQVRJcUJlVkJLSDlxTUVRSFNzVmpJ?=
 =?utf-8?B?S0w4WlBRM1Bvc1R1U0R2MWNTaDRGVk5DWmVMVVFnTzhYeVlQcTY4MlJIWGxJ?=
 =?utf-8?B?dGI5czlIenJrRFhtOWpGVEFSNmplSHY0UXBXNWRJeUdidC9KRThlZWV2bnFV?=
 =?utf-8?B?WjMzU2owQ0poc2I1T3N1RXdNQ09seDBCazk1bGwyUE9OLzJQOEFhMkhJa1ZU?=
 =?utf-8?B?OCttYnN6VlUrN05heXFSVVlUUmQzWGlzMkQ0dTdrNnE1aHRkaGJxNWFhL2th?=
 =?utf-8?B?S2dzUGloVW00Tm15WThSUFd6bHVRcEFkZGRkVUJXNnlNVlFhK2F0eGlEMUNz?=
 =?utf-8?B?RjdnbFRoMW1tck1INWJRckdGTEk0NklmYjk3SU8rdWhrSVZGbjNiZ2VWcWIr?=
 =?utf-8?B?OWZOWGxIeW0vSDZGMHJvSUgza1hKdkpWaHFOQkFCbUw4b0d5SFQ4emdZeFdq?=
 =?utf-8?B?MGJiZ2pxbHJwSUo5VzA2VXIySGZFeHZqU1BtYmlPcWFieldpRjhMZ2gveDQy?=
 =?utf-8?B?V3ZxUjdmbHdBUkVSZWloR2dKdUs5bFQzVVY3MjEzUHpTOUNuUVE3M2kwbDUz?=
 =?utf-8?B?TjZ0Q25rVkNZMWJnTDNYV2ZETVlLbW5WaHhvQVRIaE1vNmFEQi9qMjFFM1R0?=
 =?utf-8?B?dU1YR1RVSTdzUnlVSmF0em9kT3ExZTVJOFRWWlp1Mm1uUTFlMWxIa0NGRmJK?=
 =?utf-8?B?QVVYdnAram55OG85ek1kZ3ptaENyZ1czL2tpQjRJSkNDYVQ2T0g5Nnhxalph?=
 =?utf-8?B?d0VyNTNRU1pIT2R5MWN6anNRazAyMFNkcWdXWWx3QXBIaWhCTjJUSkgzU2tS?=
 =?utf-8?B?N3dJckV1cU1BVFNWY2Jla1pSTXcyRUtKQitGc3diOVA5NFhPa2V1T2dsekt1?=
 =?utf-8?B?TUpMNk1KODQ5eVNpM005eDQ1eWFUMk8zV3gwaTJpYXlZWlhHdmszL2RqbTRy?=
 =?utf-8?B?QlQ0bGhSeW9tWnJ2WEZsY3BmYkVPVnQwckZiYmtBemh4VTE1QVFXM0JlL0pD?=
 =?utf-8?B?Y0lET2xhVkgzRFZ1NnFkWXovWlBuaDdhQ3lIUnhaUHVFZjk3MElqcUY3UFlj?=
 =?utf-8?B?S2RsbzBtK1YwV2o0bmYwaHlBMHU2WGFwOE5MaFdlQnJnbno2SW41VWJwVDBV?=
 =?utf-8?B?Z0tsUTBDY2xzcCt3OWMyTUVpVGNOY2MwV09oeDFpZDJnaEcxZDB4Rkd0MVk0?=
 =?utf-8?B?NGsvQlYwTHF1L0NFdVR5d0xON2dhaEZSdCs3OVkvK0RuODFmb2M4WEdnbnU4?=
 =?utf-8?B?Sm5MU1JOTW9tb0luWXJQU3ZsV2w1cGcwUWVMVm1RQ0Z6cGd5eGY3djJnekNL?=
 =?utf-8?B?bE9Nby9PcU14V2phWmxSaUNFOUIrOGI3a043VGk2VEZUS3FPQ3VmYWV0WXQw?=
 =?utf-8?B?TTMyZnI4Zm9HankzSUo5bVBuWkxJZFFmZE5iM0E1djZPdXpnb29vVkRlaDRn?=
 =?utf-8?B?NUhMTnIvSFpBM2JrckFWQjRnbXc1U09FelJaakZ2THlvQkpZOWU0TGl5eDlr?=
 =?utf-8?B?VEdaZ01UQnVmY21iQ0NlMmVUbHdybk9MbFBJaXUxSkQyM3NmREJmYnV1ekhM?=
 =?utf-8?B?Q2hYcHNRaVNPQmM3VEE2aCtIQ1dGb1pLNmc1SWIxVHh6WEdWaXY4eXY4dGhi?=
 =?utf-8?B?dzgzaUcwcTc0eFFqM2JZSHkyY1BTdTRLYUFSUnRLYm45Q0FzT3YvNmhqU05Z?=
 =?utf-8?B?UWd6UG03a28vUW5BbytCaERBVEZLZzNmK242MUxmbm1ZazhWMjZRTUdZTjNZ?=
 =?utf-8?B?VHhhWGdUWHk3ZEcyZ1lRcS9nMGE4WERBN2x3dGt1SC9SSDhnd2xIUmMrdTh6?=
 =?utf-8?B?WUhud0JEdE1MZVRBek1temF2cnRDRXo5TTZiVFpYaXpiT3V1S0RrY05mMlJp?=
 =?utf-8?B?NCtZN1NBK0FoRzlFdkw2eDlmVis4QmJqd3RUeEpGbVA5cHU5QlMxbFJrUjhO?=
 =?utf-8?B?MUpHUUNlMklPcnJpRlc1OXNOY1hnUU9zdVhjVEFKdEJ4QVpuUDVkeFVXVmNJ?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6R7sm0uTKg7XxPKv0UEl7Fo0"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 301c6d27-ea71-426e-76c7-08dd7b36588c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 09:25:50.0306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3CXQOxI7cudJ7sRZ1CcEaFHsczaLdwUgHUJeJbIaLO+l1MwFQKYhRIwqY3Piu/54adaG/FxVdbBqS7dFuyRP1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2883
X-Authority-Analysis: v=2.4 cv=Ga0XnRXL c=1 sm=1 tr=0 ts=67fcd4a1 cx=c_pps
 a=NemD1F2luIWN0MFc5Cn7GA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8
 a=GPWOr8svNsWX2gs0k-gA:9 a=QEXdDO2ut3YA:10 a=F9ZCXPdMVjOw4t0CaFQA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: aX7D8f3VTOK2cRj6RoWwQGkLZhLNgbZs
X-Proofpoint-ORIG-GUID: aX7D8f3VTOK2cRj6RoWwQGkLZhLNgbZs
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

--------------6R7sm0uTKg7XxPKv0UEl7Fo0
Content-Type: multipart/mixed; boundary="------------xBK9krFQtfpKYFhhq8SO5Scj";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Message-ID: <2358944e-4114-4319-b2bb-0c463b18d5bb@imgtec.com>
Subject: Re: [PATCH v5 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
 <CGME20250326164909eucas1p1525faf017c81554f0d3739123edc1298@eucas1p1.samsung.com>
 <20250326-sets-bxs-4-64-patch-v1-v5-1-e4c46e8280a9@imgtec.com>
 <a9716af2-2403-44a4-b1a7-c3ab832c3c1c@samsung.com>
In-Reply-To: <a9716af2-2403-44a4-b1a7-c3ab832c3c1c@samsung.com>

--------------xBK9krFQtfpKYFhhq8SO5Scj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/04/2025 17:45, Michal Wilczynski wrote:
> On 3/26/25 17:48, Matt Coster wrote:
>> The first compatible strings added for the AXE-1-16M are not sufficien=
t to
>> accurately describe all the IMG Rogue GPUs. The current "img,img-axe"
>> string refers to the entire family of Series AXE GPUs, but this is
>> primarily a marketing term and does not denote a level of hardware
>> similarity any greater than just "Rogue".
>>
>> The more specific "img,img-axe-1-16m" string refers to individual AXE-=
1-16M
>> GPU. For example, unlike the rest of the Series AXE GPUs, the AXE-1-16=
M
>> only uses a single power domain.
>>
>> The situation is actually slightly worse than described in the first
>> paragraph, since many "series" (such as Series BXS found in the TI AM6=
8
>> among others and added later in this series) contain cores with both R=
ogue
>> and Volcanic architectures.
>>
>> Besides attempting to move away from vague groupings defined only
>> by marketing terms, we want to draw a line between properties inherent=
 to
>> the IP core and choices made by the silicon vendor at integration time=
=2E
>> For instance, the number of power domains is a property of the IP core=
,
>> whereas the decision to use one or multiple clocks is a vendor one.
>=20
> Hi,
> We=E2=80=99ve had an interesting discussion on how to synchronize clock=
 and
> reset management for the T-HEAD SoC [1] with regard to the Imagination
> GPU. Long story short, there is a preference to place SoC-specific
> elements in the generic PM driver - however since drm/imagination drive=
r
> currently attempts to manage clocks itself, we would need to provide
> some empty stubs, which does seem like an ugly solution.

Hi Micha=C5=82,

I've been following the discussions on the risc-v list, I was somewhat
hoping somebody over there would come up with a perfect solution for
this one!

I definitely agree with the inclination to package the SoC-specific
quirks up in the PM driver, that feels like the right place to isolate
it from the other device drivers. I'm not sure I see the use of stubs
(essentially just always-on clocks if I understand correctly) as ugly
here.

>=20
> I agree that a number of clocks is a vendor decision, but the clocks
> doesn't have to necessarily be managed from the consumer driver. Would
> you be open to a patch which makes the clock management from the
> drm/imagination driver optional ? Same way I've proposed an optional
> reset [2] previously.

The issue here is that as far as the devicetree bindings are concerned,
the GPU *does* need those clocks. Whether they can actually be
controlled by the device driver is immaterial, since the devicetree
is a description of the hardware, not the driver.

In this integration, the GPU block has three clock connections, one just
happens to not be gateable due to some SoC quirk. There isn't a real
issue for us in that sense; the only consequence of not being able to
gate off the SYS clock is that that island will consume more power when
idle.

The use of trivial clocks such as "fixed-clock" would appear to be the
appropriate way to declare this in devicetree, so that any calls gating
the affected clock would be reduced to nops.

Cheers,
Matt

>=20
> This way if the clocks/reset are not provided, it would be assumed that=

> there is something SoC specific to how they're mangaged and they would
> be implemented in the generic PM driver.=09
>=20
> Regards,
> Micha=C5=82
>=20
> [1] - https://lore.kernel.org/all/ef17e5d1-b364-41e1-ab8b-86140cbe69b2@=
samsung.com/=20
> [2] - https://lore.kernel.org/all/20250219140239.1378758-14-m.wilczynsk=
i@samsung.com/=20
>=20
>>
>> In the original compatible strings, we must use "ti,am62-gpu" to const=
rain
>> both of these properties since the number of power domains cannot be f=
ixed
>> for "img,img-axe".
>>
>> Work is currently underway to add support for volcanic-based Imaginati=
on
>> GPUs, for which bindings will be added in "img,powervr-volcanic.yaml".=

>> As alluded to previously, the split between rogue and volcanic cores i=
s
>> non-obvious at times, so add a generic top-level "img,img-rogue" compa=
tible
>> string here to allow for simpler differentiation in devicetrees withou=
t
>> referring back to the bindings.
>>
>> The currently supported GPU (AXE-1-16M) only requires a single power
>> domain. Subsequent patches will add support for BXS-4-64 MC1, which ha=
s
>> two power domains. Add infrastructure now to allow for this.
>>
>> Also allow the dma-coherent property to be added to IMG Rogue GPUs, wh=
ich
>> are DMA devices. The decision for coherency is made at integration tim=
e and
>> this property should be applied wherever it accurately describes the
>> vendor integration.
>>
>> Note that the new required properties for power domains are conditiona=
l on
>> the new base compatible string to avoid an ABI break.
>>
>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>> ---
>> Changes in v5:
>> - Remove extraneous (and error-causing) power-domains minItems constra=
int
>> - Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v=
1-v4-1-d987cf4ca439@imgtec.com=20
>> Changes in v4:
>> - Add img,img-rogue back to ti,am62-gpu compatible strings to allow
>>   compatibility with older kernels
>> - Revert change to power-domains property and add proper constraint
>> - Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v=
1-v3-1-143b3dbef02f@imgtec.com=20
>> Changes in v3:
>> - Remove unnecessary example
>> - Remove second power domain details, add these where they're used ins=
tead
>> - Avoid ABI breaks by limiting new required properties to new compatib=
le
>>   strings and making all binding changes in a single patch.
>> - Links to v2:
>>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-1-3fd45=
d9fb0cf@imgtec.com=20
>>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-3-3fd45=
d9fb0cf@imgtec.com=20
>>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45=
d9fb0cf@imgtec.com=20
>> ---
>>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 43 +++++++++++++=
++++++---
>>  1 file changed, 38 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index 256e252f8087fa0d6081f771a01601d34b66fe19..e1056bf2af84c3eb43733b=
dc91124a66aaf51d35 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -12,10 +12,23 @@ maintainers:
>> =20
>>  properties:
>>    compatible:
>> -    items:
>> -      - enum:
>> -          - ti,am62-gpu
>> -      - const: img,img-axe # IMG AXE GPU model/revision is fully disc=
overable
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - ti,am62-gpu
>> +          - const: img,img-axe-1-16m
>> +          # This deprecated element must be kept around to allow old =
kernels to
>> +          # work with newer dts.
>> +          - const: img,img-axe
>> +          - const: img,img-rogue
>> +
>> +      # This legacy combination of compatible strings was introduced =
early on
>> +      # before the more specific GPU identifiers were used.
>> +      - items:
>> +          - enum:
>> +              - ti,am62-gpu
>> +          - const: img,img-axe
>> +        deprecated: true
>> =20
>>    reg:
>>      maxItems: 1
>> @@ -37,6 +50,12 @@ properties:
>>    power-domains:
>>      maxItems: 1
>> =20
>> +  power-domain-names:
>> +    items:
>> +      - const: a
>> +
>> +  dma-coherent: true
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -47,6 +66,18 @@ required:
>>  additionalProperties: false
>> =20
>>  allOf:
>> +  # Constraints added alongside the new compatible strings that would=
 otherwise
>> +  # create an ABI break.
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: img,img-rogue
>> +    then:
>> +      required:
>> +        - power-domains
>> +        - power-domain-names
>> +
>>    - if:
>>        properties:
>>          compatible:
>> @@ -64,10 +95,12 @@ examples:
>>      #include <dt-bindings/soc/ti,sci_pm_domain.h>
>> =20
>>      gpu@fd00000 {
>> -        compatible =3D "ti,am62-gpu", "img,img-axe";
>> +        compatible =3D "ti,am62-gpu", "img,img-axe-1-16m", "img,img-a=
xe",
>> +                     "img,img-rogue";
>>          reg =3D <0x0fd00000 0x20000>;
>>          clocks =3D <&k3_clks 187 0>;
>>          clock-names =3D "core";
>>          interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>>          power-domains =3D <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
>> +        power-domain-names =3D "a";
>>      };
>>


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------xBK9krFQtfpKYFhhq8SO5Scj--

--------------6R7sm0uTKg7XxPKv0UEl7Fo0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ/zUnQUDAAAAAAAKCRB5vBnz2d5qsFoh
AQCXgnQ8Zc8kGxyF3gZd/Nqcb79IeB4xG44r2wdAq4wvfQEApwGtNhmB3Rnao3JgKr10J3nVw2s+
HP06VjF2prjbYQg=
=VfcH
-----END PGP SIGNATURE-----

--------------6R7sm0uTKg7XxPKv0UEl7Fo0--
