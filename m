Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BC9A0C516
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 00:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BB610E43B;
	Mon, 13 Jan 2025 23:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="gTIV2vbn";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t1nHS8Yx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4661E10E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 23:01:52 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DMB39L019167;
 Mon, 13 Jan 2025 23:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=J+qgdJh88y4sLbSnT/
 QUcIF3eiqtHKLWTeTtXWFURmk=; b=gTIV2vbn7Up/sQgthF72V0QaNU+kOWZuQM
 vClJ8iXyG0bfWl8qL6uBslGVfPc/mA59qom2Omv3xM6G9jkQ7TBv6saFgx0tuf4V
 uyfXeTF7VHm2MPcyaasjAcjHZeAIvUOwNGO4QARUjN+S5y2WFViyjzTlkPWorc7J
 ege4hMk9UO221v8fVTI8bKJgTASYLi+dCG0fQMsTVSlhpT7R3+fa/LJVFsPqSgL6
 6JxcpSADmbAn1GElC0TmalcfpXoYP/olCVgAD0melerHA2IU3hr3zICdj3g2l70a
 KkHkL7JgzWxrekS8xwg2NLYb2vd75tFjucUWDxyaDLUx32CCHl0g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f2bvr8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:01:40 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50DLW3ch040295; Mon, 13 Jan 2025 23:01:39 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 443f37jxcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:01:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATHomFoF3RYKjKVRxlHRJ+UYvDgsTzxDUjc9VPTXxO3HTcOWSuhU9PhnmjOz7imqXmH+C3iLPnqzeO/rKnlMvQtfyvRS2hig5OdodbgcSWMRXdSGQy3E6JhNPwL7beh8dvlu06o7Cu6qiw199DZWqExmQglOEroV36l9WM7Tb0JwGUkmujeYVyaHAjYXsZcQddO51mJhzr0phu9R7ZN/FYOMiTvdqpE34LPfpH5YAyFLaJh5jryd5ojr11NIHzf8/NHrGTS5OQZoDNCgjsPUei2SQ4ncQeYEZOhPXP8zvcsuZaV1NYN1geIjYyUGwwrsTB2x7qy1fCVRyE3amzOj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+qgdJh88y4sLbSnT/QUcIF3eiqtHKLWTeTtXWFURmk=;
 b=L1jS9mWGOgI3gOOJRXwv64/9JSxw+MNtBnCHpskmi+Bz00tARvSvOWi6zVvaMNDXilyt2qdf1xCSTkWq2jMR40cscW0RQRj38P5VGc9Qa8WXGcjjyK5Kd4pszPRoHVwJ9CofC+hNyqBifRFZKRMkhoXu3lHNJtITOoOk5GQ48OCf1wNqReioQHv/b3a53jxNx/vsAYLPyy6+A8mq6hUsfOTHRM6D+A+2ZpbO90fN8uyGzQS4kuSubQjb3MXCQC5oesTwtAFucnSzrk56Pw/9Oe3cH1bwBSRs6WMsqxf4zJ24AxNKY+sld3Y7dI837yerj5W3GxpwA2zt4A2KhRt46Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+qgdJh88y4sLbSnT/QUcIF3eiqtHKLWTeTtXWFURmk=;
 b=t1nHS8YxOC86kGdM3EeG2BKfoae6TEFnk2mnhaD9r8nmlu/5i5xEo8kgzZOIA4N+iOHr0Li3ns6Z0jpUScwcW6GCWdHGnG3p1OtVupZM8M6OyeMq0GQlPSGANU2RKpLYy98HdWsYdA88aVzRcxxwgTlhHJdIo/rCHVZ4Xqhijds=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SN7PR10MB6450.namprd10.prod.outlook.com (2603:10b6:806:2a1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 23:01:37 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 23:01:37 +0000
Date: Mon, 13 Jan 2025 23:01:33 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Message-ID: <1131d673-543c-4be8-b2a5-0eacfa297ff4@lucifer.local>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com>
 <Z362xoQMxQRxYUlJ@casper.infradead.org>
 <cf2e1d90-2d6f-464e-b8a0-805ff041604e@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf2e1d90-2d6f-464e-b8a0-805ff041604e@lucifer.local>
X-ClientProxiedBy: LO2P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::19) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SN7PR10MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d77b279-4f4f-4541-cf67-08dd34263b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rJ1pARcPLgNyccFiqzMgDjcvxokB1jb5YiW3C0H91aSZsDvrLyFwMLJ9j2qF?=
 =?us-ascii?Q?BVtF+FOYDKEvtcxOK+5GMOFm4WQuTuvm9L+4E8sUUQgac7bXIdGNQw3JdReT?=
 =?us-ascii?Q?hq9tU0UxHnbHenR7LR4Xh3vkM5R8Keh1gl05DDOcbM/+VGVYhlt+ezCDEYNf?=
 =?us-ascii?Q?XwMHx0IcDiPzfomTU/B0/PBzASvpDoqDpS9Hf1gDFudlUTSZpUR8QWQTEL01?=
 =?us-ascii?Q?HHgBrIfWowAfCuHSs3rRv8kX6/Af4BKUvcgH8VYAoPu//M0Xea5NMsD9sbKY?=
 =?us-ascii?Q?sLwa2tnxSlKsiVEDDjQWNHbKlJgVoZeDHEwumwYb5pZwd/d9yYGKeTz4HkVr?=
 =?us-ascii?Q?eV2MssA7pCAi/OMLluZH9x2ZhpWmorMbwysfDcSmnoiDhVR7tkjpEK1gH0Gd?=
 =?us-ascii?Q?NIe6gnagYLfxr97YLRpyBzGcT7lVXhD21EutoEbMAVvTWES6N7MOCq8/akR3?=
 =?us-ascii?Q?HWTwGLFq/TLLupCzn4hQO0g02omjKz4cxAvkdJspCCx+xzDmAW0A2fMxfgOj?=
 =?us-ascii?Q?6gMznxUIvGUaEqhIo9PpPW+7qseLSF4fM1RFZPIWqf3zwg4u/5WrTHfZXOUN?=
 =?us-ascii?Q?RfuyC+7iOrO8Jjupl6WCwCWmgbhlxGrGYHHfu0GMfTou02ZCGvIiL66oCtFo?=
 =?us-ascii?Q?+W4QdgMByrnySWf9g5Uk2RiTjbJ6TXk9aPCBUNwldxtpFZeeziNRfYfU+HiX?=
 =?us-ascii?Q?mDjZwv7bEUc4C4s6H2LSQu3RM0Rn0sgsBKrp0kZzjesvni+/G/YcynBHMWTv?=
 =?us-ascii?Q?7f/EvlnkO4qiwt/5TxmfM2k2WfKJb6W4+R7dhzetczP+2JxFOu+K0DU+bMrr?=
 =?us-ascii?Q?gRyppwr0QoLFWzWYXl9GmW62pAoIVBqgHfZFuRBi//RQMQf1btCV9q4WFnQ+?=
 =?us-ascii?Q?k+as4rRjStwwyD92f7XS1UenX2Ay++lfz2TC5LPOeWxi6zNJKlmFaynLKanF?=
 =?us-ascii?Q?PP0bIdd94s7u8ohqmti2YfdDUD9mQPRNQbSOqzK9oIDG++0I61y/qNwfPk6c?=
 =?us-ascii?Q?xYten7Jiw0oBxT7gyfW5cH8T4RgUDbh18XdZTu2KkzxSH/DKYP8PILoaGfEK?=
 =?us-ascii?Q?i8mvRDYghOHyw5twSh479QGf6BsLVlOZU66ggN2c6pktyJqYT80lcCaq7glI?=
 =?us-ascii?Q?ISKnAbVl3IgguhksH9EnxqgD1FjCqiorddz9ADnIUSzeFquaKLKLnOhsmKIb?=
 =?us-ascii?Q?aqhI0Dmk+9z4DBW/Lj+4ptWRQwlBJq7afOSBbJyFykbv46/JisMjcAbGHhXJ?=
 =?us-ascii?Q?Cz0qJsogdklxHs2Lm8LKHPaOGSZx1K3P7du/rkhAVSrOKRtv/qrr2cbiZEIm?=
 =?us-ascii?Q?aI4RPM9x24oYnMB+o3VAVVjGU+5Uro3LA81Ao/WYpMX4Z8VboLMY+mXFsmf8?=
 =?us-ascii?Q?YVQGy6OTqYU2VlOx/Q08j7JBxO5O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G0utnZlLCF19hFkrjmzE1ln/sJfd3RlTzT7UPZOfJzF9NmBPMpPK+0tSYQav?=
 =?us-ascii?Q?maWWekvH2jaf9eAUXdQ5n8neqeh6x7P3fTF5amafEuZ6MBsKZevUbfuxfZ68?=
 =?us-ascii?Q?ym0kX5aG0BnyBddKCm6JkByLXUvf0ZrYugYsqbsE+Q6StOwrWK1GXyeLYqU7?=
 =?us-ascii?Q?zv2aPOiFwaharyd4tJgOiNG17yDEwKPWQ/JF+biur6GvKWAbxceanZKLoYpN?=
 =?us-ascii?Q?Cic75Y1Q5WrpN0PQWeUrqZIuViM9FSQaPQaYpO9bTVRRpFCQFunWEjOFXf+z?=
 =?us-ascii?Q?gDtg7FuQ8EO/e3KyGZF82ik6rDj0Zp3mkRYJHFJb0LTVkt4GXislWvd8rp50?=
 =?us-ascii?Q?Wo5WjEuEf+oPGgb5S9b6RQ2xMBrb70HSoZbXe/uaTPGBoLZTc12Y8PrJ1GlD?=
 =?us-ascii?Q?a6W8vxx+oflrIHMZLYwkJklXA71U3oIXKshD5pG0W7H2js/x8J2bbu8aPK8N?=
 =?us-ascii?Q?HimTe0Nz5JxvKBgZ3QdtnojTuATRWp3+x+pZnTa1S+1VPqiS7q04AtKcO/hb?=
 =?us-ascii?Q?M6R5vnaEVH/zO5+mP3wib52sd5nF4Al9efz48HgGg8pEsqeqX+0j5P7JdoUZ?=
 =?us-ascii?Q?7ouHOE4eTftU2p/16hO6olG3snCF+6sHu6hmJinAhyQGN9SVgjunN5ooTuDW?=
 =?us-ascii?Q?WR/XZsMCJ+Hh+u6JvddQGxDxYdrQpbztLWTR2sErnknZrtABn8eL/532saIm?=
 =?us-ascii?Q?HnXAXkGSimmIvocdh0VxJJilWiIBNfPwDwIieNZ/Wpn+5OADq9wM2p3x+Ed2?=
 =?us-ascii?Q?KlbbyIpmoJYD9Rov34N5Q1le8M7oCJHummCLm7w6ybxRDa3Ye+uhGwL1k94O?=
 =?us-ascii?Q?cos42sHIZSaOuN1vgpQaa3o7NiFEEveUt3slPExRnfVLhW31EBAUe3My51G2?=
 =?us-ascii?Q?h/fbjWlpV7wckkziDw226Dx68x9ztlTzIPKN4jq3H9kgOS6+dkKLM/kD4+AO?=
 =?us-ascii?Q?2p3OseIopJuhyaf53DoPAwS/h96ky4lL6tgBZrn8/+kosPaeTUeBhDUaqpAE?=
 =?us-ascii?Q?J47Ap+JC9AaACV4Qe1foHShpArH7h0L8anAcY7wZtCQECQUXFYk/HRiqRnI7?=
 =?us-ascii?Q?6TS4K55A1Vo8H0xKqXZtzrZicu9/97gqW1A+7seioEt5A58VOzyNdC0oyWjd?=
 =?us-ascii?Q?LMUCcww/BnaKCVU6RdEwK0hxDu0xZmobqVhcnHbKyndLvpyQfEPwMVG8oW17?=
 =?us-ascii?Q?00UlWAxj34EU1RiDxbNE+9ErIXUicPmXcuiaiCc2cImtnCWXmGVQzvkzyIND?=
 =?us-ascii?Q?XFXmFA0/m5xjjtOZjLNXpC2XYNiXrWsRtMq+tHgy4sqqoluRNh/JN+xKOjLV?=
 =?us-ascii?Q?cWzFD4AKCY+XmA5VRMTOwihVtplq2iOvtLKJP8fVA1cPZwfvyYxNy24KCXVS?=
 =?us-ascii?Q?L5BxuoXfLm9YMQhXlb6nGqKev70jOqAF2XuOwFfjddm7+BwS2QgxVy2D6msj?=
 =?us-ascii?Q?485NwONrku55aODf8aSSW3y4voNpOb0ngjPZDxVsGeTKc/+AGVBCLrvvHeqQ?=
 =?us-ascii?Q?HK139LeMJMhKeOYmYurQ6ydAJ9CIhxYLLr0akSIOEVjU/gKu5RqJC3aihqR7?=
 =?us-ascii?Q?AEF7MYGKoh5UUiKyBcKHT9tXzZ76X9nQU5KoAL2jxHjiGVSNP1kvj8DAKRKX?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2RLv8U34ADFnaoqJ3gYOFPzyErBdSJISuv6IIBGOn36N8CbzjNAG0s2Fk9RQrAu0W8Li7EJgYTIhgZ89AKLJGp6L7yA3xbmgj+PyGF+UIw/AxJU2MpxoZVDgdiIuAgdhpd1+etIYRO4CajaMcZc5GP58CzXuUFHloJ/yEt47rYJvK4pOnfX2rmYbFLolGrYGopZFubpWvzk5yYxpTV3iNrfyRbeyRm91VrWfK3xkhPAqYp3+ZeOYYf6NBcd+4eaebOLlcOQ6dvBTBTDE3SO4bHTzzhwRDI9x8BmNDYGyfPQa8kNyy/sZzVhjoiB241zHjukIzq65q7JYbZLfTVjyMbsLhI+K5+v27aVE790Pc8HASZVz4OhaRKE0E5PGr4sLAEqxvMoPuTvoh2IafN1k/83d+R0GvRJLkPMjTlTZgLihdsaLjY6kAJxLrt8dDThhGVKgplXYsaC8BDJ4D1qAH3TWrcTGpxmEFdQswcgxBcrWXLMU5oaR9FOxJcKriKprw+QKIDuELBihIUcLwBxUgV+p1mszAkpi8bqOlCDmnQnV6ImQPPilGtyagtPF3kbDXLTAjcsDKuwowXcaqO1Jg5EzzM/tC9XL8jvMowo1rqw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d77b279-4f4f-4541-cf67-08dd34263b74
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 23:01:37.0107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KO80QH0NxyQGBAHszo4cp6Hm4t0GNiqMOSMKjoVLOm1FvLTBKIN60aO+dZlbwzxLKWrfwXbo0obxRB/Snjmpnic0FAX8Nib0yWI/Bznpu7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6450
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_09,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501130181
X-Proofpoint-ORIG-GUID: x7mvFTNcrnuDgylKMXSvmkdBjPg0OaYO
X-Proofpoint-GUID: x7mvFTNcrnuDgylKMXSvmkdBjPg0OaYO
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

On Wed, Jan 08, 2025 at 07:41:31PM +0000, Lorenzo Stoakes wrote:
> On Wed, Jan 08, 2025 at 05:32:54PM +0000, Matthew Wilcox wrote:
> > On Wed, Jan 08, 2025 at 04:18:42PM +0000, Lorenzo Stoakes wrote:
> > > @@ -280,7 +269,10 @@ static void fb_deferred_io_work(struct work_struct *work)
> > >  		struct folio *folio = page_folio(pageref->page);
> > >
> > >  		folio_lock(folio);
> > > -		folio_mkclean(folio);
> > > +		rmap_wrprotect_file_page(fbdefio->mapping,
> > > +					 pageref->offset >> PAGE_SHIFT,
> > > +					 compound_nr(pageref->page),
> > > +					 page_to_pfn(pageref->page));
> > >  		folio_unlock(folio);
> >
> > Why do we need to lock the folio?  (since this isn't necessarily a
> > folio)  Also, do we need compound_nr() here?  I _think_ for defio,
> > the number of pages allocated per object are fixed, so this should be
> > an fbdefio->nr_pages field?
>
> I'm trying to keep the code as similar as possible to the way it was before,
> even if there are questionable parts.
>
> There is a comment about some timing issue around the locks and so there appears
> to be an assumption about that.

Actually, reading through the code, I think the comment is with regards to
page_mkwrite(), so we should be ok, in fb_deferred_io_track_page():

	/*
	 * We want the page to remain locked from ->page_mkwrite until
	 * the PTE is marked dirty to avoid mapping_wrprotect_page()
	 * being called before the PTE is updated, which would leave
	 * the page ignored by defio.
	 * Do this by locking the page here and informing the caller
	 * about it with VM_FAULT_LOCKED.
	 */
	lock_page(pageref->page);

I don't think we need to lock the page (which is managed as kernel memory so
doesn't require it).

So will remove.

>
> As to compound_nr(), we're not write protecting everything, just each invidiual
> page in the list that needs it, so we only want to do one at a time. I strongly
> suspect it's a single base page each time, but for belts + braces I'm doing
> compound_nr().
>
> See below, this is wrong, it should just be '1'.
>
> So this is iterating through a list of pagerefs that can be in any random order.
>
> >
> > (something that's always troubled me about compound_nr() is that it
> > returns 1 for tail pages and the number you actually expect for head
> > pages)
> >
>
> OK I changed this from '1' to compound_nr() out of an (apparently) abundance of
> caution, but I was wrong:
>
> npagerefs = DIV_ROUND_UP(info->fix.smem_len, PAGE_SIZE);
>
> There are page refs for each PAGE_SIZE (i.e. base page size), so there is no way
> anything is compound.
>
> Will switch this to 1.
