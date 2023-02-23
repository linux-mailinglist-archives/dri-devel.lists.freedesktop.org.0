Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA0A6A102D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 20:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C155710E013;
	Thu, 23 Feb 2023 19:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3713A10E013;
 Thu, 23 Feb 2023 19:10:19 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NHsxd5029263; Thu, 23 Feb 2023 19:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=BEN4IGU9hWOjsLmSc7Gp4cJCjNnM1ToV83A7K/czaDE=;
 b=Ucarj1sWp63Mbq3MLiQyT7OkFHhPQwYM8zJNADjlOISZbIl5XcKBwt6SYcupe+JbP5kp
 HTz0YsqFJ0wx6dVbt3l5iHK7lKc2RNBOGHhmoSII1dlN27HsniNn794x5pXCelRYPCvA
 5C0Qt896HPwDnGGhnWhyxRn1tPdaai+o0VEY6fa0xN2TiOkeQUGT2UKh0Bj7V6pg/GWL
 5xV7IQsfC5/5JpWPD8+DU8+RvKg1YkpDoppbt9aYT1zdSLnQZZ93zGzquHr42PmRxXRz
 DczFAsdL8mN4miPupt9+D/9ieO2vWc7doJpiRM0/+EH0EIVaCIiFge53d72XPIu0yFxQ 3w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntnkbua0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 19:09:49 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31NIHiFi030263; Thu, 23 Feb 2023 19:09:48 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2047.outbound.protection.outlook.com [104.47.57.47])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn48fgqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 19:09:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+Tzmi50A/ZAmsoCrKHqAPILdAFTEiTyZiFVQ53vnfn3hHXW0yT0oQ/ZcN+ih97LSV0YZUyvZR4oHb+Vwc0gom8dMH5K9/F/zNeNftdo7lP/WF/PbbTJLzgmCUlgkYeVu6DwAfnwj22oZMZ4klZR3jEf32cVAx0E5JQSGJgPJbPw3OIlgrVllLLEeArUtwbfepNWQEqJXNE1vUe1mSOTra18gW9keGmIXVWwfVDJavKcYI9EwTlA/Alkqac8NEN4bbBAE/7Ebgp7Q3+fIaSuiuB/9AdM6aj8AwA6dpswCHMkBr6JKKZyNpJFjJR+vUrdeTuADBC0F9wuxoHHMrdbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEN4IGU9hWOjsLmSc7Gp4cJCjNnM1ToV83A7K/czaDE=;
 b=L+6YCJ11/x1YPAMvWIHUHDMYC+ApxC5soOPOtAxBSQSrnxXPbHe333A/hMXef/tMC8/X5M4e0pxkX6c/4KCizKTNzByH8vdF4LQ+x1gDF4y7L1dEh0/soIhkmk8hoIH2Jp/kDueY0wREdYV732JJF6fMC53xq6hpNC8+TottGDqVhUwbin3loQsRfRfgVQpp8w4Ei8isS5CZWb4LKPdsAAbdG+DfsNbUWtUbd5kPhrkX4u0V0BFyKhwki/6IKhEFCFD6kvkuIHlMAWqNq7iKt1ualEH9hAbudXnYwpuvJ+wqL0lc1n6nzheqDSSGmlxW6Tyu0PAOQ2Lwan7CEvXDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEN4IGU9hWOjsLmSc7Gp4cJCjNnM1ToV83A7K/czaDE=;
 b=KLhpXPcAn+dz+YaHNE9TY0T1hj98FOiCP1TCyL6aQ7JjpI2dIq/0bUJvyYqwDNROL1n/ywzqiazE4NtXcq9MGVBn3RFCicytcdD/JLgV6mAIHa6T4yw95sRiIUqonPuaRu8C9MIfz1ATKHcyXJxR4CPHfS+eqYheqB3i9ReCA/E=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CH2PR10MB4328.namprd10.prod.outlook.com (2603:10b6:610:7e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 19:09:45 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6134.017; Thu, 23 Feb 2023
 19:09:44 +0000
Date: Thu, 23 Feb 2023 14:09:41 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230223190941.bkkloowmvqjiu6d7@revolver>
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
 <ce3ee7f2-e8a3-80eb-9bca-cd465f7f332e@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce3ee7f2-e8a3-80eb-9bca-cd465f7f332e@redhat.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0321.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::15) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|CH2PR10MB4328:EE_
X-MS-Office365-Filtering-Correlation-Id: aa070dc5-8b3b-4515-a2c7-08db15d18620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3PF5d+upAfuyKuOcMu/nJSIeRxLypZJ23IJxyBmn7DxTwkYCmpvxXJnSVj7+d5CD2VdwqmavxQp3IXZTcFBui0guNI+H7S3nNbzDt2aVy+6GXP3FBWt8hNultj4ppwPpwLL6EoJb/1ZZWLSN0qcFroQdCOtEKCacwWTm4ylvtZOfuXHeNEMh5XhvZ35zG0APfCsPf3zMXo4YrsG0eaQWf4J3tHaoyG6mS9usinPqKlxWRbrAxbsfA+ajkqq2Xaxq8Lf4x/W3AQJGVLTLTq9xszz05ps30gp6VlCM0AOkINXtAxQUknW0ajNXFscb4TPqix+fQ1W28XFBRTFLR6IW4r/0ptN3VWStTWyFiZJ2zH0rfUZFfUTRgOfqOmFBLZe1pDUK8Aq6sRKeF2+3RCfT+Sx07vDyqbz5svGJZ3RVkxmEi1PL/sY/QHROxE4EwGpiM268aOrFl99/UKD6CqhwYRJiQ32io4YRko24O9b8oxBKVml1O0nRrMndAFSMDggyUYcAToosWpqqhBdPLUIZ7f5Kzqvyh4ewmlJzVRnUCHjdX04DE9W+jNQh50O4Hqh5NU/XqlVu4JJF4WkFUElibv6fqeHoFGLBDLFb72YbqOzUro5ezp9wyz5gacDZZZuv08/CSiJxnHB2lzxLBr8fqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(66899018)(84970400001)(33716001)(6506007)(83380400001)(1076003)(316002)(6666004)(38100700002)(9686003)(478600001)(186003)(26005)(6512007)(6486002)(53546011)(7416002)(8936002)(41300700001)(5660300002)(2906002)(4326008)(8676002)(66476007)(6916009)(66946007)(30864003)(86362001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y/WoEv9eMM5lyYzPDcdaLFAo9EHRl1STO85I1nx/4OIjk97z86Noy1UePpQO?=
 =?us-ascii?Q?4j+oVPtqajXpJ47g35ngg58hAR91OYvPbaAesoD7IG8qbTYCRAORJCfC4W9u?=
 =?us-ascii?Q?SCJSCHO6fTTp9g0MP/cmDGxY5RIVKIajRaOENPT76pDKtRvkRj1aReh5+9Q7?=
 =?us-ascii?Q?DdGkdgDX8OtVgwrcgN0sUH9HhIH6FiU+bh7tKzHKx4ydFOg68i2ezaGWhYRX?=
 =?us-ascii?Q?LwjP6XbAer/E2eWWduLNWG/9z+Il092Srdv5y9ZDzhhUa57N/H85gN9Zfvtu?=
 =?us-ascii?Q?4eOnyt3ZGhlQUZdQvyIOVCK3/RfWB593jdeYOrQqLjMVCl6yaVw8GPmbx1vG?=
 =?us-ascii?Q?qt1RJyi8PwEvjzFn7oyROiM8gnBQTtxN8REaWjUoZ6Z02NJA27ImrQnZCAAP?=
 =?us-ascii?Q?OD3olxqYXgccy2JIoYYT8TstPJedwvf/dsIoXtlDfqGV5SQnywkobA2gOQFh?=
 =?us-ascii?Q?oKxmnxaBxPb9YMYSub3OYvW9o1DPsJk+fzd3gc9ipIHEwZWApVPCPkkXadFl?=
 =?us-ascii?Q?BLCNI0Xh/eN9rKo6WcLQnxxIUb1QOKweMWxGH2olMLq7+zSe/etuia84Gb4c?=
 =?us-ascii?Q?WpV8EB0TeLS/DWlNxCj6nMJd+xS612UJSA7+Hk8qctPJuTOWenfznyNAjVp6?=
 =?us-ascii?Q?mMSu0/Qiho7rC5Bsnm1zJMMBGVxVqG3ZSlmyykm3BKOkkFwARFfWcOAtwsQF?=
 =?us-ascii?Q?B/b5LX2J6vg9pZ9DyjlxoTuFDWPV8i1ojKAl2VJEbpHKqEBGzXCN0NKeFLMR?=
 =?us-ascii?Q?YKx4vIItNY2u7vPutSTqA3KU8Idi/Kuiodvadn6pFCxZ4Ti93bPdNzTB0Ou+?=
 =?us-ascii?Q?rjYrG++dDTEZXn5l6pKtWHQzNAoXy3GtChEFyfoMGqwmn7MOZifEKfSXOliE?=
 =?us-ascii?Q?A1rl4iwxnbanlCAV71rtRQRWskHXBox5PUfjbRsbq0AE88fWdAkkt9QON5sI?=
 =?us-ascii?Q?iqfeUQPYwTgtdZtIVxawDj20r570ZSdhwkPZ0+kOjVqxSDw07dBWTTe2YLuq?=
 =?us-ascii?Q?Z2Nr0o85kAWGa2qZ2uJakfFXFZjEA4w0DtO0dGj3Qjd88sPR01RP6V5Sx3Fv?=
 =?us-ascii?Q?P46Pey7wAzWUAPvmSQMpR5noiBHGNlxjzMeyq7kgzAWETMUmu1VG4p6LrvbM?=
 =?us-ascii?Q?se+DkOdGxO27Tc+V+D7O2pyaaVkSUKkZZ2Z1He3OwuC6UFfJzkCsNUXTHVn0?=
 =?us-ascii?Q?dBgr1VlaBhjaXmZgXJZWc8EX3hge5EpmwuqpxkvzVPkejrBwaf0KvRlN/6bf?=
 =?us-ascii?Q?OsaCFnK2LXRp90Vy7DIsQUBI+eXcUQfFWCDMQSvghEJw9mLvcE9hkVtZZqNE?=
 =?us-ascii?Q?ntk9gCt058Uk8lFmOl3FlgYcAE6Ec7ZDd3r4gRi6qXh4NV5PLuW6MEmN+QeG?=
 =?us-ascii?Q?TiuC8inRgRIkMgPn8a9yWDKmawaCELQbHNVHl94Ls7YYA1JVLRM/J1OLneIl?=
 =?us-ascii?Q?K/8loCX5mk08wK6EA1eH5KS1VZBBZWHKAV2o/UA17fH7rfhxI39YlBnVcJcP?=
 =?us-ascii?Q?HEIPFKKMsiqnNaRFVBi0Wr+s7Hh+S/Hs8kjhPAlldA/xYH/hn+ADvWrrcJBi?=
 =?us-ascii?Q?PGG9WnRcdhW9lb01HIFF8+gDe1OwizpoKaTLHlraco9n4EIEQ6XrnHqibXuB?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?Z2xi0AbXEUYYAWKSVPufUHNeR3bJ7w4bluFLaKwoyef6oDc2pN+POEEjJ7y/?=
 =?us-ascii?Q?+UDE96//w+fk+XI+N5rmOvtt//w4i4mVdj/1e7s5ggPkgGFxmMRPLQ3g7ORI?=
 =?us-ascii?Q?JICoXl2NM1klmrGpNZo9DLVBK6YLSfO2uuQzX8yJcDO+Lg+91BCIB1xAgBu8?=
 =?us-ascii?Q?O/XfdoR3NsDu7wGbq/8uvv/cXqjvkbtvKXpABCx7oLi6XWmd4WzRCUtW3ape?=
 =?us-ascii?Q?V4XyhQnwBEYGJ27REncGc2Her9vMGkaQ78V5aSgWw9/rxQYeZkxf8YnVBT+Q?=
 =?us-ascii?Q?3nBS0gVTUDVHjWSuTUaR9M89zU41RhaD5IRGL1fJXBYf6QhL0Ik+ETITtz04?=
 =?us-ascii?Q?KcPmPGvHwBVJGzMRc2vFhoh3OIrvMn5G+WWY82oD2dgKFJFFRMzP+a0KfGSn?=
 =?us-ascii?Q?sWMzF84lkdqTR3Hh7c27fn2GhKwIQDvBgiUmQCmJwC1PGsB4lIiU+EyOLxUc?=
 =?us-ascii?Q?qVTZ9WOxHCFaUssZiLrtnx3RXXMPR5pSSiRn/33jCjQQ1jXrg7FBAZkkpcvU?=
 =?us-ascii?Q?54IfuXmyCYEJbzNoag0W8g6xwcLW1qpiFvcpulcVyTYNAyB+ZxzgkCDoL49B?=
 =?us-ascii?Q?jCQKdGhI9ituA4ZlikOK3KSvdxv8bL8CmqJYKjNTYaZAP7Z5RS3ESJ9mazFY?=
 =?us-ascii?Q?mI/vFdo8+RnV9HE7UdesevukGD2AIx1FMuzs/FqAVYYi36AibJNPvROhhUTV?=
 =?us-ascii?Q?SiUc2T+GVEWdYazuexDZsIKPMbx9frgvOtxS9hu/bxS19XLobrAdQQvLsDAi?=
 =?us-ascii?Q?VVKGBtMSNmABXa0M4Or2RhI6/Rih6sPzpWjw7kMfu72njt+TQkY7nLa/6RNg?=
 =?us-ascii?Q?wFrYmIgNGbp5oW8eDKtb1H22s0Qgz0yKHM3ITYHCsqEWC5aFzzWYYlajETua?=
 =?us-ascii?Q?lCyVtstKdgqqjX6uSPfbHldAV4bAtC4xy+trJm+fITIGxf4nSj6ycKB48+yr?=
 =?us-ascii?Q?Tqblg9DBtKB4VTF65fCEv5CE5HKZ+VEX0vn83vypsUtpC75KZm4APMJkbVPL?=
 =?us-ascii?Q?G15cS0Xd785P9Chu3IVERUjCSiz3r4eXkUzD8kX7Ajnr2IK3bWnaMr8EwURk?=
 =?us-ascii?Q?phaCyB8uHxNYgnGQEC3y7sQwQMZqqVlyg2bLTAnGysBExaFk9zMPE+1tSDil?=
 =?us-ascii?Q?r9LxIMTeK65lBWDSK18qLOiC4ZZDHAmYlg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa070dc5-8b3b-4515-a2c7-08db15d18620
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 19:09:44.8347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUutq2C2/15z6bYQet+rHMNXOCNjVvWQGh5qrELGSFNcXL5ycjaylA3MPmsmLcgVJrGdK3Kdhc3a0RPKX1Ka0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4328
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_12,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302230159
X-Proofpoint-GUID: RQE1uPbpZKNDviN7alq9kvtpw_IlmfkQ
X-Proofpoint-ORIG-GUID: RQE1uPbpZKNDviN7alq9kvtpw_IlmfkQ
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

* Danilo Krummrich <dakr@redhat.com> [230222 13:13]:
> On 2/21/23 19:20, Liam R. Howlett wrote:
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
> > >     making use of the maple_tree.
> > > 
> > > 2) Generically connect GPU VA mappings to their backing buffers, in
> > >     particular DRM GEM objects.
> > > 
> > > 3) Provide a common implementation to perform more complex mapping
> > >     operations on the GPU VA space. In particular splitting and merging
> > >     of GPU VA mappings, e.g. for intersecting mapping requests or partial
> > >     unmap requests.
> > > 
> > > Suggested-by: Dave Airlie <airlied@redhat.com>
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > >   Documentation/gpu/drm-mm.rst    |   31 +
> > >   drivers/gpu/drm/Makefile        |    1 +
> > >   drivers/gpu/drm/drm_gem.c       |    3 +
> > >   drivers/gpu/drm/drm_gpuva_mgr.c | 1704 +++++++++++++++++++++++++++++++
> > >   include/drm/drm_drv.h           |    6 +
> > >   include/drm/drm_gem.h           |   75 ++
> > >   include/drm/drm_gpuva_mgr.h     |  714 +++++++++++++
> > >   7 files changed, 2534 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
> > >   create mode 100644 include/drm/drm_gpuva_mgr.h
> > > 
> > > diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> > > index a52e6f4117d6..c9f120cfe730 100644
> > > --- a/Documentation/gpu/drm-mm.rst
> > > +++ b/Documentation/gpu/drm-mm.rst
> > > @@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
> > >   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
> > >      :export:
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
> >   * Nothing at addr, mas now points to the location where the store would
> >   * happen
> >   */
> > if (mas_walk(&mas))
> > 	return -EEXIST;
> > 
> > /* The NULL entry ends at mas.last, make sure there is room */
> > if (mas.last < (addr + range - 1))
> > 	return -EEXIST;
> > 
> > /* Limit the store size to the correct end address, and store */
> >   mas.last = addr + range - 1;
> >   ret = mas_store_gfp(&mas, va, GFP_KERNEL);
> > 
> 
> Would this variant be significantly more efficient?

Well, what you are doing is walking the tree to see if there's anything
there... then re-walking the tree to store it.  So, yes, it's much more
efficient..  However, writing is heavier.  How much of the time is spent
walking vs writing depends on the size of the tree, but it's rather easy
to do this in a single walk of the tree so why wouldn't you?

> 
> Also, would this also work while already walking the tree?

Yes, to an extent.  If you are at the correct location in the tree, you
can write to that location.  If you are not in the correct location and
try to write to the tree then things will go poorly..  In this scenario,
we are very much walking the tree and writing to it in two steps.

> 
> To remove an entry while walking the tree I have a separate function
> drm_gpuva_iter_remove(). Would I need something similar for inserting
> entries?

I saw that.  Your remove function uses the erase operation which is
implemented as a walk to that location and a store of a null over the
range that is returned.  You do not need a function to insert an entry
if the maple state is at the correct location, and that doesn't just
mean setting mas.index/mas.last to the correct value.  There is a node &
offset saved in the maple state that needs to be in the correct
location.  If you store to that node then the node may be replaced, so
other iterators that you have may become stale, but the one you used
execute the store operation will now point to the new node with the new
entry.

> 
> I already provided this example in a separate mail thread, but it may makes
> sense to move this to the mailing list:
> 
> In __drm_gpuva_sm_map() we're iterating a given range of the tree, where the
> given range is the size of the newly requested mapping. __drm_gpuva_sm_map()
> invokes a callback for each sub-operation that needs to be taken in order to
> fulfill this mapping request. In most cases such a callback just creates a
> drm_gpuva_op object and stores it in a list.
> 
> However, drivers can also implement the callback, such that they directly
> execute this operation within the callback.
> 
> Let's have a look at the following example:
> 
>      0     a     2
> old: |-----------|       (bo_offset=n)
> 
>            1     b     3
> req:       |-----------| (bo_offset=m)
> 
>      0  a' 1     b     3
> new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
> 
> This would result in the following operations.
> 
> __drm_gpuva_sm_map() finds entry "a" and calls back into the driver
> suggesting to re-map "a" with the new size. The driver removes entry "a"
> from the tree and adds "a'"

What you have here won't work.  The driver will cause your iterators
maple state to point to memory that is freed.  You will either need to
pass through your iterator so that the modifications can occur with that
maple state so it remains valid, or you will need to invalidate the
iterator on every modification by the driver.

I'm sure the first idea you have will be to invalidate the iterator, but
that is probably not the way to proceed.  Even ignoring the unclear
locking of two maple states trying to modify the tree, this is rather
inefficient - each invalidation means a re-walk of the tree.  You may as
well not use an iterator in this case.

Depending on how/when the lookups occur, you could still iterate over
the tree and let the driver modify the ending of "a", but leave the tree
alone and just store b over whatever - but the failure scenarios may
cause you grief.

If you pass the iterator through, then you can just use it to do your
writes and keep iterating as if nothing changed.

> 
> __drm_gpuva_sm_map(), ideally, continues the loop searching for nodes
> starting from the end of "a" (which is 2) till the end of the requested
> mapping "b" (which is 3). Since it doesn't find any other mapping within
> this range it calls back into the driver suggesting to finally map "b".
> 
> If there would have been another mapping between 2 and 3 it would have
> called back into the driver asking to unmap this mapping beforehand.
> 
> So, it boils down to re-mapping as described at the beginning (and
> analogously at the end) of a new mapping range and removing of entries that
> are enclosed by the new mapping range.

I assume the unmapped area is no longer needed, and the 're-map' is
really a removal of information?  Otherwise I'd suggest searching for a
gap which fits your request.  What you have here is a lot like
"MAP_FIXED" vs top-down/bottom-up search in the VMA code, this seems to
be like your __drm_gpuva_sm_map() and the drm mm range allocator with
DRM_MM_INSERT_LOW, and DRM_MM_INSERT_HIGH.

Why can these split/unmappings fail?  Is it because they are still
needed?

> 
> > > +	if (unlikely(ret))
> > > +		return ret;
> > > +
> > > +	va->mgr = mgr;
> > > +	va->region = reg;
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_insert);
> > > +
> > > +/**
> > > + * drm_gpuva_remove - remove a &drm_gpuva
> > > + * @va: the &drm_gpuva to remove
> > > + *
> > > + * This removes the given &va from the underlaying tree.
> > > + */
> > > +void
> > > +drm_gpuva_remove(struct drm_gpuva *va)
> > > +{
> > > +	MA_STATE(mas, &va->mgr->va_mt, va->va.addr, 0);
> > > +
> > > +	mas_erase(&mas);
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_remove);
> > > +
> > ...
> > 
> > > +/**
> > > + * drm_gpuva_find_first - find the first &drm_gpuva in the given range
> > > + * @mgr: the &drm_gpuva_manager to search in
> > > + * @addr: the &drm_gpuvas address
> > > + * @range: the &drm_gpuvas range
> > > + *
> > > + * Returns: the first &drm_gpuva within the given range
> > > + */
> > > +struct drm_gpuva *
> > > +drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
> > > +		     u64 addr, u64 range)
> > > +{
> > > +	MA_STATE(mas, &mgr->va_mt, addr, 0);
> > > +
> > > +	return mas_find(&mas, addr + range - 1);
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_find_first);
> > > +
> > > +/**
> > > + * drm_gpuva_find - find a &drm_gpuva
> > > + * @mgr: the &drm_gpuva_manager to search in
> > > + * @addr: the &drm_gpuvas address
> > > + * @range: the &drm_gpuvas range
> > > + *
> > > + * Returns: the &drm_gpuva at a given &addr and with a given &range
> > 
> > Note that mas_find() will continue upwards in the address space if there
> > isn't anything at @addr.  This means that &drm_gpuva may not be at
> > &addr.  If you want to check just at &addr, use mas_walk().
> 
> Good catch. drm_gpuva_find() should then either also check for 'va->va.addr
> == addr' as well or, alternatively, use mas_walk(). As above, any reason to
> prefer mas_walk()?
> 
> > 
> > > + */
> > > +struct drm_gpuva *
> > > +drm_gpuva_find(struct drm_gpuva_manager *mgr,
> > > +	       u64 addr, u64 range)
> > > +{
> > > +	struct drm_gpuva *va;
> > > +
> > > +	va = drm_gpuva_find_first(mgr, addr, range);
> > > +	if (!va)
> > > +		goto out;
> > > +
> > > +	if (va->va.range != range)
> > > +		goto out;
> > > +
> > > +	return va;
> > > +
> > > +out:
> > > +	return NULL;
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_find);
> > > +
> > > +/**
> > > + * drm_gpuva_find_prev - find the &drm_gpuva before the given address
> > > + * @mgr: the &drm_gpuva_manager to search in
> > > + * @start: the given GPU VA's start address
> > > + *
> > > + * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
> > > + *
> > > + * Note that if there is any free space between the GPU VA mappings no mapping
> > > + * is returned.
> > > + *
> > > + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> > > + */
> > > +struct drm_gpuva *
> > > +drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
> > 
> > find_prev() usually continues beyond 1 less than the address. I found
> > this name confusing.
> 
> Don't really get that, mind explaining?

When I ask for the previous one in a list or tree, I think the one
before.. but since you are limiting your search from start to start - 1,
you may as well walk to start - 1 and see if one exists.

Is that what you meant to do here?

> 
> > You may as well use mas_walk(), it would be faster.
> 
> How would I use mas_walk() for that? If I understand it correctly,
> mas_walk() requires me to know that start address, which I don't know for
> the previous entry.

mas_walk() walks to the value you specify and returns the entry at that
address, not necessarily the start address, but any address in the
range.

If you have a tree and store A = [0x1000 - 0x2000] and set your maple
state to walk to 0x1500, mas_walk() will return A, and the maple state
will have mas.index = 0x1000 and mas.last = 0x2000.

You have set the maple state to start at "start" and called
mas_prev(&mas, start - 1).  start - 1 is the lower limit, so the
internal implementation will walk to start then go to the previous entry
until start - 1.. it will stop at start - 1 and return NULL if there
isn't one there.

> 
> However, mas_walk() seems to be a good alternative to use for
> drm_gpuva_find_next().
> 
> > > +{
> > > +	MA_STATE(mas, &mgr->va_mt, start, 0);
> > > +
> > > +	if (start <= mgr->mm_start ||
> > > +	    start > (mgr->mm_start + mgr->mm_range))
> > > +		return NULL;
> > > +
> > > +	return mas_prev(&mas, start - 1);
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_find_prev);
> > > +
> > > +/**
> > > + * drm_gpuva_find_next - find the &drm_gpuva after the given address
> > > + * @mgr: the &drm_gpuva_manager to search in
> > > + * @end: the given GPU VA's end address
> > > + *
> > > + * Find the adjacent &drm_gpuva after the GPU VA with given &end address.
> > > + *
> > > + * Note that if there is any free space between the GPU VA mappings no mapping
> > > + * is returned.
> > > + *
> > > + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> > > + */
> > > +struct drm_gpuva *
> > > +drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
> > 
> > This name is also a bit confusing for the same reason.  Again, it seems
> > worth just walking to end here.
> > 
> > > +{
> > > +	MA_STATE(mas, &mgr->va_mt, end - 1, 0);
> > > +
> > > +	if (end < mgr->mm_start ||
> > > +	    end >= (mgr->mm_start + mgr->mm_range))
> > > +		return NULL;
> > > +
> > > +	return mas_next(&mas, end);
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_find_next);
> > > +
> > > +static int
> > > +__drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
> > > +			  struct drm_gpuva_region *reg)
> > > +{
> > > +	u64 addr = reg->va.addr;
> > > +	u64 range = reg->va.range;
> > > +	MA_STATE(mas, &mgr->region_mt, addr, addr + range - 1);
> > > +	int ret;
> > > +
> > > +	if (unlikely(!drm_gpuva_in_mm_range(mgr, addr, range)))
> > > +		return -EINVAL;
> > > +
> > > +	ret = mas_store_gfp(&mas, reg, GFP_KERNEL);
> > > +	if (unlikely(ret))
> > > +		return ret;
> > > +
> > > +	reg->mgr = mgr;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpuva_region_insert - insert a &drm_gpuva_region
> > > + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> > > + * @reg: the &drm_gpuva_region to insert
> > > + * @addr: the start address of the GPU VA
> > > + * @range: the range of the GPU VA
> > > + *
> > > + * Insert a &drm_gpuva_region with a given address and range into a
> > > + * &drm_gpuva_manager.
> > > + *
> > > + * Returns: 0 on success, negative error code on failure.
> > > + */
> > > +int
> > > +drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
> > > +			struct drm_gpuva_region *reg)
> > > +{
> > > +	if (unlikely(!(mgr->flags & DRM_GPUVA_MANAGER_REGIONS)))
> > > +		return -EINVAL;
> > > +
> > > +	return __drm_gpuva_region_insert(mgr, reg);
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_region_insert);
> > > +
> > > +static void
> > > +__drm_gpuva_region_remove(struct drm_gpuva_region *reg)
> > > +{
> > > +	struct drm_gpuva_manager *mgr = reg->mgr;
> > > +	MA_STATE(mas, &mgr->region_mt, reg->va.addr, 0);
> > > +
> > > +	mas_erase(&mas);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpuva_region_remove - remove a &drm_gpuva_region
> > > + * @reg: the &drm_gpuva to remove
> > > + *
> > > + * This removes the given &reg from the underlaying tree.
> > > + */
> > > +void
> > > +drm_gpuva_region_remove(struct drm_gpuva_region *reg)
> > > +{
> > > +	struct drm_gpuva_manager *mgr = reg->mgr;
> > > +
> > > +	if (unlikely(!(mgr->flags & DRM_GPUVA_MANAGER_REGIONS)))
> > > +		return;
> > > +
> > > +	if (unlikely(reg == &mgr->kernel_alloc_region)) {
> > > +		WARN(1, "Can't destroy kernel reserved region.\n");
> > > +		return;
> > > +	}
> > > +
> > > +	if (unlikely(!drm_gpuva_region_empty(reg)))
> > > +		WARN(1, "GPU VA region should be empty on destroy.\n");
> > > +
> > > +	__drm_gpuva_region_remove(reg);
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_region_remove);
> > > +
> > > +/**
> > > + * drm_gpuva_region_empty - indicate whether a &drm_gpuva_region is empty
> > > + * @reg: the &drm_gpuva to destroy
> > > + *
> > > + * Returns: true if the &drm_gpuva_region is empty, false otherwise
> > > + */
> > > +bool
> > > +drm_gpuva_region_empty(struct drm_gpuva_region *reg)
> > > +{
> > > +	DRM_GPUVA_ITER(it, reg->mgr);
> > > +
> > > +	drm_gpuva_iter_for_each_range(it, reg->va.addr,
> > > +				      reg->va.addr +
> > > +				      reg->va.range)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_region_empty);
> > > +
> > > +/**
> > > + * drm_gpuva_region_find_first - find the first &drm_gpuva_region in the given
> > > + * range
> > > + * @mgr: the &drm_gpuva_manager to search in
> > > + * @addr: the &drm_gpuva_regions address
> > > + * @range: the &drm_gpuva_regions range
> > > + *
> > > + * Returns: the first &drm_gpuva_region within the given range
> > > + */
> > > +struct drm_gpuva_region *
> > > +drm_gpuva_region_find_first(struct drm_gpuva_manager *mgr,
> > > +			    u64 addr, u64 range)
> > > +{
> > > +	MA_STATE(mas, &mgr->region_mt, addr, 0);
> > > +
> > > +	return mas_find(&mas, addr + range - 1);
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_region_find_first);
> > > +
> > > +/**
> > > + * drm_gpuva_region_find - find a &drm_gpuva_region
> > > + * @mgr: the &drm_gpuva_manager to search in
> > > + * @addr: the &drm_gpuva_regions address
> > > + * @range: the &drm_gpuva_regions range
> > > + *
> > > + * Returns: the &drm_gpuva_region at a given &addr and with a given &range
> > 
> > again, I'm not sure you want to find first or walk here.. It sounds like
> > you want exactly addr to addr + range VMA?
> 
> Exactly, same as above.

MA_STATE(mas, &mgr->region_mt, addr, addr);

reg = mas_walk(&mas);
if (!reg)
	return reg;

if ((mas.index != addr) | (mas.last != range - 1))
	return NULL;

return reg;

> 
> > 
> > > + */
> > > +struct drm_gpuva_region *
> > > +drm_gpuva_region_find(struct drm_gpuva_manager *mgr,
> > > +		      u64 addr, u64 range)
> > > +{
> > > +	struct drm_gpuva_region *reg;
> > > +
> > > +	reg = drm_gpuva_region_find_first(mgr, addr, range);

mas_find() will keep searching, so you may get a VMA that starts higher
than addr.

> > > +	if (!reg)
> > > +		goto out;
> > > +
> > > +	if (reg->va.range != range)
> > > +		goto out;
> > > +
> > > +	return reg;
> > > +
> > > +out:
> > > +	return NULL;
> > > +}
> > > +EXPORT_SYMBOL(drm_gpuva_region_find);
> > > +
> > 
> > ...
> > 
> 
