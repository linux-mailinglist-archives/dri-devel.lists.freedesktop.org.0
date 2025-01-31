Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE8A23FF5
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 16:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5049610E376;
	Fri, 31 Jan 2025 15:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ARsGUDcn";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="k1b/cUWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931B310E374
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 15:59:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VF56W1028214;
 Fri, 31 Jan 2025 15:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=DMHJHtFARTRcNs/xTMQWU5YFs
 /AQNFi+ikCg3usARSk=; b=ARsGUDcn5/MaZ8DbRyPJKFumER4dFhB7vlvxGeMde
 /bcSEW3P8DtvTirMp4euxL827dVrX1GCqIrRKHqaB/B8+lWSg4mrVww14SF6LoCR
 7RRXEWOIu8Z0Ou2SAC478lgx9BKpjH++45eNu14TJM15l8HF3TMoFSXySNGQFBX6
 z39PYmMzrwTR4ZMorJo7espDd0EWVgWtUlgkip+SrmYWYqT6/MvACigYmPzjrwBL
 e4bxQOoYEQGGcMlWiNQjLKMID5v2Y21EItRzbbPwRkvuom1jX1Wa1cSSv5I2lM+a
 MaiBuRDJaxnfwjAAnWVtU6jtFi0S25GOce3SWfNZas9RA==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011029.outbound.protection.outlook.com [40.93.67.29])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 44ep3c302s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 15:39:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sg5GdLe1SnhyZBXwtyaYKdLRbGySkdMjK5+gf1U81PLtTH2uRFRdCDO+nRJ3j1SQRGJ+/u2uhgAc8ScJfqH72HS4hAwuW771lU6jzbIPX73qsj0r7p6AWLueky+7ac0nvnu5aTjh9qorYNfOYlnlf7ZHdZbgcpX1KEE12KNutaMGkGmOnzt9DhpkAAU0q8dV3TpXTk8siPjit+8r4jJQ4h9OfLt1BGUt+c1kezqPDhV7DNH0Usl3Q9luh6AQhbQgbNEbw0f0RguSi8Z9T9HXm2kv6WL8NC5h174XxPduSFKbGEAMy690GYW9RXVBXMlT7ViDy366PDq9YRrS6t3Zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMHJHtFARTRcNs/xTMQWU5YFs/AQNFi+ikCg3usARSk=;
 b=r7TLK6Io3+023We+ccx+i0+OE5md0Tl1rqEAZ5ZSlnslsQ+5qLwbegxcTUXEQaSDEVmCcTCebRqpgRhfpBRPc+23kW3mSdQi96IPztqVJQg+qK8Nqd5utFazCHEkuaa8PvSff53Aainc7qkXmZVAVkonAJFlGOzjHfaPrJLLl7NwKGxfjhVe9Wm/M+Il6a+KnmGBaNRZ2qabwZi40kJuojmkAQz0J4VcHD1RV2TRWPJUF98T7PlJ+OnkzmYNTjVYyp2GiXSlJ0mz3vUX2nSaDy7sN0xW2mea4iVRzMnxeZO78C3J7dXOhi7yTcPh1snT73jtJfckFlJQma4pmT0ZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMHJHtFARTRcNs/xTMQWU5YFs/AQNFi+ikCg3usARSk=;
 b=k1b/cUWI8IrCGIkdq+omQYyduAtErHObBACbh69hG0zwTgP9f3u9cPx3WGyJAqcc40EfzV8KpReFme/nthfXdGa8K7wZ84DkB8rpc+bpoocYn2Ci8MwzlMwWDsIbk8cdo81PQaWtgGYuKrQiJZmJ7BB2VkgsH9yEsJdbyShHOJE=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB5503.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:287::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Fri, 31 Jan 2025 15:39:22 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 15:39:22 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
 <Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "jszhang@kernel.org"
 <jszhang@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 02/18] clk: thead: Add clock support for VO subsystem
 in T-Head TH1520 SoC
Thread-Topic: [PATCH v4 02/18] clk: thead: Add clock support for VO subsystem
 in T-Head TH1520 SoC
Thread-Index: AQHbc/ZMZNoZego2hUqkbD0QP2EI2w==
Date: Fri, 31 Jan 2025 15:39:22 +0000
Message-ID: <cf668998-4f86-4a85-8137-7a8f689c2aa9@imgtec.com>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194827eucas1p25db822456e223563b8b411f77754c760@eucas1p2.samsung.com>
 <20250128194816.2185326-3-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-3-m.wilczynski@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB5503:EE_
x-ms-office365-filtering-correlation-id: 82e63df7-6bb1-44a2-3eb9-08dd420d6f1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?Um5hWHNrSEc3NXNVdzJVbE40MlpQVFRaeUxuUlMrZjd3RjZVY1RPdDR5UUdG?=
 =?utf-8?B?TEc1Nm9FWVFMdmJ2dkpJMzlpb2pmQ1pGSWVUVUt6SEFZYWxWd0JjSlJLckdr?=
 =?utf-8?B?ZzhjMFVDcEZVUFQyQlVEVEJnUEU0V0g5OVJ0S3gxZUNUaGFTb24vYTdvL0tR?=
 =?utf-8?B?S0VZWTl1U0Y5b3NkN3UvSXFJaXR5T0JiM1llNDlzbms5SFh0LzUxbTBDdGt2?=
 =?utf-8?B?OVhVNlltVDhSVnJHYnhabnZxZnRhUGU3ckE5YWRIdjV1Z25aZlprWE4rV0xy?=
 =?utf-8?B?ZjhzNFF5MC9GVG9XMnp5QXk3OEpMbE9BMk5mRkd3SEhBZDdGS0pyZ0RSbUFl?=
 =?utf-8?B?dEkwbGM3ZWV3NktMVzhvVmxvaWxuOVluRlhvUVNyTXVKNHRtMUY1b3NhVHU2?=
 =?utf-8?B?QisraGVFT3JrcGg4SCtveW5MejJLTFltc0EyZ2k0a1hQT3czRDkrTTlXYmEz?=
 =?utf-8?B?NTROeHhpSkwzRlRBdWtrRGtuOThLYW1Tc3cyYVRLMEhZdElZcGVCbkJUMzNU?=
 =?utf-8?B?QnBySk1MWDFYNk42ZzdhUkQ1Vyt0d1RDaDJhaEp6djBHTkl0Mk5xQmtrWlpR?=
 =?utf-8?B?eDE1d005TDJCSzF1RDcwMUtEbzMrWnBkU3o2NjM4bWlYaGxUZVNhaXczNWpm?=
 =?utf-8?B?TTJWL0tZck9MZktlVjFsRjNBcXl4dkg4V3czOHlkWnprZEVBV29tYzcra25K?=
 =?utf-8?B?bTNDZXFFdGREWkpNOGZtTnFaeDBoZ0VzQ2lWWU5xbWNqTEdjSXAzWkd5OTJK?=
 =?utf-8?B?cEJBb2Q0TXVNQjhJZlpWdmhUWCtwWGgrRlNpRnVRdXF6cGIrT1NDbmdwTTdP?=
 =?utf-8?B?amtsN0RJMFNSKzVFOFhjSXR3cnZXMThEWm9lcnVGWlp1VksydG5YQU9NYVFm?=
 =?utf-8?B?UjFLY3YrN0xONGp1Mzlwc25zUVJyVjRucFRLL2NvMU45M3g0NU8xVFU5UGFJ?=
 =?utf-8?B?RWp0UVU2SDZsMnZyV2FzOGN2bEVrSGVNdWppYUViNXU0dEVwd1R1VHFPNTdJ?=
 =?utf-8?B?aWRXNTZQWUtoSXJlcEMzVlFxVzdnb2djU3paSTZVZGtJQmZidHl1bVdHajQy?=
 =?utf-8?B?UkZPWU1VeitjY09zVFRDdVdjdTFHZ2JZZFZhZEd6SUk4ZEs2K1hBUWE1blhq?=
 =?utf-8?B?akFhWm9SSytMZ1dFbnFoaFR0Um1BVVV5N2hGRUczczU1Z21zWS9uc0FmcUln?=
 =?utf-8?B?cFVFa1dJOGNRYWIyYzRIblJnRmhubVN0RXIwN3NMUDJ1NHRKVWl1QlRMMEF6?=
 =?utf-8?B?Z1BYYTRrditVYVNnSzJBRWJ3U0Y3ZzNPYTdUaEExaGdBRDAyVG9DZ0NqWDBV?=
 =?utf-8?B?UGF4akVldmVySGJ5ZW5mdFp6Wi9HSnpUMzZBTEpsWW1pK2FDOUptRmlVeFAy?=
 =?utf-8?B?TVNpdG9xRUdMMUp0dlpOSnVEbjI1OGhWS1lNaDF6RmdqaUN4SVMrUnVHUHA3?=
 =?utf-8?B?YXdkcnJla3F4U2JwWCtRMzdMUzFXaGE0RXpxMlZCbWhlck5qbm81OG5xaDQy?=
 =?utf-8?B?OGRXbWNTbmp6S0FyZFNIZkZLRjZFWGZpWUtnNXpQUGtIVHk4dlorZmtwOUlV?=
 =?utf-8?B?alc2akNWZE9FeHVIMGtOQnR5eWRSelBibDRSbGpWV2lMcis0d0YycTdvL2lL?=
 =?utf-8?B?eVhJcUFhQWhWeG1VcmRNU0djS2c5UkN4c3A5c0N6UXgvZEZWUnJEM1VPNEdM?=
 =?utf-8?B?cEU5NWlPYUNZQnBleHVWeTNtT2NLcFFzWHNLcklvNjVtWjQ0SWx1bDJIeGVN?=
 =?utf-8?B?RzFBaE14YTVzSUhnd2VNSFdyYlFRS0dmOUVXVUNIenVuQWlVV08rTUpZRGNP?=
 =?utf-8?B?M3ZtczBZSGFuUTNFSDZYRVhUZlNpdW9pYnlPT3VWRnNVeDZaYmRPbk1jR3Y3?=
 =?utf-8?B?dnJ5U1hSNGZEdTFMajJEbmlxVzV5SFNyd3F1K01KTDNySEZMTTZ2d0JTZVhU?=
 =?utf-8?Q?uC2Xy9+5La0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDFqTkxvMHdJZjdGQ3BhOGVBZlp3K21kQ0tPQ1pBZ2lQVmdxSUdtcGxxU3By?=
 =?utf-8?B?bVBzMFFOL0t4RGRnYXBPUkdyb1g0U0NFOHRva2IwMjhRaUk4b21KTlY2M0NO?=
 =?utf-8?B?STZWNjBKbVNCUkFuUll4WUsrNUZkbzNKMlB3SytZNzNQSGRJd3U3alVTSDNV?=
 =?utf-8?B?UGhvd1loRCszOVhueGNKYmNOYzRHU2djMWlXbHJRanh2WXJieUdtYTZMRkNr?=
 =?utf-8?B?QXJBR2labDUxWnYyOU0rcWlheVdnSkQ0eVFhRG8zMjE0aEJwOUZwdGNEOWNy?=
 =?utf-8?B?RHNscHhxMEVlZVRZQ25TSEtENnVMZXRvVVg1TnNPNFB0ZVBiOXhVQVFlMC9V?=
 =?utf-8?B?MEhpTkk4amtSZ0xxR3IyN1NpcDRMNHp2dVNFdzBPRVg4WTc3WDQ2SUoyRHJZ?=
 =?utf-8?B?ayt6SFlkSEJIYUd4STdLVHRFOXNoRzkreU83eXpBZXVSMTk0SHFWYThiOUZ5?=
 =?utf-8?B?OVFCbmxzQjdEaG1ZZTdlM1h6aFdJVXlFVFZrWVE2T0RqcHRZclhwOFljdkxU?=
 =?utf-8?B?RmNsb0tTbDhMbXlPR1JGMFdSMHpIQ0JWVHJQSVZzQ0hXY2QyTDlpVlhpYXZz?=
 =?utf-8?B?WlhnT1JSbWIzZ3V4RjdmOEJldkJ0aHVNSjdkTWRLOEkzNzQwUXBzc3ZSR3ZW?=
 =?utf-8?B?MStxTVpyOWVLN2dRM0tJcThOYVN4ZzZ4cE5XRlh6elNzYWhtRXNQaE5NUVFE?=
 =?utf-8?B?T0NTTjdxZmJIK01Eb3RYR29BYUtaQzkxQk81UEdaZStZa0kydEZiWG9lZmF1?=
 =?utf-8?B?ODFxekU1UDJ4ZUZpS0hyMERuaXpDNVBVWkdkVkpIVEprcElrMllwL1N5Mlky?=
 =?utf-8?B?UFgzbGZZWkZLd1NIdSs3ai9MaFNmSHlyVUtSbGtwNlJoUmVkdGQ2VFVWb3hT?=
 =?utf-8?B?bGlTcVhZMkhQSXhYTlNCL2pKWVZoSWRyMktLK2ZaN2kvZlhaWUtCVitnbE04?=
 =?utf-8?B?SjZLWEhrSEZXUExkcGVXOWRDZk42b1BIeDA4Rm1hMXgzTUJ4akg3c2wreWtj?=
 =?utf-8?B?UDhaSzFlbmkzU0gvMlorN2ViRnB4V1FmMTFvN0h6cVJoeVFoZnRUZnZFMXBE?=
 =?utf-8?B?THZjMUwzdzA2Z3daMy9RZEZMOGJBTGROc0pXYlcyeHhrbVI2ZFJVY0piQkRJ?=
 =?utf-8?B?N3lFbDV2ajVyWFVMWEJmbi95WmZpY0pERTNiV0pobWM5bnZ0empJUDFiT3Mz?=
 =?utf-8?B?V1djck1jMDVMSU0xaHNBYXVoZzBPUFVoZ3pwNXNFbGhDWGd5SGxYemszRktj?=
 =?utf-8?B?VnZ1WG5ubXlGZys1RzlrNSsyc0pzSUlKMWVmckNjREwya1p4aFlCcFdNcFNL?=
 =?utf-8?B?QmFqOUR1SEo3VkliVWlrb0xPNVpjQVZKd0NCK1lMdzlpODBVUGJpVmdNelpG?=
 =?utf-8?B?K2NNSHBHdXY0TFVnR2ZHWWE0Z2dWN3RjQVVBeUpGU1VmYnUxc2xoV0V0a1N2?=
 =?utf-8?B?T3V5ZjJrY1E0WlJSa3lVVXdKa1lkVTJ0TWp4Q1dTRlhLNjlYZERRdzdzYVkx?=
 =?utf-8?B?R3A0ajd0NytBZkxPMW95TjZPaUpvYk1QWEo1UzR3MTk5aUI0d1ErV040bWYy?=
 =?utf-8?B?dEgwcEJaam5HV3hEbE95dXl1VnVGZ0V6QzNXYm1pOEtQZjkyc0x4K1dWaTIx?=
 =?utf-8?B?bnhiaGJlN1hwMUlYWk9VUGh3K2ZPa0xXc0hFejB2YXVVMHBxTTBac29FRzVu?=
 =?utf-8?B?SUdpYWI0d2E0NXV0OFpyQjFMZFRwNDVacnZtZjY0aVd2RFJXdDRwK0h0ZVow?=
 =?utf-8?B?cDlvbnVldkdtZjhqd245OUFhYm94MVlwMVh1NGVrMjlZdGtpVmZyKzU3SVFa?=
 =?utf-8?B?bWJqN3MvNHJkWjFaTnRzM2NWTXhmYitzM2o5RDQzbytnS2FHVC9yMTN6dmdI?=
 =?utf-8?B?eXZMdCtma0JMZ1hQRGh5bjNjZFphVGZNbU1ydUUzRThDbzNVM2MwbVRiOGZn?=
 =?utf-8?B?djFtdUxjUytDZUgzTEZPM3Y4VHNjUUJJY2JpRmZTcnpwL0ViMHFieFBpNyts?=
 =?utf-8?B?b1dyWDNsU1dpcGpNTzlncFAxK095YVQ4MUsvOG5XQVA4eG52VytGNjNwR01U?=
 =?utf-8?B?cXNCUVVCelk4bUluc1JtNGZuTVB0dU9DSUFBeXY5dG0yR1JJNDlGcmJCMUJT?=
 =?utf-8?B?TGkyZUM3L3cxRlRnekRCdnpPRzJnZ21nMFBZZTBnczJkVFcwMDRFaW1CTzZv?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jkuz8klicTr03P3PrhKep0KO"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e63df7-6bb1-44a2-3eb9-08dd420d6f1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 15:39:22.2487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+SSvVV0JZfWFGinSxUxvp99Br4zHitvulIuNklIcCnVcRPQOqtCG1BWlxxjLJYuSk9Za/RAMf0ifTrzNJ36OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5503
X-Proofpoint-GUID: inlET9cWfCZ5wqKY4zeUFlg1coGWmucq
X-Authority-Analysis: v=2.4 cv=PoBpbxM3 c=1 sm=1 tr=0 ts=679ceeac cx=c_pps
 a=mRJfeTHGti1YOx0CH8CfHg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=xVOUUHzFAAAA:8 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=3yQmnoH8_tkYcm3O6ZwA:9
 a=QEXdDO2ut3YA:10 a=ISgEDxiQpJvkg5DMPToA:9 a=FfaGCDsud1wA:10
 a=BFkDlhTjP3qpOTzr41qL:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: inlET9cWfCZ5wqKY4zeUFlg1coGWmucq
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

--------------jkuz8klicTr03P3PrhKep0KO
Content-Type: multipart/mixed; boundary="------------KMUnNqRXVfTSk0ZKCUXePycU";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Message-ID: <cf668998-4f86-4a85-8137-7a8f689c2aa9@imgtec.com>
Subject: Re: [PATCH v4 02/18] clk: thead: Add clock support for VO subsystem
 in T-Head TH1520 SoC
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194827eucas1p25db822456e223563b8b411f77754c760@eucas1p2.samsung.com>
 <20250128194816.2185326-3-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-3-m.wilczynski@samsung.com>

--------------KMUnNqRXVfTSk0ZKCUXePycU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28/01/2025 19:48, Michal Wilczynski wrote:
> The T-Head TH1520 SoC integrates a variety of clocks for its subsystems=
,
> including the Application Processor (AP) and the Video Output (VO) [1].=

> Up until now, the T-Head clock driver only supported AP clocks.
>=20
> This commit extends the driver to provide clock functionality for the V=
O
> subsystem. At this stage, the focus is on implementing the VO clock
> gates, as these are currently the most relevant and required components=

> for enabling and disabling the VO subsystem functionality.  Future
> enhancements may introduce additional VO-related clocks as necessary.
>=20
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/do=
cs/TH1520%20System%20User%20Manual.pdf  [1]
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 197 +++++++++++++++++++++++++-----=

>  1 file changed, 169 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-=
th1520-ap.c
> index 4c9555fc6184..57972589f120 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -847,6 +847,67 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi=
_aclk_pd, 0x20c, BIT(3), 0);
>  static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, BIT=
(2), 0);
>  static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, BIT=
(1), 0);
> =20
> +static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
> +		video_pll_clk_pd, 0x0, BIT(0), 0);
> +static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_=
clk_pd,
> +		0x0, BIT(3), 0);
> +static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
> +		video_pll_clk_pd, 0x0, BIT(4), 0);

I see CORE and CFG clocks here; what about MEM? It's listed in the
linked TRM as BIT(2).

Cheers,
Matt

> +static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
> +		video_pll_clk_pd, 0x0, BIT(5), 0);
> +static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
> +		video_pll_clk_pd, 0x0, BIT(6), 0);
> +static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, =
0x0,
> +		BIT(7), 0);
> +static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, =
0x0,
> +		BIT(8), 0);
> +static CCU_GATE(CLK_DPU_CCLK, dpu_cclk, "dpu-cclk", video_pll_clk_pd, =
0x0,
> +		BIT(9), 0);
> +static CCU_GATE(CLK_HDMI_SFR, hdmi_sfr_clk, "hdmi-sfr-clk", video_pll_=
clk_pd,
> +		0x0, BIT(10), 0);
> +static CCU_GATE(CLK_HDMI_PCLK, hdmi_pclk, "hdmi-pclk", video_pll_clk_p=
d, 0x0,
> +		BIT(11), 0);
> +static CCU_GATE(CLK_HDMI_CEC, hdmi_cec_clk, "hdmi-cec-clk", video_pll_=
clk_pd,
> +		0x0, BIT(12), 0);
> +static CCU_GATE(CLK_MIPI_DSI0_PCLK, mipi_dsi0_pclk, "mipi-dsi0-pclk",
> +		video_pll_clk_pd, 0x0, BIT(13), 0);
> +static CCU_GATE(CLK_MIPI_DSI1_PCLK, mipi_dsi1_pclk, "mipi-dsi1-pclk",
> +		video_pll_clk_pd, 0x0, BIT(14), 0);
> +static CCU_GATE(CLK_MIPI_DSI0_CFG, mipi_dsi0_cfg_clk, "mipi-dsi0-cfg-c=
lk",
> +		video_pll_clk_pd, 0x0, BIT(15), 0);
> +static CCU_GATE(CLK_MIPI_DSI1_CFG, mipi_dsi1_cfg_clk, "mipi-dsi1-cfg-c=
lk",
> +		video_pll_clk_pd, 0x0, BIT(16), 0);
> +static CCU_GATE(CLK_MIPI_DSI0_REFCLK, mipi_dsi0_refclk, "mipi-dsi0-ref=
clk",
> +		video_pll_clk_pd, 0x0, BIT(17), 0);
> +static CCU_GATE(CLK_MIPI_DSI1_REFCLK, mipi_dsi1_refclk, "mipi-dsi1-ref=
clk",
> +		video_pll_clk_pd, 0x0, BIT(18), 0);
> +static CCU_GATE(CLK_HDMI_I2S, hdmi_i2s_clk, "hdmi-i2s-clk", video_pll_=
clk_pd,
> +		0x0, BIT(19), 0);
> +static CCU_GATE(CLK_X2H_DPU1_ACLK, x2h_dpu1_aclk, "x2h-dpu1-aclk",
> +		video_pll_clk_pd, 0x0, BIT(20), 0);
> +static CCU_GATE(CLK_X2H_DPU_ACLK, x2h_dpu_aclk, "x2h-dpu-aclk",
> +		video_pll_clk_pd, 0x0, BIT(21), 0);
> +static CCU_GATE(CLK_AXI4_VO_PCLK, axi4_vo_pclk, "axi4-vo-pclk",
> +		video_pll_clk_pd, 0x0, BIT(22), 0);
> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU_PCLK, iopmp_vosys_dpu_pclk,
> +		"iopmp-vosys-dpu-pclk", video_pll_clk_pd, 0x0, BIT(23), 0);
> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU1_PCLK, iopmp_vosys_dpu1_pclk,
> +		"iopmp-vosys-dpu1-pclk", video_pll_clk_pd, 0x0, BIT(24), 0);
> +static CCU_GATE(CLK_IOPMP_VOSYS_GPU_PCLK, iopmp_vosys_gpu_pclk,
> +		"iopmp-vosys-gpu-pclk", video_pll_clk_pd, 0x0, BIT(25), 0);
> +static CCU_GATE(CLK_IOPMP_DPU1_ACLK, iopmp_dpu1_aclk, "iopmp-dpu1-aclk=
",
> +		video_pll_clk_pd, 0x0, BIT(27), 0);
> +static CCU_GATE(CLK_IOPMP_DPU_ACLK, iopmp_dpu_aclk, "iopmp-dpu-aclk",
> +		video_pll_clk_pd, 0x0, BIT(28), 0);
> +static CCU_GATE(CLK_IOPMP_GPU_ACLK, iopmp_gpu_aclk, "iopmp-gpu-aclk",
> +		video_pll_clk_pd, 0x0, BIT(29), 0);
> +static CCU_GATE(CLK_MIPIDSI0_PIXCLK, mipi_dsi0_pixclk, "mipi-dsi0-pixc=
lk",
> +		video_pll_clk_pd, 0x0, BIT(30), 0);
> +static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixc=
lk",
> +		video_pll_clk_pd, 0x0, BIT(31), 0);
> +static CCU_GATE(CLK_HDMI_PIXCLK, hdmi_pixclk, "hdmi-pixclk", video_pll=
_clk_pd,
> +		0x4, BIT(0), 0);
> +
>  static CLK_FIXED_FACTOR_HW(gmac_pll_clk_100m, "gmac-pll-clk-100m",
>  			   &gmac_pll_clk.common.hw, 10, 1, 0);
> =20
> @@ -963,7 +1024,38 @@ static struct ccu_common *th1520_gate_clks[] =3D =
{
>  	&sram3_clk.common,
>  };
> =20
> -#define NR_CLKS	(CLK_UART_SCLK + 1)
> +static struct ccu_common *th1520_vo_gate_clks[] =3D {
> +	&axi4_vo_aclk.common,
> +	&gpu_core_clk.common,
> +	&gpu_cfg_aclk.common,
> +	&dpu0_pixelclk.common,
> +	&dpu1_pixelclk.common,
> +	&dpu_hclk.common,
> +	&dpu_aclk.common,
> +	&dpu_cclk.common,
> +	&hdmi_sfr_clk.common,
> +	&hdmi_pclk.common,
> +	&hdmi_cec_clk.common,
> +	&mipi_dsi0_pclk.common,
> +	&mipi_dsi1_pclk.common,
> +	&mipi_dsi0_cfg_clk.common,
> +	&mipi_dsi1_cfg_clk.common,
> +	&mipi_dsi0_refclk.common,
> +	&mipi_dsi1_refclk.common,
> +	&hdmi_i2s_clk.common,
> +	&x2h_dpu1_aclk.common,
> +	&x2h_dpu_aclk.common,
> +	&axi4_vo_pclk.common,
> +	&iopmp_vosys_dpu_pclk.common,
> +	&iopmp_vosys_dpu1_pclk.common,
> +	&iopmp_vosys_gpu_pclk.common,
> +	&iopmp_dpu1_aclk.common,
> +	&iopmp_dpu_aclk.common,
> +	&iopmp_gpu_aclk.common,
> +	&mipi_dsi0_pixclk.common,
> +	&mipi_dsi1_pixclk.common,
> +	&hdmi_pixclk.common
> +};
> =20
>  static const struct regmap_config th1520_clk_regmap_config =3D {
>  	.reg_bits =3D 32,
> @@ -972,8 +1064,44 @@ static const struct regmap_config th1520_clk_regm=
ap_config =3D {
>  	.fast_io =3D true,
>  };
> =20
> +struct th1520_plat_data {
> +	struct ccu_common **th1520_pll_clks;
> +	struct ccu_common **th1520_div_clks;
> +	struct ccu_common **th1520_mux_clks;
> +	struct ccu_common **th1520_gate_clks;
> +
> +	int nr_clks;
> +	int nr_pll_clks;
> +	int nr_div_clks;
> +	int nr_mux_clks;
> +	int nr_gate_clks;
> +};
> +
> +static const struct th1520_plat_data th1520_ap_platdata =3D {
> +	.th1520_pll_clks =3D th1520_pll_clks,
> +	.th1520_div_clks =3D th1520_div_clks,
> +	.th1520_mux_clks =3D th1520_mux_clks,
> +	.th1520_gate_clks =3D th1520_gate_clks,
> +
> +	.nr_clks =3D CLK_UART_SCLK + 1,
> +
> +	.nr_pll_clks =3D ARRAY_SIZE(th1520_pll_clks),
> +	.nr_div_clks =3D ARRAY_SIZE(th1520_div_clks),
> +	.nr_mux_clks =3D ARRAY_SIZE(th1520_mux_clks),
> +	.nr_gate_clks =3D ARRAY_SIZE(th1520_gate_clks),
> +};
> +
> +static const struct th1520_plat_data th1520_vo_platdata =3D {
> +	.th1520_gate_clks =3D th1520_vo_gate_clks,
> +
> +	.nr_clks =3D CLK_HDMI_PIXCLK + 1,
> +
> +	.nr_gate_clks =3D ARRAY_SIZE(th1520_vo_gate_clks),
> +};
> +
>  static int th1520_clk_probe(struct platform_device *pdev)
>  {
> +	const struct th1520_plat_data *plat_data;
>  	struct device *dev =3D &pdev->dev;
>  	struct clk_hw_onecell_data *priv;
> =20
> @@ -982,11 +1110,17 @@ static int th1520_clk_probe(struct platform_devi=
ce *pdev)
>  	struct clk_hw *hw;
>  	int ret, i;
> =20
> -	priv =3D devm_kzalloc(dev, struct_size(priv, hws, NR_CLKS), GFP_KERNE=
L);
> +	plat_data =3D device_get_match_data(&pdev->dev);
> +	if (!plat_data) {
> +		dev_err(&pdev->dev, "Error: No device match data found\n");
> +		return -ENODEV;
> +	}
> +
> +	priv =3D devm_kzalloc(dev, struct_size(priv, hws, plat_data->nr_clks)=
, GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> =20
> -	priv->num =3D NR_CLKS;
> +	priv->num =3D plat_data->nr_clks;
> =20
>  	base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
> @@ -996,35 +1130,35 @@ static int th1520_clk_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(map))
>  		return PTR_ERR(map);
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(th1520_pll_clks); i++) {
> -		struct ccu_pll *cp =3D hw_to_ccu_pll(&th1520_pll_clks[i]->hw);
> +	for (i =3D 0; i < plat_data->nr_pll_clks; i++) {
> +		struct ccu_pll *cp =3D hw_to_ccu_pll(&plat_data->th1520_pll_clks[i]-=
>hw);
> =20
> -		th1520_pll_clks[i]->map =3D map;
> +		plat_data->th1520_pll_clks[i]->map =3D map;
> =20
> -		ret =3D devm_clk_hw_register(dev, &th1520_pll_clks[i]->hw);
> +		ret =3D devm_clk_hw_register(dev, &plat_data->th1520_pll_clks[i]->hw=
);
>  		if (ret)
>  			return ret;
> =20
>  		priv->hws[cp->common.clkid] =3D &cp->common.hw;
>  	}
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(th1520_div_clks); i++) {
> -		struct ccu_div *cd =3D hw_to_ccu_div(&th1520_div_clks[i]->hw);
> +	for (i =3D 0; i < plat_data->nr_div_clks; i++) {
> +		struct ccu_div *cd =3D hw_to_ccu_div(&plat_data->th1520_div_clks[i]-=
>hw);
> =20
> -		th1520_div_clks[i]->map =3D map;
> +		plat_data->th1520_div_clks[i]->map =3D map;
> =20
> -		ret =3D devm_clk_hw_register(dev, &th1520_div_clks[i]->hw);
> +		ret =3D devm_clk_hw_register(dev, &plat_data->th1520_div_clks[i]->hw=
);
>  		if (ret)
>  			return ret;
> =20
>  		priv->hws[cd->common.clkid] =3D &cd->common.hw;
>  	}
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(th1520_mux_clks); i++) {
> -		struct ccu_mux *cm =3D hw_to_ccu_mux(&th1520_mux_clks[i]->hw);
> +	for (i =3D 0; i < plat_data->nr_mux_clks; i++) {
> +		struct ccu_mux *cm =3D hw_to_ccu_mux(&plat_data->th1520_mux_clks[i]-=
>hw);
>  		const struct clk_init_data *init =3D cm->common.hw.init;
> =20
> -		th1520_mux_clks[i]->map =3D map;
> +		plat_data->th1520_mux_clks[i]->map =3D map;
>  		hw =3D devm_clk_hw_register_mux_parent_data_table(dev,
>  								init->name,
>  								init->parent_data,
> @@ -1040,10 +1174,10 @@ static int th1520_clk_probe(struct platform_dev=
ice *pdev)
>  		priv->hws[cm->common.clkid] =3D hw;
>  	}
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(th1520_gate_clks); i++) {
> -		struct ccu_gate *cg =3D hw_to_ccu_gate(&th1520_gate_clks[i]->hw);
> +	for (i =3D 0; i < plat_data->nr_gate_clks; i++) {
> +		struct ccu_gate *cg =3D hw_to_ccu_gate(&plat_data->th1520_gate_clks[=
i]->hw);
> =20
> -		th1520_gate_clks[i]->map =3D map;
> +		plat_data->th1520_gate_clks[i]->map =3D map;
> =20
>  		hw =3D devm_clk_hw_register_gate_parent_data(dev,
>  							   cg->common.hw.init->name,
> @@ -1057,19 +1191,21 @@ static int th1520_clk_probe(struct platform_dev=
ice *pdev)
>  		priv->hws[cg->common.clkid] =3D hw;
>  	}
> =20
> -	ret =3D devm_clk_hw_register(dev, &osc12m_clk.hw);
> -	if (ret)
> -		return ret;
> -	priv->hws[CLK_OSC12M] =3D &osc12m_clk.hw;
> +	if (plat_data =3D=3D &th1520_ap_platdata) {
> +		ret =3D devm_clk_hw_register(dev, &osc12m_clk.hw);
> +		if (ret)
> +			return ret;
> +		priv->hws[CLK_OSC12M] =3D &osc12m_clk.hw;
> =20
> -	ret =3D devm_clk_hw_register(dev, &gmac_pll_clk_100m.hw);
> -	if (ret)
> -		return ret;
> -	priv->hws[CLK_PLL_GMAC_100M] =3D &gmac_pll_clk_100m.hw;
> +		ret =3D devm_clk_hw_register(dev, &gmac_pll_clk_100m.hw);
> +		if (ret)
> +			return ret;
> +		priv->hws[CLK_PLL_GMAC_100M] =3D &gmac_pll_clk_100m.hw;
> =20
> -	ret =3D devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
> -	if (ret)
> -		return ret;
> +		ret =3D devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv)=
;
>  	if (ret)
> @@ -1081,6 +1217,11 @@ static int th1520_clk_probe(struct platform_devi=
ce *pdev)
>  static const struct of_device_id th1520_clk_match[] =3D {
>  	{
>  		.compatible =3D "thead,th1520-clk-ap",
> +		.data =3D &th1520_ap_platdata,
> +	},
> +	{
> +		.compatible =3D "thead,th1520-clk-vo",
> +		.data =3D &th1520_vo_platdata,
>  	},
>  	{ /* sentinel */ },
>  };

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------KMUnNqRXVfTSk0ZKCUXePycU--

--------------jkuz8klicTr03P3PrhKep0KO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ5zuqQUDAAAAAAAKCRB5vBnz2d5qsGUY
AP0UZWWYOE+oYUoeOOg2Ux6JWNh8HmNYan7GqLTCGSrdUgD/UTmT5CHcOSjvzpAcupso5Fqmv1F+
eSrWBqyt/Yl5HAI=
=Q3pb
-----END PGP SIGNATURE-----

--------------jkuz8klicTr03P3PrhKep0KO--
