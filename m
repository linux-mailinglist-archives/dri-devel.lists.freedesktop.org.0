Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D2BF205C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B489F10E2B2;
	Mon, 20 Oct 2025 15:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Z8YZE4eA";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="VxYkyAJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D80D10E2B2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:12:37 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59KBgkEf3219509; Mon, 20 Oct 2025 16:12:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=9KHUhIb7PWM2x8Hpka0UwMQNy
 1mOqW4G0FOmIzG9GZ0=; b=Z8YZE4eAI1pw9sdW5gUZhfZYYLnlyOOZ4qOpgGX5E
 SV4bJXJIAmI4tL7ykFfMRkuFSsnaMd92fEjQOMtvGcDAvFwQviZfXZv1RVBPlqst
 TUht9jovYAswXWmhOrry/12kFCiqbb0rUD7hJE5N2oCHkzu3z3JEhiy6zUkLSkfl
 z/s74fThqzNFGJLSug/jCnmn0dIUvhomteOEQdtE2geiaHSPu1PQoIyl2EgIDxkO
 2sMstiXZTToGppWo5Wpzifp+SLHCrDUQI7wa96CvxlQlW+FrdhqAE/ulJ/HZJrv0
 qdrZpWKcN+ODw5+4p/9ySEYPQ2rl2N/5REMDyUOvwtPWQ==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021089.outbound.protection.outlook.com [52.101.95.89])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 49v2ythwjm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 20 Oct 2025 16:12:17 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6vSpBQ2bbdjlfRIah9QcFJi/4k51vbZXMWv8x5MbG3fJroSRtNohlo1htmfLH7qN8/YAFPAis9SzS5N928IuQVvmTGEnMjWTWqN/ikn+ppL/IRP/mq8zFccRocZr12CH5yOlq3MxLsNId0dbfDXCOsCiBtNzmuaEMGLhCbB/oub5Nr7gDagvukCkXWn+SDTkUGOuug990hR/9y69VUZLWVm2U05P93SAjxUFhtEXw6SdiMaVYnz/F0SBH+3m4dbpHC+oiAzJ320VUgx8NfDO1vmw4WdJkxD1BKpxudHjM1YCmEYNjI4OWiEQegnOotKepdccdEwId8btuiu40BZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KHUhIb7PWM2x8Hpka0UwMQNy1mOqW4G0FOmIzG9GZ0=;
 b=OexApuP5sqBOxerJsMrf7qYqHsntcjMYaDSf9xfQe/+dy/j6Sj9XBFTYEO99ljP2JJuUMVr1s7VIgX+KGj20M3nCkQYylo7NDRdKwdCvJXLBKcIeIdES5nLBs7Z0/c/N8WtsjzfD11Zb4FGQIMwLg3MhgaYwU5Kw+H8E+t9plei8/mIxHpygB8McZiMaPOasX9sONTi7sBiTN2ZdL9+8GPWHhOsYpmLD0bVmD4hmsLdy5xKX0uJ4O060gUYw+qaIrO/XzziT7kJ+DtoUf+f1S29/SMTDmsrDqZ4zTrbUt2Wtq/2Oq8aacYs3lZuaiC+MqpgXciEb9QA01WhctsPVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KHUhIb7PWM2x8Hpka0UwMQNy1mOqW4G0FOmIzG9GZ0=;
 b=VxYkyAJldrALpY6YOCdDmqZbBFCvXcJeUoihHfkkp9/lOHRtI2tADHwonW8RAL/SBj7x7SjrJR3GBxCmj9Au4fp4ivKUr5PC3wbm6RXNXEqEx+JFq9+VZejre5mir7R1liLy+XJ79/SHnCO0QAwEQ+0/n7rOUDUwWHN12Xp3uiY=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB5824.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:268::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.17; Mon, 20 Oct 2025 15:12:15 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 15:12:14 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, David
 Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, Alessio
 Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, Rob Herring
 <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: gpu: img, powervr-rogue: Rework the allOf
 section
Thread-Topic: [PATCH 2/2] dt-bindings: gpu: img,powervr-rogue: Rework the
 allOf section
Thread-Index: AQHcQdPqwNyutwW7C0qQQyYGaJk79A==
Date: Mon, 20 Oct 2025 15:12:14 +0000
Message-ID: <a6d42c7e-1146-4bda-baf6-be04f3185c5a@imgtec.com>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB5824:EE_
x-ms-office365-filtering-correlation-id: 2179431e-7a67-4a86-bb67-08de0feb0d3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?aURQNEtuK3Q3dC9RcEQ0cVFScHk0bHFoMUZXOEtiM2s0UkJ3VVF1T2xPV25i?=
 =?utf-8?B?TGhGT0tOejFBVmU5YytscHcvRHpkVktXQzREb0lwZHUvT3VQQ0JiZUhUc3hU?=
 =?utf-8?B?M0Vjam1GYzUyakJLcTQvb0F5RUcrMk1xUE9hMGJHaldkSzkycnZreEZQV0Fv?=
 =?utf-8?B?T21CRHlQQlFrdVovdzIvRWVGamFxemQzR0EzK3crOEVFZ0xkc0F2cmJmcTQv?=
 =?utf-8?B?am1XTldwMTMwR2tpMlRnYjdSN0xxYml0QzhxUTZzNXhuME9yWGUwaDk0RTNQ?=
 =?utf-8?B?TjRNeXFXN3pmM2UvMEZWL2JjbXZMNjVLTXI2N055ZmFsc1FBMjRlUlV4c3d6?=
 =?utf-8?B?elh4c1lidnhMc2luUlBrU1hObVhpVWszdDlnYmcwbHZNT2FKZFZxc3MyRmdQ?=
 =?utf-8?B?YXdVbVBCTndsdzBuZHc3WHAwamwvM2xvSWoyU2hvUmFDN3pheWxSOHhpQnpB?=
 =?utf-8?B?SjMzOUtzbkZlai9ZTEFsRkZnUUp5Y0MwK1luQnZJWXFuNms2Zm44Rkt4KzE4?=
 =?utf-8?B?Y3N2VlpZNmNTMncvNCtBTXNBdkMySk5ZMnI1R2grNUtic1Y0TGFiNmYzZFho?=
 =?utf-8?B?Um9Kc3ZNNXVFK09rRG40Qm1oSVJLakNrNklrNHpJVzRDU3ZMUWJPamNhcUF3?=
 =?utf-8?B?UmZ5QmFEVjFOeVFIZVNKQ1VuQW42bWFlQ0dKc251S0xuM1llck9tcHRXTUlr?=
 =?utf-8?B?d2NLZDlZa0FMN2hZQjhib3NJdDBNejVLZkFLczFUbmIvc2tHSlBwdkdOMnJu?=
 =?utf-8?B?ZHpncUtvaWkxWmRCOHB3Wm44bE0yZzMySlNLNjZaUzVqRS9pc0JCVVFCOVdS?=
 =?utf-8?B?d2dnWmhYbzk1bHFXbmFGSlI4QU9DRENVTi9oVXVJemRHQ2s5b1RKU3BNazcz?=
 =?utf-8?B?SHB2b2pQdUxQR0p2WXpwK016UklmQnd2QXRNKzJzWlNXbzUxeW5jcEFrUFVn?=
 =?utf-8?B?a0czbXMxUGxad3BsUTZNRTFBVU5MRDJpUTRIazV4MWVlVmt2Y2FHMmcyKzg4?=
 =?utf-8?B?ZU5Ma0R5NnUzZCtKZmpTK2hWWkR0ZmRCeHY3bjU4MmM3NEhQNWpTZ2huK0hF?=
 =?utf-8?B?eUN0c3AvTGZkcVowa3dTbEF4MkJxYXZrZ3g4YW11SyswTGhjVnBmcVBrVzZn?=
 =?utf-8?B?VXhrRjRvV2sxd2ZROXRnQjVXZnFGZVpqUytmMmhoTGNySithZ1djS0ZWUS9a?=
 =?utf-8?B?bGJvSkQ2MVpVTGlSSDY0aEx4cWVVMlpqbkdKRjFmNlJxMXRDOEFHM25jUmZw?=
 =?utf-8?B?WVNLZ1M5WU9qanB3UTh2ZHcwRUpUTXZ3R1ZnVUdCODAvbXBUK1daVjArbldD?=
 =?utf-8?B?MEVCZTJ3eDJOcTJicldOcEJoU21mVlM3eGkvekxqVyt2Nk41eFNGQWhkaUFr?=
 =?utf-8?B?ZS81NmJTT0ZnUWlKZ3JWeTB1TWVJOEl5SGVNa0FOVTFLazNDVEVYRjBrU1Fr?=
 =?utf-8?B?WmZLTEdkYy9uSDBUZm93QnR5dHlvY201ZHh4K0YrdmlPRUZqNWlRUmRNb29H?=
 =?utf-8?B?Y3VMOG9WOGNuQVFPRDNCOUpKVVFPak1uOVBXMy8wTkcxQ080cjVsQ0pmRmxR?=
 =?utf-8?B?UXRkaTllYTczK1lMYnlyNGs0SWVaUU4zcDBZOW5PRUZoVUVEZmcxV0llcldK?=
 =?utf-8?B?UmU5RUdmVzJLWUZBZ3lUbzlDTDIwZjZmZ2gxTURlQjl3dmp2QUZoREhRZC83?=
 =?utf-8?B?VWxaSXBGSFBlKzMrZ2tVN2lPWm5vNm1UYWVONkxJd05tcDhTR01lNm9FcjN1?=
 =?utf-8?B?aWo1NHJ6WkZrMkcyTDNvVHA3Y2lKeXE1T29wa2w5blJ2NWRQVE1UZzd0U0p3?=
 =?utf-8?B?YTJEMzJKM2pEK3FwUmhVdnRsM29xQ1dBdkptZzc0eGV3bmZ2eTRxR2pjWm1I?=
 =?utf-8?B?TkFrK0lwZ3kyS0l2YXIvd3M3amNzOXY0YWxmbDdoQmx0aFpYek81b0pXOWZV?=
 =?utf-8?B?cW1hRUpCQkVLc2V2YnErRUt3M05rV3lYblRzSzE0emZibWNGMUd1ZGp4SnFL?=
 =?utf-8?B?SXpOOXNZZmhuZmw1OFdHN25PMlAwbVpGMEJobm5ZODBiOHdQZStITmZubnl0?=
 =?utf-8?Q?ef9Mzn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mjl6allWenhMQXlwOTBab253YzkzNlptVDdDaVZxSUxwaEdYWDVFTkJSZzQ1?=
 =?utf-8?B?b1g1K3k3ZEJKZmx1cmRFUEZQd1JPVmRjOEZ0QXV4Vy9vSzRSZDQzc3FLbWo4?=
 =?utf-8?B?MDN5VWFMckUrejVGZ1k3MExRZE9WTWcwb0g1QmN5OU9PRWQwR0p6elNsb0dS?=
 =?utf-8?B?YjZPUXFPVmtQUXVDdU5RY0VvRFFVT1Nvcm0vMVU0VnNDMjhFVjBadGhCZWxo?=
 =?utf-8?B?WEVDZnBDWGtHaTRkekhjd2V0ZXdDbkdweTd6S0dpalZ5bWFQUHhLY1l6d2Yy?=
 =?utf-8?B?ZE5MTEVZaXNyRFpEQWpzbFMrcklkZUhJdEZMWEZqOElkdWxQZDRpOUgzNnhQ?=
 =?utf-8?B?STRnbFhybFowVnRPUk8yYlhNKzFoekdWOHVXYzVJU0U4NFNGalE3eGgrQU9C?=
 =?utf-8?B?RU9XVTQ2dFJ3TGVwMEtOYytxNVZ5M05RS2QvLy8rdVBtdSszZmJqdmJkVHVY?=
 =?utf-8?B?SC92a2ZjMmFtS1VDZ0dmMjJMYnlUU0U1NW55TEk0Q1F6ZTlaeGVqckFhdEdo?=
 =?utf-8?B?eDh5RTdSNjV3Um44VEN4NnVUVUF1Q2htU25qUWFyQ0F1Z25ka3V2ZmRLN1Zm?=
 =?utf-8?B?NmpOWDNBZW5telFuWEVQZk5DWkJiUmJGYm9OekxVREthbUhuWTFIcFBtUzlT?=
 =?utf-8?B?WVk5WWUzNFhrWHI3aUYwMmdMcDhkK2lRL0w4RGFPZDBCQjhEZ1gzY3paaytD?=
 =?utf-8?B?TkVYWUY4aXBvRlptcTFON3ZMR0JwRytxTUtiNEh1MGQ1RzAyd0dINUxIaXZn?=
 =?utf-8?B?dVJlYjNPTmNJN21MNlpIMFZOQnpBLytUOG9zM0J4ZVB2VkU3cjcrYzN5MHk2?=
 =?utf-8?B?RjdnNy9URllLdHJja0dxRUlnQXZGYzFOT01YNlRxdGs0c3RzNTdQR2ZVTm5B?=
 =?utf-8?B?MXdRN0p3WXJyOG9DQ0ZvbHFUZVpDK0crQlg1cld1RWpyRmozWGdEMTlCRHln?=
 =?utf-8?B?b0ZFc1lINkRiQW14MmFmRnE4NzJsc21TZUhIN3JJUkJFWHIxTklhdW9FWW1H?=
 =?utf-8?B?cXd3U0RDVUdjTWZLZmdKOGtFbmF4eXlGWUVKNk01cTZWTzZnQUtRaDNFdjlB?=
 =?utf-8?B?cUpScUQzZ2lBMEpiNUovR1d4dXpWdGVudWtmTjQ1T05xaEZibi93SXBrb2FR?=
 =?utf-8?B?NnBKK0NYcEhKMXBBc1QvS1pCY0hsZmQ4UExzQ2RnelFhLzYrRGo3cVJqTnBO?=
 =?utf-8?B?a2VpMEo2TUluVGk4RmxqOHloeHVvblJ5WTdEeFk5REEvY24yTkJKb1NxVnJh?=
 =?utf-8?B?cU9sbytlU0FmZG8zSDh1WDlnaHI3NzM4RVluNHdvT0dvZVQrakFreDU3UzhH?=
 =?utf-8?B?SWVtd3Z6cThPVjNMa3NZZEdrMjYxQVhOUmRhQWQ0cVlVRkxJNW00YThFU1Fo?=
 =?utf-8?B?eGtBRklCNTZ3TXRnNGhWQTFDQThUZHhqWWE4a2xTOFkzeXlvRm9BaXM0Y2Zx?=
 =?utf-8?B?ZzlkZ2lmREErSjdBa1FzaG82VDU5VFpha05PNkJVNlh5bGtlY2U1Y2hreXZM?=
 =?utf-8?B?SVhQNy82eUJHMVdaWC9xUUtIc0FLME5aRlo3ZEJtLzJ1RVgvQlVWYXQ4cnFR?=
 =?utf-8?B?QWhJd0RmaVVBQWpDTTd6QU9wcDluSld6a1N2SHNaMXhUVmp5QXhLcHEyNXVy?=
 =?utf-8?B?RCs1SFFpaGpjUjAwSnRteVgxMTdzZzk2N0sxY0JzVktrWjBUVTU0UHArZW5w?=
 =?utf-8?B?UFZTbHJ6Y1hUelFrM0VqWlR4MXVCNVFKcS85MTBvTENqNFNwRUdNbXo3U2xG?=
 =?utf-8?B?UFhqWEJGZ2pWdjZPQVlwTitVMm5UUXdsV29adWZCREJyTXdsSWh4cGp6a2l2?=
 =?utf-8?B?QmpiQ083eHpKZGZhTEZuVTVMeVcvbnlRSnhod012ZGFCQnpDMHQ5UEFxRVFW?=
 =?utf-8?B?czJoeGNhWWF2Mm02K3M5d2xjTCthalNpWUttTlVUN2dQTmFYTzlsRFNhRnow?=
 =?utf-8?B?TXZVYitZVDFVWU1rL0VxaU9ycmRiVyswdmcrdmNNbmg0N3d2blFvN2hkYXUy?=
 =?utf-8?B?aFBWc1F6bnZPd29BOW1ua2ZMZlRJWm9ZdGY2aVVMcHpTYXRDbzRPOVBlaTZM?=
 =?utf-8?B?Z2RQWXk1Vzd2R0Z0bWp4WWF6aGlDUEFPaG8vbDQ3ckh5bnAzZXhqZ04rbVVV?=
 =?utf-8?B?Vy9HdVVHSkhDL0xRaG9DZmxCcU82OFVsTTE1eWhOQWg4dnkrM1luRTkydEU4?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0KbfnyOFJm5Vjy0Iqilmqlgf"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2179431e-7a67-4a86-bb67-08de0feb0d3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 15:12:14.6789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ILYKCGaCVc1pBkhR5xbzusmIpYZdbBIeBnvsshRlDW7jhpuasSz3wCRst3piTgaHGW6ZCvEpU4j7f4XVzO31UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5824
X-Authority-Analysis: v=2.4 cv=VqMuwu2n c=1 sm=1 tr=0 ts=68f65152 cx=c_pps
 a=XGMez45H97LGCOkXRSAzOA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=yC-0_ovQAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=wc-JgpuGGWfmt088WbYA:9 a=QEXdDO2ut3YA:10
 a=BRakK8rH6Sm7Q0xKOQMA:9 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEyNyBTYWx0ZWRfXy79ybPd0hRH9
 z6nlyLor8TUutiaXSnBHkovEpnmnF4Fk7Wk/UaDvBYCWaqJJKW/okezuUeaU3Erfwzaf/u5OFoc
 2ibLqsxqLq8DlUb6CfUSz5H0ybFvOO7/g7ZhgjLAXrJYFSrYf7lNBG1sLLNC2t45XREPBrztwer
 tN2OSZP+XFHMBOSvbZzqLevq9HtPVsXA5upWmlZJFVdBZaXqYcU0YEA2iaJP1i7+odjozhm2Am5
 4y5Hwzx/7iJFV5OY4m0z6MlMd259gF/eBINWQA5OZHDeXbBhE8N1OIlLHCGLE29bSkPxBy8GC7k
 KJdYI3pCGkYULChyOjY6Im6VrZ1HoEzmWn0ND3kDRL994Ml9bbUJB5tZ0uyN9pnEAK7OtFRJxwb
 2USPQa8fQ7qW2f124QjF3VXiVuc4EA==
X-Proofpoint-GUID: JrocG8oKlU2KgJ2YFthn1NDInaUaWqaL
X-Proofpoint-ORIG-GUID: JrocG8oKlU2KgJ2YFthn1NDInaUaWqaL
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

--------------0KbfnyOFJm5Vjy0Iqilmqlgf
Content-Type: multipart/mixed; boundary="------------ovmlyQCO70CNMJ0XWfhoOiRJ";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Message-ID: <a6d42c7e-1146-4bda-baf6-be04f3185c5a@imgtec.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpu: img,powervr-rogue: Rework the allOf
 section
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>

--------------ovmlyQCO70CNMJ0XWfhoOiRJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On 18/10/2025 14:00, Marek Vasut wrote:
> Rework the current allOf: section such that all handling of
> clocks/clock-names properties happens first, and all handling
> of power-domains/power-domain-names happens second.

The original layout of the allOf: section was power-domains first, then
clock-domains. The actual ordering really doesn't matter, but I wonder
if it would make for a slightly cleaner patch to do it that way round?
In that instance, you would only have to split apart the section for
thead,th1520-gpu, moving the "special single power domain" part and "3
clocks" part into their appropriate positions.

>=20
> This allows the allOf section to limit various GPU models to
> matching clocks count in the first half, and apply the same
> for power-domains count in the second half, without conflating
> the two limits together.

Sounds good to me :)

Cheers,
Matt

>=20
> This makes addition of GPU models with different clocks and
> power-domains count easier. No functional change intended.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../bindings/gpu/img,powervr-rogue.yaml       | 40 +++++++++++--------=

>  1 file changed, 24 insertions(+), 16 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index bee4ab1a1f805..829febd8e0f40 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -86,16 +86,13 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: img,img-axe-1-16m
> +            enum:
> +              - ti,am62-gpu
> +              - ti,j721s2-gpu
>      then:
>        properties:
> -        power-domains:
> -          maxItems: 1
> -        power-domain-names:
> +        clocks:
>            maxItems: 1
> -      required:
> -        - power-domains
> -        - power-domain-names
> =20
>    - if:
>        properties:
> @@ -108,13 +105,21 @@ allOf:
>            minItems: 3
>          clock-names:
>            minItems: 3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: img,img-axe-1-16m
> +    then:
> +      properties:
>          power-domains:
> -          items:
> -            - description: The single, unified power domain for the GP=
U on the
> -                TH1520 SoC, integrating all internal IP power domains.=

> -        power-domain-names: false
> +          maxItems: 1
> +        power-domain-names:
> +          maxItems: 1
>        required:
>          - power-domains
> +        - power-domain-names
> =20
>    - if:
>        properties:
> @@ -135,13 +140,16 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            enum:
> -              - ti,am62-gpu
> -              - ti,j721s2-gpu
> +            const: thead,th1520-gpu
>      then:
>        properties:
> -        clocks:
> -          maxItems: 1
> +        power-domains:
> +          items:
> +            - description: The single, unified power domain for the GP=
U on the
> +                TH1520 SoC, integrating all internal IP power domains.=

> +        power-domain-names: false
> +      required:
> +        - power-domains
> =20
>  examples:
>    - |


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------ovmlyQCO70CNMJ0XWfhoOiRJ--

--------------0KbfnyOFJm5Vjy0Iqilmqlgf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaPZRTgUDAAAAAAAKCRB5vBnz2d5qsACI
AQDEqM4tggwPZ5y46V/wKZq8lq0nuaZ3E/24BaghATGUSAEAypXPg34p0AeCuWE2dzETMYmFYpnn
xtAq6HxHwUZBDQM=
=m3hX
-----END PGP SIGNATURE-----

--------------0KbfnyOFJm5Vjy0Iqilmqlgf--
