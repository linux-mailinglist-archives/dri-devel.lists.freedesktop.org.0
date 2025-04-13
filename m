Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F413AA874DA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 00:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A4710E25C;
	Sun, 13 Apr 2025 22:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Ra4qBb/P";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vgSNE4Mq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003D410E45C
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:58:31 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DGmlFs020526;
 Sun, 13 Apr 2025 16:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=AD372T8tLL++8NOdzRI7WIaKFuYsFBwz54/eIwzPdZQ=; b=
 Ra4qBb/P8CiuTqkaJZiicjDJlE+c8wW29cC+/QgCeHGWxHuVNJbb0rxaQGQnq6gj
 33rLTyJo/2SGFAi8AZR9EVMuUYWUge7M5DgQPFt+x2b32pVBkSNCLCSNL/M6D3OA
 rj0L2kO93Xg4PUjDW/+8ldDCCIourviuKFNqjSNmJ64Q+rxa4I+LpBml3dcichRc
 prLovcBIV3GuppchRMi02yUJHUYq5z8jKsTNj+s1kiWU9EfwAEG3H5QXRjvx2dvc
 Jh3qUIp0kHiz3vNaJCs8CFm6cfeT2W49ebL8zEHtZeh0oDGRkyRJ1CPwyNBnjmQD
 rr3hltqrL7See3yV+eAjfg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 460h3a807a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Apr 2025 16:58:16 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53DCVmlo024658; Sun, 13 Apr 2025 16:58:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 460d4wvba3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Apr 2025 16:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPTH/Z8A4mV4S9tz09hYkd30q97Vf4a9o3ETauk8XW1L66yp4hbN0ZoijjZ1ft9lNlsClNVWZ+1Efoyjou115Zpj2kWr0iDcmfMBZqHbO1tVMpUzikRBhdQ7OUYJtvxvMncCRLcp9fZnbvvVPMG5Ta5yGgS0DKQtPWNuCSBB+Hi6E5wpPeigSZmsXkdS3WQZZaPvGWjP8wBqRXL9ky6B9CfS5NM6U6tWuUtZiGW46oMwNyMxGiozmBsvbH6BQTyAEiflTyiRgwpQLwQv9NQ/Ch6a5vL0/Vu3GYeOoN8G+SdpnhubN+J9gM7yGJL14Di2eyGiIvvBx95yM5uK2RRP8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AD372T8tLL++8NOdzRI7WIaKFuYsFBwz54/eIwzPdZQ=;
 b=h2P9fowYVlgW1yfv6Ro+7hznW7J8pCe7vVE1EuyLUJP5Es7rdP8/uQ/CxR1OMj3gA7GtVbCbZ0SoYsn7mc/t2aZypHpS5FEjF5iUt6BKnO8JPQYUrXVDDJ02vBzU33r9bnGJDSyUa35GiK3rx01qXNqHI2fncY7Vm61FLFtsI5cfSW6UOsfBstVNM0xgjfUAODTQSeamFuoPqc1X9m5xJl0t154kYzs9Kr0ZgkRHEVGWtT97VGb1M5EFw/nlH+gJD7Ot/aE9EsJpaOTyzRvvjBVaboe/ubgdUPzZVarAXHRx21aVOdmF32NPrro47dW3YSlepB//cdqHY0zy6LWjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AD372T8tLL++8NOdzRI7WIaKFuYsFBwz54/eIwzPdZQ=;
 b=vgSNE4MqmW+Gcgvhn7wy/FsTF4xmnnd3WJ3kSGGOjqnHtNixF0ihS3dJFcDEOsnzj6JZOZv93+z+EB4A1bKHmtZ2AqWDjDlVA1J/CDUEjjeZ/1lKt1uXKH5+gy6muXHr+HtreENJgHQV2RW0e0A56uP/V7sg8b2xbpJupsyH59g=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SJ5PPF4D4E723EA.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::79f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Sun, 13 Apr
 2025 16:58:05 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.8632.030; Sun, 13 Apr 2025
 16:58:05 +0000
Message-ID: <c3605e9c-81ad-4d4c-87f5-d86be4ea618f@oracle.com>
Date: Sun, 13 Apr 2025 22:27:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] drm: panel: Add support for Renesas R69328 based
 MIPI DSI panel
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250413112401.12543-1-clamor95@gmail.com>
 <20250413112401.12543-5-clamor95@gmail.com>
 <d25f220b-880d-4d26-9025-44ba80622459@oracle.com>
Content-Language: en-US
In-Reply-To: <d25f220b-880d-4d26-9025-44ba80622459@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::15)
 To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SJ5PPF4D4E723EA:EE_
X-MS-Office365-Filtering-Correlation-Id: 822119e1-ddaf-4b6e-db52-08dd7aac5bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1dpOC9PUWlINTNFMGEwUXFlUEo5TUNEeWo5WkQrV29pUU5UMk40bUhHTnZq?=
 =?utf-8?B?MCthNXJhVUs4V0dEbm9QdnBlb2todVhKRTRqL0tsOVpwOVFNOEk5RUV6c003?=
 =?utf-8?B?MlkzbU50UjVTemltK1RQWEoreVl4SXJ5RlFsdjhVTGFybjJLcFRXNmRYK2Zu?=
 =?utf-8?B?bnI4UGJJZC9OTDJmb1Zid2pMZmE5NUprNUZDNkJGSWV5VXZ3Zm5Tb1JNZjBX?=
 =?utf-8?B?VEhqUDdZcXV4NWdpQzBvVENvM0xmV2doamRuUmhSR3Y5b0FZc2ppckVlbENt?=
 =?utf-8?B?YkcyN2NxdnVFaUd2bVE3Um5EVmZvaWh6a2lLVGZFRzNhNDhTYVVXeGJ5U3FL?=
 =?utf-8?B?R1IydU84czR6N2RmZk9DOThqc1JFeXFTcEpvSUg4b0VpOTh2Qk4zOTR1WnNt?=
 =?utf-8?B?VHUvL1NveXJwdi96TjZ0QmREU1pGdlU3SjVtUm9jRmJnVHYvRW5GNmRNN21p?=
 =?utf-8?B?UGx0d1BNNnpUNC9WNk5jTlIrUWNCVXU1MFBZMjh0NzNlL21XdXFCWE1ETERj?=
 =?utf-8?B?ckoxOHNIRTRHQmdJVFQ1bXowelVndjVaTW1wTTNKNXpidnA0ZjN5dlRpcG9i?=
 =?utf-8?B?NFFRMkZxZVU2Q0tTQ3JQQU5tRUpmQXJVZlYzdjBpcnV3aGo2YW1aMFIxQWNv?=
 =?utf-8?B?TDkzMVJpbkJGMlM0NU0wcFNwZmI4UzliVUN4dHVrT0V2V1ZCbWhWdnNwMnZN?=
 =?utf-8?B?cVhOdzM2bEJtQkt3M2FhdzdVYzFETWFWV3Y5WjM1aCt4NTA5R2JCTjNnN3pq?=
 =?utf-8?B?OGRKMUIvTFNVTzBvSW1qeUgyNmhhYTJLMG5EbnRvV1pwdlk0WVhJUzFwVm9I?=
 =?utf-8?B?MEUyZEZwZ0pSRGtFSlkxQVlWRTNlQ3NadFRCc0pjMW44VDBVWUpZc1V0endN?=
 =?utf-8?B?UXZucFNRMlhXcEw2QTlzM1JCRy85QW9IMUJZblltRHZSbnFlMUlxTlRsSGJs?=
 =?utf-8?B?N3QwaTh1ZlplVGNjMXA1VGkyc01rQVE2Tm0rSFF2a3ovZXFSelVLTEhwaHZt?=
 =?utf-8?B?VnlrVXJXNU1HWVNocVZ5YlA2TDN5TzJ2bFgxUWVUQ3ZWTFhyK1k2RFF1Q3Bu?=
 =?utf-8?B?NWtOOWVZUDRSUERoZ3g5bjVqOXpTSjhzYWFsZUNvQWZvVXJyNUtLOWV6RFJs?=
 =?utf-8?B?dlNsd2ZXelZtVGdjWDdTOE9xR1RVNWFXMTRYMUlvU0VPUStVTE1HalRrVWEv?=
 =?utf-8?B?Qm9KK3RMUTVJWk5TYmhSVU5GaUMybm0wYlJ0cERWdklONmRTQnBLUHFIdTI3?=
 =?utf-8?B?SUp5QjhyZU50MnNQcm0xcyttZmxSekZJWE9TMktHdXB6ZUVqekFDcGRHVlFI?=
 =?utf-8?B?Mnl3VTdPWXBpajRVbDd4SFYrL2RQNElrbCtMbjFtRmZBdDVYMjZ5NlF4NnBj?=
 =?utf-8?B?RzZYVDR1NlR5L1J0ZmVxTW5WdHZZRGxld3RTSjRSMXQ3UXpSVVRTYm5rOWJV?=
 =?utf-8?B?QUV4Znh1Q1ZncVZZNlhEdG00QnV3dnorVGhMR0Z6SWtCTVdiNFJ1Y3pWbnVk?=
 =?utf-8?B?WCsrRHdwV0MvL0RYTDBZdmJ0T2xqdTBxZGN3endNNUdiUHpTazZ6ZG1Icitl?=
 =?utf-8?B?KzhUZ0dES2NFckZEZnZKbFJhYkUveHE5eTJJSEZLcThsdFhBNllXM3BiQ1RG?=
 =?utf-8?B?WWdyYXFoZTlBeWYwZSttMVhIVFVPTTF0UTZqU3d4cHBPbnc4UzNBZE4vVTdR?=
 =?utf-8?B?YjlhVE94M3dsdHYxdVpxb001QlFZV1B5enVySnI5TjVMaXFsam51RU9LTThE?=
 =?utf-8?B?RkJMc1g0cjFqRWhiUWZoTTBtS2ZHWkRLV0pPaTJvY2xFZ3dGbExvUVFnbVVY?=
 =?utf-8?B?NTFiOEh1RXM1eFlNbkNxRDgwNkl5UkxDSS91V3p5Wk5xRytQMUVkaHM0VTZ2?=
 =?utf-8?B?Q20rOFhZK29melVpSVZDRy9XUDRhZzhGWjdCZHRmNWV3aUFuZ3RKRk1LOXFn?=
 =?utf-8?B?czk3dERmYzAySlhTVXlTN1M3VHdwdGd5WmJDMHU2ekJzZGgrQ25wQ3RCUHdP?=
 =?utf-8?B?Ri9wOTJacWpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5328.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXpUWC8xaUk1TWVEaHVRUFRPbm1pTldTVExFQ1EydjhTY1FabTRYVHc3eXYy?=
 =?utf-8?B?QzBKSVU4Q2pwVU13K050N2NuVlcveEtMcDdHd29md0wwSXZFaXNFZ29KNkhP?=
 =?utf-8?B?UitwTGg4aU5ESFVMTHFsUWZtaVpCeFZmK282TzNOUktDY3NRRzdpY2FhNVc1?=
 =?utf-8?B?eG5XbVVSaWNwYi9pTENaRE9YNSs4RENGOTFSdTA4KzE0b0NubDVMMWtLUjNM?=
 =?utf-8?B?TVR4TXBVVVNMV0N1RFBEL05RYWx3VE4wdTBySTB1UG5iNVpTekI2UDlWZm5O?=
 =?utf-8?B?N2pMblpJSWs5TnJuR0ttS1BhWk5ReitWUzlyaHRLKzVPOE0zZkhpRFg5Vzdw?=
 =?utf-8?B?SlE4SzJlTVQ0N3labnBocDlYQmRjdExQblNZMG8ySi8xejhGZlBLMVhObkVS?=
 =?utf-8?B?L3Z1TFRRRzhxUDBiVWZXOE1wKy9Dc0prZFNVcHpqSFNUMUcxZkVzQ0FHYmJY?=
 =?utf-8?B?VVhlcHl1NERabThwekh0MFo1OFB0KzJDb0ZKWFZKVmtXMVNRMmhTSE1TNjIr?=
 =?utf-8?B?TnJPQ0NNVnhNZEcwWU9pZUJnaFdHdHdjWkN3eGxyUDlDK3lNWnFqaitSY3RL?=
 =?utf-8?B?MkZWOUx3Z3I2VTc0LzBtdVVsM0ZnakJkMXY1RVBacitMOWVibE4vdVprWTA1?=
 =?utf-8?B?MVI3UE5PWGcvMTFhSDNNcVUzTDMwVkJBbzVtdmc2dUdBSjRqYnZDcm9aMnVh?=
 =?utf-8?B?bjNCZFAzTnRoT00xTkExMWxaVHMyUXBKM0ZIbDlwWmNiM0hPT3VsQ2Jib1lK?=
 =?utf-8?B?S041cGxXV2tTNGNDKy8vRWxPR1AwYndUbm15Q2pGYVVqYWJtbUMra3R4S0hT?=
 =?utf-8?B?YzRCNTZ1TmJCTnZ1VXNRck93NDFBbEdHWkFjbS9UMTRXV1lncU1YYXpOUS85?=
 =?utf-8?B?K245aEMzM2YzanRJRUlQeGRFZmZacGlhWEVOZC9RMFZuNWZpVEd1Y3ZZSS92?=
 =?utf-8?B?QmZjRHQ2QUJoRjF2VElSeHloQ0QvSUxsbERadDFGWnNOMzk5SXhjaEw0YStt?=
 =?utf-8?B?K1pITlk5dzdKWElrVmJaWXQ2bGxzUnd2NlBmOVFUc3d5MGR2MHMzcU5tc3l1?=
 =?utf-8?B?M0Q1QjNLTjFkQk5PMHNFdkNZaGl6VVM4M1Z1ZTF3RnBGM0pld3JpZ1Q5cUlP?=
 =?utf-8?B?dDlOSkRORXg0dXZkUnJteGUxa0d0UENWWjFrUW9NQW8rVjJXdHNyaVlZS2xL?=
 =?utf-8?B?U2gwdlQ2WmcwQit4OWxkWEJJeFpzL3NEUG9RdTJ1WkhYbysyYmhaMGZId2VU?=
 =?utf-8?B?RmdDRjk3TlpGd1NJd0dFYSthbHEvcW51bzJ5NWZEdys0Rm1rSFlraE1BNTU4?=
 =?utf-8?B?Z1FZTUc0L1FOcmFFV281RndKMUlhNENwNDJzYnZXR3BrS2YyQUhpRnB4RFAy?=
 =?utf-8?B?dVRqdmhXNHdOT2YvdlE2bEpRVFZLSjNMS0QvT1BmaSs4MHFIQitIYnZ3RzAy?=
 =?utf-8?B?dE4xTFJkSzRMM0tmMGM4Y3NJUndZU2RqRzhxb0RGSGpNSG5NZ0w0S3ljdWl1?=
 =?utf-8?B?ZDYvNHZ0SmNsN05kR1QwQU9TYzBHWG95dHVIVG9PWUtNNURkM3p1Y2xHaWh6?=
 =?utf-8?B?SThYU1ZBc3FlSG5IbTRHY2x0NHNDcml5OXl3L1g1YWE5aW1NaUJiQThaYjFS?=
 =?utf-8?B?N0plZStvTkVnNFNkVHdJVHRDTFRNMFdDRHJSRzkyWkppQWlmc3RrWFdYTStn?=
 =?utf-8?B?WTZHcnlWNnhHejUzK3owL3ZvNUx0ZXVnVXQzRDNwSWpIdW5nbjVjTFcvZ0E2?=
 =?utf-8?B?Uzl6Y05WTnZMYmV3c1J4eVlXVlhCMkFyeTBoMFVydFY4aXVtMi9qZVgzYXBo?=
 =?utf-8?B?aTgra2VkRDFkK1ZqVWNQSksvcGxGMytTNVNCa0FobnVVdGRWaldvOGRSMGVQ?=
 =?utf-8?B?bGsxMFZjaXI3UGFYczYreXFsaUZ3aDBVTjFvc3NxT1diNEtxZ3M0SUJLQWJI?=
 =?utf-8?B?ZVFFekd2cUZaV1RwbUowU0IweHFVUGpmd2ZxTUtERmxYMkkzR083cVEydHAz?=
 =?utf-8?B?NU1PVndudkpvLzlHV0Y3M3JNZDZwVjdMYlNZc2xhNmc3OGhha2Q0d3BTd1JU?=
 =?utf-8?B?SnRJemZNSVlVR0ZGUGtYcEpibnBvMXBvRUVmZ2tjVXhnbktkQlBVb1F6dXMr?=
 =?utf-8?B?RlhwRDQvRW1xWWdlNEV4WHVIKzJJRWZHVWMrUlZ5MnVUc0dobDMzTm5neFFK?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: vdrKIpZvVVGK+w4dPlIyL2Q54anVvlT986zf3ndEc+mt1gBdG7wDUHwEViVWLbuIZ6Fisnf1RUkQwlpsc9/g/Xog2DrATLRiaEQjbSnpeyasiDzz1jkRk5IERs6d9UF0G19bddmH6xcfXFsEM4ccqTmHdyLfdBqjMAV/VXaHFPz1esQaeBfpV+lLqVFkajD67RCMZE4yq7hHI20KQxo6KwCz5Atj4oV+VC7pzaA29ao6uyz29yBpDI4H5Gh5pFUXHfd47s+fGR0lZQ+6M/dU/LJ+jdCRp1NK1gcJHOnurtpoeT0Ur/GXeDQArxpm9JZ/OirG++QpHCDocRtq6oLLclCenRujRWJ5PRpk++qu2E2ShaVGEAoX7v0RKq8W7Wny3z4/DplrO8D/C8If7CFpXz006/euQobTGZz0arByEXUFScucoH43CtAlXJlTFOn6smrMgnkIq0H14/Jna0KixMcJcXfRoIM6ubbyqcZUp7hwSe2uFOYPn2j4AKtuITr/+SkbA/ZF0KaT5W53hkalD/2SUZEn4gAam8flJwJjOYhN4mfD1/BYd8+18n//ACTkf85P2OZA3fciXIx+7co12zOZlTmSTJDsETVgV06s+c4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822119e1-ddaf-4b6e-db52-08dd7aac5bd1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2025 16:58:05.3746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/RBdqIGqvSWu1SVxXAfRfQ5dhD3A9L67PD5iHXtmS5nLppQ03MJgEOnwf7JOgm07zzcWNG/1NqpLnTyTnGdYcgRy5H0qWLIi9scuqoweTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4D4E723EA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504130131
X-Proofpoint-GUID: LjiJY0fh9tILhRwTTwHpckD08Ev18ur9
X-Proofpoint-ORIG-GUID: LjiJY0fh9tILhRwTTwHpckD08Ev18ur9
X-Mailman-Approved-At: Sun, 13 Apr 2025 22:58:19 +0000
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



On 13-04-2025 22:20, ALOK TIWARI wrote:
>> +    mipi_dsi_set_drvdata(dsi, priv);
>> +
>> +    dsi->lanes = 4;
>> +    dsi->format = MIPI_DSI_FMT_RGB888;
>> +    dsi->mode_flags = MIPI_DSI_MODE_VIDEO | 
>> MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
>> +              MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
>> +
>> +    drm_panel_init(&priv->panel, dev, &renesas_r69328_panel_funcs,
>> +               DRM_MODE_CONNECTOR_DSI);
>> +
>> +    ret = drm_panel_of_backlight(&priv->panel);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "Failed to get backlight\n");
> 
> 
> drm_panel_of_backlight, 0 on success, or a negative error code on 
> failure so
>      if( ret > 0)
ie if( ret < 0)

> 
>> +
>> +    drm_panel_add(&priv->panel);
>> +
>> +    ret = mipi_dsi_attach(dsi);
> 
> if ( ret > 0) it return negative error code
ie if( ret < 0)

> 
>> +    if (ret) {
>> +        dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
>> +        drm_panel_remove(&priv->panel);
>> +        return ret;
> 
> use return dev_err_probe
> 
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void renesas_r69328_remove(struct mipi_dsi_device *dsi)
>> +{
>> +    struct renesas_r69328 *priv = mipi_dsi_get_drvdata(dsi);
>> +    int ret;
>> +
>> +    ret = mipi_dsi_detach(dsi);
> 
> if ( ret > 0) it return negative error code
ie if( ret < 0)

> 
>> +    if (ret)
>> +        dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
>> + 


Thanks,
Alok
