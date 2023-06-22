Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E273B16A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871CA10E611;
	Fri, 23 Jun 2023 07:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070EC895EE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 21:34:04 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35ML3wJG002927; Thu, 22 Jun 2023 21:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=VkbebtIGKV8qeG3RvmxBXqpu3cqtl1t6OlKDu/K+xWU=;
 b=fYANyRjYFFy8GfgrQLlxh8HCUNC81BrJGnZUkhZoO4vDI9YYljr6Iy3ANvZUB8kimRL9
 sUzdpNdw4ZgkTtfC7f11zU3TmUulPQ84/G3ziI5bYlklxj7bZgT/IQXz9e+HOqTkLC8b
 Kq+fT8qKToUF2ThcqwT+AmbNep1YNe6fSpfGuTUTF+aVpIIvXNvG3bUUhpnePzrK1Amw
 Y165HdzzoAMQBxA7r5HBEKzWaVI1NpqcBoxqI54ccmQORokBrahB+s/gFQzrsTDkCm0V
 ZzUmVaCckqNVBH6g0XZ62RJEX9mEoBXUx5FJa16F7wLC6kMQyEqbve40T+XkF3Ejxljh IA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r94qaan11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jun 2023 21:33:52 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 35MKJC6q028882; Thu, 22 Jun 2023 21:33:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3r939e5v9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jun 2023 21:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ynkn9n88ajS6+j8DIqlAL9okRJj/0zcIUGaErVgdr9URWyM9XMdqgiyp2LBZUw1Oh+T+tdsu5j9kz1Sx/2hwrA7HNIbu4G3f01cvl2URN3wVlY2/AW+iu332IvifwkSbhTIR5Z5e9AQVZiLIrxDRF6LWfhaJkQEKHukwYkm3NNSTr9V3D+xc3dZ2iX79+jz8uas9PgfbJK4vGtJek+jfSTJyqwXRfoT0PUVa42QN0FlAbZNKClTjXA9Ec2mfxVuKqm6N+SyBIhnqMZEFBE1JcKLyBFRUfphiXoE9G7d6jBeYIWZuY64+A3n9HhxNHxkEdOvXpxL3Yn8Y/2/tOvsvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkbebtIGKV8qeG3RvmxBXqpu3cqtl1t6OlKDu/K+xWU=;
 b=Q2GWIhl+H+cbtFbHI9DWPBNnWjAgMM9xUf0tq2cDaYnAYTdAONDtgXaDSyiqgsKm/HlmiNeJjKjA55pQ2A+olKVXmToIsEaoHzg27UeLQNKQZcKZYmnnIggg7sNrRlWGDBgePvxZYfP9PYz1+xMoj4eAu82vrE8cpjAEPKpHK/3VELz1KD2OLw+4HDcTLJuk0+mBnadsI1P8jwVwi3bNInw0MJ3C4zUAtyug9nRMnV824a116+nzuWqtKX5kJ52dOzHiXi54d8xttZLz9xfkpUUQvuX/dy9WweO+vKxmrIM2OoK8B2DCVD4rpsAZ/UcBt8ADes4xM5Q+GxumvOHhdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkbebtIGKV8qeG3RvmxBXqpu3cqtl1t6OlKDu/K+xWU=;
 b=SiSIttTLnJ/Oh6Pc0rj5CFTA9tFFgFwbGwBSivxkcCr6rqYQsL87LhkwWeAavMffleEaQHSng2bekebyFlGl8CnoUMjbBbcegLSW7KewRYJuX2r+R3UVHa7deddFwmXfxFSRcc5zQQN0lw8tpyC1DXY7dZIsdnbmXEj3hMWrScs=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by SN7PR10MB6332.namprd10.prod.outlook.com (2603:10b6:806:270::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 21:33:48 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 21:33:48 +0000
Date: Thu, 22 Jun 2023 14:33:44 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <20230622213344.GB4985@monkey>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
Content-Type: multipart/mixed; boundary="E/sAsGthSYCltNMH"
Content-Disposition: inline
In-Reply-To: <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
X-ClientProxiedBy: MW4PR04CA0351.namprd04.prod.outlook.com
 (2603:10b6:303:8a::26) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|SN7PR10MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfe063a-b96e-48d9-60e4-08db73685d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q6HbEMTC1tRsScsCYlAlp3xtZLZO896HzUBSJ7p7sGVwADtyAXq1xAzP0SVOuQLkm53AKEqUVdNVxFrdB6CF8TdScxLwG0TBKud0JODtI0WxZsc8W4jffO32qMWDym33WNc/urvaL/gZNV0FwpipBlPpwxfKYUCTkhTXy27FhEyrNJDjOt60mzFhPj4VAgLDySWZ4He+EwsxD7OsFclCbchA/pmSsbrl4reUE0ZlLQKqUDvyDzh/4sYANlWAfXOwep8N6uWIBMu4/+yIooQoShwYIm09AIrHy1wOhFBmmrYO/f5llmjKgFpF0KjRVcrXxBS7MRCld9We8QmYW5B0Jn9i0kdOzChL/f6eZGW8Q+rpxwqZJJrZjB9ipbylQCKy20z4Yl946uvW0uXEE5LpTXCnds3qLnOBlk+wJZZbBdyWdwSfCcuZfdVK0397UpTxEc/3fbYZ61OqoqL1Nq5px0WVJ2tdU0wkTRtbWGL/DniIm3UZuxKX8/oq0BvMrkKsphEsEFvHd4CgAlYtLh80XxZ+HlYOPnWQTj0YEINHb3OQanCDIqA/5jBXDkABDxeEINiM+2mORnDZAE1KU3nSagVSn1liDTLuwJpB1/QlNb+dnZFL5I+pnK3TD6ZM+8o/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR10MB4196.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199021)(53546011)(83380400001)(26005)(6506007)(186003)(6486002)(9686003)(38100700002)(44832011)(7416002)(5660300002)(8676002)(235185007)(41300700001)(8936002)(1076003)(2906002)(4326008)(6666004)(66556008)(33656002)(478600001)(66476007)(44144004)(66946007)(54906003)(6916009)(6512007)(33716001)(86362001)(316002)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Yesnbd6SKDDi+rIQefHrDN/lPHHedSgZ2I72akDNllnt/yr2kxVTpXLrBhU?=
 =?us-ascii?Q?GcLQI4fTIRyfwMne5R5Zrm7K4f6WaN48sJeN5mmC1Tsm85fZGDY3iIeJT4eE?=
 =?us-ascii?Q?v57EH+SIJGyN7PDQon3tuMcNNoqwvTT0XzMyhVCW5bN8tzK2sedX5Ze3+kxI?=
 =?us-ascii?Q?smx0gahRhGbODnnX8AJwfBRs3QxRFgBO8AVjcg7YrjAmjmihEt4R2BRV2n9u?=
 =?us-ascii?Q?P5zg2rH9cy2gEj6loFKE/Thyc1VL9afZUXlZwVKy0ElH97Q4yG8rVD8/f8P4?=
 =?us-ascii?Q?1vxW4BD+jfWnRYWXwjaHyCc8FH9KX6PoGmPAjiumpTm1wwaYxubpkwC1q1S5?=
 =?us-ascii?Q?auMO/RZ3liOFzKgtj8kG8yGLA52c2lxM8MO/arUZVqLI895RW8X4vccaMgAI?=
 =?us-ascii?Q?9puIsaa1Imk7IFzkk3LNBHhc7hQjuApJniILRn7mtmbtTogp9AbM3OH+rTqN?=
 =?us-ascii?Q?7qZlH3IM+cjjlZcAHyPlUbPi0g5qEKW1ZTtTMV2JL/of+5YNE9Zr4urBl5Yz?=
 =?us-ascii?Q?n/bCGT2SbHaRunUYw8iXy8r4Ba0YnOtM99AaQHJ09teqOn2tv4qPQQ9Qmnb/?=
 =?us-ascii?Q?Ct5Trwn8W0BSyhEk4/rXdSDIPd6clsNeFPKUh2r8VyeDQ2fng708fb+Coe9U?=
 =?us-ascii?Q?Q83XM/2H4Jdl56qL0Muf3fD63ZqR2N+vKaRu0rvJUtzBQLte6zCz2aXSiFNi?=
 =?us-ascii?Q?vJtiyuPB5BvHv2kJ/Fh74W4Nv020hY3Ec8ju8i2VVJYw5V2ESZqs4J1/IPTT?=
 =?us-ascii?Q?GjWL3wBKFy1dcuGLT6tuDlKLMSRPjHDT/CPrckGpeT58EpmzW7+aC2BBX09E?=
 =?us-ascii?Q?qHrGPH4ob3C3pPUDheBXgmzuMSMvZKoYz36Q+3eAvUREKIUSsL8z/mVyzJ5F?=
 =?us-ascii?Q?Uq83+XnGy4QjVIWFJS/beK2Mmp99cgGkIoToE3xorUkK/zZyfUt5QvvfveFZ?=
 =?us-ascii?Q?lrk6LQqwJNou+mf1YCclMPhZz+D5sSOlpX1DcjCSPujZWsWcyDKYO76Ab9EC?=
 =?us-ascii?Q?dTjYToMOwFaNipjz7LZfTJOUVzh1dUxEIXVPQJXOalalBJLi291xUKYVs5Qd?=
 =?us-ascii?Q?08VlyJixVOTVRw9YGtQqvbbak32d+IrlRdTeXMQx1TpyqdJ3bl9rXrWwpisY?=
 =?us-ascii?Q?BDWSGHQhmgJ8HVaLIFqkc2E1iGchRa7h2T7BfeI74AQKtNrASag+N0OZ1sCf?=
 =?us-ascii?Q?4Y1oTReNOyeQu02BfzIfa2U99mbIzzPEfROqtDx8rCcO8F057JsQ/0ZKeN6L?=
 =?us-ascii?Q?C02WcQBYZNCBIXiqou02m7Gue74sxG404zx7HWXzfAP2X8QRCVql2I+ZnFhI?=
 =?us-ascii?Q?3m6l0lB6VqcAL8CmsuVxScY9+865BtT4X3mO6kM7jjCUqUqnSwVXa2Nb1+mp?=
 =?us-ascii?Q?+ZNQvdxrTrc96lK5PYRG6atCRra/iVVQ/Ont1zb7e2Ygq50ePTUemakPqiwN?=
 =?us-ascii?Q?MFTBPzuHUFPewrMY58N+N9ZyS2XkvrLCFsS3uhuTjBEu9ReL1LQL25/Kvp5Z?=
 =?us-ascii?Q?RakYyDtB3uarpt3lV3inr3q5UKhAjP2l2yNmV7bSrDgA43ObiO079UDWi7gd?=
 =?us-ascii?Q?/jOeHxI5+4PAq59aMMLQmiBhxtQaz3VcWMGxFRmpXw22976rtC5CHQahqrsj?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?uxGioPYGLm39BLdXkWZ+E097MIIHvnjDdZ45J7VUErKU59TUCO0esuMlFNHl?=
 =?us-ascii?Q?y30jVuNhXpa407H4IETB/S7mfFrLy8knVH8cnNSVqSZXdI73StVqLUrBSNsf?=
 =?us-ascii?Q?Z8R5XviCzVAdkezWnV32aERLdhMO9v9z8ovK9sogfyGiwP4i5TMLLesnSOBm?=
 =?us-ascii?Q?VO8GxOGG2kRVAKT5wusiOB9SNDUkiCcj1aHI4Uvx1IVMz5hvo6zZNqk+VOnn?=
 =?us-ascii?Q?/U7sLAHNjTpcFhhe0W8bcSNip273+Bz1rSSy6cgD7CqDVPgpjJ2d9bDBV4xM?=
 =?us-ascii?Q?z1XI67ei7tBdgPBZHogHmze9k/veb8au6xzAWpN0XcUU7500mfjTqQffsmg5?=
 =?us-ascii?Q?nh9L7IyXdmnjz5v+iQade0GWVA+uT200QvXfG5UOCsbjSxdQI/RLMxTnLMDn?=
 =?us-ascii?Q?5KVAlQrVRjubn5w9K3NV3M5KuvuXwSuijc7Lx1csbwwo7fc9TQzqq1KZ95dU?=
 =?us-ascii?Q?0cE4XzZnrHs7PH+hnVpJ5lASBjx9AGmWVS+3yFxc3n28Z8uq8a4x1KdnGLhb?=
 =?us-ascii?Q?Bps3Ef8i6OELgYzZeUCBBCbH8ejQhBcI+kxxZYtKTmHy6S6X2hSMV9nj+gIC?=
 =?us-ascii?Q?hG8S7XvCSUUjGpmdIrFwbkUf+ifiJPphdi74lsqFrSmygx/OhTFd8ZLurzHv?=
 =?us-ascii?Q?cLWbmCwLBaBMEzOSyxpnq6jBRiTea8/oYKMj52Aw6Fjov6fn62tFHAf6a5Y4?=
 =?us-ascii?Q?TAfUvlNluCzB9/9IJ8l7j6LG2cmysY7vnPCGC75l23z/UKFDn60Ccj/BGQ9l?=
 =?us-ascii?Q?1ek+968TGK/n0Ffl56ZjnzWpTLl+jk0bbXQjE4TR1W3tzyY4qj0JBGMtzUSM?=
 =?us-ascii?Q?AMiGPLaeZqJaVLccQmGCwv5K8w4L2Hn6ThatVYIHoh3esKnv+8MsPLRnM/ip?=
 =?us-ascii?Q?7pfH+6lqtCiNJBJeY8iCAtZZP/T3JIuaZbcjJeNDjKCbURWPvJq2JU6rlvyB?=
 =?us-ascii?Q?aVriSqBBgiaBb52zr0kv/skird0586zhVtPXyJITZsC/6RyxA83rQwz0SyUq?=
 =?us-ascii?Q?vwMLRkKv9KG64GhmOnUPgUlKxFeiwj7PkXz06/MR4wZ3kHJ0LP6fe0cQhOQ4?=
 =?us-ascii?Q?Z09S1WIq?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfe063a-b96e-48d9-60e4-08db73685d13
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 21:33:48.0316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xfm0vBzrT9PRdIfx6t0D0Zsj/N48sM5CP1gMMo7KcCknZqtfk8JNqlwMuFtbf7f/64ZxKF+KNZCEXqJAByYVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6332
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_16,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220184
X-Proofpoint-GUID: EFqtiEk1YpvCCC19j4nMgQakdysKfQo8
X-Proofpoint-ORIG-GUID: EFqtiEk1YpvCCC19j4nMgQakdysKfQo8
X-Mailman-Approved-At: Fri, 23 Jun 2023 07:26:31 +0000
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Muchun Song <muchun.song@linux.dev>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--E/sAsGthSYCltNMH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 06/22/23 10:25, David Hildenbrand wrote:
> On 22.06.23 09:27, Vivek Kasireddy wrote:
> 
> There are *probably* more issues on the QEMU side when udmabuf is paired
> with things like MADV_DONTNEED/FALLOC_FL_PUNCH_HOLE used for virtio-balloon,
> virtio-mem, postcopy live migration, ... for example, in the vfio/vdpa case
> we make sure that we disallow most of these, because otherwise there can be
> an accidental "disconnect" between the pages mapped into the VM (guest view)
> and the pages mapped into the IOMMU (device view), for example, after a
> reboot.
> 

Yes, this "disconnect" is still possible.  Attached is a test program I
hacked up based on the udmabuf selftest.  You can see different content
in the memfd pages and udma pages.

FYI- I can verify this new udmabuf code is not accessing struct pages of
hugetlb tail pages, as this test program BUG'ed if hugetlb vmemmap
optimization was enabled in the old udmabuf.
-- 
Mike Kravetz

--E/sAsGthSYCltNMH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="udmabuf.c"

// SPDX-License-Identifier: GPL-2.0
#define _GNU_SOURCE
#define __EXPORTED_HEADERS__

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <malloc.h>
#include <sys/mman.h>

#include <sys/ioctl.h>
#include <sys/syscall.h>
#include <linux/memfd.h>
#include <linux/udmabuf.h>

#define TEST_PREFIX	"drivers/dma-buf/udmabuf"
#define NUM_PAGES       2

static int my_getpagesize(void)
{
	/* huge page size */
	return getpagesize() * 512;
}

#if 0
static int memfd_create(const char *name, unsigned int flags)
{
	return syscall(__NR_memfd_create, name, flags);
}
#endif

int main(int argc, char *argv[])
{
	struct udmabuf_create create;
	int devfd, memfd, buf, ret;
	off_t size;
	void *mem;
	int i;
	char foo;
	int mem_fd, udma_fd;
	void *addr1, *addr2;

	devfd = open("/dev/udmabuf", O_RDWR);
	if (devfd < 0) {
		printf("%s: [skip,no-udmabuf: Unable to access DMA buffer device file]\n",
		       TEST_PREFIX);
		exit(77);
	}

	mem_fd = memfd_create("udmabuf-test", MFD_HUGETLB | MFD_ALLOW_SEALING);
	if (mem_fd < 0) {
		printf("%s: [skip,no-memfd]\n", TEST_PREFIX);
		exit(77);
	}

	ret = fcntl(mem_fd, F_ADD_SEALS, F_SEAL_SHRINK);
	if (ret < 0) {
		printf("%s: [skip,fcntl-add-seals]\n", TEST_PREFIX);
		exit(77);
	}


	size = my_getpagesize() * NUM_PAGES;
	ret = ftruncate(mem_fd, size);

	if (ret == -1) {
		printf("%s: [FAIL,memfd-truncate]\n", TEST_PREFIX);
		exit(1);
	}

	/* touch all pages */
	addr1 = mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_SHARED, mem_fd, 0);
	if (addr1 == MAP_FAILED) {
		printf("%s: [FAIL,mmap]\n", TEST_PREFIX);
		exit(1);
	}

	for (i = 0; i < size / getpagesize(); i++) {
		*((char *)addr1 + (i * getpagesize())) = 'a';
	}

	memset(&create, 0, sizeof(create));

#if 0
	/* should fail (offset not page aligned) */
	create.memfd  = mem_fd;
	create.offset = getpagesize()/2;
	create.size   = getpagesize();
	buf = ioctl(devfd, UDMABUF_CREATE, &create);
	if (buf >= 0) {
		printf("%s: [FAIL,test-1]\n", TEST_PREFIX);
		exit(1);
	}

	/* should fail (size not multiple of page) */
	create.memfd  = mem_fd;
	create.offset = 0;
	create.size   = getpagesize()/2;
	buf = ioctl(devfd, UDMABUF_CREATE, &create);
	if (buf >= 0) {
		printf("%s: [FAIL,test-2]\n", TEST_PREFIX);
		exit(1);
	}

	/* should fail (not memfd) */
	create.memfd  = 0; /* stdin */
	create.offset = 0;
	create.size   = size;
	buf = ioctl(devfd, UDMABUF_CREATE, &create);
	if (buf >= 0) {
		printf("%s: [FAIL,test-3]\n", TEST_PREFIX);
		exit(1);
	}
#endif

	/* should work */
	create.memfd  = mem_fd;
	create.offset = getpagesize() * 256;
	create.size   = getpagesize() * 4;
	udma_fd = ioctl(devfd, UDMABUF_CREATE, &create);
	if (udma_fd < 0) {
		perror("UDMABUF_CREATE");
		printf("%s: [FAIL,test-4]\n", TEST_PREFIX);
		exit(1);
	}

	printf("before hole punch\n");
	(void)getchar();
	ret = fallocate(mem_fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
		0, my_getpagesize());
	if (ret)
		perror("fallocate punch hole");
	printf("after hole punch\n");
	(void)getchar();

	for (i = 0; i < size / getpagesize(); i++) {
		*((char *)addr1 + (i * getpagesize())) = 'b';
	}

	printf("after touch again\n");
	(void)getchar();

	/* touch all pages */
	addr2 = mmap(NULL, getpagesize() * 4, PROT_READ|PROT_WRITE, MAP_SHARED, udma_fd, 0);
	if (addr2 == MAP_FAILED) {
		perror("mmap");
		printf("%s: udma_fd mmap fail\n", TEST_PREFIX);
		exit(1);
	}

	for (i = 0; i < 4; i++) {
		foo = *((char *)addr2 + (i * getpagesize()));
		printf("udmabuf %c\n", foo);
	}

	for (i = 256; i < 260; i++) {
		foo = *((char *)addr1 + (i * getpagesize()));
		printf("memfd %c\n", foo);
	}

	fprintf(stderr, "%s: ok\n", TEST_PREFIX);
	close(udma_fd);
	close(mem_fd);
	close(devfd);
	return 0;
}

--E/sAsGthSYCltNMH--
