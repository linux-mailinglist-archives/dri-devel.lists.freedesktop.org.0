Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4482E72F199
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 03:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF2C10E3F8;
	Wed, 14 Jun 2023 01:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2195410E071;
 Wed, 14 Jun 2023 01:21:25 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35DGhxsi023878; Wed, 14 Jun 2023 01:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=dMM8w9pf86PhRklwfY86e6q2rasuh+eE61w8/97jSrU=;
 b=uObAXzBl8Mez4qvnuw0t2fx63sjfHzXtA0l0KFpcfHtQOmBzWmIcZgowZ2zT8+TRoSch
 cgi65tTAwM2PriyA+qqztN71OyE8h1gLJnB3eEPUHRT8mlI4C5nEG8ZMOznCTqdz2mDg
 3FceZjRpH0ScnDY2hrNfo+YqJt9w32lzt3qbZXgd0IzhZoHMYVsopbtDuV7XoyfstWnR
 QMLSFgtO0nweW4V38Xk6Hvq+J6c7eVKM7UBZQWYNhlsGTxKTDuSeyuthC5Fm1a6v848x
 rP9OoS6MVRnCbiKWJSgUvcG7uWgxw5LlQxVFMo63fmLJG6z8uWNqdxqQGWI+8RAk3q6w Tw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4hqupgqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jun 2023 01:21:04 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 35DNjPZS008467; Wed, 14 Jun 2023 01:21:03 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3r4fmb694m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jun 2023 01:21:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mdmk4p5JhfeXeFGdlsQ80oqmOCabqeDUtJQ794nlH2KgX+JvDlSSWeFHLFTj3N9O3/EunhK9uq4zKk/ciS0zW+6jcqVvLLl2dr6nKs2jXtioYGx11m6WJMBa+UnRsGGLs0h19MZbIuCX+xgMPu6bRYxet3bImKNs6fYMl5p8pHS65BpzgoAjLtp/97iX0chf/tyr6Ak0ldFj3I17txVHTNqLBuCeYGbEwu0Bz/ovUb6JSW+XcaBFxi3nCZNSPVk2q6lFW/AlBkKrxfbTal1JozuOlSvs+0wNLNCCKOs9tDNmkmADciRbDD9DfbB09m/m3R8ddMei+7tslCEfdDWhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMM8w9pf86PhRklwfY86e6q2rasuh+eE61w8/97jSrU=;
 b=VIzE2OeXJDHj+1E6gSNTeocnLE5HUt4VvPIMtFcKa0dcz4TN7HhbCHXFGuvg+LPRZTjoYPQVHMKMsHRJHDYeosrixAY8iueEsMJe8PN6lBCqB2D/jvxuEcz89GUNxmtnMQr2bko0+gyBW+JamNuTmB9NBSwUEoWpY6F/pxnnx+FxBNoSux7ORyVV+pJTgX9RwxyCQ8xK5UWZdvbhTKU2pbFrmAPC2QJWyJRHLdtA6+xiYn8k37idQOyYWwBn6+zl2M0/bT29+RjuNfb21PwDRHe7GMOp5Hx2NnvplDXciLMMcWzk6ni8clVo4ICeKXQWaj+62ihE+ZNF2ThQHaTq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMM8w9pf86PhRklwfY86e6q2rasuh+eE61w8/97jSrU=;
 b=Di861fCVTVST1h/RKzT3/nc03d2FaNLhlSuF6qc2FHIhdjBu5+Y+hgZD7FwhNIAHESY440TVYeJ168jM3YlFj1RDEKbfzq/nuq/8FIqyGSDbJmdvqXRNmmI6+AkXH5XDPDpVF6NEOloiZrkcjOHkqS8/NKdM1rhmoBRZ5ApTZ5s=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by BLAPR10MB4849.namprd10.prod.outlook.com (2603:10b6:208:321::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Wed, 14 Jun
 2023 01:21:00 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::998f:d221:5fb6:c67d]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::998f:d221:5fb6:c67d%7]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 01:21:00 +0000
Date: Tue, 13 Jun 2023 21:20:57 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v4 14/14] drm/nouveau: debugfs: implement DRM
 GPU VA debugfs
Message-ID: <20230614012057.jhyzdliloui5k7yx@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20230606223130.6132-1-dakr@redhat.com>
 <20230606223130.6132-15-dakr@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606223130.6132-15-dakr@redhat.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::10) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|BLAPR10MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: c31576c4-f838-4879-a34c-08db6c759d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xk/ZtxaghqPLs1QIzjbo85IxTsk09UzL4oJAk+CLV0RGW2q4YRZaVXEASe59ZSRLMLdW7K9qKaYa9k2vQlm4BBMLWDqoZQX7Oud9g204+YmtGtE3AYrarb3P4QYYYuvyeXvFHYitPyxZUxFOefMCYmAKaAtiU0ky/oyg5v8BVF07wKqWpnfel2SbDQweU1qCv9YRvxgfG2LFn3nE32NO9H1na1WDzhCXV0lhPB/XlR9phbHj+WueFI/LfCPMWkmw53CAHGntT6H0KsXnturzsUSJFqN/OzGuxmZRHuJqqR+Wdwda6oVXNqQJ3+gH4D0aSzzzYWV/puH+fRGcIaMCAx63nW+/YPlp/mw7tNEVbXJdRZ9qbxPC93DgmubkeTlqDCFLQEi60Ft0ceuplmH814mGnKwbmp6v+rXVLAtDG3JQmJOc7XsDfZj2s2Sfg4JnfAU4zoWB/TQchWHpQFPVL1xRdAo7ADm68+q9qIBW2KFPlAJFyNYfu1KwOMLNNA9HsddFsbLWYGgoYnK/AY31Wal6vyAXSs8vQ6tYr1PuG11IFb3ZxE/EWj7MCIvEKO0h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(6486002)(6666004)(83380400001)(38100700002)(86362001)(33716001)(26005)(6506007)(9686003)(6512007)(1076003)(186003)(2906002)(5660300002)(8936002)(316002)(7416002)(41300700001)(8676002)(4326008)(6916009)(66946007)(66556008)(478600001)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m+Ea8tOAKQ+Oy20gfRTtjNrkqjl7VJsGnjILWR1McOiQpuEJz+t6JgI3he6K?=
 =?us-ascii?Q?QALNjV5lvazzde6RuqEv8ZsJ4AeuWOpcNdmtMbZ4yXtQMRT6ojcuqhlZzpEx?=
 =?us-ascii?Q?pljzgp/WZx6ho5+uzGXkxPXxiB0vzi6QtY90rM0K1pgDm2aLdwiBLdDCMP91?=
 =?us-ascii?Q?D8sIeyLpBrLW69C8AtK25cSYbxo77rp6qrTxiH8uzmYPOl6fjyqXbcW4VHMR?=
 =?us-ascii?Q?Z6WgdcLIJ/XH0LyGJLFd6vnErGYvf1FSetQIBbPv5qSOObLnUy2BL7D9673H?=
 =?us-ascii?Q?7gvW4AphykkuMj79tcnL0sjx/N+35j0dcIwBFHxoWdv2DGcESzShGxsNnR0k?=
 =?us-ascii?Q?R33jBfYograCXIJGFhVOVXtDyuq+xMt60I8NOeKuwfljJIFelEiAVtWog9Qg?=
 =?us-ascii?Q?NHGoxZDvGLLIu0Vx6CL8mui92atr3DlpOEC9BC8jgomvwWuDHOGGR4fauDhU?=
 =?us-ascii?Q?oWFKUPHsyOR1884jeht7IqLgjYdVd0Ud2y8VzP9UtFgNWQFr+2vQ32HHYM4v?=
 =?us-ascii?Q?PJIFCVKFmq51J4OLDpD91E8sOCeeBPj5b0PW2Iqbb7RIde+rWc4YcO5t9Mec?=
 =?us-ascii?Q?tFAJKGHmeUAnUau4pj5NhGUs8p8N0RRKnEAdfhQAQPNjdavnZhiAYRYzcqvP?=
 =?us-ascii?Q?1a2HpEbcMZErIJKT0R5pW3RlabjY0nS1djxf/Q+m4xo9OSswdQp6LiJTq/z2?=
 =?us-ascii?Q?D1rqCCFWeSUGQOLaiy9Q4MWgO5Ws7h3gcU37+YE1wrJskRqMmD8WVLbP/yVW?=
 =?us-ascii?Q?4WftPxt+jW1l2AN31/D6Om9xJVt2ep/0TUHyt7qG2kwjmxpL7lCCrUsE9I31?=
 =?us-ascii?Q?eAw5v+8jzl9+3J8NzpKx6INjHFkt9mxNlfeO3gmJvVPIaYn++Md1WWjTVJVa?=
 =?us-ascii?Q?VYsP9MkZ+kd0Cx0gK4Mz2NZBEGBMcxYIQ/z/e1tqvws45SjjBZxk7BQLbP6r?=
 =?us-ascii?Q?zkKfi6bNsxu++iP8fLvTeHADpRKiaFqUnOpQL/zMhSve1i8MOsl5qEfi7iyJ?=
 =?us-ascii?Q?FgINW4WkO6gjLpzcOB8g65o/ezHssC/j/26AU4eIAZzQaNgxaRSQOtVU5Hl/?=
 =?us-ascii?Q?Ww/to7/iVfhvFHc/pw/2VseyGnr9YAAa6XddPIS2QV7DdKelVUVBlJrUMMc6?=
 =?us-ascii?Q?8oN7ouAgp2mNcnVhp/o3Fw2g7koBtUZiQG6CTsuGxrkWNKSbaC9USplh5c4E?=
 =?us-ascii?Q?7Kocnkx37sehpdTSwCCs9+at6+2iztmLCtEAmBipt51bsXPv5CZUSwhRZeFM?=
 =?us-ascii?Q?hszIvaw3MebcHUELilMIohUYrPWv9gxO+/bnUmHgJUVSTO5F6hz3ghSZepPD?=
 =?us-ascii?Q?Y+r1ffsp+uwSJbeV4wir1lHrs7fzLkWugT7NCaUV0tRVUj7q08LUKn56BrlV?=
 =?us-ascii?Q?WMZG/xQ2BpvT58fKERWalQYRvjBv3KXz19SJ54nN3n/DkDvfnYTSZYOJdZFp?=
 =?us-ascii?Q?aPMt4MamAk/dCoTUP0VHq5rg0z6e5DfbCrgtfEdf/WKCFohXm+j2Ybsllpy5?=
 =?us-ascii?Q?jYy382siFnsCQ6EXPXJ3P9ShdVq+u6iPEIUw9Y6/wSLZHPbbPEoUJC4zfwSt?=
 =?us-ascii?Q?uWhY3qwewYjHaWOjDthtNRJ9WKPmcZJKiorOLmK6yKLC42/Ty8mZJAcx1pCA?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?jnGOzA4bC2g+sJnur02KbNMtglRqaaHBFtBSJKXFg81v1WFWgMEG8kPHu571?=
 =?us-ascii?Q?unwOkNCY9a6vTpKIobB1f33NuvwcNyQCoPdioMNNm1Gpv/RZekkkJNUJcs6j?=
 =?us-ascii?Q?O9kaJ8cnxG8OgQsjzyhVLcuko0vYj3vY5SEmD6rEdWxfmu0niDks3IXfJDF0?=
 =?us-ascii?Q?ZgdgtyRbyX77Yjy9ad3B8+EChR7DuJrvV4Mo0YR7ehQCa9VGla8tTwRi3nCV?=
 =?us-ascii?Q?0n8xfeWZCzBitSADNNTGu1B8QyyCvj4tz332cWXAhlVfjByCeTKXnn8n3F50?=
 =?us-ascii?Q?o3DwZqROi9ih43WdBHOtVpTMt/BULZweOQLkk6CKMUXlb3eoZyMuKRraPPmJ?=
 =?us-ascii?Q?noq+6VO8L2qFT7LfOIPlRCDRqhNlnmaqZPMe6SwW/qfQ2LEHgWMRl7ub3nHm?=
 =?us-ascii?Q?tWclaI4xDh+3muliDTR5rZ9vaKk9KDFzjkGi1JXmNdlp9Cvgpo+JVZxECo4L?=
 =?us-ascii?Q?YNSCBf0AIQzPG+iKYBQ9rnqxJfBUKZBa7fs2yJ9s47lCGFKXevd+uEmHqQdR?=
 =?us-ascii?Q?lRABLdjZy0SKNygqzkeI9TsoHoR12kA0HiPx8rwz1InepZlEk/ByVy0VJivu?=
 =?us-ascii?Q?mzEaXg4pQ4NQ+rYgujOj03NT31Jij7Nud5e1tJPNYz3JmFvsTek2lMLVgkp7?=
 =?us-ascii?Q?oHRRnzmj5FRxDrZVEYbKPzwHLws9DaMixluGCW6obdYNIM+2g4f6nbu3cpP+?=
 =?us-ascii?Q?72by4ko++Pds1y+nwl34O7yFdGcR6X9ii4JR3CslF7ryPUtyKiBSG4tbYRmb?=
 =?us-ascii?Q?0IeVX00tbfrLpqtg0v7twyF/idpmjVt0fs8d7ZgeG2/Cmujc9GUoj6ub2IKB?=
 =?us-ascii?Q?j8C+hTcV0IwUENQYal1MNcuyIMWlU+FMvhKeb6Am7J39zDQyerueXIN7tTMA?=
 =?us-ascii?Q?zfeo+5E1/Ye5eK61S1oNNDr0VlFcG9kpqWQm6IVVPDPZOOblP36FkoC7ydZL?=
 =?us-ascii?Q?x40dVjuqam6vD2691qvk1y7ALfjQlgM8Bdlfq7ZqSEsFr1xpVGM7K8L/d5za?=
 =?us-ascii?Q?1jhgMCQv6B+lHB9vOBGZg6TkRT9WUQQr/ygPwt1WhJTDgeRmkJq/ualrIjRf?=
 =?us-ascii?Q?d8Tyk4cELgK5R/ae9cvcpmNcAR5Uw+iPJCrdPZPQtCNKuBboLhc8iFqk6FQ0?=
 =?us-ascii?Q?4/MhwTsc3QGs3OfD3jGFfb1BDTJxu50xdw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31576c4-f838-4879-a34c-08db6c759d2d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 01:21:00.8453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwxY0mZQR/vMisQq7XBrQxuH6vVw/YUJkr2BIPuSO2XNMscdy/AOkU8ityMlPWF6Gk79pctORYLK+AGDEMRBzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4849
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_24,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140008
X-Proofpoint-ORIG-GUID: rJdYf5tANraTRlwaW5hFRC3vxYssYZ8J
X-Proofpoint-GUID: rJdYf5tANraTRlwaW5hFRC3vxYssYZ8J
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, boris.brezillon@collabora.com,
 bskeggs@redhat.com, tzimmermann@suse.de, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Danilo Krummrich <dakr@redhat.com> [230606 18:32]:
> Provide the driver indirection iterating over all DRM GPU VA spaces to
> enable the common 'gpuvas' debugfs file for dumping DRM GPU VA spaces.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 39 +++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 99d022a91afc..053f703f2f68 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -203,6 +203,44 @@ nouveau_debugfs_pstate_open(struct inode *inode, struct file *file)
>  	return single_open(file, nouveau_debugfs_pstate_get, inode->i_private);
>  }
>  
> +static void
> +nouveau_debugfs_gpuva_regions(struct seq_file *m, struct nouveau_uvmm *uvmm)
> +{
> +	MA_STATE(mas, &uvmm->region_mt, 0, 0);
> +	struct nouveau_uvma_region *reg;
> +
> +	seq_puts  (m, " VA regions  | start              | range              | end                \n");
> +	seq_puts  (m, "----------------------------------------------------------------------------\n");

rcu_read_lock();

> +	mas_for_each(&mas, reg, ULONG_MAX)
> +		seq_printf(m, "             | 0x%016llx | 0x%016llx | 0x%016llx\n",
> +			   reg->va.addr, reg->va.range, reg->va.addr + reg->va.range);

rcu_read_unlock();

> +}
> +
> +static int
> +nouveau_debugfs_gpuva(struct seq_file *m, void *data)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *) m->private;
> +	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
> +	struct nouveau_cli *cli;
> +
> +	mutex_lock(&drm->clients_lock);
> +	list_for_each_entry(cli, &drm->clients, head) {
> +		struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
> +
> +		if (!uvmm)
> +			continue;
> +
> +		nouveau_uvmm_lock(uvmm);
> +		drm_debugfs_gpuva_info(m, &uvmm->umgr);
> +		seq_puts(m, "\n");
> +		nouveau_debugfs_gpuva_regions(m, uvmm);
> +		nouveau_uvmm_unlock(uvmm);
> +	}
> +	mutex_unlock(&drm->clients_lock);
> +
> +	return 0;
> +}
> +
>  static const struct file_operations nouveau_pstate_fops = {
>  	.owner = THIS_MODULE,
>  	.open = nouveau_debugfs_pstate_open,
> @@ -214,6 +252,7 @@ static const struct file_operations nouveau_pstate_fops = {
>  static struct drm_info_list nouveau_debugfs_list[] = {
>  	{ "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
>  	{ "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
> +	DRM_DEBUGFS_GPUVA_INFO(nouveau_debugfs_gpuva, NULL),
>  };
>  #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
>  
> -- 
> 2.40.1
> 
