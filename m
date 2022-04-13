Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828A14FEF43
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 08:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0B7112290;
	Wed, 13 Apr 2022 06:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6005112290
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 06:08:05 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23D0V14h028018; 
 Wed, 13 Apr 2022 06:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=w+DI7uEwEGc2bLXgswB/AKGIvX+bf8l6AhbKH6m2jIc=;
 b=Hv+VkLD5kB+T6r3qLgp62u3yNST2eXXQHCcDT8fty2hJbKgMMvBc2HSb9jz4CFEcf/bJ
 OjVhhLQ26tba0ALrvGghFlsoJDPouRR5e5/sn8FEWX/s4ZOQDtzRUSP7D+c88bPOc07U
 hD2x3dsQnQdMEN+2Ak2Qex6E39pOc3psBL2RrB65nxDK5DxvV9tjslS1oCcXioARAF0i
 fw/aVMkh1mAeTM3L3O4/1EoMrlEDyC3HmBC01odwY2HudN+zOdUGN8NKMF2aTwayu5xt
 e1Y0iu6dkUyPxNHoEHqbSyBpmLJGVMhreOT9TnTc+B9u+3G4Mzsvul9ZTnFJkRy3sJHU OQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb21a0j4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Apr 2022 06:07:53 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23D5vZqd026317; Wed, 13 Apr 2022 06:07:51 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2044.outbound.protection.outlook.com [104.47.73.44])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fb0k3nbbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Apr 2022 06:07:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsO9LxjwxOfEIKfJ87JMNaWKHEunM6yJdRDrVp3amMsj8BaANXBOAeRDa70hcvN+Gor0BNn+3LK0XrtfIIcaRzSZYqRWOagbLT6UR0dBkuKVYK5zO0p560/HAN1OQGHj9gZwYCXfzCjTl+PnFZwOKVY8hY+6/yUDXttoRGpOzYNdle1l1vq+6+5pv+wusW+E5ZXfs0fGnXTmGIzEU9VBGywb+e3lRrNL7DRvz+CsTTZDix7RuLoMVlYwZYCZrtFKebEmuVvuqhsbwgChGUEf2u3zht2IF2WEVqwWTGdTy+i8X/p0Lp71eHiSbXgo53Vdm9GxJ6A2evMmL/tvSmTtvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+DI7uEwEGc2bLXgswB/AKGIvX+bf8l6AhbKH6m2jIc=;
 b=byYUNyuQvz5+gFCIdneg7YWKIElJwz9Yi4pwK+DimLsfK34EbszVx/IZ8ppEupRkbx6cXYRdAnClPneZof8OHJpdQ+SkbgFEV2FER0hpFs+h6AUInEgICusP5A7QMzQKs5qgFmM3fNW+HTR6wHQBtbTlub0rwvWUegM3p0ICfFd14Eals3bQuMvG0kkAsZwMFDvbPWTDwi3ley+eDtuEgZ9FS0tREAr8aH87kx+QZqgKTYRS5JsTL/Jyob4kYpnahTuxHcAfP8U6XIzLj7DmWupbqnRSX3Z/g5LeOzQ4QC1PsQkJt0QC5kOTrfNGc7sRid+bLDpux57slAH0WXR3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+DI7uEwEGc2bLXgswB/AKGIvX+bf8l6AhbKH6m2jIc=;
 b=i+/7UUrQ2qFoqPcCnKNFdwPC7xNKqq0FkEY7j6Rc/FMsxKlhrVmKbfqIuau/0HoPxvyqV6q77BuGdRfEkfm4P6DnmfN5nEiacYV8HKqwTC/YX3Zf+JnvOpHg41+akPTD8xHYSSvMmfyppq+ZQsctu4o1p6Fo/X3eOSuClb9/G1s=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1307.namprd10.prod.outlook.com
 (2603:10b6:3:e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 06:07:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Wed, 13 Apr 2022
 06:07:49 +0000
Date: Wed, 13 Apr 2022 09:07:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v18 03/10] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
Message-ID: <202204130935.urqkcDrG-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412103114.19922-4-jason-jh.lin@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::30)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 376242b4-f78a-4bd2-86f1-08da1d13ef3d
X-MS-TrafficTypeDiagnostic: DM5PR10MB1307:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB13076DF6E0AC673A721C9E0A8EEC9@DM5PR10MB1307.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IN2T12573WtA5xcZyrFvd+aN813XP5Tf5BpxV82rn2ADCYMlWaeuG+N12EX+HbD1r4kpirMNcFU+ZdgxXbERb/+fUArEAvfdCo45MJZkqKvwvvOPrlEArtLNIhZRNNdXXmnKQk3WDAJgwVhjSv7cKgt04s57z1vuVhkkUgdItbn8APp3h2EjL0T5RcCXvUO0bGDoVHxfDzPLkOopEeZZxCDD923wNzDUSi2tOL2CMrtWTiMVkdbGvyHujBLzuJ8otCorMBYekAd3mFJh0X0bwxGDVef9bZ+zVu4xaAhfg17XspIqZKpOiGoLZwkwM114XA5vsOLOhj6ycG+ywpQYAiuPj0UnXDlfnK90Wq5ivWUd/DuJz3kScU48vyT1EyOjVhFk5Qddxvxo/kJDt7EBVuRbfh82KKMMgL2MCFXuGHlrDWg2cJhK2o9jEXCZFSjYQSpW9NZK/tRZ9zXYDa7iYqDFoBAkgarl4qY3zfdSVadT/f3YJSKWS7QzhwIFGdpIQ5aBe//DQTLYghoaNuhu8MGbReaQoGadNKf5Vv/kdRTFLXH6aLBQ4aeGolqytdagSwgdRWdJFfeLn56nxpaZQTFLjRZiNeqSb2UwZ8Nx9KFkTDw6BExvGRF9RMtx4W//QKBTWDPXkgxl+8BtrTMqdnHl6Sec6+npbrGzqsCjYHRTAJWsv3ok3gqzQ9aYepuJq6Hoq23nq5XtNKeh78UD+AZdbRoGZah7kPY/yTVAt3jincgMoNBRA+H8F/Xht7AK+CSjI88xnWNdBpMHC2vMqVzc7AzkfTwISmWIKR6o898gmvuCgbz3ZHIyYcvNlURbaLA7im32MJjSAtLV7/rH4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(7416002)(966005)(36756003)(86362001)(6486002)(6506007)(9686003)(316002)(110136005)(508600001)(5660300002)(2906002)(4326008)(8676002)(66476007)(66556008)(66946007)(54906003)(26005)(44832011)(83380400001)(186003)(6512007)(6666004)(52116002)(1076003)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gy9LGP52TwLJsLxDU6Jptp2lTuUn9VaCb0ZZHDMnQCqEXv5dQoc3hvuXmEG7?=
 =?us-ascii?Q?1yfnt+2iEXnfI6Mwv45d7hd/KLcqsRiav59E3gBoeSKkYw6HR++WyImQ1g4Z?=
 =?us-ascii?Q?Cqr4bnIeSwbMrpMXjo/jU7a3e7BYOe29cs7MAsMOZ2bXeuTLinjpW7+bo1UG?=
 =?us-ascii?Q?vg3XvgJJtXnFQTwL7zUGxyGLDoAmKJ79oa1caGVgb37UCkCb0wIV9YYddA77?=
 =?us-ascii?Q?XFF8q7xFWzm6JHtBEy8pGG4ZIf6SoIpuKfr2h3THP+OV6y+GoE7p8Gh8Bnv/?=
 =?us-ascii?Q?QeUKSezgWAsjORm92YF+KAVHiW1opUZAKA+8A4/Jl7fQfi0z+/N3Fdr8cwb4?=
 =?us-ascii?Q?qWBjPKxTPHrJfIGfzWQnsw8FQX0WcjMKC9UQkARFXPfxMbQZZPYmXpaTeVwu?=
 =?us-ascii?Q?PQg9t8zNc+0F0su8NZWC2ai+MTW38N3taltGK3TDzvIDyL8GjWsGnlgIyLb8?=
 =?us-ascii?Q?VqIHHEBrCRy5bK/Z6SMipPKlAjeo24DxOjqT6FkgZLK13Tn/dtjkZo4ViFcl?=
 =?us-ascii?Q?lV3tPyUgXnfLSCllsV27qrJq7NRqzKREDwSy8lEx5RoTyX+GAkNyIiZkjzJT?=
 =?us-ascii?Q?CdRU8GxgXTXKkCMXUgNCZe22RpL7OYogWOY4eGV0aV9dZ8Hwxh+UFoWHYr4j?=
 =?us-ascii?Q?1LSQk+Jp/5d5vYRUvexEmWB/t/GCGE9dfQyCToUr0QgdoJCdxMBgpWh1dzKF?=
 =?us-ascii?Q?xRLU1Lm3zPDAEbL7r0osqDV5nwixti641wmj6OD/ioWVFRaOabhroNUhyXDO?=
 =?us-ascii?Q?CYnv4adozve1mblGW6VozBJ1sHa4Z0fJsVc5I+a0ntj9c5BsW2vLr5IQscUF?=
 =?us-ascii?Q?emS7kUQQ/UJlbS1frxYe5oU3rkXlhD9wj82BeeJP1Z+JwM/7usI6sIgv9x1b?=
 =?us-ascii?Q?Bu0abbjP/0kag5ejN+ftNMqykWk8tnVg/kM+e/9FP5kJdymduHYzSOIqVUKu?=
 =?us-ascii?Q?SZQvsl7zGIrk6b0Xebv2S4WCt2xEAoXqSRpAckXYElwm0LO6XAwtKqwQqeKV?=
 =?us-ascii?Q?8e6BXpAYjlmJexvjIt5BY0jkA2Xl5Bs2rb7jwJqx06wYML3UNiDI+Zolrdyt?=
 =?us-ascii?Q?rbIq4UmLxB9wOyuH5RhhojpHT9ZRJ7iEl9okbvY2cjJDJAFeGNJF9lYb+FoP?=
 =?us-ascii?Q?UnExeYlHsDKwlaPSUrQv7xzCBRaPtYOFLwldJLyrhBO3AhxLCo35sgpXcRPr?=
 =?us-ascii?Q?3wyKmbHt0rIPtjHq3vYkZ3cCwU4C3Rd2s1tUKI0IimDtFn8+58GtGhpWmzZ2?=
 =?us-ascii?Q?ACqe//z4C3koIAmIvp/r5K+pq01YMDxtu+/QM5gSAFC5IQqO5xZ53B1CSt+q?=
 =?us-ascii?Q?BsJWmBPD2P6Mkgfwm0QfaxtAC0X07OGia64C4op8SSQjpmbvF8KWObjWdja1?=
 =?us-ascii?Q?R9V4jHeJeN4zkJEoFlw/fdqS0utOEYxY04sU7CN+uiX685tKeeDpl7UH0Oxa?=
 =?us-ascii?Q?FBzH+2UuHVq9dv0jYNnlKCF+r3gu4ujbbQds8VCsw4Ko98EkqISgIQ28MWDm?=
 =?us-ascii?Q?rkhtY3T7JUaG7SlslBAosCTBllmwWUPs9jf52fOs2ogpf06y1b8+uDMExNOd?=
 =?us-ascii?Q?Rpjxo/OaBEDbFoq8GQ5UWedoEkYsgNrZE1coMBtjVYPbbdyVUrlqvs+hq7x/?=
 =?us-ascii?Q?dcskUdsH/xIX/uqTr/9ocTN/SwlT/4dvdb19gcpKug6AENyhRbDAQa+nblZq?=
 =?us-ascii?Q?0yj7CVC+40W6Jwd4GaOgHUrecqvUJn7XXZUXeMHCaqgpB/N0PK+Je5Mr6kOb?=
 =?us-ascii?Q?EfEDCxnfdgoWOxkbCSQt4biYqvi52u8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 376242b4-f78a-4bd2-86f1-08da1d13ef3d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 06:07:48.6248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQpEuGxpRiydap34OVVjWl5grjDW423JpFcZEbv+lG5cw1J/vjbnCZKKdOj0ShqbBHmJzCiYsAXBZAPqTBZMknZGlrXwmxHMQ2CpVraUkNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1307
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-12_06:2022-04-11,
 2022-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204130035
X-Proofpoint-GUID: Wp2xNDFvzh-2M8sqeH-A1pMzTIqNx68Q
X-Proofpoint-ORIG-GUID: Wp2xNDFvzh-2M8sqeH-A1pMzTIqNx68Q
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
Cc: devicetree@vger.kernel.org, moudy.ho@mediatek.com, kbuild-all@lists.01.org,
 lkp@intel.com, fshao@chromium.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 roy-cw.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, hsinyi@chromium.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "jason-jh.lin",

url:    https://github.com/intel-lab-lkp/linux/commits/jason-jh-lin/Add-Mediatek-Soc-DRM-vdosys0-support-for-mt8195/20220412-183359
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arc-randconfig-m031-20220411 (https://download.01.org/0day-ci/archive/20220413/202204130935.urqkcDrG-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/soc/mediatek/mtk-mmsys.c:315 mtk_mmsys_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +315 drivers/soc/mediatek/mtk-mmsys.c

13032709e23285 Matthias Brugger       2020-03-25  281  static int mtk_mmsys_probe(struct platform_device *pdev)
13032709e23285 Matthias Brugger       2020-03-25  282  {
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  283  	struct device *dev = &pdev->dev;
13032709e23285 Matthias Brugger       2020-03-25  284  	struct platform_device *clks;
667c769246b01c Enric Balletbo i Serra 2020-03-25  285  	struct platform_device *drm;
8cfc54a36d3e79 jason-jh.lin           2022-04-12  286  	const struct mtk_mmsys_match_data *match_data;
ce15e7faa2fc54 CK Hu                  2021-03-17  287  	struct mtk_mmsys *mmsys;
8cfc54a36d3e79 jason-jh.lin           2022-04-12  288  	struct resource *res;
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  289  	int ret;
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  290  
ce15e7faa2fc54 CK Hu                  2021-03-17  291  	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
ce15e7faa2fc54 CK Hu                  2021-03-17  292  	if (!mmsys)
ce15e7faa2fc54 CK Hu                  2021-03-17  293  		return -ENOMEM;
ce15e7faa2fc54 CK Hu                  2021-03-17  294  
ce15e7faa2fc54 CK Hu                  2021-03-17  295  	mmsys->regs = devm_platform_ioremap_resource(pdev, 0);
ce15e7faa2fc54 CK Hu                  2021-03-17  296  	if (IS_ERR(mmsys->regs)) {
ce15e7faa2fc54 CK Hu                  2021-03-17  297  		ret = PTR_ERR(mmsys->regs);
cc6576029aedc7 Enric Balletbo i Serra 2020-10-06  298  		dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  299  		return ret;
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  300  	}
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  301  
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  302  	spin_lock_init(&mmsys->lock);
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  303  
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  304  	mmsys->rcdev.owner = THIS_MODULE;
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  305  	mmsys->rcdev.nr_resets = 32;
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  306  	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  307  	mmsys->rcdev.of_node = pdev->dev.of_node;
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  308  	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  309  	if (ret) {
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  310  		dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  311  		return ret;
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  312  	}
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  313  
8cfc54a36d3e79 jason-jh.lin           2022-04-12  314  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
8cfc54a36d3e79 jason-jh.lin           2022-04-12 @315  	if (PTR_ERR(res)) {

You probably meant IS_ERR() instead of PTR_ERR().  But actually
platform_get_resource() does not return error pointers, it returns
NULL so the correct check is:

	if (!res) {

8cfc54a36d3e79 jason-jh.lin           2022-04-12  316  		dev_err(dev, "Couldn't get mmsys resource\n");
8cfc54a36d3e79 jason-jh.lin           2022-04-12  317  		return -EINVAL;
8cfc54a36d3e79 jason-jh.lin           2022-04-12  318  	}
8cfc54a36d3e79 jason-jh.lin           2022-04-12  319  	mmsys->io_start = res->start;
8cfc54a36d3e79 jason-jh.lin           2022-04-12  320  
8cfc54a36d3e79 jason-jh.lin           2022-04-12  321  	match_data = of_device_get_match_data(dev);
8cfc54a36d3e79 jason-jh.lin           2022-04-12  322  	if (match_data->num_drv_data > 1) {
8cfc54a36d3e79 jason-jh.lin           2022-04-12  323  		/* This SoC has multiple mmsys channels */
8cfc54a36d3e79 jason-jh.lin           2022-04-12  324  		ret = mtk_mmsys_find_match_drvdata(mmsys, match_data);
8cfc54a36d3e79 jason-jh.lin           2022-04-12  325  		if (ret < 0) {
8cfc54a36d3e79 jason-jh.lin           2022-04-12  326  			dev_err(dev, "Couldn't get match driver data\n");
8cfc54a36d3e79 jason-jh.lin           2022-04-12  327  			return ret;
8cfc54a36d3e79 jason-jh.lin           2022-04-12  328  		}
8cfc54a36d3e79 jason-jh.lin           2022-04-12  329  		mmsys->data = match_data->drv_data[ret];
8cfc54a36d3e79 jason-jh.lin           2022-04-12  330  	} else {
8cfc54a36d3e79 jason-jh.lin           2022-04-12  331  		dev_dbg(dev, "Using single mmsys channel\n");
8cfc54a36d3e79 jason-jh.lin           2022-04-12  332  		mmsys->data = match_data->drv_data[0];
8cfc54a36d3e79 jason-jh.lin           2022-04-12  333  	}
8cfc54a36d3e79 jason-jh.lin           2022-04-12  334  
ce15e7faa2fc54 CK Hu                  2021-03-17  335  	platform_set_drvdata(pdev, mmsys);
13032709e23285 Matthias Brugger       2020-03-25  336  
ce15e7faa2fc54 CK Hu                  2021-03-17  337  	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
13032709e23285 Matthias Brugger       2020-03-25  338  					     PLATFORM_DEVID_AUTO, NULL, 0);
13032709e23285 Matthias Brugger       2020-03-25  339  	if (IS_ERR(clks))
13032709e23285 Matthias Brugger       2020-03-25  340  		return PTR_ERR(clks);
13032709e23285 Matthias Brugger       2020-03-25  341  
667c769246b01c Enric Balletbo i Serra 2020-03-25  342  	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
667c769246b01c Enric Balletbo i Serra 2020-03-25  343  					    PLATFORM_DEVID_AUTO, NULL, 0);
ff34e17cf9bce8 Wei Yongjun            2020-05-06  344  	if (IS_ERR(drm)) {
ff34e17cf9bce8 Wei Yongjun            2020-05-06  345  		platform_device_unregister(clks);
667c769246b01c Enric Balletbo i Serra 2020-03-25  346  		return PTR_ERR(drm);
ff34e17cf9bce8 Wei Yongjun            2020-05-06  347  	}
667c769246b01c Enric Balletbo i Serra 2020-03-25  348  
13032709e23285 Matthias Brugger       2020-03-25  349  	return 0;
13032709e23285 Matthias Brugger       2020-03-25  350  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

