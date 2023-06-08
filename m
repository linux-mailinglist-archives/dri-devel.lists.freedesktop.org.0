Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 839E57290BA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 09:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9215110E63B;
	Fri,  9 Jun 2023 07:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A09810E087
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 20:49:49 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358IoAv5030622; Thu, 8 Jun 2023 20:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=vw3r83/WKsJhnrp3a7tTbYQvxzyInjrmL0J4lUSaqh8=;
 b=3hVmK6lMz5bRBHKbt8mLSXM01yzPRP87zco4xsKBIOofgS8syWRxi83XgHwHNeNDxprr
 y6MyNBhNb9QoK1qsqr0RMy/EFW7+bnygQvqSYeWyK43JtKy3nq8qadn5eh02/OBjXyb4
 7kMcuq+zQzqYkGn6xsN8ZjtMSw0bfskaNMa67gT/tF/08VZyICoI2PPgTjGPvOmivOjl
 /h5h+7hbicZJgI6jv8VvsnkzBnxX1Tor6xoEcXLelR9O77zXtBrsssNNv+VTlpzrdaux
 +ItBzPwQ6NATd7hKPt6skp/G1TO24yC3kTyHvrGPLPMvfr5Wt4YSXdNtWUwmDnxNHYty fA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r2a6rn68h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Jun 2023 20:49:37 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 358J8vir015759; Thu, 8 Jun 2023 20:49:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3r2a6nm7dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Jun 2023 20:49:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/3y7RpjNpRIHnJnAson4bzffKYP0bLFVlTPwYT4jKgJCTM1xSH/8nPEF++vM1uxEmCwo9OnzFJi0Pzx/120MSFYtjw13F2Kkoc9U+19Db5fOVW5rFhd2VSPb2ktfcp92OYeARpyr63hZcXk3Xzs1/I/Ar+dl26hLCQzwvGik51qvZKyiLvwxhM07HY8ybDkerA2MUXXfW2EHNcXIzMS2Ity6Nhvtf5b7b+efXWp4lMPWlSH9+t1LVSkM9AHq/2sesid3RORKElPXHPXU3InIs8SIzz7/OrV22rYc7AtlYuFsNTmbSf0WOQJtTo/wbc2Qtc7+cQD1gBgw4rePXT6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw3r83/WKsJhnrp3a7tTbYQvxzyInjrmL0J4lUSaqh8=;
 b=kMyo+UHobiHaspyPxnuk4xfjrdcILgrg6k2T2uTAIbVpIi3Tlcuw8xn9Ui03ksG76rTBMCKg1omM+W2LhxZuPF5BjRJz3Dptqr4WaPFvx8V13oQcvK78m7NTSgQNJVR9OOrCWNCqGIL4Mbz8nd1nfNSds1wecIYNG2xiN287xx1ZeLEwFhnAeid7uxWc5pWCuEgzi419VgFIIKg83Qan6wetj7a6ZkAH5dbUkB4635E9d9LchDOFW/4AU7TgqhaF+gmvt4r/tofuRF3IMGWFKZvMngleRO7/qQP3JpR/rkLbQyKp1wZViLMVsjmz+eOb5KnEGzdlGkMEtAFqWua9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vw3r83/WKsJhnrp3a7tTbYQvxzyInjrmL0J4lUSaqh8=;
 b=N7XkMd18a67fJb9yUZ27UHLsn8dzHd2ioOCy9t+cGRoOII97oCNmP+9oQ1njqo8dOeSj09ykk2Zy+KMUboHModnCvGmMUHwKv6+8v5MmYEYriI9Obosjleb5JZOmG4tZLTKy7ifL+SIb6hIYcCN/T/9ohjxt8gXYAkloTcZQlGk=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by PH7PR10MB7839.namprd10.prod.outlook.com (2603:10b6:510:2ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Thu, 8 Jun
 2023 20:49:32 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 20:49:32 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, qemu-devel@nongnu.org
Subject: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
Date: Thu,  8 Jun 2023 13:49:27 -0700
Message-Id: <20230608204927.88711-1-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:303:2a::30) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|PH7PR10MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd700d2-1e0f-46bb-819c-08db6861dc71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gv55zMEEaJi5jXeoz2d/SvoHRmHEq4jJ2Ef1DxSm10GKkAjQ2MzQe5ufa8KoM8HNdXGSQe/qBI6dwci8ey0rC+2g5/Y11wklJESAuGwKPetH+38O6Z+IT8wAdL3sMxxrOOFRrYGpEgsh2f/GJ+eCVRn6CnrCRgL7tFmopoGMcyysw6qUIchOgn8ke1LlYPuFaCMKGjFRp/DG1lQI1H7brJanCYeE1JKCNJVR1KHeDVhZ9ENeJhzreN2RlcoxpS7/HVgiMP13JrzJGQ8xHpnvgtbWD1rouHn5Tu47VNe5FRxhMo2X8v0k9iUyvejExJvLo6fLRj8BnrBDZFGXn57+EUKx3Bn8htWIz86wE1wi0e+HPWsnROssqZZ6W7h8lXEoPQa5JAmd4eTZfJa1aNXcXvoIqDRW2lnUz9rdXNEspbx6sqenzihGfI0MeobgnSgYzuKrf0NlV6BzH9DcIYxKj0byQBxDzyGxSC4ZR68ixb68+RjJ0lFDo3asxAYclO2C3WH870aNXPSaBkkhUZhgcyqMzx5ubPg6107LBn1Dd+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB4196.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(36756003)(2906002)(44832011)(7416002)(5660300002)(86362001)(6486002)(2616005)(83380400001)(6666004)(966005)(26005)(1076003)(6506007)(6512007)(478600001)(186003)(66476007)(66946007)(54906003)(38100700002)(316002)(41300700001)(66556008)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?weQS83ZB2gFGUROpJJqjfbblzLpbD0g7GAk5tMeTfTm4gyq3UjbRQobrGjWi?=
 =?us-ascii?Q?/sSAeAlV8uQHkU5SgFtJfBbZjeJIIriC7jKTTWqVhUDFznZ27eK4Q9ArBICG?=
 =?us-ascii?Q?ZU8NLM3v+PCr08HnV+KFJ9J41/rxZKjiOchWkg8lUbIJsYS1jx8DEJw004ya?=
 =?us-ascii?Q?jvVocY0xhm9D2+KevjNBrU3BaSJeoWxz6L0dO0F1Q+nOUZ1iSlIP47bmmYHa?=
 =?us-ascii?Q?B2f22Bwd/xyKpuKIyu9/MLFSkmxHNsUKnFzToI6dtfQotOXzyaIKA1QovjoI?=
 =?us-ascii?Q?ZaMTq+CIJN7ihiCJsH3M0k0rjBf0thAkN8xcYp6iserDJSOoHrWH8/a62A2v?=
 =?us-ascii?Q?/1z5LRp8B7JGoNWwrO89OmalKJNBOCN0PKghVTlRdkzNZCH+bFmnQZ53mO04?=
 =?us-ascii?Q?+ERO1E6g+SAXTC4Q0LserQluLDXNwnI/WRxkupslFzfj8aTQeXk5wR8+4Y3K?=
 =?us-ascii?Q?azVV7k5dGB6e+v/LTFPF6vgm4oyHy+20FJvhOu6iEnb8e8sEpW94sKI/1gDl?=
 =?us-ascii?Q?AN75xRNMBhG1ADEb6r4deEzM/1KUgDvJlrh7I0YXdOwaEaqXoh3dJSAqtotg?=
 =?us-ascii?Q?/sIDIqv7E8d6ZFl2LY7sw+IH999NpDKCbId1eTIOmcXnfeJPOullSX8JYPE0?=
 =?us-ascii?Q?vIALI33QUzKDloX9aJOgSrqOkkpS0xFEXKKo64jo8BuVX9OTazp7X9m78DfC?=
 =?us-ascii?Q?UVZCvEPqA/ltobGSCaw2SOm9DvLGWMeSxjVCl6n2fDvpGCYXz3HupRLDfC81?=
 =?us-ascii?Q?MdDy01naUylAeTZGtd+y2NfOXmY0giYrIQ1kTnjml0uCp6L5ZKOkdfQHCHUC?=
 =?us-ascii?Q?9LbSrrlCn8M1huMP/4H58ISyFjzaQe0xwNtFsCG4LiKbuejxXVu7Xhhkqkq6?=
 =?us-ascii?Q?o9a8HC5iXBWBSyS2cND6Bdb7yonM0uo4LmrApy2nTwF4aTgLlWUbDkfQtyOo?=
 =?us-ascii?Q?bmyvf03ClbMYFUaIxx/eHpmyOTdVOSPPUgiBvl++jZ24ZztCnTwsmwixBUWe?=
 =?us-ascii?Q?ZQwLYEwpwugbfyJINjfwAjySzBb+G4wBWXVAf84ks5COqTRdNbyfS4c8jKey?=
 =?us-ascii?Q?LVA9QQ3u4cAY/ZmWY5Ewkpuxxb6CAuUOShVhc77aV8X3sT2TahMWeiVfGTNU?=
 =?us-ascii?Q?9beZs5U55lJ48Sqsk4sDLYNr2mOkCBUKkN2WGZkr7OP7uqfKDwjIaw4Xad8i?=
 =?us-ascii?Q?XKcnRGWV++8PqJhcihaVuTuMyRZN7Tk1DYOhy+GRZc4Y8PqIVxIkWvuAH0nm?=
 =?us-ascii?Q?tgEG7+ZErP9rYU573qVFBs2ZxKe0VfaD3LoOatsEGPTGyNc2KW37oV52t2TM?=
 =?us-ascii?Q?r+QHjniZzvoc/G4+s7cpbXmTgf9O39O3sf3AOrjbM3oC7cRU05dWWTGw+Opf?=
 =?us-ascii?Q?Dc0VENuuERgwxm7nSQUkvE/UOVzxeRqv2cM/pjNUMaSvC6oGj0mOpc31b2Zt?=
 =?us-ascii?Q?VcWb4W0ssTUjWVaXZM7r3/5DGsMxFuyOGeGjnCM3BLm/1Ak5ft3jhmzrWvpH?=
 =?us-ascii?Q?MRfojRhcLAmKv9Eg+lwph/ceIZID3F7v2xpXIWsOEzmGABOIPx/IndHx/N44?=
 =?us-ascii?Q?AZNXDv7Jj8q9g8zSsIEsBWi4P5bIOk8fHtXwvQ6P?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?DJfvpRde0XiT0GRt3KRvZg+zzkpct0YftypIOkZ05aogmi4l/4MJKao2j44w?=
 =?us-ascii?Q?fYtUYgs2xEzYivRcojnMFV5HFm/6+s97C6Mj43RjnXfo5g0yhQjPGlwHN4Yy?=
 =?us-ascii?Q?p9UElXdNLTs4BjqDeo1WMkh2kyi8JzbjqM7spZCgz78lGWYELAVgfep4rSo1?=
 =?us-ascii?Q?k+opxS3+6YrOtlZIu/vDVNK6Tw2Mh0tgbCdncOkxTrW8605t/cxLT/nXd0rd?=
 =?us-ascii?Q?bNlaB2yGxiGIGJzGm65pI4NcVX+vhd68Sjb42EV8j/kefPFrMdfM52LfA+eC?=
 =?us-ascii?Q?1j3yH40cq+A4Jcp3j+eRtHbyhzKfqNYSJaobLgz43FX44k33sa2JXd4fjpYr?=
 =?us-ascii?Q?awT9iStf/Oyq5TysUbsRL/t69VcPCwLsRgWRA4wVuNp4CSuDCO5gBEJg58NM?=
 =?us-ascii?Q?E4JsIypG0rju0w5o+OXU2eSH9Hc7nvOVQrQrRwAOWl0Ruts8gLjLGiQmRZy1?=
 =?us-ascii?Q?30Yq9WgyOMU11Odg7g8gaT6azchXevPw8Ny+qQ27a6MkayybduWLIp+S+ogu?=
 =?us-ascii?Q?tnF49aPXiVbBaphyFyMgUKT7y6rb73hrLcLfyk6W08i5XeFqWpNYUg2Zqg2O?=
 =?us-ascii?Q?NLmqVjkVSdM8Pw80EZ3yRBCyN99NBXHLLZTVge9YjyHW3TI1giuuIdeMi89g?=
 =?us-ascii?Q?4Jmu1N1SJ9zlRvkNCqGiDl0lwJ+TdY8o44jxKU7rLiYO/AvnLeorGkwVtFjo?=
 =?us-ascii?Q?3fe3rrBjxlWzy1UD8KE4hhui17f1BTxLgNd+DyOVakqY2/G/6qRGcY2X3LPZ?=
 =?us-ascii?Q?8fS3zWtmQ917eVtZtIENNEFyW/03St2NGh60Rx74cRUykhDb253FyeoFHQi8?=
 =?us-ascii?Q?4C3DXNlYVLJmba/6yP0DIAeqdMd/CQMroHOWZl2Ez9JBAcRk9ohYnlycXLq9?=
 =?us-ascii?Q?ey8AvNh0kk50dZlgdGyJHqIq5cy5b/pmu5Em8Qfsye+KNLJ7ob7wM6x06Oji?=
 =?us-ascii?Q?S6Q5TBEEEpDVfVF+i6Usx0NjOfHx57MRlG5pVYrC2VVki4aBtv5h077Abv4k?=
 =?us-ascii?Q?9v7VO/lwaaRBklvZ8m2DNImnVZCQ1HxRha5WMmNpX7qsi9p00OqCZD1VhVp0?=
 =?us-ascii?Q?NWgW/ou0og4tdVY4+mcOWes/1uhbgSqAqG2iXKvi7/kDAZ/DbNYiWi8XpYzQ?=
 =?us-ascii?Q?hfAG4+3CZFsZFvAOvvqwjfDvqLjC6OZdTw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd700d2-1e0f-46bb-819c-08db6861dc71
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 20:49:32.4238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcD17avBT89MxbAMG7WK0baD1GWVDeSyM6v9UMQsOh0B9oxRmnn4CY/Y8zpAjvhoo35q1LN77dY5b4+effWUlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7839
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_16,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306080180
X-Proofpoint-ORIG-GUID: 5ZrkPVwTrpw1FcLq7U75mtnTDyAG3yVT
X-Proofpoint-GUID: 5ZrkPVwTrpw1FcLq7U75mtnTDyAG3yVT
X-Mailman-Approved-At: Fri, 09 Jun 2023 07:16:27 +0000
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
 David Hildenbrand <david@redhat.com>, Junxiao Chang <junxiao.chang@intel.com>,
 muchun.song@linux.dev, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 stable@vger.kernel.org, James Houghton <jthoughton@google.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, kirill.shutemov@linux.intel.com,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This effectively reverts commit 16c243e99d33 ("udmabuf: Add support
for mapping hugepages (v4)").  Recently, Junxiao Chang found a BUG
with page map counting as described here [1].  This issue pointed out
that the udmabuf driver was making direct use of subpages of hugetlb
pages.  This is not a good idea, and no other mm code attempts such use.
In addition to the mapcount issue, this also causes issues with hugetlb
vmemmap optimization and page poisoning.

For now, remove hugetlb support.

If udmabuf wants to be used on hugetlb mappings, it should be changed to
only use complete hugetlb pages.  This will require different alignment
and size requirements on the UDMABUF_CREATE API.

[1] https://lore.kernel.org/linux-mm/20230512072036.1027784-1-junxiao.chang@intel.com/

Fixes: 16c243e99d33 ("udmabuf: Add support for mapping hugepages (v4)")
Cc: <stable@vger.kernel.org>
Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 drivers/dma-buf/udmabuf.c | 47 +++++----------------------------------
 1 file changed, 6 insertions(+), 41 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 01f2e86f3f7c..12cf6bb2e3ce 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -12,7 +12,6 @@
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
 #include <linux/udmabuf.h>
-#include <linux/hugetlb.h>
 #include <linux/vmalloc.h>
 #include <linux/iosys-map.h>
 
@@ -207,9 +206,7 @@ static long udmabuf_create(struct miscdevice *device,
 	struct udmabuf *ubuf;
 	struct dma_buf *buf;
 	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
-	struct page *page, *hpage = NULL;
-	pgoff_t subpgoff, maxsubpgs;
-	struct hstate *hpstate;
+	struct page *page;
 	int seals, ret = -EINVAL;
 	u32 i, flags;
 
@@ -245,7 +242,7 @@ static long udmabuf_create(struct miscdevice *device,
 		if (!memfd)
 			goto err;
 		mapping = memfd->f_mapping;
-		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
+		if (!shmem_mapping(mapping))
 			goto err;
 		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
 		if (seals == -EINVAL)
@@ -256,48 +253,16 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 		pgoff = list[i].offset >> PAGE_SHIFT;
 		pgcnt = list[i].size   >> PAGE_SHIFT;
-		if (is_file_hugepages(memfd)) {
-			hpstate = hstate_file(memfd);
-			pgoff = list[i].offset >> huge_page_shift(hpstate);
-			subpgoff = (list[i].offset &
-				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
-			maxsubpgs = huge_page_size(hpstate) >> PAGE_SHIFT;
-		}
 		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
-			if (is_file_hugepages(memfd)) {
-				if (!hpage) {
-					hpage = find_get_page_flags(mapping, pgoff,
-								    FGP_ACCESSED);
-					if (!hpage) {
-						ret = -EINVAL;
-						goto err;
-					}
-				}
-				page = hpage + subpgoff;
-				get_page(page);
-				subpgoff++;
-				if (subpgoff == maxsubpgs) {
-					put_page(hpage);
-					hpage = NULL;
-					subpgoff = 0;
-					pgoff++;
-				}
-			} else {
-				page = shmem_read_mapping_page(mapping,
-							       pgoff + pgidx);
-				if (IS_ERR(page)) {
-					ret = PTR_ERR(page);
-					goto err;
-				}
+			page = shmem_read_mapping_page(mapping, pgoff + pgidx);
+			if (IS_ERR(page)) {
+				ret = PTR_ERR(page);
+				goto err;
 			}
 			ubuf->pages[pgbuf++] = page;
 		}
 		fput(memfd);
 		memfd = NULL;
-		if (hpage) {
-			put_page(hpage);
-			hpage = NULL;
-		}
 	}
 
 	exp_info.ops  = &udmabuf_ops;
-- 
2.40.1

