Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6661A524AE7
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 13:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF4910FCCB;
	Thu, 12 May 2022 11:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2949810FCCB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 11:01:09 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24CAbFTd010355;
 Thu, 12 May 2022 11:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=DV5VIc92wibEHzQj78IsGI5Ai/IQkw9PbqAEp/N3Hpg=;
 b=xArM2ZtEWwHMdAbhM/BDUi/fFuiMT9s3E6t8fvTeWC+/UwsXWIwduQHz1trjGCI8S/Wf
 83EIr4k93YdXzmkWliYhFa698175N2dXL/9WLAHa8GvKHq9YBBh/C9nIVH34pMAGPYdf
 hh3R4MmrKJzEW+Wc8DSWCm7RF10C+4aANWxlDy+dpbQ0EoaO1eVO8oz/Gpk6ASbdkbXE
 pUgNN43ukgUI5Hi7Yqt/8vyq+6bPbF3RFUJg+AA7XXX2jvsc3MFha0i/o9xlGj4o3zok
 GjzexWhx2svyffnj82gGS0gCpGU3p0NKG9nVHmRUW39eoJcbtr7fkesntAs70MOI3Tk4 jQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwf6cc324-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 11:01:07 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24CB0Ykq020462; Thu, 12 May 2022 11:01:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fwf754dnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 11:01:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2uXTflcLGdNXHAFxyHL3RwCJOEpAVm1gXC1FV4W1jc89oT6ukU64JFJwC1nigqG2YhlKNm3FOxsNevQyD2adN1RSwJSELHu024grCdch2dliNVHcwHZAJZlBuMWaT2HFoXzVrTvYt5LRZkyxV76lIqIJ6mTth+FbjzK3x9UR+hynjWR2s/lrhD4kDOhEj2rc+SQCkbUUEsILDlgjw/htGuLpDmEIwaM1egaJxarEH18RpjRWOosQtxdRmN3XWI+71MNm45OU8CCmoKOKLnfvy6sx16vSrNPm5tGFRNS9/U66KVyE0neF3iYbySQ8fY8SzrM59BwxS8TC9IvvvVKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DV5VIc92wibEHzQj78IsGI5Ai/IQkw9PbqAEp/N3Hpg=;
 b=GOOKQsTQVT1tHOSZc05jUFG1evbZko4Mj4gIR1vG7gy5Z5WFipWmvrM4UCsuZRn+efiotUum/cl06nt73iFTl1ZS2PgRLqxfHkGMn5u/lir+0qXXittX6z9FWsUB/KPYc9eoRoM4wyrOaLwIfiFnArMzZxYwchZjadKswpv5he/kXfO42cVqTEUK3Kphc2YJyq46amFEQt+DccxJfsXpPW/2iDay9fcDUHSfGhjJh1ubR+6zquGoAtUtmFU5S7jw5cLmMnvz/EqgdM5OjfEfN8LYSkhtwMrJ8/t4r+SngBS4lubNAMulypDWOdJzKXGdA26qTrxUfbiEQaNX3kWOSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DV5VIc92wibEHzQj78IsGI5Ai/IQkw9PbqAEp/N3Hpg=;
 b=xFKVmDnDn7wz2OiFRJap+fGhYl63CZuKB4dShtD62NtTt7ZE6/HhBjg7EQzJ/p5tA+O7VBw4Tgj4LkE1yGyTNeWhNZxjCCsGE0mztdT+eNOWP2HPL+bzckDjqoJatAMMCWNf2R0aAVTR3SFedPICXgU8BaNOTQ4SrvFp5vXNJpQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Thu, 12 May
 2022 11:01:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 11:01:04 +0000
Date: Thu, 12 May 2022 14:00:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@chromium.org>
Subject: Re: [bug report] drm/msm: devcoredump iommu fault support
Message-ID: <20220512110052.GE29930@kadam>
References: <Yni0d5Ve2+mJZzDO@kili>
 <CAJs_Fx44WNivGtF1E36Lti5H0J+7VvS-+aKJ25-pTTa4H_-T_g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJs_Fx44WNivGtF1E36Lti5H0J+7VvS-+aKJ25-pTTa4H_-T_g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MRXP264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::35) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78f42e45-df7a-4952-ca65-08da3406b4f7
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB398797A61B2533783E5F90468ECB9@BY5PR10MB3987.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4HoR1MehUWAdDvZBwi8N1+Myp0V96d8E64GcBRF0LdbPCJBQHGYgaKKsNmPoHQv6d7SM6A+OOYBHvte+VnIY3hKZPzrdnd6zpCgzJxkFIvEYitQ1RX1OExZtOvGlG2E1AKqHsx+yqPs2xOWqeRAy7AtkcO010YAAlQ/EuS9Dn9SK5YOqgXOYtuiIla+cIFAK+82t7F/d/tadNwStCDBmfkc6GpwCVr2FMRoqG2deFWUVbJ+Dm30oGcirTFDYQwY+lyxbis+Uchmd4m9rsvATxLY80FfPMFatUATSRfpg9nH1R4BGC/Wf5b/l3kUh8HaBVOqEZx6M3ggHzhO+isnrrXyM0nsotKoekMBVHyeCRlPyvxhbPRHaglAMy4Lr008f2+qzWQuXi8Iyzfk8sf8Ic+kjcOUHWSI0y2LWqSbTefWVYhs9uzVAhkr+O6QrcaA21AqFZtE+ipqY0XRwRZ8M9I1Q2kxEMEkrqYA8++tudUyvOAJCYFe097qLv0fOiRHmhHdrKHQcz7AJveGG2DwVqaosOCWCwiAD7ry//MNlj2+yjbQc3sNEHZOejtNoF4GA6RDBGPMlmo5tSwGdfgqYv+UzOiiWLFDcgt66XMpE+QDbEsoLtp8LIN3zU+nqweeNDdIrg37C3YpGUkdYz2QVs9pBQ7KeUuEv8cfGocDe/cwQFnu6buGfZiaqCf3/PoCVXPnIYmoXe2MbwRfPpmikuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(1076003)(316002)(53546011)(6486002)(5660300002)(52116002)(6916009)(6512007)(26005)(186003)(86362001)(8936002)(2906002)(6666004)(44832011)(9686003)(6506007)(33656002)(38100700002)(33716001)(66946007)(66476007)(8676002)(66556008)(4326008)(508600001)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kILkdrZLaHlbWicqaQQxC9r7FTs6YDhBrDYJqdA3z4vRjbb9gEQYQJORaBL8?=
 =?us-ascii?Q?8K9bTc0qYTP6vovriJgoOpmVwkkSdd49sa5WXRqPgNAVJ7kEJuT17gx82XFz?=
 =?us-ascii?Q?tCwvPi036dKN8Z1sDEPVH/QwwqNic7hm6exmxLDBhyeo8vIjSrn+epCRN9yf?=
 =?us-ascii?Q?PaRrHxxrdZb/zPW90xoNN7Im68xyzb2pLlSNSMKfZDoMwCxjkCyyfx9YyB2d?=
 =?us-ascii?Q?8ly02xLqKj3QmQWQ8GNQF5+fPNT9XiT0BLZ0sZWUOdykuJxptGR2/yaMT/TV?=
 =?us-ascii?Q?d1oRf/Ela7zm+ZNbjxyp4cVKctPXWsUOnMMPdZuZJNYom2Si/lC2u+arfekb?=
 =?us-ascii?Q?pqCPbdSY1U85ToaHKtPFmwqH6x3lXfVB7L1BDErNIWXvNy5fCxPm8VbgxW4F?=
 =?us-ascii?Q?gNlFVZ8bUZ6jor5O+gnptUhJN4AqXt3EVvYiecrlueHC/RJiUm9huIH2Yg5n?=
 =?us-ascii?Q?l6yMxL2pyI8YMzGTf5GgYLecizbESrDqx/JKQmiEn+sx/ia2xWQZEOZfq+7a?=
 =?us-ascii?Q?HeaEEhFPCYvc24KsuFOisEd4+yTaJabJPdWS+kOe/QEQcFLKFLS27ksyrIs7?=
 =?us-ascii?Q?xnyQq4C4PMHFvc10iV/B0oJqysf79ZS4txiKGiFF+XfCUJJNgqW0pzDGrYku?=
 =?us-ascii?Q?O/p1hG3eg645dRgBWbMpSEK7EzCscd+Q4KJu9exr5Gm9WMmg9MyB+WmLvl7g?=
 =?us-ascii?Q?sO0i/j8X2d0ivJD1DseJgvSo20vzOkWFKR4EtAaJ5Ngi4gDH4K1haOqRT2tQ?=
 =?us-ascii?Q?lwFYvPGO+FKwdGFN6/cig6ikYTQu5E3EnfQrNhkJqakPzmXIt+U8pb1UCqfc?=
 =?us-ascii?Q?6ko4J/fg/rnXgDarutR1fRvd58OHczILuMTC0zrDq7ZMRTidoSS8eldBhFh9?=
 =?us-ascii?Q?Pq/BOuQ5//0kPtMfAjxiAFslFb18ARknviBtVqCX3hgAHdhQ8IukuZYUCkZc?=
 =?us-ascii?Q?yA8S5aJWLmsc8ixPFN2Hgm6aPyHgQ7VKgf/bXyjfIOdxCak7dvqw9Qyr6WpI?=
 =?us-ascii?Q?dCIUqPQBVbR3ADywSqbg1CLNE9ANKAX30yjgPLEYRxznZrLKHS+Jg5zNcCbx?=
 =?us-ascii?Q?259jIHiY8oZiY6zp5WnaroQpWSDJ6aLBebyOv6S1qjTYv3pC+mk+EW8ms3nQ?=
 =?us-ascii?Q?UXR5O8v1HpZri3/Pgc/WnN+DYdchqP7csA26dUZnG2yEgesk6IwpHxfdTsqg?=
 =?us-ascii?Q?p6LOklO3KjrFXUuOcWrbBA07Y39gvmX6wmRLcjIaqEbywFhXxWO5qNJQkmqF?=
 =?us-ascii?Q?433VnBSdytkbpU8VgJ9GWgHNhaVRFTdT2J4JvFu0wBvwTo8wTOW9UCY6ZbWs?=
 =?us-ascii?Q?X3As9+goNwahtNR6S+4Nai+BNjq6zDriKWFNG5dtSvKr3hKtfR/xLeEdENO/?=
 =?us-ascii?Q?EJTD0gGz1IPnc6KG9YBsWPCZ7vT+QfDEbHWKqwiAVDgpFubVES5HRlH26Z0y?=
 =?us-ascii?Q?/ZfHihxM1ysgQcJ/66/zhy7rYBY3wSDFrHLTGwUx+jLKDwe2Sg6z4AAC1+GR?=
 =?us-ascii?Q?ukvxf8XBG/lm3SdrIURFv95ofzgqz5gmfVci4Uw/u0jcz4x3EHw7QCk6hXc/?=
 =?us-ascii?Q?7kPXUV4W8cIPkl7hgcjJj5roQxxBKM2aP2eAopdlD4KKW/q/Jap6DFSgMhH2?=
 =?us-ascii?Q?ePQN0+nbONrdVAZCf67n0apMmrliP4cJKROXprevX12WnZeDGt2RNlquESzG?=
 =?us-ascii?Q?7PRBwZNIH1DBEnAgv8AvSOD1ebLFo/HCbcz7qnCIDOpkR1LGilF4RtAAUCe+?=
 =?us-ascii?Q?IKkZ8vka7zhUQUtzeOJ/ot8c4G7NuIE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f42e45-df7a-4952-ca65-08da3406b4f7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 11:01:03.9901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bld4EY2/rIpi/mXFganqsMK3xYXw7U66ZYe678YwnPFsAZI75zbv+jVmLwHwHgvditpsVcHpIS3C+oyj0yEcVL2JbIkc7PDgTOMW3Z/outw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3987
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-12_02:2022-05-12,
 2022-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205120050
X-Proofpoint-ORIG-GUID: aLmu_nd-uu_DeoR8RrN7EGYPIr5ypsIA
X-Proofpoint-GUID: aLmu_nd-uu_DeoR8RrN7EGYPIr5ypsIA
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 09, 2022 at 07:48:23AM -0700, Rob Clark wrote:
> On Sun, May 8, 2022 at 11:28 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >     407         } else {
> >     408                 /*
> >     409                  * We couldn't attribute this fault to any particular context,
> >     410                  * so increment the global fault count instead.
> >     411                  */
> >     412                 gpu->global_faults++;
> >     413         }
> >     414
> >     415         /* Record the crash state */
> >     416         pm_runtime_get_sync(&gpu->pdev->dev);
> >     417         msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
> >                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > This function calls:
> >
> >         dev_coredumpm(gpu->dev->dev, THIS_MODULE, gpu, 0, GFP_KERNEL,
> >                                                   ^^^
> > Which kfrees gpu.
> 
> How does the gpu object get kfree'd?  That is the root problem, it
> shouldn't be freed until module unload.  I don't think e25e92e08e32:
> "drm/msm: devcoredump iommu fault support" is actually related.
> 
> Is there a way to reproduce this?

Ah.  Thanks for your feedback.  I saw free(data) and misread it as
kfree(data).  It's actually a function pointer which is
msm_gpu_devcoredump_free() so it doesn't free "gpu".

My bad.

regards,
dan carpenter

