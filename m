Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E810EBD018A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 13:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10E710E113;
	Sun, 12 Oct 2025 11:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="jYrHl143";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="reRwWxfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498FD10E113
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 11:31:23 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CAsXvu021301;
 Sun, 12 Oct 2025 11:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=kxt7+fXfIVG7YQHMa/URenOGtwnikETcdELLW/SW4BM=; b=
 jYrHl143dPTDdiE8UZmhzQC+r07LxMf+iZxajlRA6aZ/sYDj7juhi4DNdKeat57S
 noH4fxXoJR3ymqHj0wGEw9Y6dQcVq1oxLFs6d0ZCGYK2GcohqMQYpPxyg4GnuUF9
 D6mc4yYsMsiK0P7GX/LRp44O1zUOs1vKRCJS0cqkJoQ8DtTAe7YYyAxNBUw2fymr
 wwn9pmTRJFZpz3pwRZDQ6vYVeFS/0s+tSnoTKp2jIMPUzIR7rpp/dYXBl/e2IfxY
 iS3FND8TjacUXbwn7sVGhzpw8Ey1KcEEU4+08Rxhp0OKS3BSyIOaLnUSo3wcSW7Z
 GfTHj+N8HW14fxN/6FRaGw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qdnc0xk7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 12 Oct 2025 11:31:17 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 59C8vkN0018038; Sun, 12 Oct 2025 11:31:16 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013071.outbound.protection.outlook.com
 [40.93.201.71])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 49qdp6kmmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 12 Oct 2025 11:31:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivhc+BKPFdKVjDrFuPMFdgPpZgyFJdujsu5UlqbPBoea0kxzUF8oqNVsx6NkHpeSa+1W4RC3vHoyBl+ry5BmabFAfs3T2xeWIgFcaoSruBaBMLlCHHH0uWnyE7EY0Jbgsu6k577NbT0gWPKvhqyHks1PSeXJYFsE5q0S/vbTodTrE5l2Vw2GdGEDtIvl3inMAqxq7HnrrZkg37NyfIvWPpRS/gMuiyeBGYosqwjF/YjsBbkw2DkkrCdE4mewZyfYKFzcDYiYSrJ7AHckfEhGi02Kc8P0Qb8sjIxdJfVk3bRKT41MEqLuhCDn1fppEGegYm9+U2jDibYMK19QiQPbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxt7+fXfIVG7YQHMa/URenOGtwnikETcdELLW/SW4BM=;
 b=x89VqBouUg3eac/Y/L6T2b57gGuQqBpllw6Q65hGSVma4oHj7v/5mLGXTGw9jdRXnanb/a5X/0+GGLJTleUUeE1hwTlsHr6Czn+/2F72O61KasE1N6Qq/fPAss/REfYL+Vs18hHNkqhT74e84JNRvWmp2ehP/vDcw5t66ZVeOYaTnosi8emSyatRJ38UCGXS0tsGzzm5W5aCBCjxq6QLx3E9K/c91VrnpXR4tf/j0v2dNDYtG763Ro6ml+t3AwwmYN2MniV+lyniyc9tYoD+eVjFyFRm/zHF0cOz/fTOiD5X6EsveXMNJORnZrGiVFjS8VnNg+2a5Th9dicghXUGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxt7+fXfIVG7YQHMa/URenOGtwnikETcdELLW/SW4BM=;
 b=reRwWxfh2XAkrJS+lISOWqlobiJOi4nTtBWiTkrrFKylOjCv0E3Xsh1g009Ojg5P5QhkBWS8K+n12Lz1SGNvLxJOlFqXh945B3ta0UZ3hNMTi3lumteLWzXZ6tDAtJDSygWoKrpunQNQ6DjZHc7ambUFvR7P0M5FyEUNm29IRM8=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by DS4PPF7BD9BEA92.namprd10.prod.outlook.com (2603:10b6:f:fc00::d2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Sun, 12 Oct
 2025 11:31:13 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 11:31:13 +0000
Message-ID: <0cfabfda-2d57-45ea-aee6-571f2df74fc4@oracle.com>
Date: Sun, 12 Oct 2025 17:01:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: [PATCH] drm/rockchip: vop2: use correct
 destination rectangle height check
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: michael.riesch@wolfvision.net, robh@kernel.org, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20251011130450.123444-1-alok.a.tiwari@oracle.com>
 <79AC74F5-9579-4A1A-B051-FD8731DCC524@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <79AC74F5-9579-4A1A-B051-FD8731DCC524@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::10) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|DS4PPF7BD9BEA92:EE_
X-MS-Office365-Filtering-Correlation-Id: ea535fad-e2aa-44a9-ca54-08de0982d973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1JxL1MwaEVjQld4Tkg5YjZBTjZWbkxlalVHSkhrZXppbmJTVEtIdEY1VzJj?=
 =?utf-8?B?Q3lVQjBLcHdxMnBmdXBZK0lkczNuemtVS0RKL1VWcnZabjM5MDdkd2h3MjdL?=
 =?utf-8?B?SGg3ek1IYkI5UVdnS3JNSDJiRGlIY05wREVrSVM0M2lITUVLVXMvTmZTVVpY?=
 =?utf-8?B?SEJuSUNMcGYvQUxiY3EzTDFBQ0RRRHhwUVJMS3lGSlhJWlB2K2JweDBLeUlm?=
 =?utf-8?B?ZVBlcjRWMmJzMStlRGl1VHd6WHcreEU5N3RXaC9XN0d5eHY4bk9qcXBrV2ta?=
 =?utf-8?B?TnBncGRQYzJ6MEJVZ0ticVRwc0xYL0xwOUpMTUZvVFNpMlRrYk84cjNtRmwx?=
 =?utf-8?B?Z1o2OFM5UzBFS21TMnZrNmREWTlFUnlWNmZ5VHFDaHZvQStQaHM0NU9VYmhE?=
 =?utf-8?B?L2V4Y2Y1akpKTXdoYnZ3K3VjQXN0bnNBV0NWMFpPNjNackVsMEFldlhYaFRY?=
 =?utf-8?B?U2xadDlhUzRHcjBKeFZTUkRzbUZNMHhwaUQ4OHB2VjdBQ2lOaXdGelppMVRN?=
 =?utf-8?B?L1cwbHZ5WEdqVHRqcHhLZGQ2anM4TlRVd3NsajE4TkdxT2dmNHoyWnZVOTZp?=
 =?utf-8?B?N0RJMGo3a3ZvTmhKZmdWUGw0YlNNWWJXNE5MYndUWUlGbTVnSWlTNGNDTXox?=
 =?utf-8?B?eWJIRTYrckhPYUhMaVlxODhFZXd1YkYrVjUrNWYvNnladDRMWXMxVUFXdFpj?=
 =?utf-8?B?dUptcm4rdDNKSWxITTVqQjN3VGNvLzVuWTFWUDY1MDNHRnZOQ1l2MUtvZjZU?=
 =?utf-8?B?K3dLMThDd2UwOEpFc0ViUGRVdjdrZUViSUpiamNkOXFSY3hQdlJFQ1pQZzg5?=
 =?utf-8?B?VFgwbUJMZy90ekpHTmZKMHZtVDVBNjJWN1M0Q2pFWDkyMFpNMUFna2JDbGZT?=
 =?utf-8?B?a2VUdWxac204ZlpHb09rdThjamVPUHR4UFRFcDBDSUVOT0IvZ1J3MUJpMDNW?=
 =?utf-8?B?UHZlaGd2aUs1a29zSXRVcWxYYkJKT1N5b0Y3elhraFhnU0VNUWxDNEluTjhD?=
 =?utf-8?B?Vjg2akl3eDJ1QnJWd2JKRjN3RGpjRFNpTHptaFgwbFZWNjZOVGd4YXlWY3Ji?=
 =?utf-8?B?S2E3OVF4M05hNGxrL2RuaWhvNytmLzNHdVlDYklVR1doYWFHNktadnpQaklo?=
 =?utf-8?B?ditLck50MVVQQ1JqUEg1TExmS2NhSGxMZTYrNEgwck4yMGpEeWthVWRSSGVY?=
 =?utf-8?B?MHRKbnR3d2NlSExtZWIyeDFpYy94bDdOUlBBQno4bmUxTVZuZGlta1MwN3Rw?=
 =?utf-8?B?YjMzeWl6RDdvZmU5dDM4aGdZK29XU2hRV1BBMTh4QjFkSTZueWl4RUVlbng1?=
 =?utf-8?B?QkV0a3UxRGdYZ21rMExnMVNqUnBnQk41eXBrTW5xSUsrZzk1NTVzSGUwQk1i?=
 =?utf-8?B?LzFrYXRQL25qTWVvRWRkc291aTJUREI1N0MyMG9iVkk0blAza1ZrL1ZhRUlM?=
 =?utf-8?B?YkExTDl2eUluenNQN2RJNmdPdmd3Vi9GbnFmeW9FTTRtVXBIVVlMblJIMTJE?=
 =?utf-8?B?SzlhYkxiQldoZ3h1ZjgveTZLQTZCbTlCVHkvclcxNnJBclBRWlZxM2ViMkdp?=
 =?utf-8?B?ZEhLTHlqS0xuTU9kVUF1RWtmUEQ3WEdXUFI3Wk9CRVBKZHRUMnF0UHdERVdE?=
 =?utf-8?B?a1RiM0ZIOXIzcmx6UWJPaGd5R2xyOEtKT0pTNy82Q09lZHZRcjN6SGNHZzVC?=
 =?utf-8?B?aGhsclFXaHNGQzlSdzlIUkdnQkNqOTNVWGU1UDhqbHo1ZUMvRnI2THY4dTlM?=
 =?utf-8?B?ekpoK0lDcFB5RXFJQUZIKzluRU5QR293K056a2lPaGNRUm5Ba2g3Z00zblMy?=
 =?utf-8?B?dW5ERzR5ZmJyTy9NaDd3ZmdMaTYvWkx6RXh2UmM5TUVtSWpJZTMvMU5sbXR6?=
 =?utf-8?B?ZHYxc25nNUcvT1drSlNDZ3RLOWIyUXE2K1c3RE5xVmQvTFI2T3VmM1VVdkpx?=
 =?utf-8?Q?GoLriG5t63PTKIT5qVWcMky7HrdhFqTT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5328.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YldSa1hqUllFS1NZVTdXSUdtVlRQRkVOSU9XTDdXRyt3dDdBK1RZVmJ2Wmk5?=
 =?utf-8?B?Vm5kU0NOQWJvVWk3eVJSWDN1SHd5TUwvOHhMVDZvU0pqZTNEZmQvUTFIcUxG?=
 =?utf-8?B?U1M4MDB3YTMvTUxDRzBmTXVzcEJaY2IwRHpUSUNZdFE2U085cjJGaW5YcHRR?=
 =?utf-8?B?cWZKK3pEemtvY0hnL2JqWEJrK3lZZHRaaXFmQk5vR2dzd1QzRFM2OEhVU01I?=
 =?utf-8?B?N3lyM3Myb3Yxc3JPd2t0Z3hZNEJUS08xYXFwbWlPNzIyS0ZndDE2NHMwTXJT?=
 =?utf-8?B?dzFNZGphR0twN0pXcTVlR2oxa3JtR3dSQzI3TWxoZ2ROMlBTMUJFOHBLRVBL?=
 =?utf-8?B?a2p0TTkxY3drNUh3NnEyeUdCOTJWa2FraGFQQ0lmcjJKWnhIK2VmM3dZVDRL?=
 =?utf-8?B?WVdTeXdEdHhweCt0Yk8zVlpHL3Vub01mWHhLcVhkd08yTGZKZ3psK3NxZHNU?=
 =?utf-8?B?bVh1OW4vVnRyZDlYMkF1aWN2SWNxRkVwcERpcXphbEhONzZUMGNjS3VYU3JD?=
 =?utf-8?B?OHo5VkFRaXplcDYveU1jcGdEWm9SaUh5TFN4aTZDcGY3bk9RZ2RzSWVwWGtK?=
 =?utf-8?B?KzkwM0F3QjVEWW52SytiUlY2VG4xT3pJd2hGcXdRK0lmV2hCV1daREhsSzBm?=
 =?utf-8?B?V3JqQU8vbXZ5ZFNqKzFyVTc3cVZId0V6MUpoUWNuTi9iVjZrSldWUVk1bVZp?=
 =?utf-8?B?YktXYXdjMm1lMWg2cTNtQU1jbUVvR0VHOGVsMmlIenNJOHhsWGE5SWQ0MnNw?=
 =?utf-8?B?WDhVcDJyUzVuR3BsOEJiN0hwNk9KckpvcXJOMDJzZnZvUE05dThJWllRem5Z?=
 =?utf-8?B?dVFUajhEdFcxL0JmVFlXbFlXZ3hiaVE5SWVRSlFLQVp1cGJpamRrMWlEY3pS?=
 =?utf-8?B?dzVra1RGZmY1d0xqbG1wenl1Qlp3bW4vdWVwZWhqK1hHMTRlWGY2M3pOTmZu?=
 =?utf-8?B?SEdueWFrcCtnL0tsRkxueFdCS3hIRXlQNk40VEhyYSt2eVNGODlERDA1bG4v?=
 =?utf-8?B?cm1ONW9zV2ZoemJ0ZmI4R3I2SlZuMmNnbHE2Y0Iwa1lIRG9RdjZ3dHpkdyt1?=
 =?utf-8?B?aHZ0aUJuMXZkYmJ6NXNLWkkvNzhSeHlYdldHVElpSnhXWUlCVmlCWnBSTWJM?=
 =?utf-8?B?Z2U5ODgrcUxPVllJdHJZQ1lzRkdSMVMyY05SMEZkeG9WeHFMcE8rWHhVb0xJ?=
 =?utf-8?B?T3ZWamF4WkIzK1kzR29Meit2RVV0b2xmSXVrRlJnQm55bUl0dDFGYTJsVHcr?=
 =?utf-8?B?Z21jQnJlcDd5WFVDcU9NYXBpWUFVb2svRmtQd3JKT1pzS0draWRtRkJST2th?=
 =?utf-8?B?dGg0Y2g4UnR1dzZnMHV4akdlN1NXcGtBWnFDTVBHa2E2MGV3WGJwR3lKYTNh?=
 =?utf-8?B?UmdpMi9pdWZ4SE5YUzY5OGV3dXM0dzJGV0Y1MlM5V2dXdkNJT3dFbVFldDIx?=
 =?utf-8?B?VVdEc2h1c0RzSUhZQXpCQUc3MHFpbkFYTXlkeXptcEp5NVI3YUJzMzRDTUs4?=
 =?utf-8?B?RHRsSEkybXNaR3BXT21BYWVyWE1wdG1PdWVRUDZWVTdFdkpCRkNZSHFHYTVT?=
 =?utf-8?B?WDM2T3lUV1JrN2Z6S0UrdFlnaTBUdW1xUDRLR2V2bnlqRTZZVDNUNlplNGxB?=
 =?utf-8?B?Uk9UaGJWeHpnUXkrYTlnTXpjMWxEZHZQRk1GMVU2czBSWUhqZmNYYUdKMDJp?=
 =?utf-8?B?NlQzUERqM2UzRUlZbVlyYlJjbkhxbGdkcnM3Wk1jdVZISkxrdEdhMVgrYVh5?=
 =?utf-8?B?QXNlRkJnSzhQNklxLys2K3MzbHJnMHFyU3NWZGNidnFWcmdlSlZubXR6TVpa?=
 =?utf-8?B?SDZRK0tNbmczaUE5L2VqbE9PM0t0enFmTUNOaFdhTHNvWGcrMmEzNThpTStR?=
 =?utf-8?B?OU96OVhtbGdRa0xsd3NSOE1xNC8xdnNIeGRkMlBndUlvdXNvYWs1VnBzOGNU?=
 =?utf-8?B?dXZuL2RobGFIbUllR3puODg3R1pDNTg5bHYweG9EODRrb0pRVVJiNVpiKzIr?=
 =?utf-8?B?Mmhld0F2WFlQZWFuSFREa3BuYmhTKzZIU25XT0lqeGpqMVhESkNMSWVBM1Qy?=
 =?utf-8?B?T21KOFNqN3NrSCtYWm52QStHeUFxSEcxWHhVWFd3V21nNHBRMzdTQU9yQkpO?=
 =?utf-8?B?RlM5TzhaN1R6aEpDbWxFaS91b21zOTBTUFF6VkY2M0x0UENXZFc3WFZjSkto?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Hn8hjFlrN7gMniYPOiOGNImvrNVvENaAlNzrrux8DZIsmajgXmBA8cYs520bAs1oHSiUUbqssUJE/Fma8qcr8+4u23wq7RM0ZOCu5ZrBCld0sRvs7KLjbGEbec/+GApdk2W2DNkKgGKIzQu9LAAS8O1HlERaCYCbCo4HjgXcpeGS2oproFHtF9JO1N2PJV4iuHqtdm58BrCpRFOBsJJg/HXBzx2WRtHgweC0fPhI1RZF3r/Ke1Wd9ObHMA7BT0h6sUyKgPmwUxZXgDoaJgSyRMyMEwiNZ4OZKLFOc44yhqAt3WaOMxH6nJjzugag29G+TTzVI1t40vKml6f4HwboIC7UQQRqD7T+EvOkI5lblGXwJ9pw5DCu3r3HizNH9Mx75uk82axN29CQmvnlEz8PVt1zHJdeNXBQNSAwPUpMk0nkbqwFHT4AFEhqKE2vrwS9WSUhKRLYDZvPB3E+uer3tUDDkm6BwydjVt2tUqN0+cTqKFTcdrSYors7GR704xTWw7jlBEaYJ8Vmk1zOFqwBh4yFnjJaX4CTp+4q2GzWRZpcK6z88F8qQLkHtZa45e3EUoPXwQMBTAajkqTySwi7RFjmPf+T1bvCMs3zfUiW0eE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea535fad-e2aa-44a9-ca54-08de0982d973
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 11:31:13.3002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtNTJeNc9rD1NGPO5tqjUhNMXvcsFQBk7JZJjJ897Hqs9f4m8CzgQfcKF41CRJ/L8Rt2Sgq4GEqEWtu+SvRTUkIPK88djGc7TZD5AjNoRuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7BD9BEA92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510120060
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNiBTYWx0ZWRfX1IGOsJgXBs6O
 6s/ZyWcfKsTWNY76YJzEFcroEltNMP20TTsDprEkVZmAsvp4LN6WhMofckUeHGts6llf7qMjKpD
 JtKICC3oaD/HydnHMaB20YXFCzRiJeINVR79ZgI6woK9UdJh/1uYttuipKrNGp4KRWisM/QfNCK
 ED9gwrQFOplM9e4aZeHhWb+bQDkv7YcgLKACCPfomtjnA91FYHvYAEF2D9tSSsebZr29pfK+tJp
 PfXEmItiPKrb2kTxMgjmo2Vrapnn1NgjPMkQ2cI383pHckbc4D5RZPiMlMgJ8w03tmwopaNa81H
 UVlLk/77zNQBFzVMYOzBA5JySJlZUFRBN354j2LAnMO/mHf7o0icEMkBEueyhgrR2gPY0Jnb4CP
 xXzvBFxm6NoY1CcGENjJQQDWgxL66Q==
X-Proofpoint-GUID: urKi1xUMDBqixgyAltdUmHamVl6PKXei
X-Authority-Analysis: v=2.4 cv=ReCdyltv c=1 sm=1 tr=0 ts=68eb9185 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=oJ-W7e9j519qlLBB1sYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: urKi1xUMDBqixgyAltdUmHamVl6PKXei
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



On 10/12/2025 4:58 PM, Christian Hewitt wrote:
>> On 11 Oct 2025, at 5:04 pm, Alok Tiwari <alok.a.tiwari@oracle.com> wrote:
>>
>> The vop2_plane_atomic_check() function incorrectly checks
>> drm_rect_width(dest) twice instead of verifying both width and height.
>> Fix the second condition to use drm_rect_height(dest) so that invalid
>> destination rectangles with height < 4 are correctly rejected.
>>
>> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
>> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
>> ---
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index b50927a824b4..697f54777a32 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -1031,7 +1031,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
>> return format;
>>
>> if (drm_rect_width(src) >> 16 < 4 || drm_rect_height(src) >> 16 < 4 ||
>> -    drm_rect_width(dest) < 4 || drm_rect_width(dest) < 4) {
>> +    drm_rect_width(dest) < 4 || drm_rect_heigh(dest) < 4) {
> 
> Typo: s/drm_rect_heigh/drm_rect_height
> 
> Christian
> 

Thanks Christian. I will correct it and send v2.

Thanks,
Alok
