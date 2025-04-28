Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3350EA9F914
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 21:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6531F10E228;
	Mon, 28 Apr 2025 19:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Ek6eB+9Q";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u+FxdZAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F98310E08C;
 Mon, 28 Apr 2025 19:00:40 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SInnZc009829;
 Mon, 28 Apr 2025 18:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=AFanksFgJNpZiy9aLf
 1Jeqx8tD4rw98eSIMQK2giwGA=; b=Ek6eB+9QYA0RCKK1GVmpr6MdAKrvONlTGy
 PM/JlVMFQ/F0JFqbBFHdGU0MM5GHVgp+nmlavfmjCjclg7EtMK1/mpOIr8GAq0QU
 o2UmkoeHNWbVOCxkTk1H9ZEDZ61Pjobmlb+z0DI31/BvriqY5OzDMeLcYpHWSIPc
 TEgD4djNV72+KHcTBU/FHJXlwgRA9yC0axz1WDM4u3AyanG6pxMHl9SOxapF/O4m
 rJCfzeKokKQzLG5D2DO4uy1wNHZOxn75H/CPyZHQEc/ljm/4jCWesXrL8Q8L9CzU
 8mWP2B5TR2UifoUFFG7pjqrVKzlejYwlOcOh5mv0MJk9hdBWk0iQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46af3001m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 18:59:41 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SIM9Hs033510; Mon, 28 Apr 2025 18:59:40 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazlp17011031.outbound.protection.outlook.com [40.93.13.31])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx8ucuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 18:59:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voPcW87FyfSDcShjZDu+qLz4ueoMA86FmdWPqv0n1uLD0wAc+APQO52zLLHpe1HZIRIm95axSoe8hR2tFvsVAWUpaxyuPkzjFiSg07espvu2Jve3a+edcaS0r3V+1dygY2vF7KtvwkfLssL1y/rkq2ydbYiXfcuW1j65Rhd4A+nlWYJis2sLGAnWxYDyo0tE5cSSf3fHQ7MNczA353ox3kdp8ZwsIODlA23O1juezf7jfTko7Kk/rH0nXJID6PYNwjy0oAkrrfakL2wdOJax1kX2qWByc3bKy1ilzm0WH+CG5e+zl9NmOhXDoHtafB3hwjtaH9aR86UNNOlLDSltYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFanksFgJNpZiy9aLf1Jeqx8tD4rw98eSIMQK2giwGA=;
 b=hxgEOn84E1YFhQQxFTa3YNS3b3OnIOVTMrDZURP2X2kFo30WwQOamrE7xXvJ3t1ORNe6hKJyqdMzR41QgMEtYu8/b6m7d7WmsplKWzum4GG8u+OUjOT6I5SWneSIQdLK7LIb/QUJaCdsfFpE2rPH1QD1kOgfOu/V9iVjLrEEF2NBEBQ6fKQPTtQbkHdnK+KsIvdVwh7zvYVEuj5/66NMiUiK8uscQwngGhMhxp9hmyuWxW4nmqc/QPolIMOGKsDr+/DQKRBLn/PaIZoLEzqB7mLvOmNxj44TjKfKCHY+8jhi5OsRRc+FOX/nj7Q9IP9tSu+HhL5FoqAiZP1ZlOm8rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFanksFgJNpZiy9aLf1Jeqx8tD4rw98eSIMQK2giwGA=;
 b=u+FxdZAhdR4ggWeL21ar1wmqDlLSXsVqdJ5RJnj8JZSm47Q9jkxOX+eiQ7rFFxOxohgvLgN7k0OSXYPAljpMo8eY6RgeAYWB7krEEEPZqp0qMPct0NyDsPkeWTFfDAVsrFmpmUJCAds/xTNyNMsch4kub22XzbYNRo82riU8EtA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV8PR10MB7920.namprd10.prod.outlook.com (2603:10b6:408:1fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 18:58:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 18:58:17 +0000
Date: Mon, 28 Apr 2025 19:58:14 +0100
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
Subject: Re: [PATCH v1 03/11] x86/mm/pat: introduce pfnmap_track() and
 pfnmap_untrack()
Message-ID: <632e9033-047d-4b40-8677-cd2c5da286dc@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-4-david@redhat.com>
 <554a6063-268c-49a7-883b-c39cf541c146@lucifer.local>
 <fc8117d9-57f8-4c28-9c46-328e4a3c4613@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc8117d9-57f8-4c28-9c46-328e4a3c4613@redhat.com>
X-ClientProxiedBy: LO4P123CA0246.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV8PR10MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: bf206ecb-4e4d-42e0-5cd2-08dd8686a2a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2uShY7VOKxkMLoFbAy9fDvN0Ll05VNrDpqih4Y+86o4bo5AxgAb5BNg1LNjv?=
 =?us-ascii?Q?l/nAdwrRBooYoJ+RPIV/2b6SUWla/NSekuU78sS0KKxAMlsXJYy/pB0v9Qgg?=
 =?us-ascii?Q?kaIwudVGNp3PRhvSuieLideEwBItnZzOW6p7iAZ7pJpq0S/x2+T/RTfqLS5R?=
 =?us-ascii?Q?83FDZVlYfJ89nGTfR2CQVyHv78mA+dh374bE2qtWNrLLYHD7ewYu67sh5Jr0?=
 =?us-ascii?Q?YLenkaMphTnmdtAVPEBtVagRdRh9tNsJiaAAkd7NMxf+XafQk4Fz4ZG8MAZn?=
 =?us-ascii?Q?ATsoxLk8llyu1v1mawpVay1j6935+TfTe5pHCVPEYwD6ZgkKIsntZf0F0AHq?=
 =?us-ascii?Q?Yqi95enooeCBCYVD+WHzg/ZfKVxw0qlvI0C49yWTQOAsfDVnaU7NbY31mRSV?=
 =?us-ascii?Q?F86jIBELBaoy0VHPRZPj4VeLV7rrD/fwpa9DZzAuo2/kIBL4B3XcJsdOd+HW?=
 =?us-ascii?Q?juP/HB2H7LWM4f2Mo8xRGmCu7R4hjYuhHY9BJ4hr6i8+sqUEjzjIaaG24DyB?=
 =?us-ascii?Q?AhXwm1KOmr5Xeqx0qDbHdPvTctZIQzXlK9us6q1SDweUZtu7OisCC5srPk3q?=
 =?us-ascii?Q?+vMztJM9l0HzQXZYAfQYZrnskzkDuQhsVL5+Is06Q5Vh3OpV80adwDnynnyJ?=
 =?us-ascii?Q?9mekgx53ajlby/mQMTwdMHtscEm9seuoTWRRWbv4r3o06YNVZta1H/x+Lkog?=
 =?us-ascii?Q?9dlzozlR3vQLy5CgFxrn7P0Dkce4sbzk1ezRrkog2r57Gj9k0etKOaEa9WEI?=
 =?us-ascii?Q?KbcRSwsshl5Sq5zabUKwff0Kqn0eHU/wbFzKbBsr5XGTSzG3ZVOI5ljm1M2B?=
 =?us-ascii?Q?136D33khlKnfm/ecoGwN4ZtF5IaybfXYjZ5ZUtHl5Du2uU8xy/RSln8Tt6aS?=
 =?us-ascii?Q?Ph4GZVfUy/clZ5MObR/J9GFNPu8Oa/py+7eISU3LHOIlWdU5GdPDksGveRoz?=
 =?us-ascii?Q?BlRuxHUogRgZFJCdiDgzcvBkijnrJk02TS8sn3Dt1JgHfDaehe0vLD+Cms0V?=
 =?us-ascii?Q?+OYh8b9HACn0ESPSeg9g6QsNyUqwe4EvHvem6ICLoEga1GX2p+syCLJz9lIW?=
 =?us-ascii?Q?B4+zgHi3HmPYPRTZET0TeZmNUmZxDRQHmEr+jceinaT7fqEl5zB767ddxPmV?=
 =?us-ascii?Q?py37UVn7OKl3rovUDbeKfOwoXV3f2ExCTtCIOiakVeulCpQEOXWTHZSE8/r8?=
 =?us-ascii?Q?7829Xmgdego1/UzWteRK4tcZw1jjfJtdV9N0lKGeN8oIcbp1qSIjE74YXsq7?=
 =?us-ascii?Q?HhH5M7e4YtDi25x8hYupFaomjHGqaijazC3AGE3To4ySy0C6QEp5pt0dqUS5?=
 =?us-ascii?Q?yofWOzWhenR/isZH2BnPP+M1X8BF/Dch8DOTJVgbK0vLIclb7nUYnKLK4Rsc?=
 =?us-ascii?Q?dQtVg+AwH6MJO+uHS9Mw+ZoKeAk9nvqDWgPAJA8dVNLFd1Xm/+I5ZeIAGjuW?=
 =?us-ascii?Q?vZpqMHEyjVM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V9w7bbvkt1p2pvZ7MIAZdigh9lgcwbRU9SsTNrzFgo6PhXmAU/8dmTjY/XSU?=
 =?us-ascii?Q?uSOHZVHCDJe8ZKd4rdyM9A3RUnC30Y8TcsaukHZdKxWIM47kCcBPsQTqLsZc?=
 =?us-ascii?Q?moOxtR5icKJrzrkDt+l2LH55V1Nuz4o4SXLBW3WQ+PgyQut+cybwd9RfKT7G?=
 =?us-ascii?Q?N9fNF5zQmCbyKmyQg7kZNyisCS41ToxWFiXFeoAdUvyQMflYWAht5j3UOsNP?=
 =?us-ascii?Q?j6we78TYWMwDdaojC5dTdswOM9dEci4IHWYX2RNgy1huPZ6GcZDE4GNXesvD?=
 =?us-ascii?Q?7HcAnJQinhNIGpczs5ntsWsyc31ur90Nn+0Sgx553FbdsMUr8qPJqU89Z7bk?=
 =?us-ascii?Q?6BMX5F7l1Iq/juQXDSVOZXwKpnrhGABu57kyMcWbNMUnq5lMQdaYDy3zFIl9?=
 =?us-ascii?Q?6wc0k3JHaAz9DDh2Om924YjK7BfsaaKcU+xMnktRwELWUr4tFxyu7CVC3ZK+?=
 =?us-ascii?Q?oy/yedas9yW53HTVkNni3D+GDBj1Xle4DQttoKk9hRgaZDmwZH0/9kEN++7T?=
 =?us-ascii?Q?ynbC/+QSKO8Hkc0MYIUVMEyUe9a8RqedngRDDi3c5x+cTEvaoKr3Vxnx3w7f?=
 =?us-ascii?Q?6bWeZ0aoJvtdQemc8qgot8YoIe02Tu025sXnncqZO153D43qyz0zqzOzH4gd?=
 =?us-ascii?Q?dvenrb1rqWMkrdAC1R91Q6XrubKn4sytp06+XKyrOB/V57of87lkaj3w2MYg?=
 =?us-ascii?Q?l7LJN/NsrjINxrBn9rAIChOHan5OMTZwKSh821YJtI41mwBLapN6np/T2C/b?=
 =?us-ascii?Q?XPK3FeRCI2a9LVcmlo/xWONRJgo2BA5cmMQaSbwr8fxNo1k+RsHdirOlDSDc?=
 =?us-ascii?Q?lr6e4r3YtFHw8sEedltW9s2SXjLEvKX2Nppa9VozOerTcJUkB6cX5DYHJlJU?=
 =?us-ascii?Q?hMXUj7RLRa+rkfeUy7b8ftQeh8Q3do97oMOdaHPrs09QxdeZjZpTr1DGo/aL?=
 =?us-ascii?Q?c9uJ6FLRpOU6oB/PP8EK/Qp8GpxZwh5lIOFly8EOGCU8SKI60I3CyvOsc353?=
 =?us-ascii?Q?6T79Mn5oh2UIWtbj2bBKD7acnr4MXeSUepnCv7dVdWASdL21pXmOohi4xrGM?=
 =?us-ascii?Q?jZJ+3+8rDG3DVRanEzCJZCHuwa35ViPGg+i68k5i5UIKpt6SSWI7iz8DrZrg?=
 =?us-ascii?Q?NBX+M8v5yodZdK4ent1fSPbz45t29eiHz5faeQniFY1KESiY2xJOdgcu+Pde?=
 =?us-ascii?Q?r0aykKbF1nZjor0mVjRlpyXmwt6e+tmqn6ASI+VTdUq6Qz3Znbuy6Xn8ywcb?=
 =?us-ascii?Q?B1I7aKWzFMumtvSd0JI01/xOWhRHapQ/g0idJ/ojdnyRvDscCBJ1JvHjSqQ7?=
 =?us-ascii?Q?WNSB2tleH4mplaeTjuvgCaWPWGCaWxyn4Io3tt9TsqgSSFTaqqHFiMT7AFOQ?=
 =?us-ascii?Q?ymfbbJrIH63YNyWvL2rCJXwqrVBTL6quVf+ufy+bunXyl4ZIvZ8O3RRRf1Id?=
 =?us-ascii?Q?zwvhY5eCyp4fw0Cv9dv+zDAOV/nAo9yBArIJITMKjxXhK74NkRv9K7DQvL7e?=
 =?us-ascii?Q?8osis5UvSSmne1kbfaBXg7V6X50hvZzIaUMqFe2O2pnHseoUOpQAc1oFmmwi?=
 =?us-ascii?Q?ihU5xeGLK6qxQ0szwtazAlOT4VpgokaNRoVcTvpNSP0GIROC5myVEN0abMJ8?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: PI1vfyP+jz1l3Y7M7URG3Vk6o6aMRteDQpmkLEd0OOeSzKgwkWCs1ilrQliLTsdFBWn0wa+1KIT4MKTVAuO9vUoxiQx6Fm3xMcmzxwq/A2Cq04MDxc1jU8esdThUWsDEpKF532s6uROUdwPE2jDy8hRYO3gFfSCNZf4+F0QGHAllYXhDWy6cIEwuLQJRYATVuWhds9QEp7fc7zwbODA5h955mQ1ur6EyRy4UVGbwcBw1jXIOQxJfC3H2qkeAHKYpLzG6Q4duu8o1ejvKxjDedev43RX7U9S+YmB3q2UPJtsUylVMDkjGoVFw2jchz7orvL8LXC/T3NawP7SZPqaD2RPzHpAZUrAdRalTTx0G+5tLaudjn/21Dj8PdFKP8FM97iaqDmCsMULsCTJFi1g7ssVLWkjCYSYPgp47cKMMIQUAt9r0oKB6zZSISrkACC1xA6GBW2pWMj5xprJWVw5nfrOCSUXwNR8UavrvBLajvHIHVaWWPEYx+EePterWUwt4AIZIxQxk4KwawokcqL5V73jKUG9UhK549De5bHKyJj6tzseasaHz07u2plz7ftsjoS5ZjXU4rk7CGg8nw7c6Jt+6YFcC8BE6rjnU3Kt2aYs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf206ecb-4e4d-42e0-5cd2-08dd8686a2a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:58:17.0308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T46p2LIo+nRd+MgWXhG81GofdaWGoomRss4JOoiMJ08o3V+RHfnTHcXXAZ7vED0oK8T7heKl9XkFgxoKEI3wNfxuxjGkyic5xjOBqpKETlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7920
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504280153
X-Proofpoint-GUID: GmxfeoMyPNTIjX8imw5-u-UG8SGAqDGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE1MiBTYWx0ZWRfX8Sf3wf3RvQMi
 7Exp7LBCEPIe3na1vfW+UbNYZAU7UTUBPxeQS/yY9zNGC8vA9RBorapZF3YLnpmOXz/BzLh3xM0
 aH71HaJszlT6055HsTvZnLoScgsPbrxrnf6E9eauTDyV9AV71zn0SkqGi2J3qMk1KfDKAqFJdAa
 JULgnt0oFreETfSnSuWFKWt6d7/BVSsAYZ8PKStR+izHemP+xyr71EKJD5+66vFHMvmuIX9xAjm
 zh/dniFqy4aCR62Z9FjKx+0TYGSORz21IY4qRawUEbpaFmbarPtmYNKVE+3xf/K8qDR7CmnDVww
 PvakigexP66IkGQEiMdF5Ajhb+yJEgb26H04FtSuUPDGrYZsATk7UBd5rrNx3ZZAkH06BVaujnD
 NtBs9Sjm
X-Proofpoint-ORIG-GUID: GmxfeoMyPNTIjX8imw5-u-UG8SGAqDGV
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

On Mon, Apr 28, 2025 at 07:12:11PM +0200, David Hildenbrand wrote:
>
> > >
> > > +int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
> > > +{
> > > +	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
> > > +
> > > +	return reserve_pfn_range(paddr, size, prot, 0);
> >
> > Nitty, but a pattern established by Liam which we've followed consistently
> > in VMA code is to prefix parameters that might be less than obvious,
> > especially boolean parameters, with a comment naming the parameter, e.g.:
> > > 	return reserve_pfn_range(paddr, size, prot, /*strict_prot=*/0);
>
> Not sure I like that. But as this parameter goes away patch #8, I'll leave
> it as is in this patch and not start a bigger discussion on better
> alternatives (don't use these stupid boolean variables ...) ;)
>
> [...]
>
> > > +
> > > +/**
> > > + * pfnmap_track - track a pfn range
> >
> > To risk sounding annoyingly pedantic and giving the kind of review that is
> > annoying, this really needs to be expanded, I think perhaps this
> > description is stating the obvious :)
> >
> > To me the confusing thing is that the 'generic' sounding pfnmap_track() is
> > actually PAT-specific, so surely the description should give a brief
> > overview of PAT here, saying it's applicable on x86-64 etc. etc.
> >
> > I'm not sure there's much use in keeping this generic when it clearly is
> > not at this point?
>
> Sorry, is your suggestion to document more PAT stuff or what exactly?
>
> As you know, I'm a busy man ... so instructions/suggestions please :)

Haha sure, I _think_ the model here is to have a brief summary then underneath a
more detailed explanation, so that could be:

	This address range is requested to be 'tracked' by a hardware
	implementation allowing fine-grained control of memory attributes at
	page level granularity.

	This allows for fine-grained control of memory cache behaviour. Tracking
	memory this way is persisted across VMA split and merge.

	Currently there is only one implementation for this - x86 Page Attribute
	Table (PAT). See Documentation/arch/x86/pat.rst for more details.

>
> >
> > > + * @pfn: the start of the pfn range
> > > + * @size: the size of the pfn range
> >
> > In what units? Given it's a pfn range it's a bit ambiguous as to whether it
> > should be expressed in pages/bytes.
>
> Agreed. It's bytes. (not my favorite here, but good enough)

Ack, definitely need to spell it out here! Cheers :)

>
>
> --
> Cheers,
>
> David / dhildenb
>
