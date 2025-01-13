Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAADA0BEBA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D9910E03F;
	Mon, 13 Jan 2025 17:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="e96Hy3F5";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KXca/In4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5DE10E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:18:44 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DHBUj1014660;
 Mon, 13 Jan 2025 17:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=vWnhXBUzlj2w8EQE4s
 lnlZmrEYSKQW2nUZj+ye147mo=; b=e96Hy3F5EMCcRmP0i7CkJQmRqatj1cnHIN
 gPiF9Vw5ddC44OWZezrvTikKjmxtmQoXqcrXsfRTAjWCsiv/aNAS1WNKrWQywDaE
 Ca7s9Kfd+ImY/Kq1tOplobFG6yRD61mJvI3OsNpXVA5nYNwmquPsCNkXZ/4EAHXc
 Xxa8VkeTA7+LXMOpieKqiJMo+uo3PBOA4jtaRX2fz7MHVhP8THBtjvr39RTRy9sS
 emtolzG6bB1JbJ8tL1ZzycL+p7tMIO9NKTom22ZXlMxeHAt7hS4JcKAituJNY0Xe
 Tny6GYf6qdCKQekCb92VMChIthIy4uYm3kHXdckLt2uSAel4s5Jg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443fe2c5v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 17:18:34 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50DG2ZDO029847; Mon, 13 Jan 2025 17:18:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 443f3782gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 17:18:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHHnCpYZOU+WA5w0xupOQC2zIRVcMChu694yD+UWxy08zUtAvNhUlu2s8a37AVqQFD8NF4ZEvBXenJ/atB+hjuJ9s882fRN1IyyrUbPhQQSDMf+RD7RcU22tH5hbUECI8hwWLZOVpjX9qwkO56mUc8WOOHRStuBKPWL9jdxcJ8TgrNAkioT4cod/BbNg1KjkHSsNWjlPRpz7+8SFrP7Twhqfvf4LSU5lfQn8qzUI8ToiAeRwd+z7bWFzPJboJ0r+0Qk10SZ9zLuItBzAkjLhC/K/3gPrVEq9U2buqWTGEMDHCNZrDKZY0ROl3FTVscUDcFXvgt12DAwzmdY4FkheOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWnhXBUzlj2w8EQE4slnlZmrEYSKQW2nUZj+ye147mo=;
 b=Ezb0Pm7MiDqOie1nkU89fYWztBqQMAFMFnbZKiH6tjUN+gQKR2nlYsktCGEkSaOiWQWtT1fOfsfDmTYt5KWs1Kr8DVGcwqCdSnmvnxZGFG5ewl1VgT7py/SkpgVKRwPmpGc9KBx13/4zAIqCAlkH7cZhFSPNvWv0OO8kXZEOcySBzE03VIf1VEoNdZx3gvgQic3iRO3uEgqOffwmr0SOdi728udCcgqwUc6t8jgKiKjoLgNRjaAtrns8nJq5twRncUseTg3JWdOJLR/lVzrPnuJTcQlymGskTaseeHmvsXiRtoCzRNkRLZz93ANebjMNiGFC/XRGi4FdEnWYCWWJxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWnhXBUzlj2w8EQE4slnlZmrEYSKQW2nUZj+ye147mo=;
 b=KXca/In4qkRfUhVN/OX9mmyVBOuPViceNh0YcXH8wlHOrixQGVq+Iw+hsWPcEPe34qz8/CwXfdpCr9f4bb7ZweGUAjDzNDQcrjfcqg+Sx4kh1HwlAa/EzcgEAcwRIOb5kJecVtaQCgCynsTrGWhcNjaJBF8n7jE4S/dWceu1h6A=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CO1PR10MB4721.namprd10.prod.outlook.com (2603:10b6:303:9b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 17:18:31 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 17:18:31 +0000
Date: Mon, 13 Jan 2025 17:18:26 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Message-ID: <2e80e8b2-0bfe-47d2-9388-be077af04e37@lucifer.local>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com>
 <Z362xoQMxQRxYUlJ@casper.infradead.org>
 <b7465ad8-50ec-490b-a62a-e535e0a4691c@redhat.com>
 <Z37mE7NdQu-ZgBES@casper.infradead.org>
 <34ad8349-c4c3-4370-a662-324fa91b32b1@redhat.com>
 <Z370QO_Qq8-g4DZ6@casper.infradead.org>
 <9ef12649-7e82-4b5a-8090-e0645ffbf3dc@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ef12649-7e82-4b5a-8090-e0645ffbf3dc@redhat.com>
X-ClientProxiedBy: LO4P265CA0197.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::13) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CO1PR10MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: a7679bbc-5fd0-4bd8-66bd-08dd33f64ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j6FaONniS8S/9SgTLagriUCfGlocMfBzQasGa6oKoF8sX1qHPapKroVjk03X?=
 =?us-ascii?Q?lh4hoQGtaKs5h2nobed8EztMN2dvMzMOeM7QHFH1s6ZLdGVyNy8I1N4No2sq?=
 =?us-ascii?Q?MO0I+sXB1DoS/LZfffEm7qMNLopXkYi9J9kbM/LMES65eszwHLRq13imrkq5?=
 =?us-ascii?Q?jMlN9U/FW+ygv/kjkzUxodXqfpnIOtC4ECvAV5+i6pA0eJYmjk5/lw5gkOPP?=
 =?us-ascii?Q?5UW10FPzey593KjUM2eGAF2vYZuor8Q2IkoGAwfzK2DM7z49A8RQQ29me8fu?=
 =?us-ascii?Q?3FNqEtdq6vAaAG9uk6cSy55iUlmpLOxjxKH5PO9qT/MKPtScb2pFt5sSfVL9?=
 =?us-ascii?Q?dEJZgOoc0ySXCAmDxuymxbV8B5rgrMIzz13e0KMIPH2opo4M+FGcH9M76Hz0?=
 =?us-ascii?Q?dExBQ1InbEvtpg3qzpDqZ5Ucz4+MhR7VTdvCvKo9m901K3crc+FUh6mNHA6r?=
 =?us-ascii?Q?tjEBor1m0L27S36QJWw7dTv8uABfbr5BC46d/NjtxUVwjXpVEeIqJza3w2L6?=
 =?us-ascii?Q?L5sbGOkYga0fxGvMeAwVGhOI1SUcbjBTAxUSvUUMmVKw2+XQTwVUdib5n2gc?=
 =?us-ascii?Q?rRmly8xs9XEyblFc3tXvVGvLOdMPWgB5V86sLIngtl6FvzDbWHbGUZa4DfWB?=
 =?us-ascii?Q?q7Vxq0jnYuk0NGrbp6wfGtkaj23yKn059dqlwRk56G1oRFqKuPnjNley2K4y?=
 =?us-ascii?Q?AQU4+uDmnKQ+iFC28EHQ1Tg+tguRIuM0iNHP0detybKcjmrLiOnCJ5lqUBvm?=
 =?us-ascii?Q?HIbEVK1DsK92P69gTVK1TCVciZdPw7zF/cOeLZipmlRWS08f/zQWII6YCcnu?=
 =?us-ascii?Q?R/o7sp7CwyZQTWV8tOV8Nyab+yES9hoAZ7bQyEbFGvFuJL2dk5Ka65fDfmFZ?=
 =?us-ascii?Q?CG3FXZDexu4pDvBOaWsyqetgZxhshnLbcB5s7BDMjKsZaI1ok35/b0gTfXKJ?=
 =?us-ascii?Q?Huq70mPdOp+W4LdaKO+clr4eH5z0Ocg6RCFQtHfVbXmz/V590DP346fmeGt9?=
 =?us-ascii?Q?OHGI7ZFnGwyxsT4NKJk8/PTtTFxN7WeOiuOkgrOvTaWqpSGjIK2i7BXAV8+r?=
 =?us-ascii?Q?6CCLjBsk1lJ1kfzMcpai1+rjuwyXrEmJug5OWnNOkOEbsHdHAP2K8GAu5Gwd?=
 =?us-ascii?Q?QzUQRwuCszHJ8a1qZB+HI0gxtcKXs3dheIeVyfUBAbXk8gNnlE9dfscBDczD?=
 =?us-ascii?Q?OHpfhLoG0hJHKpkdyg6/u5lJD9CXG+aFnSHCiJ/DC4+fZ+BLi+sR9Nk+HC7r?=
 =?us-ascii?Q?7YVtWy43ZwxoMJ1C1dqqtNXhfN0Nb8/oiFAGiJqi3szmU6CRrqxcLKHcfTbG?=
 =?us-ascii?Q?pLSn+ckc8DEcXwZ+49yjwa8XyEisJwd5HwkXRlR4WhG6rSRD3PK6h3x7uVw7?=
 =?us-ascii?Q?ZxYidpRHI1T2aEtcNVqAc1esW0qz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Al3gA1HUfOu0IQsfOEM80yd/26zbAiBrbiWQ+n0kUDBAAFeMm4RxSleswiPk?=
 =?us-ascii?Q?GyD6gWHdR88otRbjzfiC0PCU2Xx+e2SNthrngmLTCRLj+2vSIhQDWm1nxEqM?=
 =?us-ascii?Q?kLnYV5qHjzYIQ8sShJzMcrM+uefDr49AMa/047xKauHS3nHcqNIxiLrxthgT?=
 =?us-ascii?Q?Gh1b03R/KP7+2k1aSaJtUO8tH34PY5fVlfak7J0cEsswk4U5Tu6e5WSbHbsj?=
 =?us-ascii?Q?vmKeuoFTgqOJf/P51nFbeizstJQ85SMmhYyatCYs0QDdVwD/abLpFBxjp7G3?=
 =?us-ascii?Q?q6AntG+pafR8sEtlOzsz00ISPefuOhDbYm7njVSwHDzhEGhaTbNWpd0LGr5Z?=
 =?us-ascii?Q?yfbYYbYSUzWBw0jijtSpch7LRo6s1kW6cpb24pbnhbUeVtU5EghwL67C53vA?=
 =?us-ascii?Q?H4p9S6r7qQvIljsddoxpg1xBkKA266zVuUOfwbMXhNHQ865xk++ykz6oBMUl?=
 =?us-ascii?Q?Vph66PiIk+7pEQZ3/JdxhX7wdDFQIscxkAwh3xDew8P/C1C21iB6oitoPbdq?=
 =?us-ascii?Q?N4y7KZ1JgDvPYNNy/rIVQ4xvqvIlp82E/Ttiru2OQ4ij7D3pek9khmSV5j5D?=
 =?us-ascii?Q?J3MJ4Qhyn12gFuCK4jKTfM+jmwnwggUAqLhiNAtvu0TumPk1BHCCWP38KtOZ?=
 =?us-ascii?Q?2jhQoxSi/UqUEo/NgwUwhVMcqoRrf12z8I2I9S25BkCi2jQGkC4q2Ljv7/8k?=
 =?us-ascii?Q?lMi3H0Xc2mprlT91zCC/g5wZC6jUJ2oLftMByMsYOtietyiezJf0x+ddcs19?=
 =?us-ascii?Q?YkN8ykRapmgrZhLssY5/dj+yN4Jfvb54HD3S2ADZzCfeP/m5HSGxsBOI84+O?=
 =?us-ascii?Q?tS1uvJ7Cpo2FLpBvGu79W/PY9iNZG93+uI+FDDrhZKUhNzXsYvhP4f9+GwLy?=
 =?us-ascii?Q?WxH3ySJdTf4bw4wO8/OAQUCydByBVCvkmvyENixURu3flj7Te/chzx0+xLi5?=
 =?us-ascii?Q?sWYGWWubVVlfLa/Y86zDpCSLCkILj3NcIYHkUDwtEPMIv6S+UKVEyVJt8q3U?=
 =?us-ascii?Q?G5/eee/aVVYIzbpkELRjztAnxJYa3TXDSl3RJkxY9gGmOKLqS4tAWIWrkKOl?=
 =?us-ascii?Q?VhSe+luuN2/DmdABLQChxwm+4sZGqdWwIdSM8I9QspAyRGYBrudZJ1jT4GEO?=
 =?us-ascii?Q?LnDkxvTXewi5s8Ny+DcdP1oz9LMo6cVCa/xfdO4VekZEFzM34Xu5majgU8B3?=
 =?us-ascii?Q?CT0VdJUZarNki5n5XzN1rAkaSJ43llrxvn0HtFOmh2n3pCGrgx9yRwaFELnh?=
 =?us-ascii?Q?5d0zOHL0ASxiid/9R9ZR2JA+cF8Yi5tpdl4vq1Y3aDh5Ieh5M9sHATv2j0+k?=
 =?us-ascii?Q?TEJt4QiNpXiw/v28uE4nqbPq5rZ4Z2RAdFs6sF9bUVXCi8CpzbPzMhxTmdFY?=
 =?us-ascii?Q?YSfxUf2VMOnDkm2pWKlpiXzfT6XNwp5wTqrW1ivq91AnP7rpNzHHc/bZNJAw?=
 =?us-ascii?Q?nME5tGvQ4hj9IUGhoPHoM0DN5/4IsPoqtqUpg+Fbaj3GhFAKryRPCDzcFIIx?=
 =?us-ascii?Q?O1U1gw94ktEmeFlQAJSWin/0AN73Mx/reJdWWSo5ygymW/+0fo+tZzW3sD6Q?=
 =?us-ascii?Q?kh/JqN9XOENJcJ7RNa/nOnporewwa0VfZ1hH64zVO6jE5o0JQk2XLNZSbVRl?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: WEQGj9eE5t/IcYhOjsSIsmzRj+ehh4I6AaXBFC1xc8zCZgrNtLlTeKAySurbKvBOMFBcIqbG6icxTuL+TNlVZXQt83qa0LXil7LWHbaCIq2ykvYWBnrCnAFys3ehn6H6PJRsJYCYnSRduPr2BrHDjaxU97fHMlfMtRBuYNvKRYrwcYiCFqOWTXnHLDZ0+iCOvtpHvYNd9lvEvYqyxLOwWq9eY5yRJq4AkIyeyl/KMHeGxaUG7ouo0OxHZuhEFHPEsMQh3P8FpcW05Z7SVukVXa12acNq4q8gGhDhkW7wxZWylkM2Q0I88RuVBsoXtOXqrgIN/PbNewZr5oWi6VjTf2PzLQdSF0QrSaPRFAXkyKNo67IgdBHmq29bb5NrlMmXIU0FpbVCe7woT3z/iquS/TX7SeWkAS11stGU7ZFA5XuMnteJFISr/9af3lSweFsEfOtXvKKtN8J0qepB2hdMHmJ85WaSDQgJuURZxW59AyMcJGGi1vDCthR2MWllw+Cd6rvVBGJvLFLRI75pTRq7WK+g4yOgXCkb9RYBOCVuNIpYOeRn0fZvtMp1nUokomaju7/x7B+MdLWT2pIUpIbh8+uo6bgXTg80Vo5iFBMS62Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7679bbc-5fd0-4bd8-66bd-08dd33f64ce3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 17:18:31.0828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfOfNnHv4OuBrrW+5e0RWbCJQpeHSLcAWcRcz78q5Z5CdijgIneE4kxb7FbysZWKMHgDg2J+Jfrky62v9Sb3RNfvNUMxPfcywZVR6sW0xWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4721
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130140
X-Proofpoint-ORIG-GUID: huYcRugOQ_WMo-GVS877LQZ991PcieyG
X-Proofpoint-GUID: huYcRugOQ_WMo-GVS877LQZ991PcieyG
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

On Wed, Jan 08, 2025 at 11:02:57PM +0100, David Hildenbrand wrote:
> On 08.01.25 22:55, Matthew Wilcox wrote:
> > On Wed, Jan 08, 2025 at 10:12:36PM +0100, David Hildenbrand wrote:
> > > On 08.01.25 21:54, Matthew Wilcox wrote:
> > > > Not necessarily!  We already do that (since 2022) for DAX (see
> > > > 6a8e0596f004).  rmap lets you find every place that a given range
> > > > of a file is mapped into user address spaces; but that file might be a
> > > > device file, and so it's not just pagecache but also (in this case)
> > > > fb memory, and whatever else device drivers decide to mmap.
> > >
> > > Yes, that part I remember.
> > >
> > > I thought we would be passing in a page into rmap_wrprotect_file_page(), and
> > > was wondering what we would do to "struct page" that won't be a folio in
> > > there.
> > >
> > > Probably, because the "_page" in rmap_wrprotect_file_page() is misleading :)
> > >
> > > ... should it be "file_range" ? (but we also pass the pfn ... )
> >
> > I don't think it's unprecedented for us to identify a page by its pfn.
> > After all, the acronym stands for "page frame number".  That said, for
> > the one caller of this, it has the struct page and passes in the result
> > from page_to_pfn().  So no harm in passing in the struct page directly.
> >
> > I would not like to see this function called "rmap_wrprotect_file_pfn".
> > Files don't have pfns, so that's a bad name.
>
> Agreed.
>
> (it's too late in the evening for me to give any good suggestions :) )

Matthew pinged me on irc with mapping_wrprotect_page() :>)

Am happy to do that, will respin in a bit anyway...

>
> --
> Cheers,
>
> David / dhildenb
>
