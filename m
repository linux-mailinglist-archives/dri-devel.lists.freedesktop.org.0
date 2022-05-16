Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF17528006
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 10:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EB0112BC5;
	Mon, 16 May 2022 08:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3DF112BC1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 08:47:38 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G8lOYS016834;
 Mon, 16 May 2022 08:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=QtClKh3ZXgxjOUs3En0BiCkmynB8POlvLL5txjIYTc4=;
 b=vCktRS0GJzOeYzlA2KmPSy3N1f/DZDEL0I7zstChl/738X3TGHyBjwL8VrfP1f9GkkNi
 r4Nld1kicyDkEyoCON/1y/37mTeI3NUzeWTan79lVMWVVWqAeLT7U4oSTQ46O+vOYI4f
 ZhlO5u+hDQ7tpt8Gj5LuqGg0TFS+HwHqOnAtuHxKNcgEDaQ+85WN1Hlv5rlUTBuGBCiN
 L6ezRuOfnirgISUNlDl/Pz7DRIW/BOUtgi9snotaTqW1HXSaQAoy8HTvBBhsjjfTYucv
 FdoSbfZ0BUSteCA+4KvgJlEwmdBkX4NlZvDJ9PWKV+Z3x7PLKtoYYEzwbh3zPeRxs7ad VQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g24aaamxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 May 2022 08:47:25 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24G8k3aj015666; Mon, 16 May 2022 08:47:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g37cnngm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 May 2022 08:47:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fx46ZGpRk3qXMOxgk4t8T3bMk441QXuJNi0VOioTntNcj5dkF54ETTDzGFK8Dem70Zf+0piXDpe/A5Wi5mBcD7DxT5GhWcTVhw2Cg4JaiFHZXWxNDjxUAoXlm9jhXkrHNHMuriNXeAG1+V94vzUGC34+Ez4wbIfXNSBLSSeDrTXipzAfZJa6+Zbearfd9moMZyW8OdN7NFw1OCYFuNl787t6jgzlx6Q8bgBF8Z6PSa+8lEqJUYZ0L9c5iW4XUruL9MnniF6GwUgN3/DMf7gX6dOE3csR14FRjRbXBKYknhp57HUhMJf61NQyX+Ws51TSI3AyUYZj1QOyo5hE0RMJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlO3319wF5bANGKsVhjT2tdvcUS9NBWJr1g2lNUaHdo=;
 b=PVeyJI1ox/CzwTayA7CH1peQF3UOox37Zbm9mt4lvALqtj4QpE8s89GGJB6rm5V8qIturKmD1if0S//ttJxBw7bsmH45M5vcW7LGOybogvgUbDh5fgbJtuaAMj5bh/CRrkSi/ZzEaxWPlsMUyO/PxWmHR3gNY7SStwk0Ic7nBS6zBfMajnGWrjiGmjVYsKIkOUfl0JcvCMC9yl00DsVCQxQnwr7LOnj5ituGrB1rJW0ruSYhtnPGh/tWlFceZIm3ahriPe9K1P9UIchsFXz6XEJhxU243GJdPS1PBjlVf9xrTPBRZvYf6otT4nPOtUhWCR7TpogrSO/yemfspCTYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlO3319wF5bANGKsVhjT2tdvcUS9NBWJr1g2lNUaHdo=;
 b=JnT/AqRTYVBgaA4laVbSyB67QNYbHiFcCzTEJGh+A6QQqs/tcrAy9V3yqUl0Jl/6EHFWnBphSckGoB2XRHuiD2F/7C1rCR5qRHGLWsVDqWD6NSAYCx/xTtF/s2WNycZJTmgfptVEv7cwZ6s+2pyMFsZ+gQ3LNM7u0dgB+fFJ2Bg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH2PR10MB3974.namprd10.prod.outlook.com
 (2603:10b6:610:c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 08:47:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 08:47:22 +0000
Date: Mon, 16 May 2022 11:47:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [bug report] dma-buf: call dma_buf_stats_setup after dmabuf is
 in valid list
Message-ID: <20220516084704.GG29930@kadam>
References: <YoH0AcDvgowmOot4@kili>
 <779aaa3e-45cf-6eab-23f1-bbbc0d3f0c69@quicinc.com>
 <796f913e-3b4d-23dd-e3d6-d1acd840ddf7@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <796f913e-3b4d-23dd-e3d6-d1acd840ddf7@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0045.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::33)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 579cb498-4094-41dc-aca7-08da3718b148
X-MS-TrafficTypeDiagnostic: CH2PR10MB3974:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB3974578E94580CD6AC8856148ECF9@CH2PR10MB3974.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mVQjPDgyzJsgbKDu7qCxcEHDTr0a/1XPaqPQdXAFr6eMbOFH6T1rxBpdzUEh23SYJO7lvUkX1jaeTVZNnpxJ8J4isl+BFuaDhPRbNfdWtGs8dGB/KTbDG9LZxa//De0tEFFrdhaL0U2e5d40xBpbp8xY0sJRDpyhKGNw3z1YqLMQ4WA151UGkELnkyDf3iEVuboskB020/d5cr1Z/J+d7DtQ+t0SA4sM2o0G/u/bdiOmU4HOvcJZkLBViZzh8r+rhzstJwjcnBgSu8zQGVHWv57gRS2WLZIe8deJ/mhhHrOv5vUuwAPQXDfF37awKrc7oxEMuXUf0OWi4652H+aR9r15MQt2HNZ4UAh+bIQ6T6wmqNazvIgJqjCfYAAXXrN4II7KRmpvEHMr+gpGU0bO1WgIQGgG5HnYmoJPhgoKhhOWR6GSEbb4wXfO3v95NM5cQ6/VP7PmHCxJu4dW6KapHxB7krYrHvMPABev1pDZsHI6zwzbrsqt0ev/JCRn1F+tKV18hw0Ho8HnhMwfL8wFVSpGDDezq7NUmM8rndOcRTN5Qr8tyVmUCvV8fC2NuV3RMccjtypslaFa0KOiOtiXp6NQNeXwz2hHZE0I7UijH/Zf7cgYWFTXi+FwkjvEZKBeD0boxgVcst10G3xaytjGgn7v/COs8iSAbgLDza6Am/Auj/4z6XbA7ceizO1njy7lAHkm/MV5Zs1X78bpEhUxFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(66946007)(54906003)(38100700002)(66556008)(4326008)(86362001)(4744005)(38350700002)(33716001)(6916009)(5660300002)(8676002)(6512007)(33656002)(9686003)(26005)(6666004)(186003)(52116002)(508600001)(8936002)(2906002)(66476007)(316002)(44832011)(1076003)(6486002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?urx14Po5xO3mFEEUVO3MBeZFcy6kGJ3X6YzDJwu7vnIXpbK3P1Djt2Da/K?=
 =?iso-8859-1?Q?ZBOocqRMJlRwSZv5pYdN/a6gQhdf9yA+RAoljtLPo1+HVReCgTK4jwa78l?=
 =?iso-8859-1?Q?fFvCyfEhK640hIiHzSYN8idProg5nhO4YoKeHDLk2ROxHMf4AaFT5jipgS?=
 =?iso-8859-1?Q?vc7wQsFaj8MPiGlyFyqXfF71WSxvRjMWAcDEQ/Dzit/gMwk8oMNUDhttbM?=
 =?iso-8859-1?Q?AKUgv7KNxtmUweBcyEpId1TjKPofWhULyt1u9GQShoKS1y00wMlndnV4Wy?=
 =?iso-8859-1?Q?Yx66u4oLZYjTZRML0CimXJsblrJaLOfsWNOcciR+X/cCo01EDei2KBYEeE?=
 =?iso-8859-1?Q?NYFPAqj7s5pCfUjJowzFvjYSbNXyjKBdmAGp8gmPmrfJpmiV/VfT8sdG1W?=
 =?iso-8859-1?Q?lBFuTSUtGuU5XdseZ6fkXy3NJLi3QffTSG0qsZpV6eO57I+/dmSUoCS2zB?=
 =?iso-8859-1?Q?5BHWRReDpw+XK+t9jan7zsgYvsSbPkY5BPcBmPJvQHmLsmHpAxoPPNjgbW?=
 =?iso-8859-1?Q?TGxwWWHaizRRVrb7jaz0SRjpUeTJzo5uiH2BWe5efIj40yNSVmlL3CiIyr?=
 =?iso-8859-1?Q?SsuAd5mu+MxUVJFb+3RFntuTsw0jtk4HsCJ5N88DW71haC9pUsfVAO6yi2?=
 =?iso-8859-1?Q?sfyBGzrw/EqHrtoXSxFc7w2ollVCqbbVVZyvRUUi4P4SI+8sFM7E7rmDtN?=
 =?iso-8859-1?Q?i/YLubaV2e9btWZxKzc8Z2yLBpoEQosrKkjASdk+Z701q1GGY10NrGmI8l?=
 =?iso-8859-1?Q?MB8G/auot29k7U1VcI0TTmT/Aj/XtEr1qA+HjlDg5hF8r8U0jX3KYh53KO?=
 =?iso-8859-1?Q?+O4hfDAFKHCsaysR9TIc0sRR2Y0yWRsj9+7APonuAGhXPBrzrNY3Mus0aH?=
 =?iso-8859-1?Q?sVyJqWALfB+fZ2l/ji0sE7OhqnZyEg+ime2rS51Uj4Vt6Pvgz9XJmMjvq6?=
 =?iso-8859-1?Q?BFNKbTUzIY7uOBm98XLQMquGB8sAOdGf8tJ38ovE0zqimAhsIRIG896d3o?=
 =?iso-8859-1?Q?Hm6DztCHDCPEkekM6m1bLMC+SoORKAlfvEkP1J8p8dQ8JjzsBU50iLHOqE?=
 =?iso-8859-1?Q?tXiyiIziF6T9dKZS68BYTVhDvhijW2aXKkjFEJhbHYih2NRwsHdAIEa5Hi?=
 =?iso-8859-1?Q?7ohnSvQfT0uQcaOn7+oTsl4/lVoxZStwGd5aEHszm3Ynrva2mZa4ab0VBc?=
 =?iso-8859-1?Q?HJqVNkWBfETEtBwuykQghd7erutn+kpe5tTrNsgw2xfSgtbkXFAj+oE8co?=
 =?iso-8859-1?Q?XRO+Ht0wzKVYYmvUIzU9/gw+6wkbi6xHKBAtDIQomLHWQDTyGKNhpYRdTt?=
 =?iso-8859-1?Q?VyzoDkAgo+jRTUkxz0tjMH/HNC5MfAsM2EJ1DjkJAtoG7n0onGBtxXuJ7O?=
 =?iso-8859-1?Q?KyovPzuda96SMf+eE+3e67pm1As9/xxJbLWhrgZRCEfVEZ7kPZ/CzTWQnW?=
 =?iso-8859-1?Q?nl1OHGP73B9I3lf72/MVUG76bh3EOGpJ/hOn9UPWb9MvMNVCjzUZKFf2yL?=
 =?iso-8859-1?Q?YR3JBYHnwIJoST2gdKfiZDeUMas4ySnZUkiDFXbf+vKwaOcTN/TYGeaXIX?=
 =?iso-8859-1?Q?RiDc6w2WRJwle2f7/VuczSEqtxo73PoSyuKEsFel25DI4t78EdDNcfhgB3?=
 =?iso-8859-1?Q?ilBeTp3yFi+Un1Sw00Co/LgE0Cg2Yg0kdEsixZSoVPYdhgiO4lfnCPPh8l?=
 =?iso-8859-1?Q?pFTGSHjIwvfGpru/cuoau8gOY5jOCwWPECpuuUscFixJ9K51kkNxf1umh3?=
 =?iso-8859-1?Q?l+atveFHFaHZwgqFpat38iwdXiMAiqoQc1Ds+NTfzVabkqty52wqIzr02D?=
 =?iso-8859-1?Q?Q1kZN7DHAyyg4lOwjay3cgrp9/9BoFU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579cb498-4094-41dc-aca7-08da3718b148
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 08:47:22.1762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGGmHjUnUjTgM5gcsWlJAx8CkZlPn2uN7A01sMhGK5fO5XEJ07kLfJDUKWczMFwxU7G4iTumyfPUlV9cE+GKtux+NEkek6O5Sy74jm8kDaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3974
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-16_03:2022-05-13,
 2022-05-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=975 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205160050
X-Proofpoint-ORIG-GUID: gNMN1LF--5Tjj0HKQ51KD9WU8BPnQnFI
X-Proofpoint-GUID: gNMN1LF--5Tjj0HKQ51KD9WU8BPnQnFI
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
Cc: Charan Teja Kalla <quic_charante@quicinc.com>,
 "T.J. Mercier" <tjmercier@google.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 16, 2022 at 09:18:55AM +0200, Christian König wrote:
> > >     557
> > >     558          return dmabuf;
> > >     559
> > >     560  err_sysfs:
> > >     561          /*
> > >     562           * Set file->f_path.dentry->d_fsdata to NULL so that when
> > >     563           * dma_buf_release() gets invoked by dentry_ops, it exits
> > >     564           * early before calling the release() dma_buf op.
> > >     565           */
> > >     566          file->f_path.dentry->d_fsdata = NULL;
> > >     567          fput(file);
> > >     568  err_dmabuf:
> > >     569          kfree(dmabuf);
> > > 
> > > dmabuf is freed, but it's still on the list so it leads to a use after
> > > free.
> > This seems to be a false positive. On closing the file @line no:567, it
> > ends up calling dma_buf_file_release() which does remove dmabuf from its
> > list.
> 
> Yeah, correct as far as I can see. The checker just can't see that the fput
> will cleanup the list.

Yep.  Thanks!

I hope that that Smatch will be better at parsing the fput() by the end
of the year but right now it doesn't work at all.

regards,
dan carpenter

