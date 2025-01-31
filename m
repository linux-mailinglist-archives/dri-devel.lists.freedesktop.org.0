Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05013A2429E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 19:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6310E41E;
	Fri, 31 Jan 2025 18:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="OSPatDnR";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qmW3qbaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FA910E41B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 18:30:33 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VI7SiQ026914;
 Fri, 31 Jan 2025 18:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=APK9TXKHuRez9Uo798KK+h4eWqVx6akEX3HBP/qF1nI=; b=
 OSPatDnRo9s1dyPc0cYfaviyKa1LuAES/SdhoQY2bvLghQZaRn0+67L3PNZC/u8b
 NxWn6/kwwlC3JyvXW30viiJEcn12Mm6CMW4HqUWubQVrJ6KOxiYDETNPZ4Dm6zQD
 dpQHyeUt2dINMQIBT0qEHzP/Ccz7kRB4R3iuJPHzY/qLMNei3dwVdig1AkIrU11d
 ZoLxj2DCTV0XnqbQBonnmawvQfRDPhyqzpQKPVIax5SrX/TJxYbIDyX9UX2fdvMq
 7O8Ns+sU9H/Hsvjb3utfIjTKsNKXMFDBw0sVHSErhcHDrxYzS+/NS7HCzNMorXgU
 MkOT2RCYsAa6YPlglvQJkQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h3gh018b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2025 18:30:08 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50VGeuom004104; Fri, 31 Jan 2025 18:30:07 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44gfe59ceq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2025 18:30:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGR97mi8KHZfdNmZABuDSYZ8XjBrF5BWxnUEdUIxwRoZ6vQcUVw8cVlfzWAkQvg0Ub5h/95csS0os5vy1dcEs261cIrwGo3ozTG/Wea9XifpW+UDfg8SLoMZiyDF+XmOltJGCfpDZZT/x/M1qYvT71/5WeMv6KiTHjA9zqhxNcJfI92aAnAZH8DECt9K3azXxJ4DJqoCGIAdimQbZQutLrISLxQWcJLxfXvluOdUNmp44+y8N4fN337uXHV2M6tX4XLAp+p4jKbKy6nxS5qDrmkbOSk5w3FSXspmOoHDxiJ1FCkxTFl+x7ePr9iMU/qZ58UJW8wsoZczLkrRbITAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APK9TXKHuRez9Uo798KK+h4eWqVx6akEX3HBP/qF1nI=;
 b=hYY9Z9emlk1fjl65+nnLtTY5kkcst7/j2PrazQ/Rc9FkBVmi8Ez2eTS8QHPApYI62ArtWv1ENqbd14705H+zOh8BKShyDB2JyRMcsDl0oRzHMaCRt2Nre6L6sNJPbI1QUDw6tJrVtONnVMJihd8ZediRJ0mKZHvTWmHqdnLxWmi7M2+3BeOVcjD8IQHOWOSacro/bJcsDiIsDC7gpUaM07p92l+D8OLonjFdk6Hm+5friJ07uEtUKBBI2Q7WRb8iMI7h58NFCnMffh00tq07gycGTfu5yxlo//o8q5WMfCucNohOjvo69ZxewTfwU8w2s1PInAXjien85nClx3Uf3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APK9TXKHuRez9Uo798KK+h4eWqVx6akEX3HBP/qF1nI=;
 b=qmW3qbaHfnzBjKUJGAmLZ2RUpO/Ob6vIu3aK3Q9ALwnzrGhPmiQ6lXwRnWy+Eg6zYUCilrLGoJde9rEu6F62FuP6utiE6VOYw4z92pVEjsBkTWYcyKeI+tZcmKkIIESc1F6lzKJ1xC9xgJg5/ucjMf60kyvGukOsm/rnYToO024=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB4407.namprd10.prod.outlook.com (2603:10b6:510:31::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 18:30:04 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 18:30:04 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>
Subject: [PATCH 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Date: Fri, 31 Jan 2025 18:28:58 +0000
Message-ID: <3542c5bb74d2487cf45d1d02ee5e73a05c4d279a.1738347308.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
References: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0151.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::12) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: b0668f92-48bd-435b-4b67-08dd42254817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rsG9tLlraMra1fOSdJk/zz6xaXPNxnCErH0ACJwZkkbVRXmC+XDIF20qZXi3?=
 =?us-ascii?Q?ELIM6mXO+bUEf/aajo+JvvNZMESE9ZCSy0OTnEcTnK/lLXDRsadZPF47Vmsn?=
 =?us-ascii?Q?MD846qZMHa3wU+o0bGkz95EAAIcjfW2kEYMQMiQtA/DkwVaIIzIPCwjqhkWw?=
 =?us-ascii?Q?1MXXB32jp+xw7iPUV4EdnjJPOtimw//kyayHgOZtdGn2VvZUF2rFSYgvAwrS?=
 =?us-ascii?Q?B8mpBx99cP/TXJpdA6JpdxFZ87qoEDuxTvC6zfSB1htwrpKO73eyIp1osEjr?=
 =?us-ascii?Q?e4jK/mNP6eYqbCzEAI+/VbI7NF1puvhRxuldMxNckIXj4nTc9xw3SeZvav8k?=
 =?us-ascii?Q?R1qPnVD4yyYO4XUWfjz+AMjrzHWofrXwmKl+32drKvAUeo/csbYBumMiP/Ck?=
 =?us-ascii?Q?D8W95k2/jWZp1epbjyNKZ8JNzW+E+SHgdlTyL6U30sUikdooFYhYLAe7qIw3?=
 =?us-ascii?Q?EY+XoVCSy+zwo9B2UJp4qDuMXTKG8B6v+7/0i/v9HcJ9jGHrsZSkNF4UIGFR?=
 =?us-ascii?Q?Aj0OIn08tR+hNJaqAg+99KaPklN3rXfZs2kuLvcwJJWWHlkiPf0qTuWRJ+DS?=
 =?us-ascii?Q?P4Jl/SSF1JzLXmIGZcUMfFraPuhmGKVCBWYEk6i6s15sf+99My7rZK0M484Y?=
 =?us-ascii?Q?zMROKsK18GZ/60k/gr3IIp5S6xX3Y58PlIl4P+v4EqkH6K/UNsjp9eJ2ESfX?=
 =?us-ascii?Q?c/LmsfhoCeEXTqq15RK+4PJ/khdo4Tu6VxhyPkJiUwsUdBsBTe04Iy+QN5mi?=
 =?us-ascii?Q?+L9MbudO8tm/bV5yAV3CohKeOO+nnGVk5K/NjQ+Be+oa+nK8+7ZKpnIgaJXY?=
 =?us-ascii?Q?oE7OhgaPcITLT/8G4u5yeIcC2DKQQhd/e3TLeZCat5JUMEqJcA1itKowlLBM?=
 =?us-ascii?Q?n6pvelh4LweHnTH9YmoAWCwV40t/G+s40vbBxYWcTx2FmpURDmVlX5rExdrM?=
 =?us-ascii?Q?8soMkm1MAvZ/QJf0UsutgemOcWUIgSbeRtVI+mMjJrb3npmV89hBBf7MOIqP?=
 =?us-ascii?Q?4TBdsGDthhB1wY3ulVJmi5D8VdERr+6xbHAT1AStLiDQGVFdw0nzrjrLtUDD?=
 =?us-ascii?Q?zIQnY58z+jltipjO8yZzCXxvLg25JH4WwHCFyi9jyed9QiIpVP/gq7JhGKv/?=
 =?us-ascii?Q?ebMrwQl/41HcjGl9SvZ34yMklk8PnZHU/yU4Rm1T5BYvS8ZnYvPBNHktZRXt?=
 =?us-ascii?Q?NEt6FsRXR18G7OQLj8NK5afwjufKdaB63uGBZmCKxngJg1CCoyWPwZRTZcm7?=
 =?us-ascii?Q?cUkJrWHCExnUDlTfkmJnCRBflMu7d6KzS3uyQE7xUVvxdwP/mIXX+XSixxKs?=
 =?us-ascii?Q?KBCV2wiKAk6GdHdSddvDYnWE10HJVwHBKqxd8JvByN4yUNyKCS4waw8dDHit?=
 =?us-ascii?Q?C9A6szA/gPoz6ZhUUh7B89zW4YA0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?StAIoSLe1C1AS5CzvhW6N2BYlP7IyLADJ3wgIIaBQ3EbbCxql3/mpzwgQVqE?=
 =?us-ascii?Q?UtW4WQAXMYZp+LkUI+OcvyR+AKtqm0WIs9ZtShpTlN1tS+40F9iXxf1gFZgZ?=
 =?us-ascii?Q?dJ/qZ1atJWHS4WH98/MnlE+CvBcHlHmykQMzMHIZunW9tnJiOSW7hdsWl5oF?=
 =?us-ascii?Q?po1xjJM+fIM37vjfIyEDBiZwETNWEdNSfN8uIT9+uZM1ijjEuX8uq74Mw9kU?=
 =?us-ascii?Q?pS1ISKuRqXpm0Q8Jtr8t2i7BXkpfiaejSOTeKr4RKI+knCLWNRQ9oMfa+eBz?=
 =?us-ascii?Q?xO6LNg6+n8SYoHEbfGERuDsD9c8PmOhGPus/k9tZ9Dm8XY3V93VdbTjCDznl?=
 =?us-ascii?Q?GPq8mFXNXfIOuNcyn6AnjH1wJdZJDgW48uPTx2nRtamg02igSHltnn+gSZ1+?=
 =?us-ascii?Q?rhD3ZP3zjeT2kVvlXXZ4pj/usKhE9gto22qFnyrNyoy/k1NJkqlljdE55xhh?=
 =?us-ascii?Q?Mzt8smf7U0TIAcGGZBDpRmjg38TZBRMcYTOZWor4AqMTA55NdaDqiFeGLXQ2?=
 =?us-ascii?Q?mg8kEVLtuszadZPcFTRQ6f14+ru3L8MNr+WaJjhFLfi+pKcyvXXSafGhNhQB?=
 =?us-ascii?Q?WKlHpieyHL5sFP/BQykqB590ObaqxsSZiJHzHGTMzPvfBNijTA8fVe77kvA/?=
 =?us-ascii?Q?h+XIIX8LRBRwdmbg82KVcXv51QeuJ7FX+RMUCbkMYfFb2otVIJu70s8JVeue?=
 =?us-ascii?Q?JhctIDG7UoIbBQ9RFVuxhqMWLHqD+JZK8TR/qcblS9fxhqU6G2P0rtt/CS7R?=
 =?us-ascii?Q?byKudXMEzE+NqNVs9FbG64aijy0FG3iZYGfKJc1KR9AjobldYyfiR5O0iXlD?=
 =?us-ascii?Q?uMCB8ZcpkkT8/0teD//iP2fN0bVBkU8KcO1Fr9gzaHWyLnB13F/DS8YlGOOs?=
 =?us-ascii?Q?l197beDgJoVZACXpwpmVJ1LFYAobTfZxw4Mv8POTA32JJ7FOLHDNyAgLadhY?=
 =?us-ascii?Q?jh6CR/rPrvmS6nuJHeQhFZ3EnmZWVin8FqAo+fh4QucgeNyqqfG7gl+EaqHA?=
 =?us-ascii?Q?k/+43ZLudtIXUcTWGi8aANLErtpD88X1seLAuXzZumm9v3Ge/ZHXEFBSaruj?=
 =?us-ascii?Q?tI1xlSP+8fjJv2k1eTIYIlaVAkTTHbTAbF4DH+VddQat8fjckY2taHDIDMo8?=
 =?us-ascii?Q?yrUVN+MiFeaKyHA95e+HjKbVN8LxTdySq0MrdYAaGrGaWnT1LY3GOXc8/q2M?=
 =?us-ascii?Q?hgR/Pvm3Ov8JxwIImqpmjd0kCI2E9x2ws0u/ItgSiUjAi+H9SYOlP7ABpZ6r?=
 =?us-ascii?Q?6LZEAhLPnR8QQvcjM+A8KZRTPNSzrbY7HIZyax87uGLbuPydtARHMFvOMoFb?=
 =?us-ascii?Q?XLjs34tEYMEqF1nAxUGhh02noA6vbUMxoTScobY7CemmxcCVRW9Y+DDWFl+w?=
 =?us-ascii?Q?ggQwrdtwhNnA+CT3HwMNmW/uUj+eAEPbZH1MjD2pbpn8ws0VLNdDzeRMRY8G?=
 =?us-ascii?Q?BCDd6UyZwdidWUAFt6d43c47Q+diRNSmMpTTnDLukGJJfZLhJZuKvgsuqpDp?=
 =?us-ascii?Q?JqM5sZoaKVjNWwuP4DD0vhwiwhH3tk0UuKDBxrLswX0+cBY/yGaERrZ1j9Qy?=
 =?us-ascii?Q?LBkwWsCtgBMzqUqjJRbPc3cyXiCrzzotKRnDd6camlzKxsYoq98LysRFkfW3?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: BqkFdtTZBNp5KNNdMPsamRRgYfPBJ7nFWCfnirSvyJn7g/qa5uuQUcUqSLbJyFwrJT4+o1AlQxDtHG1zrL8KRUjZrDTrlN/HSkDSLzv1E+CXFvygqPYy24uy5qujG0gAsdaeYiqRsW8Tvg9+ieJuSNobNrKM5LzoMagWruKxt7In/3UWIocgPGvlFNrlchG5iTdrcObQerwwXUzOwTMOigjVM2al1EE3Xujv+cCbXVOA2ILK92CESmvBDtan4e6pEEAAwzrPcFpyNOKPsogfz+P+C0HwBCPj7Oxn6IMAYeK/tKsoJjLMv/64ClDw80rwtcWwC/eDnP7cxiP/RqXIJaUoERVt6si4uHvYJXfTDERPRblbXiWeuctB35AW8OKXEFx0sCoX50Q34SQs94SaimtyENgQ6b3HV7wY0ATAFtP8ymVdbPwFAJU120DQUmgnDnaL+CdRWUK2khFvgzuDStnhiPXRrICOiTEHe3oKZo9wzgtlo8XucMG7Of85kPggF+9meAnYtDmcU18lDM11CwVbckA1n3PBkc/iZOn9qkalpSsSFKkw32yTLYbzhacycd2KnW2z9YiaIW2Hmlq9hZZmzTz95mjT8NMgHMb7V6U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0668f92-48bd-435b-4b67-08dd42254817
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 18:30:04.8050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vfn4+cHAhHrTO0ecdLEajCSYELviMv2yYmFPN3OPBuISEsojEHgILhRdP7ysjQp6q1IvU249a3Rzrb/pQhpgU6gw8YwBPcoKrW67ziAieM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4407
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310139
X-Proofpoint-ORIG-GUID: 6gNRA5KC0du6BI6IYLCuvkP_aH-qWYUj
X-Proofpoint-GUID: 6gNRA5KC0du6BI6IYLCuvkP_aH-qWYUj
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

With the introduction of mapping_wrprotect_page() there is no need to use
folio_mkclean() in order to write-protect mappings of frame buffer pages,
and therefore no need to inappropriately set kernel-allocated page->index,
mapping fields to permit this operation.

Instead, store the pointer to the page cache object for the mapped driver
in the fb_deferred_io object, and use the already stored page offset from
the pageref object to look up mappings in order to write-protect them.

This is justified, as for the page objects to store a mapping pointer at
the point of assignment of pages, they must all reference the same
underlying address_space object. Since the life time of the pagerefs is
also the lifetime of the fb_deferred_io object, storing the pointer here
makes snese.

This eliminates the need for all of the logic around setting and
maintaining page->index,mapping which we remove.

This eliminates the use of folio_mkclean() entirely but otherwise should
have no functional change.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Tested-by: Kajtar Zsolt <soci@c64.rulez.org>
---
 drivers/video/fbdev/core/fb_defio.c | 38 +++++++++--------------------
 include/linux/fb.h                  |  1 +
 2 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 65363df8e81b..b9bab27a8c0f 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -69,14 +69,6 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_lookup(struct fb_in
 	return pageref;
 }
 
-static void fb_deferred_io_pageref_clear(struct fb_deferred_io_pageref *pageref)
-{
-	struct page *page = pageref->page;
-
-	if (page)
-		page->mapping = NULL;
-}
-
 static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info *info,
 								 unsigned long offset,
 								 struct page *page)
@@ -140,13 +132,10 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 	if (!page)
 		return VM_FAULT_SIGBUS;
 
-	if (vmf->vma->vm_file)
-		page->mapping = vmf->vma->vm_file->f_mapping;
-	else
+	if (!vmf->vma->vm_file)
 		printk(KERN_ERR "no mapping available\n");
 
-	BUG_ON(!page->mapping);
-	page->index = vmf->pgoff; /* for folio_mkclean() */
+	BUG_ON(!info->fbdefio->mapping);
 
 	vmf->page = page;
 	return 0;
@@ -194,9 +183,9 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
 
 	/*
 	 * We want the page to remain locked from ->page_mkwrite until
-	 * the PTE is marked dirty to avoid folio_mkclean() being called
-	 * before the PTE is updated, which would leave the page ignored
-	 * by defio.
+	 * the PTE is marked dirty to avoid mapping_wrprotect_page()
+	 * being called before the PTE is updated, which would leave
+	 * the page ignored by defio.
 	 * Do this by locking the page here and informing the caller
 	 * about it with VM_FAULT_LOCKED.
 	 */
@@ -274,14 +263,13 @@ static void fb_deferred_io_work(struct work_struct *work)
 	struct fb_deferred_io_pageref *pageref, *next;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 
-	/* here we mkclean the pages, then do all deferred IO */
+	/* here we wrprotect the page's mappings, then do all deferred IO. */
 	mutex_lock(&fbdefio->lock);
 	list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
-		struct folio *folio = page_folio(pageref->page);
+		struct page *page = pageref->page;
+		pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
 
-		folio_lock(folio);
-		folio_mkclean(folio);
-		folio_unlock(folio);
+		mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
 	}
 
 	/* driver's callback with pagereflist */
@@ -337,6 +325,7 @@ void fb_deferred_io_open(struct fb_info *info,
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 
+	fbdefio->mapping = file->f_mapping;
 	file->f_mapping->a_ops = &fb_deferred_io_aops;
 	fbdefio->open_count++;
 }
@@ -344,13 +333,7 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_open);
 
 static void fb_deferred_io_lastclose(struct fb_info *info)
 {
-	unsigned long i;
-
 	flush_delayed_work(&info->deferred_work);
-
-	/* clear out the mapping that we setup */
-	for (i = 0; i < info->npagerefs; ++i)
-		fb_deferred_io_pageref_clear(&info->pagerefs[i]);
 }
 
 void fb_deferred_io_release(struct fb_info *info)
@@ -370,5 +353,6 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 
 	kvfree(info->pagerefs);
 	mutex_destroy(&fbdefio->lock);
+	fbdefio->mapping = NULL;
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 5ba187e08cf7..cd653862ab99 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -225,6 +225,7 @@ struct fb_deferred_io {
 	int open_count; /* number of opened files; protected by fb_info lock */
 	struct mutex lock; /* mutex that protects the pageref list */
 	struct list_head pagereflist; /* list of pagerefs for touched pages */
+	struct address_space *mapping; /* page cache object for fb device */
 	/* callback */
 	struct page *(*get_page)(struct fb_info *info, unsigned long offset);
 	void (*deferred_io)(struct fb_info *info, struct list_head *pagelist);
-- 
2.48.1

