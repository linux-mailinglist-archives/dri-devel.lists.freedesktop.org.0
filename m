Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA334EEAFB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 12:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E585F10E05E;
	Fri,  1 Apr 2022 10:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A3610E05E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 10:07:18 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2318jOhu014836; 
 Fri, 1 Apr 2022 10:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=fyw8C9+rob93CRu1ErQg6tq8E9JPHG5vreFTdhsXklQ=;
 b=BmWCJUnluln/B4XgY2GC3htaM6MpbOeJsAFDgl3i6ohf+0xbmUhcgmRZX9tBdgxkmrrM
 uFILwmntBZnQYD+7pZ7gnxCjcqjSNI3Fk8CJ+gyewckAwuDKGcKMZllXs3vLRCqH0wF5
 2ajbRjAJXZNaQJJxyg8GtbUgd5zoXyDxosgwEDkz1z27CFNLn6rgq5R5++VR8SLpQkCy
 nf2gSZjxW6PL9E+BQVKtx2pK9/EXHGSHWoNCKgzfRTTpdL8HqfALk5Hwez6bRAg36iEp
 80bbyiOBECRwnS6fOmDAPgZVkI4Zn6dP/NW+ZDQ//r1KX0eprDJASFCV+4lWCJCmf3fW pA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1sm2pq9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 10:07:17 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2319qgnO002822; Fri, 1 Apr 2022 10:07:16 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s96dxc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 10:07:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APMqXEDix6ixOy5KF4Q3AO0VgpSPUJcssG1ryqVBjQHKSxa2C28DO6Bojq3SvrZLVezHVa0e8taSB7ZVTmN0/xlCVYmfMlJqMdcHjfzTwOH6H2Hj5Qm84boNU4QAlQQSdesfbE+OUa13mVUMSsco+NSgfJfPDWBiiaUl0hMMoT5w8x3VjKkFyZhM/NpdkxzJYqiUMgSnt0M/svYcqMBBOS7LHamDb3ZWtFADibKQv1SxLxU5/ZkhMW643mg9VZAPjrpf3kNySVSkbzrNXRBt68PYn+6a20+2yQKdll9MLvriA8s6vRK2fJ+QqfrohxmyrJlA3e6RQP+FrXewg+XNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyw8C9+rob93CRu1ErQg6tq8E9JPHG5vreFTdhsXklQ=;
 b=ZjsjyXvjhR0f0tYEil7R3OCzrqJaXtNXL1+5vx1R5brsa2entvy1PzG0TjnPD0iXZ1w7AjlRuiU9Myb9RtaMkcG/79M8bQ8sGlepMSkmjxtfayX+3nU4u5ZBhUWEyqvmGt8yDDFCiPGffJFVyarEQT9jTJ9BaXPN/GJHaM2nBN8ucISb+5AAzersqQ13PzTl5zHZ+mkhBd78i8AGVSl4/4XFG3FppX8OTl96iUAr4E0RxvYlem+Y755W85CPEZI+1ScrjjRGuUg/8LcwmrvxF9M8FdbpUGXjkbUSxIvRyfaHARM47CKOvFmNhpiBr/C7Xu97kNmUPkRJB7dqRPmn+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyw8C9+rob93CRu1ErQg6tq8E9JPHG5vreFTdhsXklQ=;
 b=KZH8nRwPHE0WaMs/0psFOQwLHObIuDArqevAJIeEdnOb20WenK53L9hgUsQK6U74NpmnTpaOjQ1+Nv8v8LWqye1PTAicJK/DPnNncuYchhJr0P+S5uqAcet7+6coJZk9A524UL4pKJm5nCxxuWwGvoaFjPInk/nj79xrJLGQ5x0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB1313.namprd10.prod.outlook.com
 (2603:10b6:404:43::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26; Fri, 1 Apr
 2022 10:07:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d4e7:ee60:f060:e20c]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d4e7:ee60:f060:e20c%7]) with mapi id 15.20.5081.025; Fri, 1 Apr 2022
 10:07:15 +0000
Date: Fri, 1 Apr 2022 13:07:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: linus.walleij@linaro.org
Subject: [bug report] drm/tve200: Clean up panel bridging
Message-ID: <20220401100705.GB29860@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0099.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c86a417-cd8a-4621-4aa9-08da13c7657a
X-MS-TrafficTypeDiagnostic: BN6PR10MB1313:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1313C4CA5725358B9627911F8EE09@BN6PR10MB1313.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2OmEHCcnsbJItkqLXb3qd2xFCCwGvISPPcOdBOxi2xoZ4qlyEZGuIGAJu/YzzWhQIP/Ow5AJt450QrvejpqpQir3jlInjm0R5lsnKk765sjBUUjSMDw6XGyVKfexIBWgZw2PAZBqv6ouGOZ06iMWxPWzWn/GBkBvcvTE+KhhucJcLat0w/qEKRtlrrzJYd+djTi43H8Cl9KPUqWT9f3QUuS9ZLvONIhnJ0mc5YfvyYtr70JLwd2GAvFPpgtE6QnilCeorI6fhU5IF7X2XRZe7b7L4Py6MgRRSt6x48uzFmjtxWNyZo5jinsarhpEtOhKZAJkmECnNSXebRGKRfaedMc2l/uh1EFwEZQBICvo7RzAwnbIWuMteOuoVDepxNO69WvGeUA/9zzVady3ny3ZqeiDD/Y+Y0hluo32g+fvHtKdoCURPVxMH3RcG5xSNI9sy4L0aItSZip3coQ7yawY8XPnqGiguXu722MUpAAjkxnCuzdzCM5wVKsV6KJawNyTOuFM9GicFi4Shugy414vMOTGWFCeWG0QYrwQGF7xPLaQMhrAOLz3iRdDftIHVWZG+IG80EzZaSosDZMx38vqB9uR+UiAVx+rnaJsa0D1Y9bGIR3kfNCdnpM4pYbmSK8svuvzKLFIghuANkCLEH8SPf+q6L+8eJJsiyQFbZL4eSD+UQTl207V1gSAkgelmiE0lm0ppgBFl6f5Qekct3d8nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(44832011)(5660300002)(66476007)(66946007)(8936002)(52116002)(6916009)(66556008)(316002)(2906002)(508600001)(6666004)(9686003)(6512007)(6506007)(6486002)(8676002)(4326008)(33656002)(33716001)(38350700002)(1076003)(186003)(38100700002)(83380400001)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YBwrHdLu7o31lMQLgDObgWnscTyfWUWhgl/tZYYPSH+bd3OcuEquQiW4h3iW?=
 =?us-ascii?Q?gZNyX0Vm/Rff7WBbY/B9ADoW2h0v5FRUcPhsgoKaYafOcZ2KNMRj6l4lfSdW?=
 =?us-ascii?Q?n+u3TUxuTXm/PILK7QerwkK3omk1AiX0U/bF/k5J+ujbflsiW+R5MLScoGZL?=
 =?us-ascii?Q?uBZ603aiT1ARxcnU5RheRY0FK2GJqxXNBzNfiG5Ygly/LFfF1MsVH4MruoJi?=
 =?us-ascii?Q?LCTpdn8DhK5IkgomuX9qvBdZ7Xe1wO7yfWmWycodyG2BCBhiRFaKj0zUusLW?=
 =?us-ascii?Q?f9wvD3cPwsBLHnAa5yMTlYYhbwnUuP0uw0HqAqbet3RE9rsw8pt10t0oHNiJ?=
 =?us-ascii?Q?ztIDXMBLs0a7Gf/wKprOyigPyprMXmQoAy11TO/7NQWfu/bcmYY4+npe5QHX?=
 =?us-ascii?Q?i5gn7Dkrv1LVx/fSo6cY4/Y7lw67VYLWrTztM/MK31SJS1LzYqVTr8+gDY8c?=
 =?us-ascii?Q?0R4Jz2Jp3T2JCQ23jqlTv/6X4ePJoauWq3VtiPZesDd2E5KNnYNn1hNE7p8a?=
 =?us-ascii?Q?/bQ4MioNzFgyOo+bTWp4yXGdQSoXhl68gD94qb9ZSPLVX1nd+3ZJ59JOXQSC?=
 =?us-ascii?Q?WZvFRo8tjHjCiAlrAGaspI6TS9om1iuM6xjnog/pZpgZpvFfh0Xnrch79mNF?=
 =?us-ascii?Q?DyAOg0ZU2Sxl6XKPPSSbherRhy/VNKA385fy+8X6u38U5mg0EzQuuh57pTwl?=
 =?us-ascii?Q?UPH6Kg/JFQnyj6N+61V9MZffchdUGYph58PFBJMQPb3LnhPhak9JS/zinpns?=
 =?us-ascii?Q?umEhXBJWxdK/4e8KjjTHRHmIOO1zuE27gVVgAA7mx+h6yXqGOCGEFmNgs8oX?=
 =?us-ascii?Q?3YgWOpHv5pkI55qob3gARh3NoNJ4AMzMO/ODs8uyn2zeqJqpAr7rwU3l/2Qz?=
 =?us-ascii?Q?7tQL4FaFfp+/M42ecPyVXe/TZwtWQHOpPiXHkogbuIdw9HfKsPbaQrnC5jUb?=
 =?us-ascii?Q?cGiTfDSpUbBOyOVSeWILGKtYBB8kTCaVeq2OkdELG+4PNrrlHnndMX+sollz?=
 =?us-ascii?Q?13rkaHVwVKX+f9gW084vhBRAcK4ojCTkQtdIPFGElIBoAQPvtpTBbnTHe5Il?=
 =?us-ascii?Q?oqIAzV+TWmnaVN5Oh/XBgKgM/x8X/jMLT8xkvaH1qXDN+Wubcv13OIO04Rtl?=
 =?us-ascii?Q?y7HA1A2A0/F5/W8yDAUJPOSvOGtgV2X55P55ZJ/osAduRY8mSh3OX8Z5h7XB?=
 =?us-ascii?Q?Vw0/l4EQNRE7B4D7poe5ShxGJjBYY5ZPkz8K++YK//RDw1nrAQzF4RbFSZ4+?=
 =?us-ascii?Q?+jhe2CaGMUKCsZV/PsDgQZLBgZKrvW0bbhH8Q3UyKgbqi3qzUdLUP85IY5pi?=
 =?us-ascii?Q?TPuzr9mmg8raWwkKd2rIb6dXIdiNhvRe0hHM0wFAcxy4WxpaQHw5ShpzEXkk?=
 =?us-ascii?Q?Radzn0fx5BwoyojUzoZAy7mbXbBT1rbVjgjjE7o16O8lG2aPxSaL4KKeHCl+?=
 =?us-ascii?Q?4+iBYje42Pz6JSiExXaOKMGzTqPnC2lbc5LA1yuNCWRsyNgUpxP5wD/2BV34?=
 =?us-ascii?Q?ansP0Z4Bny1lYXmMVOGuvuwNbaQfzdDODwQOFxXF0/9t+6mMyAh/ZP07PlOl?=
 =?us-ascii?Q?wOAUAZ/+2/84TLTnL4bu8Idjg2GpANWPu5Ga6RpxCXnX1pylxwvmrxAiUgpR?=
 =?us-ascii?Q?S18ZF+c2Qz/mnLNjrjjdM5TVIO44tg1rekesHAFgaVy0wN/BRskRUuRcxBbz?=
 =?us-ascii?Q?5sdIYD8VXbXm2zVOs1FxPWWJfHwTplwA5O5RXHrpnGvcsHpyW9ZTH8dHmSGZ?=
 =?us-ascii?Q?am43qdfuVErPh7RsLs61m1GvkAXg4fE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c86a417-cd8a-4621-4aa9-08da13c7657a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 10:07:14.9216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+X4b/vTPJzSWirJyTAJTQWNp+QMS4IZr+99rkNzPnprC/2jnYCJ4+nTY6Xdqrmh5OuM2Plon4gLOZ3SokC4T8bS8A+mrRzeh3AV2G4nMsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1313
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_03:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=931
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010045
X-Proofpoint-ORIG-GUID: jfvkYjEF3hH8wWxsRKlhVzPeejbmfBSs
X-Proofpoint-GUID: jfvkYjEF3hH8wWxsRKlhVzPeejbmfBSs
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ Old code... ]

Hello Linus Walleij,

The patch 9ab12e88a0b4: "drm/tve200: Clean up panel bridging" from
Sep 11, 2017, leads to the following Smatch static checker warning:

	drivers/gpu/drm/tve200/tve200_drv.c:96 tve200_modeset_init()
	warn: missing error code here? '_dev_err()' failed. 'ret' = '0'

drivers/gpu/drm/tve200/tve200_drv.c
    62 static int tve200_modeset_init(struct drm_device *dev)
    63 {
    64         struct drm_mode_config *mode_config;
    65         struct tve200_drm_dev_private *priv = dev->dev_private;
    66         struct drm_panel *panel;
    67         struct drm_bridge *bridge;
    68         int ret = 0;
    69 
    70         drm_mode_config_init(dev);
    71         mode_config = &dev->mode_config;
    72         mode_config->funcs = &mode_config_funcs;
    73         mode_config->min_width = 352;
    74         mode_config->max_width = 720;
    75         mode_config->min_height = 240;
    76         mode_config->max_height = 576;
    77 
    78         ret = drm_of_find_panel_or_bridge(dev->dev->of_node,
    79                                           0, 0, &panel, &bridge);
    80         if (ret && ret != -ENODEV)
    81                 return ret;

There is a return check here.

    82         if (panel) {
    83                 bridge = drm_panel_bridge_add_typed(panel,
    84                                                     DRM_MODE_CONNECTOR_Unknown);
    85                 if (IS_ERR(bridge)) {
    86                         ret = PTR_ERR(bridge);
    87                         goto out_bridge;
    88                 }
    89         } else {
    90                 /*
    91                  * TODO: when we are using a different bridge than a panel
    92                  * (such as a dumb VGA connector) we need to devise a different
    93                  * method to get the connector out of the bridge.
    94                  */
    95                 dev_err(dev->dev, "the bridge is not a panel\n");
--> 96                 goto out_bridge;

From reading this code without looking deeply into the context it looks
like ret can be either 0 or -ENODEV.  Smatch does cross function
analysis (sometimes badly) and says that drm_of_find_panel_or_bridge()
only returns -EINVAL, zero, and -EPROBE_DEFER so it must be zero here.

    97         }
    98 
    99         ret = tve200_display_init(dev);
    100         if (ret) {
    101                 dev_err(dev->dev, "failed to init display\n");
    102                 goto out_bridge;
    103         }
    104 
    105         ret = drm_simple_display_pipe_attach_bridge(&priv->pipe,
    106                                                     bridge);
    107         if (ret) {
    108                 dev_err(dev->dev, "failed to attach bridge\n");
    109                 goto out_bridge;
    110         }
    111 
    112         priv->panel = panel;
    113         priv->connector = drm_panel_bridge_connector(bridge);
    114         priv->bridge = bridge;
    115 
    116         dev_info(dev->dev, "attached to panel %s\n",
    117                  dev_name(panel->dev));
    118 
    119         ret = drm_vblank_init(dev, 1);
    120         if (ret) {
    121                 dev_err(dev->dev, "failed to init vblank\n");
    122                 goto out_bridge;
    123         }
    124 
    125         drm_mode_config_reset(dev);
    126         drm_kms_helper_poll_init(dev);
    127 
    128         goto finish;
    129 
    130 out_bridge:
    131         if (panel)
    132                 drm_panel_bridge_remove(bridge);
    133         drm_mode_config_cleanup(dev);
    134 finish:
    135         return ret;
    136 }

regards,
dan carpenter
