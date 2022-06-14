Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579FF54AFEA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 14:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E949310EC50;
	Tue, 14 Jun 2022 12:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B454A10EC50
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:08:04 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EBYHFQ014666;
 Tue, 14 Jun 2022 12:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=CaaoGWXgTNt4LfXwUDM3lLNArIhSZy1LtjjThxPJUfE=;
 b=kXrn5Jdv8xXfxAtpLyjUkflUH6CJBTKbPRK+Aw+5dGg/p4ZynOnEAj6UPokTrlxE29b0
 PwjY8EMD4asiL2GHqv4P6Tlyx4JKTYORY6y0QGYHObunWJlG7VMeFRLgHP54SIGrNmwb
 AneIxjiyu/o6D5uFxNFcOrKZzB0sWJMY75hwF/ZEcYlTeG3l2+D0hpkDvKG35EMihXuX
 ZgwQRzIKvkh57mUEbgd9dhPlSk6+E+PjHwrX/e4qhjQikmlVrF8mCjuWOeyniACUhLLo
 IHdks947fcBqJAMxq9s6XZpPCSSHJQAPPtWDjCwcuQqOsHauW4KWZLSLQoqJBcwftGxq YA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2nqpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 12:08:01 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25EC5qk0037861; Tue, 14 Jun 2022 12:08:00 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr24k18w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 12:08:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RO3YD7W8oyIoi0aeWOBxz9mJvlkKk1PNH1gBBJPKen8+baiyeMcefzOB9qyHaf9dssl6h9mE3tLSJ8OnuRjOt8v+jV47G7KNJp5Kdr/zJIBNTLdcyM6/Ie+3uFRp7/hZO93BfiW7CgWfoUxWGMx0qsswYh7WBqR+q5MMeac7anukBxbuvhKN0HStMxStsuHD49zkXdSNCyZOz8Lgk0arnn7QAYaDKPpRk3V4HOiDPqp9Kbjfr7pskjEXn6sWhiwcP6NdzysSCiEtrW1dudPYHnm0ZvX2iNh//d0QUgGtg4pRLB69wM9asb94e49WHvJsSGp6C7L5jc9jLMhZ3M4Zeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaaoGWXgTNt4LfXwUDM3lLNArIhSZy1LtjjThxPJUfE=;
 b=XNGrD7GUmgCZ+FIEnOXY3bA2jBexrk+M9Otw09w78ZYLZHfsxI+Y2c96mhTYVYIumxGW61LtlNW/BDPN9le+nK6AbGTkJXGUtFzYh66wA9Kpw7nutkNuYqQoyrY4vxzBbaJhgpr73YBmSiaJmzt3vmgX8cU2Z+6Cod9QNPOMJMXx99fv2HzcfPoAMSjRL9zkjJN29e8QTKeq375zfdtHyu6fO3RjmRbVWuuRzf3cqgw90VgTKvJKerfSEsOVS32WvrBWdTc+oZRNqZ80+urTu5O3FaSNj1ZgmMSaxZY2ys15vo6U6HrwcqKrXo6VxHVz/1gBMd3gCtr7E8uqPEWuXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaaoGWXgTNt4LfXwUDM3lLNArIhSZy1LtjjThxPJUfE=;
 b=xphEtidUXTtCivqKHfm29Ybq9OxIvR6//y8/cNbCoMu8DG1Z/fLsiKlblOLoI541aXxt9xwN48L68EqLxmzC52UlBgeDvQ6Y0tB4RNMmBrCot5J9BrDqikfWVsgEzuZj/tC0ysoEFGrgXaljfKzFcIKXXKzHIYpBxFRgwPpwxGk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1482.namprd10.prod.outlook.com
 (2603:10b6:3:c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 12:07:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 12:07:57 +0000
Date: Tue, 14 Jun 2022 15:07:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: paul.kocialkowski@bootlin.com
Subject: [bug report] drm: Add support for the LogiCVC display controller
Message-ID: <Yqh6ErANSTEJpfvl@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae3b28db-7065-4440-46a3-08da4dfe84ee
X-MS-TrafficTypeDiagnostic: DM5PR10MB1482:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB14825F2FE3609DE42FACB3468EAA9@DM5PR10MB1482.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h3xwmsX4/tLj84U2IiVC13xiqV3mQ0n3y2d0Qrdam6BPEUCWzU7AG6hihAuk1BZ6sw7H2GZ4SdQJgR037m9aT3KcET1kQezMl6kjLM+xlgg4dpmFz8KC8sh3lqha0O8500KPAm96ol3/wYz95M6Ic8QKpfe1cZ+JkMzxPfrsOM1Fnq/W5REuAZ25N3U0L0ll4248IoDc+b4aaz+2cOIwhWaF30do5aMeHeiom3oSALOLmOoei5Ol2x0RLUb31vUHQKs7QJMAWxEVqyg02QzcufcHE1PRH3BQ3MVF3JERmdCWb7R+7C+APTyllng8xYCh9UeNM1QvbGw8aR6cZd05R1J/2dhkQYTydgpaxbSSFl+4z/Sv8FsibT33eFG60YGnXliUcRujxA3V47zvLJDySPpcxaXEq4+hhvD9MaH5iRhRYsxRRFtt4Qt+r/DKk0u79wvigh3U0pa9pHeehtfD64EZwGSkV1VRlvxPbrtsXNXSSv0OtsWtnBY/fvp37nCPIVuG45MHKbSdV0iX1obK623MELrELDXu9qWrtoXyCNn+ah4C/pB9qzXSUcyPO1eyC+4dBJb236MMS42UM6SkI+G0ywehxCiWG1mZxKoc5IsvjQa1BHMOZUacldm7vWv0VC0CloIbcq8IcY0/5BJSXrjXxTxTjCD2iGQi0fUCcnM1GUd5TfPpINxisdENi2xu2fXDFbIJfJ9uN0QQ5ZqNoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(9686003)(6512007)(52116002)(6486002)(26005)(6506007)(6666004)(508600001)(33716001)(38350700002)(38100700002)(186003)(86362001)(83380400001)(5660300002)(2906002)(66946007)(66556008)(8936002)(66476007)(316002)(8676002)(44832011)(6916009)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?668gmMU5grp2dcbNk/ATxswmSCiTYGTcLH/eB8cyFrp8E6vPZ0rQVyH/1Roh?=
 =?us-ascii?Q?9Zi3xmEJpb+rtjeCmpHMYF6ZY3Q8QMwBFrLXbM5xpm00UQ12hjnV0NjO80MW?=
 =?us-ascii?Q?S6eNlS6/daJzN0PYMURhyrxz6zlm80+S1OAtKT5KHzps+iqCl2/UKXotEeAE?=
 =?us-ascii?Q?26dhhovugxJlpJkdBVSWqhoLW1zgj41GDvHFcDsIWpSAp+HbX/SKqSsK1P/n?=
 =?us-ascii?Q?U/8+NpuBXv+Mt+rYDLih5Pt/OZP9gKSlOZ8PlyEYdikSjzVrE5QVn+09DkPA?=
 =?us-ascii?Q?bwIDNdz12f6xyCLTpZUHWRHTtKeoySilyjexJw9yFa29KyyuzdKIkGtDddMH?=
 =?us-ascii?Q?9qsrxL/eRuxkwr++9k0G8160jz2GPye3hHMCRUAdxh8qmVpGt8+xsv0SLR31?=
 =?us-ascii?Q?wI2Va/yr58px9VEhIHz7UXmP5ZVxE270CaBaYOtKhp4ENOHBsjBTfv1UmcRV?=
 =?us-ascii?Q?vtrEzhzYo772fZmXMKdyvQPxAMpOqEac2azun2pHqqII54XocjMobkMJIE4b?=
 =?us-ascii?Q?Gy++DguDE1dHBE3735jBbb/7xZOJlzg3d1MC4k+fvvkwU9IqDMJ4d8sacgKa?=
 =?us-ascii?Q?yHk987+Qyq66+CEHRL72Oitj+1Onn8UnakTXqpGRMJvZ5qkQIEa0+4db4yM5?=
 =?us-ascii?Q?hIidIlS5pnmASiZ3E/ib0lMDN13vN1TmKiKr6Z8vCF7fTk9EJIgr4Qd56Fdv?=
 =?us-ascii?Q?qOTJ3hW1JrD13YmMelVY91s5w6xVNPOsAcsGHjlcGG1wcmM5UTzDzPAW3xOL?=
 =?us-ascii?Q?y5CGg3CYZIUtEfNCK7pGbJaoTxUC8bnw5RPo7lygRPk2CrX0a6NcySqzBtnT?=
 =?us-ascii?Q?dKrlXA1rkws2VfLtApijkAHWK0vwH0nr/UubsKJ+x7J70ffWGbAHxvEbiW5i?=
 =?us-ascii?Q?8F/6+2q97Y9J9K8l1H9G/PprnG4AoTNZdKnSKyQrr31zXjZ51iw3EAKLEjSu?=
 =?us-ascii?Q?VyCQTQQRPtr5pOlrFj/COkFxp1Di/S3+1loqTWZv9O5ZnqWjekEkGIshIfUJ?=
 =?us-ascii?Q?moUfoKXhSq0Q3gum2tweKD0ldA9BbZE69kbBwty3k4ktpMWccQ6KvZ2XwSV5?=
 =?us-ascii?Q?B9ZKgJK6YEgP+SyCnoXp6n5Pfo1ll2Ee+IPQWqL8y9I6t2vSk5YMIk59aFsM?=
 =?us-ascii?Q?BqIx22byodSxj24Rx/OfQiHhSZyexRf0u7Z6YhxMhKsdgkzqI6vHUd6qQRzN?=
 =?us-ascii?Q?InIFBPTo85xFBe56xbdixNd+h/atEcbg1U1jypIXV9oA0QqNUjciqgj1L6r3?=
 =?us-ascii?Q?kQRyKTSum2p1zI+Jn4LJh8J1f6QSF/hJjT8djtwZNnev1DTdcoo8m9pt7Q1y?=
 =?us-ascii?Q?gzvQ+CVBYoB2NTygrEYb7oMb6xa4uk60SOd2EpV9b7zu2mD+ebePsBrRvG46?=
 =?us-ascii?Q?s63gIJaJD6ip7DB1Oq3fIXRl+K7mEcmGfwzj8bdp+P55wHJskuye51HVcGu5?=
 =?us-ascii?Q?f6vzx5Va0KszJLma01fbdlNbZttC8OX0mHmphB8gy3odHisvhKlUzK8i+24d?=
 =?us-ascii?Q?QfbURCqgzSyIiZFcfY3OD9FFKIfAAV00Uv4uzRlJK2slcmUFWhKqteJ27kWT?=
 =?us-ascii?Q?BjgxyfknrQ227U7UgUzwNBm56PPidrgj/f7ECjI214klYVumXYCzoYziwpvD?=
 =?us-ascii?Q?iW6gCIrcJIAp4VMCzZp3IolPu62m+iD/4PBwbR7S352TPo0LRxUMBtDerdte?=
 =?us-ascii?Q?YIcIPl8Lrxm04AFgmNrcpC4SQoHQYiKzTM8/X1jKD7JhiKvo+1H4cu/e/rdq?=
 =?us-ascii?Q?poxOtuaxXXAJoKkhfJYTgFD8xTCTpec=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3b28db-7065-4440-46a3-08da4dfe84ee
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 12:07:57.7336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIM4WR3Bq20oGn+TJOBFMwZgeFysf5HNmcqflmTUMf9Qqm1otStyBEELdko/TijwJSc1Ndp1xc/49+fMAjjtnbyOgvKDBd6VQdl6+Bil3rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1482
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-14_03:2022-06-13,
 2022-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140049
X-Proofpoint-GUID: b8ZadRoZLAPVD7uiS57rRlGth9LuhBIp
X-Proofpoint-ORIG-GUID: b8ZadRoZLAPVD7uiS57rRlGth9LuhBIp
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

Hello Paul Kocialkowski,

The patch efeeaefe9be5: "drm: Add support for the LogiCVC display
controller" from May 20, 2022, leads to the following Smatch static
checker warning:

	drivers/gpu/drm/logicvc/logicvc_layer.c:320 logicvc_layer_buffer_find_setup()
	warn: impossible condition '(hoffset > (((((1))) << (16)) - 1)) => (0-u16max > u16max)'

drivers/gpu/drm/logicvc/logicvc_layer.c
    258 int logicvc_layer_buffer_find_setup(struct logicvc_drm *logicvc,
    259                                     struct logicvc_layer *layer,
    260                                     struct drm_plane_state *state,
    261                                     struct logicvc_layer_buffer_setup *setup)
    262 {
    263         struct drm_device *drm_dev = &logicvc->drm_dev;
    264         struct drm_framebuffer *fb = state->fb;
    265         /* All the supported formats have a single data plane. */
    266         u32 layer_bytespp = fb->format->cpp[0];
    267         u32 layer_stride = layer_bytespp * logicvc->config.row_stride;
    268         u32 base_offset = layer->config.base_offset * layer_stride;
    269         u32 buffer_offset = layer->config.buffer_offset * layer_stride;
    270         u8 buffer_sel = 0;
    271         u16 voffset = 0;
    272         u16 hoffset = 0;
    273         phys_addr_t fb_addr;
    274         u32 fb_offset;
    275         u32 gap;
    276 
    277         if (!logicvc->reserved_mem_base) {
    278                 drm_err(drm_dev, "No reserved memory base was registered!\n");
    279                 return -ENOMEM;
    280         }
    281 
    282         fb_addr = drm_fb_cma_get_gem_addr(fb, state, 0);
    283         if (fb_addr < logicvc->reserved_mem_base) {
    284                 drm_err(drm_dev,
    285                         "Framebuffer memory below reserved memory base!\n");
    286                 return -EINVAL;
    287         }
    288 
    289         fb_offset = (u32) (fb_addr - logicvc->reserved_mem_base);
    290 
    291         if (fb_offset < base_offset) {
    292                 drm_err(drm_dev,
    293                         "Framebuffer offset below layer base offset!\n");
    294                 return -EINVAL;
    295         }
    296 
    297         gap = fb_offset - base_offset;
    298 
    299         /* Use the possible video buffers selection. */
    300         if (gap && buffer_offset) {
    301                 buffer_sel = gap / buffer_offset;
    302                 if (buffer_sel > LOGICVC_BUFFER_SEL_MAX)
    303                         buffer_sel = LOGICVC_BUFFER_SEL_MAX;
    304 
    305                 gap -= buffer_sel * buffer_offset;
    306         }
    307 
    308         /* Use the vertical offset. */
    309         if (gap && layer_stride && logicvc->config.layers_configurable) {
    310                 voffset = gap / layer_stride;
    311                 if (voffset > LOGICVC_LAYER_VOFFSET_MAX)
    312                         voffset = LOGICVC_LAYER_VOFFSET_MAX;
    313 
    314                 gap -= voffset * layer_stride;
    315         }
    316 
    317         /* Use the horizontal offset. */
    318         if (gap && layer_bytespp && logicvc->config.layers_configurable) {
    319                 hoffset = gap / layer_bytespp;

Can "gap / layer_bytespp" ever be more than USHRT_MAX?  Because if so
that won't fit into "hoffset"

--> 320                 if (hoffset > LOGICVC_DIMENSIONS_MAX)
    321                         hoffset = LOGICVC_DIMENSIONS_MAX;
    322 
    323                 gap -= hoffset * layer_bytespp;
    324         }
    325 
    326         if (gap) {
    327                 drm_err(drm_dev,
    328                         "Unable to find layer %d buffer setup for 0x%x byte gap\n",
    329                         layer->index, fb_offset - base_offset);
    330                 return -EINVAL;
    331         }
    332 
    333         drm_dbg_kms(drm_dev, "Found layer %d buffer setup for 0x%x byte gap:\n",
    334                     layer->index, fb_offset - base_offset);
    335 
    336         drm_dbg_kms(drm_dev, "- buffer_sel = 0x%x chunks of 0x%x bytes\n",
    337                     buffer_sel, buffer_offset);
    338         drm_dbg_kms(drm_dev, "- voffset = 0x%x chunks of 0x%x bytes\n", voffset,
    339                     layer_stride);
    340         drm_dbg_kms(drm_dev, "- hoffset = 0x%x chunks of 0x%x bytes\n", hoffset,
    341                     layer_bytespp);
    342 
    343         if (setup) {
    344                 setup->buffer_sel = buffer_sel;
    345                 setup->voffset = voffset;
    346                 setup->hoffset = hoffset;
    347         }
    348 
    349         return 0;
    350 }

regards,
dan carpenter
