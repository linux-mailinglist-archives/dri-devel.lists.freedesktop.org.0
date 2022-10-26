Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28D960DE80
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 12:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449F410E493;
	Wed, 26 Oct 2022 10:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAD610E493
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 09:59:57 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q7x5vG014053;
 Wed, 26 Oct 2022 09:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2022-7-12;
 bh=J1F1HlPiX8ZLKKQ3CW2bg3Ggmb/jQx6cEIW/Ufp9Bks=;
 b=Gj3FFC68E3ptdWslA9TySf3Jrjk1ECYM0k7zcUBADLIBWtGfTbK4DVceBRg4wqOjVFId
 rkn4WG7Zbnxi360cH1/CKPB95hNUZId0Gclqnrl4S6Ceag4byc0LURGHsbAydIow9koF
 RGm5geJnZTjrI7Ukc2Wdh+RY89B3gtKAXhC1ZUk0kKizgESEMXnCw1p1tvz9cOMkU0T3
 SOgjUZwH9EutLE3dxN59FeUyd5YBCExU3G7SR5poSaOQjDrpp8KNapqqoRAKwBK7NQIn
 nGYZEgr5FM5BW2I4Od6yaW2X5/YMnA9uJstEjSIYMyYzNPWtEpNYBrmV0ZCodojGXRL+ GQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kc939eqw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 09:59:53 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29Q7GISV038422; Wed, 26 Oct 2022 09:59:53 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kc6y5awsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 09:59:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgiBIFqfcn+7DuSFe0ENM4l95C/qHiguXnDWnIYtTa5bZrUPWWIAOj44rdo04o73L3H9S/+otUUs1yg9XFDJabtsjOSjrt6YZq9ln6G+iaJgoe721g96cB5twjTw+f3P5ikyvPbyZupEYBWf8ioiF4SbNdp069aWxr/t9Qwf9pPGv8FNqC0E+q5t+L9ocv7R8dnOffjZl+Or74FAIb2DFjk9Upv00McyeUaMF+YzQVNkAOVSN2LYq/6IuKChUwpbM8Jm4FVqBimEK7c5a4MzMUg1vpsJd4AnTMEHR08AojV9ubZWqLqPeJBD8vGmvHFWmReirwbP8SB9TnifWiTBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAVlyaiaDO7/+7mHShmmMFlwH0M8EGYp8AfxRYqLGDA=;
 b=HNLbPtTOI+WKWPWb6ajb4NJAO554mVlfB+FEFBDVKIfNIZ8zB5pEGyUgtIP7XMQ/XLpQyBfkGqPf46dDWw4SS8mJfQ0c0itcOsk+RGR5X2Od0KZUmueFoay+ikSIQ/Ye8NDZxE2rBbT1AguJyqcd0UHs73g8W5B2InKcoHerXze254MvcOQFKb7sij/VPeGcGjxrvadXohZBkVce++MXTw374AuSKZOznqjlJaY9N9ogs3uQrwX52W5eEW5jwdd3jIgv9dZigSImzTWTdAFusA/jFqSEvlCK8npQ/nFmXBSsDuB9WnaiRwRFdSEhQJ2hiuUqtZZffG4b5/JA0puTYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAVlyaiaDO7/+7mHShmmMFlwH0M8EGYp8AfxRYqLGDA=;
 b=JBIoZhzhlqAbkKraAE9h8NOdrfvrw+ulOJYGdxjXMOv2zAYKSSSXRo092WV43AsWrjEE+n1bdH2lSwXCTwOWfgvqXLfdYJNEj0K9HeVqBW6/hYyKFLp50wZbI8xL/gF85gp52i6jnLwkU07RCzsrZdl69ILiH9cht5oA/GO85U4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 26 Oct
 2022 09:59:51 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Wed, 26 Oct 2022
 09:59:51 +0000
Date: Wed, 26 Oct 2022 12:59:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: noralf@tronnes.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: [bug report] drm/gem: Add drm_gem_object_funcs
Message-ID: <Y1kFEGxT8MVlf32V@kili>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0009.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|PH8PR10MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a6b0ecf-64c6-43c5-7372-08dab738d298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jg/9mzMzS7yJ573c7l/Ct8cHH0tNshS0OJZ1QB9HEKWWfUvAzdDFP42pjIaiGmSEjUdlnh1ueR6xBK58sIA4u1NMiElY5gMu19RZ6JS8IJSmbpZdZHq07lafu6mp2XX98p32Dw/XrSeulz85LS3hmMF0FXTxz1b854t0fZIJgqxSN2+7LvOdf7MYh1XCqfY+tGkFgt96QTRmJwHANgLjck/0ndQRkWBxPcVI6lh4M4zMKBegUFjZXoB5NQtjk1rl2vupRy1B//lVZbJUgwxeycqfN59hGDVEZVwwfB8N33870efor6W8mRrmCdO6xnpQurcPPuHf+eDyfL7x24hdEFo9rgSpYDR8jvNXnPXfEaG3HoRST9kS+dQvs3ARSJ9lqQZvE36mq/6eXB4iXmunqjI+pebNkJIhf29iRj5jvRFiGCToLB6GD9tghAMI9EA1bOnTEvtWXtJ9j5kEO+/fYrejq0UTUoVBTTMCzIEz6rurLnLVZXVgJo0xhPOdfktgZtk/0w7qq2VdqOdgxGF12fGO6uzV8Fgapixi32/EA/sDNi5RnxNnOH8Yb0AQhm2wIGJwpI5M9ipqWa+tKBH1eg6yNWS6bBiqDRcPabX22iq6jNSGlVnZGok1FfIpqEv804gS9t+ZzhTmc+PagKvg7o0CI9LHFs5didH/AWvQi2C4O4+XTXq7+zz0Bmg5PBxo/L40mZMzW9QxZGt8rtV39Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199015)(6916009)(5660300002)(8676002)(316002)(66556008)(4326008)(66476007)(478600001)(44832011)(8936002)(26005)(6506007)(9686003)(186003)(41300700001)(6512007)(6486002)(83380400001)(33716001)(66574015)(6666004)(2906002)(38100700002)(66946007)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OCb6Pdxf1Yp82HYeJLHzhfmLACjB/GFSRwMFEFKClMEXDYMAKXHGiNjhVh?=
 =?iso-8859-1?Q?6/nCKd3+qflaXTCaT/RzlR01JbHOsGsKeFN+5bIpzS0YgPhVfeyiTF1zxX?=
 =?iso-8859-1?Q?bzRY/jiPCG0W4Ap3PLHwo4v3DA1+y7Nz8OTT2ByadyhMXetIBt3shUPo1Y?=
 =?iso-8859-1?Q?/H47JKsd515l3RFuVAkpfcgbq+KdsHl4IH2NTAPjG6PhKNxV3fhkY+pxhs?=
 =?iso-8859-1?Q?ZiCQQ0CCpRI5pt7uUSz6sbozBm4CIq8gnQi4BoI+wziVJWHXihrXTgY0oQ?=
 =?iso-8859-1?Q?mpNt37HRx4QRZr89/TuOGGDjWEQMGm3bDzKUteVz/mkb5UXZpuNrfYzxR+?=
 =?iso-8859-1?Q?HL6szFu/XsytbOQSZdVMf9CAgLnk1FPGOwmc18TIaV+uja6EOD+3yMw2x4?=
 =?iso-8859-1?Q?hA8mKfpxgGk/M+2G1QmRGdN2Vip2zp0ac7Pkr/YblLPXCr3Re06+z+qOUL?=
 =?iso-8859-1?Q?JNOjsouqYj/XHMJoS0i5ZJ7fs+7LPldR6OK6Vcnp3izVTMuFA1ar1Ye+ys?=
 =?iso-8859-1?Q?spNTfMTCxEucjTl/COm98BbuPf7LBukZW9FghNjIXPQb9XHm232gWrjZP2?=
 =?iso-8859-1?Q?syWq463F5nvtudTBGxxLXLjTs8+iq6QltB/xBwTpIVQ7Lrh2wlAzyAZYm+?=
 =?iso-8859-1?Q?3jDIj8aD/8pDT/5h0rHvl6CXPicEzts3YM2KAkPEc9jb1BAJzvvQuyXKyh?=
 =?iso-8859-1?Q?uANNeDFNm9Oyx3EYDXn3rD7g6dl4BytOWHSDcwBe4MJOgRkV4Q3hpyI98F?=
 =?iso-8859-1?Q?TOu6NZCMJ96+0uG/LfR6SWWB3RT61j2H9sSKgsoxJd2r/Wc6hkR1t67c0H?=
 =?iso-8859-1?Q?DV6U9s/Wa4cxnhUQap095VkB7Bt1sJ9dX5zQUSW6aqEoxk+ifPcZmepWul?=
 =?iso-8859-1?Q?0mqXx+mDyiMULqZPNzsUISQUvxTtfDFKQ6yD0jd4/Ph+wzveChk2bnJl/m?=
 =?iso-8859-1?Q?2G+2bZe30f8dkTHaIZPHOvk7szvr6EDPKul0mBz28qRMuCto0Y7vkA0IEQ?=
 =?iso-8859-1?Q?eokPUgKdkE15wD+LXit819U/wPuP7znQCUcHYkFfTcrja1i2qb7lLtgFmd?=
 =?iso-8859-1?Q?rbD1Za6jZf/484UOgl0KPqDQCQKpRWk8ehdfLjwd+T8ItS9xZDNTMaV2uy?=
 =?iso-8859-1?Q?cmkZnqU002fNhivMddPvTP/w+Z6t76HJOShzB9A8/rEkEBCJh7n2oT5xvt?=
 =?iso-8859-1?Q?VxW6KuPi7vsGSRz6HEPyEVwLME7JOdo3Mo08ZwZPT/mjV9gblderkxoCMr?=
 =?iso-8859-1?Q?id6EMYnrG+8gkTXUlibJIAd10DeKpSqZco7pM+lNwlmp+h/v2g3XQ0Gzh1?=
 =?iso-8859-1?Q?kXJlSnqcMdZPmPZEBTIJ9UIN/oCpa9r2CT5ea1kUwvBQ2zTbgYhEuctTuL?=
 =?iso-8859-1?Q?ykXvlSEXAA2n+tG+fYRjZsR3Mo0q4qgkLdVWgeHFIl56Y10AGvIaJ2RMBv?=
 =?iso-8859-1?Q?ba0yq/Rwk8vM0lEPZabZW+jORwtaJLbq30SuRGyvIu0KgOqTr+8eOXODow?=
 =?iso-8859-1?Q?knkQL9SohkmU9nRBL3wnqUXZCW49TErLcrU/lZpppGtyAlQM4zLFMgD6Em?=
 =?iso-8859-1?Q?I1PYLwz8/NRAQ50mxv4+B4ZEaNj/NASnHd+NEol0PbieJ/fa6KOFenFY+5?=
 =?iso-8859-1?Q?nmMm/IspLD0J6TmWuYIRn2bgi7nwaoqB5INxRJSIDlvYVQba6hwasFOw?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6b0ecf-64c6-43c5-7372-08dab738d298
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 09:59:50.9041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rG7kRMGLcu6fPms0M3fqaHhl10zIcObLGE+azKK9KpYxJ4NORoY4nE3B7cgWhmAtfgzffUVY5cLsLP+Ef5vwrZOGZOv/V9QM7LFmDPOSBso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6597
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_05,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=957 bulkscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210260056
X-Proofpoint-GUID: hhgDfEtEEfqLtVHTIhZEQ5h34SRA2EPv
X-Proofpoint-ORIG-GUID: hhgDfEtEEfqLtVHTIhZEQ5h34SRA2EPv
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

Hello Noralf Trønnes,

The patch b39b5394fabc: "drm/gem: Add drm_gem_object_funcs" from Nov
10, 2018, leads to the following Smatch static checker warning:

	drivers/gpu/drm/drm_client.c:240 drm_client_buffer_delete()
	warn: variable dereferenced before check 'buffer->gem' (see line 238)

drivers/gpu/drm/drm_client.c
    234 static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
    235 {
    236         struct drm_device *dev = buffer->client->dev;
    237 
    238         drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
                                        ^^^^^^^^^^^
Unchecked dereference inside function call.

    239 
--> 240         if (buffer->gem)
                    ^^^^^^^^^^^
Too late.  I don't honestly, know why this warning is only showing up
now four years later.  Perhaps Smatch thought buffer->gem was always
non-NULL before but now it's not sure.  I've added Dmitry to the CC list
because he seems to has been working in this area recently and might
know what's going on.

    241                 drm_gem_object_put(buffer->gem);
    242 
    243         if (buffer->handle)
    244                 drm_mode_destroy_dumb(dev, buffer->handle, buffer->client->file);
    245 
    246         kfree(buffer);
    247 }

regards,
dan carpenter
