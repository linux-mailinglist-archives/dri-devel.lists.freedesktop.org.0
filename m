Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1202F512F93
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 11:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBF510F7DE;
	Thu, 28 Apr 2022 09:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E91910F748
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 09:44:03 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S7qQ3d011396;
 Thu, 28 Apr 2022 09:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=wjk6xtXVDZnhazPdVTOrjOQxTWGr5UJaqZbOvaE4b/4=;
 b=NIu2W1HlE7X5wum89GcEa9b1cCsIJEGexd7dpm63m8L96VsIc4YzMvFfS9DsrruLQjzj
 ZhVkYODc5dX6Kikkqj4m+NZ4YTQea8o+4jEJHBq6qsTomjQci/jfrfnNVyiuEnGNhI2Q
 3KeZtq2ibcczdycQNyvYhCp0iuh9N+OKXimbL9HttL7zslmTCH1ugpdRvzurZKaFI0bj
 SuYGYPJZVj+XHP3lA766VG8eYzRUWCtpe4MFQzZlF6I0CqFrKwPTJX0vAI86pri35Uez
 f+mIqpi5wWHfeZSruKjHqHmfXlg/R3BWwMvo8n7OVI9ZJdjysyjl5U//LXYuh+13Q5Gv +A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmaw4kjqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 09:43:54 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23S9abQc036486; Thu, 28 Apr 2022 09:43:54 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5yndjpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 09:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxHxXZ3VUEoBR1DqA8ZySfPcJGKeQVQ9gd7xtiSs02dJRb5yckyCERWza4ogrmep3WQnK1/17BK3CRRmQvO1YUPW4j9PIKycD6uYxAdecyJ7NFUsOASAzCLC7yQSr0XZfcXACebz1JnVmVQHwkvzrC+hDdpwmcNGtGD3s7SC0sYRysgxGLO2tAtWr7x7jLj42IMHebrTBXQgoMbY+KCWYqvSCchpN1HTvBXMEY+yZxsb8CHvu5tyfsX8guGIcf8v8OgOaI5/yjB4GSXL7ns/TeaozKfeJuQlGuMR3+sA/Osn2B7nKyX1Nb4aaekR1kDNhh2tpCwVMvt1Ai6r0Xa0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjk6xtXVDZnhazPdVTOrjOQxTWGr5UJaqZbOvaE4b/4=;
 b=kGelkXkw16kciOrIGy5atboRrUyyoy3Y+cVolu75nI7E8ATAASBjfGe7PZ6NdPkcGOognYvuAZe0P0ofgCUVJF8ZbmJbqZYyKrXHvso++I+pdmL8DNVmlc19gASfSuw8A2a7OG6l+F9fNuc7E+qn8K+MQBilT9PrLZPWjn0d6Yzl7ZRuZZVvLHRVn7G7HnJZX9zseKSQetTxZwYrlq7/nsOevPINbIL+L5Kj/eP36Sm0tBkkY4SgjJfzWnTfnWogzqF1km/iYuN/TQRGktjN1G++64pgoP8HiXu8XIO5tl8wHK0cZt3xhUXgsUh5gUEOTAUBm/HPZI2P1hhAkA+AGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjk6xtXVDZnhazPdVTOrjOQxTWGr5UJaqZbOvaE4b/4=;
 b=CuQ2mKk9antk/MdOJIhrNyeD0K4AP0rhpcbeV3EC6crkX4kOH+wcygl5NpsdQZm6iqBJcZVs9GzX0a3Hg/pG6mHK8aTsjbejAKRVzea6FGquBDRJH8b7nYn04MDTS3SdJCz0f1/feFroboqU7v3ABE1bDJK0XOrz0ApIjPsB/68=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 09:43:51 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 28 Apr 2022
 09:43:51 +0000
Date: Thu, 28 Apr 2022 12:43:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Thomas Zimmermann <tzimmermann@suse.de>,
 javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH v3 1/5] fbdev: Put mmap for deferred I/O into drivers
Message-ID: <202204280832.sGHcYdgQ-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426120359.17437-2-tzimmermann@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0115.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::31) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5845df57-7e03-4bdf-324f-08da28fb99f9
X-MS-TrafficTypeDiagnostic: DM6PR10MB3099:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3099ADD65DB6A1258C59B8AF8EFD9@DM6PR10MB3099.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCICdm+G9G9U9HpYj+WMk/9mlUEcKEB1s5N66b84x0cO0sw909CsiPrvE6iSautsB/OBMPtT/pgmYdYbcGWKSC301j0JmgDzbrcg1YFyXwDCmvNihutuAvpXwB+wbxZ6I2NVm0VbCmSOLALok46B+hwB8df/mUV71JhUYeVidFW7Bq3vMnfm5nN7oaU3t+NZO1mo+cfDmc7Zfq9QZ9MynvZTeI3grdDgvNF2a9JqI37JiGP4J98WYmo9O6NclJdGh3/A0y8qpl5Djs5r34VHlFIY6SE8Wqjc+EfnxC0KAkUJgTV8KHe8wljZq+PWG/ri7rvya4zeYo1JWKJYl8ZQKbqr7p+b7Ix/3Th7l/KIzC9Uit+dazbpL96ClmpLIlRR6EYi5KUj/InNUz2hxVU/dcJETwZezOkOKkBocZGuhBo539/R1zs4X7vBbkRbFiNBc02WXlAStBg7Rwj7L9oCzpodupHu4AS4hyypdnIzcpqifodDzFZ5E4yG0NKZcE9ew6wXhrAsa0s4G8pLqUD39z0E8+fTtSfDISjhWy4B87RRElCDIXOZG/qX4iMn2Bbb4WIGSCfvTb9uPTMqXWtSbmyyzC5Bm/XkvjulVywyV2p4oC9XY6/D23ZEWagLR23iIuMOeCtSD3tS68ox837Uo64sRKMjQRWWl2w06PCM6EjpWw6URVpB4X0CVcTE5tVdjrkiAMRd34odIn1crxhan1mGlLwZDE/yHmeJW7eC4q2EoBeGUzIpH7pOwEmMqImrEKPoYbpu6iItsMUT6C9IT8uyS4Opd05g2oxqLSZjjAp2Wfg6msExP1VDqzf2wdgRkmYy5AEVjF++jZpilrIdUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(4001150100001)(6506007)(1076003)(186003)(36756003)(6666004)(2906002)(6512007)(5660300002)(7416002)(9686003)(44832011)(26005)(66556008)(66476007)(8936002)(8676002)(508600001)(66946007)(83380400001)(38350700002)(38100700002)(316002)(52116002)(86362001)(6486002)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KAtdEMKdx3z1ljfQt46UCgV9cQg9mDMTQ2eu0cXZgpl5nn8ySjojmGNXOx8A?=
 =?us-ascii?Q?xcuTN4XdteFEFDZedjLGW/3NojOqTTvqHso2hPb6vi5cEcmQilISV3PwWrR0?=
 =?us-ascii?Q?gDRcqMnqR9y+H/dGMD4/CcWqixkuWBLPYyMgeFTGCvS76YPVCP1WV91TpEFW?=
 =?us-ascii?Q?G+RnPSl/m9i4dIk2ajPj0XDquYDMCAWGeiUDaHv5xiqtsUpuuz5Pb7dZUQ29?=
 =?us-ascii?Q?jBdob7qFxqo5JJ+bd0orIOLeCj7kABgRoasgT2JxEQahH4WkiSKrHdnOZT9Z?=
 =?us-ascii?Q?+rj4w8nBMsvPymUGsJCQuDnqx6ye+URpczOxSmk5aV4blO90EynAYFksR2Tc?=
 =?us-ascii?Q?WiQI6T0pW+HuXEYNv8l0mIZmxEyo8hkGPbxf1iCUn8aYSuJoVoVB3dYHMvP8?=
 =?us-ascii?Q?EW7jMT3iHa/tUWCGOrfrhKB0uaFS4IxJ2fN+aqLuuq4717WFlvGWkMWNxgVP?=
 =?us-ascii?Q?AgmLL8HuihaRrTqRsNjVdZYmQanvDKON9r3+hV/xdr36yMYPkS6r/bF2yEBT?=
 =?us-ascii?Q?+ir5dgnSuL7KfEHCAPJJSinWplO/gfvBF51efjX75axJFPYtBAspaSSAtBh9?=
 =?us-ascii?Q?6Lj4I+y1Qh8tvYaW5Mopmv/lEn+gs1mxXcREsobVWzs4bJG4dGiFtzII5UyG?=
 =?us-ascii?Q?xj86LrWxRbFi4SkUbZo072NNYXIUgp+cSPuGdC6Nreyij7hw6OLIlZ1kVve1?=
 =?us-ascii?Q?G+T95ru6zoyxxh1aTTK9nFasmWmEBqQl83tL7pgs0BKgZFsGBmCvpBnYGNma?=
 =?us-ascii?Q?5ANtjQg5+0ZxzwPo+kcqx8Q0TMYBYijNWGW/IPUmj+eU0NU5yibxIrLHucgd?=
 =?us-ascii?Q?Mch4oNbTOIGFYdNrDGljW61G4u8FKtZbt2H5cqxtSGpc+zkmzI/MMQG8c9UF?=
 =?us-ascii?Q?LQAgfgI5uweSUS7jqwKHXX8asTOwWtezSwXjXCWkB6Ulug0GW00vvqdu84TG?=
 =?us-ascii?Q?AstO0DtPxYGoyX8b51TGA/7FGThCfcazvPQSz7HsU4F6fHWcRdZrduxncbR/?=
 =?us-ascii?Q?t8E9aILuTFDlKO2RKaHqFv6+ycukaWF31upHS3PP4zOQmfeqfy9OPJOmeX8n?=
 =?us-ascii?Q?jVvHdG8uJehmNLCbaqrqvKd2V1wNwOw5DHIv4kJ+wcicfwIlhMz4sGPDKUq0?=
 =?us-ascii?Q?IU/2QWvwh9aU3pqbrCeVD0vrknHd4c1cNgkpeMN2l0pNh2YWzt911f3VKjCC?=
 =?us-ascii?Q?mHkpaRQHGszxsD3H1KeDxcRoIJoaKQOJF+orxDAqgpYSfZeGsWEVkOQgArj3?=
 =?us-ascii?Q?dLdunhJBptJ6WqBIJ7pyahngp98JRplX8fXWvfzKt/BCrEXDoAp3ZV5sshbH?=
 =?us-ascii?Q?AkdO4Sa/GKdiCdJjW8ChrXpz/i8edKMyY6Cu5+UZqaOmTfQ5alm/RptHY+Qa?=
 =?us-ascii?Q?4vwRGYbkWz3afEuYwdUsCNE1E94Op5CyeRq67DtVZm40o0zZn6vWZ91mraV5?=
 =?us-ascii?Q?zdCxjpbpamEbmkHqx2T/yMmcxV7Saj4c6oyV0zdT9cjO8M3WNhvrn5sqOaCU?=
 =?us-ascii?Q?beV9rkDucJOINk+T42EvEmR/f1JpGcKg0oi1nP0ObcIeRjN+gad3v8yWTePG?=
 =?us-ascii?Q?18t/ilhviyFLMzSPYTh30aUq98qYBP7JHqNf0q6QDZtx8RDMrYpP2eKraDod?=
 =?us-ascii?Q?sV1sSD5rl37FlMd3OuqVVOVD7UZfYGmtGTI+22v2bh6txC7mkGgoZVLt7S4T?=
 =?us-ascii?Q?Rq72EzcwVfInsuuKiD0dT2tzEM0DcxLOZUBfTpMLVIJpB4DJhy0AKl758+h1?=
 =?us-ascii?Q?YWcXrwuwodpyDySMEPEzjxQqUDURinQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5845df57-7e03-4bdf-324f-08da28fb99f9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 09:43:51.5400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMAI4p9vj7GQ8c/xw8K7F0az3zM1o0Wurynxo+K/rAW7INnhDrKH3wDHKrODskBXAt2x/qoNzWTTl+s10F6TvmGouoy/SPvl6CsHJ5sFof4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3099
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-28_01:2022-04-27,
 2022-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204280058
X-Proofpoint-GUID: iDRN_xsSPs13n-RPeHogdsYTl8qXzaPT
X-Proofpoint-ORIG-GUID: iDRN_xsSPs13n-RPeHogdsYTl8qXzaPT
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 kbuild-all@lists.01.org, lkp@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Decouple-deferred-I-O-from-struct-page/20220426-200655
base:   0e7deff6446a4ba2c75f499a0bfa80cd6a15c129
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220428/202204280832.sGHcYdgQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/video/fbdev/core/fbmem.c:1389 fb_mmap() warn: inconsistent returns '&info->mm_lock'.

Old smatch warnings:
drivers/video/fbdev/core/fbmem.c:1660 do_register_framebuffer() error: buffer overflow 'registered_fb' 32 <= 32 (assuming for loop doesn't break)

vim +1389 drivers/video/fbdev/core/fbmem.c

^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1333  static int
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1334  fb_mmap(struct file *file, struct vm_area_struct * vma)
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1335  {
c47747fde931c0 drivers/video/fbmem.c            Linus Torvalds    2011-05-11  1336  	struct fb_info *info = file_fb_info(file);
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1337  	unsigned long mmio_pgoff;
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1338  	unsigned long start;
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1339  	u32 len;
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1340  
c47747fde931c0 drivers/video/fbmem.c            Linus Torvalds    2011-05-11  1341  	if (!info)
c47747fde931c0 drivers/video/fbmem.c            Linus Torvalds    2011-05-11  1342  		return -ENODEV;
537a1bf059fa31 drivers/video/fbmem.c            Krzysztof Helt    2009-06-30  1343  	mutex_lock(&info->mm_lock);
12281c8dda5a3b drivers/video/fbdev/core/fbmem.c Jani Nikula       2019-11-29  1344  
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-26  1345  	if (info->fbops->fb_mmap) {
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1346  		int res;
95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-17  1347  
95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-17  1348  		/*
95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-17  1349  		 * The framebuffer needs to be accessed decrypted, be sure
95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-17  1350  		 * SME protection is removed ahead of the call
95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-17  1351  		 */
95cf9264d5f36c drivers/video/fbdev/core/fbmem.c Tom Lendacky      2017-07-17  1352  		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-26  1353  		res = info->fbops->fb_mmap(info, vma);
537a1bf059fa31 drivers/video/fbmem.c            Krzysztof Helt    2009-06-30  1354  		mutex_unlock(&info->mm_lock);
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1355  		return res;
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-26  1356  #if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-26  1357  	} else if (info->fbdefio) {
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-26  1358  		/*
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-26  1359  		 * FB deferred I/O wants you to handle mmap in your drivers. At a
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-26  1360  		 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-26  1361  		 */
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-26  1362  		dev_warn_once(info->dev, "fbdev mmap not set up for deferred I/O.\n");
8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-26  1363  		return -ENODEV;

mutex_unlock(&info->mm_lock); before the return.

8a9ea404b61faa drivers/video/fbdev/core/fbmem.c Thomas Zimmermann 2022-04-26  1364  #endif
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1365  	}
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1366  
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1367  	/*
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1368  	 * Ugh. This can be either the frame buffer mapping, or
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1369  	 * if pgoff points past it, the mmio mapping.
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1370  	 */
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1371  	start = info->fix.smem_start;
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1372  	len = info->fix.smem_len;
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1373  	mmio_pgoff = PAGE_ALIGN((start & ~PAGE_MASK) + len) >> PAGE_SHIFT;
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1374  	if (vma->vm_pgoff >= mmio_pgoff) {
138f296e140f79 drivers/video/fbmem.c            Tomi Valkeinen    2013-04-24  1375  		if (info->var.accel_flags) {
138f296e140f79 drivers/video/fbmem.c            Tomi Valkeinen    2013-04-24  1376  			mutex_unlock(&info->mm_lock);
138f296e140f79 drivers/video/fbmem.c            Tomi Valkeinen    2013-04-24  1377  			return -EINVAL;
138f296e140f79 drivers/video/fbmem.c            Tomi Valkeinen    2013-04-24  1378  		}
138f296e140f79 drivers/video/fbmem.c            Tomi Valkeinen    2013-04-24  1379  
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1380  		vma->vm_pgoff -= mmio_pgoff;
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1381  		start = info->fix.mmio_start;
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1382  		len = info->fix.mmio_len;
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1383  	}
537a1bf059fa31 drivers/video/fbmem.c            Krzysztof Helt    2009-06-30  1384  	mutex_unlock(&info->mm_lock);
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1385  
c07fbfd17e614a drivers/video/fbmem.c            Daniel De Graaf   2010-08-10  1386  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1387  	fb_pgprotect(file, vma, start);
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19  1388  
fc9bbca8f650e5 drivers/video/fbmem.c            Linus Torvalds    2013-04-19 @1389  	return vm_iomap_memory(vma, start, len);
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds    2005-04-16  1390  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

