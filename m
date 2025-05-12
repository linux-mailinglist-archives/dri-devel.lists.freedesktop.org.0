Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B765CAB3E12
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 18:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80B410E43B;
	Mon, 12 May 2025 16:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="R5w/yMSd";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IcueM12m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147BC10E43B;
 Mon, 12 May 2025 16:50:24 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CGXxtM021678;
 Mon, 12 May 2025 16:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=sg06d0sTlys1uinGKd
 ObbwSTvOdQef6rARna20e9TFM=; b=R5w/yMSdX8jSusT5uTR7fffVIqbIDTFqON
 LDJxLYFBMkQq1/NjYezOGFU8VELwm6tIEM+SJo6StTrnNwPVA8JRZ64NXj7kLalC
 tGk/mxM8+HkZlV9mO2jLv1mCcOfEIOwGXFzo02RIiWDJNa0ccFH7MI/97m32uEZI
 M/rbbWFP7YAZDMFb7/nf8qQzTGulaQQhQwyVoreS5EZL6NGz55KFMv7OGri3oCIS
 48dw9FbeMUsvHx3SUT+7lUUor/7y40LlGCUwXLsRU9gPSH5NSZkRCJjkZN9lDcDk
 /NZYVwMYL8QZzN1IfmUOf5YViJSSYNNH3UMfGgjnNp5T4lvPYQZw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0gwk16k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 May 2025 16:49:56 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54CFGUw3022376; Mon, 12 May 2025 16:49:55 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com
 (mail-westcentralusazlp17011028.outbound.protection.outlook.com [40.93.6.28])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46hw88mf2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 May 2025 16:49:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8BymJ9OyrDOJFw+NThVQKJPVQfHwEFIRc7IStlrN+u1bre8tanrjNWrtrr/E/19m/zqYQ2PnPjzOxzLHVWS64pnQ4GSjcdHbIyTuXpvEMLNM2rrmA3KVc9cw9LrqTCMO8/BsYoHUfflEEdnga5iTB3p2RLIt+UY8D/nQ2f45H15NX6w41eMcOIy/7XlUCAyCsUfcaBsbepFVhpKp2LSzepa/O04Nz5/+HIF7LQmhS5gE+23lZ7Ceo275+tiT3PChDBj3Z244tnrFBJEiYSMdJgI5gb8GDbZyWOWv1Y8VWbC8hWU3vLJhnQMBaijI1QcYDB5XF9e2WpTO4D71HZuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg06d0sTlys1uinGKdObbwSTvOdQef6rARna20e9TFM=;
 b=sl2HVQeHpsgnHTqC69jYlT1vJiEGSbh/N/TiuR+ThEolqdPK2LUrHGeVX14+MmuxguPbbJ/u9FuLsnHGgXDa9d2C8HpK8oq2dyR3mIaEVT+QCprcefVXJ9u2WcGSFrbf5N6v0Fpk1xzvnrMeyttsw5EUtIn2+zBvb5Pl5BUnkR3P05sibRpVSBB5CAlFPA+LHFn2tW7oRb4pvj5g3jQPS0L2FcFaQ5/cr1/o8u8lHOHfDXkjJDVvqU/jPptwzIgvq0RanVgWvlAchSVZDU1fWrYGiNiQN3ba9BaDwqpHkwSBUryjgRVBl/3he5O2hpvFMR76m6i2zRoa5TiLN78Nzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg06d0sTlys1uinGKdObbwSTvOdQef6rARna20e9TFM=;
 b=IcueM12mBib0TNXMNcXM+QX8P6SKXbDhUCz/+CJZlBanCd6ZR6OOqSj7wOWQzlxvHLUnKJlxY49klCg6pLJUIHZ/faup8AQTguVhmDAqxhkjjVn6HxP21pPkieeh/MrBGXqViC20FsN5NhnBYD+Jsh5Fyxadd6KnP5vIcTemmEE=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by PH8PR10MB6316.namprd10.prod.outlook.com (2603:10b6:510:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 16:49:52 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 16:49:52 +0000
Date: Mon, 12 May 2025 17:49:49 +0100
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
Subject: Re: [PATCH v2 09/11] x86/mm/pat: inline memtype_match() into
 memtype_erase()
Message-ID: <81aa38a0-ae35-41b1-900a-cc60f5367d06@lucifer.local>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-10-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-10-david@redhat.com>
X-ClientProxiedBy: LO4P123CA0532.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::14) To CH3PR10MB8215.namprd10.prod.outlook.com
 (2603:10b6:610:1f5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|PH8PR10MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: 9adb7177-63b3-4e92-2c34-08dd917503de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FsYo/eixUh1eUl9cW23ZDM1dA3dwOUSQxMV06Ky7YQqrOVOBNsTKBvYIlaND?=
 =?us-ascii?Q?KBXpMJpk/7PUQbV5D/LrmUrslPP5WYUlxdcsceiiJJ3aDcCDE9MgliTXlQmv?=
 =?us-ascii?Q?fNHB8NySlx3PGVLHJx2DVDlChgiwyLK7biUMCSfB37tVm1LJvf9UxWfPfpA8?=
 =?us-ascii?Q?FUMsROdgOSC80dFTCPDw7YMHo25yd2xmHsgMdo87rgJYbMgNUjFiYG9jXXKN?=
 =?us-ascii?Q?UGvlI4zGD5TPAGQ4Juvg5yF2aGlWCMEEpHx0zuCPG6pVr1QT2gNSojIU4Eu7?=
 =?us-ascii?Q?uky/FOnkWGQcllzsoeUMmxZxSdBLiSTcl8efE/CwX0B3CH9yHPY5/2pvcz9q?=
 =?us-ascii?Q?qqW5cgJjBqYpEQI8tbPdp9gwKrao2sMBM8c0K9j8D/L8VOu960q2bvGJM602?=
 =?us-ascii?Q?ww/8t6Oga6XX++0G2gEthVFfuln5vnoUUdKK8vpYSvYeai0jI3SteYqOsExS?=
 =?us-ascii?Q?C5XoopeAWKDOFrFvOp8A172rW62P7GWHws2u/jcDIbZTcAaNq0VpllBWQEe8?=
 =?us-ascii?Q?5iulZgPG6Xn7FJF7S2isb6zA+zjxTT8lsG0FwXA+1lfb30X9YiP58RDQkKZc?=
 =?us-ascii?Q?gnQAeRolJorj3CmuXg4cqB4eMAEVC2nLIzIRbxVv4fyGrN25z5UsUsJUnHro?=
 =?us-ascii?Q?TtCFCwCSy3VisS6WDTrHS6BhdWY4VfaNKJWgjs0hdSpA3KrtdoSEWFr+sj+e?=
 =?us-ascii?Q?x879EsNczIEdz9Qc9nR6jgqv3T377r2Z7+zb7H9/6awOxSJu1MYBXdsR9o9I?=
 =?us-ascii?Q?mLGVb5VVNWzPkMv1JC5Exl94gqm1g/0XYvdpsEbvYHnXEFmNRU0SswecafCI?=
 =?us-ascii?Q?po0GqIqrl6ct6mb9NtY8kSFkA9ggnTM7CL65y6v3SFKCvw6DQJjoorp4dE8y?=
 =?us-ascii?Q?+9gvqpPhjgXYcOsGxi5CFbEgAN1aKlM8JYOFFqfRws5Ir6xyDGTblwQhkSGQ?=
 =?us-ascii?Q?l/kTZqq0H4W8fVNNPlUikcuY1jAz67ticvSg9hahpmDC90zMALxp0TyN5YVC?=
 =?us-ascii?Q?vsl5HV2+WW1AzSx36PFH8kASxRqZTCrtsSQhe+GRXTj6ZsKfF8ILMXkV1vm2?=
 =?us-ascii?Q?fKqzJGg+pyT89ubnfHE5qm9C1DPJBm+xKSCOsRreiG0URNZBrdpo3ztpJd5D?=
 =?us-ascii?Q?Rp7hlV6M0Fp3i0mkIK/H1JM6yn3mwhWTDUx5VFS9rJ4czRPBsAvwQFc5fVKI?=
 =?us-ascii?Q?sdLnjPk3tPxUXa/+GxZZIUGIFBQ/0S4LlIW5nGVxsF/C9BWF/7Lrg93ksR/v?=
 =?us-ascii?Q?wWOyrORRRrpO77hDK0h/s5efcf+YVnJGUX+/lM5mGhVwL7PNLAGoewxwIQRv?=
 =?us-ascii?Q?kGUpQjzyr0d/5beqokGpbCIWsKSJfy7g9CgZL1lX6X+ZnQZWxoOlc4DCdI3m?=
 =?us-ascii?Q?UUnPuIcPHqUe7tCHT1fCkBjWFbCUN0gu+8iUwqYNArp0fuBPMzexwvxRaBvm?=
 =?us-ascii?Q?MAlfMo6Y0PM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB8215.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0vA3R5YjZ+WQS4P8qP8eqnsb/CRoznfb8Ty5ygGTpyK+Nvh0mLKEFQfKPu9Y?=
 =?us-ascii?Q?wXY/vykOVVGoDt9soNje5SSb/qD+r/QTk6kBt3A1Pdx9H6sPtB3gSNNBWfJL?=
 =?us-ascii?Q?E8PMdBUO2M7crDvzvNW4TP3HThawE714il3Av97B69fptfo65XvL80y2sFFM?=
 =?us-ascii?Q?j37XyALLQMKwb/u2YmtwkQGw9pZPdUH0xkwBFOg0TIl59obHvDu/nR6iPsY8?=
 =?us-ascii?Q?KYm7d6VEtrSZb9axik/tIkBzbgrPjdu1Fvyq1DqNc0K2R6KbAxYg3LysYQoh?=
 =?us-ascii?Q?trn5pcRKSDq11YBMZuZp2tPCEimBAh87hoDWpaJMHRi/4NxMkCEx2sYMgmN2?=
 =?us-ascii?Q?dcaAimMHpeXZFhwILSpjEykYmsJXlgZLV46Gx6qZcs9GKCuSp5DrMMjJplTG?=
 =?us-ascii?Q?CjrZbT27nFTZI4MsVDe6uiZnoGQbPl3lCNoXm/GJamAUuZ2nrYi3lCKXaT4f?=
 =?us-ascii?Q?HRG9fumcB4xqL7/4RIfZB8RGsw5PvtZgOrA5cHpoXedajFZX28oleF7JxJgZ?=
 =?us-ascii?Q?SHSGF6MSa8AbA4x0ScbkJbWd57lEHEP/R4ou2rtwH/7oIjWumAJReog+mIjZ?=
 =?us-ascii?Q?03dJRyg4hc9zX0N57MJ1KqEX62ufWAga+7rbAfH0baVRD7rcTW3P5IERw0Mk?=
 =?us-ascii?Q?RlRnyjyBiEBDpmnF4EkyACzT5kht1S/LsKDjPNHhsIaF09eyHNT2EnREsZ+C?=
 =?us-ascii?Q?oDqwyUqHYSj9XvVXRnjQ2Mo6Xh7uGUCHUZjBkEo1futu2DG5dlGBZy6Xz1xW?=
 =?us-ascii?Q?EpmIxOwlqhC1+XWnQis9nF/i4ogGHak8r59Lw1v3vB6BBI2ZhjQieYBg4rWb?=
 =?us-ascii?Q?6J2rI5e6mBicv00v2+v/u6J6WsvPXDHi48zQgc2ilEYYoJTNnlvuJWsaIwlq?=
 =?us-ascii?Q?IS31/iwpAwasQMDHagWpWwCbMvLLN/To1GlmPt+VvBBFgrZlDaGBARBt4qzM?=
 =?us-ascii?Q?lHplcvsE3lpAazxIkCE8xRF90zx+FELMY7XhiEnLnYZ2fx4xpa7QDFncioTk?=
 =?us-ascii?Q?FIrioR4Nx27PvQmls/byB5v6Lu+mbkWOXS01+SexH9R9kfUxU+M3sc38kPeT?=
 =?us-ascii?Q?MyRfasC+rDFZhYnrfHvfZM4VnzxOvHsFRrbZZwoZaPwmZMPABlWtjMpWzO0j?=
 =?us-ascii?Q?Z8afIXMnobgYEHBuTpza0z7XjDfIORgSOnzZnXaO8wMULwvUrV0HCblt7nXN?=
 =?us-ascii?Q?xnjEsLGRLGFW6+oBZ8WniJV0J5yeLEeNdgbSPNs1blW1tra+bbj3fGt7YbU0?=
 =?us-ascii?Q?Nxu9d/fwedx2nx2CNk74IVINANPVWGnpDHjq2v3LwAKVUngLZEhicv9GOH8i?=
 =?us-ascii?Q?/5TOx2BQn3DvygLI2EjvwWHJ2CFFS2K/D/U/xhRAO/Nh0KOHnzkBh6ZRBZwt?=
 =?us-ascii?Q?9MXvy2bQwFZXJV3zf20DAgWH9CgPgRnUUlTNudjrJBAVBU00ScOyaqRhumjy?=
 =?us-ascii?Q?V6vOAB9lD82q4w0iuJEsbmQYkw/SMvR6iaD9wNKy0nLE9kvdKLIgACS0g4D5?=
 =?us-ascii?Q?5v19NKmnUk+sa0B5vSvy0IJVAGdeZZNWrRyXpxughnF5g4t9wpW4oQJJybMf?=
 =?us-ascii?Q?k6posYqjtPixh+lk3ony7EkfRm+2hisc4hbhbXbQbKHTXMm8i53foTFVH+CV?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: XtPKiztstNXrCCrXPxTMBvSC84gwRA7xmEabCO/wDHsWrTI3TB6d/JWtnUQ65rdRco3ieRs/pgeWZO2aO9o9ZBEcIKuHnh/tkrULxb1kv8Y2aSPDD7s873WYF5s3dzCthLhrC0zfIC1Q/X/ZdNPaxVf0mvN2pDjcf9UuBnVIbBitktBh26ogNRavMWhGxgUxPNGcIrF/P5PPXmAkRVn56UkOQkphlzKHOdXxcnPpHfSqV8jOXssb1fNrtGQ+4ZNHtzjoZ5hlQ2yqHg2TB51THf/U7oZhRiTFVqOm0/IUEqK4XNdf0X/AAYZleZlfTN2246pCLW4G6nn0TphgpmvxRwERLP8q+kzz/FZt/+fhm1CwFC0WVwy44BlB1WiUjywKAFXo88ZpHfwgK2p/Df+utFYBqtiJ0FVVDIX9MSim9LB1ADWQmnvQcJex11I14y1guW58pImwfmlXI1LiGZ/L5LJnp3/47blt3a9P8Tc/Q3CPUphGyoVg/y05JrDLVj26CfoirYscJLvqCJ3fW3xCWhclMrMAyToJx3yN9js3AH9Q6JlW4akMLQpsO+BoqweKI1CY+x5Q345mX+ibV6S6zXvkVqD9OVEsjwwyoDBRurc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9adb7177-63b3-4e92-2c34-08dd917503de
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB8215.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 16:49:51.9472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwJRK78g9GwX+JPoBeJllxXiCY97VMIrKv6cq3xCY059NRk4sXvR0iz9hNMFST9FGuhbdcV+AzAM9+h5mLtDVP5s8F1ltWYjgkqRYHeA3X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6316
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505120173
X-Authority-Analysis: v=2.4 cv=M8hNKzws c=1 sm=1 tr=0 ts=682226b4 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8
 a=yPCof4ZbAAAA:8 a=xsQxrDdK8mqNjbTR4KcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: m0vLTn5urEhmYLcp7c1WxPPx6vApvx5u
X-Proofpoint-ORIG-GUID: m0vLTn5urEhmYLcp7c1WxPPx6vApvx5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE3MiBTYWx0ZWRfXyuC84BIRXNVr
 DjoIUF2tkyic3D+CII4F77qlxbvOcGy0USGPqMmzr+owPXO6xAb6I2ojwUKPjKVDbK2Fo332EfW
 38ANbZLvg4ZW1m5QKVLG/KSTFwDBCQ48F0IM47p060Y6hbiVNUFZaL5UuSL+4YnrR+XtZsE1b1A
 i4yvvc11Vazeofbe/oal+0XqBHmHD0aoWcY7LgDG7PZM60+G85Mb7gBkdbqEQyxTevLsVrGUOlL
 hU/boDMb/qqiWaoWmzHzuY+IloBuPVf6CzwbfQeyO/LE6nG2cMZ6VlFlh2CDK2wooQs7VvXbLmc
 U7d4dRgPRs7xXc8NlbwTLzDsUqrQV4NRhu+XzdQ+LKMegOrLCHW/arehAhi/h9nugB5jwNSi9Dn
 XvQvAJHo9ymizYP05whGGGbr+koqTgqAZunREEWmGfqndZE/dWGCH3P0JunnBGD157ORxwhl
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

On Mon, May 12, 2025 at 02:34:22PM +0200, David Hildenbrand wrote:
> Let's just have it in a single function. The resulting function is
> certainly small enough and readable.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Nice, great bit of refactoring :) the new version is considerably clearer.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  arch/x86/mm/pat/memtype_interval.c | 33 +++++++++---------------------
>  1 file changed, 10 insertions(+), 23 deletions(-)
>
> diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
> index 9d03f0dbc4715..e5844ed1311ed 100644
> --- a/arch/x86/mm/pat/memtype_interval.c
> +++ b/arch/x86/mm/pat/memtype_interval.c
> @@ -49,21 +49,6 @@ INTERVAL_TREE_DEFINE(struct memtype, rb, u64, subtree_max_end,
>
>  static struct rb_root_cached memtype_rbroot = RB_ROOT_CACHED;
>
> -static struct memtype *memtype_match(u64 start, u64 end)
> -{
> -	struct memtype *entry_match;
> -
> -	entry_match = interval_iter_first(&memtype_rbroot, start, end-1);
> -
> -	while (entry_match != NULL && entry_match->start < end) {
> -		if (entry_match->start == start && entry_match->end == end)
> -			return entry_match;
> -		entry_match = interval_iter_next(entry_match, start, end-1);
> -	}
> -
> -	return NULL; /* Returns NULL if there is no match */
> -}
> -
>  static int memtype_check_conflict(u64 start, u64 end,
>  				  enum page_cache_mode reqtype,
>  				  enum page_cache_mode *newtype)
> @@ -119,14 +104,16 @@ int memtype_check_insert(struct memtype *entry_new, enum page_cache_mode *ret_ty
>
>  struct memtype *memtype_erase(u64 start, u64 end)
>  {
> -	struct memtype *entry_old;
> -
> -	entry_old = memtype_match(start, end);
> -	if (!entry_old)
> -		return ERR_PTR(-EINVAL);
> -
> -	interval_remove(entry_old, &memtype_rbroot);
> -	return entry_old;
> +	struct memtype *entry = interval_iter_first(&memtype_rbroot, start, end - 1);
> +
> +	while (entry && entry->start < end) {
> +		if (entry->start == start && entry->end == end) {
> +			interval_remove(entry, &memtype_rbroot);
> +			return entry;
> +		}
> +		entry = interval_iter_next(entry, start, end - 1);
> +	}
> +	return ERR_PTR(-EINVAL);
>  }
>
>  struct memtype *memtype_lookup(u64 addr)
> --
> 2.49.0
>
