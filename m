Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D94BAB5924
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 17:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D0210E0A4;
	Tue, 13 May 2025 15:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="ACrIwDFp";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="p5JGkTwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD4010E0A4;
 Tue, 13 May 2025 15:54:50 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHNDp026282;
 Tue, 13 May 2025 15:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=mx7HWSOKJbWNwmNSmV
 n+iWbUiMIYV2dQr6M2sjUs0bE=; b=ACrIwDFpO43vmtgqtpz/wtZ2JEcxYUjD+n
 yx+88XMvsr+BLd5EPG1J9OyT1e0asg9MJQHmT0uPAAyPTpYpjvlWNO1r6k1NmfGM
 qDD0gS1CCm50Hp1F7o5rUS2ckMbBGDQfbM5qYn0skgb1MsJvBZ2TOP7NFM1tlCjv
 Lesccy4B+eMEmgQSifXI9IsH+NhPGtBClOetHOl06inS8fqA6P0SbWoxlsTy1a/y
 IRLKG5yNeNhvgv+MuEXrDQoy2D8vkRs/6brkpsM/Qf6R057cPVdq7Dtj+0Z2YHMj
 5CT3OW1ZdeGyQy5D5cCbC+g9wH783aDc1IT8C6Yn+aS2K/hUvvAQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0epn41a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 15:53:53 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DEgcNK022359; Tue, 13 May 2025 15:53:52 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazlp17012037.outbound.protection.outlook.com [40.93.1.37])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46hw89vmgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 15:53:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuJQMUzm2eNx+dbdyrve5ivqzBpkravQxA8CBlcfQeaeAg3DO8bfQcvpou5DhjLIktuq46gz36R8pXNOdMBdXhElAWd0wlP2ssOD9Tgxck83mcFQkc+zEDZCQmY6oUAymGtCMY/MKBqat+gO6VS/JpaMPtvD3sSNEAH0UtyS0w4qX5Xm4f+v2Sqb87aQYOWbXDB4zEUkNiyHJRbjK9HsUTrsRlKIWwjxFXDdM5nx4HEniwMK4WQOugtVHVn7iGa2OTlii6DMWIEjZ4P0LYe/qAuquMFCQa1n8T1xUIMQx/PgdOot4qRCO8yyGSN2KzlNV/hp6vUOfBYjmVH2A8akgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mx7HWSOKJbWNwmNSmVn+iWbUiMIYV2dQr6M2sjUs0bE=;
 b=feKJUrpagnJm1OQzpzimBOHmAe3XRaxrsA3NLDRO4uPTOZX6HkY+zNKG3loEgNk6pIiRK4bPXQPj7CwkaRljmaAsmTw0KXnQ5zMV0F99GS85oQ2n8oPPY4p7v4Ra6JWth+NrLVWAI4Uuv2Rq6P4/M7s4h7YFqxrawCkNcrjJ8tWCIbYgV5uyIABWnNiN9Z5VOtutYiCltUBeOiJlQ1CuHeuB6F2vTF2Tyeraart/I/y5luu4KeSw+R+8wD0X3lEEugFQD1T4pjY9KUjTTvElctAsc39F+fVW6acodocVIX6gKzJuYnh9e8l2rQjc2gqhw4c+LX+cS9eXt7Y3whsfjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mx7HWSOKJbWNwmNSmVn+iWbUiMIYV2dQr6M2sjUs0bE=;
 b=p5JGkTwcKCpo4H1nDhCkTGUaJmb8gt7izKYYzby6zr1Jm2C0dZI11hv4xIRS5HdbYVovr3B93Y4Y/kGjkNMJxVTY5XCmc767QiqE8prlP6uZeJeyNZKZXEI08cvCQfjLP103yVU9hBow3s4z2dxxmlXX6YkZU9plvMrWf3bPoiQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Tue, 13 May
 2025 15:53:50 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 15:53:50 +0000
Date: Tue, 13 May 2025 11:53:33 -0400
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
Subject: Re: [PATCH v2 00/11] mm: rewrite pfnmap tracking and remove VM_PAT
Message-ID: <2smxfvgmkrac4uzjwti5sgv2ubzsfgt24e6yinwtl7iuchxjt3@c2ejownpooio>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0230.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::34) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA2PR10MB4667:EE_
X-MS-Office365-Filtering-Correlation-Id: de9390b0-cc3c-486f-73c9-08dd92365a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vj5I5/KIyWGnDjk0sgxMI6Ni6tO09ERPTNZp4dv7N/w3ZZbWkM0GGgNyHp6p?=
 =?us-ascii?Q?rT74Gpu9NOv2PlluRowaPkNyGwJ5tBsK0GEIaEycW4qT1QTxbyKLpqWf1QpI?=
 =?us-ascii?Q?8ZjB8l3TMDEmQIX7RX0rMB/h1Dsp6bi1t6q3UluUjuCF9XMiJ1jk+HldralH?=
 =?us-ascii?Q?QUtc9eYhJjWWKGYb2FRRTWNNoOXhleQsGhwqpiqmyJPOmV9eNZ9N03cyqSPV?=
 =?us-ascii?Q?KjwzQ3tdSmEBxUZ47FM477Mcmb1uTKVL0mFqabFuvzwNuNwL3mVfXdKymjyF?=
 =?us-ascii?Q?xiIZ++OqSCCA/gtd8HhRXz8as4GSzc0aCXCQdMRY7b9I6Eox+IWfENeOsHm4?=
 =?us-ascii?Q?BvfwkoSk+Gmudbgz0mCgoT/roSjfLSWDpauPOvdGz42mBi+CsHs3/Lft7HK6?=
 =?us-ascii?Q?f/F+LyIGhU2Uooog80enqCqNryjG5EqPYr0lP7asgP2AIfmoGAc29a1uY9TH?=
 =?us-ascii?Q?VZLza+C7SUmHivZtJJzAioVVCX4IXb1UN1eq57uQUTaDXSJJ71PoOIb6nxAb?=
 =?us-ascii?Q?zzfJjhCwzGEWM2QinC12dVvVQiZB8dk/hVWVE39LANTjztWKc364LoLPP8JS?=
 =?us-ascii?Q?7P5s4RZWWHpnZjgifX4kedD0aqAilW1MbtB4DgC0ksdNA+cMMBqsnxA66IrX?=
 =?us-ascii?Q?Wy29iIHHiVoyjFfQiHXCGjmw74LcC0H+6+ybxsJ1XSryx1UcVLdZ+YMKGNbP?=
 =?us-ascii?Q?2rXN78JsSjkPgAVkcJJdA+l+3OouRqhHbyCOjzI0l6auWNLX1put1++u7l/e?=
 =?us-ascii?Q?OBou+DflxC7FSc+A4L6FogETJ1/ITds+ZvSaUSYqXt4pykm4iKt3dw/n9Rvm?=
 =?us-ascii?Q?x8lfGq9DGiCW4UXJECOX8BocmyHo4cqVlYpdIvltcCIjyWfHBVsHcM026EPU?=
 =?us-ascii?Q?3V69JP7vD/L05R8Cku+Ng28HDfcukoF1FmO0TEoFHWBfzkSFR7zdboX3FiVE?=
 =?us-ascii?Q?7M1DB0pEkpTjEOwVxy61iXkXPAZNJVwYaji87JQQSSJDfU26doMcvwU1DszV?=
 =?us-ascii?Q?Fx9tFsEJCpLJZYIb2rHwxpq+3ouv0JcMF1/uU5Zpx4sen5w04nHIzI+MIU56?=
 =?us-ascii?Q?gPdASVOoaLnKFubgM8H2cpyQZLgIUXj1oRnMBvTV37W6wOhPRE44rdD1XNJI?=
 =?us-ascii?Q?qNgtp/48tyuBEtFVVeaUJWT6P8/KOJY6MlKLeEcdHJgkNH8OXN2Njzu/Klwk?=
 =?us-ascii?Q?hzO126++O1SvhVvNPiWEKU9Y1BOmiR9EKrLp3wS3g2OeEKTxJsrdAnzrCSjh?=
 =?us-ascii?Q?d6zOXUh1e+LaDWcrpG8PHOdIrBEBnNSJp8daK4WjuSIuTv4G1oWkSs6pSshZ?=
 =?us-ascii?Q?pS4SZsj2niQRiRct+ohxzr2hTZyKPj8ptkTtiYCefwkd/IOaSs0vcfiG2pRA?=
 =?us-ascii?Q?gKL8E36iFAd6jMpfq9nxAKUTpgfJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kKeVxmuRoZVJQai49RSXrQEE5wpe9eR7kFfDCqO278EUankoYe6AYDUolHyE?=
 =?us-ascii?Q?i9R/k1a6CUisUnf44tu2tvzSCWAvUnyKqq9i7OgOmBtowclQ8LZJ1HAyejmq?=
 =?us-ascii?Q?tLUiZD6Rd9k93pSv3UrP1/kIE4bjMwDXLWg1DXyjKR1lSrO8BcO+LutIRwxq?=
 =?us-ascii?Q?LKQ7fXxYYpg8EM/02Jfq/cM/17JAR3hbwr58/1p1uwn1PnDfY9sxlQgS9XyR?=
 =?us-ascii?Q?qpZIx05DgMtl4Iab2JQ4/+lqRJNXHUS6wj8Or94GgCd14crTtS33ogy8rnve?=
 =?us-ascii?Q?WqEHkAqXW4BuTFja3+cxZadk4PYsHs+E6ySJ7fviI9++Fq9e58dNc4QSa7hb?=
 =?us-ascii?Q?rQuQvBc3zA9KN/6k74FEx5s+MREOrpbILjJdAYWmCX+fe7kwyPGMt0GBef8z?=
 =?us-ascii?Q?UTQADmDMH9TRHyKX4YjXNVTOv7dlV50lIxqjTG38GfsqV2L1PYGwz1HK+qU2?=
 =?us-ascii?Q?SsWGGJY3OYEyRVPc8qy7UmK3xXKrN4pyh/jif1L5V4edhCWHuuHmqkQOWas4?=
 =?us-ascii?Q?SLEkuqWL2U5DtuyQ91TEw57lMyKBmmFOx0WMkUxRVAYPB4HLy0+7rnzinXJo?=
 =?us-ascii?Q?GA/C0+z3criylUWf2Oj2TvSSq+mwB91b6OTSS8NOd+BfE3Axi3iKqjJT531I?=
 =?us-ascii?Q?iG5X8PvIkTXalVPciqug+zHaNUQTJfbVhKv1Rdhh7AyGv0C0IHXaRm7jMVQe?=
 =?us-ascii?Q?OdFi3EJZuqZHww9+dl90FDB5O3seWRI0a1NrjYQh3ioQralpvV3wSnzUmuVT?=
 =?us-ascii?Q?oQ4Z+wu8/fcPmaCDbgZLZz6gheVor45hbqT3O0n8WCtuYiqf/25a6o1uJ/cj?=
 =?us-ascii?Q?jHyEy/bqosni/qe3NhEodfaUZO2CpEuqd6I8dt/cWFMQ+pZgAQEJtlfkxakX?=
 =?us-ascii?Q?/E2H18G8g24fLJs2dF8qXHYu9sSDmqXDWfSjcZnfMBtFXSQLKNHd07xdVPhN?=
 =?us-ascii?Q?7/eHgLdg0KpQUMQuv2JjcknUqtVlkFVhohhxvLsaVpplAubH6OVPeEBG8Iv7?=
 =?us-ascii?Q?6SwE9tHSNm8loHZsLz8DQj7JkdPvoOwSQyg7JfWfsdrHPmI3QwkEQALAS8Lc?=
 =?us-ascii?Q?Sn1xv6cT08yAGtgvFw6zBXWrDStcqvX7rG1wC8khmYJLMajy1oI/Sl5+pDah?=
 =?us-ascii?Q?wjMj1b8gksw2jISZWSaEETcuiv3dSPYnN6Q09Xs5x0zZ9OfPVfkWqin9Kulj?=
 =?us-ascii?Q?yiiPclkZNeq8r/dtU+oLrk+5C6HMDXytzdTbGaW4zfR4iQ4NPHqcO+aM6122?=
 =?us-ascii?Q?+HBg1pok4/+9t9qVjowAPqOXvHaSoLwYgEVlTQVR2ceL2ouJ5l13DsuKz+VE?=
 =?us-ascii?Q?FMBz2OgSiozO/0gt6/alpEJtl/n1+jcvorqk5SWNthloN/A7ybIpfXNO9f0+?=
 =?us-ascii?Q?CrW2AALAC7oqshjpDwFIpFIxepmvJlykZTpOmk/YhgmDXi4bIcg6w0bl6JJ2?=
 =?us-ascii?Q?4IxDMJwQzv8btX+ZBpSHQ503QXbCB2JAikl9XprflCpgQFGJ0xNHU6oOrA40?=
 =?us-ascii?Q?Y39tnMJnz9IM9AYfWLx7gdBVfjkhq2yKK0Iga1lsUYiGqDVxTuuVEgBf/2P1?=
 =?us-ascii?Q?V/kO+kS2CeqsrOtMNj0mtUZXkL3dOr6JV5BidKzG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OMidwcIfAMBpElhMCa0MY4oJ4gfzI84DNhsM0ddafV2ZSro4yLmG8kwViE0HJRsy9ajpjlNVmmjKgjwV5OPU5pFFnv/jmFajHU3ROi3ZNWbCnQ4fwjM60auMW0POWapb/WzawsCD0gQl260RQ8TBRN7ZhYtD3aJ13i9Dpa2aYnwkIWnDe3f4vz3dJin68LYPSIwJFeFzzlNkmh71KTlbeR8jIz2ze92f9rXhn1mzzQ1hShczol8Jlp8HuZNeyQJE5ICcjfxAusofJHEPBWxhY9/kT2siEjaS8UHhVLOGJf29dvOq6k3J+sehmxx8zqYiBfoi9WlTaQLx0n8xL22AN4i/kl+W9LJPPnVTl3Y/QE35J9obo7h0I+Z0ksJ9cM5RrROufiwJmCP5EH2aRbIu4yfRVFLljaYG6VSnOd7SyzhxTEp0wgrUmqgPjK2k6fLfWgzWS8278oUYHnUet17HnIY3/Txv4gmEeioaQp4BV3+Lc4GQUNc2zaXGaqe5FQzUx+YELdNmRnb4cEy5ml6K8M1KXc5YuATskAd6ruXcrLKZbzJ6uiTF+v7UPFyzLqooW7ThSB0FpJMyhkdCwA6BRs6XlDugflrpBETPf5LkAQM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9390b0-cc3c-486f-73c9-08dd92365a6b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 15:53:50.1234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxY8Tn+bJ/BVwNi8f5VXgD76uAO2yDS8t+MzHUGDjoOjgERwqAsnc0lDSCBFQX8ARNidvhl+PEY9p5olVFczwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4667
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505130151
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE1MCBTYWx0ZWRfXwD0wklZyOoXF
 Ot8jQz39B5dON47+QViSClPdGctuBnZVfRjMl8Pr2AI+TxveQskQsEk4FkbRA8/ITZQoKLXWYUA
 znIk3Ua+RPwLQ1ampPW7+ZmiS6HHM4A+XoCiZY6kdPOB1osc17WU8hD/BVfqwQUQ20qUSpkJctZ
 HqT2kQgjBr+y1pOXzvSVBmECIruDs61xh8Ro3Dl/2YhCH9ROSlZdZ5D5Jv9NvCNbLS3bkex3wWR
 xylL8Fxy9jW4NelcgR0jg6fVMh0lw8wW0VoLFMBobv1UQUxv9TLviI8/clKLtnVOKTLRCc22pLI
 RDN73b32/hyFdRsC17ZelYbcNcqGEygf1SK83oHLPM4xngsxLuJVFx+r84REx3+UvFLvdAll8P8
 4nrE14Pta0eDc2wFVh1PAYderyfAfB/QTctpZx2FOioraJkbXWAYiXZqZZqZIyhgTkrul0H+
X-Authority-Analysis: v=2.4 cv=DO6P4zNb c=1 sm=1 tr=0 ts=68236b11 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=oGMlB6cnAAAA:8
 a=GFqr32JmAAAA:8 a=pGLkceISAAAA:8 a=Z4Rwk6OoAAAA:8 a=meVymXHHAAAA:8
 a=7d_E57ReAAAA:8 a=yPCof4ZbAAAA:8
 a=1XWaLZrsAAAA:8 a=rfXysytXRDsx_XJMq4wA:9 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=NdAtdrkLVvyUPsUoGJp4:22 a=f02Ha7HRcztGgdyUxOxW:22
 a=HkZW87K1Qel5hWWM3VKY:22 a=2JgSa4NbpEOStq-L5dxp:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-ORIG-GUID: ty9xaWMHKujyeRSBAF7bS053AdQWzVTS
X-Proofpoint-GUID: ty9xaWMHKujyeRSBAF7bS053AdQWzVTS
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
> On top of mm-unstable.
> 
> VM_PAT annoyed me too much and wasted too much of my time, let's clean
> PAT handling up and remove VM_PAT.
> 
> This should sort out various issues with VM_PAT we discovered recently,
> and will hopefully make the whole code more stable and easier to maintain.
> 
> In essence: we stop letting PAT mode mess with VMAs and instead lift
> what to track/untrack to the MM core. We remember per VMA which pfn range
> we tracked in a new struct we attach to a VMA (we have space without
> exceeding 192 bytes), use a kref to share it among VMAs during
> split/mremap/fork, and automatically untrack once the kref drops to 0.

What you do here seems to be decouple the vma start/end addresses by
abstracting them into another allocated ref counted struct.  This is
close to what we do with the anon vma name..

It took a while to understand the underlying interval tree tracking of
this change, but I think it's as good as it was.  IIRC, there was a
shrinking and matching to the end address in the interval tree, but I
failed to find that commit and code - maybe it never made it upstream.
I was able to find a thread about splitting [1], so maybe I'm mistaken.

> 
> This implies that we'll keep tracking a full pfn range even after partially
> unmapping it, until fully unmapping it; but as that case was mostly broken
> before, this at least makes it work in a way that is least intrusive to
> VMA handling.
> 
> Shrinking with mremap() used to work in a hacky way, now we'll similarly
> keep the original pfn range tacked even after this form of partial unmap.
> Does anybody care about that? Unlikely. If we run into issues, we could
> likely handled that (adjust the tracking) when our kref drops to 1 while
> freeing a VMA. But it adds more complexity, so avoid that for now.

The decoupling of the vma and ref counted range means that we could beef
up the backend to support actually tracking the correct range, which
would be nice.. but I have very little desire to work on that.


[1] https://lore.kernel.org/all/5jrd43vusvcchpk2x6mouighkfhamjpaya5fu2cvikzaieg5pq@wqccwmjs4ian/

> 
> Briefly tested with the new pfnmap selftests [1].
> 
> [1] https://lkml.kernel.org/r/20250509153033.952746-1-david@redhat.com

oh yes, that's still a pr_info() log.  I think that should be a pr_err()
at least?

> 
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Pedro Falcato <pfalcato@suse.de>
> Cc: Peter Xu <peterx@redhat.com>
> 
> v1 -> v2:
> * "mm: convert track_pfn_insert() to pfnmap_setup_cachemode*()"
>  -> Call it "pfnmap_setup_cachemode()" and improve the documentation
>  -> Add pfnmap_setup_cachemode_pfn()
>  -> Keep checking a single PFN for PMD/PUD case and document why it's ok
> * Merged memremap conversion patch with pfnmap_track() introduction patch
>  -> Improve documentation
> * "mm: convert VM_PFNMAP tracking to pfnmap_track() + pfnmap_untrack()"
>  -> Adjust to code changes in mm-unstable
> * Added "x86/mm/pat: inline memtype_match() into memtype_erase()"
> * "mm/io-mapping: track_pfn() -> "pfnmap tracking""
>  -> Adjust to code changes in mm-unstable
> 
> David Hildenbrand (11):
>   x86/mm/pat: factor out setting cachemode into pgprot_set_cachemode()
>   mm: convert track_pfn_insert() to pfnmap_setup_cachemode*()
>   mm: introduce pfnmap_track() and pfnmap_untrack() and use them for
>     memremap
>   mm: convert VM_PFNMAP tracking to pfnmap_track() + pfnmap_untrack()
>   x86/mm/pat: remove old pfnmap tracking interface
>   mm: remove VM_PAT
>   x86/mm/pat: remove strict_prot parameter from reserve_pfn_range()
>   x86/mm/pat: remove MEMTYPE_*_MATCH
>   x86/mm/pat: inline memtype_match() into memtype_erase()
>   drm/i915: track_pfn() -> "pfnmap tracking"
>   mm/io-mapping: track_pfn() -> "pfnmap tracking"
> 
>  arch/x86/mm/pat/memtype.c          | 194 ++++-------------------------
>  arch/x86/mm/pat/memtype_interval.c |  63 ++--------
>  drivers/gpu/drm/i915/i915_mm.c     |   4 +-
>  include/linux/mm.h                 |   4 +-
>  include/linux/mm_inline.h          |   2 +
>  include/linux/mm_types.h           |  11 ++
>  include/linux/pgtable.h            | 127 ++++++++++---------
>  include/trace/events/mmflags.h     |   4 +-
>  mm/huge_memory.c                   |   5 +-
>  mm/io-mapping.c                    |   2 +-
>  mm/memory.c                        |  86 ++++++++++---
>  mm/memremap.c                      |   8 +-
>  mm/mmap.c                          |   5 -
>  mm/mremap.c                        |   4 -
>  mm/vma_init.c                      |  50 ++++++++
>  15 files changed, 242 insertions(+), 327 deletions(-)
> 
> 
> base-commit: c68cfbc5048ede4b10a1d3fe16f7f6192fc2c9c8
> -- 
> 2.49.0
> 
