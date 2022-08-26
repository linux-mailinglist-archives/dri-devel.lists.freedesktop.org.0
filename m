Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622515A2521
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7BA10E7F7;
	Fri, 26 Aug 2022 09:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ED610E830;
 Fri, 26 Aug 2022 09:53:49 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27Q7XkE1028560;
 Fri, 26 Aug 2022 09:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=svVB0a80C6lkuuTQ847OAGgjnEL+IfSrd4seiyytp9w=;
 b=La6qlaVsHuudd+Ij7JQrx6oqmLO1J+M5xIIXvDA7D7Fz+KD8oUGEQP+wBGW85kycqSak
 8JtLNFxqsqsIqogxLEvO7Wm0dPkdp1bMOFm7spKbzUX1hFV0DofNyelaFk84OQizMjS9
 vF6u4VgEZwPpebpaYDA0U3uSgyzVZ6RWRMHsrgPfVVAicSQ+eH9gdqT0ZfuL61KJPJjo
 ZRd0gsIwVIL87fI2L7A4ez+sYyL47MlyOcqIq7ZNCghsVzWORSqkXoztpEgtDqbC5nV5
 PDb3GLfsr2tNYMvzwQxj1ETg7hA+7tpmCXwLFXy15FTueGGqpcn/HTZgiGcQu4EMf1nL zA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j4w2417f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 09:53:41 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27Q8Pp5j007224; Fri, 26 Aug 2022 09:53:41 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j5n58sjqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 09:53:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3zdk8RhqV6F5dI1wkb74EbHuu3Jlxm7zZaBtuLgcM0nFJS4O9L8q4cNg0x5zuZfiA5vtlvC8puFVh5kgc1BKYf9GolXgOVP6UqqQAsnVzmIYl61o6Pt4SBMA0y+xM2ARSZ9Xp92S+7593mgsHSjOsWHKa5GIaQvFZtimNhnChMAba9RzDIcvYMjJonm5Vu7pBoX9+Tu2ovERcFW01xA+fdRIKUNQfd5nS3jpwQ/EHn6jvytNkS6Gi7uoXiVsxdicZMJihZfB3dpsskTi1f+R6GifbFwNYwpMCtzvnCKlVfuOJQN4wmWWjGAUo8GBQVVLnkHpXgl7nAUSy6mI43n2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svVB0a80C6lkuuTQ847OAGgjnEL+IfSrd4seiyytp9w=;
 b=oZxxsPi+Q6rDP/YzT8F2SlefMaPUuS2FYU4eFosAZPpRXG55XCdXzmQKn8XnLAfV6/Fc51yBCBVaD71/SjzPBBrjS2RpdCm091JEfU6/mqyqonm/NlYY0VypFHZOYTIPclqDD7r0/BQNmwkbXT7EDuk5lkSHChd0xkannz2Ftybjf3K4vOkfNbVlwys+2rSsQ8WjwJkqbvflyljVO4oRCzixZrUdSMr3ggBySUgnH8ItLazEKVDnAbc6E9EJ1GnqotretJ71puQRUIfiti7TXVQHaajreR3PsifongY1SzQN950p5EAkCH/Q0gIlGhG2MGYvhydon9QIfXj2eXjNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svVB0a80C6lkuuTQ847OAGgjnEL+IfSrd4seiyytp9w=;
 b=QFyQKrJpvMVlAYHWeQnZ/utRn/zVLec5zTpNM7ij4WwJAq99JDeX+XoJpYwp9nVnRLFCNVjC1+80lhBCEaDhP4zUkPE2HzmaQn9I1+LK4BZ2SU/zCs7izdP8rgel+slwCmyPtnM4a8YPaO9fLtSgY4in/vD8b7/uGgwxYzXVf1k=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB2729.namprd10.prod.outlook.com
 (2603:10b6:5:b1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 09:53:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 09:53:38 +0000
Date: Fri, 26 Aug 2022 12:53:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] msm/adreno: fix repeated words in comments
Message-ID: <20220826095311.GG2030@kadam>
References: <20220724073650.16460-1-wangjianli@cdjrlc.com>
 <0e16e719-4eb2-bfb3-6b77-88d5314757a1@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e16e719-4eb2-bfb3-6b77-88d5314757a1@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a82f4c7-b1ef-442f-d318-08da8748d9bb
X-MS-TrafficTypeDiagnostic: DM6PR10MB2729:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F/HTiuTuXLd5QYA5Ly94OjYU7VglY+wsjPCg1IZG++g4GXX7MxMIS1g4UZyQZllBDxBMTlPYgQWoDoOz4U9VzY9RJdpPcmxNqO4SWGjiqRtx+EaXVSic3iAXLpgS67tD+EKxfbXbwNGKDo4eR9Jq+VjtvZUqt3WTG8ncmYXDgjPgbN3nc0TM+4/6nfvzWVq/rbeSaNifxqPcGUEfbdvPKhTilo15rpWWyxPN4prD5yU3FljCSMIYTT53vrp/Je0PhPfnKrVM/ZDTNqJTS4QKBMDDS1hJo0fYwUlnDOXkrt2wqxbpVddgFVcUvZoS+HNpZzGHXUFkrxnqtwYTO1AlUnA2od+1U17eAyceCYWwm1nMNOWUTKMt33DIvVVPYj0eE1wCqbDGbrphYgfZG6kKjfUcOifHzTPNzDtnqcq6cRPml+VTPHouPlBKUmUo7kQENzLjOeEp+BbbH7BgfCNU//Cy0/6m5MTNdoJLTiodL6iKE6eRGTsq9OLH8B/YVhJ3mn1fnnOkHQF0nctuIDz4dUQBGgXnv4w2/qAE1vQGuHQL1D1Bd/S/VEY06yE/e+h1Jrw+30tW8BMMatErjLnYjqC3KunAnNn1V9gSblN58mW+IrtMfD8R/SD4XuXbuxufDP/YSWAfWBdgloR/t1IdrbINQIc7PayCkYIXAmltKmaAcqbmkpXUpK/5DNVt9P3JgcQio917l72pm8UnmhLwLbapFd4B2kuiYGXdIp0YlJekY46FTPzEsFRW2S1CpaTZHmHTUWOBI8kCP8m8nuMw3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(376002)(136003)(396003)(346002)(39860400002)(33656002)(38350700002)(86362001)(38100700002)(83380400001)(1076003)(186003)(9686003)(6512007)(53546011)(52116002)(6506007)(26005)(478600001)(6486002)(6916009)(316002)(6666004)(41300700001)(8936002)(7416002)(44832011)(4744005)(5660300002)(33716001)(2906002)(66946007)(8676002)(66556008)(4326008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sf7/kOvBa4RCaTrb6rU7s0PVPObOZpC3knnpj4NGT6KfzMexXRzo6vL8B71K?=
 =?us-ascii?Q?MiPhGZk0HfNV8tFR2H7Z8bLcdqqxMRQ4IKcF1CqU8LePis890ISbNmzchBlX?=
 =?us-ascii?Q?R7X9ML6AlKakbsJzLOghBK7Xk/YHkTmxNUuzgroRdDDVottfRXivpyod/pCn?=
 =?us-ascii?Q?x4SJZIpSi2iSmZyowgRAeQoOIs6LllFXRZ6JjCL9Ls8Oc+MP25xevUENy25D?=
 =?us-ascii?Q?+WpA/6EXZlk1ZqJ+48dKs9yDyq+M8vanWKlA2uvL6L2E9GceHtXhSjPiyZFf?=
 =?us-ascii?Q?pqCVYelWZQb79lfvNhn4UQ7WalkOn8NvjYMVsNIX5WLeOteQuLCrxo79DIHY?=
 =?us-ascii?Q?ZWGEoDbGmtWne0y5/77JgqtK6FgiVyaYtGkJtXjxkANWkyZ8wdYlomyZNSgt?=
 =?us-ascii?Q?t+lzZX+Twa9kU7FreFtyzOsWHw3ERRnkJMannVwJ/uzIGJq/CT/HjULoIq8i?=
 =?us-ascii?Q?OK0ZiAPFvyt5gbCLK+oP8iP7nm6O+w8Ql1UQLVULxMTXn5HpuaaskesqM/65?=
 =?us-ascii?Q?EFblCKSfcJH41XUMdIs2DP9HzJVEndGjBaoiNsQu1iiGX/MtRQNAEYIRVQI9?=
 =?us-ascii?Q?HOQ+qmMEgVPXMK82t73Ld0Fc4dDDKEGWC/AxIYSWQ1BTQl1VXhLPj3A1IZGU?=
 =?us-ascii?Q?vqEZxb/XBNuPlPdd481PnBye3MVdLo9QadL96CyqWGDEjBivqBHGNh9fLtvG?=
 =?us-ascii?Q?rtnmHvzeHFXq09H6XxAXEd8OJXqePRXHXwQKl8ylhMq8WAlgD4IV9whvAY3l?=
 =?us-ascii?Q?SfPX2GhMcI4vgVU96IBW86q25xeKHlAie+ngyGz9+Fcb38iHgbd/A0k5WgGO?=
 =?us-ascii?Q?dc6kSzbf4U+s6V15o0HGF8vD6d7hz83wpiftDFmzUUG5CvS87UD9BK1LDoZc?=
 =?us-ascii?Q?zIi+0QuZQ3Q2WtfsubFAF5rF57DYj2abJONmrYr75s9E4wqfIJ9BdqbKnkJx?=
 =?us-ascii?Q?Rcq7aelWwO6bppPmfDGoYxs1/XWQ0PfhYptz6NuJC7MeP41bvctPoNAxT7/v?=
 =?us-ascii?Q?su52fD2Kzr/+AXezM5k7UibZJ1lpNHal9wL/WQMMGpBjSW9KWJ/GFT3CRc4P?=
 =?us-ascii?Q?sCgilzoxYbhXUVVoxdqC8DSW5ZtItvndNIlIBNSnAOjKcjSLQHkqarO7S4e1?=
 =?us-ascii?Q?v0xo2YU++hLX/hyCXegs47zjIMJXpNPDP23ve8aX8UIxsI7JpLPI60Dl66xV?=
 =?us-ascii?Q?tvHBPjw6QQBOoAmoKmF2zvZqhvkWs4ZU6I8oWMWVhYqxhKKPI9kEmwRZauWC?=
 =?us-ascii?Q?/uDS5L8D8E6N6DP+nbnSj/lK/4AKVw2Z5LSDPG3tv+P93BJLYTz18XuKQhXp?=
 =?us-ascii?Q?mf8CD3yKu4Y4NIdps1W/ugBAjHMzUVATdsLlaEsAZy1Ut2VbiPj/rctekTtV?=
 =?us-ascii?Q?XuuVebvzs7aKzDY77v3wUmWMqWfEz5yNjxB0z/8bAQ/r9r8GtYFWJr9yC4+1?=
 =?us-ascii?Q?BoUAOIL0HYcIb85yyWfXClIwK8mYXakeB+drheYtiFy2PzpxSAK3VEBE5dq/?=
 =?us-ascii?Q?y+i6RWIRWOmGGtb0wSD6P1tKUL/7tdt5+9jyMqmfhfsUwOY52yvqFt5ebrby?=
 =?us-ascii?Q?KHZbgZIFwssctQRNOfRdhP+Zbj5x2xBiH1BM1n17m9vBTnAF3XsM+onG2Riu?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a82f4c7-b1ef-442f-d318-08da8748d9bb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 09:53:38.8112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPvCsai5qlObeQbQ/MeKVAC/kAh7vbtlPBIxvhHktMozGWrU7HXp1DDBL2xIdnmJYXz3sNYtje/MVojQjy2jIw5S/KmXTYv9ujJpC+ruLGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2729
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_04,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208260040
X-Proofpoint-ORIG-GUID: 34qPmEsLfIao7yieWNQM9MQqaq5Q46g2
X-Proofpoint-GUID: 34qPmEsLfIao7yieWNQM9MQqaq5Q46g2
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, wangqing@vivo.com,
 wangjianli <wangjianli@cdjrlc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 12:45:09PM +0300, Dmitry Baryshkov wrote:
> On 24/07/2022 10:36, wangjianli wrote:
> >   Delete the redundant word 'in'.
> 
> Could you please:
> - adjust the commit subject to follow the rest of commit messages,
> - drop the extra whitespace at the beginning of the commit message,
> - add a correct Fixes tag.

This doesn't fix a bug so the fixes tag is inappropriate.

regards,
dan carpenter

