Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F18CD25A7
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 03:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3729310EBEC;
	Sat, 20 Dec 2025 02:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="hYoPfHmo";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IeyEku9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAFE10E0D2;
 Sat, 20 Dec 2025 02:15:32 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BK21LOE740115; Sat, 20 Dec 2025 02:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=s1tX2Pg/SxYBNFPtQD29kEcCcMgjQmsz6wsEQEdeDLY=; b=
 hYoPfHmoXH+vzONcYhXdPsqkCVsFordvVzC6up+Xiv9O+S2y3/URO12tmS9Ck9pr
 jZFwQUZgSemOqDMz2CcdcU/ztQxtihQhTYzZ+rwR68r70uowcfVdgOd56Ts5GzHS
 mPQSXYWxDwR8anLzZv14wL3cmJIJcjwmUeNxmRPrbBEJfZmHuImOseqiRM4bJrQq
 xl5QGrolCkhHd68+wCJPEg4nQOHvNs6uuksZ7CiURbY224uZX32n+SStXZdm+fZp
 c5wHtNJXFzKYzzF2MdZX6cKgtbU5twQl4wg1l2GsyklMwOayJ3i3t8J4S1frZ858
 bRzlI5IH7vvwyuIdCXHzKw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b5jcxr0bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 20 Dec 2025 02:15:17 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5BK1Xcoh040022; Sat, 20 Dec 2025 02:15:17 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012064.outbound.protection.outlook.com [52.101.43.64])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4b5j85gv92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 20 Dec 2025 02:15:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbuOp3dC8EtBWRe7u911jwjnSs1CnGcpO6QxjAlwGZlqKiT9C0tI9UPiZUlInGATL8f5nuQRZoDnWXl0B6ITLBjoHh2OhSgMcM0leC5ySfHzoRk9f0uVWcGIrq4emOLrLYq81i6uInLGHOIANFfFioaAKf7RfBnwCwbLpcqrQvloH75ui6p12H7Cdee4beTdpsXQxttExkeFM2UrYyrwNBMZmu8JnCP7uStEhIniZb5hDYd8xKhxZJnNz0fkDRxCxFTyBabBultg2kXzvQ2EtU0Rh2pm4+SdxP022i7Yux7FeHAvoIF+H6kM0gZsX15Ly9BG1BdBegK2y7hmUsbcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1tX2Pg/SxYBNFPtQD29kEcCcMgjQmsz6wsEQEdeDLY=;
 b=Z9wwsJxv6dent3PCyENwJSO+cAgALPqDRXazMtQft+L4FFTVTrLRUlXfcns3puBQyk9+Yhg4K5E5w4z5PnAFC/g+QtO/ooS8ygesMDPEcm+D6N+h9NBqWxLlbEC7MoU+50NrRP52y9s6O5EyVyqT7Q/bDzo26cxXaAzpmXgno4/sRtCp9lpDfvmb+YAM9PdPk6EwLyl8BvJJ/k7BpNqniNmxmtV+KP8WCgrpHcm5rVbDA0eMxO6I03nPx2FQYP5zsRinog+4EjF5MWcL1fIRYTsqKfrgkLj1Qz7wNj232UHmZruCxHVbIAOLcj6+NVTnZSPlxDcxcF94RVXjQT2wLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1tX2Pg/SxYBNFPtQD29kEcCcMgjQmsz6wsEQEdeDLY=;
 b=IeyEku9dVAt8dMgPbwj7DBqYKjDmLxN8PCIQg60SPT1UsAvgmbol7P/Y71n2fLofe0qZNYvCTr1UCPTkz05gSHOVMB/SBYrrX9QrpS7Snj5kwX7GDJMkx6u6Z977J1eU0o3sPVMy9kFhN8CWwqwltTPGnO5U6KOPdsdBrRn5cQE=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CH3PR10MB7433.namprd10.prod.outlook.com (2603:10b6:610:157::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 02:15:13 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 02:15:13 +0000
Message-ID: <5ee81423-7e55-4187-b5dc-35e005aa6217@oracle.com>
Date: Sat, 20 Dec 2025 07:45:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: check state before dereferencing in
 a6xx_show
To: rob.clark@oss.qualcomm.com, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: alok.a.tiwarilinux@gmail.com, jordan@cosmicpenguin.net,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, simona@ffwll.ch, airlied@gmail.com,
 marijn.suijten@somainline.org, sean@poorly.run, konradybcio@kernel.org,
 lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
References: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
 <c97ee966-5864-4be5-9e6e-afc8a93dab5a@oss.qualcomm.com>
 <CACSVV02h-51_YvtiU0yS5UEpaO7NsjBMOyfMbuF2hk6=8oMfig@mail.gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <CACSVV02h-51_YvtiU0yS5UEpaO7NsjBMOyfMbuF2hk6=8oMfig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::6) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CH3PR10MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 83dbd4a8-c0a8-4eeb-a276-08de3f6d9b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnM1eExSWDFvTkxwRUNRL3FJcVBINnZsTk9oZkdwMFluOGhUQ2pSVW9hT2ow?=
 =?utf-8?B?YU85OUlLdktuaEJwYmRHTVQwYVl3Q3RRbHlmdFBqazcyM3lzbjhsQVNxUG83?=
 =?utf-8?B?ZzRPM3E1TnV2VjA2TUh6RmNNNDNkeDgxQ05GU0lJb2tWdHFMb0ZvOG9wV3V5?=
 =?utf-8?B?RW56RzBWUjhRbUFGRHlTWUtJOVFoREVRcDQ3VCtnNUFqeVRyWXBpTzdjcXZs?=
 =?utf-8?B?cUxBU1l2SHhIeUxRSmpySmpnZkdxeWxCNGtYKzRvQzZEeG5WWTNjM2JDaEdt?=
 =?utf-8?B?YW1pQUxhcThQZGY2RTF5MVcyUTBiSTRHNWZ2RzhtOTFqeDIvUmp2Z1VjdERV?=
 =?utf-8?B?R2hrdmswaFh6SjJheXJ1M1hLNHBqT3JtY2puRDJxUUxieWlGT0NGTFkzWmd3?=
 =?utf-8?B?OVh3YXJ1SUpsbGxzdEc1TU91MXRrYkV1WTdjYnZ6V3FWay9IbzlHMUxxb3BM?=
 =?utf-8?B?V05YVWdnbHNDMUJEQ3JKajhGdlJOMkttSzhBd1ZpZ0kzbU0xOG1vNHovZmFs?=
 =?utf-8?B?TCtQNXJaNzVnQmVwTXpqTEFaQS90U21xdUljekwxN0JQc0l6L1hwbnA5WFFq?=
 =?utf-8?B?WDBlaUZKTmpYdTNoaDlsNng0MmpLSXVab0VUTlF2QkFxRTFtZXFOeDh4VVYv?=
 =?utf-8?B?UTBYcUUzeFIybm1xYzJIYnZ6RTQ0MGF3ZUNqdjk3T01pMFBpcnhvb0F0eDQx?=
 =?utf-8?B?Lzl6Snh3NlAwa2FBVWNWUWtQaGVzUG0yU3Y4YnpwR1VMNWVkVXpDY0h6Tm1y?=
 =?utf-8?B?QmNGOGdTM1docGsxV01TNkVqMjZlS3VwMit3RWJ6N2JBVVhieEtSQ09ndHhv?=
 =?utf-8?B?OGVMQm12MXRuMjBValp3QWR0Y1NpZlZLS2k3ajFxSUh3SHNkQThVSVdvanYv?=
 =?utf-8?B?QzdSbHllREF3bVJnWUxZTXV6bVYxMzNNMk9BVHA1WEU4bGVYNGp1OFluQytY?=
 =?utf-8?B?bncwVGFzMm5La1VHTStsUWFYdHRxZC95K0FZYTNjSmd3ZmphV3RLYjBpMXZN?=
 =?utf-8?B?QVlxWWloNTY5MUFXZWhEc1U0NTRrTkQ5MlhDNHJ6dTdLbCtzTVBmaEVXL29L?=
 =?utf-8?B?elhheElMVDFaRU0wUU1iVmtLVmMrb1g1SmNORjU2ci9xMnNIQ2pqTTlZbjV2?=
 =?utf-8?B?TFhxY2lFQUluVHJrbU8wVEdkUHFuNzVIV29ETDVWRGRUM2FzSG1zckkxZ2th?=
 =?utf-8?B?bmxQM2cxTU5GNFZORXBCNjZuMEZyK3ZkSEZIWExEeStFNkFCMi85M0x1bTVO?=
 =?utf-8?B?REl3WHVZUVVRdnJ3Y3VidU9CQmNhcWg4amE1UHQ5ODZJK0NWcThGNlFYTXVq?=
 =?utf-8?B?Z2J6T1Z3SkFwanVCRjF1WFNiSEJxR2htOS8rNEN1NWErUDhnQzNyaDhiZEpY?=
 =?utf-8?B?L1NMZkViV1k5dGlwbjJBMVdEem96V1pkRlM2OEJZeldYUnlqcTZFenNVUFFl?=
 =?utf-8?B?azltWUp2YVNOSW5iSTZxSks0RGFNRHBzVnBVenJvemhTZUhrUWtQcnllOVA5?=
 =?utf-8?B?SDlJS2ZadWhVU2wya3A0U3Y1clRoN2xhSzY1M1NXbWw2ZG4yemxVcjl6UTUw?=
 =?utf-8?B?dHJwaUJ3RmI1eVJRN1lKcnlwb2lQbC9jRHZKYlR2OHAzMDJsVlFMdk5NVEtv?=
 =?utf-8?B?dlNhR0l0dE9EWC9WdVUyNXFtOFZpbytnbk1kMU03czNXU045Y1ZqblVqTTUw?=
 =?utf-8?B?ZUhOUTBrdHJjMFlUcHdMNlVSYVdMUy9KVnpnd2RUcVNsa1d0d3VhZmVIKzhK?=
 =?utf-8?B?ZE1JcFBTUjU2ZnpNVkQrWWNpRFVTVGhWZFJRak1DNGJGamZ3VkZOeTBvRmhQ?=
 =?utf-8?B?ZXRjMTdSWHJER3pQYkhOM1NKclBUSTRTaUFhN01ORzhQR082N3F2UnQyUDg5?=
 =?utf-8?B?aW9wcFdlbklzRGozWXdwc2E3Q0R2L1BxUzh3OXd4TVg2T0xoYkcxSnBSa2F5?=
 =?utf-8?Q?lMhy3TfX/Y4yniTLMVu46Z72KAE/8HUV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5328.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmdERzNsdldTUUFRREdLc1NqMjZtUW1BQWxNY0lsZVJ4c2I0U0tpc0RBWkJq?=
 =?utf-8?B?VFh5RmhuRlV0UHFyQmxVWHhEdHdJU1pnQjF5c2tjYXlSZDBzbDV6QXJER1B2?=
 =?utf-8?B?Z0FJMEZyVWRodGw5b0R0OXBCK0NkRllWcGZTbjlvOUZJODhpZmlBYTBQRlVI?=
 =?utf-8?B?SVByZk1xdjRCTEFuTWxLR09mY1M2RGVVeEtrL3NjWWo0YWw1bmJnbDBzaDdx?=
 =?utf-8?B?OXpEeTIxL1hZajZ1TW0vcnVVRHN4czV4OUYyZUxQRkZPdThjcUk3ZHF1TVN5?=
 =?utf-8?B?OFpJTlZBTldmeEF5UitnSGR6WnlWY0FLSnVxbFJRV1YyVkEycVRXRVpKVno3?=
 =?utf-8?B?VkVzRlVNTFpOU2l4OHUvNWlOYjI3d1NzeEpkQmVxU1EyZS9DaTRwTWp1UXJo?=
 =?utf-8?B?V0NpZmRaUGt0c2ZyVmtNWmJuZmZZay9ScmhHNHh0VUdYYUhlbFVNWHlCV1hE?=
 =?utf-8?B?R1pESzNEREV0UnFFM0tKaHBNMU9ZQldGa09JQVZDcDhOQzE2SVgrcjhVeUk5?=
 =?utf-8?B?RE1kbm9zbVdHYU5QVk50R3hMZzZGN0VNYUxjZnNaYWNHVUhpcHhPeU9IYkZQ?=
 =?utf-8?B?TlRYKzMvcVQvMDFHczlJUTRlNjZwbnplcjJYbDlwTHU3UVNXVUtBMC9LeUtl?=
 =?utf-8?B?dkVQZS9Gc3loU2thdkc4WVdYUEorVm5BcG9HbEh4eDcrS0c1RVQ2ZTBNSUhs?=
 =?utf-8?B?Um8xVDJYMXZIcTd2eVNhcFQzR1pKMGduTHRGMjRaeW5yeTJsNVd6YXhGM0lj?=
 =?utf-8?B?NEQ2eTV4UWN0ZVpPOUxBZ1pOc2wxZzF2K01XY0RhbW54MmdUMllyaXJkckpo?=
 =?utf-8?B?RHpEYUhiZjhjWUUrcGMvMURXNHlyTWlScnVBd3ZtRE1MVHh2c0lBTXNkbE5h?=
 =?utf-8?B?bUk0T3R0bGp2WTdtekVQMXA1Q0I4dGFHdGR4a0tFZW9pWjNtQ251UjFoWGZQ?=
 =?utf-8?B?cHZWbU45K2pvZzVmS3hFS29Tdk1JUXdQZVRpY1Rsc3FaeDNKSk4vK1k3bnZS?=
 =?utf-8?B?ZVJ0V0tQSTlwV3YzMW9VVjE4SEJYUlFPZTc1aGpxblQzMUpjdjArT1ZhbEox?=
 =?utf-8?B?N3VNVC9kbmR2eTUrR3hOZVY2Y0JiQXhvcWt3QURZdndLYjhSb1FjbmxHNlE3?=
 =?utf-8?B?TTlLOTA4UkhWdExtVjdObDF0MUMrcHhOUDNOenNrRGZlYStHV2JRNUpRQ1Nr?=
 =?utf-8?B?ZnU3NHJ6NzM3NzV3QlNzVFdycDVDZ1lnc0F0b1FWWnUzNHhoSUFpZHN4Qkpn?=
 =?utf-8?B?cjZBV2tQcU95T1RDQSt0bFYybnpnOFVjcGd3cG9jaGtIaHpsVy9HYXVOT1Na?=
 =?utf-8?B?WmZUaGhpTjZmeGRySlpkdXBzR2tUMkVEeFh5NGs3NHdMYTdLTGxrQXU4SEpS?=
 =?utf-8?B?clJZd25mYVNVd2E4ODJlQ3ZMQ0tLOWsvRkZXUnREZ1Vjb0dTQnZtODhVSXB3?=
 =?utf-8?B?R0VISDh0UXp5aFpCN05jV3NGcld4Q1hKQ0JSMmFpRnZrNTlrQTFpNU5ab2Jr?=
 =?utf-8?B?UWowY0pGSldKd1VtVFVpVGFtbHNXNEp4RDk5SHQ0R2tOM1BSVHBSRFBPd0pC?=
 =?utf-8?B?SXBJR2dZbG02b1RWN1BmUUZvUTFDMUNPRXdWVGdDcVp2RFd2ZTk1MGsydG8v?=
 =?utf-8?B?TnR3Ry9MZ2Jrb05oMHBkalFWNzEwc3ZwMFBhRHBUaE95cWRrSTZCKzBmdWZ6?=
 =?utf-8?B?Y2FmR1NaaUVTMFprK3B0Nm9kbjNJZjNaK2R3UFpjK3ZwaWJPWGVMaGJXN2VY?=
 =?utf-8?B?U3crSjJKUFdGbTNmc2F1RlIxUGZJYkVGNU5xWWppQ2t0bm8zVmluREVmVTdp?=
 =?utf-8?B?Y1JsUmhMWHVKUEUrUERmNElLLzlLZm5majR3eGlJczFBakdZU0p4VGpoM2N1?=
 =?utf-8?B?dE9rcjcyR0gzRkZpZkd1WmJhWVNkdkxWdWxuYldqdk0zc0hENEV6ZitscHVx?=
 =?utf-8?B?bWpTWTNwbHEzOG5YNlRieUpKamwreFBrR1JBbGpNQXV2RnRPcGZHbUd2ODZq?=
 =?utf-8?B?elZLY1ZuVE9HV2t0WldPdnhxMDJGbDliSmRDM2t1Kzl4Wis4aWxrVkJQQnQz?=
 =?utf-8?B?eXNBYmc3ZDIxejQ3aEo1YnlwWjJ4Z2c3Z2creVJia0g4dVcwRVlJaVdJK2ls?=
 =?utf-8?B?a1g5T3ZJcGZGdGR4V3FnMEV5dzdhYmZTK3NlbnkxKzBYNEU2RWlUWEpKRzV0?=
 =?utf-8?B?Z2U0U2k0cUE1dVBCeVRwdGd4Vmc4QWxLNVllMFlLMURHTmpvWnh6TUxCY2hE?=
 =?utf-8?B?U2FOTjh6VG0rQVR2Ym9UQ2duSHFnWUFzNzcyMkkrRTFBWElGWUc0L2lORk9i?=
 =?utf-8?B?Z1pTVHNCaXNFZGplWnh6Y1J2eDFYWWZjd0RqbFQxc0JvL3RpYjZ5ajFra3Ux?=
 =?utf-8?Q?0QMta9fmYtdB6C94=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6gtjZjPstDyK+W5K3ovA++LcYGFAr40zX5tAY5zIRLeC4Ow4CIn/+gSqTEXYGzDwQA42J8yw1QjUPTQk1dJBuVAvRectZz4gkw4q/zzkbqPa4yrT4tzbWT8QXLzxLu9aOcAME9yv1sVpbALy+lzA2b3zeTivwpdQ/N7RcJKLG/uopd3j3enYJbKA0Ngs+Dazqu9T1eObeFJFiy4Q3epACpt6vezQWmi13+H58sNLAmpMnYgU70AP/gXtgB8aH2JN2T668uDJ6ma/55s7UYz2aJ0LhSUe3aie3v36OL40AaEij5B6/EzzdAFs3lRSxdNnk0SGAyFcptrh1ocd4FOsf3Hhdg7FCHWzUK96BYDBxxKjL2vXSvUNOVPNvFM3YgHG/9isgsNpYQ8jA6CErxO2L0YwvKI4VYz6XgQA+mpt/ZcI+Vwce36DO1LuA445YQns9OmWqiNvbjeqrpAXhfvQiyruqjyqEcP9GGsyDt7kPTV+bFxYoMSfGZwQSmmuctH0bYcV3ZwPZXbAsASufA+QWuhsNGv/5BI8eIYN5fmJuoSEDTWirh9pMzRk9JYCubXyAApU9WovlBW9lOSWgTFqh2sSEKZ2w13PFri7h30uRi8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dbd4a8-c0a8-4eeb-a276-08de3f6d9b81
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 02:15:13.0783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1cGYPkKFJkyUL3tY1mjQsXP81k74iY46+zTZTuWNXtoozaHnZDPYW5IR3PugAURk8pY+uwCEDgJWNl2TwX09BsE3bxR80KAp+lux++HC8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7433
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_08,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512200017
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=694606b5 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Tg4ZrMGHO1SxYOvaoIcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dYKGY5OGe8QtCbuJsiclAs179LWnwvLg
X-Proofpoint-ORIG-GUID: dYKGY5OGe8QtCbuJsiclAs179LWnwvLg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDAxNyBTYWx0ZWRfX6ZeMcj3KZOmn
 niuOxRsZSgEWyZ6IbP2dB2XMpK7gJry1hx/boZD50AirMm062512vT5yQpzoiivxuJAdhuWAiT3
 /i2wdoIiBP83XtR3KEL8bkuOuD7NNV3w+MAEJAezmUTnkuislCWcJHtbaN80K/B+Bz5rdouLGs4
 6eNELe+v5aXEnCXfo8bR8W0iVkdQtHLzqqXLcjVA+TfIYeAWpOQJ3KFcrCrDfjd9qEH/ABJwy+4
 VmMW3vmaPNRJrq2o+cCW/HWu1L09qRCojiXS3WdisQsY4DI37jvkzPq0yICkDp9j5sFRqR4wgKg
 QGBlYSZbOr4rJk+pKL+Y2XnAcxGxBOGWsPpwUkCULtyqd/mL1YFHzhpx4oKaz0SNd+dPmocumwO
 qjnhLVuXLUsJAdwbtG35gC51yF+f0g8qyPI3lBFTjE0OSfgKs4XWpEKerTizF+y/XVOWHOpIq0D
 h9GNv8kIWqPwLw9kY5g==
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



On 12/20/2025 6:12 AM, Rob Clark wrote:
>>>   void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>>>                struct drm_printer *p)
>>>   {
>>> +     if (IS_ERR_OR_NULL(state))
>>> +             return;
>>> +
>>>        struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>        struct a6xx_gpu_state *a6xx_state = container_of(state,
>>>                        struct a6xx_gpu_state, base);
>> Are you saying that this container_of does a dereference?
>> I don't think so.

You're right that container_of() itself does not dereference the 
pointer. My initial wording is incorrect.

> it shouldn't..  but also there is no code path that reaches here with
> a IS_ERR_OR_NULL(state), AFAICT
> 
> 
> BR,
> -R
> 
>> -Akhil.
>>
>>>        int i;
>>>
>>> -     if (IS_ERR_OR_NULL(state))
>>> -             return;
>>> -
>>>        drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialized);
>>>
>>>        adreno_show(gpu, state, p);


The intent of the patch is to return early when state is NULL,
avoiding the a6xx_state and adreno_gpu assignments.

The check is intended as a defensive guard, since state is dereferenced
immediately afterwards via a6xx_state usage. That said, I agree that 
there appears to be no valid code path that reaches here with 
IS_ERR_OR_NULL(state), so the check is likely unnecessary.

Given that, please ignore this patch.

Thanks,
Alok
