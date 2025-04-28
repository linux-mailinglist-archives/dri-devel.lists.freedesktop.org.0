Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08EAA9FA32
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846F110E9F6;
	Mon, 28 Apr 2025 20:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="InaexKUR";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zmgCnJRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BAD10E9F6;
 Mon, 28 Apr 2025 20:11:18 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SJiLkL014309;
 Mon, 28 Apr 2025 20:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=E1vcoUPsc/51QFcQDJ
 ZnoD0VxxcLuPJDJv506Py0Hlw=; b=InaexKURY6W2TLeS7OjqEyoWWl0C/BSMd3
 8aoDVhnpQ4X5ged82xNDmuJgtkiPYpbRAav8IyQAx59A7mQSOFbH0CzJrWfbrVhy
 gQ540isRKTAZ6IBn+drx/Izc+CqdqkuapqIl7Xc24dlTCjOhHSF0+8iZKQgm7mpW
 mAh1QpXifw5NKDDSmtpHgIqGohnMJB1jrI7YsxeBt2IdDIzNBWsRO5EoOrZ5nlVd
 YvFef95bgdU6Fu1cpgNup4h/+R7SkXW3WVs3qf1VnZ+hQkRdF2Q/gEQW8A8+EyDG
 MC09HkVbfnSOmQFC2YCUABgh9JZBm9NTyZFig5j6VisLo7uBMS/A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ag38r2a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:10:41 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SK2SAi011235; Mon, 28 Apr 2025 20:10:40 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azlp17010003.outbound.protection.outlook.com [40.93.10.3])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx9e3nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:10:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9aoIfhc2w/O5iBniV4Nl1pDCheP6DGqiJ3n0rJAvigRN9haDyAwR8NdUYAZhp0+Oqt0lI4bC653pzR52ZT5+/t06AeOguwJ7f6/liq2lRTXE8AtIXyNEvKWBhj2M6fdg5W3lULB1l7/fQj+8tAzT9aXCTBXwqHuc+1PJGa4Lfs7P8Vpz3+Bv8pGF0DkgstqHcROMSaB4Lkd7FGc9vL4Zigdd4CQa0HjAdlTvy7n7XoSIGu5lv+FL6CIsy6z7zUIqc2CXnF7+j/ctOD+RI7apQTKxyiBnOPd9+/6fP/nYAnb5ixzdBBior9kj2AWDZR2hnB+nAbepzSPcWjHY7XGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1vcoUPsc/51QFcQDJZnoD0VxxcLuPJDJv506Py0Hlw=;
 b=N2MxGG/T+1efo4A4EZy4WEB621kgUOT6FMleqNDCCScHqDcV0rmbgST/OdcfAKNbJcpXkfAKobrI5OZmQ0YBSKPgKLRabGFAsKmZa79vZbG2BtHCiKMI9XQqIm9KM6U2odBExd5VlzoNtW8Hnfn8mawWk+IFmx5zleg6H+nN59wqkm8glqdTIUgHeV6hP4nRNf1LfmKddCZ9SyHFQPLuezkYRhiw3jI9qtFNHWx4VMLoDRHBS8Ue2SqQ1MegvxkibMF3GQhI2ZMnvBntJ0xc7M3XvAtjaYt0Dwnz6u1AJQBaxK6waR/Y20eONLpi0mdwfV4eztLFkWYFB7ztXEpkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1vcoUPsc/51QFcQDJZnoD0VxxcLuPJDJv506Py0Hlw=;
 b=zmgCnJRpYrH/mIw6Boqd7xXFJS++w6OpftCZyMf+bNgyilBsO0eM67Bckhs3l4soTsWR8g3Arh/It2ICC7XbOkhv+2ja9OvsqoBIDZcFcy7guKI/WpyTDyQ6KnVc/+5oGdYukvK2r3ui0kNP6pzklpR7SFz51tbpwiMX+nmaOSc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4626.namprd10.prod.outlook.com (2603:10b6:303:9f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 20:10:36 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 20:10:36 +0000
Date: Mon, 28 Apr 2025 21:10:33 +0100
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
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to
 pfnmap_track() + pfnmap_untrack()
Message-ID: <b92e3a0d-b878-43cf-9b68-9f7c228e45fa@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-6-david@redhat.com>
X-ClientProxiedBy: LO4P123CA0416.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4626:EE_
X-MS-Office365-Filtering-Correlation-Id: a89204ae-0538-4e6b-5a62-08dd8690bcec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZgRADuvwR/8aTlDUniHZ0Jn7WtrzrfzsxuwXobWpl7tJDXrIHsa8xv0R2tAb?=
 =?us-ascii?Q?HrD3kFNi2L2es7S3AmU6LR5v9SrVIGv37jNhWMGMhweN6L+MIOMCuJqAzHxi?=
 =?us-ascii?Q?P0Qv3N87dEJLklw/FcdZlhOEJpE+2MqiX9qEv5qJX6EP4Cl3hGfiBDjEN6lE?=
 =?us-ascii?Q?PtVH4yOIC3aIYG8nyWoJBnr+f5z0fTymqB4LZw/sd7+S/cRFQ5/tkFtRMeXb?=
 =?us-ascii?Q?Ec0vykM36Le+NeKoI3j1UKFCmJ+CIT1/z567u0asYe6Haunbt+n0GRqFI3kR?=
 =?us-ascii?Q?kCUFYcHsMPArSzC9x7vABcggBMgbuLBLuF/JoLZDfULAeImb8XYcPjxRvV/u?=
 =?us-ascii?Q?b72aYnE07H5DwnBW7lPzoOKgH8DnpBG7alYkZL58ALWzGNO2dD8Sn2MbI9aL?=
 =?us-ascii?Q?Sk48l/6YIt4sh9CWnmw4Ay48DdJ+CWXT490Sx5DV954kguugdodNGrxtoyo3?=
 =?us-ascii?Q?VfFHG07xCjh6f+Rzw1fkOTHlNBfZb3EfGrS6GCZb8izplQJfM/SFIYZdkpH1?=
 =?us-ascii?Q?oA2hGAa6WSX9oWoPt79EmKca5bWommKqYkmV9nhhY97ubjpVQpOiHQ3H+Noz?=
 =?us-ascii?Q?shNml7t1oR+dkTjPDS26qbf0A91P7liWR4KQk31P5r9NWtgXV9Wp8RTDhFDB?=
 =?us-ascii?Q?MVU5uq1dfgyc9oaRT5NCpWkTfqHx5WR5EQyka2Z+CMd7CamC4nq42hLl1hWT?=
 =?us-ascii?Q?uFs9NcFxr+nahqg/8LPU1dnKJiGegEgE1D0yfP/MzivJHCjPLrKO6nEjbJMD?=
 =?us-ascii?Q?R5NMmYfUOdEFPUYf+uIVWY0TmEbma9ztBpawR76ljv3bLv7COTzT8YDJ38OY?=
 =?us-ascii?Q?Vw9a4RyLlfFp4zHJhCBgqZVZyv8pmjkRkGxeVsjBpooOiZ45XCv+Mfb2kruf?=
 =?us-ascii?Q?5hra2iJYj1dL+byFgyUMffmWQLFsIXTPocW0oQDYEudSoPBk8D91DRtouuCE?=
 =?us-ascii?Q?S79PUmHJLKyR00McML+J6TFNmxzp7MoK/1y0nUA6eTD0qwe+RBG80S8fx9IY?=
 =?us-ascii?Q?O0Izd1nlVBOORGXe3UbuxM3n8C/zYR0T9V4f1v4w5qg7vZIYyCjNWt3Apd++?=
 =?us-ascii?Q?DZiPnxCkPPt4GkyEWB7UEv6DvZpEAvVGJBRfcbw79vibP0Tk08U53XLSgXkE?=
 =?us-ascii?Q?r6isif9M3W4A64rt0HmpDXpf6XyGsxYvhfKOZ/6Hhjs4kjBenoI0AwI+u+R3?=
 =?us-ascii?Q?KC7ydAqVD5/4FgsjJP8p7qk713YosQWg2IAMgp4Nl+oG60MHxgnPWPc9H+d0?=
 =?us-ascii?Q?tT4zOvgAUQ2x0GCmyqCHa/pU/lFzTVnmMV2g6Y3hA9hLC7Oa2+K6haYc3gMa?=
 =?us-ascii?Q?4VfdayDE+MVBA65mUGjpMxb5NFTnZtBdqY7gz3IjYxTCIZiW9zXXOUUQb0nY?=
 =?us-ascii?Q?bLdNltiDVCtCsEvObcqluErJuXd56ntgM4SxZOn28W+B4ubnwpEYeHatJ9Kt?=
 =?us-ascii?Q?/yFLzVT/D4U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LVDqxEpYibXzMPdBP6qAOaPLDJmU3O8PRRx5Q5ZLaVKzzvxnh1BSDC0lSDYL?=
 =?us-ascii?Q?kLaMROzAzqM0iWYWTzQ8XwGx7wsxtAB5V4JvsPstxoSGhIlO8OT2nbu+eQZD?=
 =?us-ascii?Q?pux0RHbcaxMIdC8UJDxy/18fUh80o+OwHC5CoEVbXnmv2YIWRNRihRQdygX0?=
 =?us-ascii?Q?e4w/mt6iYleC9z4eiWfpyCvF30FrM38Z+giz7LiIzcl0Y9f96UWAYO+JEAg+?=
 =?us-ascii?Q?bLr6ujhkndh6Kf8xf5rh7+5TA8Set7T5mFnDApPT8yhY9Nr/XsajPgpwRgb2?=
 =?us-ascii?Q?ffRPzZvGfCoZiTG1qAMoVp/PYfMN4OQXE/jCNGc5hErZRHUUPbn5inUH9V+N?=
 =?us-ascii?Q?oNfIs+oDrHwYVeqDXE2u5HB+4dLSIQD3LZbo43vCw4fSgs5xCb9iilcElKzl?=
 =?us-ascii?Q?Nmj5rvgu3jo853CV00I4tuslTggu8lFfcYXuSQ7VlLgl+1bu/EPEz1RdppPH?=
 =?us-ascii?Q?LLNNqaU6+TcF3tJ65vqxUGl0JTbkfh9r41m8Zb53qUFvNaQk3nbdXZiPhgo0?=
 =?us-ascii?Q?LHA/KK1sGdz4sYyA1sblv3gWRYPMMJvShcRX6uRSngAm/fIKIXc+xLeibBNl?=
 =?us-ascii?Q?k7AiY1pK/PABTGO3WgkRn+/AFpEVNqqXJFaIMYL30M60jPVZB5RP2Z9AC4jU?=
 =?us-ascii?Q?RVpNOSp1EIfM8FvbABU/K6FtexKViO/F5AMMe3QbSS2GTA4WnlUWt9W2WwGW?=
 =?us-ascii?Q?p3XgNv8XjLOtZb6scZMq5ONKOiSUuorgtJwFD12BUJo2vHTbc/PYB+iLS+L8?=
 =?us-ascii?Q?w7Gy9L+SRgPpE4ceuztIjUODtfRLDqb1orGJttbcOjEWVrDz9LJLg+2UecFI?=
 =?us-ascii?Q?hyVrUbLX4PbajhkdNaNWlW0wYzpF5izcxZk20YuX30+9h1UkXpKYzbN1BXmJ?=
 =?us-ascii?Q?943/2wA72G5lUrvWvA9rpwpJgb3lrXer6YGcMHdsTZAMvPLHYa5X2C5qTwAq?=
 =?us-ascii?Q?nHmAZDwfJgC1SKucjFxUYxm7CCxnAZ0O1HSyxIuFR27d6xFCBbekF7bt5EuM?=
 =?us-ascii?Q?63+kdbDXLb9dzzt5wtSkFsYZBekTEkbf7H5EJqcB8gV8hgZeq42MTbErjsan?=
 =?us-ascii?Q?2ZNmyWxtp62+wUX1nC65C/L9R62l+2XzPNlG8gr/YcHXyygKIu8+2/i+m2SZ?=
 =?us-ascii?Q?N7AXyrBEtSFEBY8/7E0mL3nrTE6xTxwjJra/+wOeQ/B/8Wty2LhxnmfTmZn7?=
 =?us-ascii?Q?AGUceLnqXGRIwTzdvY1MPJCSG3vY36Me0AKIprWzM7KyNn4fwYiQKyYa554q?=
 =?us-ascii?Q?L3+YoB60WmXUGw1x8OqZHxhBFIGIS0ebamNXIUa5C6tX43QOrSLXmALdAdlw?=
 =?us-ascii?Q?xyrnG0tQexWVcMihOp4vE2vDG3Lvjya1BrPRfD7mwCauSWuBy9qK43CGKKyY?=
 =?us-ascii?Q?cJwuJohcpvEpqtmvsJOWcuiGyyVuHTTH2leQgzt/mYrFZ3+xNHQrCaGNMgiP?=
 =?us-ascii?Q?GbNrs6qaH9pVPoQrZQc4ueU+WovXqNq2uBpwThr3OKHjopF+JnUT659IPVGn?=
 =?us-ascii?Q?IHS7EWcChlHSwnwQghabIPoCxp0XBMdsPBf2J2L4uAPDEEb4Qz2WC8sZVgkR?=
 =?us-ascii?Q?15T3Epq/v0397Fdvk7xPm0d9ezzQJcSQfVqOTnbv3Uroupqb67+TYDbodbRC?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: EFS8nPf886rwGuCtTzznMvezAtTmdm6eGC1NFXwaRWTWpW/QO92OpyK/TTZr+gEdQmSK0M8GEGVokJkZrnVVyPJ/8To8//MoORYRdHMZQUZjSBOnDhtInQmuHtkxyNS8Yc0d61nM8qxpWmvbGB/xuHzteCeXG1kLk5LoSLU5SkDB6IyGnd523J6CdKrDoATH2CECjl01T+6gH3sz6j9776Zc6wpflctg4TwpNGJ//TEs0HoG1vg8ACMZhqVaOYed4WUTSQxLqDlX1zDbGA5haCUnuhXDra7nHMhKszKBVAMpXsddokTT61W3VOLX+KIdEWEK65MiMX0nTi8QsVcwackxLEHT/Bn7fG48BGWneplXavAU+/dWDx/ITYVI48r/9+QY31AS+GgKzhxJ51cUjEEgPw4AtKl39dDm2/SNWLE+MgRNc8IpPiRgAjgMyCJb1z7udGAtHU3IrH5IamJU3CYm2kt+VOHWjz/QwNO8jeHvz1yxxJ/+jMjd+Htqs4fgcrcTkiRrCMHZET4Z4ciUJR5NexTmCiTv9tO4c3AwxiXFjR/5Ya1yAvvnZg1YzJ6t2ffwqlGOhvQYn4qCR2rNoWvdes/rNweP4NMCT6ZoKRA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89204ae-0538-4e6b-5a62-08dd8690bcec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 20:10:36.1681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXcLjW0ADzgtdxz2O0iGOYWl6vkXRy4oiXCew3BxmEcAiUUTuZDx0L+i/JuMhwlHcL2JhYaL0pm5JfPqUSE9tPAlgBvcysbP13nRzDLqxrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4626
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504280162
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE2MiBTYWx0ZWRfX6RMMlOx26KIS
 /HiYlzSvS5lx4NY4JhPYb9NMllV/fJx2KF1gPydgNn5sbIX7PkM5awrGaijEyp33lE+A69/el4R
 CInJsljOVKUkuVN/0qrTuHzemifyuuke7HHhn+f4D4OvrrZvIo53qmioT5mSVaQzvf1+oU7ffup
 l60xNDBBJgUlc57lQ34Yj2hOkFokVLccWP/be4CbY/MyXIgWQi1JrgSc0AqJf8cJWrYkXoEl57t
 r7J+a7tmiSa74nQpgiVR8NQHDmZ/1bRvSiMqbu/0uRxWl/dyheV0H2OUDNxUUzqmP3aKR/T9A9P
 ZjMRLmRFYwW/MT1skJSz2tOwIIi1oahis77q37ZnI029cQcKmJ1Dv/xPOD8RWMXH+kapOG4ptYs
 YcuYrvn/
X-Proofpoint-ORIG-GUID: 78b5GBOazKpWlrNeh1zXonhesgsbq-_e
X-Proofpoint-GUID: 78b5GBOazKpWlrNeh1zXonhesgsbq-_e
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

On Fri, Apr 25, 2025 at 10:17:09AM +0200, David Hildenbrand wrote:
> Let's use our new interface. In remap_pfn_range(), we'll now decide
> whether we have to track (full VMA covered) or only sanitize the pgprot
> (partial VMA covered).

Yeah I do agree with Peter that 'sanitize' is not great here, but naming is
hard :) anyway was discussed in that thread elsewhere...

>
> Remember what we have to untrack by linking it from the VMA. When
> duplicating VMAs (e.g., splitting, mremap, fork), we'll handle it similar
> to anon VMA names, and use a kref to share the tracking.

Yes this is sensible.

>
> Once the last VMA un-refs our tracking data, we'll do the untracking,
> which simplifies things a lot and should sort our various issues we saw
> recently, for example, when partially unmapping/zapping a tracked VMA.

Lovely!

>
> This change implies that we'll keep tracking the original PFN range even
> after splitting + partially unmapping it: not too bad, because it was
> not working reliably before. The only thing that kind-of worked before
> was shrinking such a mapping using mremap(): we managed to adjust the
> reservation in a hacky way, now we won't adjust the reservation but
> leave it around until all involved VMAs are gone.

Hm, but what if we shrink a VMA, then map another one, might it be
incorrectly storing PAT attributes for part of the range that is now mapped
elsewhere?

Also my god re: the 'kind of working' aspects of PAT, so frustrating.

>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Generally looking good, afaict, but maybe let's get some input from Suren
on VMA size.

Are there actually any PAT tests out here? I had a quick glance in
tools/testing/selftests/x86,mm and couldn't find any, but didn't look
_that_ card.

Thanks in general for tackling this, this is a big improvement!

> ---
>  include/linux/mm_inline.h |  2 +
>  include/linux/mm_types.h  | 11 ++++++
>  kernel/fork.c             | 54 ++++++++++++++++++++++++--
>  mm/memory.c               | 81 +++++++++++++++++++++++++++++++--------
>  mm/mremap.c               |  4 --
>  5 files changed, 128 insertions(+), 24 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index f9157a0c42a5c..89b518ff097e6 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -447,6 +447,8 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
>
>  #endif  /* CONFIG_ANON_VMA_NAME */
>
> +void pfnmap_track_ctx_release(struct kref *ref);
> +
>  static inline void init_tlb_flush_pending(struct mm_struct *mm)
>  {
>  	atomic_set(&mm->tlb_flush_pending, 0);
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 56d07edd01f91..91124761cfda8 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -764,6 +764,14 @@ struct vma_numab_state {
>  	int prev_scan_seq;
>  };
>
> +#ifdef __HAVE_PFNMAP_TRACKING
> +struct pfnmap_track_ctx {
> +	struct kref kref;
> +	unsigned long pfn;
> +	unsigned long size;

Again, (super) nitty, but we really should express units. I suppose 'size'
implies bytes to be honest as you'd unlikely say 'size' for number of pages
(you'd go with nr_pages or something). But maybe a trailing /* in bytes */
would help.

Not a big deal though!

> +};
> +#endif
> +
>  /*
>   * This struct describes a virtual memory area. There is one of these
>   * per VM-area/task. A VM area is any part of the process virtual memory
> @@ -877,6 +885,9 @@ struct vm_area_struct {
>  	struct anon_vma_name *anon_name;
>  #endif
>  	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> +#ifdef __HAVE_PFNMAP_TRACKING

An aside, but absolutely hate '__HAVE_PFNMAP_TRACKING' as a name here. But
you didn't create it, and it's not really sensible to change it in this
series so. Just a rumble...

> +	struct pfnmap_track_ctx *pfnmap_track_ctx;
> +#endif
>  } __randomize_layout;
>
>  #ifdef CONFIG_NUMA
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 168681fc4b25a..ae518b8fe752c 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -481,7 +481,51 @@ static void vm_area_init_from(const struct vm_area_struct *src,
>  #ifdef CONFIG_NUMA
>  	dest->vm_policy = src->vm_policy;
>  #endif
> +#ifdef __HAVE_PFNMAP_TRACKING
> +	dest->pfnmap_track_ctx = NULL;
> +#endif
> +}
> +
> +#ifdef __HAVE_PFNMAP_TRACKING
> +static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
> +		struct vm_area_struct *new)
> +{
> +	struct pfnmap_track_ctx *ctx = orig->pfnmap_track_ctx;
> +
> +	if (likely(!ctx))
> +		return 0;
> +
> +	/*
> +	 * We don't expect to ever hit this. If ever required, we would have
> +	 * to duplicate the tracking.
> +	 */
> +	if (unlikely(kref_read(&ctx->kref) >= REFCOUNT_MAX))
> +		return -ENOMEM;
> +	kref_get(&ctx->kref);
> +	new->pfnmap_track_ctx = ctx;
> +	return 0;
> +}
> +
> +static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma)
> +{
> +	struct pfnmap_track_ctx *ctx = vma->pfnmap_track_ctx;
> +
> +	if (likely(!ctx))
> +		return;
> +
> +	kref_put(&ctx->kref, pfnmap_track_ctx_release);
> +	vma->pfnmap_track_ctx = NULL;
> +}
> +#else
> +static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
> +		struct vm_area_struct *new)
> +{
> +	return 0;
>  }
> +static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma)
> +{
> +}
> +#endif
>
>  struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  {

Obviously my series will break this but should be _fairly_ trivial to
update.

You will however have to make sure to update tools/testing/vma/* to handle
the new functions in userland testing (they need to be stubbed otu).

If it makes life easier, you can even send it to me off-list, or just send
it without changing this in a respin and I can fix it up fairly quick for
you.

> @@ -493,6 +537,11 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  	ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
>  	ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
>  	vm_area_init_from(orig, new);
> +
> +	if (vma_pfnmap_track_ctx_dup(orig, new)) {
> +		kmem_cache_free(vm_area_cachep, new);
> +		return NULL;
> +	}
>  	vma_lock_init(new, true);
>  	INIT_LIST_HEAD(&new->anon_vma_chain);
>  	vma_numab_state_init(new);
> @@ -507,6 +556,7 @@ void vm_area_free(struct vm_area_struct *vma)
>  	vma_assert_detached(vma);
>  	vma_numab_state_free(vma);
>  	free_anon_vma_name(vma);
> +	vma_pfnmap_track_ctx_release(vma);
>  	kmem_cache_free(vm_area_cachep, vma);
>  }
>
> @@ -669,10 +719,6 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
>  		if (!tmp)
>  			goto fail_nomem;
>
> -		/* track_pfn_copy() will later take care of copying internal state. */
> -		if (unlikely(tmp->vm_flags & VM_PFNMAP))
> -			untrack_pfn_clear(tmp);
> -
>  		retval = vma_dup_policy(mpnt, tmp);
>  		if (retval)
>  			goto fail_nomem_policy;
> diff --git a/mm/memory.c b/mm/memory.c
> index c737a8625866a..eb2b3f10a97ec 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1370,7 +1370,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  	struct mm_struct *dst_mm = dst_vma->vm_mm;
>  	struct mm_struct *src_mm = src_vma->vm_mm;
>  	struct mmu_notifier_range range;
> -	unsigned long next, pfn = 0;
> +	unsigned long next;
>  	bool is_cow;
>  	int ret;
>
> @@ -1380,12 +1380,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  	if (is_vm_hugetlb_page(src_vma))
>  		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
>
> -	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
> -		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
> -		if (ret)
> -			return ret;
> -	}
> -

So lovely to see this kind of thing go...

>  	/*
>  	 * We need to invalidate the secondary MMU mappings only when
>  	 * there could be a permission downgrade on the ptes of the
> @@ -1427,8 +1421,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  		raw_write_seqcount_end(&src_mm->write_protect_seq);
>  		mmu_notifier_invalidate_range_end(&range);
>  	}
> -	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
> -		untrack_pfn_copy(dst_vma, pfn);
>  	return ret;
>  }
>
> @@ -1923,9 +1915,6 @@ static void unmap_single_vma(struct mmu_gather *tlb,
>  	if (vma->vm_file)
>  		uprobe_munmap(vma, start, end);
>
> -	if (unlikely(vma->vm_flags & VM_PFNMAP))
> -		untrack_pfn(vma, 0, 0, mm_wr_locked);
> -
>  	if (start != end) {
>  		if (unlikely(is_vm_hugetlb_page(vma))) {
>  			/*
> @@ -2871,6 +2860,36 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
>  	return error;
>  }
>
> +#ifdef __HAVE_PFNMAP_TRACKING
> +static inline struct pfnmap_track_ctx *pfnmap_track_ctx_alloc(unsigned long pfn,
> +		unsigned long size, pgprot_t *prot)
> +{
> +	struct pfnmap_track_ctx *ctx;
> +
> +	if (pfnmap_track(pfn, size, prot))
> +		return ERR_PTR(-EINVAL);
> +
> +	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (unlikely(!ctx)) {
> +		pfnmap_untrack(pfn, size);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	ctx->pfn = pfn;
> +	ctx->size = size;
> +	kref_init(&ctx->kref);
> +	return ctx;
> +}
> +
> +void pfnmap_track_ctx_release(struct kref *ref)
> +{
> +	struct pfnmap_track_ctx *ctx = container_of(ref, struct pfnmap_track_ctx, kref);
> +
> +	pfnmap_untrack(ctx->pfn, ctx->size);
> +	kfree(ctx);
> +}
> +#endif /* __HAVE_PFNMAP_TRACKING */
> +
>  /**
>   * remap_pfn_range - remap kernel memory to userspace
>   * @vma: user vma to map to
> @@ -2883,20 +2902,50 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
>   *
>   * Return: %0 on success, negative error code otherwise.
>   */
> +#ifdef __HAVE_PFNMAP_TRACKING
>  int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
>  		    unsigned long pfn, unsigned long size, pgprot_t prot)

OK so to expose some of my lack-of-knowledge of PAT - is this the
'entrypoint' to PAT tracking?

So we have some kernel memory we remap to userland as PFN map, the kind
that very well might be sensible to use PAT the change cache behaviour for,
and each time this happens, it's mapped as PAT?

>  {
> +	struct pfnmap_track_ctx *ctx = NULL;
>  	int err;
>
> -	err = track_pfn_remap(vma, &prot, pfn, addr, PAGE_ALIGN(size));
> -	if (err)
> +	size = PAGE_ALIGN(size);
> +
> +	/*
> +	 * If we cover the full VMA, we'll perform actual tracking, and
> +	 * remember to untrack when the last reference to our tracking
> +	 * context from a VMA goes away.
> +	 *
> +	 * If we only cover parts of the VMA, we'll only sanitize the
> +	 * pgprot.
> +	 */
> +	if (addr == vma->vm_start && addr + size == vma->vm_end) {
> +		if (vma->pfnmap_track_ctx)
> +			return -EINVAL;
> +		ctx = pfnmap_track_ctx_alloc(pfn, size, &prot);
> +		if (IS_ERR(ctx))
> +			return PTR_ERR(ctx);
> +	} else if (pfnmap_sanitize_pgprot(pfn, size, &prot)) {
>  		return -EINVAL;
> +	}
>
>  	err = remap_pfn_range_notrack(vma, addr, pfn, size, prot);
> -	if (err)
> -		untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
> +	if (ctx) {
> +		if (err)
> +			kref_put(&ctx->kref, pfnmap_track_ctx_release);
> +		else
> +			vma->pfnmap_track_ctx = ctx;
> +	}
>  	return err;
>  }
> +
> +#else
> +int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
> +		    unsigned long pfn, unsigned long size, pgprot_t prot)
> +{
> +	return remap_pfn_range_notrack(vma, addr, pfn, size, prot);
> +}
> +#endif
>  EXPORT_SYMBOL(remap_pfn_range);
>
>  /**
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 7db9da609c84f..6e78e02f74bd3 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -1191,10 +1191,6 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
>  	if (is_vm_hugetlb_page(vma))
>  		clear_vma_resv_huge_pages(vma);
>
> -	/* Tell pfnmap has moved from this vma */
> -	if (unlikely(vma->vm_flags & VM_PFNMAP))
> -		untrack_pfn_clear(vma);
> -

Thanks! <3

>  	*new_vma_ptr = new_vma;
>  	return err;
>  }
> --
> 2.49.0
>
