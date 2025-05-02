Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78291AA7A39
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 21:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4FC10E249;
	Fri,  2 May 2025 19:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Dv1PNQZL";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QXo6X/nV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624FC10E249;
 Fri,  2 May 2025 19:30:22 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542JMoQW007063;
 Fri, 2 May 2025 19:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=33JfY5KaY8BERUBtZapG2PrB4EJ0CHCHSqJIW4v1Y6Y=; b=
 Dv1PNQZLgqDAnl5U0Ztg8aoAXd/Nantt0kr3wRY5Zx20a9J1oodnHgluf/0HpcpK
 Hxcw8MssjsZoRZ2HBvXE7EeVzmFo43vcmWSS67YzOOS2SBMTpz+E/JGyhuXrtYHX
 GqcKLKra4px4A3iTl7slWR50+pRG0eF+Uv5vbjMXRpZBii9DvXPfYPU1lHewKDAq
 hBa9ljqb9h8aAUxAEHv3kip3FH6yYRQu+cuvI9rsc4tY0AmKORpODF+zRd2uwDQj
 2PcFY3FJjVvnud0drtKET4EBOOoUjBA55RfIMZH3J71sPolPmzOxSie4x6o2pb4C
 bonIUGomBZmff1brkey8ig==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6utdtrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 May 2025 19:30:08 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 542HkYUx033479; Fri, 2 May 2025 19:30:07 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 468nxe4q9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 May 2025 19:30:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQdQ1X6KHxWo/LJG3Vdqxbltfh4tIXEakLFmv+QTGYnwO5UbPlLTtWQz3WmWTiBi+H66MytV04zZ4oTftKPvvSymFF3qoLrVs58d4N1UKyAH6Nt/mEs2hxBKKvRPn5d4JtEaVV5Bmn8vQjxa3+S3+VvgSNfG83WPcCU1Uxt/8ofQoraFsRpLdLFAeL/K3OrYoILZFqf4RbyikZQgYNiKh6wKgH82IT9pf686LtOBJeIwwZyzjV8qN9sOMTPjZXBdo4AXZohStKi3JWChwo7aR91phpBTsBASUhz6f+RiD/mUEwRLyY5gBlawRaDfSpNBnRWXKqmXjQON1oM6N0En4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33JfY5KaY8BERUBtZapG2PrB4EJ0CHCHSqJIW4v1Y6Y=;
 b=ZqNQJ7sPRyC7q5McBXWsdEno2MGoY8fLbhmhfLyRU1FmZrb9fW5GZZNuidnpDHVKsbJKOLYMF/5QuBk8n413qyTGBniCd23esmwiWsRtNKCivoBSZh4R/UdJ4fl1Sk9JAbYG0XHuKY+RSiN8afqhlC4rxxqoPvcQfMLrLvLGFGwO3bEMcRQEnHEp/WksavADiT+SrunBv8XLd8rrqFvaa9ybU18lfAUNzeuWg9sfv1vi/rnOoUOCskTbmpAXnLZ6ohShclE8nXh4lvC/5gSWjnrIGWluVbT0mNgewym5776FsB4xwd6qiPbIuVB6tFKTfT0VJu+nGT6bKwTudUcKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33JfY5KaY8BERUBtZapG2PrB4EJ0CHCHSqJIW4v1Y6Y=;
 b=QXo6X/nVJQL749qgqKm/7vqp/BLKzfagbeZtHuulyZB+uhDuuwVdJJbvABoSY5V6avc+pu7jhp9ERZXFZzqwx7oehoLXi0CYQfrWEZ723haxNf+id9NUPfVgkPO3S7dQzYF/PWNhQdxiv76f8yFlQLmcKc4SEBB0PDS026DIRUU=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SJ2PR10MB7788.namprd10.prod.outlook.com (2603:10b6:a03:568::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 2 May
 2025 19:30:03 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 19:30:03 +0000
Message-ID: <b98001c0-8374-4f00-9733-d9edf72c4989@oracle.com>
Date: Sat, 3 May 2025 00:59:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/33] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20250502165831.44850-1-robdclark@gmail.com>
 <20250502165831.44850-4-robdclark@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250502165831.44850-4-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SJ2PR10MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: d179e8d8-516e-4b0b-5b05-08dd89afbc74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QldCZ0tUMzF3WmRQcGhmNW5SMGNjYWNjT0xONlBxclQ3VkZmMGZTbEk0dFBz?=
 =?utf-8?B?NkZoZTF5LzhTN2dLY0NFVWl6bGx4L25hYi9vRnV5RlVKdDN0cVYxRlgyUDR5?=
 =?utf-8?B?eFJ5RkpEV0x4VXJERzJnYVliRVZLaUhuYmRsTTZma2pLaUFudWhWNEkvSCtR?=
 =?utf-8?B?d0d2Q3JtcWRqK0d0aXRVVGhDY1U1R3g1YjVCWWVISUVOR2ZxbFBLL09odVVB?=
 =?utf-8?B?b2FkcVZPYWo3TXRKaHM1c2ZtYVJ2bFN1VFVyMXVqaHFndGwrUkxZSU9kZCtX?=
 =?utf-8?B?a1QvcmRtK3BOcG0wMEVuRmNDalVGczVVbzJtZzB4a211NjlzQ29aVW42eGJ3?=
 =?utf-8?B?UDFXaUpYU2FaYncrTHhId2FaT25PUWZjQjdEL2hXZDB1WnA3dUUrZXVFOGdK?=
 =?utf-8?B?ZStIWlBPTnFsODhoTEVOVkRHZlRWcGxLa21Ea2c2V0x6YUlFaHo0NVhQcnpa?=
 =?utf-8?B?Z3MrajRxK2xzbG9HZ2kvdkFIREtlVmJRZ2JxMDYvaEhpLzFITVNIRHN1N3Rw?=
 =?utf-8?B?UFFVMHd1cjFweVJpeFlpY0duMVRwaHlIYUZtTERzK05mUkhKQU1HRmgyWmor?=
 =?utf-8?B?UVo2NmtnK0kzQTlGMVJELzdqS0Q3T0tKY2JYYjdvSFpOS0dSaU1jby9UQVpZ?=
 =?utf-8?B?ZDlRSlk0UmoyY1kyRFhCQXQyNXhZRWkvb2NxbjdhN1RyYjJ3aFBpQmxiVFpI?=
 =?utf-8?B?NFRhbmRMazQ5VnBnRlE5dXZMNHFsVUV3RGxDUGg2MkZvbi8rQzVyQmMyUEE4?=
 =?utf-8?B?b3VsRnh5cUVxTExsWExsOUdtQThVcXluaDlFZFF0YmduV3pmUU5BaGZIUGNu?=
 =?utf-8?B?Q0hSWW1jWGNXVVlHSkJLV1FSTzcrTVFHY2dVZXlwUjIwSFdQa1V4NDhXZ0dO?=
 =?utf-8?B?ZklhMjl0d21KYXRMNXI5SHhEWmJoVHlJa2hxOWRxOFlQSncvUDBFeUEwUUVq?=
 =?utf-8?B?SEV3YkhJNUM2bXBKZnRMYm5KR2pzbGtrZ2tnNDlYN2lEUTNWV0hXMDY0SUE1?=
 =?utf-8?B?RXBtNHhxWWt4N1d2ejQ4Sko3eE5idWxQeEF3WjdVKzhpOGhRcDluanhYdVp6?=
 =?utf-8?B?eG5GbEZTMTlGYzFQR1o5Nng0Wm8yTU16M09UN0ZVcVd0RXlUNktDR2I5RFRh?=
 =?utf-8?B?bjVudHNONDVpZUJWUjljU3ZSMFNGNE5EamtnRnFFbjhmLzhiekV2VUFOdmJK?=
 =?utf-8?B?c2dZODV1TG90N1dGUGh2V3dnWVdEU1NPcU1kM2xKaDRJTC9jUllXK1JYNGZt?=
 =?utf-8?B?NmFQd3VKOUVTbDRwR3ovSjgxRXQxRm1VbE1BSlNNek1tNHVxTFhpVGRhWm5Z?=
 =?utf-8?B?UTBJNytObWJnN3pBRURzZnNpYjQxeE93bVRvK2o3ZTM1K3g4TzdwbnpUNXVR?=
 =?utf-8?B?dDFScDQ4UEZxK0FVVlZnTVNubnYwK2J6dmdId0pQQmJqRWZjQlhaMXBjU2pk?=
 =?utf-8?B?NU1Ta3FKVVZzYnBMM0V2VHRkQTZBL0FXY29jKzUyTHdydmMrK050cXRHYWdJ?=
 =?utf-8?B?RlhqM2prK3pVekw1YzBkdFk4UGhHMTZHM0dwZWwyYmVDc0FwUkd2R1JiR29L?=
 =?utf-8?B?RzNETjhjRFYyUVAwOUU1RFV4T0t3c2QzWm9uSnpVcXR2UTljYzV3dzFFcWc4?=
 =?utf-8?B?amRGd1lEODQvZ2JRa2Y4MVBzWko3OGUvcndOSENuSm5hRDVqVFNxaThWMXpq?=
 =?utf-8?B?N21hUDIrcDh0b2dYbmpuT205aU1mTU8wVW1HQWdsYlBRZVVTVldPNzhVL1pn?=
 =?utf-8?B?R2JjZVZ1aE5LN296amVZb3ZKU3JGRXdOMWpSNklkYzdTOW1iMFhOeFgybVYr?=
 =?utf-8?B?eGpqY29MbnN1QUFqdmFpTHdRazZTeUI0YXVFMnhDT0kyeUN5YWpqQzZja1ps?=
 =?utf-8?B?NERBM3cyVElCMEltMGJRM20zMnViei9JN2s2dklNQjBsajgzWE5HVkZOMlhq?=
 =?utf-8?Q?qkfRKPWnOmA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5328.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEhTbVo4SXl3RW9DaWkxNGVUSTh5UXN6N1VtZlRyMjZLRlc3TXV4OUlBdHZC?=
 =?utf-8?B?cXRsQ3dVZmRxOEh3cVNUUWcrTHR1TldWTURRWlNQaWNTN3dnNkpzcHh3Vkly?=
 =?utf-8?B?ZVZNOFNjT1VWTHZXTG54MGpCa3ZONURNKzRkcGtJWkJlazZxano0M3d6U1R5?=
 =?utf-8?B?dGRod0UyemxJY2RUa2JRZDlsZG1ISjl5ZFN3NFBlTVFPU0c4UVRyRTVoRXBm?=
 =?utf-8?B?a2NoNzgzYmNsVjJFWW42d2dmOUoxR2g3aEZpMllNQU5sNnBsZndTd3V6aHl6?=
 =?utf-8?B?REoxTjF5TDkzMVV1K0NySlVucGNmQW1EMERpUEhrNkVreHVkbWNnWGVMM0Jj?=
 =?utf-8?B?azB6dzl3ZlVwNjhDWDNIY2orZGpkN0RwWTZaTUFIVDdCUldWajNQNG1LMGNS?=
 =?utf-8?B?SUtKMXZIamlTSWpybTRQMWhaeWZ5R1hWRjR4eXRqeU9UR1Q5MlI1V3FmNVp6?=
 =?utf-8?B?QkhEL2N1Vjd3M0lEL0IvT0JGWk51RWRhbjFSNDE3OFNCM2ZoZVpZcXJ6b1Bj?=
 =?utf-8?B?ZC90cVl0ci8wUEl4akxFSk9yTFZreHBOVnMxN2VHdm0xaUtEck9NSHo3ZDRR?=
 =?utf-8?B?djQwT1piWUFzb0E2YXBaWVJrQk9HdFpENFhJVjlyUkVUTnNjSmJrYmVQUVVG?=
 =?utf-8?B?SjZ4QVJyZ3VHcVJjWWxtTVFUbC9QQ1IrdkRkRXl5eGl0SHQ2MDk5b0lqZzRN?=
 =?utf-8?B?VHNvYXNTQXNnTmNzVC9mNTBpL1NETmdmMENnYW9YTmkvT0NTWGNud3RrcmlK?=
 =?utf-8?B?Y0pFdHh5akpNeFJ3UDdaNEkzbWE5Q1k1Q0FzZ29NRHNaRXIxMVFqZmhWcTcz?=
 =?utf-8?B?TitFbzBPT2x5ZU1hS1c1c3I2aFAyZzRGNEdScVpiM1pWcG9VMHorZDh6U2Yw?=
 =?utf-8?B?enRjZUVzNzBkNEZtM01DRnR2L09xOUo2QjhjREhZaU1FTkdNUWF3aTNMSXJC?=
 =?utf-8?B?K0JJazJTSnlCV0RIMWRpNm1scjZaZW1scWl6YTAzemNncGxHb2poeHYwSUly?=
 =?utf-8?B?T2FZTUgvTEtyWGkwTi9nOHYwbzlZUzZvRDY5Wkg2MDJidWtKcnlCMkFDUW8v?=
 =?utf-8?B?bWhvWFp1MFNCbndjSERDZlJ5L3VIbWtyVDhRTGVyTitxRXhDd2RCY1FWZGtS?=
 =?utf-8?B?WTdBUklCS1FERmVTa2NUS2VuRzNjK2RVMVNPLzZCekdqTC9kelVyY25hR3Vx?=
 =?utf-8?B?RFJCTWduRzY0QkFXWnFxcnpoNHRsaHZQU0N3SjdFYk10VUpJR24zQXBHcDZp?=
 =?utf-8?B?V2ZRY2c2b25rYTVSK3lQQmVBVU9ZcVFSbUpKaHAzMEpJcThDSzFWUzM1aTlv?=
 =?utf-8?B?M2JuNzd1cjdFMkc2ZDFmNDhob2w2M2hBMHZ1eVZTbnBHNWNpVEp4eUpNYjZo?=
 =?utf-8?B?aGpLMEVoYjh0MlhTRExSNUY2bjRNbUFrSUV4QTdEcDFiZGltSXd5VG1EcGU2?=
 =?utf-8?B?TWtvODRTMDR5NXk5K2s3SFpXYVBRclhqMUc4UWpEWFAycVNxbDFqN1ZRU2k5?=
 =?utf-8?B?TDFLNzhkdStFRWRTRnFkYzd5WVgyT2RBbmNieFduVHBHN3BmK0RFNUN3NTVq?=
 =?utf-8?B?Ryt4MDRKa1NHOUlFZDNDSk4zZXd0UTMwRS9pYUJLMjZCWUhSVTVNODFyK1VY?=
 =?utf-8?B?WTRJWk9pRXVKcnZjdkVlUHZhaXpIK3BRUmQvdmg2NVFvYmt5QUpuT29JV0VL?=
 =?utf-8?B?emk1dG03UmpkY1Z4Um51anpGTTlNNjZRWERnY2kyWXo0SGNjYkNDaFd4WU93?=
 =?utf-8?B?ajVmUVZIdXBUSExnVjlrK255TCt3cGNXMWthTWxCRFc2WUdGWHAvUERqT1RZ?=
 =?utf-8?B?UGdhemNqTEIvVkxiUGNaaWdibjRUdmFjaGJMNmh1SForejVuakRVWVBGQmNk?=
 =?utf-8?B?MFo4ZHZHbTdyMHJqcldOZXExRjhkWmthT1ExNnFjQTNKSVp6dllxelRFbStv?=
 =?utf-8?B?K3FFeTlSWWZuV09sTysySGxoMEhaZ1NvelEzSEJveFh6VG0zQlFGVVVtd055?=
 =?utf-8?B?ZldzbkZWT1BpcUhucXVIbnBZeXhPT2xWQUdoQ0UzZVpNaVRhdFJCL3lGZEMr?=
 =?utf-8?B?N1JUUkV6TzJiNTN3dEZHS1N0NGUvSWJHUXFRS0VHdlRQV2VIendhT0dxL2hl?=
 =?utf-8?Q?KdyTV/rURA8ggX6QPYby0hj57?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: RkMwMo+0U7FZ7ZpXILTZmeQjr9L4diikfqQ9xDkPnAU+wHALncSWiZjlBbv53M/wDrVz397dDOYmey7Zr8Yam3zP9MwHe5uDFgXQbIvGgXbKKb66/imM8T/y3zTSGzvem0rTyn8hlWMdHVZDDVMlfZflDYRDWbqOa2CI/f+gykkpJQ8d2ySByh4NwP4MtEpa29sDPJxOelZ+WVga41c68Pd5mdNosPs/JpfvE0DHO6Vv/EiJSG//ahvO0HTqckHK1LoFu1EvaUmFbWsRfzzTAS97w8P+tOe8Da7bH4SwvVKRjIxJ/4qYZDzVdc0YKQl080+k4pb8XJDtRKZNWmY32its+DO2dHOcTvxH60EGBi0HU5FWDpk7U7DqOsnxY5WoD+MlS1cT0XtSXhL791yhAZ4ar9uqNf0sd9Z6/UaFLSKHbyinwLcQBBW6OS+pmsub0puIDiHv7LrpnGExNQ1QzazytNT49K2l+s1tEdCvKxX+BVZyc953Mq/MLVXSNAJhMc+bd+2up1Oi1lQUUSqJ2lF84sbUEBHq4hiNLJg8Qg/eUn+yPEq2XXTuXCnxESdrTY2xk7D2izMorTccMKI7N1mJbEIX+s4rPvrBxeLplRI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d179e8d8-516e-4b0b-5b05-08dd89afbc74
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 19:30:03.4364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBTumhjWvc60Q2gAPuHoIONiSqJXU+ukqpLnRoq0NzIEcMoHxkcpzUwXgwAJlVFLZXMuy+tVTxZ5VmOgSVRgTH/hrNY0V5BuZrEO2VOhgMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7788
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505020157
X-Proofpoint-GUID: GNlrWC4USS4E4FHljJaw-PtH4cNbNKzi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE1NyBTYWx0ZWRfX9yasRWI4Xp7z
 EgUemvcd/XvV3eTOYvKwliqgOaLOgno1TK8QG9sOE1yNu52r2xexU2honMM6a+4LGrb79EB/Dzj
 enbfkYY7BaXYjVJTGibA2SCIqhW0skBxEpOPlFrfGP/RVcIBVgny4RjSekUoxeJzWBKnY7rmOIh
 O9AOnv8mid7KR3e3FQGrfA9sqDo5h/0nKzWTb+ialBY2cS13gpvaKEsW/lIwPgkij/2ojhztdnV
 VmZnCMnbI6+GUxpSNKKT4rBNkwKREpnVr+C/wBDC/8lJRCCeti9hdq+2CUsNKu6+uXHq4hv/v0K
 Prvt7DWXYTl8NfY0zuvDf04SknuvJVs7ar2mlDNI9trV9Q4NTO7oXnO4DvaQ/ifxvAcb+BfKCH0
 CE3De31YJOheBQzeYE/OUBkUDHM79SLW1ImCwQrGGNPTCCs67UI5IDHucKC+2gl9gcoSEapC
X-Authority-Analysis: v=2.4 cv=ZuHtK87G c=1 sm=1 tr=0 ts=68151d40 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=cm27Pg_UAAAA:8
 a=dfvDVc4bmwly12BK-8YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GNlrWC4USS4E4FHljJaw-PtH4cNbNKzi
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



On 02-05-2025 22:26, Rob Clark wrote:
> In situations where mapping/unmapping squence can be controlled by

typo squence -> sequence

> userspace, attempting to map over a region that has not yet been
> unmapped is an error.  But not something that should spam dmesg.
> 
> Now that there is a quirk, we can also drop the selftest_running
> flag, and use the quirk instead for selftests.
> 
> Signed-off-by: Rob Clark<robdclark@chromium.org>

Thanks,
Alok
