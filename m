Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB1352346A
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 15:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E33310FB1C;
	Wed, 11 May 2022 13:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6482B10FB1C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 13:38:13 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BBTxQ0024470;
 Wed, 11 May 2022 13:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=QxQDTk7eBM7qF47Xu5cao3NSsEgLlyc6+3F6dvkaHAo=;
 b=XJxNYF3ygj2sGyzkORmb4fUa58Iyh5EEKUCVT5EYLgq3EuB5SkEPTOqFtx7tnMWx3GsZ
 iv+h2lhiV2Bto7yXQ9oCaLLJjSPbfXhKhR0r+jNArMH2gVOj8g1YRcDluSufIsMlbI5R
 +I7dyaLAJEje5hrY//McL1TQ0sR2q98VxXT6k7AkGlUGufK1p1m1eXbs7Lu5+hOFBea0
 xlZEqpJSngs0DuhdjnHWIlgnqj825E8ckIXns2yWnD6X45I1JeG2Yq0A1fjtcbMdmdUF
 P/9gKR6VarfruG0B5M0GCov7FhFsHIq5WMENClVx/XvcGCTECD2UEhpwNnYf2RYI1v+S TQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwfc0sscd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 13:38:10 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24BDQbBC006128; Wed, 11 May 2022 13:38:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fwf743wc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 13:38:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG8jcs8Ur2xX2aJT5GKbzuNvMuXPzcXvUiWM8r2Ro2yY2K5YWAzozwhh7+YKqCi1NXEj9ICP7zV996GiiX0EXJccgD5aoGmBak4WdW0vduf/eEcw+rIM2P+7LZoinYb5qJKEsdEUA60enssE66onz/kNsQ3V/Li1oiPVjJ13PNzZs6LstcRUPF986f65yarVkLKHBGe/M3LGdR8u2NWcBGQNp38gW2uZjLgQ/WJHAjoN0r3iK0RqzMeKLtHJe3Q+pCoiAafC6GSa+QkqUIs/T+uB78K6lkVZtI/2c26y35Fm5KQtcEFVUdwOnOG2XNFLmalyuBfagZGfF+5n+9k9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxQDTk7eBM7qF47Xu5cao3NSsEgLlyc6+3F6dvkaHAo=;
 b=B1tA0+me4zWpNOWdFWm33QWyyQWBwZAnAfNL/u0eEGXgJHFuQbtMgpaYFIjMXjIHWfUZS/NLrLZxx4FzQ0dj9NW4ry4qRRQtshODz3fP6gBoFgbyz8XsFe9bKYeeO5D79bfYnfEu/bbiFgoMozzGujsPMPGtZyMRadR4oEcta0RuMlNsq5efg2wk+6H6W2GLRJGJM7Coe+V+2tKmR5bBKN2oL2iuUYL1sQzX96xwW/ir0a2517nT1M6FV+1/oN4g0aAIM31DztqqUlA17nkPjc+1pqZytkB8x96NyKaKkQfcyjsoz/fA5tWziou0qlhRl7MK/5hp5Z/7yLU+Q/2rYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxQDTk7eBM7qF47Xu5cao3NSsEgLlyc6+3F6dvkaHAo=;
 b=CJw48HRU9506Ri9WBE+S74mvnwUKjeKjX+DZ1mavhcN0IJ/sklEkeurNRgL8mPKb3lGlFuM6FSyKbE7oKyi32GWF4lBuDCuxetqQor/OfK0rm8IXhNjy5Ion7UCnYkzl8B49Vqm1iuvjLqap/ShT8WIL2RsvzebKPzRAtiQjkAs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3019.namprd10.prod.outlook.com
 (2603:10b6:5:6f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 13:38:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 13:38:05 +0000
Date: Wed, 11 May 2022 16:37:47 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Dongwon Kim <dongwon.kim@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/virtio: use the fence for every plane update
Message-ID: <202205112132.FqtvzLWA-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511000623.12938-3-dongwon.kim@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0043.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::31)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b689e95e-db48-4468-090e-08da33537a32
X-MS-TrafficTypeDiagnostic: DM6PR10MB3019:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3019793411BBA6175EA23D3F8EC89@DM6PR10MB3019.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KeX1LgxRO+ufmCphH0qfkt+Xlic5kk2utmk0GA1L6Ui4TalcRM8JSd3cZVuhUWQAIXMiBGtQJVG1A99lCwJQTazgMEFZzQEd0stgthvF+C5avUzLephOvm/ENGxtX0lfmEc49iK+clekMNiwUr2S5W5Gn4pQJ+tnaMvsCm/hp2dHtcgG5Kc1oxqu1vb1XWxzxu3YYJnapRxp3HSLzoHUjTNxTh17dnDaPl3G/n6aJd1DgOVrfFj6iMqKS9q+GE4fwF2Lx+gmHo5v7q8yzSstJ1s8Xw10PGLM9X+IV0PX1fKzohJH5nzZ3s2/FIsmHW5miZruU4ZTbGOML2vKoQQS+fJ14HhNXE8UX3Ea8Gvb88EZsLzqVlO4IWLYYK3NCbdPtaFyns/a9zbDqb5JaQA5hqM2WsQN1RqGb7PQ+C0Gvu/7AQflJMdu+gInHo/rvFD9dT8yXc3/f5YwYOoRfX5waLw6++WWDpJwTLxTXw7ffKt5vKh8+D0uHyaZfbQpWlzOZjV2iCTdDnioRZ+j6ksLlX/Otdhz1IxwG6ja8v0qbGTD8i8uNs+ppG+3mPANQtae3NWQ3mKZle+KQSH+hIjEOzA1l5JXFa5h/wC1xijY4BBEbMU8HBOVAuONewUkRPMEYgIv4LNP1TYPBZ8WDXWCjc9qOufBrQUJRqU7IWXRVWGxZLottPy1p6E+14ogb9FjtItxgYCu8rl5wUjRaRJcSW6yRt3bRd6S38czMmWIi1+0KPk9PtsKL5+0K67Zd7EeqmCRY5xaPERCDipyQrq2wz2xV4lbgaP40ytq8WE3lavdGGHgJHyaxL8ltHMLVFv4NRUMiSVH5LRoDBnHvesgog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(8676002)(66946007)(66556008)(6666004)(4326008)(186003)(52116002)(6506007)(83380400001)(38100700002)(44832011)(38350700002)(8936002)(5660300002)(508600001)(6486002)(2906002)(86362001)(966005)(1076003)(54906003)(316002)(9686003)(26005)(6512007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7tJjQ5aA1agwWA2kvbWr2s29u+0b058P1EtnKI8dXq+kUuSXql5cwurKHMY5?=
 =?us-ascii?Q?aVw2MK7lV11lbgZAp1Zzv46D5m7CzfVvu/cI1cIWukg1I7dy/nrGknFQe/+j?=
 =?us-ascii?Q?6Fky0fGHRYcRwYe0KQhM02adeH+cPcPoWJgSv7XeRWs206a5UbMf0alHzW6g?=
 =?us-ascii?Q?nlGVUE2hu7aOsbOG7eJ4R2oviXbKMZvETGT8EbW0YE+qwGeDh5RmCNuvy5w6?=
 =?us-ascii?Q?W4NBmJJ9N+LKaY1pD+Er9W5lgh1By/Rri6jwnhaC9aK/NFDLXyQRL8XJtIAK?=
 =?us-ascii?Q?ztkn9CBUk5RAnh3BVofzsiY/2fUQERlE6pFAZ8QkQHcJ3GGFfAymCuzNNSwy?=
 =?us-ascii?Q?7Vn+GNwUdY74KZe0NsDxTAhT2op6rTAbJqrLBkMDaP6Pkn9RhDy+lQNIUjD6?=
 =?us-ascii?Q?12cOxnACIdJmaKp6vu/8jbrOMy/jgmI7JtRxvvZ2AbKV90i7omWcmHOsTbju?=
 =?us-ascii?Q?iFr/Ot+5A1ztfvQqRwQLwJ/unRYUKlaskUUF2tehRNfBl6kEIYW0H8Gi6vs6?=
 =?us-ascii?Q?K8J+AWNDE1IoJ5Jh2wMJi2PjXfspKSHke0GgwefDdgU+36A1gkOoTlqtjhu9?=
 =?us-ascii?Q?lOI+WsRAUFYP0ewgPoX6eCAJIPDNZHR1Z6Vhcn58j6QjUh0zg55crz4K38mW?=
 =?us-ascii?Q?jvL7K9RuAF9gHXivuTBOvpRusbD61BHBQxA75NtNoqpaBCBebi2E7sX7nVHZ?=
 =?us-ascii?Q?/60Ke4i1I5RUZrnC1BD5LQCZkntPsTotSyiHNJWKfEuKOGUjyUNJocAHcQdp?=
 =?us-ascii?Q?U4JcQBhLNIwcL+NR2EQ+A7I4iOTSshWL84eDpIzusS+eG/MGkZgUfn+VTcOI?=
 =?us-ascii?Q?LJbpwvOe14Tm5EEY1hO8pIUP0V5ejKjt32vq7/6tk+7nal7ZP3A/1CVIJiK8?=
 =?us-ascii?Q?r7cZO2TpSplLPh6u4PvAu/+O9yiSMw32Ftdjjiyrsjs/oWMoS+7clPHUq4BK?=
 =?us-ascii?Q?0jtc0g2WjSM1yJTRnr53Tt3fmTgqs9LLg4oCCBgsXOwhClMLHgOaaGKSBZID?=
 =?us-ascii?Q?P6FYt4YdKHI9V21a4gdBn7LSkDRWWGA+gZiCvA+WWihLHCk39LmZLLmfsxzK?=
 =?us-ascii?Q?o6cqpaD8HjtPfB7UWbm9ibH4Gs6KoPXjHvNHpaKje+3CKH/88tpEcUvilc2y?=
 =?us-ascii?Q?9635Oy0BtTP3T6hWpzNfTVRwofKhCA3w3H3MK8ay+DjOjF0X/XOf/d9tq6Xz?=
 =?us-ascii?Q?vrhTFN15YoKWFsJVIYV1OnMYxwpx+UjytVYJJ5Di08uLX0JSxaZXqn+607TZ?=
 =?us-ascii?Q?pVaz1wG7IN8dj7HrwQSveZHuv66ffsRt+OgUk09h/y9aw/n0FFnyWT1ZWCcz?=
 =?us-ascii?Q?bRIAyDG1dQVgM5sCg8XB9AeOAoH+zBvgUlE8pl5QCJi1BsQERrD21ir7CQRB?=
 =?us-ascii?Q?2eH1F8ade01eWi/Gjl7Uqs8pqFfo7o+sazgkzCo2i4kxvRN58KgNOsEJJhjm?=
 =?us-ascii?Q?hZn94A/9w9O7bQ6XbiCvQsIvXFNcnPcnE5lBm/HsrcqgetqhVplB7N5ye59T?=
 =?us-ascii?Q?in4gq0fb3ZOEw86mbH4w3aqxTmwOK7CSlAOiq3NKELzZL9sTYUTwrf4SX7pn?=
 =?us-ascii?Q?JPb+MRGk/ZzQpmmu0+AqNDfdCf8b/mcptlXi8imm5rP5vSCH9/jsJxS3T7+J?=
 =?us-ascii?Q?PJbGGJHDdGiBwYj0jaIEiKT02T7H5GJ1xg3mFvmrw320z2vLQG6tT/i2PKLI?=
 =?us-ascii?Q?31V7Yy+oFF6/miA1i70AS8vjESo7NIsAXqpiPjwxehpwBfqHCeYEyHNg2iwY?=
 =?us-ascii?Q?xyoDABEmJl+7L+bexEA0Nf1P4YdjGyE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b689e95e-db48-4468-090e-08da33537a32
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 13:38:05.7528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGsUtG0LU6nI+p4FxWWo1XsKczDTq8zpdF2fo7lfd74LYzqAck9vRkWoNP4Z/45oRd8tyl2QKD01wdrmYeY34bG/wb4hiLtzLWVI8I+R2Ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3019
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-11_05:2022-05-11,
 2022-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110063
X-Proofpoint-ORIG-GUID: mTj_OkELrioXwMzoD45txqaHLObkwSQy
X-Proofpoint-GUID: mTj_OkELrioXwMzoD45txqaHLObkwSQy
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
Cc: kbuild-all@lists.01.org, Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, lkp@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dongwon,

url:    https://github.com/intel-lab-lkp/linux/commits/Dongwon-Kim/drm-virtio-release-ops-for-virtgpu-fence-release/20220511-081226
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: parisc-randconfig-m031-20220509 (https://download.01.org/0day-ci/archive/20220511/202205112132.FqtvzLWA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/virtio/virtgpu_plane.c:158 virtio_gpu_resource_flush() error: uninitialized symbol 'objs'.

vim +/objs +158 drivers/gpu/drm/virtio/virtgpu_plane.c

5c68ab9276aae4 Vivek Kasireddy 2021-06-10  132  static void virtio_gpu_resource_flush(struct drm_plane *plane,
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  133  				      uint32_t x, uint32_t y,
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  134  				      uint32_t width, uint32_t height)
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  135  {
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  136  	struct drm_device *dev = plane->dev;
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  137  	struct virtio_gpu_device *vgdev = dev->dev_private;
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  138  	struct virtio_gpu_framebuffer *vgfb;
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  139  	struct virtio_gpu_object *bo;
47558b189c1d34 Dongwon Kim     2022-05-10  140  	struct virtio_gpu_object_array *objs;
47558b189c1d34 Dongwon Kim     2022-05-10  141  	struct virtio_gpu_fence *fence;
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  142  
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  143  	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  144  	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
5c7787de5069b5 Dongwon Kim     2022-05-10  145  	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
47558b189c1d34 Dongwon Kim     2022-05-10  146  
47558b189c1d34 Dongwon Kim     2022-05-10  147  	if (fence) {
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  148  		objs = virtio_gpu_array_alloc(1);
47558b189c1d34 Dongwon Kim     2022-05-10  149  		if (!objs) {
47558b189c1d34 Dongwon Kim     2022-05-10  150  			kfree(fence);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  151  			return;
47558b189c1d34 Dongwon Kim     2022-05-10  152  		}
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  153  		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  154  		virtio_gpu_array_lock_resv(objs);
47558b189c1d34 Dongwon Kim     2022-05-10  155  	}

"objs" not set on else path

47558b189c1d34 Dongwon Kim     2022-05-10  156  
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  157  	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
47558b189c1d34 Dongwon Kim     2022-05-10 @158  				      width, height, objs, fence);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  159  	virtio_gpu_notify(vgdev);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  160  
47558b189c1d34 Dongwon Kim     2022-05-10  161  	if (fence) {
47558b189c1d34 Dongwon Kim     2022-05-10  162  		dma_fence_wait_timeout(&fence->f, true,
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  163  				       msecs_to_jiffies(50));
47558b189c1d34 Dongwon Kim     2022-05-10  164  		dma_fence_put(&fence->f);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  165  	}
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  166  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

