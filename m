Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E8AA5CC6
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 11:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4CE10E045;
	Thu,  1 May 2025 09:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="gx5iTP6D";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c+0WvLbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7AF10E045
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 09:51:30 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5418g7el016983;
 Thu, 1 May 2025 09:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=mINvyVkI8+5X+gXcOLnZ7hYu3KgrQOWRmfplnwd3044=; b=
 gx5iTP6D1up1V0V52Ovsg4ERpG/5j2rURp6uCwDZjJkmrBkKyYdy07LUh1cBCh0l
 znw2DuzL80xBbT5UbT+RsMLDrV189qJ73hw/SiGKUU70TkvMAaoKIKkigE9B/aQJ
 0YRtLo36pKs+gKy8+TL0OjoRBhhz+Ftta7M6rV2WJz2moumgxdFlWgcRuF4/YqLl
 6x8n5UHkT4ciRQtLaKLmF2bl9+ykZevNRA0D8EpQe7WeLb2bl22LOSU5OO0Aq51s
 qRfs5OSBBV9sexDfJ178uOhayZ+k+kx1vc5Artf5VTedeHP/FwfWIdrshlfFFFY0
 JGjrdNcmTb3uYZQ/vIGRDg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6usjtex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 May 2025 09:51:10 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54190BYG013794; Thu, 1 May 2025 09:51:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 468nxccys5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 May 2025 09:51:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fh5MFXww+b2Z4o4KSkxlhkKqtzA16rBEHv7O/W5B5os4HWp6gk9gLWo6wsdqtjm9oLNnl1hJWA+ifYp+hrQo1KUFlbXt2upz7WIJtRxomJn0LUmiQ6dbfOUtEEZZ7H2KlPVDUNkEddYIUWWOr4hJyAk3mhp8Lsu0zFuv3WhruHHyiR0i8QDHWGFP6rwEewzL7oyejfpbg0Hzu6ydMLv5HUCu6b/MvX1reL6oytugSi5dNylh0VGTR71Ox2ZK5ynpM9NbjbMnpUtUi3yYQQ++fIj4/+apH8+InuieRd/R8skL44ieOEND1L3QzBbWMitVyL016acGRHeB75PNHq7Zsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mINvyVkI8+5X+gXcOLnZ7hYu3KgrQOWRmfplnwd3044=;
 b=CZmX85T2BO2yEuKMKmrQa4RX9v3h0KseP55iZ6TfE+3icC+eWTIOG3/WRrm79y+kvvqOtBedR6RCz/A+NRWtgOl1CuaTgWFte/p6SVWJ+FVQyiOxMIahkxvH+HLvktFmBjF8DHOUJ8NjnUCzazAnqZwKthd8EuV/3M5RZaCg2bhZ6yUhr/DC06aqNNkOUqEtbEWYjrE/G5LeldDSgUoZX0n4FkCVk5GIStQ/0yEczL+ccRrvandMZbEo8+KbSeSYX5vW/G3PJDtrucaIl8CyI7tVvMxuAeM5MciJtIlqd3k8ir65KjNEEpu9St6BmeIXy4VDvr3yf7a46mduqyG4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mINvyVkI8+5X+gXcOLnZ7hYu3KgrQOWRmfplnwd3044=;
 b=c+0WvLbC4lP7q9Y/SB5ox6wV+sahGWQJuQMlSQgujL4r0HMC+yntH/av7y7HNIVvG89PEKcYOsZygiQfbxeDc9LsJ8AXEpPOYjGVX9QrtHMr3OOv/k1MxWlHwNM8fbwzESx2EvYQRRs+1cwUDbIIDRQt8anjua1MUXixl4LYvwA=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by PH8PR10MB6624.namprd10.prod.outlook.com (2603:10b6:510:220::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 1 May
 2025 09:51:01 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 09:51:01 +0000
Message-ID: <f9a7c9fd-bd49-4cf0-9a86-a8e65b4fb6a5@oracle.com>
Date: Thu, 1 May 2025 15:20:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250430204112.342123-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|PH8PR10MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 080078ca-9f9f-45fd-89b2-08dd8895ae34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUhZY3dDN2E2UmtUTWJBcTdiZVpTSS9kR2hhNkJWM3ViT1RSZm5VK1NDYXlZ?=
 =?utf-8?B?eFpTdUNHa1Y1ZFVBY2JMT2FZd3Y5VktKa1VMYm51eDgxTTdsOVVjNXErWE9L?=
 =?utf-8?B?aEthR1JuMHRIalFjb1V0azEvWTgrMEhMc0RzdDMxT0hFWTUvZzk1a2lPQnBp?=
 =?utf-8?B?QUEvcVdyWGs5VFRkbmlna3RyRnJwaC96ZUMwNGFBbmtNQmc5TXNyTlJraHdN?=
 =?utf-8?B?aHZWYzV0QjhrQzQ0SlFJKzNqdGp0NUpVMWRUR1V4QTI1OTBUVFFZYnd5STdQ?=
 =?utf-8?B?R2k1a010UW5lVHZFSldZVVA2Q1hkSVhSRmQ5UlV5bXBDVHIzU0Z3Kzhid1p1?=
 =?utf-8?B?UW9hY0VZY1Z6dUdFYjNjS3A0WDF3UnRTS2hWb3l5TjZqRGdGWnVoblRucmJu?=
 =?utf-8?B?czAzQzBNSFBYSVQwQzVYb3pqNzNsNTMvbzRvaDBuOXJPMSswUk81OCtwWmJR?=
 =?utf-8?B?VXdYY0UyQVcrQXY1djRjUVpkWUNwVWNjVTN3QWgwYS9oMk1CcFlIL0lZOU1M?=
 =?utf-8?B?UGdGMUc0Vk5Zby9pTlpnc0V6Y1RleDJKeVVUQWRaOFd0R2hoLzRqbUdNc2Zu?=
 =?utf-8?B?SmhVdXp4dWlxeFBlK0VDT21XZTlDRjYwd25CNFhpNWdQejVqYVJzbktpWWNL?=
 =?utf-8?B?UHdvcnhYejh1dFVKNDhpSzB6UERxQ2VqdkRQaE1INEdqOUZKQWJCYmxvTkx0?=
 =?utf-8?B?Q3hBR0NIMTc3LytadUFwN01rbFlDemd2dnMrVGlPeGlwd1FOM0UyNGZqTVp4?=
 =?utf-8?B?Uk9OdjlvWGF4cGU2ZmREd1J1UVc5NzJZR3JQSVRJN1pQWCtsYUt1U2pFTTNK?=
 =?utf-8?B?Smdsb2loWE1xSjJZMnprU3YyZzhFU0hFRk5Cazd6ZDBmZUZ1TnNKZTZldHc3?=
 =?utf-8?B?YnErcnlyeWl6VVlHYllWcGQrRDMzTGMxQStPb1Q4Z3krSkFKQ0xFeDlTSHJD?=
 =?utf-8?B?UEdabGpYOUZKd2Nwamc5akJGMjVteXRLMkNsN09TR051dzNsS0t3ZHhDRGlB?=
 =?utf-8?B?RkJyeHVsckhzcHpwdXFYR05LbktZZTFjT0haV3BuMnlvVTZjOCs4TEpNRllZ?=
 =?utf-8?B?MTFqcHQ5Tk9pNkNaaEVSOW1IZTU1Z294SU94L3RIQnRBWFBCUDdlUUNaVURv?=
 =?utf-8?B?czFvRkFkSU54Y2pGbnB0UjNuQm5GSStpV0NBenNiUDloYzdLeERNTlFac0Rt?=
 =?utf-8?B?NHVHUHN1NkVjeGlPL1RMMGFhL3ZHeW9ZdjcwSXhTcDNTVTFvU2pETVp4dDkv?=
 =?utf-8?B?b1NVZFNNVEN0aVE4S2ZHUTVPTnR2VzVnUEZ0R3VTMXpxWnFuTS8rTGtndkNQ?=
 =?utf-8?B?MnV2VVQ2d3FpRUJEMWVyMVJTVUF1UzUxaFpNdDc0WlpPalhObXhhV1J0c3Jt?=
 =?utf-8?B?Sm81UjVGbHJoUjVCdGx4Ni9OdCtEY2U3YUxjVktBNGhObERreFpaNWpxdk54?=
 =?utf-8?B?eGFtL1NvYlg3dlBlVFh3NXNFNXpWR1ZnbUZ3K1NaeHZ2Ry9nMzdWR01zblVi?=
 =?utf-8?B?eUNXUTVHL2s5TVhWNVRaNlRLQ241QndTdjBTUG40UU1qSEF5dTg3QnlQMGRx?=
 =?utf-8?B?YWh6dnZUZ1ZKRVBaRUtQUndzZ05QRjlWSmVZZm9veXFJT2dXTWxFa3VZS2Fz?=
 =?utf-8?B?ZTFsVjFtMitjS0FoTnhLdE40LzgwQmFBdEJTdEJmYlBVUkE0ZXRyNHM1dXVn?=
 =?utf-8?B?ZzdpbCtGZUZiRjVQSVlxTE5qT0lXRENERmN3cXRZQVdWd3JaZ055WU5zbW4r?=
 =?utf-8?B?bStZeUVtejk3OXNDWG5MYjgwU2dqY0VXQ3gyeWU4OCtrWlFidnM5ZlU1eG9F?=
 =?utf-8?B?OC9YdHdMQjhiVjJpRGJpTXJFdXFBS0d3c0lQcXFJa3llYm16aktyMlRBN0RZ?=
 =?utf-8?B?bnh2Zk9PNjV3bVFDaHFRL1BHNlhmUHdDSGtwUjU4QTk2b09ncUpPTGNjV0d2?=
 =?utf-8?B?K0Erei90NXZKUUdFV1NYTS9waUNmaGxRNDl4dDF4WnBMTWxnSGlhS1V1OXFB?=
 =?utf-8?B?dk1MUXAxOTZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5328.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWcrT0UwT3dleEM3cmVHb1R2T0I0Z1FtMllUZDZ2Rm5HTmRaMFpveVMwSlls?=
 =?utf-8?B?OFp0cEdxK2hORVpLczMzczVoRDlhTFdsTStvR2diV0UwRDNmYm5UWEVBYk5i?=
 =?utf-8?B?MElhZnBNN1UyREE5QTZoT3UvOEl6b2ZBY3VUdEdPeGcxOS9veVgxbUpPVWlP?=
 =?utf-8?B?bFdvclBzVnNEbWpJVEMzNTZ1TWwwMzVHWTVQa283ZmZCclRpaG1BUm9sRGZy?=
 =?utf-8?B?Z3dVeVNvRDdCQ0hMTENwUDZEYWVxaVJJeWx5cEU0WWQ0NDJsdlYvZVFSaGpH?=
 =?utf-8?B?cStRL0FUVVo5QlZBMkRWc1NBVkY1TkJBZ2JvWFBqMFpoTWpSRUxMSFRJbzIz?=
 =?utf-8?B?eEE0NWdSOGRMVmNWUWpEMkphcDd5RU1XbzhKMmRqL3diOWdCekxOMzNGRFBW?=
 =?utf-8?B?S3VUdUgzYzBWeGVxblBrcGtxcklEQWliTk9MMUxnUFRLZTZnb3Y4cGZ2RWhQ?=
 =?utf-8?B?Z29YNUFMbHR0VkxhcDNIMDU5WDR0MTlNQlB6TnkvWTZEb1NBczJjVldXZTlB?=
 =?utf-8?B?TzRpQkl0SVNGN2g1V1BHNWVxQ09jOGtaSVNJK2RXRjJGK0t4NHdoQnpRRkR1?=
 =?utf-8?B?ckFIRWtrVDh3S0VQeE5EVHBzWk82NExTVFVpYWJNMVV1aHdHSjE2QlpqQVBF?=
 =?utf-8?B?cXh6VzQ0UzdMOVhTNGdYUXh0QVFEK2ZVd25LSXI1ajN2eEUzcTM1Y1o0a3ZQ?=
 =?utf-8?B?SXNqN251dk4yVUVzZWxhVG9VVHRwbHhxV3hMQzRJY0FnSmlWbndISDJCa0lM?=
 =?utf-8?B?b0lJZlVwV3FETTNQTi80TnB5SkdWWEF5SFB6TnNWYjhiS3FNL3FYb3A5aXI5?=
 =?utf-8?B?a0kza0JmSjc1bCsrSUg0cWRYR3RPNW5pQllHT1pJamZIR0ExUHhEYUp1UzI0?=
 =?utf-8?B?c0RtQnpvQ1lBV1orNmFKVTIxR0ZBbFhjcjg4LzhsVXliRXBCZHQ5U2txajhs?=
 =?utf-8?B?S05nTk5Hem9HOXM5Q1lmV2YrKzg1M1pOWThzRnhhYWhNQ2JRWTRScUdRaW5j?=
 =?utf-8?B?MklNdkZQY3lmbk9CMkRZSG1ZMHI1UGlhejlGYlJ2Q1AwUFEyR01EekswN1JY?=
 =?utf-8?B?dFlSZ0dwenJQdHNWcGNodXZrQnA0NC9SWFl2SE0vSEUzQnlXRnBXQkJXb29y?=
 =?utf-8?B?Y0tOaDNQN2tNQ0pEemVadFVwNFVnNmJCNlEvNTJCZHgrSXBCZkxIbmNzaHRr?=
 =?utf-8?B?MGtSdGRnN1dUWE12S3NSQk51ais0eVErelJYS1dhU0hQM1h4clZjUS81c0FY?=
 =?utf-8?B?aHRDbHhiYkxRbkpZTVBGYkp3OTlBQW5yY3A0S0I5eG1JalBwV3ZlNUZGWTdI?=
 =?utf-8?B?Ykk3WHhkalVqaG54Vm54L3hyeVE4QVUyWDU2ODZaZnF3SDU1alFLQWt3b1A1?=
 =?utf-8?B?Y0lKMEtud3hENktRcW82M3orOXR5L0RLeS8yT3hlMWtzMUErMFlWMG45Tk1U?=
 =?utf-8?B?K2hHMDhtMDNKNEg1MVZNZUNvZnpTZTVweS93cndoZWRvYTNGaW5Cd3RtNEZF?=
 =?utf-8?B?OW50WlpYVTF2OTg4NWk0QnVZMGJMK1hEaGFNWXJhNXdMZlZ3ektXbTRFMHpm?=
 =?utf-8?B?KzdxZ1FpeDNZMlpubWF1eno2cmcvSGhuaXN5aGVVT3pLR3pveGlyUVU4TDY3?=
 =?utf-8?B?RFdkaVJNV0gzdHpRdUxySHNRMnBESlh2eDlVQitWUDJkS0JSbFNKS3dmVmtK?=
 =?utf-8?B?N2R0V1p6Wk05ajlXUTBJeEw4c0VFaXo5N2g5alpxbUg1NnVsSHRIdXNyNUJU?=
 =?utf-8?B?aDBIL0p0OXBIbkxFdE5SQmtuY0g0M3JJSUlHSGx2NDRoSzFNdWRlbXVYMEpL?=
 =?utf-8?B?S3AzUmdmZEFvZjlrV3c0UjllNnM2VHl1NEhyTGtXb1dsci9VS29XUnlkY0ZR?=
 =?utf-8?B?bzMwUGowNlllOVFCQmFJRjNwaWFPK0pIMGRtSjUvTDhST0RxdU9kOXFpcUUr?=
 =?utf-8?B?T0QrbWNVTjE0K0VYSDFobHltQTQ2U3l2ZnVYeDBNdjM3aUw1VENBd0V1TDl6?=
 =?utf-8?B?YXlIdGxFUXBRQWtvVmNDbzJPNVpFWWtwSElWY1hOcThmOThUSnRwd1A5b0V0?=
 =?utf-8?B?T2tXTHE4SmZKVXVKdEhlZ3gwbGdzV3ZXTEh5RGJYYndLTEsvVExyWkwwUXBM?=
 =?utf-8?Q?UeOT+uyvBhIGFhe15y3xEkalE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: goxIoiK2IM7H+Si+r2hj4XzqHh7oEg7icmG5WBRu/uMZpf52o+B55LSX0SbhVz/PyaU+dPIAdGR+OgESbfGtHd7DLLc13YLZhe7Pvn8aBSpVfP9IujPdAdAt5wGr97lG0EGJNOrPi3bspSQ8A+k0pnzSQ1FpyyuvNxBMzptjCe/jpacg7rDK44KB3JvZqwB430Fkkbiz1XjUh7WWbHt+smCM0guQT+gMXdeFc35GokhxXsDNjtG9SiBtSStJ5HLMX13YzN2qqbm8wQGchOeZvgO2ExbabGVp4klaGd96RibVE37Qz8ush8NSFjrJqSZJtlIPSkxIfhr4XmtJcsbFFSK4Ee91iRZ4SdBu6gKmNF1qbeQmyKnd4gxht8CvyxRibj0ipPPGJgG1oQFebCP+BRxr4836M1aU+HCZDQ6eCKi6dVFIIA1vye0mqFAHaEW+Y9IgREuTYcodAEDTj+H30HMSmsZZYJ+ulpe1uEmNFQZMk9CLaR7ijLxfQ4KYIlb+9EGUj0BVwYEEiN/50Y+Esnao2b0Vh79jGnUS1txZO8FgZ/a+NqJWt/Bb5tEwe/IaQ3oEZKy+iIkefjYOtWR8plRqttBQMekIgg/lKiFnjkg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080078ca-9f9f-45fd-89b2-08dd8895ae34
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 09:51:01.6895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLb6TCsnQ6csmULmczaighT07w+mD1pDGLVhraJ45x5CfceorguDxDLJBJCR+eGJF3+FV25+dgqa6IPuUzZfwf+WgkPu4jSxLY+e9FIXUzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6624
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505010074
X-Proofpoint-ORIG-GUID: jpQJWbMzOrAhsxWKLKyrqz5ldnBQ2Zyd
X-Proofpoint-GUID: jpQJWbMzOrAhsxWKLKyrqz5ldnBQ2Zyd
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6813440e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=yC-0_ovQAAAA:8 a=yPCof4ZbAAAA:8 a=PpvvzeyspNopl2-bpPQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA3NCBTYWx0ZWRfX2i3a8nUnQ6hS
 lh0F9FIgtyp0193a7jcXwP5scdXqrwU+9VVZlLkUOsQfEePq07Ro4Wo7eVHpxsS4q2KfejkVrEw
 GrwdOjcLTEpMAbmlN08spsy8VWiM0ZSn+/C6KaEA2qpy4+DnG10uOYH6yIrtyDzvtVe4vj7vx5u
 EAIpy1Nt+TsTy4yddrenj+rpU5p+tseUJ8zyCgh0utXqwKpccZJx/gUUbzAX69Wijq0E8g6lyUy
 LvMzUyXmyd9G1WE8VUbbEeAI4miLEakzxY19TDmD3+ezTIv5OGqj7o4k1uvZ8KTSqGBSj2PY+B+
 Iy84pWoHOHGwnPTNfkXX62xXPf7hVnuZEzVv3Ln8Tu7h16r17ZAFu81qAviGGeqTvZDY86pu3Jo
 z3vXlA5AP0MBmEodWADyq1mYQLHQvIYF3xSy7twVH1DCf0xdf9iSxOmRpXroMkTzpYTP2/ze
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



On 01-05-2025 02:10, Prabhakar wrote:
> From: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for PLLDSI and PLLDSI divider clocks.
> 
> Introduce the `renesas-rzv2h-dsi.h` header to centralize and share
> PLLDSI-related data structures, limits, and algorithms between the RZ/V2H
> CPG and DSI drivers.
> 
> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slightly
> different parameter limits and omits the programmable divider present in
> CPG. To ensure precise frequency calculations-especially for milliHz-level
> accuracy needed by the DSI driver-the shared algorithm allows both drivers
> to compute PLL parameters consistently using the same logic and input
> clock.
> 
> Co-developed-by: Fabrizio Castro<fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro<fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>


Acked-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Thanks,
Alok
