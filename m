Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5BDAB5BB8
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AAB10E3B8;
	Tue, 13 May 2025 17:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="nIcGY7qF";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RfloYYA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8154910E3B8;
 Tue, 13 May 2025 17:51:12 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHNp2026640;
 Tue, 13 May 2025 17:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=/FwpH2FJUPUruyLI/r
 kOfNNy8E8C/O9sRysfy6HtXLg=; b=nIcGY7qFvXQ4on9wwVd4mzRhcEgrDb+B2Z
 6ngiB4dqdmlEnV7R676v4QLVT6qIxTnYgeoGtoTL+TJsg95pQro0oZS9A4kdF40O
 jMEaNq/rRCzXBLLkVskBjkF4GQTZMr8Yoy8b3hw/CPi8W3cFcNqPjWlJ0PrKsnYq
 5z6nV4kc8o6lFZZz4OSwSYCkAixQKFoRCwXlYyi8xWX7wR0xaGiqFppn98QPmmJf
 oRpRL9Pi0jwMcLFNl1pRqybqYfV9QHdegHzV0Layt+3hqpjX1da0u5y3TkyBzAgB
 P4u5lReEh9k52fGWeK0RkQuvjpN5+pcVNjTD6yaWdinoMvBQNEMw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1665h45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:50:44 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DHivY8004402; Tue, 13 May 2025 17:50:43 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46m7d934tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:50:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqOxUY7KcOpkJ6MR0jh8xxGQWNCXkKqR3dN4kPnvtLsFsrtaS1OwljNDXozHJ44J+SCzhr5dOlmoKYomWYiXPnCHMupnHceHDvkZmgSfziDDrH9VIjo2pNJbwf408EW/NVee6rqBwJC+jMcrwi24BszSuERN0sxH6tDhaZa4VHpx8QGwsbHdoZclRCHaITGTOWKeiaXaohyutD5Ng2N75NNYHOqPqWeIJTAVF2M58/V7I62tp1ZA68JXhc2LOtVUp02oGTs1vBwJ7pj/kVGORFjKxRvERH/UlgXAruZKsCGgWFNnXO/0YTTM5f3ioBZsN85scI66eGQv+sh+33kY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FwpH2FJUPUruyLI/rkOfNNy8E8C/O9sRysfy6HtXLg=;
 b=RKhIgzaDsSTtTify4ApGjRq1UJXQVJlHjoqiLkc8UfxVLSWvUVB9OK3j42sgfc7PMKRoFbVzjZA83Gpm1Yx5sxOEBwiVD+ZlSKdCrkNgVeOs7w5ZHAusx09pJ444unS43Nmx6zURQTcKwv4BfBZz8Hhz0KwDveLR+QAa2HJNLUWK1WQnKEbKCqW1ODM7HLHHReEe2V7mElAzcj7UaeJPYZGKa3JUb2QCrR/bnmmI56lZSXYHXru4ZEJEDIK+kYFnJumdXmuP+0zehlmi+nmNVt7ihMvQ9oJN+rsznXu6YsNDdSSrw4Vv1W9g0DT1hRzrr1gIePVMisNV0x7amawN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FwpH2FJUPUruyLI/rkOfNNy8E8C/O9sRysfy6HtXLg=;
 b=RfloYYA3m4sc67985fipTMfJ7n6frQQj2YR+0vcO0oQbvWOjnuTfOhBZTrREbAVIZ2A9dd8f9F1FNDtFv1ojpOFZ+wVEYxzq5PVb+UPuXwn0UO0pu/T/PhCl7LIcY1BSDCG/DiR6MlSmQa6aLJrZ8LlC0FiCu7AQhJcD6cB2Gx8=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by BLAPR10MB5011.namprd10.prod.outlook.com (2603:10b6:208:333::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:50:38 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:50:38 +0000
Date: Tue, 13 May 2025 13:50:32 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 10/11] drm/i915: track_pfn() -> "pfnmap tracking"
Message-ID: <e7vsjwegfcki57zhe4wfqpkbksad3f7lf5ij56rji4xkdfkl2q@hduujw6gfhz3>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-trace-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, 
 Peter Xu <peterx@redhat.com>, Ingo Molnar <mingo@kernel.org>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-11-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-11-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0031.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::9) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|BLAPR10MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 08fd0d6a-2beb-4139-15ad-08dd9246ab68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?litwTHjzAKSHXqB+9FEKj874yaVrn6JPr7lOI9XLOXsJ+Y7BKc0DGZNabODk?=
 =?us-ascii?Q?NHkqGCuBiedmezBoBl+VGrYV9DnEZp8LHkL91EX24wCbFyBAw4X12YNq8if0?=
 =?us-ascii?Q?sp4BJrly4a8pTRRkxEKNgi9GZCji41SV4NjjftKymovU2aYWGOhAliP17JFT?=
 =?us-ascii?Q?1kmPCbd/AHLi1nvv9GwTB7OaRnGTIGmWlTYdtzQBiAz78EmlWs7nWmU9ifie?=
 =?us-ascii?Q?lQMe9wU2EOXPPvw4RgvlidD7zjtMaK0MSRo2O3/Glk9WMhcIj7+qGoVKyr/7?=
 =?us-ascii?Q?omVNRDdSn1GdvJooOleDi39qRVcSHn2yqsJ0BWiCMOLVUkWkshVQeAtdTT3Y?=
 =?us-ascii?Q?ABW68F49QhjzOW7QR7WG3gGZThpl1xkuwH2hoi/VsdX098FXXfBzZVUCKdeu?=
 =?us-ascii?Q?UR7tOEPHsOe/XdVev2oZPJd5o6hddwcqCEV99CNMy/HAeJn8Hl8QDoCxpZmJ?=
 =?us-ascii?Q?dErPJT6gUfI1rJyrdYUg+PAQRURRZNRYCNhPC2ah+IJIROzq022Jl4JHxm9t?=
 =?us-ascii?Q?D/sXJ2Vh3PZIYuVce0kehxXkaQvZfHeDOkOiyqwLGF2xYOkW2zP9izoom9Fo?=
 =?us-ascii?Q?WUAcckn9D7V+eRYzT/yANpc1EIwrSMhFQ5wv8RDCvqXV43eaXa0zurKSRNpY?=
 =?us-ascii?Q?F+R1yx/qcfiprKZzuLDCJaCm61bQeBLCauwNlT8Vz5PbA5S/g5qD45GZhHl6?=
 =?us-ascii?Q?b5DpttJSbRl23Y0LM+sYbhBLpKt7i0pR9j8vGTZ+BtPiioJttSlz01z+NTAu?=
 =?us-ascii?Q?7mWQhuPIVNHcuNaKlpEnSJMbBpAG6Tz1VBQxrK2z08pG+X96psek+E2UBp/h?=
 =?us-ascii?Q?HerOKYgoqBN/sV5yRf3Y82DhyFTurPJzF9aYRPB/Dcii3adz/6rgCC17tJ/m?=
 =?us-ascii?Q?PbA+TbW0J5VOLnNU+5uGEFTKQ43wXqjhjBV3eSqwQMsrh9EHu4ZgmVdJ++sQ?=
 =?us-ascii?Q?F07Y/chNQhx6baDTCVX2MZt6MK+B+tD7mAO1VCOI9MvNUgjiW4rAOd/kBmxv?=
 =?us-ascii?Q?oM75Gy6HNgdO6bzbL+ske/K/135EOgsK69bBc8ykCkwbHQK98IYb8Dr5Djcf?=
 =?us-ascii?Q?KEtJoafZs9uxAdrA06aDJ3m7bxJ2Sa6nqGVV9fyt8PXY465MJU6fppowVceo?=
 =?us-ascii?Q?jVx4is3WED0gUieqHcSC8ZJ34cTw4zy7O594OmJG75pPzl4toOuMUkudagHJ?=
 =?us-ascii?Q?+9zr8facRJNaWJQrbutWAEq48YoOJTxT5wcdtxd600zcxWQQNvmbtwxS0fDq?=
 =?us-ascii?Q?+kjpzImLmweZOZ8ZIRlemgq7f+doNUSNJwp4h7ImwmnUzQNuDrINKyrPmic8?=
 =?us-ascii?Q?C7qFpKF+UPt5lXmxwJqVUO9PCRRnphjT6Mg4e9ZtZneTn1xyQWtvbPTQUx5R?=
 =?us-ascii?Q?MCXtA6hCtHCaNXJ1uBV6q2bpIZmAz0QhzRvq7wBC9QapNG2jkSFlZ3E/DQLC?=
 =?us-ascii?Q?huqL867kZTc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XRfQtuhlUUt7moZ8a9vV/Gyw6ja2jOR94cg6bm3l2a3yeRT7GBOH2C0ny3K5?=
 =?us-ascii?Q?qnmuPmMjh4qoJc4mGBI1iJM1TR6AEwt8VqW44G7FCMngaIS7B7hJHWp0wWux?=
 =?us-ascii?Q?rJZwyzpY4+UyP6+y7utQ7eH4byW6mhp+kg4s/kLAjsMvaKrYnv9tA7v9uoEX?=
 =?us-ascii?Q?8yux4cLA9t+q/0VRmqVM907Sd9ds8Z5lcb4E7A10BDXCF5s8kuWRzkKMXihM?=
 =?us-ascii?Q?aZxTnh46AQa3KrXQYmC93FSsddj74WTxch3hGDIBVfYHDKZT+BIljAZo7RHP?=
 =?us-ascii?Q?Wo4z+tnVKoOtqt0lYBcJaqljIC+6Md+C3wiT8V56tsBRTfefDhkI02sCB/1i?=
 =?us-ascii?Q?R9EMvJJbwW0lQeHOQV6FipSoTF+BhGyUo8MuOrkvC77Oej9b9rxMQeolMiPH?=
 =?us-ascii?Q?WrolRuIP+N+Pzn3Klh/zYCrptlXvsIWqQ7EFRWAeqWSoiJSeKJwzyscWPoNa?=
 =?us-ascii?Q?+BZ4UPNLnJ12c82S00zQQqm4JC+u7VFnG1iww/jsaksbuLYpVP8WuKwW6ffb?=
 =?us-ascii?Q?RS/7bEYkg9CBdJkyHEQZ46jo1bKWX/QtWG7PIk5dazBDmqooQM/FjGylk0uE?=
 =?us-ascii?Q?1rpY+YU3WIU+JyVuuWe8XnUWqA2ZTeI7YIxpINIQ/5ztcvFMdHT2n6Ie74/6?=
 =?us-ascii?Q?mpPvQaJzuuT5h6Xd7D+15b0lS1+z28tione0zNvIlGi8WyeF7z38cIftWfdS?=
 =?us-ascii?Q?3CSj4Dl1bcDjGG80eSr5MdlYjPLUD+dX6VPvI6U7pg1whEu/xuRUlWvFkjEJ?=
 =?us-ascii?Q?6xiZuMd5UTnqwV3G0BQWBMISAT8ODxdFPmOp2YmZOq5wRhjCVton38jjDhh8?=
 =?us-ascii?Q?Ck6fiyjHttyp2nUiYibOwqOxQrHbjAtTv53oR3ABUw0lCVpHaT/6B4SncFxf?=
 =?us-ascii?Q?VQYFxbYB36pVvCLsZD0PL4V0s8c6Zyihxpwf46S3P+Pi2OubzmnNoYvCx118?=
 =?us-ascii?Q?dZdhMz7ta6lruzMdsun9F7urdw737PlMbcNneCzi9wpR0OoGYXLQZ8YLty/j?=
 =?us-ascii?Q?hJ3Ev2bKT5pQoSK9jdp4FoMjO9sqSKIEKOWkdY4kIgyhAERBx6RSEn6Kfi+g?=
 =?us-ascii?Q?vI9ivfsrdnGHSKv6TcOXdFRJ3JFNrPcbfa5EBwzbB9Q7NJ+dydyjHqMHKb3f?=
 =?us-ascii?Q?jIBZiZ+dgVaLnPqc8NePn7+Chb4cSEt0oUVDm5phWWJj47Fd0WPx9btjRLFr?=
 =?us-ascii?Q?BJ8vktJymwn5NgxJis7HwuaxzJa+R7UDGBAOx4g8cZCdsY+hWQlBnGoxsZxV?=
 =?us-ascii?Q?7Bt6WrWD4tjfrbXy4zRBFT2uE9ebzNVyvFGmsZr5dIcdKDbCH4a8TRyB9ApQ?=
 =?us-ascii?Q?0L3JnztwZPbkze6C7zQh6VFUxYZYLvzg3llcBWXyN91sxhcZ8z78urMxr2Pf?=
 =?us-ascii?Q?IMDAa2C9ycPE8reXEYvq1qONzllLT7mQIAOtuTYZ1ykgTp2AFvDsQ0lEkWvS?=
 =?us-ascii?Q?GKjfJz9+W7IQsKN5xQIkVHs0kpGmf4jmUChygR5PKRwutRZCpLW6+wVB2rAQ?=
 =?us-ascii?Q?gJR7HGSGpJJWskxnbtjAhOm5xmxDkGev6Qv5XPBLmYUHUevKwDscac8iROE6?=
 =?us-ascii?Q?XomxyWMlh17YaizoPUz7co3Sz0Im1lN4I0HRgt+ZLZ6v9H8KTG3XYsNjAbjL?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: QybvMUMlKTv2MT22bVKDlf/Le1hndbRqRghcp50Bm4TcTHxc5K9k6Yjd+dqHeSK9VI3wx1JRgGFtA51vM6shibLJhM5Js8ardSj6f8PKB1f3OeRMBckPRI8YBd49Q2GfL6fb7uqgBpB+tou2OCFJ3fPCvWdfbu5GrTWyZWyu4PONbOCGcOwzmGv/B4B7OhD0M2RPg3qUi5ZXzNhDKtYvumkUTJCvrv/X/NvSrdjjHSKv1i9h+K5Kh0FCOxlzrDUmkAzXa4eeKbU83FZG7RyIFJN/O48sLPt9KMl2h8KJTa7wjYutLjjtHrVtAPPySHT1KQD+Le2bnePIHU3vmpLAzEv7qy0g675Fo7j2Utp5YVao4YHp+cf01naZJ8JcDVygsKTJcZ19y277UqZK4frGPfmF1c82mAhULMvXDWKv2X7h+MmjePGpsF4363J3CskoFEv2rmhrh6kNU8v4KwIFkb3J+9/YxKCkSmpmnNxqVhS7hih01l4dhHFxHZBGcNL3GYws0gC9DExW5ixIwztPVQ/79X3XOAm8ta7QIil2z7fKyMwoTthT8888ve6RCRZzcJI0qNFKUX+mDjXFU6CNkKl6OuzQEU1CPfQefxGQ3ks=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fd0d6a-2beb-4139-15ad-08dd9246ab68
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:50:37.9563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKDWnxKkCH8gbFn2grU/t8zjkH5S5QFV1Ezy8WOPTxZcKGxOOs2oFNTlVTfC5mHtp1tUxsMy6blEoMrJJdCP+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5011
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130169
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE2OSBTYWx0ZWRfXzBTZfUB8yXb8
 BFvhrvDUBcCvwVF/HtXW7JDjD/hj6kNSH5KqF077OeiIXU74lrtgdqp/E5YQKUq0SCmeJj6f1g3
 13zoZVdCkC0T5e7+lbSfcnr/Sy+Cmg1hNqPrJryrZ4XbEoUG2IAzsAouhpyETRIbGBYnRfZjWJ5
 7wjPyn6kFPkiqGjE1GPTCPYS3htZujq7ACu0dkOGzB/vy/kkEijm0MrAHbMwDPspXsPBtFevTEQ
 Q2LfH/3ZVbs6kbgYchnA5MiPvCMkBWAwgycCgDo5vxhN7+DGYxXgPcjyGFXm1Lfh/Jbc543gk4S
 F63DibyTQHzwgQo9o1IAM0qNcwHYawc4hCtO4CHWZWkgIPTn9+gN/FYmSiv5tyb6uskrEQlY59Y
 xBZxzlSgP9f7dEoZ23UFBFuzBWjT3AL3Peey7dFduxZNf/FJ4asRsrdo+0HlXqD/8ZsxKa5K
X-Authority-Analysis: v=2.4 cv=VMDdn8PX c=1 sm=1 tr=0 ts=68238674 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=wFesxYe3cjYPeCmLaY0A:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13185
X-Proofpoint-ORIG-GUID: sFC2fa4eotV6laDPMwtoIcR0BmeuLCou
X-Proofpoint-GUID: sFC2fa4eotV6laDPMwtoIcR0BmeuLCou
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

* David Hildenbrand <david@redhat.com> [250512 08:35]:
> track_pfn() does not exist, let's simply refer to it as "pfnmap
> tracking".
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  drivers/gpu/drm/i915/i915_mm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
> index 76e2801619f09..c33bd3d830699 100644
> --- a/drivers/gpu/drm/i915/i915_mm.c
> +++ b/drivers/gpu/drm/i915/i915_mm.c
> @@ -100,7 +100,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
>  
>  	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
>  
> -	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
> +	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
>  	r.mm = vma->vm_mm;
>  	r.pfn = pfn;
>  	r.prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
> @@ -140,7 +140,7 @@ int remap_io_sg(struct vm_area_struct *vma,
>  	};
>  	int err;
>  
> -	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
> +	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
>  	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
>  
>  	while (offset >= r.sgt.max >> PAGE_SHIFT) {
> -- 
> 2.49.0
> 
