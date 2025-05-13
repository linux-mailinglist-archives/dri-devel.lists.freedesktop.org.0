Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65FBAB5BB0
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF7910E5E9;
	Tue, 13 May 2025 17:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="FNMZ371x";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="C85vaafa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9662910E5F1;
 Tue, 13 May 2025 17:50:24 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHNNF030394;
 Tue, 13 May 2025 17:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=/X6rZIgxyOGuAcVrLh
 eTN9iQfONuac4Q30Bbz78AW2w=; b=FNMZ371x3B9wbiGkvX/UkxAAlq5rmortMF
 DqM5O/jagBB1p3H3E3/MyV1i+3XcF2nWLvGxy9Lf7LRFGZXmKaKrQZDzNk+M7F/0
 AKAjqdFZPdEC10MCM/OdJgR6OckrdhHO3lPf09wcdgOK3rhT3l4dGzhJ184q8iy7
 SumRbr1Yd02fzM+VsXiOEn552Fh/cwtvrNhBn3QUxdOwvMe5KF4DXncp/JfbNPZ5
 1azXoYrgb89aVfu4IMRkVpGDoNKQZHWNYFrUB6qbfA3M5Jngmg/Q0yOOPWmHb9iz
 VpIPjahUDLXIIfEONFrLxRswUu2Qpgei8tpX5PdLkLlHLk9bXKvA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1d2dc0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:49:56 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DH1JQH015456; Tue, 13 May 2025 17:49:55 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazlp17013062.outbound.protection.outlook.com
 [40.93.20.62])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46hw891m8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:49:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdStjGdJh19go/zlrcasKqROb/BHrbWGbHFpCsAIgRKxapVVSi0PaiT9DPhe0dHkRBJAKc65CP5qVb1ddlZmx5T+oQiM+XbS8oqF43Jygik1syEmd2DJb6AT9hjUSYVlCCmGT7IUjy9m3mouw+kRbIYMKPs1HhpFwXpRdP4wRrDapaskdA46OUn4231NyzkXooGlQUeAT16N/+J/HJxIJwZkxa50JT31OS8g/XgMCwyjeJWFXEY5IMCSl+OGgxuDPKC/Kkml5A4SLJ/CwcrgXPq1Qsd1XvEZib/U6ajW6Hx+CW3VsJSQLB+udUivoksmLjey6RVFeih+IZuCSdjJ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/X6rZIgxyOGuAcVrLheTN9iQfONuac4Q30Bbz78AW2w=;
 b=GMc6HXN+Qr3jdOhnAIwmbAhCqu9TXlUcCHvjYyQUEuWjeR50zuAwZlhqLXSjUiA4+WGSE6rYyBqtbnGmdzXhH67PFM16xCOwIyQORVthxdqQzCZ8Sql6SkIVuOAsEPPT5sFbE1SAqUQSjjzFGNGdwzCuo/q05W4KISsbfAFIDsQRe3L+wzVTTKMJUU/SMGll2s2264rLIpGS8Jl/9NgPRt1eQlZe1Sj3US6qJ0MtZWeSwO3I+SiPNsP+co9A7oiHvnHL0J5HV/rU/GYvs0pdxi05h0x/OAgYYO3wwhG7Kz3yioEMbpCNJGcJxcHO/IZ6gaQfo6M2qT77cxl22oUajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/X6rZIgxyOGuAcVrLheTN9iQfONuac4Q30Bbz78AW2w=;
 b=C85vaafa7En18Ff00F2uuV9UKBFlXESkfHUdGEKevTcKKSw6aBmB+hJu4bmqNC5fvwt6oR+i8BwUgvbX3JbAM3yeRCGsyX3FdpK2k+a7+DOn82eDRBDrRcNhS3ZrP1rXPk6Lozn5RuG5mSMofADVNtZQc8GGLSUNOVk5edMxniA=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SJ0PR10MB5860.namprd10.prod.outlook.com (2603:10b6:a03:3ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 17:49:52 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:49:52 +0000
Date: Tue, 13 May 2025 13:49:47 -0400
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
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 09/11] x86/mm/pat: inline memtype_match() into
 memtype_erase()
Message-ID: <bwvbgriddgp75b7u3oduysuj3ks6itlolnhct3suwccc24tdde@o2uobsoditgu>
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
 Peter Xu <peterx@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-10-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-10-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1P288CA0012.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::25)
 To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SJ0PR10MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: 26abf665-6f00-4e33-18ab-08dd9246902c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4T//5ouw6W4M+2ESixLr/kgla03PRBpo1NX8wEb74cWxS538rFFuz2OjQOiG?=
 =?us-ascii?Q?/d8p+VRHkFzbEjAj++Fd9/t8ryfjVe4xbnkHhzvG1fOkmtSk38xqIfjnfdMV?=
 =?us-ascii?Q?UuL4I9GucyAU1hgvk3Fkjeb2ADWeV8UNIUS/8/8HfVr+IsVe07rkmnbgAWMS?=
 =?us-ascii?Q?BLC3kPbxw2lWbshMftaW9Zlfnue7xNUumxoyNrei3VbfMWfXOnm4+HuWXg40?=
 =?us-ascii?Q?LpeYDQl6y0hS7k8z35Ts7Q7HfpItNFdd4KbQZzQmhK+GGMLwhpxuAqMw6nlX?=
 =?us-ascii?Q?gvz+q5YZG+kNMFQ5TcelBJcxTXqZ4tYP/JIUeOjpS0jUZ/WerYGV+Dw3fwZ7?=
 =?us-ascii?Q?S1zvJhaeTyv/Gyd6E4eScnCQSXHQhC2x7MwyeHA0ilpI9FVnx6N65eSrPlJb?=
 =?us-ascii?Q?EfDOpf/1Mj4TRNFDsOMKYaCSuFmpTLKoxAOlGqJi/aIyYSaFkw4CKz6J5hup?=
 =?us-ascii?Q?DJVR014QFhVxaWIb+N+oYPMvQtm9cGSs9bttQPAl1J2o7zmtEJYSKGKzqRqB?=
 =?us-ascii?Q?0IHcl+xAPpsyATtmBFXI/Qy9P5+AX1gWvj+dWs+MTHmiiINoqKlRkjTc/Wbl?=
 =?us-ascii?Q?EKF5FOdpQPc7YPzqC+4Hk2XE2GcR7JizqD5bM/ls7tVjDJ7gztcZSPXIV7YK?=
 =?us-ascii?Q?YmrAdInhka+ADxBeuQnm79XPfhmC1evXuc22IFyZMPKHoHVgnfbqcFthNBKd?=
 =?us-ascii?Q?6gp0HlcfV+vETqbUh62Ku4qB5KvWV8Kx6inbK1dCDFIrizr0iTvDSa0LLUn5?=
 =?us-ascii?Q?ZxDH2/RxxGCiJhlwqvBg8kQCLJm5nXlAbh8Yl+ee0JjXH9oKHt76sQJkcfYk?=
 =?us-ascii?Q?DgMlLnfv5w1j7lQcDlDel1csGT3E/g+XJ0LK/ELdpvbFJ7VPFRZ5atcKU9fF?=
 =?us-ascii?Q?TlPY+4Oz74W88yqtItd2sH7tSIfYfqbSUb6JzLURAofR5FbMwUsu5r6ik5Qt?=
 =?us-ascii?Q?DrcgEopoNa4CFt1UzenudxHWSA1l79IRTWvbvrEq/OMOlbas3drdNG4nmSso?=
 =?us-ascii?Q?JNgsKRuv5Rkf9XqvZjUEfaVbYa3hNw7iTotbbZ7LbtyJ6AHlFM0xfZS1jhnq?=
 =?us-ascii?Q?anhpJUJCqtlh6SP54Wn3fuxNLmwphtMm7TEkFHAHYahsqFjSl5GU1Dx2lniy?=
 =?us-ascii?Q?nrIfdNiYfv4YinRENCwD+Mva5dcwlz7ejdFEzg8c2/x2g7awcIFv2pIEA1H3?=
 =?us-ascii?Q?Cj4YwOgfyDQuQfn0ltylrAhq3zHqmXLf93be2QWAkFi0/zfk6PQNpuVZDbMP?=
 =?us-ascii?Q?AVw2WRu3roiwuaIjGuo5jNUO4fW+xAlgxTXih7kydvEgyRd645vweLRiNsJV?=
 =?us-ascii?Q?JUoySDNwTK1F4/aUfEsAcmO3pWKylJTbhYEYPwj/3xJeUvdGW6F6xCN1qmTL?=
 =?us-ascii?Q?0Tr9FPa5Rv1LHcOfYYroGdNcCc6Emghc6Fx4CFGGGv72jvH5L0IiQmoxZkaN?=
 =?us-ascii?Q?pF7+bxkmtT4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/fH9Ar/3IJRVWlcc7dyFHTZq4tPkM70n4ZlgHiy13eYIZrXeQOh6gSNF5rsT?=
 =?us-ascii?Q?QRBhkLsbfFz/2xm0cMW3v5KFJ3L6B/QaMHD1QhB5ilXw8GdY70XL6PD5uTTT?=
 =?us-ascii?Q?DTiD2iwsSJSW2wukNhm92/XBIu17UK+AWU3uKR4hHBC0TLernhfXBe7lx1Yv?=
 =?us-ascii?Q?yiWDs/uknUF/5DQaI+YycL7BijbNJtCJ2fEvKuGXSHiUuG+JMlYkUQsJ4I5B?=
 =?us-ascii?Q?vuujJctavjFW7MPuMr0JOWjxLRRWSQ3McM+LxU9DZ4V5k1Gw1W9BY95W1xli?=
 =?us-ascii?Q?KQstWY/egCVZwWREFjAjkxUvy2BazuL+eJSDfVBrYUc1lghfRdhCl4gyEVxH?=
 =?us-ascii?Q?er9LgFwkUYa0xgVBtE2f6f9JNBvVZKp0acMK/Dmf01Wn7aLsNP0R6Iw549yr?=
 =?us-ascii?Q?/JDdkQHuld2AmVFfXvq1wL7Isq8CNjkasyNCfbU4HIinQPJHNo9Lhr0P+hKm?=
 =?us-ascii?Q?vhtpG9F/u6O9OnF5QJeiDbHcUTEYu75OtV4ziZnczbGZoGg12HTQMrCH+3k0?=
 =?us-ascii?Q?Q4gThB1JaRB+5U1J8dKoFugOwirMvICAw0UJ2hISWIpRzmMxqvdYserG9qw0?=
 =?us-ascii?Q?0ueYJbaqAkivqPgeAyXLsAGQ36sbJ2qoYIZnVNWuxEDmQRaBO7kWP9ax/w6z?=
 =?us-ascii?Q?8/hOosA/TCx7rYv9RthF5ppJ1fFgMsGV2/AZ/utdFun59nSicAMYgdVZTOqM?=
 =?us-ascii?Q?EIhLjiAJ4y665k2aepo6KuZc46MdDwkngFePcaCPxl2WD0jSf+IWBF2yS5wM?=
 =?us-ascii?Q?0C9Bdy69E4U6j0SFFohTESCr2ct9G3os06yxaz4NQbIZLoY4bIcyb368wdxC?=
 =?us-ascii?Q?Sjfl0iJlQxXwRQTqULCvBRPUxQuqo8QDIDOLnq2B02txdPSU7NZPluRmvspv?=
 =?us-ascii?Q?bj6f7ZsCpLlHuZigwJfsurIqeUAXBMWizJdhmhnO4Ikge19CdZIRAgnLfPcD?=
 =?us-ascii?Q?ML5n0zqvzEFM9HURuLNJutNrRpO1DRMFIhwZqrtxKVUZvlK4yNGQvoxYoy9K?=
 =?us-ascii?Q?sX/g6ihafXNUNbDc+aHOq5jYAfgHqKSXhCrXlf/2H7cGa1wRBvr3udMpDHQK?=
 =?us-ascii?Q?QEpa2XyUWFDRl7IP5r/ABYmANLMe6/BAnxOhoCIFe+EohDRCMitlBr9vPcPD?=
 =?us-ascii?Q?9eh42fmLJV26M9Zfp1KCeqe429k0gJ8LVqP9e9Ywb2arVEiPyn9wHdA0Lsdb?=
 =?us-ascii?Q?GQce0nW/yxct8vZLHkGjFIzH9eOTQ2xfPptloD5vEbU7MoXaQd60i00O0SH3?=
 =?us-ascii?Q?H6z+t3WeBVeWwZDuypcLm/WgpNgMCXQ0pvCgSgN0d5oJoKdPYIWtPBxBEjqI?=
 =?us-ascii?Q?xij3oBCCK9SXbpQYYq+9tsryplApn5isaz32zDrX6Eq0SwuIYG1+mTCIkuRb?=
 =?us-ascii?Q?rJXsuWAgFcvNsQGRcxANz2XAvQZ+AKweuSAow1qSVUfXvSvxyFowk8mpTt+S?=
 =?us-ascii?Q?Hzoh36K9FZBqq7zF838xTrf6rHQEUwZ8NopNPcW1rJlgqC+P96vJf7HZwCk0?=
 =?us-ascii?Q?L7VFtXJApgY3i0RoTa2YkIjTERuwP7ZYW2zqaIAQqaunlKWDkPxnrlItVeQq?=
 =?us-ascii?Q?KjoRTbZ52nMQH3LNDqs7AmJF/OOPliplFEPu4Em2K/HkJwVkvpEmRI20Q0EH?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ur9ve9D7F/MIxud2zpRSMa+9hhATltoViohsKbZQZK2euieM7tay3IP8zt/xjOnNLNWkyy2eX2r57nDO5+GaBkGk836anKNtBa0Z6ZQtBWwe8vI1SA1sOLP0YGhfA8eWSwRPx/Sz7LrZjAdK0hBgoJl9lZ4/YxctMysvDIgrzdwcSDhuxx8kOgkrOmufrCYrE4mVJY+DBrtFOpXS6FX8arqQoq2hIwuTStHItqsNeNel/63/w+eNTCYiYjuiBqtSSqG+8TZAppRBVuxDjwo+nspPD+n2+/4IPHc4l8Mus8m8f16lYONaR+bKV8JHltH7PvAtD8qVUr4wWB6Kce7N+4FiVU7XxaS3ufVPiP6/di5E8/psQ/74MR4hMbu4nD3JPJyJ8AMRd1QAQVMODBHEwjzaVEWxq3OU9fbPzO+ka8TosB+PlwokB1HIvvPxCOhxP8oEBzVDTMwyJ7F33IAq92Y09vn6Ji75WwTegxsMxTUhYZQiTXgQRukvlc3A4bzQnI/y30phb75UyRZf8oUJdNTY4XWEOtZbsp17b/nC/NZCgCMpcVpGAmAQFAevThuWlYl3BP5qELwpdft/3PfIFQY5faozlOCFNjPuJij47e4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26abf665-6f00-4e33-18ab-08dd9246902c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:49:52.2720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSFS67PA8qvGb4FXBjjtk5Pfgpm3cvRRdV/eC6BugIfkAzmaGpgtaTjYNOLJwu7o2kvHODiST1dpwPdJTf5kYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5860
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505130169
X-Proofpoint-ORIG-GUID: Zuz5mOKiaeo72PM9YNVBYxETY5av78EV
X-Proofpoint-GUID: Zuz5mOKiaeo72PM9YNVBYxETY5av78EV
X-Authority-Analysis: v=2.4 cv=XNcwSRhE c=1 sm=1 tr=0 ts=68238644 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8
 a=yPCof4ZbAAAA:8 a=Fs7_O2MAj0hKjSLsXisA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE2OSBTYWx0ZWRfXzEn3h5VYn8eD
 PHrjDEys8DhwAbtCm/b/52b6Mr4RTKRb4XZEHO6yy669qqOvlKzySCwHoc+sXXuZYM0pnaFVmwy
 waXn9KmZVbqM2JABeVsQKNWFSAEZIPE5aSpMYkBHuKhxwsUmdR/XMrDpauNjJzPQxgjqTwe6cIT
 nO/RdSoJMi5wexTo8raOjCpeUQXVQkFYpBOSasCCIaCDHBFbzuzgIze+NOsC1d9EB/Hl1lc1cBn
 FzlJAX+2d6fRJ+K6WcmwomQtm8jzUz0hKbVPl2dlCJQUYOPxlL1tKeXfqYU5itW/PZmQDa4yw8H
 gwISVXz1MeZ0cG8s1Pl3tDHeoFSIXVDyZuvuPsc13UfTHq8PuXQYT+eT/h8YlxXZl4TsHokwDIj
 Nv9bV1i0lEVKw+CNECLrQQgphWHKiTx+iXVTr6ds8LqU1hRVL6Z07uIoYcWlSTy/pCvQjGzl
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

* David Hildenbrand <david@redhat.com> [250512 08:34]:
> Let's just have it in a single function. The resulting function is
> certainly small enough and readable.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Same comment about interval_tree_for_each_span() here, I guess.

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

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
