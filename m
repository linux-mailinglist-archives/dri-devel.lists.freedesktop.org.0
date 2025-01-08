Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78450A0618F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A200110E8FD;
	Wed,  8 Jan 2025 16:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="HnkzlrAR";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="meDnnRm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB13D10E8FD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:19:11 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508FNHhu029687;
 Wed, 8 Jan 2025 16:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=corp-2023-11-20; bh=XExai2ckpUwM4QT6
 lviAROj72VP8nniiLFVILESIfjY=; b=HnkzlrARGaFIYAmQFWUXPmh+AXeLf7e4
 iQmyI/LVX6Ds4hEe9dcJVuBWj70astps0jmu/ZDFcJO7kp8M5iYWbIQ4wS+ULGKC
 WC8v01wCZZggLAH0xpS98Up0y30wlPmkP8Rhu1Dm114PljATeJmTCeN9Tj3jjm6D
 nM6jAro62Zjdlflkt30Aa0ZH1kFKxMLqqd7jkKmpkxUpv85fI6o1Xv6VD5Qp0Ylo
 7VL6aTsizkdHf+H1ykY5RHJkP4S7xKcHPUFWSjasFS+PglMSaTEqCJ/88ufSODqJ
 0WJVJC/3YmRYhewxSmpqhl0ZsK2TtjjMXZRhtNLSnOgfyQevmK/Amg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xvksxwx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 16:18:56 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 508FoEIb019837; Wed, 8 Jan 2025 16:18:56 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 43xueg9rj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 16:18:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBlPGiABrltKfch+v58BNLPpqFnQJsGQSKXuKAVMoDyoaq4Ha4hIhboSHXNw9aqpsBy/XYzPOLIx45SW5k5oEM/hjQM2oaDq9g2wRHaa0PJcJF/TdzkAg5mhcy8oQMOKDIYYLPFJxL/zqVvjPUr0FSP/zrLsk4K0ZnM+NWlrKGddYVCwWkmz16y1B5NDQBYPHPg4rzumzzX+jaQjsfD3UbFHeiur356oMCtT30tRLsHCtN8RxEP/NcR5Dtlrz6g6qf/+9ojEc8t5Na1eQJtetmnKtv8mV9hECSBNqnW3myzmRnX5UO2IsY5u+2j+ceziwi/0IwyCFTpcCBMyIg8fDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XExai2ckpUwM4QT6lviAROj72VP8nniiLFVILESIfjY=;
 b=ijn5zqvq909b/K9pErnyRg+spdCWr3tmp+BlaEWtQC15bIckLRQmJkDikFJSplqSVBiFm4Rwb40Pm+T0qajgU+b8A0+JTx6GiIvb1nuCvkN3WSXCnnAFZIx0DkMejIXfQlbPFfe3bcfKsBvTM0jd8Zlto15zKEKXDe0xV5uziCVWT4b9O36stZgHQJESdX+nN9XNp+YiMgWkxLS6rhK9sp5x4vnlK4dw64Vui/WiHP1Kz9SwAyGsTMHY0uo7MCATJjcuiOQHfpl0oDw67TX/UA7yT6RNjQPyr3j9rY0jaEVNWQvQ8BBxCvTSzlNnWJotgHVwxosO1YAMIDikS3P9Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XExai2ckpUwM4QT6lviAROj72VP8nniiLFVILESIfjY=;
 b=meDnnRm6hPIJV3Dr5gms60qHAeB0pnpQZqDlBc7g7F4JDoatOQH1CVnPcpP5VOTdPR+xeUuGmkFEefCr+wMcCobdZaFc26DIhY/V+aw+3q5x+bcTJtvVHqlW2oIKLMX8nxknv5wGuu9T2AkzqJWrk3NkbgcnKWnYwpRzScSzQPI=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CY5PR10MB6046.namprd10.prod.outlook.com (2603:10b6:930:3d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 16:18:54 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 16:18:54 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH 0/3] expose mapping wrprotect, fix fb_defio use
Date: Wed,  8 Jan 2025 16:18:39 +0000
Message-ID: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0619.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::19) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CY5PR10MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: acd87954-f2b8-4fe9-2cd8-08dd30002560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?87VarG40nj+EoaJQ0fNUzdo37KdGpxDeM8JKlQuuAAlae3lUuxsNTEpFgucq?=
 =?us-ascii?Q?EQBDJSI/Olmv+O0P6gRiOpx2D4jSYAW7w8qHysOeDpiXJZx3Dw2w3Qw+/mXD?=
 =?us-ascii?Q?9g9TSTHvXv0vgiWNtlam9rjlwBm7x9u4HuG1cpbr3IjbN9v+BkAo8SYqMUrz?=
 =?us-ascii?Q?cj7bnL3quSDKynQTjJ60FWAFV6s4lRN3kjGXPDZ+kdXHdMrnwwMVPOyf7Kqy?=
 =?us-ascii?Q?r/lp/jPf5l4gKGZwke2yj6ZY4n1JRKQv0EpSBX0Ls64Hm5L6LOfmzPTP47JC?=
 =?us-ascii?Q?hJ1gSQeRRCX8LeEEUUsJwWO3buWv0S2vLpGsmOwPV31amScZh4C5TF3mY4nf?=
 =?us-ascii?Q?bzLpBsZvmI8FTZOTaf+lb1u8wu5MwJvNxXjyZwhVISJHtg4A8njXvEOpRILd?=
 =?us-ascii?Q?0XMsOIXmByQacg80T6PRaSXQRm4JnjPZC85B+CkBFhd6aUttwJETN3Tlcxaj?=
 =?us-ascii?Q?Baz8WhUzF8uIi1t6anzTSARq5isfwhhGpHIWZlv6E8jwc6IV/yFrM2MhR//Z?=
 =?us-ascii?Q?LzQIYYRIYkoLIRnPwCr4epxihQeZQr6/7gKmYe0Rq5D+QjnNzHXc/AAgb8cz?=
 =?us-ascii?Q?d/UtczEQrAWmuS2GrBZqdKTOt9qZQAwlpA4IoVZ+p3kncqLZSlIcIRGR4qvV?=
 =?us-ascii?Q?quleE4C1e64z8aAw2lAN8wIepYvV7srBgLxZjhkHn59F9G4sCaiS59lUr6OV?=
 =?us-ascii?Q?Qy4f7yGOs9kqwccu3AlXGhFk31hiyGXya+T1AY3OjQCKIxlmHdsq/P6KZ059?=
 =?us-ascii?Q?xdUp/DKi0Q4VbTanU23i5B2YnPL2taygvhQZCmatoi1xxYGk/cnMOFUYvBMv?=
 =?us-ascii?Q?O6sLmGQ1jaSNGie4cUyfyO+EyOlYjQQEse9pfxB129Dp2bs42Q64vfEAhEv1?=
 =?us-ascii?Q?tEbin29vM50Dr7N8EwZbGQVs3aR09gszkhA8ymLpb/CJhX5syGXKm3MILn9G?=
 =?us-ascii?Q?i/iV8IrsKjbqAIEDvRA/7Mru9F+CPOsS08etUgH4c9R3Tpqgotlgyezwla6j?=
 =?us-ascii?Q?j3yt6jGgJ2LzqRnhZs5hBpngNefN/XQfsXXB0JLc0mDwcvuOZT/Z792apiZK?=
 =?us-ascii?Q?HQqJmmrzg01XubOQ1auJmjSk5mOLwNfTfzNJ9OMKr8iHXdICgAEg58brEKB1?=
 =?us-ascii?Q?6NX/gj1LURIQTlCprBJMyjOvLblhOU/7/2WibIYa3a5snv8Fb2hNAiQRD/Yj?=
 =?us-ascii?Q?XpJMANqKFs8fMHrIFwtNsRSN3KKlSLl1d12JWDLJf8ujIksie1pEg7HYXvdV?=
 =?us-ascii?Q?EsI+eDHrq7WIr5/BXeI12qGoJQ1qyiZ5PqiRruikyrlc/hMJSf26K6z+C8KC?=
 =?us-ascii?Q?ZxlKPzXZGd9SARLVK18E7Mp9O+5xD9rC8SRiWHA3wvNqw8qaSSMaQp/KDhCo?=
 =?us-ascii?Q?X2WIedGkWtyNUiVBAChMahzcyWLY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AVzm6IuqRF0SU8GP0xeVQSbCpasCxLe4YBUFZ7bXfPPGh9J2rTr/JgPXVKuK?=
 =?us-ascii?Q?6yPyNojH4JQSAL9MqxHK15F/ZQgmXfi62vZPnVpXZ+/FfR2+cs5e/GEc5Rvr?=
 =?us-ascii?Q?Ax98iTnu3Fxpb4YJLJHWmx42+ZoOYMIVRrcs+V5v0XjpHwZkF3OdlI5LAIRy?=
 =?us-ascii?Q?8a2XViU2xKhnN4UnKrJA4uKjuFwRc99mjIjcHYXPHoYaZbxH1YRy0njMoYbz?=
 =?us-ascii?Q?MY8oloS6L14dJ+tyNFLSpOAAWrQm7YcbgXQOP9RHmoXhgrLor6L1rgtV4Oqs?=
 =?us-ascii?Q?LIbwGu5UtF6vAGnAjx9SHWm3/YA1aJx0kzJWlff5lLdittWSadlrzebMTIu8?=
 =?us-ascii?Q?e8hIU3Fa0kzk1T/cJ7+BIYMYJ9C+wMMocEPWMh/8L4JPPtGygxS+zDERk5Sn?=
 =?us-ascii?Q?0lSNSYoEQ9qszIFHJlm00/hRAtGkjIb/GPzr0j5uEVs8j7OkCoMKpBDxuhhi?=
 =?us-ascii?Q?p4YaI6c+xRixczNe6+S2hK2fyUKeMSTPwqssPyUcfMeDxIfQDzOmBcytVOvF?=
 =?us-ascii?Q?L94GlTafu/OB8aUqYRPjkthiyqs+pESM13OVP+uiUyVJ+hIzTlDU7QkXFw2H?=
 =?us-ascii?Q?guB8xEW0biH1qXTVxGgN7xHax4sLZ/7KUI07NrLNmBwV8ahF0JzLsu8Ues1K?=
 =?us-ascii?Q?uOaBIfydlLH96gVRPZHp80qxCL6ZZ3unIFqzusQAyfuf1NggOWzRx2h5TYVx?=
 =?us-ascii?Q?jB9uCNR6AO0a9N5cmo0tEp+vSLqRxrVqFTxzLQUiJd1xL/E3Hy4OwuB5izxW?=
 =?us-ascii?Q?8kzXAY6ljevd4IcCCfo66xDXdQipX2FacwABe2utnY7D7mlnUDtUw0kNK5GB?=
 =?us-ascii?Q?9yHuBc2sbO5S1M+lWJIHF1v0bcIVVWaia2QFZ6wgA//WFrnkBILw5yJDSZsl?=
 =?us-ascii?Q?66x8CwcX0PbCKxKjVR8Uk7PREK2HFxom7qUOshSiT19cgPj1N1zbeRsbmuXX?=
 =?us-ascii?Q?f1IaSqQBAMrMa3tncTg3UTW+iBk8vWrJ/h1fQYbze1h8Tz7rnCHMVCIcD+Ld?=
 =?us-ascii?Q?PVVEFIqlkJtmjrguSTCTagkBMMkWv66Rcnvd1z6oYv90/cmdpV1HCur/BeRj?=
 =?us-ascii?Q?4kS97HOL/4TgSHcxjhmyleG6DzK7UaYcAkU9S/Ng2D2iUYMqilZ6W5CiqBfO?=
 =?us-ascii?Q?2z3Ive/s+XWxJpeUU/+5nB24sdSSvuXPV0n5U3FCpgHz8vGVfhg0mC7gxKSy?=
 =?us-ascii?Q?Bckls4G3V6SvxTS6qWkQy+jyStWYCMLI0C9+bWEJqdV2Pz5QxX0oXBSH1j7p?=
 =?us-ascii?Q?zh1UgRqyvCanjxb3OpGLDg9/WoKej6iqYTQWk07tQZNj25MjrjxRgFbL8gMm?=
 =?us-ascii?Q?zH7nQbRcL9Av24ZCWNgjKevu2RxO1rRyhWveAJW6qVtFtiqodEELb2FUZama?=
 =?us-ascii?Q?tgW5A2lPUdoEuphX/VGeXVTnudXNgMEV+hHxwk+37gwnCh+7ZH6SffCf4nfz?=
 =?us-ascii?Q?/7GzM73tSlmJEw5GrUSwdzrlfyma/taI202qFqIEuI2NfAdUx3dvIFPP8pXA?=
 =?us-ascii?Q?d5ewFvNsKuShPZTpmnppQohb/acs4RbhSO0ttNGRg7kn4Ppxb1gFihQ+B4dn?=
 =?us-ascii?Q?Y0BLZ3e7h9jJurMekAar9M4xT18bdEo2A9YfPKwbQ7t3bFEwCEvrHG9Yi5i2?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OgLMwT9u7YyQG7wbQvOCFcUQ37ubqT4lcTyEntI0FOnT97E/XYsuPhd0SuWRC3wvbw6hJitwEzGxenFUKyvjozmR8jl8Q4htaaarmHhCVPso8LMcMpX/G9WhS7l7WFGtjcOVesro1kPIIXS0Zrq6xLQfC996X31kAPlHrZMGEPtFVt8Y7mpNJsfMqdNdQ9OzAueeO//paSB/RJ+cHo4zKnc5jlLS/bWYaT2mtiol31DmOtwvhw9EnfN2UCadqTGcdFDpFkaSMUwnTTZkKJXjqtS9UGsJKi97CRi2TMWc84lzeSTzKCr0hEY5iXbV3ra1E/0H9uloUb5tEK0hFZeU7i7SOxoiNN56dWQwJJFmIDPlbUBIVNM+ks0QQWv7SynIkOQ3lcqnn90gc+4jpbgiYLtylMno/ifW+AHF0u01n0pih1om4idlHmkJN+tv/D555xEimbwZOuyI98j/ZwMj3w77qCeXmO1UW2aUqOTFdtLPcFQUXySVAlN8Fc3bYBhlcWGByO3lyFkXSqKAVCMkmxPiXQD4VP6ErfL78FC2kyaD3f+MMDd6wbTifelKzD5aCReqNNAD5opzqbeG9XK2f3CuR2cdqOY89SENEbS1444=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd87954-f2b8-4fe9-2cd8-08dd30002560
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 16:18:54.4578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxXIJSR3h6/UglK+JrmgJHTWKcoOcbCaEbws4nlRk7SElQ7cqlFcpewuXxo7tCcu5P7QexvKmZU807nyn6lzz7M4dLXwc/78h90jxlxPsvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080135
X-Proofpoint-GUID: 8_PajNkK5h8LulfUM-sTltbTkiZ33_Dk
X-Proofpoint-ORIG-GUID: 8_PajNkK5h8LulfUM-sTltbTkiZ33_Dk
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

Right now the only means by which we can write-protect a range using the
reverse mapping is via folio_mkclean().

However this is not always the appropriate means of doing so, specifically
in the case of the framebuffer deferred I/O logic (fb_defio enabled by
CONFIG_FB_DEFERRED_IO). There, kernel pages are mapped read-only and
write-protect faults used to batch up I/O operations.

Each time the deferred work is done, folio_mkclean() is used to mark the
framebuffer page as having had I/O performed on it. However doing so
requires the kernel page (perhaps allocated via vmalloc()) to have its
page->mapping, index fields set so the rmap can find everything that maps
it in order to write-protect.

This is problematic as firstly, these fields should not be set for
kernel-allocated memory, and secondly these are not folios (it's not user
memory) and page->index, mapping fields are now deprecated and soon to be
removed.

The implementers cannot be blamed for having used this however, as there is
simply no other way of performing this operation correctly.

This series fixes this - we provide the rmap_wrprotect_page() function to
allow the reverse mapping to be used to look up mappings from the page
cache object (i.e. its address_space pointer) at a specific offset.

The fb_defio logic already stores this offset, and can simply be expanded
to keep track of the page cache object, so the change then becomes
straight-forward.

This series should have no functional change.

*** REVIEWERS NOTES: ***

I do not have any hardware that uses fb_defio, so I'm asking for help with
testing this series from those who do :) I have tested the mm side of this,
and done a quick compile smoke test of the fb_defio side but this _very
much_ requires testing on actual hardware to ensure everything behaves as
expected.

This is based on Andrew's tree [0] in the mm-unstable branch - I was
thinking it'd be best to go through the mm tree (with fb_defio maintainer
approval, of course!) as it relies upon the mm changes to work correctly.

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/

Lorenzo Stoakes (3):
  mm: refactor rmap_walk_file() to separate out traversal logic
  mm: provide rmap_wrprotect_file_page() function
  fb_defio: do not use deprecated page->mapping, index fields

 drivers/video/fbdev/core/fb_defio.c |  34 +++----
 include/linux/fb.h                  |   1 +
 include/linux/rmap.h                |  20 +++++
 mm/rmap.c                           | 135 ++++++++++++++++++++++------
 4 files changed, 141 insertions(+), 49 deletions(-)

--
2.47.1
