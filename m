Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFFEA9FA5E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CCE10E9F7;
	Mon, 28 Apr 2025 20:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="gh9WLH7k";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i5QUrpmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5F810E9F7;
 Mon, 28 Apr 2025 20:19:11 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SJbL6N020395;
 Mon, 28 Apr 2025 20:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=osF0ZQwjYiX+IETldR
 yrOe8UqMlSnbzh904SQRXm0CU=; b=gh9WLH7kYlbFWlhbU4x3gB29pQjGfds3i9
 mtKS+L5IKyecDzdjivfji0xOG+CHMFDz4+8j1TMxmrSWfHxziL4vcWBGnnlyqhmt
 wGW3AtYIb/MataCpq+I+CaKbvPw4rsXxQGbnTJIKkc7iFUkqsf/kF+oq7B2rQr9I
 QAN5sXFUZlf0fs8ZKW13KauyQaEBkt2RPGdj97TtkDX3vH3yte8GfgYblWJS6NXH
 RgdWA5klyTOLEZVonhfpPQSsMcyr4brWoOp7LiH2Nb0ufOfQ9iTVzTKvAepjFWpD
 a+ck5V2u94sEtYxoTDsawDrLt3atPo9ip3QC8zxBQWdZN3PsvrEQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46afmc83n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:18:47 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SIU86s001329; Mon, 28 Apr 2025 20:18:45 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazlp17010001.outbound.protection.outlook.com [40.93.6.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx8wnmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:18:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9NumgV/fJlBVtg4Ayomt6Pq+a1Be9nbnYzB5AyKfu2GJ6gHPYVJadi7WJm5ALuhtfAoV7W9s2pXquNVM3N59OHxChw80+pXjiHqjP1YL38FTitFZGcSHs7EzzApI/CT8LvtPMdwSy521gE0Oo6XaKEdCeUKTXwYLr6bU8SznMeDKM1Lmq6P8B0nNawxgHfowksCnMYxkGLBcjFJnym3f4XOVyPGAYKIfjMUR7ozPh3mwF5RueX6K/I3CueNLW8dgBkP+rvoPnpFZO7tmh/G4/JCntRyR1urlqglXClC4PedM0Z+yEvZNz6CwFyNvF+BccDr9Yuw6ei+lOIhgZ2knw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osF0ZQwjYiX+IETldRyrOe8UqMlSnbzh904SQRXm0CU=;
 b=uwprgUX+MBIkBcGPhldShO0ii58nuRj9sULQF5csDqn1mh4YyUHKlQp2hQuS3s6MJDQPmlvkkLQJxl31JDRAqk3uNGLibCXb6TjcbbUq+HexA2mIz2InFcpJqAJz6xg+EBxVIxZYIo1c62O9lbRBdKoMeEyg6t+97OnFv0ZJqiFJgG9B6d1tYxgetFKTLr8Hfa4q9fcE7HWq1TmCMxdX4Ycu6khWAYf3tUS3/0wZzEs1al3BwvG+LxaJ+er7fV+OngspBxaJwAPNp7qUSRd4m7oE0pkWoGJSVJK8gjhSRI2a1/LLiPpsJpvSity9ZHXZYPBctI2BkOoAQ4+xVflToA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osF0ZQwjYiX+IETldRyrOe8UqMlSnbzh904SQRXm0CU=;
 b=i5QUrpmLrTNekBRWcFtE4XYsmVjQTsxE3DyEMsgErbBZqTQ2R9OTAlD0GL1WhPpSUqmk28p0NwH+U2CFpaXiRAMh99l6z9sOG7qU3zjN2+zY9gfmPPhTtissIlt7ZfUwZbnEX4GpeeG7dy7dLDfc2rHSSVn+0QFnu8xYfqNXfm4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB7865.namprd10.prod.outlook.com (2603:10b6:408:1b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 20:18:43 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 20:18:42 +0000
Date: Mon, 28 Apr 2025 21:18:39 +0100
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
Subject: Re: [PATCH v1 08/11] x86/mm/pat: remove strict_prot parameter from
 reserve_pfn_range()
Message-ID: <fd641237-e412-4f32-98a6-b7d733e6819b@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-9-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-9-david@redhat.com>
X-ClientProxiedBy: LNXP123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: d13ef4e1-c39b-44e3-34e2-08dd8691df23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AlVEeZKYFeiT7WDuImncOY+gEPk/MMU9YE9zaEb+6k55pItf64Jn1hSQOFwU?=
 =?us-ascii?Q?kepWJ+vATt6x9TdDSH9Zc/B6KLLjoellAooZR9eESRfs+UPkGSlWyBir/QpA?=
 =?us-ascii?Q?A414KlsObI11o2n66SqThN9jR6znbBsuwQuREr8iIUTqc20ymbJjsBO6It3x?=
 =?us-ascii?Q?3hbEa9j6Ue9q5r/UjWawV/GRBl5TXOfsxRXbDKaVaQNW9e2aNLcHNEJlqojV?=
 =?us-ascii?Q?RFf9uNplN5fTFf2CBTfKV7NZUlMwNMMiBA/8iz2SKNOeZPFAbeEoVzjpUc23?=
 =?us-ascii?Q?Ce0q1NAYRnB9wlOj3V2CX9M0L11s+fAxNXgsgqRrge/dBD0kEjXF5SIt3N+8?=
 =?us-ascii?Q?6qL8L7COkRTKOHCqvlR/TcCzbMluF1BdK7gzxsF/H4ybm4kayx+fSS5CUmUv?=
 =?us-ascii?Q?gPtXyV92Z3IEBlTNREkGEdw/IuK9djbonqs+3J45mWhXvskNvCdSqknQovVt?=
 =?us-ascii?Q?/hsJxFueACCG9jcGDX3QzeDH4goNc7BsaOwCbD43V3moHROy6tS2LgBEH9YY?=
 =?us-ascii?Q?zdT9W0VoHo1tUYZeQaaF6+VxDuLtXWWq0IXBaKc/5Zvb4/bmxivh0lJNjiSl?=
 =?us-ascii?Q?Q1mf1+g3DthCWJPBcvd0xCIM8rkuL/aZnxz++32gv6MF1ihKb0NCJhVocbvX?=
 =?us-ascii?Q?D7CnkEPWAnhhBz2SHe4IzDfIVjTNzYmMcB8WIAuofxuqC5hhDl8QMSTvbHxP?=
 =?us-ascii?Q?70I39cURC3Hw4kb6EO6J/xog8NCcywbJthTfffrFmn0IyPNaNw7gM27X8oBo?=
 =?us-ascii?Q?/m/jK7bcniUJhGT28fC/1Gm+MU3/PSiAj8OlMXRHsFQmiNACBE22qjthgEG0?=
 =?us-ascii?Q?Xc+lYaP9MIDdyOuGQINC/+V7bXisWnMN6al6coW4HRSJNzU/CPCYpdSIVF9Y?=
 =?us-ascii?Q?/AGnrFk0N4aqI0vWtqHm5rMvC/qB/A+Muw/Ls7rQFMTMZXo2ny4U7fNZseQn?=
 =?us-ascii?Q?+gIDW3eC0uoyv6xQU+hueHUqt/hb/ljLh6qrdJ6L0YLys0AGrW7SCx6zsOJg?=
 =?us-ascii?Q?Pjh1QK641zL8dLyFBrJO06j60wp8NyRolVNUh2AiSI9ft8WFWnfWCQ+bgXLl?=
 =?us-ascii?Q?xpfFB6Q+TknNndOpAekwQmF0G5Im7h6e4KfFjhFySRyTTdXgiXmwxIiylUdn?=
 =?us-ascii?Q?2FA391xP7uUYZSoIAcUO4Dep4aeceOyegt3u7bCoj39H0Rl1lDA+mejRFPR0?=
 =?us-ascii?Q?A3PsyYvzS+NHxvQryc1W2zn2KLUslj3OfZfKHj1eDpsnzEceECPntWFMYh1K?=
 =?us-ascii?Q?PIwhN/PHYJehyKc0zrS6Y4mLW7acXVN8/kwHFrs2O/Skvqp4tcHFv29mGsIs?=
 =?us-ascii?Q?6gAxFXgWsUF/mkcE5jvnuA46cw9Usn11NEEltxV5tbBkVTxw6FelscaZxFfb?=
 =?us-ascii?Q?ihKnoJsBLqKPRDpwL3oMFvWeG5tDGpkNaN2MnQnLp/aXmcnGA6Dyapyw8eDw?=
 =?us-ascii?Q?t2iGYfUYZBk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WzkfwV68TiEHKHvV75iYszKZ8gPWZWQtu2KTnTpTX0dBCURner4TMb2n8Uan?=
 =?us-ascii?Q?q3nt2i3faFAhQuw/VkpsFnFr04EAOH3wFpTZ+wWI9EmJr/JzlfLZQuQuhL4+?=
 =?us-ascii?Q?9uG2g+MjvREXFW2+1ozvWM4r4pU7YB8AjVAGrZ6E1E3fdpRx9vKg+TRscYP1?=
 =?us-ascii?Q?E/C+9EXwixiDTPxouVnWCkZP/O4BqwI8jtQ/CzLS7CrX6ZMN6cNY8tZUJ79x?=
 =?us-ascii?Q?xpCpOHUVs8dkFEeQGPpEl5SOpYivzzMNln5hH6fKeFf0HvwaMsOYmcBojoyR?=
 =?us-ascii?Q?uUWTDI3IY6ZDRQpvnVlHwWVMFPibGpAnGMRfK3WbOKf/giP7Qe2Q1ooCY8Nw?=
 =?us-ascii?Q?RxrLOqNQLIW5/4A8L5BJZDBOa8yM+cjKR8VX0BIZ9cIxyC7J9e+n6XXwbsnH?=
 =?us-ascii?Q?yONa6endLpEMb/oD9vdJy/nf9Rt8ALkhHV61qCeHFuYcMKJu6bJW4pTBCwq5?=
 =?us-ascii?Q?YL58zr0ha5GZYkeSJyTdHODCuMHjt1obZJyn/7YwSOm8r4meWBLrDvDqsyJF?=
 =?us-ascii?Q?kyO3V3IE420YyLHTu96I1oYd/pb75TCNZc6HHmbu5CoYv4P26N5Qbf4PMajr?=
 =?us-ascii?Q?QQKR/20qCSOQnhsjJ8FNAx6+Fz0Nsfmjwm1CZrsHiRyYHx3iNKroNViX+KVX?=
 =?us-ascii?Q?NFtiulMCt6oAaaST/2g7Zqkea+oHlWKFmFBlgGlfXNDq4053FMfXGGkyT8xW?=
 =?us-ascii?Q?Tv7VhTnjWIlx8dcs+oJQsuOT0ITE2bg/pjvr3k0xLszGuq78Tj6P35TM8Yt3?=
 =?us-ascii?Q?CDBbxPEoFXCb4bJvp1Ljr/zI/IxbgREXjouHWTOwAFumhpIXwhKqcCTdYys6?=
 =?us-ascii?Q?+G9GVH7ZvbwliQKGLNFRG1Dx9xJjQrhh+vSJcnvr5EgUu0X3YcSFDmLghRlQ?=
 =?us-ascii?Q?3bBq2XC3vqfnd37v8M7NR0gy8ug9wDYDzBAR1kdeaXzWgQgzvXdoKyhrENQk?=
 =?us-ascii?Q?VaoflZh6PErYGimFqXoMe4oKerDmuVagi44X7vdxK1W7TemDNKUTZTWZgB6L?=
 =?us-ascii?Q?o8cvKdXsMhIiN/OMInV7EB+GNOBKZZKg9zqbwmZkGNnc9CaeYGhofGx3jpLf?=
 =?us-ascii?Q?1RE6BXggL9Gl4U3HOAds8Tap1B9Hnti8ZI4kSvYbhcXj5S2bonXl3FbkHVab?=
 =?us-ascii?Q?9ZBApgib6WAP/6r9aPmPRNdeur8hNs9di90NY5fwPYlLh14ULp2xqM8urq2S?=
 =?us-ascii?Q?tA2XpUyEWIuh7odf3kBQ7EoGFdmq59B/XIWqlDG/dNNhfmwwk+MBcdGBT7GF?=
 =?us-ascii?Q?ubrhETdWfzfCtvZGz4E7bcNE5pLA+dKH/IQUdjITyWq3orsoUwWJBPAHCLQW?=
 =?us-ascii?Q?0tLNEgbulozS4vM1JVYpYdIBhCCYMbR8SqQYlfHUpEvyz5MOzvvs+XBTdbQh?=
 =?us-ascii?Q?z6seJiBJMR2jocNPamA+DB9ogNbuGLdRLwj8V/WnlXvxXnq87QHL8q9g+wv0?=
 =?us-ascii?Q?xCCC4ujr8rJ35OgK7BwDIww4JqeK06fBPfA7AwFVbiYNSkHlq6ZeNn+8i0ov?=
 =?us-ascii?Q?xRMmRilTF0mjaHpZurmPVHihU2aiF90jeyLFvKPvS26uOFXhtE7R4I5hrvb6?=
 =?us-ascii?Q?dNytHt4Tf2eWwC44S8Di/xgvPM4demyFBJlRQy4pMuB1E7kMmCg58wAny60B?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Z7oGIfn/3DJaBl92nAglFsOUnpi3Q8tdCTtE3sqqBUVpKeNr3LTDTe0bGetIWXolign/9aQb75RZ5zP+KRu1++es390aitm7jbZYgH9aSBWpvEkNxrdsK0fDaaiQUiQuV8wPD18CGV/gm/rO+TwFOtZD/eiiTwF7re3t2KxOkAZdn+qp+ZRwhTbnVlwrcRmQiCNfq2Vu6NSOLg4NGv8FVZoEeWybe2DaTRguz1T1R3kR8BXC9VIf9TsOn1O9REDLVeoHNOlgeXsn6mFpkPZRUareG0rKMr6QKVgrDYGxo6UnfN3p4IL+yJyiefB3A1/b1Rp6w0sBqp/HuX/kxGQHaXqAYXsitxHpj4Nq9yIL8zfUpcgU5mzyMojjLGHh5LNR+S9wETK95uvX7WO7uD5IzxknZJ3eheTUx0gowBVpOpjdGSCuG3JDSrLqBulNc8xn2NdAReVpKpBld/Uung6/vXYrIAUknQQHKd579ZT+DYxi1AcJn+P7Eijhk4C02dEU3eh76uwJigfr2O/MqDLjEvg1QxHF1kSSNAlzOu3v7fyVivW3gU0+bsNoZHiBO/PEaap8qqGDdufQjHZsgZ9ADyEDnjfRFa+BaCj6lhWd2jM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13ef4e1-c39b-44e3-34e2-08dd8691df23
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 20:18:42.9401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZPilzX0J+L4iiPd0xn/H/Qpy0713izXSUgyvh3rQxhp/gu2bilWJaG2y0VfbkZ3Ih5fTVpOg5rgjllNxbqVwxviOdwBAQWKLk0oJyXU+l0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7865
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE2MyBTYWx0ZWRfX4vWawhs6M30q
 xCCcFtR1s2PywHhGvwKK147pgU8daDAPRwnQJYgHu4HheXqRqFiONFrVcTdqirO8VAncQcYcgjE
 c8xi4emFZwnx4N5IVc7Uvw1Fkmu6IZV0avPbcdHZ5qVttEXwm1RjrxyCERG9n2sHZ5JTiAvhHwJ
 V5Bsk4bgMo+L1nkLHJal0l5NGia64qmemR63ex8o3rsjwNMB4y3cmcMPQIVtWZkWo09ypahATIp
 H5X6BNGBEVAFmCib1z6e8TnGwBV3jL+Bs9Y/6oUw2AQOpmsZ/qmTu7rCIm0G8LmVQYp4n79Njac
 frFqZvReZgPjeOiWxFLG0LGZUd1yM37KBHqxX/vyuf9SlcgClFhl3lJ9V89EtZU6OYLNmtMc1UJ
 nU881v14
X-Proofpoint-ORIG-GUID: 5SikZ2JiooRpw1JPbGndlmI2x8EpICPE
X-Proofpoint-GUID: 5SikZ2JiooRpw1JPbGndlmI2x8EpICPE
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

On Fri, Apr 25, 2025 at 10:17:12AM +0200, David Hildenbrand wrote:
> Always set to 0, so let's remove it.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Ah yes here is where you remove it :)

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  arch/x86/mm/pat/memtype.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index 668ebf0065157..57e3ced4c28cb 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -858,8 +858,7 @@ int memtype_kernel_map_sync(u64 base, unsigned long size,
>   * Reserved non RAM regions only and after successful memtype_reserve,
>   * this func also keeps identity mapping (if any) in sync with this new prot.
>   */
> -static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
> -				int strict_prot)
> +static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot)
>  {
>  	int is_ram = 0;
>  	int ret;
> @@ -895,8 +894,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
>  		return ret;
>
>  	if (pcm != want_pcm) {
> -		if (strict_prot ||
> -		    !is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
> +		if (!is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
>  			memtype_free(paddr, paddr + size);
>  			pr_err("x86/PAT: %s:%d map pfn expected mapping type %s for [mem %#010Lx-%#010Lx], got %s\n",
>  			       current->comm, current->pid,
> @@ -906,10 +904,6 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
>  			       cattr_name(pcm));
>  			return -EINVAL;
>  		}
> -		/*
> -		 * We allow returning different type than the one requested in
> -		 * non strict case.
> -		 */
>  		pgprot_set_cachemode(vma_prot, pcm);
>  	}
>
> @@ -959,7 +953,7 @@ int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
>  {
>  	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
>
> -	return reserve_pfn_range(paddr, size, prot, 0);
> +	return reserve_pfn_range(paddr, size, prot);
>  }
>
>  void pfnmap_untrack(unsigned long pfn, unsigned long size)
> --
> 2.49.0
>
