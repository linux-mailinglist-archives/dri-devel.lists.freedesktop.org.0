Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BE355B7BF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 07:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398EF11295B;
	Mon, 27 Jun 2022 05:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6590F1127F6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 05:27:08 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R57qG6008121;
 Mon, 27 Jun 2022 05:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=VaiuY57KOw2yeEIzxbLb35JFUR89iu5GZEUMmUwUtsE=;
 b=NAIPahZU0/hKUFimh5FOFa/7+2dfGCW8JGCj6edJ8O0VKcDfKuFpgiP/N/1f+ip32x/M
 CNNdSg8cHItPp7M6umhWcjuTG6zM6TNeaEGN4EngTxe+yRW8/a46P3t1FBHNhdlwF0DC
 FEARSz/ZAGRMoSUIYphTsf40uJJlYTorKdr/iPmHLEf39jEbM9InD0cp9K4/oWIf+6ZN
 KlP8V3O2hgR7UhgNDH7iE7F2VPt8APBXMiNWqoJJ+sR+aRW994YSfb0UAyvsiOOeE7Uc
 65DW3zMgW78SlFGM3wkj4nKdno5jS83JLpY6iT7rq4NBMJoVhByNZ/YsrVDaPOmrvMjM dw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwry0a7ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jun 2022 05:27:05 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25R56FQX003509; Mon, 27 Jun 2022 05:27:04 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gwrt1025p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jun 2022 05:27:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tj1I7K/z53hU4pYUkqFtSTcvs6Tq7wBsaFjDr6J4YC/VP4Epe14gE1HBBSpwxs/DLlImZosXq78lQ7vEf3JodeShsY55ycwAcqp64Ux4dEr1H0ceGPQvoViO2VUTXENl1ZaMc0nDva2zOhsucn8olSSCwpnNeT1qw+OHtBlTaSK8vzIyqjQgNaQa8krkZPmYIxFXLz1SxJpFwpnqsC302QvLJBRIVBhBscINcUIG6KqI+mb/rsNhHChpzZXReCQCI3AE3y5y5lslfchuRdgWmiQHLyJ4nqo7D07P1WNfu6iONe5a+5rarnv1ouyHZktjgslqI7aBOnpsSlHzg5NsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaiuY57KOw2yeEIzxbLb35JFUR89iu5GZEUMmUwUtsE=;
 b=Boj0g9T6wQ7ZAbB/tAzTW+gcYak+n8VSS09x/iVvrza6+5h8c7QkWBHgnsHI0ZgpNFQhwu+uTErsRqvNBxWbHJ5RjdsAu9bkogOOZ+mMT7piBYPCiML34YavNjXcqOx8nrotPduXfJI+MVDjjYME0mzDRfqJoVHqN6BEmjP0lsHF23dfkG5xGN2AvP+tATZdKTjiWiDfGBm5yDab4gnepPiSmkdK4KBwj2MPcuto09zgrxMVLCTFu/29g0LTvRhu6IK/JO1s91jUmUB/7oi8ykNynUBwEzPLloqeL3xfWKothiEOpXbBR3NoT2M+DDCTgqXSCOLdySGZhk5ydzCD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaiuY57KOw2yeEIzxbLb35JFUR89iu5GZEUMmUwUtsE=;
 b=Q3f7PfvwwdVRY40h3V7v3kiPlKgAnqq1g5NdWtzUgv+28hLZzEADNWhHZeWjMBEt6K3z115uX1L/CkZlNYmFOQJNwHw7SX8+7xNssPwPHrgUqAeSJyNBUOFDW2W8JE03VkpEQObi+LVoHjD/apKrt0juuGAyZ9fjYpbnas2i3Hs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH2PR10MB3783.namprd10.prod.outlook.com
 (2603:10b6:610:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 05:27:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Mon, 27 Jun 2022
 05:27:02 +0000
Date: Mon, 27 Jun 2022 08:26:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [bug report] drm: Add support for the LogiCVC display controller
Message-ID: <20220627052629.GH11460@kadam>
References: <Yqh6ErANSTEJpfvl@kili>
 <YrXP5Q16k/X0EVEI@aptenodytes>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrXP5Q16k/X0EVEI@aptenodytes>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0029.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::22)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84ff289e-9f3b-4bce-1c44-08da57fdaa03
X-MS-TrafficTypeDiagnostic: CH2PR10MB3783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ohhb/KWNe2DRYin+vgxpj7gqiDvrh1DRBGl0K+fmO+6ZtwdxWvbtMPWXwe+GgopMGxWJBlQyMdLKUQaWf01iqwRPN8+GY3BT/KiMWfqgxIXLWbJr60eA3uttSajC9WR7q2UdEgBLUMaYItheUnX9D6gA3Suvj4xFn010wXzZgtqNH6yBmzU9WfMgIENYV/jEISl7XgB5ppuyaRw8qoE3DpXeqRYF9KnDjQavSc7QLzGIPQfXvTHy1ApzocCrI1wfiIEvH4A1ZhX5veAXIaFClWxWjMuwhoGWLLtYije6GK4mKg8VNCOMgtrj6zKY4h4OscX2kQQ47mUhDu3NlVPhv+7I7CdfVhTPhQNTxrYq/jnrN+A6s7E1e+zjg55y1eZTuDgTvQrzzFG9psGMESSicoAjZCrpLtWBazDfdsERZn3V3fahMlojj7uJjU8MDxtjBmOTJE9GzsERCTPAsEPH/f9jZuPffJ4ahuikjxDpljeUnJpIoe7JQfr/QcOpu7jw/vId70hsWdGafkEuvL+7OeUqIQgUC93RptESE0s6ypWerw6FauwhA6Gm73xk2bUYC0Bqqg1FlRPnOePV3Y8lhLdvWkpoSQEp/lLE47F3P9BmzRvEU6qUJF3iSb6UsHTrbjN4EHcqFucw3Qg4rxeIjO7P8aXcv+/94mvcsJC5e5xSMn311VnUKFKIEo1cg2kFCtA9LBKvHobFBNujJZ9wnksLnKKco/dhqku27N6uIhF0gxDJWQGpW+Dz13MBgaEImcxM8EqGZb7ifLZs5JR86pFmKA2Zj8VMBM3NwEL6AAE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(346002)(376002)(396003)(39860400002)(136003)(8936002)(6916009)(66946007)(6512007)(8676002)(4326008)(66556008)(86362001)(316002)(66476007)(6666004)(41300700001)(6506007)(38350700002)(52116002)(38100700002)(26005)(9686003)(186003)(83380400001)(33656002)(2906002)(33716001)(6486002)(5660300002)(44832011)(1076003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mZfUjlPz1v48+rTvYogppD6GUM6AjwGQeBXG9BQmVvYjlyubwnjVR4KEKUwe?=
 =?us-ascii?Q?69a3Djo0z71+x+mDKh9/2iMEH+EisWc1HSbLTsTlX37f3sH9HJtzcLV+H2XF?=
 =?us-ascii?Q?pujziWrUIbJpHsdypjYOY9gBr8I2PhOlf1nB/Vgb1CBM4pNP1hI7Oq6yfcTO?=
 =?us-ascii?Q?3PhJEiNh0W3GK/7eFbOv+7bRMfiAlp73eCG4wUMrzD0GhaAas8TSpGTOCmwE?=
 =?us-ascii?Q?vG0oS4e56dSnvpqx68goK43yBlVOqkOcOeTleWDD2NKflqxR5VFR2J7STUqa?=
 =?us-ascii?Q?SDPGNkfWjnWEdsOFZQ1LSvjZu0N+MokLT8glpSJhGnQHDjj2z9Pm03DzqHss?=
 =?us-ascii?Q?y30nQIgqq4PyYFikG58hQgSn/t2NSpFs/X0bPI3uggZ1a07DJYggngm3mOPu?=
 =?us-ascii?Q?v84xI88iOvgsDbERCuEI6ZoIWeZSI5OrH8iE4C4xxEXwcVI7nYKIZ2dLTj1l?=
 =?us-ascii?Q?O9aTAZkpodMnnPf/m4VMyxy0nRn82ePzjJVz+FeyOeZdGwYIysBtY/9TpH7L?=
 =?us-ascii?Q?pOXGakeqRTZspolMOGP7E11hskn70NlrDKmBj/PqNJxwGd+6z94jxviDU2fp?=
 =?us-ascii?Q?ispIGhl0nn8FU67lb5DD0JbNl/jD/tqhXs+5dqfP5+y42oUnE8/YQP3DDlx1?=
 =?us-ascii?Q?vQ00LjFvgmztQU7jemK3Xre728iNvpvCETgFZ6Tv+bIHb3k26BH6fZtFnN8V?=
 =?us-ascii?Q?icCD17u1l7nMBIXDY9iSdYap0i/8UTvGrlYAJ/lnbr1QmA1+sYsife6Dm3JW?=
 =?us-ascii?Q?b1jNyt+EnjClK7R5ZF3QhvOFqW8shOBiWJcvGLscCjGpfkY06kTuFjTliX5P?=
 =?us-ascii?Q?/bbHISAgobZKVdVCg9Pf98CBlnMxoPUzxTWJMHukJqtsVE74msR0MHJ+osQt?=
 =?us-ascii?Q?71D7pN1IyvqAyIK6Us1fg0FdZU/z5HQs88AlRnoRNeBtZhAOxLThGh9hr7/E?=
 =?us-ascii?Q?uMD3q42X9pC7CfsUYv3UbcQAIjAWO1rponBcNYSKjVS6IrjwZQRIWqI6WsXG?=
 =?us-ascii?Q?yJkC6EjJoA83dh0lZ0wm/7DJqisLJgA8rqf/ppRREq/UaRS4+u6t1qvoaq9k?=
 =?us-ascii?Q?3Rm399koQwaqxapnftX9Zog+749BUiUSi8B9UCwVfjL2Dsqsoz8iWGQPcIZL?=
 =?us-ascii?Q?boTCviekLbMrg5ZvHqStfg/2ay6kToh5wjxZqdX4TY72I4z174HrjgMkw3Tx?=
 =?us-ascii?Q?/YQnN0464tyUeaGoGIdD+HLil/sOFAJDJlC/Rcl5FlZdm8VmGDhEJT20kDw7?=
 =?us-ascii?Q?ZSlT+GMhMlXwzd/qz8Gzo72nFo6UaAmFphXIIEE5f8FxdGrXA6oY76NXKeRs?=
 =?us-ascii?Q?XrRo6RWlotLdZ8+r1fvt02pBiQAJX7f6rFvqdhqaOlOHwcT+V/FD8dxm7oMt?=
 =?us-ascii?Q?TXFKvTa99ga4FeZ92vjzAgmXowsZR2M/qRMgJlRiY39hn9lBuhOKI9SpdMJn?=
 =?us-ascii?Q?kMYXEej73NEb6kanaErIIyuXy2wfsQ5raFumMIqsEyOYqcj7wIbrhjs8O3+I?=
 =?us-ascii?Q?4l+ap+0bIz4N9ZPaWzFBNAU031XPkFG4cVWaC3izSmcaZ16hupn5KvoHXWcq?=
 =?us-ascii?Q?nFiFewgkPE9XXBDeaPX+7yQy5UBVYsEs2KvLm8ee?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ff289e-9f3b-4bce-1c44-08da57fdaa03
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 05:27:02.1706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGPiPRMjjFu6jsTwblqBxECMQJuaG3aQUpUmEqqQu0+ccPsQR7Zd4XrUlIKFX8frrXu8/1bzo167BzygjposPfHzkv3m8tnDFgz0Uz309VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3783
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-27_02:2022-06-24,
 2022-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206270023
X-Proofpoint-GUID: uHLsulV6pZdKybLnK3XKGFsM9FWGUoCh
X-Proofpoint-ORIG-GUID: uHLsulV6pZdKybLnK3XKGFsM9FWGUoCh
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

On Fri, Jun 24, 2022 at 04:53:25PM +0200, Paul Kocialkowski wrote:
> Hello Dan,
> 
> On Tue 14 Jun 22, 15:07, Dan Carpenter wrote:
> > Hello Paul Kocialkowski,
> > 
> > The patch efeeaefe9be5: "drm: Add support for the LogiCVC display
> > controller" from May 20, 2022, leads to the following Smatch static
> > checker warning:
> > 
> > 	drivers/gpu/drm/logicvc/logicvc_layer.c:320 logicvc_layer_buffer_find_setup()
> > 	warn: impossible condition '(hoffset > (((((1))) << (16)) - 1)) => (0-u16max > u16max)'
> > 
> > drivers/gpu/drm/logicvc/logicvc_layer.c
> >     258 int logicvc_layer_buffer_find_setup(struct logicvc_drm *logicvc,
> >     259                                     struct logicvc_layer *layer,
> >     260                                     struct drm_plane_state *state,
> >     261                                     struct logicvc_layer_buffer_setup *setup)
> >     262 {
> >     263         struct drm_device *drm_dev = &logicvc->drm_dev;
> >     264         struct drm_framebuffer *fb = state->fb;
> >     265         /* All the supported formats have a single data plane. */
> >     266         u32 layer_bytespp = fb->format->cpp[0];
> >     267         u32 layer_stride = layer_bytespp * logicvc->config.row_stride;
> >     268         u32 base_offset = layer->config.base_offset * layer_stride;
> >     269         u32 buffer_offset = layer->config.buffer_offset * layer_stride;
> >     270         u8 buffer_sel = 0;
> >     271         u16 voffset = 0;
> >     272         u16 hoffset = 0;
> >     273         phys_addr_t fb_addr;
> >     274         u32 fb_offset;
> >     275         u32 gap;
> >     276 
> >     277         if (!logicvc->reserved_mem_base) {
> >     278                 drm_err(drm_dev, "No reserved memory base was registered!\n");
> >     279                 return -ENOMEM;
> >     280         }
> >     281 
> >     282         fb_addr = drm_fb_cma_get_gem_addr(fb, state, 0);
> >     283         if (fb_addr < logicvc->reserved_mem_base) {
> >     284                 drm_err(drm_dev,
> >     285                         "Framebuffer memory below reserved memory base!\n");
> >     286                 return -EINVAL;
> >     287         }
> >     288 
> >     289         fb_offset = (u32) (fb_addr - logicvc->reserved_mem_base);
> >     290 
> >     291         if (fb_offset < base_offset) {
> >     292                 drm_err(drm_dev,
> >     293                         "Framebuffer offset below layer base offset!\n");
> >     294                 return -EINVAL;
> >     295         }
> >     296 
> >     297         gap = fb_offset - base_offset;
> >     298 
> >     299         /* Use the possible video buffers selection. */
> >     300         if (gap && buffer_offset) {
> >     301                 buffer_sel = gap / buffer_offset;
> >     302                 if (buffer_sel > LOGICVC_BUFFER_SEL_MAX)
> >     303                         buffer_sel = LOGICVC_BUFFER_SEL_MAX;
> >     304 
> >     305                 gap -= buffer_sel * buffer_offset;
> >     306         }
> >     307 
> >     308         /* Use the vertical offset. */
> >     309         if (gap && layer_stride && logicvc->config.layers_configurable) {
> >     310                 voffset = gap / layer_stride;
> >     311                 if (voffset > LOGICVC_LAYER_VOFFSET_MAX)
> >     312                         voffset = LOGICVC_LAYER_VOFFSET_MAX;
> >     313 
> >     314                 gap -= voffset * layer_stride;
> >     315         }
> >     316 
> >     317         /* Use the horizontal offset. */
> >     318         if (gap && layer_bytespp && logicvc->config.layers_configurable) {
> >     319                 hoffset = gap / layer_bytespp;
> > 
> > Can "gap / layer_bytespp" ever be more than USHRT_MAX?  Because if so
> > that won't fit into "hoffset"
> 
> Well there is nothing that really restricts the size of the gap, so yes this
> could happen. At this stage the gap should have been reduced already but we
> never really know.
> 
> Would it make sense to add a check that gap / layer_bytespp <= USHRT_MAX
> in that if statement?
> 

My favorite fix would be to declare "hoffset" as a unsigned int.

regards,
dan carpenter

