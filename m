Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A06A5D07
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 17:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A9710E059;
	Tue, 28 Feb 2023 16:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FD010E059;
 Tue, 28 Feb 2023 16:24:41 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31SGNVet028229; Tue, 28 Feb 2023 16:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=z9KNvE+dTIOucYY3kxpvPG50IMFawzYrOYU+TxkjX2g=;
 b=uI1Xn0AOdmZBub2XQJlprrx8ExyztoOh7k6jS2QFkPWcEkVy2b/dnHiOrQa0JrcHxp8a
 qz3ZsRlA/7fcuM8k7bSOEF2foYFNjSrbMDHFxOTX39iB7RjffYsml86zi2tP3l4DSvRw
 C7aNMg7P6XtxoepKee08ijKyoSHiUSV3pjzfUgYG3ofW8RIGOAIbU8RGb4FSxUVPPAZg
 T+bRf3wP4c6nHWUvDKI2z4ewSI6R5e00WkR5vKY1MguulHkuVyHjNr5Z1tY2Sfg/4PWZ
 BnMeCQ/lDO5Z/Lk9SB0LeiVSz/7o4tWXcrxY2flxhMJdK7sJQNJMaNsbi4xCLmDd5xVw 2Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb9aen2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 16:24:16 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31SGGfDX029287; Tue, 28 Feb 2023 16:24:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sd3ae2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 16:24:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlpQSVqLNpuK8q0qR7MOgV1+jsEB4pmLHyJMMJB80Ry472ODURJZJYK4GADNWLsLfPEhYAnV4sPdxacH2f3T3Wyd6qlxfm6pnqioGZMvkcnM7aCt5VROVr54EZbWJnZy1aN3i0Fz0SDLC3YnwMNgSbCJo4KlC5TX27pPaCr1dKD8xqo8uqa0oXCupXh/vvSeFI5ZsvqY7u00ctFVLRazzQHBo5I2O75fuJoKAkfhLVWqoNPWM+R5tYsxdLak/HeUu8bP2bagim1cRnEjE7gdKhOH/fLolbuOSyXxF9D7JWlRAcuiiql2cePkZzRiiqGXa7J1Tx0mZM/krZ6YdLjfgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9KNvE+dTIOucYY3kxpvPG50IMFawzYrOYU+TxkjX2g=;
 b=JA0zmgfwpNCHIQRpS72pXtBQIAQqkyV1tawRClPctj179ndrst9xSk5A87WW0tmQTRdTT+vU47a4PEtde/x3nmNdgrb20Zb/5vasz+H7w5wOx3dDqhluyRmBopoC/VjAEu54rfRGlhJ4ZhWSaJMbeUTManBM0GMNHmR6eRB0nEfeaaMXgQxg2S0ipU54Ky0zgE+cmxXeq/w18QbCtdL71niGP55IoORUusY72sN6wvQsu/4iC2jiqtHVTLj/qdrz/ZcX05yGVBwyl1YmJeLChxoFO50W0qlA9sfYOiDFPCkNUG7keI+QcodJdNx0rHtLeGENrXvK2hIHJPHXNkh+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9KNvE+dTIOucYY3kxpvPG50IMFawzYrOYU+TxkjX2g=;
 b=OR1d1zuObgR/TphUKenD0kzeTst5S3diKQ5hR44Mc0rBnqjpsfUW4ht16qiLlk1x434g+TVFJk6aa3VvN9hNE+W14TwQsoweD8gGCRRJDwDhMdPpTKD9Vyb2ti/VIWokEn4lQmVyWCtSxPTcYrwMFsAouwDmUwBLDmJGpdVZWos=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CH0PR10MB4825.namprd10.prod.outlook.com (2603:10b6:610:da::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Tue, 28 Feb
 2023 16:24:13 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6156.017; Tue, 28 Feb 2023
 16:24:11 +0000
Date: Tue, 28 Feb 2023 11:24:07 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230228162407.34civk22g5kh7mwt@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <20230221182050.day6z5ge2e3dxerv@revolver>
 <63fd642e.170a0220.f67f6.e248@mx.google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63fd642e.170a0220.f67f6.e248@mx.google.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0186.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::25) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|CH0PR10MB4825:EE_
X-MS-Office365-Filtering-Correlation-Id: caab09dd-4a41-4ac8-72ce-08db19a83968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E0212N22tnMmGO43RW4WKCmAWD15+r6Jm2cqLbHPS3p+UmGewDMP6qRHydFK2sYv2aAGtILCZqH28oY5pX8bICLAU2Cu1KPmxQQAtW7WFXtecFxzj/gmLboGKehYFwzJD8iCKrS/1oJWmBIRuaK5txKoi4avQx5Wg8XAg72Mfq/bCsQ6U0MRqmizr91X7yKdBZx2z+4qRlieHg/RyfQ1XNv9D3JJDfWHin1quP+SMlM6wfKCTn8fFIzfWj+xoVMWmYWuaHLlIYcYNBUux3tWZRys/BsXwJTjOtrCiGhLE2SX0qZbWIjuHtiRwFPX3QU0rHn3lczbd6eGb5Udw/bVfNstBl0Oa5vhngSVCoxzfhMmezCNkptUBmNs96BiKZhnV74aKdS1yqN4zht3nw8+MK0MXMmZo3+Uj6Ah7kk4ZzbiIW7exmWgaE7AhSZvyQBl88sjW1HjZAkhU93qXX5MReqMUsTxMJjwvj8ry88NJA64wp26DJVdjz4nf9FMvjznmQdNPSztQnZ7h6kayzKjvth1cQbyYjtGy3FPhAwDeRRHx2Z9gpKYzoffy75enajojmZorE3KV7QwRsINgl9cnir/r0iFkr8ex5wALD6rFJJbl2soiYnhnWwZlnzZYaTwTpLk99sXFrDQYRDQyEqiEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199018)(66556008)(66476007)(66946007)(5660300002)(8676002)(6916009)(4326008)(41300700001)(7416002)(8936002)(2906002)(86362001)(38100700002)(478600001)(6486002)(316002)(9686003)(6666004)(6512007)(6506007)(1076003)(186003)(26005)(33716001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jIS3d3e+a64LlnFm9lhmvxUXOPqkFton2MtlqXGnyohwRyPCNazNFGv/lYYC?=
 =?us-ascii?Q?di3kTkrN1BAheidnTc/R+XTnA+072nxLmPPiwr85RwYPZrCE9nsWGNiY7vb8?=
 =?us-ascii?Q?lMl3LNa07JqOIYdgQmCPtTmzE4kpLHrvQdnDGkkA1+N8b5Vr1CDHRVyJVbcm?=
 =?us-ascii?Q?3rYTvHd4qjaWMG1LYrcz5EF67sUEwGZgv8DDlHy5iDXnKNF4T105YfE//7Q8?=
 =?us-ascii?Q?LHzzhrK6hfTbe9plWdbKCVf6d/PzL8WmZnFlVa6zWBPtPMQp3ufJtFhdwxs2?=
 =?us-ascii?Q?WIyBVcFrq0d2uCHwGqSRxdVuJvA8FBPAOIUR6e4WEnuajyRLR2LcwiWduP1J?=
 =?us-ascii?Q?R5aH0tY0Q8JaIIds4MT9pRpkMW4S4D5bDFLrNPBZXjLTcWhF6RHEoYDmlpRF?=
 =?us-ascii?Q?VbStRnrDQhiqY0KK9htafScQ+GgTeEpQL9H45Z1Nsn6wvFSHSMJH7nyZsyB0?=
 =?us-ascii?Q?jOX/93hj8+xQGuA8krYG14yXnCPBFiPlFHZpeIG1LYP4K8wNmYeWQhmmkX5z?=
 =?us-ascii?Q?tA6e7jLurOp/oQ13JEbzvcLLEVGOykKAIo4HjcS86rceA1cdewtJaViW4TkC?=
 =?us-ascii?Q?gXXA1IGId9J/3QTa0LVxWdw8EVPsfdBvCfCfBLTWVKU9m3niSv4De/Yibw99?=
 =?us-ascii?Q?6ay5myiUaFsa5VL2fS+tqBaXemMFi/9xGxgRO0U/oHGEr+OoiYFSoQyZVO34?=
 =?us-ascii?Q?MfO448c3NqBEy4V5eBlAUywZD/J6HcXyRUTjmY1XVQ6lTiyjjRxs+yL1vVFY?=
 =?us-ascii?Q?qrZWlUo2G4O4sPGQAACUGcEwv0RQJSBhSekz+ePBtczx3zGpFMQPkGL+rWXX?=
 =?us-ascii?Q?ezJC5/c0xSWV27+ZtHbZqoR918t+pl79YwEDzD5RD8NL+nlcvQCtBjjBrpgk?=
 =?us-ascii?Q?fo0daj4sSXKT1oerCmHYbRo5hvy+kB7JNjVTbeOcgr/ky/v+5MBZs00fDKdp?=
 =?us-ascii?Q?DE5lVtjMUC8XlkrQMCO2Rf4fJGv5r3gsll5g3KPW7sYBs8gXo/cx+MJ/k8JE?=
 =?us-ascii?Q?K9BuawIdZXQR2eh9Ztb9Yv07XcL1S1puh6BQGNoJcM+DsN6sPmzhD0c65HTq?=
 =?us-ascii?Q?ZQzZemV/+wEx2gk45Ug3dbhJR0hHH7jQGWIN8W2FoXyGF1k/ucP11eNa82YU?=
 =?us-ascii?Q?Tkml2YfcAxVzByM9uN528dntx5c1jbpLt4V30KtdnUqEWL697jSOxpi8XNU0?=
 =?us-ascii?Q?SNvDSIJYf/oLR+6qogXVh+6WNrXAF5NcTEEupp8/YdPI4U8tLf/oeMGvc+Rt?=
 =?us-ascii?Q?69IRCge6VxLwkAa/kVX/epYDmUl6vv0bOuG7fq6Car8V2Ibu4biYPKbhhxa2?=
 =?us-ascii?Q?cY7gbig18Yb/N6jSYKsdJP9a+jhSWn/JGY9PMaIHpDDqFeb82C/pCI7hSrcp?=
 =?us-ascii?Q?dkLMDAERLXo9c96irDICTS5KPgebUSd8yXVQf1E+18FlhhYUiyl7P6kOQyRl?=
 =?us-ascii?Q?piwPub5bk2aYsryDsQEL80r94xCD2t9GB1fwn/4xCL+kDPKcV9sbAA/O4hd3?=
 =?us-ascii?Q?x+aaH24qOWRl1dENM2p+nbEZPdBfIBbMmfuuxujMj5dr3VWOieyFc0aZVyED?=
 =?us-ascii?Q?h1yncfIiLx4jqlUn+GP6Op0DC0336lkjp7b89b/2MceUeVrf3dvtCzI9mDOh?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?9RVr1YmEwtXEz09ap4XMvHCnKQ56bScAXwPqRu3Kf4eYsaix48+T59+FuAxA?=
 =?us-ascii?Q?sCOpcmUnM5Cy56MH3rY5ccIS490lYAT8ChJny6dYSu4yKgxR/63P2LE3FQtf?=
 =?us-ascii?Q?KkgnlVI/QRxY1TI1ES4CEgC545kfs8KxyTlgGS5kJYED2SQ566fS4/kAKCdL?=
 =?us-ascii?Q?BSyKRWcXvOZjR6ldw5lShUJVUezmS/uDssVN1tSnHpBqhLFfNZNqxIGCLEOk?=
 =?us-ascii?Q?VAkLub/W7LGmPSOjYoAgLrGZ0iCL0RO2ObMFRU2DewmrgKlaDK5BipQF4ni9?=
 =?us-ascii?Q?Ym7L9yeoY2Rlad45KyGBUbHY6UvmU0J68ny+TuIL2d/V5drhQFhpjrneCvNg?=
 =?us-ascii?Q?h5kx0QPYdri95uIUPVHN0x8YWxt8HvZhS7PQJSVfNjbNCF340XaRf0gONsZ/?=
 =?us-ascii?Q?nTWbv9nDdzvZrDMjs+2dIMQNEAGOcu6i8nD9GxI7PKZg8VpL+uYra8yTfVbk?=
 =?us-ascii?Q?mzYtIh5BUcNCViwRrbZTT98D7Q/4POlchEeEUIpu8FTEYfIGNRxMboR+i17J?=
 =?us-ascii?Q?FskukKmqcA57tT5Pfxfada6QOUECVpI0LMeJ4tCHjr6hEbd1nLwWkqmLZhaq?=
 =?us-ascii?Q?g3ZIpVqP6b9yNOUiFFHeWvNOo8n+e0mL085TfKYNbCNPqJLUDe6fQIpGhN8d?=
 =?us-ascii?Q?XO4JgtVZlZ7918hUGnDY9VIppnZ/fGtYuDMC7ebZiMf1MFwd58CNrXIsYBmK?=
 =?us-ascii?Q?TQEONba0QRCIKPwRkJibUECLrCYV9SBJImDGNxrhRqf8dkc/jGOpcMWcUXXE?=
 =?us-ascii?Q?YsImiFJ/ORaShkFmFKsYt/HtL75hN3TbOzqDf8J2dyBy+e+0fah8yBzb7tZA?=
 =?us-ascii?Q?dUV4SAe4FVyOojMtwgTyhffILZyOt9L0MHPb6tzZSWgKfm1LNYWeJH8L0+jR?=
 =?us-ascii?Q?uyZEbpQYTpWR50A80ckzFZUkPTHs7w8QtWkq2rMXDdt5LLMkYA4zSXpwmWcw?=
 =?us-ascii?Q?tM9r8ezFuoY9sbcbd5UbxFz5dOQZ0yJJG6Q5t0GDFc9ib+33KTuIDi+vYWEg?=
 =?us-ascii?Q?tM/iDbDxBKjvbjdPFvASm6TwJasqTN/9BstKBxwGaL2izhg/jtMYuRuqcNc/?=
 =?us-ascii?Q?ZoXkWkMGFVE028jW8agb5YB+Ga2rG++gSpVY76wdAvc8Ho4RmjBNBija+mr2?=
 =?us-ascii?Q?KBFAL4llSZZ66BGEJ1D2gg69yCRO7d/4jA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caab09dd-4a41-4ac8-72ce-08db19a83968
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 16:24:11.4216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZzQGlPaE6eh0kuhh8ebdhhMo0kBWmX7RLpVlKF6p+sdaMv4AEeZDuYxlZoOMjr6xXHslBME2Bsue92JcVXBmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4825
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_13,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280135
X-Proofpoint-GUID: KiKcDv5AtWpM352P_tBj2AAZYNX5s444
X-Proofpoint-ORIG-GUID: KiKcDv5AtWpM352P_tBj2AAZYNX5s444
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
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Dave Airlie <airlied@redhat.com>, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Danilo Krummrich <dakr@redhat.com> [230227 21:17]:
> On Tue, Feb 21, 2023 at 01:20:50PM -0500, Liam R. Howlett wrote:
> > * Danilo Krummrich <dakr@redhat.com> [230217 08:45]:
> > > Add infrastructure to keep track of GPU virtual address (VA) mappings
> > > with a decicated VA space manager implementation.
> > > 
> > > New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> > > start implementing, allow userspace applications to request multiple and
> > > arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> > > intended to serve the following purposes in this context.
> > > 
> > > 1) Provide infrastructure to track GPU VA allocations and mappings,
> > >    making use of the maple_tree.
> > > 
> > > 2) Generically connect GPU VA mappings to their backing buffers, in
> > >    particular DRM GEM objects.
> > > 
> > > 3) Provide a common implementation to perform more complex mapping
> > >    operations on the GPU VA space. In particular splitting and merging
> > >    of GPU VA mappings, e.g. for intersecting mapping requests or partial
> > >    unmap requests.
> > > 
> > > Suggested-by: Dave Airlie <airlied@redhat.com>
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > >  Documentation/gpu/drm-mm.rst    |   31 +
> > >  drivers/gpu/drm/Makefile        |    1 +
> > >  drivers/gpu/drm/drm_gem.c       |    3 +
> > >  drivers/gpu/drm/drm_gpuva_mgr.c | 1704 +++++++++++++++++++++++++++++++
> > >  include/drm/drm_drv.h           |    6 +
> > >  include/drm/drm_gem.h           |   75 ++
> > >  include/drm/drm_gpuva_mgr.h     |  714 +++++++++++++
> > >  7 files changed, 2534 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
> > >  create mode 100644 include/drm/drm_gpuva_mgr.h
> > > 
> > > diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> > > index a52e6f4117d6..c9f120cfe730 100644
> > > --- a/Documentation/gpu/drm-mm.rst
> > > +++ b/Documentation/gpu/drm-mm.rst
> > > @@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
> > >  .. kernel-doc:: drivers/gpu/drm/drm_mm.c
> > >     :export:
> > >  
> > ...
> > 
> > > +
> > > +/**
> > > + * drm_gpuva_remove_iter - removes the iterators current element
> > > + * @it: the &drm_gpuva_iterator
> > > + *
> > > + * This removes the element the iterator currently points to.
> > > + */
> > > +void
> > > +drm_gpuva_iter_remove(struct drm_gpuva_iterator *it)
> > > +{
> > > +	mas_erase(&it->mas);
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_iter_remove);
> > > +
> > > +/**
> > > + * drm_gpuva_insert - insert a &drm_gpuva
> > > + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> > > + * @va: the &drm_gpuva to insert
> > > + * @addr: the start address of the GPU VA
> > > + * @range: the range of the GPU VA
> > > + *
> > > + * Insert a &drm_gpuva with a given address and range into a
> > > + * &drm_gpuva_manager.
> > > + *
> > > + * Returns: 0 on success, negative error code on failure.
> > > + */
> > > +int
> > > +drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> > > +		 struct drm_gpuva *va)
> > > +{
> > > +	u64 addr = va->va.addr;
> > > +	u64 range = va->va.range;
> > > +	MA_STATE(mas, &mgr->va_mt, addr, addr + range - 1);
> > > +	struct drm_gpuva_region *reg = NULL;
> > > +	int ret;
> > > +
> > > +	if (unlikely(!drm_gpuva_in_mm_range(mgr, addr, range)))
> > > +		return -EINVAL;
> > > +
> > > +	if (unlikely(drm_gpuva_in_kernel_region(mgr, addr, range)))
> > > +		return -EINVAL;
> > > +
> > > +	if (mgr->flags & DRM_GPUVA_MANAGER_REGIONS) {
> > > +		reg = drm_gpuva_in_region(mgr, addr, range);
> > > +		if (unlikely(!reg))
> > > +			return -EINVAL;
> > > +	}
> > > +
> > 
> > -----
> > 
> > > +	if (unlikely(drm_gpuva_find_first(mgr, addr, range)))
> > > +		return -EEXIST;
> > > +
> > > +	ret = mas_store_gfp(&mas, va, GFP_KERNEL);
> > 
> > mas_walk() will set the internal maple state to the limits to what it
> > finds.  So, instead of an iterator, you can use the walk function and
> > ensure there is a large enough area in the existing NULL:
> > 
> > /*
> >  * Nothing at addr, mas now points to the location where the store would
> >  * happen
> >  */
> > if (mas_walk(&mas))
> > 	return -EEXIST;
> > 
> 
> For some reason mas_walk() finds an entry and hence this function returns
> -EEXIST for the following sequence of insertions.
> 
> A = [0xc0000 - 0xfffff]
> B = [0x0 - 0xbffff]
> 
> Interestingly, inserting B before A works fine.
> 
> I attached a test module that reproduces the issue. I hope its just a stupid
> mistake I just can't spot though.

This is probably my fault in how I explained things, I seem to have had
a bug in my code.

Let me try again.

mas_walk(&mas) will go to the range of mas.index
	It will set mas.index = range_start
	It will set mas.last = range_end
	It will return entry in that range.

Your code is walking to addr (0xc0000, say)
You get NULL
and the range is now: mas.index = 0, mas.last = ULONG_MAX

You set mas.last = 0xc0000 + 0x40000 -1
You store your va in the range of 0 - 0xfffff - This isn't what you want
to do and this is why you are seeing it exists when done in this order.

In the reverse order, your lower limit is fine so it works out.

Try adding a check to ensure the lower range is still accurate as well:
        if (mas.index < addr)                                                                                           
                mas.index = addr;

If you compile with CONFIG_DEBUG_MAPLE_TREE, you can use mt_dump() to
dump the tree for debugging.

I also have some quality of life patches I'm developing to configure the
format of the dump (hex/dec) and a mas_dump() for more information as
well.

> 
> > /* The NULL entry ends at mas.last, make sure there is room */
> > if (mas.last < (addr + range - 1))
> > 	return -EEXIST;
> > 
> > /* Limit the store size to the correct end address, and store */
> >  mas.last = addr + range - 1;
> >  ret = mas_store_gfp(&mas, va, GFP_KERNEL);
> > 


