Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C53AABF89
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 11:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCB910E62E;
	Tue,  6 May 2025 09:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="IBFBRIWK";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pIMe1hKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8C410E341;
 Tue,  6 May 2025 09:31:33 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468d1pD000611;
 Tue, 6 May 2025 09:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=9DGQK2udbxllRIbr8+
 E4zbyCexlspPVNXVfj5rIYXqM=; b=IBFBRIWK9mROzebiaPIcY0SYydW8Hl8smJ
 v6HCob5MQ9Y82hj0ac42vMRgv1SLkbPZiIPDP82Qwj0soXLlkR6/reMTAmglyQrH
 dPCpqXiw6hVhryZ6yUNYRPD43VimZFsZZffbioYh215obBrd4g+NGNDB7BOX+Irl
 FbjviizHL/YbYQTeN6Jr4PmUiTb1j5B7uaAGJf+++mtjfsWlFchk2bCk5mZA6ukp
 WATTck2Sp6nlaIa0uhbz4InWsYjpn8NiY6s0d3zDAqYBIz2PWMRhCyM6ZTC/wFnO
 Lv6D6GWKSfHJ0m8BgVobWwl9KIior8JsLIWztMR7UzNu/I9h3LLA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ff3mg3t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 May 2025 09:30:49 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5467x5Ur036235; Tue, 6 May 2025 09:30:49 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazlp17013074.outbound.protection.outlook.com [40.93.6.74])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46d9kf0x24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 May 2025 09:30:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4X93u6rLx4XkuY3ejEe9VNeyGjKxjb7q9HwPAkeORrn0ru1igXiQlEPPdMXa2HyY0Et9JIKkAn+Ri6Wv1jequ++70vZ037P42hKWAAyY1VPbAFaD2H8RkMtzJrZMwhPMa7nBjQAHmsdOsiG5j95NPH0bmLzz1rr1vjsYlKg4/7yKjBSIYtG6vaH6UW+rM1wnSWH7o2W5qvKihO6PR2zCQZ8U6hXjcBqDacjNd/R6yykwvwzL3v153MJeV50BRflr7EsNvp6T6943dNORpv6U5x4Ta0eroGG8I5unVa83dOeYaPbqXv3IL7fpEyeVHqc1K3aOBoaWRxdazdo/u656Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DGQK2udbxllRIbr8+E4zbyCexlspPVNXVfj5rIYXqM=;
 b=qbT8Rj73F6NktUlgfhiP/7FwFdTNPWXAF4zzWfkEXNR9sPd797LzL9OYzGAx6BkPQSf66FblwrBCnE8XNJj6y+YksqwoAlM2YfS4Ma8PvtCmn66GaHlHi0uEjPHrwdji7CkDrEXTuhWxJxmSx/MhsUFNpvXZTixLNL6EpwFvZZI/wdTNQ/Zy88dix0LpYyoWvFCTPdERomT3jUdNfZX93qFfjBEdS4fnZ3/R1RW35Rwpxe8uUWnMRhdcteqO205Cfx+PCJNhW/mveUA+W4SbqcmLm60RwwYSYIPSVgLV4hXlANpAgtADxP42K6m9V5NpnnxoEiHud1ZjWvTMwLCrrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DGQK2udbxllRIbr8+E4zbyCexlspPVNXVfj5rIYXqM=;
 b=pIMe1hKRTsIeI1o0YTH6/qjNfUklfwVJrjM/Ga2F92BBT9ubuDN12bK1lgiYzrrqWeycbtTLkG7EQYmaFOIPYi01gpVOEWgIbfTFRDqKZc7IwquAAOMmPEvA9lxvwJpQzkcVNJWwmj+1kvUiIiPg5l1HoRfRSQDidPSytaH29Dw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPF5F5663669.namprd10.prod.outlook.com (2603:10b6:f:fc00::c2b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 09:30:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 09:30:42 +0000
Date: Tue, 6 May 2025 10:30:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 09/11] x86/mm/pat: remove MEMTYPE_*_MATCH
Message-ID: <93c44cac-d4b0-4bf7-b2f4-ac957f53a485@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-10-david@redhat.com>
 <fe80481f-6fa9-4148-90b2-65734ef259ed@lucifer.local>
 <4dfabfce-8fe4-4b54-860c-e873fac12b8d@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dfabfce-8fe4-4b54-860c-e873fac12b8d@redhat.com>
X-ClientProxiedBy: LO4P123CA0187.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPF5F5663669:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e13f48-e1b8-4c36-4bc4-08dd8c80abd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EN+bayATR6jRCgTjUjxP5VLew+ie1Ap2oXsfYIsu30g+onBSqxCop16rjQxn?=
 =?us-ascii?Q?iJPpm+rLHFhTLQYdU43htQxIxO8ScFGC3/Clb2aGpXyx4JVpIMxDtUgcH2lp?=
 =?us-ascii?Q?A9EvAlNsSXTZsFpzbCEAZC3j69Vx4KFai/65JA4/jeIVhDMKgBGjY/Uk6+RV?=
 =?us-ascii?Q?Zu5h2rdEvv0P5B4qhlNJM9p4/59WTQpDbT/NQpWmgUcWTMCu546s/ogt7Vnp?=
 =?us-ascii?Q?zXPDFQ5QKx1xBQYevDnz5wcNa+CdiHvNEWIlhrYyiNcXu5xlwcYRVmK76cVY?=
 =?us-ascii?Q?6pUbYU2E8Lh5gRbXAkAIPtQN3txnNv35D5rYoYHvaztA3ZYlkiTlik7Xw1oz?=
 =?us-ascii?Q?U5m0aNFJwkZ1e9tnKOjz8BiWGJpINTv7M5w89dc99Lhfj8kzc4FLhlim/BJP?=
 =?us-ascii?Q?4m433AJ8srlyZUKWKopLsBYRixvBbSxqJs0E4VxUGtjQPO3agzbJkIeh0j6v?=
 =?us-ascii?Q?JxFVEq2EWnTwNlxj1Imr629g07uyApUDBZM88tSBB2uK/wYl4W6BMNwn1VtV?=
 =?us-ascii?Q?Utejey1IP6vXF3q7v4Xq/gEMTVZnfWcqcRERFeh67oJlnuxetdqJHP5wPl57?=
 =?us-ascii?Q?h0f1BkWzWQUAF7Mt88Dg5iciHo8J1VoFtIzsnUt65+c58Sz5tAvz1TCUBoOl?=
 =?us-ascii?Q?9hkdXG0VGRC9+S6BcYOObV7d+kuHnRjaHtxjYgy3UJ4slY4SDFFmhsJKRjlj?=
 =?us-ascii?Q?NWa25+UlKwrzvWPkNcZ0mm7OMhVICjJFW+Mixh5ZoId/L/8QMXcKat/D3rBD?=
 =?us-ascii?Q?FDtl9T6wqlqxgtdqIJb8mCSNn7HrFGGdxb0DlkJoNm21K85nyG0huo7U+01E?=
 =?us-ascii?Q?KN6RpphjA5YgPwaDt9jKl6IgHmccqL0TbO6XS3JprzuJV7FzF647BdOSrDtr?=
 =?us-ascii?Q?55faQ5n/oD1uVRpGPct/sHz2+wEUudNPJj7GuddfXvCGdhoHzUcbIQ6/rcrZ?=
 =?us-ascii?Q?7MaBOpEBz9Jp4qGRMAFIv6A1OYuQurUTjfW4PIaxdGNIEHbm5mqlcE0ISu3F?=
 =?us-ascii?Q?UxXS/Ee1Q9TRRNw1PZew9apJiT7Xb/kQ9oJrxVNp90VuyNbJjo2IuHwzu3zR?=
 =?us-ascii?Q?Jncp9Rj+HEEkvanHFaOsdg+fYm4vAdaekzp/magFvQHX52gGlkiej911uCNi?=
 =?us-ascii?Q?Io4k9vIxQwMXl4+6RsRrHkg7eg6/x3LKTORWKZO9IbgBj5TeVXFhfkWip+Xe?=
 =?us-ascii?Q?8OVoM8Vei5MgUH0fAY9+BgJbjRCIl379dRl+RmJYWNPKwQS56LfpBhRi7maN?=
 =?us-ascii?Q?iev9ddNKoSuuWFuM6wIeaOzM8NPdEelir7Zrj4/5q+WJdfspv+zOpB6H3xQc?=
 =?us-ascii?Q?icMdLwkA2drtsHVTYVn4O9HgU2v2apT0U43nlRdrovm+EuICIc+9Mhc1Vzrx?=
 =?us-ascii?Q?poo8hgwILVDzya5pB2d/ZVnOwcv3hJS9/5qTvO93NxxRQ520W3GdXgiVT2GE?=
 =?us-ascii?Q?QQmhGaHo2lA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y4Ohjhv8iDWuuJFih2lzDGNBbkEIl8m9GvR6j82ybo8NWXx9VxjqD9poPNWW?=
 =?us-ascii?Q?D443m9u+lN3ZBiLVHKBENgMBFGuiG3djiNOoiIcHyBNxUWYaQl++myo33g3e?=
 =?us-ascii?Q?shu1aOrBmVbHL7ut7kYgOom/emleG8nBPJlZwpz/fR20ATDi4duqGNLeWKg9?=
 =?us-ascii?Q?5ObSNnnJptSd9H6wAqNdXZmwLe27uPAX4W/Yr2956m6DZTBZx3eVNeoruNB/?=
 =?us-ascii?Q?AZ82a/EsXR3KpWtR8DDdtMBJhaPvNdE0ibP2jSEiYFii3CtNeOBq6pMoh+T/?=
 =?us-ascii?Q?hKTZpblCRD0Ts0JSa2b4/59rbr1BPxfi2jExpTplqtiLued0jJUtr8LcAgVc?=
 =?us-ascii?Q?ug449/6NjvYpwtMdPddooEySbmCWSdvt2KPU+Yghw4MhCFF2oyHuQIPJcP0O?=
 =?us-ascii?Q?99we1X4vQU8kfo+kVqSmxynWrTUnjnI1FHdskaY3Sk9TAe38mZl6dmsaKziz?=
 =?us-ascii?Q?B2MPFOr0dJvLjMRX6hvenXVahRm3j/MBzsq6MIDfmTexqoY9Bo4iF9OsEkca?=
 =?us-ascii?Q?cGBaiU4mK5hmq7ke2SxAlOlZuymNjmYWYDdQJMyL6b6tImG7o3TjUZub7AhA?=
 =?us-ascii?Q?N+R4wYl3dkAGgrHm8mtOlUr3czryRuIEY63YDplG4ds6iQamS3E37UnWKlax?=
 =?us-ascii?Q?zCnpZdJ33cDz6cZE9MD79yjVAQwwsS/8xBocFegt+O4WxpGlKcUKm/zjelxQ?=
 =?us-ascii?Q?6TJkhwYbe74WBjtYPP1Cwg/q6yzFKwGCKphYUb3DY95TCjsmVfhDgWOMA8Ze?=
 =?us-ascii?Q?IPfSevUTFJm0VkslyVT9m9UoB5axykMeg+Udu8Fp0FNMnRDrQRg3o+RwFjYv?=
 =?us-ascii?Q?7wzaV0g3BytSuJ2szeijcqoz9WfZbKe3FeT1LmjgoOMsS/Guwd841rH5DHsE?=
 =?us-ascii?Q?46UKOjPnqrZjtgvBM0Ig/bWwOlH8eH5aq3B2hyIb2bo04xjykf4jber31RQv?=
 =?us-ascii?Q?6vF3JC0T65W0n8DH//ZZzLfwMLPxbKXBsPEi+92E7JDuM8JoNj0K068unV5Q?=
 =?us-ascii?Q?j1JA0TGJjFlFv0BKI7WKs7spxRmxp5Sm0sNzJyBWICW2dWbB4Ao0MfW5Zgfb?=
 =?us-ascii?Q?zslrzTN+AIbRwlxghhtNID0rXBXEZ/J2EfeSlNnnbDR+gVqgeAUf06Q9R/Vz?=
 =?us-ascii?Q?qOOWUsjWwDxrIp42b8Nk6xzkXP/Ln5tfI3aEIxlkGypYWMu+vlmJALhyuxZ1?=
 =?us-ascii?Q?S864tThg/C0VCZl2Y3VxZT5VWC7asOegjXe/hGjBrDzbQJvEjSGTxBJM7yl3?=
 =?us-ascii?Q?2lQXBkkkiSEUYpL9FAasPCgsLiyOj5jEnEwQ0E+nH8Zg6dVlaeU9qN9OOE3g?=
 =?us-ascii?Q?M+rizZZ3El8s9zrUNHG6UsoPIEQ79T7QK+npcyKjacvQLe0ACrSsY7DHUimh?=
 =?us-ascii?Q?LWrMg4OckBpU32Al7Uw6QPR172MoYaVkBWe8AP3vLzsD6IOheZ3NHT6iYare?=
 =?us-ascii?Q?98wgRhj3mfaa3w4D/iQH6pd41UTGQzDB4uX746gYqBBrX8NBi+J57JWbke07?=
 =?us-ascii?Q?Zyn+i5dJ/Kq7K7qraWLStXBnLVLC9XWJyat/oBchafjmUfyxVXz9cZBoSIrg?=
 =?us-ascii?Q?sY2s7sPNPJehCGj1flCarWuJewHylVWgx6VrUebvGAd0z3RPjRmTVYG20nzi?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: hqOxaOKOSGPJ7RbTMViAXs1eNb8VtOJtoOSQDuGpu7cmRCDgEGOlP9JZQ8C37pAHXCzvjHh68Q9D9u7EidUm7B+KLit152ZCSi1+je9CRGh8gStrVgLCFyWZ/1rqBGeL4FPEDS99NrjmurO4MtlffjShC3GNBhWx4ixu7omx40/5/Mrek8NwbPTA/HnFw50as+fKjs8jSjs11pLj6fokqnfa7iAXRw8K8fpQMs23mmz5zkJ+kr+XmXz74xko2W1S3S7KQ/UkuBn4yaYlUl8mrwaW4BUg708slpzutrTZo84f8BbW10GVknLQM/ky0PhezXQwFJAVoh3uNqFZuuIriE4vDDG04JL2O58+bt6EkNU0tiKV1SPpR1gzB8yKYSOg+xe6QVNfR0YVEDiyuRD6lV+3HKslL00FSn8ZMc8uJVjJrEXbAjOOdFluHR4rNAipeVjpDTCpvH47ftaTYZrSLUoaCqd7pkZaZAVvvOEkskQ59aUN43cmfx8QvWv/JQuATHDEZogzJl0Wp1SwbXGY2Sbi3Oc1CPg8wTGyYCih+zU+K5ezEGl3ENISMqRelCnoaz9PWB1KNpeVDnabVsBDK3mB6/HBmT7EcQMoVL6Jkao=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e13f48-e1b8-4c36-4bc4-08dd8c80abd9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:30:42.4096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f73Orn4iSOKoFQjBWDGEz3pe3kEMjxoc8HPuDxcIzCYtzAb/cvCStO8amYek3CeIyNHCK1SyzNq5AYq28PP8Jf0cbSCsklu6DZAcVNoTcG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5F5663669
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_04,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=777 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060090
X-Authority-Analysis: v=2.4 cv=e84GSbp/ c=1 sm=1 tr=0 ts=6819d6c9 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=H18HwA91MA7Kf7uUeYIA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13130
X-Proofpoint-ORIG-GUID: MBEzosvvjuFhWjeNKsZwVgtZQnTFUUHS
X-Proofpoint-GUID: MBEzosvvjuFhWjeNKsZwVgtZQnTFUUHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5MCBTYWx0ZWRfXx396FePBaSWo
 ESb8xtLhdn7iIrqb9EZpMPZH+hYnf5Oq2Lykzw/MdEfyaW9UQtbUOXtqJAvVZLSR1cPGpH3m0dL
 02p4ugMRMbPm5hJAVIO9Jv8aLqLFIOKtgLKcqFtz/m4Hrfu+dSSIsbLws4igyJo/Rk0j3Ba1iAA
 +kLJZsy369y7LoRQ1/u+kDI/3MoMgpfNzZJKF/RClX0ZUX5pCGJPUbboFE82VTRgXfiVnK4Nyjk
 38KbYvrIYoV8GlOXzPTocFE3D0grG49phHc+NoBqqyOiITYfo6sBZPf8PEnI/WA4Ov0Sdf6T6Ny
 fuPqtOajZGcSMPQgVIFnxGiruSvRch+1ji5Dkheee2KPORlqOo0w+kEBEwqX4851vIHUbpvhjIR
 HJ4fe+iYDGb8wQ63V6aJXOeYObuFpxksSKbpxvMMk3LbBXx5LuJ4pT9Ve72M8v4ezPfjWZqY
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

On Mon, May 05, 2025 at 02:10:53PM +0200, David Hildenbrand wrote:
> On 28.04.25 22:23, Lorenzo Stoakes wrote:
> > On Fri, Apr 25, 2025 at 10:17:13AM +0200, David Hildenbrand wrote:
> > > The "memramp() shrinking" scenario no longer applies, so let's remove
> > > that now-unnecessary handling.
> >
> > I wonder if we could remove even more of the code here given the
> > simplifications here? But not a big deal.
>
> It might make sense to inline memtype_match().
>
> diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
> index 9d03f0dbc4715..e5844ed1311ed 100644
> --- a/arch/x86/mm/pat/memtype_interval.c
> +++ b/arch/x86/mm/pat/memtype_interval.c
> @@ -49,21 +49,6 @@ INTERVAL_TREE_DEFINE(struct memtype, rb, u64, subtree_max_end,
>  static struct rb_root_cached memtype_rbroot = RB_ROOT_CACHED;
> -static struct memtype *memtype_match(u64 start, u64 end)
> -{
> -       struct memtype *entry_match;
> -
> -       entry_match = interval_iter_first(&memtype_rbroot, start, end-1);
> -
> -       while (entry_match != NULL && entry_match->start < end) {
> -               if (entry_match->start == start && entry_match->end == end)
> -                       return entry_match;
> -               entry_match = interval_iter_next(entry_match, start, end-1);
> -       }
> -
> -       return NULL; /* Returns NULL if there is no match */
> -}
> -
>  static int memtype_check_conflict(u64 start, u64 end,
>                                   enum page_cache_mode reqtype,
>                                   enum page_cache_mode *newtype)
> @@ -119,14 +104,16 @@ int memtype_check_insert(struct memtype *entry_new, enum page_cache_mode *ret_ty
>  struct memtype *memtype_erase(u64 start, u64 end)
>  {
> -       struct memtype *entry_old;
> -
> -       entry_old = memtype_match(start, end);
> -       if (!entry_old)
> -               return ERR_PTR(-EINVAL);
> -
> -       interval_remove(entry_old, &memtype_rbroot);
> -       return entry_old;
> +       struct memtype *entry = interval_iter_first(&memtype_rbroot, start, end - 1);
> +
> +       while (entry && entry->start < end) {
> +               if (entry->start == start && entry->end == end) {
> +                       interval_remove(entry, &memtype_rbroot);
> +                       return entry;
> +               }
> +               entry = interval_iter_next(entry, start, end - 1);
> +       }
> +       return ERR_PTR(-EINVAL);
>  }
>  struct memtype *memtype_lookup(u64 addr)
>
>
> Thanks for all the review!

You're welcome :)

I _think_ I'm all caught up on my side of this review, ping me if there's
anything more you need from me.

>
> --
> Cheers,
>
> David / dhildenb
>

Cheers, Lorenzo
