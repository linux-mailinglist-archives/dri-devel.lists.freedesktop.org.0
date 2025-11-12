Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF92C548FC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 22:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B407310E127;
	Wed, 12 Nov 2025 21:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="HA7I/1Rz";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W+fHs7sm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35B610E127;
 Wed, 12 Nov 2025 21:11:46 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ACL0x6x020711;
 Wed, 12 Nov 2025 21:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=CTPa4rylIO4buuN6AT
 0ngxlmtscwDy27k99RTSkv4/c=; b=HA7I/1Rzhue/6C7t5ldQbbJYH3x0hWUw8m
 ihwsMvvU5e4QwQcjiIdeRygA86Iu8fnPoo6bSf31mEKl9nf9jPFnkx1aKsWGbH1n
 SouVk5v+d/phFPjWIbWFz2eR0wsL/dA7DQJhufBWb4rbBHdHa9gv7D6DmMnKSUfY
 YS0lSkJayOQpDCiKywjEG2PMMAraeItbjLKQgkJ1AvWATQB2u9U25y2iQHGin+Bk
 wfTCfqyRP8HUXHSuty4HO9PxPLGBjpsthPUzC4oVut39RzixazmLnQnuHg9jgczm
 ySC2UozwHH1gNBWZhnJ1UVRQvMRMABh3JOZLUAx8Cb9gi9ayazMg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acxfvgg2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Nov 2025 21:11:28 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5ACJxJVF005486; Wed, 12 Nov 2025 21:11:27 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010041.outbound.protection.outlook.com
 [40.93.198.41])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4a9vab86s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Nov 2025 21:11:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZaGu4gcySK+j4LXpb5rkp1BZc/XqvYEd0SF0ZtCzH+TnBsWZJ4YKXLd5U+LRa16yYwc3L/aEb4oeuLSi99DBy5G2+8AW5xQe+YvQmIYryrvbQGhgBIBC1mA/R3n83aEhcP7X5ygU6hF9nSxpC6+MT7OKDx5X0DOKxZY+ck/yRVmbj2y+Qh5fajAju8laDwXZfkdIVHsr5wYDJz78ZGLSoGrGjmblHtwT1ANj3CSGZLdVimtoWqvmS31cZwS0NMDqpH0BDkIHycQAe1SY7Xen9QESjR8GAG1vqr+7ClpHiwOUUdPwA5LzU9MbJNDQAzqglHcqL8rw9AVAFm9q/KW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTPa4rylIO4buuN6AT0ngxlmtscwDy27k99RTSkv4/c=;
 b=tfGPP9sarIWzflTD6k21iDHqN7wtuRomQqMKvOVOBX34WbZ5G5Q3VUmCz0i3GOiKnro14VAAlSfKa/3UL3RteggWqB0mXyrsEQP85xUQ0RrW1CUWUrTsE8Wlm2xSt9mzXy1FYopML7tfw0vp+xpKBnbA4V172nkw4bsv7PNvEi3ju08n+z481teK8ZeNO7WxgqskXmSTs89ynNjLnE3Jlndb4cYanZgtEEb+w7FqY0D0X8+LPlaV4uZ4+kpkiYdtXOhpgiE9Xdzbc7wxSFfZYkFjHusznb5SDkCpSsqK9M5Tm6fJfDPAXHegJZB/6oB0rYW3vd4gR5oWBzOKqgpWug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTPa4rylIO4buuN6AT0ngxlmtscwDy27k99RTSkv4/c=;
 b=W+fHs7smyfKcLolUvtW/pL+jOF+qI3xoUx+Y6nHWAEKWARPtS5ywG+H+JUiJ0UpKus+acJ+VPmtyflWcPpExqHU+gIyyXVG0oBr6WtYWR3koel0lbxmJlLXzMZhmLGtZumB/cCOl97VEYcIPf/oqMKs9ETarcuSLikVStoTdzjo=
Received: from DS7PR10MB5344.namprd10.prod.outlook.com (2603:10b6:5:3ab::6) by
 MW6PR10MB7613.namprd10.prod.outlook.com (2603:10b6:303:23b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 21:11:17 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680]) by DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 21:11:17 +0000
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Matthew Brost <matthew.brost@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vitaly Lifshits
 <vitaly.lifshits@intel.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Sagi Maimon
 <maimon.sagi@gmail.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Casey Schaufler
 <casey@schaufler-ca.com>, Steven Rostedt <rostedt@goodmis.org>, Petr
 Mladek <pmladek@suse.com>, Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Sumit
 Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Krzysztof =?utf-8?Q?Wil?=
 =?utf-8?Q?czy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Rodolfo Giometti
 <giometti@enneenne.com>, Richard Cochran <richardcochran@gmail.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, Stefan Haberland
 <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Satish
 Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Xiubo Li <xiubli@redhat.com>, Ilya Dryomov
 <idryomov@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 20/21] scsi: snic: Switch to use %ptSp
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20251111122735.880607-21-andriy.shevchenko@linux.intel.com>
 (Andy Shevchenko's message of "Tue, 11 Nov 2025 13:20:20 +0100")
Organization: Oracle Corporation
Message-ID: <yq1bjl7ez3u.fsf@ca-mkp.ca.oracle.com>
References: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
 <20251111122735.880607-21-andriy.shevchenko@linux.intel.com>
Date: Wed, 12 Nov 2025 16:11:15 -0500
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0181.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::24) To DS7PR10MB5344.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5344:EE_|MW6PR10MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: f15191a9-4a53-4cc3-3480-08de2230050e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hfQ8qw4dxh1a8R6PlAJUpT1Nefu5WYuZARtupzIbSLytW8e3ri53xs/OdyGH?=
 =?us-ascii?Q?tt5Ltv8UICKOcByX52MW4XQqezKqamksIwNoi5pWSBJvHrebPATgWEekShUj?=
 =?us-ascii?Q?YMJpen5EEJmQQPepsKKXrwDrufcUXMLjk4SEBoBH/9lLGwJ94XAPFBuQ4svX?=
 =?us-ascii?Q?zLZ1wbPWxnrMDi3pJOOLteWxTpAa/p3LAwGQmH2hnSlpPflkxRCTXFuLWxWb?=
 =?us-ascii?Q?fW9Jo5upfcHjJFtR0gluX8sL0OFWN51XaXvjGHrJ7mw4YOAJ5+g7WzM5zuiC?=
 =?us-ascii?Q?aveSC2e+mKXFlzaFBnzMmxMT+FEhvMNunlR4/FNhH/n94EfMBPh8Ewu7oZwK?=
 =?us-ascii?Q?t6U3uj/6RI6mK51Gfghc5MBSa3b7kKxrlCIE2Z6oGCCK+6nmGkCMekquDAy7?=
 =?us-ascii?Q?z7nWeRoPN/3ZfvWSo7q1DqEu4PxpdPnw3bZGgxD3bh9Ur/viJn10ot3L9obE?=
 =?us-ascii?Q?dsMfv14k9Zkr2guqaHSuXgL5mHKnH1fRElyK9HDwKBkhcNJu0bGDHJsELAFE?=
 =?us-ascii?Q?EnxHHNJHA7f6FJMZT4aqJyaF/P6eY3sKipvwQP1ygHcb5B3caC8V/IGFO1d+?=
 =?us-ascii?Q?UoUfmUuzhk2r9msBDSAPWg7Gh771QHUqGoKAvdyicpwCbA6QgFfF2DKseFeC?=
 =?us-ascii?Q?JtX8o2LwUyQ3iMHtwPRXqe99hI5mBIjWgYJGRs/54cqYFwgY+viC7JPPU5+2?=
 =?us-ascii?Q?25BVe+IQr+LRUetcx3P5ScFbiA6DTSChVYAm9Y/TcJxGYEVr+f6UAK/HAuD5?=
 =?us-ascii?Q?AVVKTFozWg7nbqS84HGV3a1zo+BL7LFBHGlbj7WhawR5nMunHRPiYiw+VYOu?=
 =?us-ascii?Q?ox9EhlkMmIujnz7fELqHR/RVQebwNvPODVFhHawNkhCO9eNrO1vYKzxkFe4L?=
 =?us-ascii?Q?ijnHbwfScATRWeXgJJq6uawgTTWp8kiNrgL6S4zR5opAXRs5F7FTo6MDvhWC?=
 =?us-ascii?Q?LNGqN5OLWdEYB/Xp2RWqPWBCJ/avNAjhVC3l6cAAld+TxUQekTKnuJMZIXSy?=
 =?us-ascii?Q?6Tl9S8nH3/7HPVGQQ36RiXaP8fY8ZaFwedOsemSxOWHpA9KU45rOEuIB1N+h?=
 =?us-ascii?Q?mhQWIbSINiVUnSSSz+AC/0tKUd3L+wAnZc7o14OW0fvjaiVAotEMOplB5J83?=
 =?us-ascii?Q?Lm7gqdtOMbcmDNzH0BtIu3aZ84PvTtbOsoCUhTfXm9b8ZCvWvm9BIClsOhlS?=
 =?us-ascii?Q?3rsteHFH+Xz9JeJWVjDDoNe+YY32r/tEvfzslTFOt4Lij485FRUDwAbCvZqA?=
 =?us-ascii?Q?7Y6iI7G3Mdv30mBbnReCyCg53T1GwcRmDbIrWzLZlSuSHVLBABk6f4bFMrKE?=
 =?us-ascii?Q?3NKEj+ZPof38qMdy/JZNp3TjERbm7XlYP2/xiJMTh37zZVxVgRi7Idch2n67?=
 =?us-ascii?Q?19rMwoX//oKrJchtjYj8o3QIBiGQviQqXeS5GFkgBFxLAZ6K8qXpgIDipxpt?=
 =?us-ascii?Q?ZUgsB787dar3tlYp4chJlAQph9v9ZxPi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5344.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NcH0EVIrFu3t34Z8cL81Iql+wt9Gp7/YSnyRXGdqQyCKSRVEPiicv/pBkzwf?=
 =?us-ascii?Q?/XKmGBfF3akrVKaWc6UynxAr1Ie6YsFAykciNij4OYbZ/00aXZacNE/CaZab?=
 =?us-ascii?Q?wC99q6b68fBa54nLE+RgjyorAawMjYCnN03ATh2Pf/IFBYN7+pS3Nr8WUWhh?=
 =?us-ascii?Q?gna0EpWKuuEEQxdrX8co/PnQnXbb4y+EEqS2h5SpTFWwdL23fgrAH/9vOUIt?=
 =?us-ascii?Q?LaFg4/xN2xcUD3LYgwvXX15kJ+l6D2NRL/m3UOq36A1R65jxemy+4lw31Ig7?=
 =?us-ascii?Q?X4QBh2seRxoVJdJ/JhtH/EHlNtuFQPjQ8NmU+PGewS0i+T6cDaXR6kxwm8pF?=
 =?us-ascii?Q?rBmf1CLUp4fjwR3kst0RQwLu1DKeK9ClC3GcLT5tDCKZTMcC9lFDmMpsCLJ0?=
 =?us-ascii?Q?dt4SRqMVKyyH3hl7I9selDfd8sangckgoBFbHAgn2n32lHjhH9vSHdA3vWTY?=
 =?us-ascii?Q?1vnuu52rW2GCCfw7w0LJw+K38Q5K5GX2CVvFXYoweK5xxyZEoBDQrdOu0g4v?=
 =?us-ascii?Q?XbcJMUhRf6qX1h+9cCmeanWVUCl94klljZUcG1C02ubWx5Omdr4gX4NDw8+v?=
 =?us-ascii?Q?O7Ev9PEvTMt9Ox+8JY/ZpgvsDysVc/sDkZmT8ZV16TXp1/56j90Wv+ThDaom?=
 =?us-ascii?Q?lkWmZ/+S9+G1PKY06Krr1AAUSND+myML46dON567LU4M7uPdTFemuf0j2n3A?=
 =?us-ascii?Q?gs2PednzSf9nAbyHwZV1XCx6KiUtR3QiK411oVFUt6uWaj/YUVg+jlPjMAzl?=
 =?us-ascii?Q?JUA5v4TTpBa3U/J5HwEqJQRSTu7536Mf+GUY2xZk+XSjadkbtVCYssUbMMqZ?=
 =?us-ascii?Q?iGti5rC25IyWeghnuRQ+CaRquoNQg2PbLYC20TVti2bgbLfi9LIKck/+leux?=
 =?us-ascii?Q?toCsGUZHK/7BuTuQ5kgRMusBzejaJFMBMpmHtnnmFOVOOWf1Ov7bHhuIxwac?=
 =?us-ascii?Q?Q+LaWT9ZpOsMN+T7d9NxT7mtNRjyfgp05bNxBDQl4zmUlzmX5fRCyR6300ZI?=
 =?us-ascii?Q?znYZHho7N7d4PcpujBG2ZHHx0RvtbQ/f40E2aHNRCeTxqiofokouohyNz7J3?=
 =?us-ascii?Q?KYqfZR7m9WpYvGDsDM4p9aOpdBQLtBaL7toJAF8a7zymMxRYo539r0nSiqlZ?=
 =?us-ascii?Q?8mg24JUUaxydA3kUd8+RC5NXXWW2MT9pOxVWr/R6f3uE4rEtpQyJfZc7CljQ?=
 =?us-ascii?Q?yWgF4C9hq/pSrvWAex6f4Er5mCLj2jLt98Z37uFVlT3k0dms07biTN2Gb0fJ?=
 =?us-ascii?Q?dPa742T/efwPUwF9f5hF+EvoEGa/WIwDcT4FXlzgrlotRQircI6PRUrNl1dv?=
 =?us-ascii?Q?VwYivn75nmR6layOYf4RefrwcOZMlnq4AwpV0Fa4ztbm9CdyCOBlT8qoAV2Q?=
 =?us-ascii?Q?1RKq2GbJY+RtlMOmaM2R0zJ43J1xigaVXy+3g7TJXeLmA7MMKlnNCpIKEs5S?=
 =?us-ascii?Q?eD0TSJb1N0RH2LvmTHcvRx3FM21oHGU/6p2CTwDUN8EyxUkXYKHOGrcjG6lp?=
 =?us-ascii?Q?54OIjPTh+460fEy/jGH/eFf3KCptSB5WbIATGx8Hlg//GbLWaWWEBUg+a9g0?=
 =?us-ascii?Q?2FqdxhbNLyJ1nm+wrjLIcwG+EeYbJGN1Ij++bOIIvvAYuhf4lg3Aubr7al7H?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: L21j1axj6aNV9IXhqSavBW7TMcJqPfjdWR3KZvY49kqQGptBvjNvwdq5Nej0pl1QeB00ER/geeHOnpyzZ4QFn20Ytat4eKBwFRNimvGC7ag+goeMjNoz/3lwfQXSnBlIKM3Q0HYGqEhoe5ABTgZ6g7hOZvCf4if3oVQij9xgXHJVxrnW1C3UTSPvVlXvqNo74K7Cr93qShJJQOYP2kUgvd9QaKbvIVUHi4SLtJM8IeVqbY8rQvHqXqWluj2t4m4g9m0hnompevJEZbNoZOG5oVeWocbaIN8TCvfLc1vLJaP6/cWQioas+DMeDuv5Gn0JeN0t4a5lFBVIA0KZLcaCMILe6+3wUTm8Gy/9h/cvycSU0goxbMoMkuSJkSkTpD0lkX3MiL3K+hrqEq5Csmc8Vy3INewdjtB3DuFUDEiJ5Q2A1JtTYT8+PzeTAU4gGTCIIswlV46qQ93fZn0C2UiHo9Xou32KbelpSXtbl8FKgOsT7Gonz2L8B8ivjaA56Jt42n9pHSyUHnBev+6XZareU4/IEswLWv0EuTTCreA3Rw6MTsD3a0xhzrydfSXBTEbNWdI1VIvMzyX3TxKdaXJsxpzcRW41qTNUzFesJ8/Nvns=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15191a9-4a53-4cc3-3480-08de2230050e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5344.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 21:11:17.4080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCSZO8cRzJ95rt05evNANN+D4s/9Js83TtQIeBTo5Kbxcx7MvviSOKpmaXvju+Osu3vBd4vNnBr6BBsCEmlfdyJblFQBnfB+f0lPnI2aSMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7613
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511120171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEzOSBTYWx0ZWRfX6AVRuhFauGdG
 jIaaauiravrN3zEQqJunO6ppk97EPMNnutTy8QwJcQOtqhIBrxuiE/LgtHzqLef++6zlSAAxBSm
 u350pYHlF1w9kazVyV5yL0HlkQ5r8uskwajbWQSmyK+L4R09bidmcutUzmaSFB2WrYsvJ8/2oT2
 lNWSJNHvrtdY9iN16lwkRjquiVpLmpqvP/JQ2D6ADDkdi7q+dtbYP7RViDNVVd5p7U23UbrXqmV
 4PDfqTRMuhuus4kMFArUKueTtaNRw9BXs8yJ8oNQFmeJBAVUqo0Wy9OOcaeJ/4xDvuLD1v10ujs
 TppyyrHFwcfHjpahs0wBcSffpOVpJXM2hEnWZCODXn3ApE+jeDIoh9wcRYoiUFpIR0VutNbGJ4d
 CCIhjkNKpUm4bWvkRwqdBhdgNAj/Ow==
X-Proofpoint-ORIG-GUID: ws2ULu3dqGG4LhhwVgwQtU4Xk5Z_DCU9
X-Proofpoint-GUID: ws2ULu3dqGG4LhhwVgwQtU4Xk5Z_DCU9
X-Authority-Analysis: v=2.4 cv=FKYWBuos c=1 sm=1 tr=0 ts=6914f800 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=JNz3O4sEs4oywJvo4n4A:9 a=MTAcVbZMd_8A:10 a=UhEZJTgQB8St2RibIkdl:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=QOGEsqRv6VhmHaoFNykA:22
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


Andy,

> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen
