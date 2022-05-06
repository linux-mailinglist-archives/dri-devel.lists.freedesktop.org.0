Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC8451D23C
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 09:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B0B10FFC1;
	Fri,  6 May 2022 07:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE0E10FFC1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 07:27:21 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2461Ixsm025194;
 Fri, 6 May 2022 07:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=cxJ9K3SIoRqufIsMUmM7dwZ5Zcl4aK+w5r6q2fZGcE0=;
 b=fQvM8+ul03jU4IFP2OL0jFOyn6KoM6Wdc+GTAbuvMcx3w/MTyZKCQcvM6/WKibmmGnel
 RMemHbFguY9VmkD5CRvSeuTMJyQBqgdaNCguNrDyl5PVnEE7pJ/O5xasT1k8/JLIkoFq
 5NHSYHJohS/PLXOiIIb5uT9He7X7VoaiP+558Kw9TZuCAoeQK/1g9uh0qjmNTwOMPxie
 04l+kc5qXZph1V7a0ENCjoCP6awZ14049Sc7dvQcL88HRF++MiUcJsolxOVdxesC7hbd
 FcZWtoE97Jdh6f9nKYhJcZsA/qWrGVJOJ5oPpXRroqMShdD54bOteZ+CQhPuB+rDocN6 nw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruw2nb0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 07:27:18 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2467GbaU039771; Fri, 6 May 2022 07:27:17 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fus9014wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 07:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNYcHbfDmaqkS6IYLG5V/4p8YMKp317JmDWUranQrCMvwhwxy6aaulzxLNaZKpZjI0G2zvyIwNuVFNyzD70rqj/vpQ2utuFV9eGrkxSzaE54W6t/QkJdM+tZ00UdFbl5KthfW6w2cbxNbphdyl1lgHH3iUveFIBmgTbKth5nUft3LFtx+jLYoRF3QskJQv3gjpPrnDs8UJNVrp58iweO6ahp5T5G+Zl+83V8nIrrWxPDFHaSPZVdsy6UlZckRuCnbvCqcG/63oxRH/Koy834eTVbAh7cOv5w7/SRnq9wSajVaIzXh+7a2Vy5hje1Xo4+WtV+emJeX8gEhJQ+KKPG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxJ9K3SIoRqufIsMUmM7dwZ5Zcl4aK+w5r6q2fZGcE0=;
 b=Lyo1/Vc2jQyKsUABWxjp5IJ78vvQFmAMyTlQ6yAALCCjNdsEonks/lvLMLUFCJloWwtF/HyWFmapIpfV/H2VfPQT/yVmlaX0gNH53+OaomuszM1ovBMtP0PFv+L5Wto1LQ8fPIgCnr2C2ubW7a+B4h4FRp2L8SXz9BqKO76g+q9hIXej4HxoC4Pl2UFYUy7ILa6GKe6TgmACnvQ9baf5EUuhZ7fGQG3937/dtZfREhui49aeKr4K4M7QjfGxM2RzUMXmycwwEUcT/u0sNfEOJYnGj1MM8CD/v3oHYNDPfXu74/3GW0n2slNTwqKC2ZxFNlxgXzhlefQSmnA1Ek1DQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxJ9K3SIoRqufIsMUmM7dwZ5Zcl4aK+w5r6q2fZGcE0=;
 b=uu1+fe45wPCz6JlrAAf9Zs5GRC7P+YjiMf3KeDle9sN6EAdIUW6iZ/wH9aHJ0jDM9MaDIyB7HGvfC1gqriXg0WVNrpPN4JP7+u0LoTRrwkPFNgEGLUk1UtgUghLcHR9QI+SUnYmLBvIFl2xmmNbg8sxwFPqGYTZCZcz+9e+QoXM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB4137.namprd10.prod.outlook.com
 (2603:10b6:5:217::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Fri, 6 May
 2022 07:27:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 07:27:15 +0000
Date: Fri, 6 May 2022 10:26:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Thomas Zimmermann <tzimmermann@suse.de>,
 airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/mgag200: Fail on I2C initialization errors
Message-ID: <202205061008.eYVQWRSt-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505152244.413-1-tzimmermann@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::27)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9acdf7b8-7728-4c5f-e849-08da2f31d7d5
X-MS-TrafficTypeDiagnostic: DM6PR10MB4137:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB413796857C22B2F83871243F8EC59@DM6PR10MB4137.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eR4YgGpk439OAktKeRF+pZWQHlqFCXQK8gXhNEdgYwK1idtrgZGMlgLm8gOj4i3R+QOZR4AwZdrgV1J090g7wauYE5hYfezPoXTptGflixOshuXzhhZw64Uuat8tLwYSdfzYSlBcqFqo5uOeSN0Lgsg3oCb3ZK5bsjoPXqqhwHDhbUZvTIUhLLLn+lP34CZQGHqk/NaV+jwAx3qFWNi3u+olxcY76fEp7dQtRYYbj7/NP0XjjB3TXt3UatxK2jac8WsDqM7J9jI1kcDnaNTqbWroJ65UjA+2psngaaYXz+OPh9V+XfSCPIcqO/X5KrN4ayLhKHcw0UQm6ZNh6ft05SIok3UAiUvSsmVEaeC63lEurNNmCAvLDU6AhSPnx7xwL3j+W423+q6DApB/hcQtUrCG/DvEVFE1V2pZkUmQAVpB91lR0KBAjYgmxl+k8QmsR9rh9y84cMarflCpU85aGBQu4c17G/bGfbXLjrQTHpGxOybSTukM3tO/Bx6DIspZ3/d4LohOUBRMMO3fvxMCzWQtLTEdORgRX4ejmhBFOw3KAMQqO+ZfA8+qp/JuLAeqP0R9aZgAt49U/g4UaaZ6CTjFg8Uu/9fn3575KlsvZ1p46OfJYGutVWqf6k885pLrplXA6ZaqZyRPSoizE7NmN4InXW9b2Sw+0Y7RMzCWxOR1+a3lCKzY50n7T3j2sVujad8JMNIu5smmgja7Bd5pnhrW5xxqm1hMOc6GnrGH7yao79lTyqvkhaJQzQv2YIfpFe3bVPtjUAznX1aOEhsESY9r0WboHuWmpP5qch+csf6S2IIYUnpq08t8AN3z/SGl6U1notL8uEQKN0LmbLirHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(86362001)(6486002)(508600001)(966005)(9686003)(6512007)(83380400001)(44832011)(26005)(2906002)(8936002)(316002)(6506007)(4326008)(36756003)(6666004)(8676002)(186003)(38100700002)(52116002)(38350700002)(66476007)(66946007)(66556008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XEIvaCj3WgpI2IVQGNvMP6KKkQEN4HsX9n8nRk1iGzMw59lpd57DVg3iIsTb?=
 =?us-ascii?Q?Yr5AikaAiXDcgMvJD7hJIIaEi9ec9Acp7mA2FYDAnRnHOtU41pTtf49VNFlL?=
 =?us-ascii?Q?ZYRvmOmYOo+VmoeuaOrtBlpT6cFOu19cTvFiTIcx2RwD7UfzqFuNfpzHVQYa?=
 =?us-ascii?Q?yLM9x78WMICzVhXMYqYsPCpQadpElRLgbIQ+s+LSPZEJ9niPwSpJvFnGcMtc?=
 =?us-ascii?Q?1lyH6SZwq5POzS682vo4N7O1WM/6PTMeX5rFnH8ROJ+mxkHT4yYpZ3qtNCts?=
 =?us-ascii?Q?2bF/c9aeG8SU7Ypjcc1qmRN/3RMO4Ddvs5NKda2G7812s4VXpmNFnaLEWf+M?=
 =?us-ascii?Q?UvxNwXCT01H853HnZCZ1y/6RTKwpMvtSnu9TC2FpFvd9lBVwaE7CxRz1Fm9u?=
 =?us-ascii?Q?xRvt53bcimEDZalmcRy8wgQ/LuH/mmSc9gtPgelelaPPMYGxeH3Q3FDJLp25?=
 =?us-ascii?Q?RBihAXkdeQp3UIG/8zaoqMKdqAovGGs4t6VxELLHn3kqSbxoTwCj3Jx+vPLK?=
 =?us-ascii?Q?qrxjtydPo5N5/j7+D/T+LJ83B932gS1pnbN5U9ZdSFFKGpLYfDJj+r1o9eBB?=
 =?us-ascii?Q?UMvSN6UWRHVHT1l8jikSusOZBqPICaKm+YSA7y899ZfBSsPPntZBH4CH8EfT?=
 =?us-ascii?Q?3W7zoPDtmzBkAnk0mIFiglp20Nan0npmh6lTtb2tSEm6S6HpCwRxnnXjMJmv?=
 =?us-ascii?Q?+igK9UTSAEZH714b6P3kw3uJXJBe6ls7weUZ36anMO+i/kAiE4cXB0I57Afm?=
 =?us-ascii?Q?pPC36cj1aAwKzWMwYZHWbe3qsY6soljT1ijr6eOI7zPe471LM/PZpAISiOtw?=
 =?us-ascii?Q?1gk7Sgc++rUxZuQPVrGIkyUTRW1t93TZEipO/or7/TCvWN3r+Mdq1KQh9GSn?=
 =?us-ascii?Q?buuJ/Yzi2x/Oxw5wzwfv/WobbHVCsU2ywRlZP7JESZITG2WoqqvbPbr2yTFE?=
 =?us-ascii?Q?WD4PVUNsjS3jNHX08+wKiXwSvzm/OnpzbAVZAIvg5GTnI+qTBBejSrM5w9Oh?=
 =?us-ascii?Q?P2C3xXsrA6jbTxab1aew0rXaNunpK/uqyobMhVnqKLAJ95VMFCQpQgU4hsZA?=
 =?us-ascii?Q?q5p2SjHSD6mP4Kff256971numUsawq5zcBLCuB63GMzOlLZzt1ekB5C8NjpO?=
 =?us-ascii?Q?dUS+KNvoYfp/LM4G1q0p2nKBkTumgAhY8GvqFXqo66PxCVmMD8P81h4BsYKp?=
 =?us-ascii?Q?ja4KmngfCWmISDzr8PHo9CfrWVAy1c0y1PJYfiQTWNFjE5qL7gmmVMDVl8VC?=
 =?us-ascii?Q?mzfXRljfuHeUTy2LLqfwmXRSaF+wewJe4RTWI5iBzvzB/B2wzIE4ZeiFKbRh?=
 =?us-ascii?Q?PnzQaT1HEW8gATUzXUIEaP54B7bkfuKT6ofgnLjWyNL9E1Q1iCJFUG2LTvOY?=
 =?us-ascii?Q?xGefdkBJJwKhff3aD5/Xs324WpY7niJJzLB/w2dOPF8CC2R0osuowrVNnbmH?=
 =?us-ascii?Q?5HET2Zpo1xpPv6KNg45RpEMMfLmdSiR2cMuex/fGdeSjamTDptR9JGQ/BIzu?=
 =?us-ascii?Q?d3cAdWpqcyY6SvbNxS5cRSIR3E7YLjoAs1q3EFP1tDnH8GyfxHmuzPaY/2qf?=
 =?us-ascii?Q?hLCL76NiF/2e5M2QDt7xJaqEIwqsURsXIIhq8y3t5sGc1fpIZaIQ/7IBqwbr?=
 =?us-ascii?Q?s+N0tgnwh5U3kqND/+FaxDa6nR6ug5OPSotjYliwrzyUIXdkUPSNHlwYv1Mh?=
 =?us-ascii?Q?Z/j9xERHoqi0jMvvIsaZblzd5Z+upjFwc0alQL0224mnvCKme82GD2IygIfa?=
 =?us-ascii?Q?jZEi8tUTewxhflgYwoNLvk99EFoH9kw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acdf7b8-7728-4c5f-e849-08da2f31d7d5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 07:27:15.8462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSLd/w63YWQiBs86wnZL9wdjSwt4UWtzXa98E3MKOuQG0CxDDoGZgsPKy2H8KOf0yOKn4VpuzRlGDQozOExmeHAfXKfar5EGamtBKoOMv2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4137
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_02:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060038
X-Proofpoint-GUID: N33B0hyUfMJSBLeSdNzFVxwZcMgtbCpU
X-Proofpoint-ORIG-GUID: N33B0hyUfMJSBLeSdNzFVxwZcMgtbCpU
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
Cc: dri-devel@lists.freedesktop.org, kbuild-all@lists.01.org, lkp@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-mgag200-Fail-on-I2C-initialization-errors/20220505-234643
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220506/202205061008.eYVQWRSt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/mgag200/mgag200_mode.c:819 mgag200_vga_connector_init() error: uninitialized symbol 'ret'.

vim +/ret +819 drivers/gpu/drm/mgag200/mgag200_mode.c

81a15b9a65565dc Thomas Zimmermann     2020-05-07  809  static int mgag200_vga_connector_init(struct mga_device *mdev)
414c453106255b1 Dave Airlie           2012-04-17  810  {
832eddf5d8f4d83 Thomas Zimmermann     2020-06-05  811  	struct drm_device *dev = &mdev->base;
81a15b9a65565dc Thomas Zimmermann     2020-05-07  812  	struct mga_connector *mconnector = &mdev->connector;
81a15b9a65565dc Thomas Zimmermann     2020-05-07  813  	struct drm_connector *connector = &mconnector->base;
81a15b9a65565dc Thomas Zimmermann     2020-05-07  814  	struct mga_i2c_chan *i2c;
81a15b9a65565dc Thomas Zimmermann     2020-05-07  815  	int ret;
414c453106255b1 Dave Airlie           2012-04-17  816  
81a15b9a65565dc Thomas Zimmermann     2020-05-07  817  	i2c = mgag200_i2c_create(dev);
11682b9fc557a02 Thomas Zimmermann     2022-05-05  818  	if (IS_ERR(i2c)) {
11682b9fc557a02 Thomas Zimmermann     2022-05-05 @819  		drm_err(dev, "failed to add DDC bus: %d\n", ret);
                                                                                                            ^^^
Uninitialized

11682b9fc557a02 Thomas Zimmermann     2022-05-05  820  		return PTR_ERR(i2c);
11682b9fc557a02 Thomas Zimmermann     2022-05-05  821  	}
414c453106255b1 Dave Airlie           2012-04-17  822  
81a15b9a65565dc Thomas Zimmermann     2020-05-07  823  	ret = drm_connector_init_with_ddc(dev, connector,
9572ae176a10f3b Andrzej Pietrasiewicz 2019-07-26  824  					  &mga_vga_connector_funcs,
9572ae176a10f3b Andrzej Pietrasiewicz 2019-07-26  825  					  DRM_MODE_CONNECTOR_VGA,
81a15b9a65565dc Thomas Zimmermann     2020-05-07  826  					  &i2c->adapter);
81a15b9a65565dc Thomas Zimmermann     2020-05-07  827  	if (ret)
81a15b9a65565dc Thomas Zimmermann     2020-05-07  828  		goto err_mgag200_i2c_destroy;
414c453106255b1 Dave Airlie           2012-04-17  829  	drm_connector_helper_add(connector, &mga_vga_connector_helper_funcs);
414c453106255b1 Dave Airlie           2012-04-17  830  
81a15b9a65565dc Thomas Zimmermann     2020-05-07  831  	mconnector->i2c = i2c;
3d5a1c5e300483d Egbert Eich           2013-07-17  832  
81a15b9a65565dc Thomas Zimmermann     2020-05-07  833  	return 0;
81a15b9a65565dc Thomas Zimmermann     2020-05-07  834  
81a15b9a65565dc Thomas Zimmermann     2020-05-07  835  err_mgag200_i2c_destroy:
81a15b9a65565dc Thomas Zimmermann     2020-05-07  836  	mgag200_i2c_destroy(i2c);
81a15b9a65565dc Thomas Zimmermann     2020-05-07  837  	return ret;
414c453106255b1 Dave Airlie           2012-04-17  838  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

