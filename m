Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45708AE89E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97451133D0;
	Tue, 23 Apr 2024 13:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="PyKmE2NQ";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U3bk8QTf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974F81133D2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:50:09 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43NDnDE7029254; Tue, 23 Apr 2024 13:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=CvSf/ybsUWBRzV90YGOs92YrH+RwOE/5PU33UlXVEEE=;
 b=PyKmE2NQURRHv75ufzDRUvStDPcCE2pJeHkH9Nhg5dYGJta2oBMMFPzdVTs+r5WB9l6/
 x3XfNGUR88Vty3MDxiiZ1U3jUnMeeLIaHpUFlnJ0bx71fTYwKSq0gGW8c3TYVRDcxZiB
 124z2zYT257bCk5UR+YvyRi186HVkgYdN3kcdTv1mfKy/0fFVbEwbznETz+SBK3z7IBO
 o78mS+m6a6dS9sSEqM7uf8JcT8Mdq0uHnGTQ23rZjSwJyVY2CJ7Ht30pxpuwsMyD/VzY
 sRSGcn18WYa/VdhvojWuHjkcS1Z5YeilxXhaoZD9noN9AdL615XfEOLuQft0o3fZglIv /A== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm4md5sve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Apr 2024 13:50:00 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 43NDiroi030945; Tue, 23 Apr 2024 13:49:59 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3xm4578323-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Apr 2024 13:49:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBDZKYluOtgfjkRLeJlH86OFl/MP2aasWzlK2P5jH9Q/4J7Vv+YIJlc3YAMediqE8iN6BZxfmqIHmHJLD1oA2uAOHDygPoF62+G+T6vPOdruHifM80YORA7ZdionAn9D8WyVGLxbPOdlKzeJ8JpcdCT2oNIFLTC/vvam00vBkxAWjA4lczVgMoCgOsnR9aH6RRjeYlQ+J8wTdMPQNHjExWY7TKCdDw9Nkl7Nbu7Sfv9Xb3GcE8LGnxerI0YzoD26RJjDD4To/l0tszv8Q8rfA8hZeXdjWpDagawvtq3azwgw17UO+OhhSvtdJ7sLmCcXRTSZdMDnBOLmv/csF/CYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvSf/ybsUWBRzV90YGOs92YrH+RwOE/5PU33UlXVEEE=;
 b=PyYAP/6lHeb+BK7kAF496E8cllAuN/nautyO8YsmaKBev+v2dsc2aneFirNcSi/l9YyF2voozpZYi5afJeVPcPUhru5buLU3oPWrTnOBOJjnxAQEPfbEkoyc2/kEd5Z5eS/hg8SS6Ov54TvL9xHzOVfbT0hjuu/wR6VdgIJhzc0zSC8gcFqc5JHPOpidTOkYfsD0wN6hvlQ1VFdLSSmzREeaS57KHqSEJVDfLLD2vn243WLo4itlUNJ4yFRGpE07qjGBSr0lURCgOXg5sdUiRkey6ezNH5gJand0ysv1SqvkBj+wEgpvapj9Hbi0L+gsi6gsto5B9cd7euPO/QcY7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvSf/ybsUWBRzV90YGOs92YrH+RwOE/5PU33UlXVEEE=;
 b=U3bk8QTfo6qteyCS1IlkYeLyn/AmpJ5Q2dvkiJcBq4xYq/6LPJMViZdWmWjw4T6XmL1Rz++JXw8g0UfMHknKxVFMjPp4KGVewRHEsgKUxCtf98daOUjgHkASKzIXniQRgErP/bD4YmoFvf46ZnsSeKl1AEuVGTyVmcW/ksdjaTE=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by CH0PR10MB4827.namprd10.prod.outlook.com (2603:10b6:610:df::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 13:49:57 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76%7]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 13:49:57 +0000
Message-ID: <1541a4ee-7482-4534-898e-53351be70cfb@oracle.com>
Date: Tue, 23 Apr 2024 19:19:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: fix incorrect address computation in deferred IO
To: Nam Cao <namcao@linutronix.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jaya Kumar <jayalk@intworks.biz>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tiwai@suse.de, bigeasy@linutronix.de,
 patrik.r.jakobsson@gmail.com, Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com,
 stable@vger.kernel.org
References: <20240423115053.4490-1-namcao@linutronix.de>
 <1722c1b6-59a5-429d-905c-bc1951a68a68@suse.de>
 <c2bf36b5-3145-491b-b272-d5afae73db7f@oracle.com>
 <20240423133445.h44pcNzq@linutronix.de>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20240423133445.h44pcNzq@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0135.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::15) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|CH0PR10MB4827:EE_
X-MS-Office365-Filtering-Correlation-Id: 16daf1a5-9d78-4f59-9760-08dc639c42d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|7416005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE8yM1F0alMxRmF4Um5pbWVWSW05ZVB3RXlrUmNvclc0QUhCaWxvVFB1RVls?=
 =?utf-8?B?NmJreERVTGlEWjN3VUUyendJRFBLc0tHNVliSXY1SndKOUsrSzQ5VTA4MFV4?=
 =?utf-8?B?S2ZvZ0JQaDlSUmY3aUtzSGZGejFER3c0NFdRb2R0eEsybEhXRFlNbkpWeWtq?=
 =?utf-8?B?Z1h1WUVMQ2ppZ09DdFBRbGpYa09WdHoyaGdxYTh5TTZveXJCdDRhWXpnQjlq?=
 =?utf-8?B?VUlkU1JFV3ZxN0kyaFBFVXJIcEwrR1ozMEJCUmlBa2V0WUhJSVNheTgvcWIz?=
 =?utf-8?B?VjJPWXhHMDN0bGppUUUveU5mbWR3d1BYZTFiODZLdmlpa3BDVVhrSnIzaWRS?=
 =?utf-8?B?bUR3QUtPQ0gzcHRjOEFPTVdHTU9qTmxNcmhqMTRYZjBYbEZpTlpkUG1pL1o0?=
 =?utf-8?B?ZDloTXFBK2NrQUxmUTM0ZmxFQVlELzgyc2pmcTE0Ykdkb1NPaDJBQlZxUnM4?=
 =?utf-8?B?RVl6QkZxUWxqbE5ETHh0TzNwd2lSMjdnQUxDd0xrb1ZaS1ZwRGh6ZzAxZGpF?=
 =?utf-8?B?b3JkZ1N4SmI5ZVZuQWtaYWdxVzZaWWlnZG0zUERielpvYXdBTlliNkJoMGxO?=
 =?utf-8?B?ZUVDV1VwclN2MDR0NHdaSnEzNW1tdFc1elc3Y0drdWg0b1U4aHZzTnNWUTdB?=
 =?utf-8?B?S1ArWHpGSDBXMzl6ZDZsYXRvNFJSb2EvcXFIT0ZsbzhSMUNUK1Nka0RubkRK?=
 =?utf-8?B?aUQwbzRKTklkWmlmOVI3dGdSZE5aUkNwMzRXUUVuREpEK0g2ZEg1bXdRaFRm?=
 =?utf-8?B?WmxDcWhCcTI3eXN5TXgzK1NTRS85bmhHaVZ1QndNck85MStwRE1LaXpFSEpB?=
 =?utf-8?B?TFh0M1JEVWJQSVkwQlFjaEFGWE1rTnVVeGE4MHhvaTN5SzNldzROWTRkMjJC?=
 =?utf-8?B?QTRkRGpvY09OdElkRVZ1TUFGUVBvSDMyZnFHbkM2UU5YT2lTNFk2bkd2VlFi?=
 =?utf-8?B?YVRUdE5xaXFuV3RaS3NKQVQ0SHltRFg2ZzdONkxDbWFCSWRwcDBsWmtBZWZh?=
 =?utf-8?B?dkFWOFN2MUgzODRHaU1xNk1iTVNSZ3Uxa09JT2VaeFQzWVljS0lSekkxdDR4?=
 =?utf-8?B?ZUdSTzNVNXZldWJQbURNUlljVWw0K016T0F3OEN4ejF4M1N6cHlCa1M1M2Nk?=
 =?utf-8?B?SDBpY0RnY2d1MWdCblBSRnB0YXNxUjBveHNEUXQvUDdyMElXazEvZHJ6QXZC?=
 =?utf-8?B?Si92UHg5VGRlY3hUd3p1UUdZS0w1SHEyRjNRRUNRNDgwSFNFVjlaYS9jank2?=
 =?utf-8?B?WVMzZG5ER3lBcndtczhTMFhkMk5TUXgrQmlpbGZranVFQitLSi9SZlZRbXk5?=
 =?utf-8?B?UnNMMEF4R0ZYdGNPKzl4WThoaDhDNCtWY1BETFVNOHlFVVFCR1ZPVFJ2TlFk?=
 =?utf-8?B?RWdkNEdNRGdOTEpLU2tCY0ZVOFd4OHgyVWdSYXUzRS8vQVFpSGlxYW5GR3gr?=
 =?utf-8?B?enRCQi93SzkybG1oV25yMFkyRWdQMThSbTE3Qk1ZT2w4VDVmY3VrWTAzbGdF?=
 =?utf-8?B?ZGlKT29OeUtmc0VWV29IQUw5NUFRUEFITHJYWjZBWTQxZzlrMDJaYjFFYllG?=
 =?utf-8?B?OE1kNVA3NU1wcjNBc1ZpeEtBVzh3ajdGbXVJZGdFZXpzTEh6T1NqYzg3a292?=
 =?utf-8?B?NW9JdEtIUTQyS0tHd2R6WVdlYlJ6aFFIWjZNaXlLTXNnY1pFbDRqbnB6RzFG?=
 =?utf-8?B?ZnFOMGFBbWYwY0FRekxDenhIRHBPS3ZRR25ydWtiTWtjLzhnd3JDdU1RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0RmeldHNitLdC9YN0RLNjJodmE3ZGh3TGVabWs2cnRwQTZTenAyemRpSVlO?=
 =?utf-8?B?eXJqajZGckxjanByUzE1aXJ4bytjclhVYWo0M0c1Wk96SWZyYW9OL2g0TzZ5?=
 =?utf-8?B?Q3YwZG9MdkFXMDJkd3VnMW0wVzB5RDFMVU01dlBFeWlHMzR4WXNBcU5KcnBT?=
 =?utf-8?B?d1h1NzJqZnhEaEF1OVkrZmNiNWd6V25sVHJZV1IzYjFCTEMxbDhrOCsvMEgr?=
 =?utf-8?B?bzAzMWl2dUhCQTNEcWhaNlZaTTcyM1cvY0graXhOVk5lYkpXTDA2S0l5Nkd6?=
 =?utf-8?B?bWo3ZXgyU0gwdzYxNDQxV21wd3FKNDU1ZUtYMWFzOHlhV0tDNHJnMGtJVUtI?=
 =?utf-8?B?L1JRdXhmNnJWZzludkxPVm1VNUJmQWVraWNXVFRFRGpGbFFCNFA0V0l2bHRD?=
 =?utf-8?B?bkJkTHo1L1UvVjBBdzhadzhaeU1Cd2wwNUlGMFNKTjFIdDE2VUJpR2tpRkVv?=
 =?utf-8?B?dFFyWWl0blNBUGUzMXpBamRTYmdCWExTekk5cnJjTXZacVBYYis3dEJaSXlG?=
 =?utf-8?B?cTdzK290VFdudmMwL2hBUnM3T21nZUI2WVB4V3FscWY4SkdNTytJQVE5WWNT?=
 =?utf-8?B?QkYrYXR2Qm5nUVJ6N0RSWmZKU0hRaUVvUG9zYkNGdGtCM3BoZlBNSXNVWGpx?=
 =?utf-8?B?cnNvb3huVHZTWkhsS290Q2txZGZVcm9SVm1JdUl5T1d4dGlWYlVYTHlwRG9Q?=
 =?utf-8?B?Z2tPb3Z6YTdQWW9HSVp4VnVSUmNxd0prak9YbFpUaXhiZ0Q3Tkd3NXhYQThP?=
 =?utf-8?B?dU05ODlTbmN4YkhtWlFVa041ZEFKVGJzek5DVFlVRjRMUGZpOWxSTUswM2hC?=
 =?utf-8?B?WU1MTWphT0VhcGRsbUVVbWpIazFlelFvSEZYdVh2T3hjT01qZVlXUzk4Z3BU?=
 =?utf-8?B?dS9VT3QvZ1JlR0RWb1NON25WaG5XZHJiaUdhNFV3c05TUllXMWtraEJZeG4x?=
 =?utf-8?B?MXNSUkNMU1FtRndtWk9jOVY0QktNWnN5cGR6eVBkQ0wzZUFDdUs4Z0plTFBa?=
 =?utf-8?B?S2J0eVYranNQSUJPWjlNRmJncDY3bHppWEk0SHF5UEgrTWRyVFZSQjVSN2k5?=
 =?utf-8?B?MG1GVDZoclUza3IwMStDV1o1SG84VWhseFR3cVNNZHc4UG1FcVRWRnlUSjda?=
 =?utf-8?B?NHpLMWtoY0k2RHhPb2NIL2s1NTdiRjRpTlhTdmM3M1pPS3NxVE1zZUdrSm5B?=
 =?utf-8?B?THZGY04zVlR2eVBoMzJFT0s4VGpia1NFSEFwSnNtS1FOamFHVUp0V1FvRmNk?=
 =?utf-8?B?Ti9NYnk0RjlTV0tETklxNTl6WlpHdDFvTUtWNHpVdXlkejFEeC9jQm8raERz?=
 =?utf-8?B?bDFnZ01QT1FSR01mVFdMRDV1eE5YelRWMWxqckY3U3o4Ly92ZWZqYWw1dlFV?=
 =?utf-8?B?S2dHVXZnVjJ0MG1iM01MMExVd0FFNitRd3lWdFZ5ZWhCYmd2M2tzYndINUNk?=
 =?utf-8?B?Q0F4dytFMU9tY2Y1dHVvWllYUlNvVnpnNllCQ0IyMFJLZEtQZUNHenNrYk4x?=
 =?utf-8?B?dUlwMUdxa210VmhnM0FTeHlvT0gwbndKRnBaSnA3aGNkOTRhSERpQTlyRC9P?=
 =?utf-8?B?N29haGIxMjl3NmVHeVNHSTUzTmx1S3VoNWhxcWRkMFhWUTdFZDYyaTYySytx?=
 =?utf-8?B?YXNLeWpiS1M4Wk9pSkRwYUdhWTVJUnA2Y013Z0tJZnJxR0dhMkJuTFBSaEVN?=
 =?utf-8?B?SnVJT21DREdFVXBjaXlVZFR3SElTbkhCcGRSbXV2b0FheGxvVXQrQlhkNHg2?=
 =?utf-8?B?UHRyR3ZDRUtWUldTL1hiTXpGWmZRTmsvcTBZSE9BVWhmQzdOVWlmUXc1ZlNr?=
 =?utf-8?B?ZElFRHNPR2hOcGNlZlh5L2NVaUd0SDk2Y2cyY1pibnVkRjFIQk8vVnA2eTZV?=
 =?utf-8?B?c2tIWk9qZjdzMmFWblBGdS9acTE4Q2JMYlBYOVNSekJ0bEU3ZTZQUkZBa1FI?=
 =?utf-8?B?VU1BNjQvZlg4UjVCdnhiZUExOFQxTnlvMUFMSkRCWnNIZEFCQVFDUTNvb0li?=
 =?utf-8?B?VnNCeDJQWEVoVUJiV0RlYXl1LzlzTldyVUhZNHg2bnZsZHNGNFRabExOKzU2?=
 =?utf-8?B?bFNpMXFQVXB1d0x0R1J0M0pNaWhxVzRmQVVJMXM4eE5MNENTdmlTaWVabDlw?=
 =?utf-8?B?NG1MQ1RtdEVPUjZjNDhNVmxFSEdUY1lyTmx4aVh4bkZtdFJQcWU5WlU3c0Nw?=
 =?utf-8?Q?OiqXu1Rs0+NQ7Ot7RK6qnqE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FH+4i9TN5aN7NuIKReKdsoePlVQmitu14eSTFpRJmoRINurJF5/QowEQ1N5U8DLBJ6r+H2ga7YYAd36Mg+lJFwepvG6qu6VG5tm33ZufvOYxUFYXhKD8gbeNHLyG6tmQaLRGtTQd6qWnO2+uhJpMTTSFw4lCLDGMM/94waxD05VmGIOw9DezBP4Far9J/q4U7H7J4IJopuuvcqtq0xOAFFrK69FL8A4epTAIEZiSdqQ2+f5E1lnxVJX705PvioitzZJ47IzKyIaZ09q99qKL3GNcRhOE8CqGw3FfwPwGiP0CeLjeERNYU4YchfmVB6R7xeIq2Op68YAmFk7/6AEYZnuafOvTbWTGXkTgp2ynbjrEAiC+Uawjla+Lq4OBXRL7NRiDhY5zhZzQiVbPz7F7uqKXBdOxav0frrOjoR47REytDWniO3s9Qr4xy7VD8p0KnfO9qA4ZSaQR5+5632Iun7MtCNklIXDVAOWQ2b5p8h5Yiv43DddFOFlLGSdxEfUiU1BkTbQwbP1DGn3ZRa+gx1rpv1l0OkwPR8ozNrWZ5Hm4gYewPjCTpZUx6zWTsaHKK5GYbmRuij8SQOXY5je38Dek8XwKnJ6lsFEh4eQZlfg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16daf1a5-9d78-4f59-9760-08dc639c42d0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 13:49:57.0365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9hvH/O6K2lB7nU0RZI8dH3LpKuSnsQpxzwGfFKpVBu2DHS/3XZ3Il8PL2OnXrgU+bJftZ7mAEibZnxcwDuQRkQz4OUEORbMyNpxo6Ix8UCgQMn2Jmh6EeD2Hr8BZDEF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4827
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_12,2024-04-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404230034
X-Proofpoint-ORIG-GUID: eF7uOGEN_tPm4V1BnK-ZbWoZbFNt4L9L
X-Proofpoint-GUID: eF7uOGEN_tPm4V1BnK-ZbWoZbFNt4L9L
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

Hi Nam,

On 23/04/24 19:04, Nam Cao wrote:
> On Tue, Apr 23, 2024 at 06:56:52PM +0530, Harshit Mogalapalli wrote:
>> Thanks everyone!
>>
>> I have tested the patched kernel with the syzkaller reproducer and couldn't
>> see a problem.
> 
> If you want to take credit for testing it, send us:
> 
> 	Tested-by: Your Name <your@email>
> 
> And that tag will appear in the final commit.
> 

Tested-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Thanks,
Harshit


> But completely up to you.
> 
> Best regards,
> Nam

