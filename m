Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2356AA9FA67
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA9A10E257;
	Mon, 28 Apr 2025 20:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Hk23aciy";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JQPX0HZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FAB10E257;
 Mon, 28 Apr 2025 20:23:39 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SKJS8L008261;
 Mon, 28 Apr 2025 20:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=0gR/ZzxLzx6GHvqMDX
 kGTIKyiVchvxTtdFB1cSpCjhQ=; b=Hk23aciyj/d862AxvMernylc9uNBadHdwd
 r00FkPpQ0+mld3BE0Sn2xGc++67HFwMHaHhEzH639bQKho6rFCGr5y19hO3hKBgv
 ycZ9Gn90S8OwroTNvlyDt17DK1Yln0KhhUggB+yutocxmGyhRYgHsvYTPyb4D1kZ
 kaX64r80GIT04SGeM5Khsbnyi69d1cmetxWoMWcZWDdX6FTGTiHwz6cpH/7Bkm9T
 oeVQJgYWNN1SXuPmbB5kA7CltiiucZG4GBqOtJ2kc96WFJiY1WQJgG2+jsCbor89
 QB4iRlVbDgMzveW3dFglKN9vlqbzNBCigokt0kHFZ66MJWnNYdIQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ag38r2rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:23:07 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SIU51E001389; Mon, 28 Apr 2025 20:23:06 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazlp17010007.outbound.protection.outlook.com [40.93.6.7])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx8wss3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:23:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yz7pvproLI81hlAkPS8VVGDfKnMNxlRZeaAA7h8YCCUJ3azlB8KW2t973hwmcY0CB20ovmkt82YlNdECXYmcBQhXCyQm88hQZHsxitRdBha4Rt4mwGHTThUQyFq7UfKZSctX9oU7ZpIL4o+RgcgdtTgoo8Fgn7v2BfQsuGYarAzkCvZXa9FYRvpAdoKdht7zi/15dxGZB5oYG7TvD961xN/UJ6Xha5oITB/7Apgn+UN5Kj4PXJQ+JL2j65L8oUWAosTvef4acTHP7RbYHolZmSmCO5J1EWIrcpWeQ79J529tI2l5uBUBCCY1fs6BO5j9T/oR14CiV4yMzXfrmcuBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gR/ZzxLzx6GHvqMDXkGTIKyiVchvxTtdFB1cSpCjhQ=;
 b=h+GAWkBlIvX3DHZbKthaUMaEgYYbJAGvTIZp4ke6tXd6eLbTnG133FdCpKiNL49CIv2Rbwd5ro97j90/boWWd8zWm5DpBL6i2N+pcdFGfqE5pK1m4EAvKpvan+HEiT697KHMKo0Lkq3VRK2FLXPuNiByXs5jR84t58/RYU5sEw/4uo6PoqEZE/vWWVN9fMpgfSF4OB8pwSAr/6Q6yMMLzUvXxT70IQdExDUalSYkXtyTulZQpjYOTuYycD7p2JLwThAH+4AeM9eP9XKkaIMcvL98QTWWfLfxrn0p/KN4a0/F/fsXlFPryiK7WkVi43IiXICw7qpU2M9FOWm5Ozd3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gR/ZzxLzx6GHvqMDXkGTIKyiVchvxTtdFB1cSpCjhQ=;
 b=JQPX0HZOQNGIocZh0Ffi3RbosfZbsR2WyYE3/XrcDPb4Tlu87153SJnUc2KKboCt8bz/znm7dU9CrEWOe9PZzaMrbYocRf5YEFMopxSnYzWIhHi53ZvrZ8WO8m39qgpxQg5rhSozahB55E+A0US22yNNZt4M3pQ6axVVDDnraU4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5549.namprd10.prod.outlook.com (2603:10b6:a03:3d8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 20:23:03 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 20:23:03 +0000
Date: Mon, 28 Apr 2025 21:23:00 +0100
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
Message-ID: <fe80481f-6fa9-4148-90b2-65734ef259ed@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-10-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-10-david@redhat.com>
X-ClientProxiedBy: LO2P265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::25) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5549:EE_
X-MS-Office365-Filtering-Correlation-Id: 88bd43fc-b36f-41f9-02f5-08dd86927a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jDiOoRjA9OCjnGzKPMS3lWpYnUBZ8p+MTyXLexI/7tLp3ygAMpQEaeHcxSSE?=
 =?us-ascii?Q?oWh9BX0CgAVl45VFulvseEHPr/k5SvYywdzXK5UdbM/bkpAZHKHAEUIMyeQV?=
 =?us-ascii?Q?MxXYLN0z6FEfQeq5AqZyCxn8RURb23mmylsGYTYNzMwXM9+ir4hZ14Q1PFZC?=
 =?us-ascii?Q?OiO7vSRsZpzRMvO3AYRIGKoWgDibaZcHfH1FqiPNzEqhCtDEuQLEEN6gPLfA?=
 =?us-ascii?Q?cFvqFe+WdP3Lty7dE7hL9p1KpkpqfkUnyPTwmE2WhyiYq//5w8DZZkM1+xNO?=
 =?us-ascii?Q?N4LhhZ/ghz2pM011WytFs8QclRcLPs0SaIfW5Wws8B8OMoKjX5lVf24vBt3X?=
 =?us-ascii?Q?nR2fG9rBRj8bPWhHb/ITML473xWm+gJx3ZfmPZJtjw18Nd635zqetw4x1JzO?=
 =?us-ascii?Q?qLIeGncFCxt3NFcOA4SAAq1791Kov8dWMkPsdUTsEiOf4bpvpNNgH3jmgU7Y?=
 =?us-ascii?Q?jhhU3k75+GW/vkM4KDHhfbZYgGfJon2FTwcgkQnAY0FaO8C0lFbsTC+RHux9?=
 =?us-ascii?Q?My6x7zIDzmxFbXWpTWxNdaB+HE7d/bfbrYv7rCtJwEcDMGNupYWDvnCOcPwF?=
 =?us-ascii?Q?ugd9xBlTw992K9+cChAiXBg+HH0u11MVo/BStAvEdxCuCotDFbgwTwL6+Grb?=
 =?us-ascii?Q?Glg3Cel3VXf5NbesJ70967XaOBrAybIfPoK+oRtSRZ+IqUymiLggpr47cDJE?=
 =?us-ascii?Q?T6LSwqnf1jnsPWTLwL6Pq7KNFZ2WicX6jFfJkqN/SPaWtEbyQIhp+Fk0zdX8?=
 =?us-ascii?Q?BdFd5EJ6oB5Nn3+rX+xWLwztZ0MIevVWQWi5hgo3DCF9ff9jQf0gQAaDMS0Y?=
 =?us-ascii?Q?JmpzwkmsqplZnH6YIjI8zGckKz/4KQbH5NBrhpTAUslRKsWg53HHbBpLSJLr?=
 =?us-ascii?Q?hCBErTA1BK823bGhjARMelCt6W6zf0WwKbeP/c6+DGXaCaWkN/dsRn19312i?=
 =?us-ascii?Q?VFKdzDumyumVzlefp2SXdjMLYmjYZu4aqAmI7QPhDjF3bOtToeWBcCMoOePK?=
 =?us-ascii?Q?UL6kxXI2cjtNaxzvCiYYNCw5OXnZrRIKuhLBOXC9QQdmGb97E4XoIcTMvwfv?=
 =?us-ascii?Q?J8t48gcbXT1Nw+Y5sXnnNFaoIuBla+DEihmY0YXWEWIGS9WXtFEKZwQuOI32?=
 =?us-ascii?Q?NXSneH/VyCur2Ed3vVjodXYiDuMAS6YQ3hj7YpyW+YiIS/IkCnmxJ5+EW5OJ?=
 =?us-ascii?Q?VCY97U5ny13raVPEv6krK9Epli7A+jFebdL+Xqo47UiMbf4B4efLQ8Y2Dtys?=
 =?us-ascii?Q?w0vVo0GiOMDuK2fGY47CYWj/rMJ9USlYf+HD++Xe4bl8lWkovsTQmCwvlR8H?=
 =?us-ascii?Q?lZk2QpqVPm16aM/TsuDH/oAUkxDLDwJ5LHHVhKmZfuY2GogUPxb/xpfoDdWN?=
 =?us-ascii?Q?6xrDaZoy8oyYRbcONbRFZqIesPHKSE4CqEJjH9jAjw2g6WVHCGVMV4El4noh?=
 =?us-ascii?Q?szvedStLBeY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qZ58hGza+8TwjaqL95PjUP+Kv9Jhwb7mS0KQ9T+bFIj6/aoddD0rh0z1+MUf?=
 =?us-ascii?Q?nXC5pxW+wMyNU+vAcGVYd01P5G3GFIEIvCe7xBT+ZFhnuCdVqrYHjWns5mys?=
 =?us-ascii?Q?CUUXHnZHJWBNgqhlMbG42icgOw81H2UYFk2LK6dY79s0UUyOgNyAw06U6O0+?=
 =?us-ascii?Q?uoaLIh/l0xWgGSpjuvBe9+jDJQU3FSZf0/+s7URuEpCda5NnVzlxRiKw/iMN?=
 =?us-ascii?Q?Ug11Kc4pLAdQVLx6W4MtpPGsDsnUxoKD2WWDXmyUzZWsbVHUz52FVVK4zBBi?=
 =?us-ascii?Q?8Fb5AgU2hV+x589Xmd6lAYjqjYYlHoLwsWT2mlFTZ9CCBtByJN+FbpMRZOoY?=
 =?us-ascii?Q?+0xzRJg0BwHzqMK44t+jZ4sQLBTHbZ7Joik58vYgJlqf9ivYjH5wxCD5S1h/?=
 =?us-ascii?Q?iCIFwYjhgN9ZiC5H1loK01lbQEo+UmL62UdJljqmewhJI2oY24oRJNe3tFeD?=
 =?us-ascii?Q?O9m4yI542xn1QG9TFkkGiBRhenVbwAdFt2K7nD8xVs4l1I03CbM1T+GcHrZv?=
 =?us-ascii?Q?W2YEZFoW9psb/U/O2GAKgoP257Y/yvGqjnFDa0xtnjqSd0QFiMhn6ADE5OLW?=
 =?us-ascii?Q?eJ9Ec9ddHw4Zb3C7mSyQknyuCLOWKVnyHG1Vp4f/BpyIz4h2NKIRhAC+slPg?=
 =?us-ascii?Q?J5X17tPlbAiz72FMJQwfQPqGERvqIQ1tBJ5bCHure8TKwxY5ifgGOk/QlPyR?=
 =?us-ascii?Q?Gx0h0aNwCy1H+LJa3K3ecFVC4egcFHg9rfpqTJVnB/xVhlcUpO2KzPlnxWua?=
 =?us-ascii?Q?oPbTQYqeM9B5HlzO64RciYqUFe2yFJEUGZV/VauhVffc8CG6dl6CgfaWcJwl?=
 =?us-ascii?Q?lZcmAIQFz36mZAmgZs5XHpq9BuWEu+Q+wo/wQlL7sgLID2XyhOqNJrnjxj6Z?=
 =?us-ascii?Q?i7CnC6LwhqGEp6deSwNvIGI9jaRB3+gcmbVRqQL4q+z+6Un2DHECUVEP/05J?=
 =?us-ascii?Q?459ce+G4iDFFIiqXAtQVEp680GwQsEF6GgKIWLw+H0E5g7Em2Nco+xDrwFOU?=
 =?us-ascii?Q?hYPIlmWan9XUvXyWgMywihMRxZcqo4ksbL+LDonU5FzPnRbI+SecWtFfZlH3?=
 =?us-ascii?Q?GJex9fflmnkUyVzglyic8RxBREKoKN7E3cFBVTmX6bIX8cWdqch1D4KY4JE0?=
 =?us-ascii?Q?gWrCMwPlQtFfOTNUOpaDuTH98YElq+zMUBkmhv398l4/rsMh3VB0a5pXOPsE?=
 =?us-ascii?Q?/DnssP4vqpOIPLd3aTkG8eTDnsisMEol9JahuZRSRqgQ2/v9zzewGw0rTThv?=
 =?us-ascii?Q?0syWFI0g0ACXf4pv71TnmlbG9l5I5sMmsiDl9Q3i/y3MjPL47P/qEnrMCRR2?=
 =?us-ascii?Q?X46Yd5JaKvi5Srq2h3ylXeQ3Lnztq2+t9vHjPWdqoTWbByotQXdcjPwXHhsO?=
 =?us-ascii?Q?oKKkpXEulv7G/tawgxPHl0GvjuB51Be+LZUHLwdXFmKP9LVY11jHNLjRV2mh?=
 =?us-ascii?Q?lnRfhThL4t+MwMELkDmoFm3OnFL8yTiFkW7QnsoHpC0pXIISWtluMzAbM16W?=
 =?us-ascii?Q?yoljKMaOWNrbDffyje5ya6+d6KxfhkfX4/bDkNre775/ZpyQEIUTPjj9aVmc?=
 =?us-ascii?Q?RED1vLD6gOX/qwK/yADbIxZUdQRs5OTKvhX25AOABTeJNoFl/jGt4kfyc4sM?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2QuF1CU6Q15Pb73PdEnJNq5eh1nJfNnlE506uEET/hOHW4N+wybbXGbU7p/psqg1YuUzCJ4wezheb8exlMILi31teyGttcMBr9DVURWqi3vw8A2BLD3EFtqANtACLauNXlsAGXzDl6d5GP9Svs+TxhYGB2jXSnmmqCOc0Px6nu4PZ6qmkOTSd77uC6Z/V3hmMr/Ye4v2YauKeC4KosuqW8gmvjcXoD/yrCJQJJn2SMaMUJxHhCtEK5oMf5hMXBmyTKUTQl0V7MwhcFzs4BU72g+RFMW7Yhz01KoMf/IjycCBaceAPReXTo6YU8QISq3IJ1wB+JpHYOGDesi6O200H2Hs0MREnnUPKjsT6X6CvU0MJvKNc8HPf5KP92jS/0+O5m9iBtIHExaaYNEE8xxtlD8N19bpqEM+vDGok4lcouiSj+hpE3oK24ZlodeFqHrnhr3gcHO3ssbaJ6cB6lH5Q1TQF9lMRJ6w9Cv4icPFbSjrR+MiPPnzgJp9+40IPS2CPKLsk1o2Tx8NuObYS5bU3gh9xSCBj/VJhz72hbvwYMyq/jtP5dYsCjY1b5YU44LHNHARLdbMIF/Q7EJZpuI8ITI9hQsDKOXnBinFxdBQX+s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88bd43fc-b36f-41f9-02f5-08dd86927a21
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 20:23:02.9793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9J42mpoiNAsFqdfQGTxZiNi0QBIqRCm82/z0l8LtYbjckmCrbLjr3v5zblZ6a37oTlnfBrJgVi5r2zrKMbmSAW/wlfJ2/goG8tqVsvUAu64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5549
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE2NCBTYWx0ZWRfX0uYFqkiiyI7v
 Jl7sN9QDKtz/bOCwf6WkouKnRC0vKck7k9ZgGcJ1yi4m+EATzTuzVFCyZ+BcMknpF2PF52FqTm1
 SprNyzGdDRTfSJvl+VeR5ag4zlxyjeLKOO5EnhJCjdDlPpb7C4iYszXr1nCbSqwmH1O6puis+JP
 XoqJjAV2+l8Dhvdh5RPa12Qhe8DczJdWtfb/27QC/6MDwbl0wZZgWGmNFI/aUdctxpjPzH80q76
 PhaiLoZnker4oy8QQJyPaZcKcGciD31GbXZkWG6fKzSPPb/I43t6eH0l+e1O0QNgs80XTqWKl6e
 jem3q01wam8KuPi5z2Rdcmkx7PCUTEl8cnaJmavCl23C8GU8rYf0nrW9N2Cq/dOwn51EpQNtxgg
 sebZ5K86
X-Proofpoint-ORIG-GUID: B57cRh_BVBw9Q1HYl0J37P-ZJyDIWsWq
X-Proofpoint-GUID: B57cRh_BVBw9Q1HYl0J37P-ZJyDIWsWq
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

On Fri, Apr 25, 2025 at 10:17:13AM +0200, David Hildenbrand wrote:
> The "memramp() shrinking" scenario no longer applies, so let's remove
> that now-unnecessary handling.

I wonder if we could remove even more of the code here given the
simplifications here? But not a big deal.

>
> Signed-off-by: David Hildenbrand <david@redhat.com>

More lovely removal...

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  arch/x86/mm/pat/memtype_interval.c | 44 ++++--------------------------
>  1 file changed, 6 insertions(+), 38 deletions(-)
>
> diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
> index 645613d59942a..9d03f0dbc4715 100644
> --- a/arch/x86/mm/pat/memtype_interval.c
> +++ b/arch/x86/mm/pat/memtype_interval.c
> @@ -49,26 +49,15 @@ INTERVAL_TREE_DEFINE(struct memtype, rb, u64, subtree_max_end,
>
>  static struct rb_root_cached memtype_rbroot = RB_ROOT_CACHED;
>
> -enum {
> -	MEMTYPE_EXACT_MATCH	= 0,
> -	MEMTYPE_END_MATCH	= 1
> -};
> -
> -static struct memtype *memtype_match(u64 start, u64 end, int match_type)
> +static struct memtype *memtype_match(u64 start, u64 end)
>  {
>  	struct memtype *entry_match;
>
>  	entry_match = interval_iter_first(&memtype_rbroot, start, end-1);
>
>  	while (entry_match != NULL && entry_match->start < end) {
> -		if ((match_type == MEMTYPE_EXACT_MATCH) &&
> -		    (entry_match->start == start) && (entry_match->end == end))
> -			return entry_match;
> -
> -		if ((match_type == MEMTYPE_END_MATCH) &&
> -		    (entry_match->start < start) && (entry_match->end == end))
> +		if (entry_match->start == start && entry_match->end == end)
>  			return entry_match;
> -
>  		entry_match = interval_iter_next(entry_match, start, end-1);
>  	}
>
> @@ -132,32 +121,11 @@ struct memtype *memtype_erase(u64 start, u64 end)
>  {
>  	struct memtype *entry_old;
>
> -	/*
> -	 * Since the memtype_rbroot tree allows overlapping ranges,
> -	 * memtype_erase() checks with EXACT_MATCH first, i.e. free
> -	 * a whole node for the munmap case.  If no such entry is found,
> -	 * it then checks with END_MATCH, i.e. shrink the size of a node
> -	 * from the end for the mremap case.
> -	 */
> -	entry_old = memtype_match(start, end, MEMTYPE_EXACT_MATCH);
> -	if (!entry_old) {
> -		entry_old = memtype_match(start, end, MEMTYPE_END_MATCH);
> -		if (!entry_old)
> -			return ERR_PTR(-EINVAL);
> -	}
> -
> -	if (entry_old->start == start) {
> -		/* munmap: erase this node */
> -		interval_remove(entry_old, &memtype_rbroot);
> -	} else {
> -		/* mremap: update the end value of this node */
> -		interval_remove(entry_old, &memtype_rbroot);
> -		entry_old->end = start;
> -		interval_insert(entry_old, &memtype_rbroot);
> -
> -		return NULL;
> -	}
> +	entry_old = memtype_match(start, end);
> +	if (!entry_old)
> +		return ERR_PTR(-EINVAL);
>
> +	interval_remove(entry_old, &memtype_rbroot);
>  	return entry_old;
>  }
>
> --
> 2.49.0
>
