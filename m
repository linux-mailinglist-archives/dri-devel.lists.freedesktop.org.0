Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A869B262
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 19:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8AA10E1EE;
	Fri, 17 Feb 2023 18:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3505610E1EE;
 Fri, 17 Feb 2023 18:34:29 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31HGOvY8017750; Fri, 17 Feb 2023 18:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=ZQyM0V3SKypgC6U4iqHUR6BQCBjE64fhVOrbxumNWOk=;
 b=kAN5nDYqAJXqffRzeVHJFQz0vTqq7qiW8IibolG9xiHDxO9/SEJlibav+HjQCM5X3U9j
 /WTPgp0f6UplhT7ceqstOabqG9KT3C3aijXQrWwZ3omkp/uHRXqwFUAklzTQZKtwMvsn
 If3O4IMFHqzYC/JKG1WqodXyktuRkdJFt9FL8ciMGDAy303mzyJk51BhpfV7NUbPEDW3
 dogN+B0w0FXMv+dK5fIMfxKJIPz9Wq/2QOMEtJeXE1fzzTvmfiQ8hIVEF/QcHrwJJ4BH
 RLJxapE40kNIR/Sg/oBGqtfe1c+gGL8xRP2vpOsqA3scUWIBMhXtceg1qPbhG1PJTL84 8Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np3ju6mvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Feb 2023 18:34:11 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31HH0twc036176; Fri, 17 Feb 2023 18:34:10 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1fafr3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Feb 2023 18:34:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIu9MxMIb8MVflx9X3AV5LtiywtLj4/k17GsxOXkf7rSqtKl7gZ5R8aVUDe4R50usPeasp39ztP3m5iEaMnEdLi30FMI6tiDZxNIsdfwqzwu2s811fiuMMZ6CNPQZVe+wv6o1Jd1Z8a5UOGcWFXzUDoIOdF2IUx4sGM37gfhl/Fejn3lhDRa3IH0a0hH/v+i3QoKgswEmhOd/AVxJd4KAyJHJNTGb48T0sL9SUGWA9W4Mu4knz8WkxoFqL9yEtP1AsKc8ZSPMQCi+BkBgqMMEmura/7vZB8RI/QZbaIQ+Ykj/X16MYkJM0hAibEiJr0dZ3bbbR0BlpwMW65DSBZLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQyM0V3SKypgC6U4iqHUR6BQCBjE64fhVOrbxumNWOk=;
 b=jkdC2q4K+ukN8QiwsqlT4JZZAmIShmA1XnEEbiR9/yR/MDm3M8Xbft/cZTLWLi2rFL97uA/msL5x94VSISE22Q0IepExAUm3TVhCMKDCc16iLGIiYQH4Shi8yjNt4tRw35DBCDvjH4TTVLAjgR1shNnSlppyfzGVINU4HdKRKgNAOlsPFhArWcpkMOtpiArys1sHx3yCN2fbB9q1slr4brvhijQlwivVwD6lKiVKOgxA/orre6C3VUhSr/gwYRx6BhNYDvmAYnKF5apv9/BDcBC4VtVJ4Mb+B8ZmU1GbCqgmjpGBoXQGxrKqQpEX2aYt00Eoy0ejapCh5gK6pAzQ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQyM0V3SKypgC6U4iqHUR6BQCBjE64fhVOrbxumNWOk=;
 b=EICqxrB6sI4rx4fzdqeE4EU14hJbtOjxZ220hs9DawPI0udR+Fvy1kLfXqVD2w7NGDVRiKgVHrQXzweV7HhR2ISF7wMUxHUP16flZ1Wiazz61tFAM1iQYFyRaHhzg2y8F8gBhyCmdXfuCsZYvYYtdeFUgZaW1248lfPIXx7JrcQ=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by SN7PR10MB6362.namprd10.prod.outlook.com (2603:10b6:806:26e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.6; Fri, 17 Feb
 2023 18:34:08 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6134.006; Fri, 17 Feb 2023
 18:34:08 +0000
Date: Fri, 17 Feb 2023 13:34:04 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 03/16] maple_tree: split up MA_STATE() macro
Message-ID: <20230217183404.jmjew5lrduts6cpo@revolver>
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
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-4-dakr@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217134422.14116-4-dakr@redhat.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT1P288CA0034.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::47)
 To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|SN7PR10MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d72be6-2dda-4768-5b91-08db11158e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hSse+opZymEvEdVPmhbGMSZDnLwsg+IKUzyNwZv+mDH/jCShqu8bRBDgUb1BFVYhy1Eq7KxLVR7/wVa2GLlwhPL+hYbTcGUF4ZhejMCpzT0WtZJmktpyNDoxmgvyhxREWGO4egpBLf+SVaHyJwV/iREMr/uvcH7e66KK47YdZP48r2QfimC5n7ZF3JL2B94wRNjDUa3TMa9SB5uH63rg6xsdn5Gp7/deYDdmSfjX3NC06JQ62PgvNou1ikuCqNfzqaQMF1ObbwitZCCe0Kzx0A99CQcd3szM57bGjYkdU5bkmnmkMrlU3+XjZgH3t7LO5LDq1xm3tBhtHfl3b+hNvEhCz3WdknoWJo2QUSjaC/g8R7lO+UhHRvKm+zSFgCyrrueDZR8NsEL33mW/A4ZxxFsFH+k1128XEH4xSY6Ft1S9X2pP8iVrKZ1ITGJYCDcoPuvRcKZL36mvbAVdrpFiJLwnwj68kdqjv5nF0p6SuWdZYwO6Z9Wv/MfMYCufvePKop1IXfE/w5xHX+bwq+MKNa8zLNkBLcpK1tUEqYdFyLb8T5INAsMBd0NwL5H4X+UPrdqC4W166d1e4rJc/6WE58LynufTaQDgX56Tn5fbcgHvHGHMJcHMSnWCtgzf5q7emmINg/BsW6Q2KDXDpP+KCU9Pk2dELiAZHaSEEu38n8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199018)(316002)(2906002)(41300700001)(7416002)(5660300002)(8936002)(6916009)(4326008)(8676002)(66476007)(66556008)(66946007)(83380400001)(38100700002)(26005)(86362001)(186003)(1076003)(6512007)(6506007)(9686003)(6666004)(6486002)(966005)(33716001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y3p5892yfFsD/wp3wuxAFE2BjAfh4T8ZFvjHjQAq55rZcRbvbEzAI6V0JSL9?=
 =?us-ascii?Q?LiumwkJy+yh/ir6q0ff4whgWeLvW+d+2mt9O5ZbFXg5hUM/+Eqa9Bk3Yj8Nb?=
 =?us-ascii?Q?Gm/4Kh8sb0BFxeyMhooBCzgIM5XbnVNcx2GTQgwBD/jB4Xo+d+X2Xx/aPPhU?=
 =?us-ascii?Q?v3Kij1TIHCr9NqbH9lAiCWEnKPO+Rb7mIBkfQH9AOGMAtsxOzwtwhWt2RMZH?=
 =?us-ascii?Q?0Bt2L2F88c/cZfLHMS7x/xcY23WXCOIankcX4fGQIEEMTGKZXz5WyiymRxqT?=
 =?us-ascii?Q?QcWpG2jke+r23lztnxnbzS88Dn4Bz6FNcg+9uetR60e/6XhbvHMVxQdfvCdg?=
 =?us-ascii?Q?0H2Xyh4+y4OZiVtGRxvB+2Bmm80wxr4dx0Ro8XNEF0jeHOug7Utvb6wME1MG?=
 =?us-ascii?Q?VQAXnA7hXj08Raj3JoOTfVeVDgk2eCYTLteqhiF14BQrueBYwNlPFZV1LK17?=
 =?us-ascii?Q?o7DEp46yQ6FWfkHQUVG1mEMNk1Mcqj5UUhWXhlh3lF4CWQodk4bxDCWlnSkF?=
 =?us-ascii?Q?uJhad6CNVFddRa+AZGVtaItQn2PM5pB1dYM3VORtb3lO+HWOVs8cqcMrXMHr?=
 =?us-ascii?Q?tLeS2P9jkSWWjW+dUlJ09lOgpdDEl8aNSkYWCRx2FL/AHABVxvIxmZQwoPxH?=
 =?us-ascii?Q?SiFmBn0w2rNfRxifZuuPuTQ6WCwY+9isOVYBtgMy7sOlGzdYsOziIVmPFS66?=
 =?us-ascii?Q?GkrBstn955E3FlIbvxK9qYiWgqiyO1CZT0UD+4l6CIHoYqNeajANecsx4VZu?=
 =?us-ascii?Q?jfpAGWMbCihYPOb9UrZ0merRA8UJ4BfpiyJuLONl7l9sWF8Lt/4J+KD8+UjN?=
 =?us-ascii?Q?pID0aYmz0Ks8KLhWxZa53YIBj0a7Yx2khl/1g9XvJzapSpj2beXf55MRvwWC?=
 =?us-ascii?Q?GMi1AqROqSXAKxhalf8O7Nl/JnfFomZ7NJ2IYsC0TKNxX4okCEl+v1jy25PK?=
 =?us-ascii?Q?aXOeMrTDLI6cVBhdkcMjX2jEArLU5GorTwMOzYEja0Dt3umVPBWEIlI62aI4?=
 =?us-ascii?Q?Pd/shjqeAc9feywhujUGxrSBOaVnahPKMEtpP+YBXsKsplGlQVh86EGphOCo?=
 =?us-ascii?Q?7+lcjKyE65fY1A2Ps5ILdqvaKRf1M1zkzQbd1Tpx3cBRCrFPMeWwxUV9lW4L?=
 =?us-ascii?Q?CWCrC0WqeBFgvhHJ16H4NND/fxUXqZWbeeC6/Xs3ppN1Vd8alqD1R2XxObff?=
 =?us-ascii?Q?77Prw4iSDN3uGvCHPEPjElYRAHBSFyE+U5khP6alQgJqvf9xqE6BrXyqkNtk?=
 =?us-ascii?Q?Q9ecfE7L6tnnkBba08bf9VbD9og0yd3Ev1Ti2+iwam1NDrgbf2Cdm7u7KJlA?=
 =?us-ascii?Q?NvfGm9EPp86DgrM/Nsbvui81tDskQI8Ntii+09PlvQxXUXQzc+Ms2bTQiHnQ?=
 =?us-ascii?Q?XvYzQK5pVE9V9r+CVwBInXtl/2kxYdCMW+4wrFpzkXvZfuryaqGcoE4iMUw7?=
 =?us-ascii?Q?NrcL8jJFicxRyDVPrGteQV0t+IbpHkB2USXYyy8tfl1K/YViZKcznacRfBA8?=
 =?us-ascii?Q?OS9LYmFHp3RSzNGIZMJGF0cKAtOGdQPqXlH6u1s2+IasmdAargtbWxfTJrvC?=
 =?us-ascii?Q?9SdVYyjlwU0AyOEF02l0pbvGnCFqMlFJ0utlhvR8/iKn1l2brBJZgMLf7rST?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?/SmYmeCspYEwGFnVJX8CoXNl55p/NKaOy53WpO3g+0Fe+xSHkZSiizyLqY7u?=
 =?us-ascii?Q?vSHNsMIGDjpPDbCY4rcFfU/khOhJTLfZIqdHc2rSImAs0lHmy6V88+AeIbb3?=
 =?us-ascii?Q?lbr4TQsQybgG5aBuG+SgtblPGQi5rtqYQnORAQiv5SN6ODWKBC+g70b5+yMn?=
 =?us-ascii?Q?krYEVwH8nTZmuXB+SpBlGxSU2epifblQ9qXfbB6WIWdA7z7OUZK0hMXZnimm?=
 =?us-ascii?Q?moiYUtDAb++2zm6bnwokSZfEamBKnMVunYnIBsRcUYyJuzJ32zkRW3kcviQ6?=
 =?us-ascii?Q?sIgAr/ml/tNDmj0iMYr7IZHwh5HtrzEiVkxCalQvdK9vPtRFeIZf2Al+KPeI?=
 =?us-ascii?Q?PoS1gdxZKvbRNOIkwWjgsSYTgerYbFSCPKatMot1VJV6EQOCe+cEB7RZmhQX?=
 =?us-ascii?Q?bku1Giribvc5T4Cq5LnE4y3cJr4VXhyz2Anfdy02dK/ltqj8Y3ilGTSNXWWa?=
 =?us-ascii?Q?sNWNX1N1Hhhf/1iO33/PccGQRlHxjrx6CIYWTVwCXBHgzdPnnj11g+5zQuiI?=
 =?us-ascii?Q?DfgiLbs5NTQ1p8nRyo8t1HFcoEGDpUZU9WR/VwKa7zhQQTH2hh2mgZl0sINe?=
 =?us-ascii?Q?9KE7CSmTQeHeID3/3FZFbp3Btllovvagj6cgeN5ixhrVZVj+yEwKAmAGQUvR?=
 =?us-ascii?Q?zO8vSN1ePwulWrzIjJHz6EUSPiFdKOG2InsSHp1e7ZvMDQ0hgumDEym8P76x?=
 =?us-ascii?Q?V+A2wKOj6TWbsbjO4A1t6QaS3rHxONp30Rea20MJW58OdNxd6dBUDIeXlM8H?=
 =?us-ascii?Q?PsqhbIo8TFxKcxOJP9pYzTCd9XWK9y7veSwGiUv8oikhMxxorq7DcSQs2m3P?=
 =?us-ascii?Q?4Gs3XyJyWpJgP6vZY+RYNFLhtcHbk5b5iX4ARgY/3jBm6tBvhHYN7FAJCZi3?=
 =?us-ascii?Q?JuukIM8/Sn1cKR6pMoZx+jGPdN4B19TqURd0pGIF48rQ8ostgQFsETIHUGHj?=
 =?us-ascii?Q?TxM/RyKi7hxx8ppkyEVBV73KIaF4+NYU9Vy21Jd68wVzOGRtnm9NFU5zssm6?=
 =?us-ascii?Q?rbATHz43tCRvD2sL4MeiOO35d7wlc33r0BlmV6o6m/L8Zhs/CIFEYP2R0nr0?=
 =?us-ascii?Q?OM3dfipHqBxXbMHKtbdQkESibq2FNssHVLhGu97fLdviFIP8bDQ2R0H/nHMi?=
 =?us-ascii?Q?Sx8u+CjyNouBqrmLRsSDZHZFylgHi9AmBg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d72be6-2dda-4768-5b91-08db11158e59
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 18:34:08.4357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8L0/lU3aoIc5Jf+giDsem9yp70PFXsjt7YNKpzJkyPCB88LAQ64qWGr4thdDNOwMU8SsJCQ0YFwQv+85gtFfdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6362
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_12,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170164
X-Proofpoint-ORIG-GUID: YJQrBpErSkrSxc0hYjdb-CB5nKXv-kem
X-Proofpoint-GUID: YJQrBpErSkrSxc0hYjdb-CB5nKXv-kem
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
 tzimmermann@suse.de, bagasdotme@gmail.com, christian.koenig@amd.com,
 jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Danilo Krummrich <dakr@redhat.com> [230217 08:44]:
> Split up the MA_STATE() macro such that components using the maple tree
> can easily inherit from struct ma_state and build custom tree walk
> macros to hide their internals from users.
> 
> Example:
> 
> struct sample_iter {
> 	struct ma_state mas;
> 	struct sample_mgr *mgr;
> 	struct sample_entry *entry;
> };
> 
> \#define SAMPLE_ITER(name, __mgr) \
> 	struct sample_iter name = { \
> 		.mas = __MA_STATE(&(__mgr)->mt, 0, 0),
> 		.mgr = __mgr,
> 		.entry = NULL,
> 	}

I see this patch is to allow for anonymous maple states, this looks
good.

I've a lengthy comment about the iterator that I'm adding here to head
off anyone that may copy your example below.

> 
> \#define sample_iter_for_each_range(it__, start__, end__) \
> 	for ((it__).mas.index = start__, (it__).entry = mas_find(&(it__).mas, end__ - 1); \
> 	     (it__).entry; (it__).entry = mas_find(&(it__).mas, end__ - 1))

I see you've added something like the above in your patch set as well.
I'd like to point out that the index isn't the only state information
that needs to be altered here, and in fact, this could go very wrong.

The maple state has a node and an offset within that node.  If you set
the index to lower than the current position of your iterator and call
mas_find() then what happens is somewhat undefined.  I expect you will
get the wrong value (most likely either the current value or the very
next one that the iterator is already pointing to).  I believe you have
been using a fresh maple state for each iterator in your patches, but I
haven't had a deep look into your code yet.

We have methods of resetting the iterator and set the range (mas_set()
and mas_set_range()) which are safe for what you are doing, but they
will start the walk from the root node to the index again.

So, if you know what you are doing is safe, then the way you have
written it will work, but it's worth mentioning that this could occur.

It is also worth pointing out that it would be much safer to use a
function to do the above so you get type safety.. and I was asked to add
this to the VMA interface by Linus [1], which is on its way upstream [2].

1. https://lore.kernel.org/linux-mm/CAHk-=wg9WQXBGkNdKD2bqocnN73rDswuWsavBB7T-tekykEn_A@mail.gmail.com/
2. https://lore.kernel.org/linux-mm/20230120162650.984577-1-Liam.Howlett@oracle.com/

> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  include/linux/maple_tree.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
> index e594db58a0f1..ca04c900e51a 100644
> --- a/include/linux/maple_tree.h
> +++ b/include/linux/maple_tree.h
> @@ -424,8 +424,8 @@ struct ma_wr_state {
>  #define MA_ERROR(err) \
>  		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
>  
> -#define MA_STATE(name, mt, first, end)					\
> -	struct ma_state name = {					\
> +#define __MA_STATE(mt, first, end)					\
> +	{								\
>  		.tree = mt,						\
>  		.index = first,						\
>  		.last = end,						\
> @@ -435,6 +435,9 @@ struct ma_wr_state {
>  		.alloc = NULL,						\
>  	}
>  
> +#define MA_STATE(name, mt, first, end)					\
> +	struct ma_state name = __MA_STATE(mt, first, end)
> +
>  #define MA_WR_STATE(name, ma_state, wr_entry)				\
>  	struct ma_wr_state name = {					\
>  		.mas = ma_state,					\
> -- 
> 2.39.1
> 
