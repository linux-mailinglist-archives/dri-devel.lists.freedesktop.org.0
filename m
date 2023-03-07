Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72826AF91F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7A710E565;
	Tue,  7 Mar 2023 22:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572A010E565;
 Tue,  7 Mar 2023 22:43:48 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327JwsGD018534; Tue, 7 Mar 2023 22:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=cpR4FLDtTsX8gXgsNGYKBIFSKCD3jX8XPy/upEQmkxE=;
 b=RLX+oLrEVaiQsf9yJcyUGxawVdXVwXiR1v4jShhrV1irINdZLe+GkRvMbCIH691lTOsm
 BvEFK4cBnracAfTkFp4KOCt8+AEbIvQSPhKA7ZmyphwU1N9QfnqugaJn79EUJNknWP4a
 cvbWEma0pV2aF7v8Zpe8+4EG5/nra+fmPWPhPbDV2YqxyJYtOFW5N9TkOz+vfHYd9iYa
 8nWNqlkwd3dk2MX8DTl7Lj05wkaqBnRwBrSL3gol18uesDPfkAMlRW+D+KAGNvyWRe03
 t/8u/R8zwCliun4Vr/GDYY0NNoYPQTA4vVmYFcdoyHkGou2/xaFYTHEH8SwX1KgD5wuH hg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415hxw57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 22:43:20 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327KlblE023396; Tue, 7 Mar 2023 22:43:19 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u06wm3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 22:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btpwTLa+D7aDbjr/bN7X84wtEqFBeL33QkJcZo+H5qJ67QsAVA/wVI1ewyho9vGZ/hMgRP39TEJpxM8KrQEAn+s4R7zqzcd8ZMOpOniQ1vFGOADaWlsaIlTf5p4ksC/1ElnozVElMWQVSlMF37fAb7abmUkvFB4MEQAVKvFUv3DVLJh545s3+Pw1HoWxqltmhJ33iz4Ox3dEtbY+YB+ZoVuwomq03zdoh4CA1caklC66/ZbIalKWJwK/fTEdyP1NBAD+T3ZZtgUR8JIgqlY6FtPb6JBsbhxJRbxmzBvdImcSEWQItkXzJKC2nX36sFUm0EMD9XctLSGkXFN36SpJJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpR4FLDtTsX8gXgsNGYKBIFSKCD3jX8XPy/upEQmkxE=;
 b=Xe15OKHkyXtqcAaY+ZdE1ySg0KnwMlKIMQxaw2E2prcwjwHmpGRI20wzpaM0/VcN13e1XhHyJCFsonO1CyIqU0s80/HcAG2kOvdw9EIWeTonCGdkR2aHbcduyfu0FXaEaG1PMy5GCaTAqhldx70hyYuGTHpR0Qq+ZulHn5wbHScdgr8HBmm4GYFkqxTf5lStfP5Ol6orSVUC3GRszvu6uKlhQjk76OGGhSvbI5aRw5yBD1f26C5o44tY+ElydYbDxph0+pACwMj2eYkvoHu6z65eRt8ud3NJRen2oY8ONqUrFjq3EE665KkjFcxvBh6f8BfqMwDvyL4qJOMedmauNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpR4FLDtTsX8gXgsNGYKBIFSKCD3jX8XPy/upEQmkxE=;
 b=zPX3s6lA530HgBVuW0Y7zFrVoL2SUCJAWxeRb/5VPZHjnKUyAB7JJgY37eDzVmgh6zD7+9dx9gQJ5cBjrmaL/pIZm6NI/W3bCGSxJdGcgmmP4OPpFsJj6eGrspMxIUG2PoCq1NRGkr/Ce6z4gCeZvTY0hWDXZ/84GeL3R1CVBiA=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CH3PR10MB6715.namprd10.prod.outlook.com (2603:10b6:610:148::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 22:43:16 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 22:43:16 +0000
Date: Tue, 7 Mar 2023 17:43:12 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230307224312.a4kxlykzlzkrcmpf@revolver>
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
 <20230223190941.bkkloowmvqjiu6d7@revolver>
 <0868bbeb-11b4-b832-a601-f289278e3e76@redhat.com>
 <20230302023829.kcxyukt7guacr7xg@revolver>
 <87be9261-1206-75db-6aeb-27abe6e05821@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87be9261-1206-75db-6aeb-27abe6e05821@redhat.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0323.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::29) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|CH3PR10MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: f62a01f9-d9b8-4418-8d70-08db1f5d5792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Dvd1wgAeryJ/lQE2tAG54hTTyalm6Ei89tjYnfIA97N0hbdaWPtBYOekTqXfaljMNYWCzknNrskk3C3zWduOR4ZdLtk1y5dFPDvRi+blrFg55IiPQEIm+OnS65iOrWx3/WWoOc5HvTTvJpnFNXkyjGbG9ruPUhR0u572H9rljlKKeEJzGfTaYpTmUHQ1tqjUVq8WFmQqc2NzRIo0DzRxU/H2hU1QZgsjUzXajvvC1WGDxZsAubPNxUhUKBTXWWQRCkv90wGfDNe60RZzO+jdBCoNlINfyUfVbQ9vT7Q2i4QZiwMSUOmTTWKDvfmEjoZgzcDxCWMNGwwOHMaTaS86puA4K7uevYrfnOkwxaOC2J3yUWHhp96JL6jWtcOVsVcWmmDZiIu6/2Cf7jrUBNBOxkmp4OhDeqjzbRQF3bUj7FFZgDBPXGKauYMDn4FGNpHYQ+DSSVH/I5ucm6EszraIIDcQjQF2sIiPoaqtcrlXEREid7yFe5fqtD8I8jMuxRBg/fjr9mWTposQTr98ulsJDAie8xjOKzU84ubefcytiDTdOcd8KAjkLNxqCwAZJWUoz7az0G9apWURqxl4YYHtaDRbEBvIs55Gzzcp/wEgGXoTeShOgmlKej1X5sBufwd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199018)(66899018)(7416002)(41300700001)(66556008)(4326008)(8936002)(8676002)(6916009)(2906002)(5660300002)(66946007)(30864003)(86362001)(66476007)(38100700002)(6666004)(478600001)(6486002)(1076003)(84970400001)(316002)(33716001)(6512007)(6506007)(83380400001)(186003)(9686003)(53546011)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IOmjYbbK1FDuO/y3miQ36niaoFw4fQNTwQIfAmpFZ1/v+4u7lW31SaydqnF8?=
 =?us-ascii?Q?iHc2751ipROhcHqrKiRjfTYhFLWDMFSc/KnYQJ/GUkQbU215YocCQkut0mio?=
 =?us-ascii?Q?Iz6w2S4FDtFESBkNrbdIkPk7nzOh0VV60litcYpgKtF2gFx3whZmY3zDZL8W?=
 =?us-ascii?Q?g9hDja8sY4Pmjhg1Dcdzi7xoC7/crI1bmCtwjxflfGnI0RwjmXKRsGyBvA27?=
 =?us-ascii?Q?ncqMVyhYfUa3/0o0FFAEXPwQ8Q9eT/oVUqAjFuV2LOdv0juCLU881BjUQ9Em?=
 =?us-ascii?Q?7DNEzUQlIM2UEIhUCNAIiH62M6REiFS8Ovtf82jjc812UVZOvFOmVeN0VoZl?=
 =?us-ascii?Q?lQppbBsc3sLfmowQ7o26xiaE/EGjG24o+NsgI9LFOBzou/wWHI/QeCl4eA4h?=
 =?us-ascii?Q?T3RxNf1xSEiW4ZJTClnTcGGTDIgbqlwP+MiO1y03+HcbTSx3IpxOxVknFsj3?=
 =?us-ascii?Q?h9nz7srxNmDAZBdg62WLGRG61bDMkpd7ZdF4TSWsex42B5HYhvNdcEjg47wJ?=
 =?us-ascii?Q?uP9oRRZQp4MbZGXsCsour1ifoq5ctdBLj1XO+6TxjNGnk66e9ws9mft/HLus?=
 =?us-ascii?Q?65nWy2xMD8f15qivws9uTuxgEoFHehJaSbzpeMibDAAF0gcTCrGZo+nqHb/X?=
 =?us-ascii?Q?wvsa7w5fwedpc1d65CLYZVLNZ+0Cd94TxaEc7ymmEkTSmXxbW9Sh1NSjq9To?=
 =?us-ascii?Q?8BfqbUxpvlfTs08+p0k/JqWauPpPgUsbn7J108D48f4MsRWniTx8388gBtg5?=
 =?us-ascii?Q?3ASuQYn5saJtWoCFXLJ+yi5zMlAS6WPsovMjuogopiSS/hNhzYgchv7KACkp?=
 =?us-ascii?Q?HWm6IpjqZtyWsuyM75uBy8gsY1OeG9JWDN9zx88ER/DsDTlDLfJ8tQGvLB+w?=
 =?us-ascii?Q?lWjeK6Z7Sy+lbeUZUGuYkRF1NREtHAKS6VZY9QhgoW4ok8zVsltKRzmJVgWa?=
 =?us-ascii?Q?N33H+EtX7g5DU/5c30ZJAvGr0+mcbr7Ao2lkSrj8d6U07uMo5icups6mltSB?=
 =?us-ascii?Q?i4Ivnr1lCG/aQSLyTsCtnurEvTG65gEETmOQErlCSewb5tksixM62QeuI4CQ?=
 =?us-ascii?Q?me7ohgVS3TZtT/fx48OKBFOufltmYCzYVeGX/IQbgZ19R8xTFGojoVJCqVuY?=
 =?us-ascii?Q?QtVLXbW2XTxUtfmP+2ZelGj0PJf1jVD6B1gYccHkC+WVwX/Ox9Cr+5jKM6kg?=
 =?us-ascii?Q?2u1aCJ4lzUUaZWReNJx2QvW28smdYZjSzsoBq7wL5RYRMI5Ibg67NIQmHjM3?=
 =?us-ascii?Q?X/aj/cVN7MItI70YtUtvYmyCRxyqnBHhG8YG5AY5rCUUbaBcqWC2xsh8omv7?=
 =?us-ascii?Q?ppfSpvCVyufZlc/hTQ/pKV/5GkNh6bX99JFUKEGV8+h7lawp576H8rW5BR5h?=
 =?us-ascii?Q?8+p5KbfyIFjEYDqb9qoGTq0Fi2ausK93XthYO898bbEYDTRvDMQfAw9n5aDp?=
 =?us-ascii?Q?AfcFOBXgrHvpGkMjaPKwTR8GUzIe+rOjJxnXy+F7mEy7L0QoCh+WGxiSnDXe?=
 =?us-ascii?Q?mjiGxtFvorPPwpll43NP3U3zCcWhnZnyMO/5+gTBeMODvWXq5WawdXJ+A0mb?=
 =?us-ascii?Q?BlcNnqqtAY/KqfDGDQomFb3GmytQy92LW9viOHfv+9Jsvi4p86qfzFGofldS?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?zVQP+mVwJAbluWu/cmGAal3UKClsd/XNTsQ6LmmqX36JzbPItvO9Hiqz4bHk?=
 =?us-ascii?Q?EuQorOuQzLR81EErJbvHxeySt4gP0Gq94gyUud/EndiYRrHAZNXSfUFhxhl2?=
 =?us-ascii?Q?NOT5sFFQR9yo1OqotUilw2mjFCNBMOO4qxx0F89oSJlplWMBug8RMNnXnXR/?=
 =?us-ascii?Q?Dt3dppGqRuHuoYds8NIugHwDyf8a28qJyxojEPA5yV6NF+ShyMaCkpeVNndl?=
 =?us-ascii?Q?p37mgohZXrP/usOEYCwQ8ddQXKi9ReoBowVBhl9KnLB0RV80HxYtNUs2NNGt?=
 =?us-ascii?Q?IB0WVZ3KSaKfmCu/U5VPEPj2XwYbxkgpDlaoqfAqo/yrrx655reVOAUPvZeh?=
 =?us-ascii?Q?C/XBN6c4dbt1Brg+3mKZ75jEWjhjGOV3Q2/hUzQ5KblzWNM/h8JPWABM8wjm?=
 =?us-ascii?Q?X6oR7PUAwfSRLPeJnO49z5K9ftfxbQWIubbP44hE7+4M7p0bj1BA8o+3nHkC?=
 =?us-ascii?Q?91IT8qlzFwyGMqVghVElPuItSMU6PH9rtR2ok/UY5SPWCky48IPXV8KqiOap?=
 =?us-ascii?Q?GQOi4x8pxIsqnIqCRHmpBbGthIn1XXf8G2PFIxFrPrwJ/fXKk0jiWlD9+KRF?=
 =?us-ascii?Q?oPSQMX2+5nMrjkjd0DPTwY8f3uQNQ6EKvXD9BObvepRxUWVU91gQTfLcjkti?=
 =?us-ascii?Q?WCAzoiVpZk9NlO/qW/jsoZqSaCn7qKAeb2QlOcD7jGUFbb90GVxCwZk2z42u?=
 =?us-ascii?Q?3jsEOHUNr9kG7173t75zoEN4oO/C5CURBhrcp938HCBkXqXg7olxkECVEGU8?=
 =?us-ascii?Q?ml22tOMTq+zS6sILfhqmjWD5t0dBzJgsmN8lNOfxX5hNKOdNN0utf6CnORrr?=
 =?us-ascii?Q?evg0TxtjLmX/ZzLdfZ8Ea9qT4+5r2qGUqIbFMR0GICdnRrB9q3OW+wjeQHZa?=
 =?us-ascii?Q?MOBhdkrB7VfFKHdHHJ1QmOFqo/OdAk7y+0IV9UExxfmn/KKz5Y4druoYlf9h?=
 =?us-ascii?Q?C8asq5aKOuNf3OX6ASyrdl5gJ8ahj1Gdt//rchEnEdmVY908SqtTWESUKv5G?=
 =?us-ascii?Q?PY7+WDpRcAPDbmMt6JEz3sF1pUiDk8IaLdBYT1OsFBlfgNlgzOrbT+RN4vNJ?=
 =?us-ascii?Q?LApSgepwEhkvOl1Gaisdi3tkac+qzV6uXA+Uj6Iyw2iAqkWEQdoq6Mgdw6W1?=
 =?us-ascii?Q?odYyKNC9j+bXQSPNMgNTcXThANwuZn9kDQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62a01f9-d9b8-4418-8d70-08db1f5d5792
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 22:43:16.7511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHZuRkJHKqmMpyTO8mUhj4cfn+cQR1mwEIDTzGSkwFie2cPeCoI3SHcMyKFOpnICVy+wDGkl7HvnNmOfKKC46w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6715
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_16,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070199
X-Proofpoint-GUID: wdlfdMLS6-gf7YOLhwWe7XZ-SXQZDx5n
X-Proofpoint-ORIG-GUID: wdlfdMLS6-gf7YOLhwWe7XZ-SXQZDx5n
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

* Danilo Krummrich <dakr@redhat.com> [230306 10:46]:
> On 3/2/23 03:38, Liam R. Howlett wrote:
> > * Danilo Krummrich <dakr@redhat.com> [230227 08:17]:
> > 
> > ...
> > > > > Would this variant be significantly more efficient?
> > > > 
> > > > Well, what you are doing is walking the tree to see if there's anything
> > > > there... then re-walking the tree to store it.  So, yes, it's much more
> > > > efficient..  However, writing is heavier.  How much of the time is spent
> > > > walking vs writing depends on the size of the tree, but it's rather easy
> > > > to do this in a single walk of the tree so why wouldn't you?
> > > 
> > > I will, I was just curious about how much of an impact it has.
> > > 
> > > > 
> > > > > 
> > > > > Also, would this also work while already walking the tree?
> > > > 
> > > > Yes, to an extent.  If you are at the correct location in the tree, you
> > > > can write to that location.  If you are not in the correct location and
> > > > try to write to the tree then things will go poorly..  In this scenario,
> > > > we are very much walking the tree and writing to it in two steps.
> > > > 
> > > > > 
> > > > > To remove an entry while walking the tree I have a separate function
> > > > > drm_gpuva_iter_remove(). Would I need something similar for inserting
> > > > > entries?
> > > > 
> > > > I saw that.  Your remove function uses the erase operation which is
> > > > implemented as a walk to that location and a store of a null over the
> > > > range that is returned.  You do not need a function to insert an entry
> > > > if the maple state is at the correct location, and that doesn't just
> > > > mean setting mas.index/mas.last to the correct value.  There is a node &
> > > > offset saved in the maple state that needs to be in the correct
> > > > location.  If you store to that node then the node may be replaced, so
> > > > other iterators that you have may become stale, but the one you used
> > > > execute the store operation will now point to the new node with the new
> > > > entry.
> > > > 
> > > > > 
> > > > > I already provided this example in a separate mail thread, but it may makes
> > > > > sense to move this to the mailing list:
> > > > > 
> > > > > In __drm_gpuva_sm_map() we're iterating a given range of the tree, where the
> > > > > given range is the size of the newly requested mapping. __drm_gpuva_sm_map()
> > > > > invokes a callback for each sub-operation that needs to be taken in order to
> > > > > fulfill this mapping request. In most cases such a callback just creates a
> > > > > drm_gpuva_op object and stores it in a list.
> > > > > 
> > > > > However, drivers can also implement the callback, such that they directly
> > > > > execute this operation within the callback.
> > > > > 
> > > > > Let's have a look at the following example:
> > > > > 
> > > > >        0     a     2
> > > > > old: |-----------|       (bo_offset=n)
> > > > > 
> > > > >              1     b     3
> > > > > req:       |-----------| (bo_offset=m)
> > > > > 
> > > > >        0  a' 1     b     3
> > > > > new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
> > > > > 
> > > > > This would result in the following operations.
> > > > > 
> > > > > __drm_gpuva_sm_map() finds entry "a" and calls back into the driver
> > > > > suggesting to re-map "a" with the new size. The driver removes entry "a"
> > > > > from the tree and adds "a'"
> > > > 
> > > > What you have here won't work.  The driver will cause your iterators
> > > > maple state to point to memory that is freed.  You will either need to
> > > > pass through your iterator so that the modifications can occur with that
> > > > maple state so it remains valid, or you will need to invalidate the
> > > > iterator on every modification by the driver.
> > > > 
> > > > I'm sure the first idea you have will be to invalidate the iterator, but
> > > > that is probably not the way to proceed.  Even ignoring the unclear
> > > > locking of two maple states trying to modify the tree, this is rather
> > > > inefficient - each invalidation means a re-walk of the tree.  You may as
> > > > well not use an iterator in this case.
> > > > 
> > > > Depending on how/when the lookups occur, you could still iterate over
> > > > the tree and let the driver modify the ending of "a", but leave the tree
> > > > alone and just store b over whatever - but the failure scenarios may
> > > > cause you grief.
> > > > 
> > > > If you pass the iterator through, then you can just use it to do your
> > > > writes and keep iterating as if nothing changed.
> > > 
> > > Passing through the iterater clearly seems to be the way to go.
> > > 
> > > I assume that if the entry to insert isn't at the location of the iterator
> > > (as in the following example) we can just keep walking to this location my
> > > changing the index of the mas and calling mas_walk()?
> > 
> > no.  You have to mas_set() to the value and walk from the top of the
> > tree.  mas_walk() walks down, not from side to side - well, it does go
> > forward within a node (increasing offset), but if you hit the node limit
> > then you have gotten yourself in trouble.
> > 
> > > This would also imply
> > > that the "outer" tree walk continues after the entry we just inserted,
> > > right?
> > 
> > I don't understand the "outer" tree walk statement.
> 
> I think I could have phrased this better. I just mean "my" iterator walking
> each tree entry rather than an internal tree walk, as it happens in e.g.
> mas_walk() or mas_find().
> 
> > 
> > > 
> > >             1     a     3
> > > old:       |-----------| (bo_offset=n)
> > > 
> > >       0     b     2
> > > req: |-----------|       (bo_offset=m)
> > > 
> > >       0     b     2  a' 3
> > > new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> > > 
> > > Again, after finding "a", we want to remove it and insert "a'" instead.
> > 
> > Ah, so you could walk to 0, see that it's NULL from 0 - 1, call
> > mas_next() and get "a" from 1 - 3, write "a'" from 2 - 3:
> > 
> >          0     1  a   2  a' 3
> > broken: |-----|------|-----| (a is broken in this 1/2 step)
> > 
> > mas_set_range(&mas, 0, 2); /* Resets the tree location to MAS_START */
> > mas_store(&mas, b);
> >          0     b     2  a' 3
> > new:    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> > 
> > 
> > You can *probably* also get away with this:
> > 
> > walk to 0, see that it's NULL from 0 - 1, call mas_next() and get "a"
> > from 1 - 3, write "a'" from 2 - 3:
> > 
> >          0     1  a   2  a' 3
> > broken: |-----|------|-----| (a is broken in this 1/2 step)
> > 
> > mas_prev(&mas, 0); /* Looking at broken a from 1-2.
> > mas_store(&mas, NULL); /* NULL is expanded on write to 0-2.
> >              0    NULL   2  a' 3
> > broken':    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> > 
> > mas_store(&mas, b);
> >          0     b     2  a' 3
> > new:    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> > 
> > You may want to iterate backwards and do the writes as you go until you
> > have enough room.. it really depends how you want to go about doing
> > things.
> 
> I see, again thanks for explaining.
> 
> I think I would prefer to either (1) have generic insert() function with a
> similar behavior as when iterating through a list or (2) have a function
> dedicated to the "split" use case.
> 
> 1) When iterating the tree inserting entries at arbitrary locations should
> not influence the next iteration step. Unless the new entry really is the
> next entry, but that'd be optional. I don't see a use case for that.
> 
> 2) Similar to how you broke it down above I could imagine a function
> dedicated to the split operation. This would be similar to what you mention
> for mmap below. However, it wouldn't be a single operation.
> 
> The GPUVA manager provides sub-operations to the driver for a single mapping
> request. Those can be an arbitrary amount of unmaps (for mappings "in the
> way", as you say below), one or two remaps (for splits at the beginning or
> end or both) and exactly one map (which is the last sub-operation adding the
> newly requested mapping).
> 
> Remaps consist out of the mapping to unmap and one or two new mappings to
> map. The only case where a remap sub-op has two new mappings to map is when
> the newly requested mapping is enclosed by a single existing mapping. If we
> overlap a mapping at the beginning and another one at the end this would be
> two separate remap sub-ops. Of course, between the two remaps there could be
> an arbitrary amount of unmap sub-ops.
> 
> Unmap sub-ops are simple, I just need to remove a single entry in the tree.
> drm_gpuva_iter_remove() should be fine for that.
> 
> For remap sub-ops, I would need a function that removes an entry and then
> adds one or two new entries within the range of the removed one. The next
> loop iteration should then continue at the entry (is any) after the range of
> the removed one.
> 
> However, I'm unsure how to implement this. Would I need to just do a
> mas_store() of the new entry/entries (since the nodes should already be
> allocated) and then clean up the nodes that are left with mas_erase()?
> 
> Let's say there is an entry A = [0 - 5] and I want to replace it with B = [0
> - 1] and C = [4 - 5].
> 
> Could I just store B and C and then somehow clean up the range [2 - 3]?

The most efficient way:
mas_set(&mas, 0);
// Walk down to 0
mas_walk(&mas);
// We are now pointing at A (index = 0, last = 5)
mas.last = 1;
// No walk here.
mas_store(&mas, B);
// Going to the next entry is very fast.
mas_next(&mas)
// We are now pointing at a fragment of A (index = 2, last = 5)
mas.last = 3;
// No walk here.
mas_store(&mas, NULL);
// Going to the next entry is very fast
mas_next(&mas);
// We are now pointing at a fragment of A (index = 4, last = 5)
mas_store(&mas, C);

Less efficient, but still fine:
// Walk down to 0 and store
mas_set_range(&mas, 0, 1);
mas_store(&mas, B);
// Reset to the top of the tree
mas_set_range(&mas, 4, 5);
// Walk down to 4 and store
mas_store(&mas, C);
// Reset to the top of the tree
mas_set_range(&mas, 2, 3);
// Walk down to 2 and store
mas_store(&mas, NULL);


> 
> Maybe 1) would be the most flexible way, however, if 2) can be implemented
> more efficiently that's perfectly fine too.

You can do anything you want, but the more you can use the same maple
state and save walking from the top the more efficient it will be.
Every level is another dereference down the tree..  We do have a
branching factor of 16 here, so I don't know the size of your tree and
how worth the effort it is for you.

> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > __drm_gpuva_sm_map(), ideally, continues the loop searching for nodes
> > > > > starting from the end of "a" (which is 2) till the end of the requested
> > > > > mapping "b" (which is 3). Since it doesn't find any other mapping within
> > > > > this range it calls back into the driver suggesting to finally map "b".
> > > > > 
> > > > > If there would have been another mapping between 2 and 3 it would have
> > > > > called back into the driver asking to unmap this mapping beforehand.
> > > > > 
> > > > > So, it boils down to re-mapping as described at the beginning (and
> > > > > analogously at the end) of a new mapping range and removing of entries that
> > > > > are enclosed by the new mapping range.
> > > > 
> > > > I assume the unmapped area is no longer needed, and the 're-map' is
> > > > really a removal of information?  Otherwise I'd suggest searching for a
> > > > gap which fits your request.  What you have here is a lot like
> > > > "MAP_FIXED" vs top-down/bottom-up search in the VMA code, this seems to
> > > > be like your __drm_gpuva_sm_map() and the drm mm range allocator with
> > > > DRM_MM_INSERT_LOW, and DRM_MM_INSERT_HIGH.
> > > > 
> > > > Why can these split/unmappings fail?  Is it because they are still
> > > > needed?
> > > > 
> > > 
> > > You mean the check before the mas_*() operations in drm_gpuva_insert()?
> > 
> > Yes, the callbacks.
> > 
> > > 
> > > Removing entries should never fail, inserting entries should fail when the
> > > caller tries to store to an area outside of the VA space (it doesn't
> > > necessarily span the whole 64-bit space), a kernel reserved area of the VA
> > > space, is not in any pre-allocated range of the VA space (if regions are
> > > enabled) or an entry already exists at that location.
> > 
> > In the mmap code, I have to deal with splitting the start/end VMA and
> > removing any VMAs in the way.  I do this by making a 'detached' tree
> > that is dealt with later, then just overwriting the area with one
> > mas_store() operation.  Would something like that work for you?
> 
> I think this is pretty much the same thing I want to do, hence this should
> work. However, this would require more state keeping for the whole
> iteration, I guess. Drivers shouldn't know how the GPUVA manager keeps track
> of mappings internally (and hence they shouldn't know about the maple tree).
> If I could get away with something similar to what I wrote above, I think
> I'd probably not add this extra complexity, unless there are relevant
> performance reasons to do so.
> 

Well maybe you can tell your drivers that there's something in the way
and they can remove it from their end but not alter the tree.  Sort of
like a "Untracked" callback.

If you have a "This range has changed to X-Y" then you can use this
along with the "Untracked" to implement the above in a single
write.  Iterate through the area , call back to the driver to alter the
start range, then keep "Untracing" until you alter the end range.

...

Cheers,
Liam
