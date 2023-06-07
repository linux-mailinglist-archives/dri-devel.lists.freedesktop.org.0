Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD44727909
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8BD10E599;
	Thu,  8 Jun 2023 07:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FA810E54C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 21:17:14 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 357Elc7Q018013; Wed, 7 Jun 2023 21:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=/X0F23rhj9MoCaTE1mBg65dmcjuAqko5VoE+SGwpAis=;
 b=hhoRm1Ccdml86Q1KHa/ztWgkcadr/NFe2c0A2kzzlNk420Q7IVaIP6PNtLDKi0nnylfc
 +yfidIni5h7xeEWNqio/GS3PhiML5nsxqqBRgLpzWDgEdXDbbwkbNHVldZGCd3BfWsO4
 rRCQGD1rLmCpvKvrZN33vISr1DuZJcppn1+DOk8ihaWI7fg8mMCJfemMAkg4EgqI1OD8
 FCMSspkRoLF294xClWXsUy79KSakpGNKheo5tqItjN+3X3a6lAFnVXboEulzuirtOExa
 oaNdo2A1kZSw6pCCtK1qNm8WQ1Hk5hmjPzwRBa4uR3Bs4dnuGzThljBoTMTVQHdpc0rn 1g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r2a6uar96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jun 2023 21:17:02 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 357JkJes015658; Wed, 7 Jun 2023 21:17:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3r2a6m9yvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jun 2023 21:17:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THyv15sHb3ekLgWCtsGu25Ma2uy+oR0fYNg9E5nc6TXWwBAGezw0tQKjFBujNPNyzaZTrvns7xAGkUiWmtUt/4+lXcLYZKm+++Pt+tUrLO/GkjYYBDEpgy8qWCojC69GeXKeiaov2V+WYTI6om8WAxl0GBlwi346Gcu6eq1oHzf/fmuWtlCS1xraCOLy0NfN2F87F5dxOERKeI+KsV+nAQVGZIZ4I7+3hJW4ad94qjlY4w11Frqdq0Z9BOT2w2SY0yM8tIMcIOP5xNytzCp4IndSg9pplnGTkbxAK4gUd39Jihb+nMUkxeJuIubmvC2y6iP2nN4Mj7ltBgohsaXpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/X0F23rhj9MoCaTE1mBg65dmcjuAqko5VoE+SGwpAis=;
 b=CgnaPiTYvY2tMzwHJJvG/va9pIDEWPPJ13cg688pet3vxFU1GBPHSXDlG4QuMr9P7DXyn9XvtfIG2ZxWUnDvK4T+w2JufA2+BF1kpkIHturBqjrVtWqADvW3CqPU+/hrSHiYbY+DRDGnZ+mogiMdIZuHMMNGLQzJiQmpRyFJf+NzMcof6IVQIxc+W5EApergHAjfRsPH+yofnEZSdf0rAB+E6cwr0EC69Nb4bct7m8NoF4DNeU0zboTMCz+lAz57P4C5T2n7lSBLzzS73imzm/nzDMJIU2m9vAeF1ubTFC6dALky4SMSP9rC+p80Kvi2U9+iygVFntv5AtEqpFioEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/X0F23rhj9MoCaTE1mBg65dmcjuAqko5VoE+SGwpAis=;
 b=a5Z0+vkJN9eHVMRNwjLyxFQ7SiOcu2ZP+d9OI6RKakHYrVB10mFeZbsOWNTN5lkRJ3TUC/DnbF8zsG9NdG4ynor62cVdqS2j7sMUZjEhSazpHGe9QnsLTLolNRi+QbE3fAbtP027TjtBY822jPf0XI5aGUyNy4SdYS3WJJc7hR4=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by PH0PR10MB4806.namprd10.prod.outlook.com (2603:10b6:510:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 21:16:59 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 21:16:59 +0000
Date: Wed, 7 Jun 2023 14:16:55 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm: fix hugetlb page unmap count balance issue
Message-ID: <20230607211655.GB4122@monkey>
References: <20230512072036.1027784-1-junxiao.chang@intel.com>
 <CADrL8HV25JyeaT=peaR7NWhUiaBz8LzpyFosYZ3_0ACt+twU6w@mail.gmail.com>
 <20230512232947.GA3927@monkey> <20230515170259.GA3848@monkey>
 <20230516223440.GA30624@monkey>
 <20230607120312.6da5cea7677ec1a3da35b92c@linux-foundation.org>
 <20230607205310.GA4122@monkey>
 <20230607140001.6685b0a058511f125a005da4@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607140001.6685b0a058511f125a005da4@linux-foundation.org>
X-ClientProxiedBy: MW3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:303:2b::9) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|PH0PR10MB4806:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c44dafb-e39a-4fd0-4df2-08db679c8786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qH+vU5JKjrUZvJMWJBYucO2g/0+qYaMZvQJm0lv9azUoLqnptGxa684Rm8oukr/VEc1yM8qqaW6w2IrW4wp3anjZZPyxkbHT7ot+xFirAZlLOdcS8ypDLJrHguu7+wy/kZtOwQ6/fuOeRIN2XypsVIK9piU4bNbHlAsvAuGnkFHMPsKtIxiVol44fEhMiDphy3A/ufyutRKQNpy3uBXiqAPe5In5sh/zLpiIsqHutRfiE9/tg4HrofSSD9NWVrPRPdPpUJz1VJhbqAAbTltB2l64/BOp5sZ/ewxSfl/jrBaihdXild7Q9Ag+8iro0aFskgRaPtUAUq5WL8dsJuvvKL3zMA3rGmxa67Xt+r1O76oHk/gwePB8tkLhCUbC7fIKgWdrmHMEt92XKSadFqM5HFxGfr749td/KShgZS87VDJhVy7EjHs+qk6xoWUh8m/89iR4JqqhzX9RBpEfHUpN35vBEUprt99Fo/++wt7rVlslUw8UtFe5VOLxXCmhyyijV8++6crIE+lEtTrXPDSTqgn9mORhKcCnZZtTNDlOoWdaekVhSO2uwpJcTUzP0wzZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB4196.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(478600001)(6506007)(33716001)(1076003)(186003)(53546011)(9686003)(6512007)(26005)(54906003)(41300700001)(4326008)(7416002)(66556008)(66476007)(66946007)(2906002)(6916009)(44832011)(38100700002)(8676002)(6486002)(8936002)(316002)(6666004)(33656002)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gs0lDhtLX3thdsDT98MgcIEv39wmiPKAyKA32X4PPpA1/Yub+BLcIBK/avIW?=
 =?us-ascii?Q?1Ai3GIAhJA29XyyyWVbO7ryKajPZmnfrtzfAVJtYiC8mltNenNJ65BHfnhDd?=
 =?us-ascii?Q?SLTv5EmrCj/r8C8qh4Rv0UYeFAkylZ07UU4j976X6MKtA+1AHAFtG5bm3X12?=
 =?us-ascii?Q?63cKnWwOBhmjNaMUR6FOouwCp+pVOn7ePqbtBvSjcEWaetlbMrTOnu8LwCOV?=
 =?us-ascii?Q?oVBQggOaDPwJZXx0hra2bL/x7jb6Cn38tHFAtRCIBGD4Xdtz2jsorke95/qc?=
 =?us-ascii?Q?9DbKMNgo3as6isxB/Ttf4OW7LJw3EJDWh2nL5pv9/6cUjmVi88mjCLzCdkmz?=
 =?us-ascii?Q?pm53I7ZMl63cCEorDGC/w47iHP5q8oErL3qFNvuPI2s6/Bo3GmR0xOQnLo6N?=
 =?us-ascii?Q?PfxwsZvcpXi0teVoo90f/Kfa5ZTQMqEe9eH3U8QEURtxJ+SjFx7srxIZ23Wu?=
 =?us-ascii?Q?c9RjiLSmDMstqLk8x5KwQEGHyWme/6GmyQ6VGudaD2YtivX+1doPXHK9hWq3?=
 =?us-ascii?Q?JWYMVSwtgj8KvCuRY2DDP7CCtAB29bQ30BATa3kfpSfqi9uYLzKKTs61DC3W?=
 =?us-ascii?Q?ZqCaVOoNudfMY+L5AZ95peskYjkyu6lrVrLGhm+Fg6Fa0fImB8VBPlDGh9HU?=
 =?us-ascii?Q?cftkjXxL2hcahizdRJfXPUUKz/VacII24j3twK/v5+G8ZfMyui3P4dVR7cpP?=
 =?us-ascii?Q?SY/Q1yv1mpyQRBZEIWjfgK9A+Ih4RIvhZWgfeybbfVLCdo66Hqu43fSWgkMJ?=
 =?us-ascii?Q?ku6aBOiJFRGej4ax1UPqvRS87Gq5VLGPNiehDvpl2ss0gqY0IlcPjqe+QEq5?=
 =?us-ascii?Q?dk5MFsYpm3ObrUNnHtERTU0PJleydWo44/hZhcnjUspsocBvO2pEYYZDa5MA?=
 =?us-ascii?Q?lZBNjyffwKF9aaN9k7eT1g3KtVM9UFTZZMO1zetjjFp6/50shQ22MJzgJtrP?=
 =?us-ascii?Q?8jcUwGr6LMUbDUnZEmG/I5rOeaMUnSaXJR+hCGtD+ASMgL3D0Cqycyeo7xN2?=
 =?us-ascii?Q?dMVpfQW6etgb1lbPctnCS0VR5NU5F7sfhMQplKtzn8lEd+ymGXNNmKQiTK3M?=
 =?us-ascii?Q?Tj3ug3MxvL8MeB2ijxFWqeok39Y+1jbducXTaxPMXk3e3eQJDyG6ksSecW2W?=
 =?us-ascii?Q?2+f09NhvGicnNXjp1zTLZTSHpKGB+xQTpcinuz/sxTwX/VI93ZeCwQfDpZn+?=
 =?us-ascii?Q?aaRBCatfmAZ+Q0zuzEEllDC5dCsrxREYoNVVdSOmVfuGyts6MWLhVKTvNd7r?=
 =?us-ascii?Q?TD9leb/LB9KGcWUZkuqSp+TdhggBuOjwux/RnYx5KRSrFEvC04hOEdyMidlz?=
 =?us-ascii?Q?MotsItQiJjYQQVnGv01ACQqIjxwAQEUjpSJ+YUvz74S2ezcZqpsJOPk3mGYv?=
 =?us-ascii?Q?0LN1ONwmHEJKc0IKW9WbyJMIz1x3wWvyPE44zrhIu9zqdsM7BlK44b/30LY1?=
 =?us-ascii?Q?ysYIRRVO+LkKygppi+4gMPzCuBrsRnvSKBsJrwlsqpPNr2ED4ggX9Tag+JK6?=
 =?us-ascii?Q?zE0hObFdgGpzuuLXqXrc3xdOw22vsK2GwfoSO0l6LxJjAuEmBrqCxZJvV8yD?=
 =?us-ascii?Q?zA6qe7KSmmPW+e7iDQXnEw6/F3fT/5hV9wwV3a+2uzOKWGUc1WxfV64JDFR5?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?fnT1R+ah+6hd2poJ9E8kxfs8XcuWKbPnh+4KE1cRoXoDaYuQyIw4pU7tgJG1?=
 =?us-ascii?Q?mGzptkKmTgHZyr8MFYozOS4pjB4FlDHKq6q8HIXkev6A46aAtMDKay1xEz1Z?=
 =?us-ascii?Q?MrfN7QJgG0OCzOf+pYnb/TLG2OQoH5mQi8p7OT8vGqFhdmETa39Ldu02S89U?=
 =?us-ascii?Q?mWhTuGZMqj9JivyhXGJ7IBLzLLE7vVIEyB78Xv1uaQlEUAVcbP/vioBL+QvJ?=
 =?us-ascii?Q?FrITlvRk08GhdGz5prroT7udU8KSLr6FxCGB8lUilZmK1IoiBkcrvL6g55xC?=
 =?us-ascii?Q?vFHl61fMvocFAdMVUVfLdjoARr+ycaiobLE6EbeE/x1N3qPbcZfo18phEBQX?=
 =?us-ascii?Q?jsJArwJBJrbYan9myTcpESiWx6LEO/ACNGtfhJUZsSkkFxIddkQ6B2Wudzqz?=
 =?us-ascii?Q?NyOmW0Fk6DMuUfh8vUEgqQrHM4VC4dD6UXygGgwp+BdAqT8IVAtH0jnIBCfB?=
 =?us-ascii?Q?Rsus3OE5WdiKbjSvIgkbBJQWk/2yE0JNvQtPFWgvW5A+9pl/QdPzz1bqKalN?=
 =?us-ascii?Q?lPxYHJrAQ3GFjKtTUOyhsLZVjnQJNnUTRZXXU9K7PPDfLlRkMC7hVnE+go4Z?=
 =?us-ascii?Q?GXsEkDwzjQ7owD2c51o7B2zQFM8lekPDkRZQwHwLYHftpGpSDK7uRy7y3CsX?=
 =?us-ascii?Q?kQaKH3yc6ueKhtN648doN1PpB+30V2hdZoFjWcgHhPIjGsI8fkyNbRNeJj+n?=
 =?us-ascii?Q?paWF0KQYPw7bkivlw+9OKF6/HRXaeUzCZmKb+rixPfxeKMjarZzAzBrShKdw?=
 =?us-ascii?Q?gbI2GSGnBpqqRzDX3kq3RM672tqkI5vIOpeAFzlF/orrWWJ0JZm1COpX1NTm?=
 =?us-ascii?Q?9lRFJTX7ftKV5PktFN4S/yMGFBFlu0TT0F+fLeC4uZnoFAx1lzB/gDQBSnES?=
 =?us-ascii?Q?PXOSBP6kpC32G3uagVMv0NN9bqq6NPPjBeSAngfqZ63JP88e7MPh9KGS9dCd?=
 =?us-ascii?Q?L2RvIj0+EhexwMhNk4odXLiJ3nLjRho0jB5B6ZMSQkFb+5nX1W3jAbUfHJcX?=
 =?us-ascii?Q?aP/UbmuSBlMkOJVYG6GT9SlRHkr6tc9D/JAJipSVPNq3CLJ9/2iTcHKdRad6?=
 =?us-ascii?Q?FAVDEpRa5oRjA+JeK0jVyr5HueyN0Tq+cwfzS8Q6fkbehh3xVdVJwUMJQyyE?=
 =?us-ascii?Q?5O6F0MuFc9tO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c44dafb-e39a-4fd0-4df2-08db679c8786
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 21:16:59.0643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HE7DDaCXuAL9thsfdqyp6F1jC2RsuAyN/a9WocPOoC3h2DUBb75uSozGaeWYEssVGJjax5wmyoVa5opBTkwKUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4806
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_11,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306070185
X-Proofpoint-GUID: HlSc-Oim8cU-HPMvDPWDzNnOqTg7wyUE
X-Proofpoint-ORIG-GUID: HlSc-Oim8cU-HPMvDPWDzNnOqTg7wyUE
X-Mailman-Approved-At: Thu, 08 Jun 2023 07:44:49 +0000
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
Cc: mhocko@suse.com, jmarchan@redhat.com, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-mm@kvack.org,
 James Houghton <jthoughton@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kirill.shutemov@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/23 14:00, Andrew Morton wrote:
> On Wed, 7 Jun 2023 13:53:10 -0700 Mike Kravetz <mike.kravetz@oracle.com> wrote:
> 
> > > 
> > > BUGs aren't good.  Can we please find a way to push this along?
> > > 
> > > Have we heard anything from any udmabuf people?
> > > 
> > 
> > I have not heard anything.  When this issue popped up, it took me by surprise.
> > 
> > udmabuf maintainer (Gerd Hoffmann), the people who added hugetlb support and
> > the list where udmabuf was developed (dri-devel@lists.freedesktop.org) have
> > been on cc.
> 
> Maybe Greg can suggest a way forward.
> 
> > My 'gut reaction' would be to remove hugetlb support from udmabuf.  From a
> > quick look, if we really want this support then there will need to be some
> > API changes.  For example UDMABUF_CREATE should be hugetlb page aligned
> > and a multiple of hugetlb page size if using a hugetlb mapping.
> > 
> > It would be good to know about users of the driver.
> 
> So disabling "hugetlb=on" (and adding an explanatory printk) would
> suffice for now?

I can put together a patch to do that.

-- 
Mike Kravetz
