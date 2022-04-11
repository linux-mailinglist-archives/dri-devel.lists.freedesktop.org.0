Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4CA4FB642
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 10:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F370710F763;
	Mon, 11 Apr 2022 08:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C85F10F76C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 08:43:04 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23B7dmnD029074; 
 Mon, 11 Apr 2022 08:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=THljS7IE0rHClMNsGiAeOItb3wQqnXaZUkV88izLPeI=;
 b=Nl1P6eoe8km2NtkgnsUNEvNFk61mf85NUbjxZWMdLP2bI+3cmNqu2g2pBmo/IRF8dFKC
 JeKMXU/5Z5N2AWrbG49r1JJ6gxUe1rREviBsiljTsUd5IfO1aokfhs1NRpL/PDM9Y+e4
 ZIG4UbtcpwNFxf7n8HJffaxzo1VjhnveF8dy+1512Aj4ORwjAZiu2/5/ih2SwmdG9H/W
 uEk6uj75387kUyYCDedfmglm9TvduBY1KMu5+1R+JDuY8necRaa4lqzcgjD/Wj7KXChC
 jFOq4XqjIUARgNhT0uFa3l08RGVpQnmUXROobihYffO+CKZzrmpYdKgMlyZ2WrUpjPMr Dw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb1rs2xr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 08:42:53 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23B8fIYd024947; Mon, 11 Apr 2022 08:42:52 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fb0k1gj11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 08:42:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1XWtw1xz/aOy5/A8kzl+897HHnm+nbcHxcuftI+9oaB7zxEJ3TZdHIkmkv8/3EE/Zi1RVfzbMOAlgIuNhxpCfi45BYwVd7PX72y+jw0niiT4n2lS57wCnRLlzYAzNrFtFdXgjyZRtHgPaQbguIKILcFrWWVNsBQYL18pFJxz9n2uUUefQYa6dM3bTuZ3pY01VDS0NnHSwUoB6APQo1HFf7IWHA+L3KYNJllvSV80lzGi5LYMv1grFJXoF9KcyseL/IuVr5UeThRBPPnDE8u9d//ulOKjCJmYXw7qD2SVqMTkeIuQ6yRJT5ywxvDZR7quVE7XDPQ8QCnkOAoshEUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THljS7IE0rHClMNsGiAeOItb3wQqnXaZUkV88izLPeI=;
 b=FTOSQCIPM9H/01E+m4GTdoT+Skua/Pzc7XqqiPAWkzhTPNFrqoXguZF+RAdaRAH2DrAquPcZAZhik31loSE11v7qfv47/m6h8tWhwXPFHiJmglqG4N9b/ipguInMTmpzopTttwOkOESDglY2rbU5ubwaaeIGsYlg2azNRx4/laBmOpf0F7TTJ2LX9B6PcnvSiXd7In5zOIN1NqS4S684KEgj57HsrfWfkhZ60GVpPYTMOG6pqokIUD1nY3fg1xIjSx2sQOyH/zkUs5I/iKMK0hGC0QVeyLGMbiJEsg8R9bcD2zJuOHZopDmOeYeCQy7381HzSEslkwNwzE3UVNDTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THljS7IE0rHClMNsGiAeOItb3wQqnXaZUkV88izLPeI=;
 b=Rrybs21Rz72lVjfR8BpOUViD/D1ASh5idmi7gIs6gQ3l9aKhnSGyy6oNAG5Il42m1gkebevrR/pgQyQ287Xu+OnK0lL8a06Au2An5hQcVknCCa2NgOrJ50aGkxmXSmhfkF5NHq12yNB8az+HPUb1zcCo4IrPoAhuBUWAw+NheLw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3194.namprd10.prod.outlook.com
 (2603:10b6:5:1b0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 08:42:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Mon, 11 Apr 2022
 08:42:49 +0000
Date: Mon, 11 Apr 2022 11:42:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: mxsfb: Implement LCDIF scanout CRC32 support
Message-ID: <202204111055.ETeht46W-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220409231040.344801-1-marex@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0013.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::25)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 255d9587-df7f-49f3-953c-08da1b97423c
X-MS-TrafficTypeDiagnostic: DM6PR10MB3194:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3194C9DA746107D6F9C2BE728EEA9@DM6PR10MB3194.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l9MpdKBFQS0jOFIEu8k3E9p/kpk0tYu5BbAk5i/E+EOF+u4EhM65qyqHqLkgH1qVup4jRqMoGEGb7NUyDm6l753KlvsUk9GnoMreIrUIs7uDQgHiGewVBJR1KUiejSEjn1Pfb8fNDO7OxmsGFIkNLC88T1otsvvUPeSTL9tZPf9D6E1tBv3DC1qQdJ+je+dQxdbklj1vBzy5T/3uvaxjp5KfLhtcaNSC7WsWG6zULjlE3TwlzRfLnnGeTJCPyA0quAaI8zhEIWKNjJxzI9NsxZLg4hEm2gCVdYp7xl4TiAx+okztAz4LgQSjXkcGkpJFSKaj8QBlb840h5iMqL+otyOUQ9J5yJaWyOFa32dyHqu/DZJ35eu3BnfxtJhqF1gaQCFasHaflbp94S0rJ6WAnD5Vke8+WnG3UXu2IN7IY2Rn/ZAvua9AjSZ5jKEGNreXrVaC+pK0ZZ/Wwck655ooBf62HU9o1M/A9mv3wIaUfJ1nGzF47BJ1z2fXtw/Bz1JOA1mTFEkxFksC7m2Hiqn8t7BdvriHKlLPVyyM6XIxFVNJkLqDBzO7bMew3Fqg9EcbQ/bJV3DAtSgPNrfHo+OeLlO+EZj16WFBJ8uYYHJiMAwmbAPUnXDp7u+nodDnbJTOP4gUtxUn3Iy6tclXxOQAyHh8oCrW/DOpFNJm07z/2hTQ34aNDCejZIuwaU2z2PB8eZjUAroD4qkSK8Utus9jkdU+9XMIQLKjrIsHYEWAHC72z2yLMlTMrZbQzZr8lEFS2Jh0WuMC48cw+5aOXmoevkXqR7FWPwqusWzeSghPwOAhByHaODpJ7/HWu5CA26e5Cn1Ne9ty/ldY6atKaPnnkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(6486002)(508600001)(5660300002)(44832011)(54906003)(1076003)(186003)(8676002)(4326008)(66946007)(36756003)(26005)(66476007)(86362001)(66556008)(8936002)(7416002)(2906002)(83380400001)(6506007)(52116002)(316002)(6666004)(9686003)(6512007)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cKs2II48wAvfkywwexv1w7uTPduqKFC4oWbRiBTB17f1oJ6/DyzaINV5ybJ2?=
 =?us-ascii?Q?75OmL2QoMvhewKTjfDRFjG1pswJ8MFEOah5UCu1iPB5TaB4KtBhJKuFWN7mn?=
 =?us-ascii?Q?LZaHUuIhiG5XI7+C7uQkHP4CqInib+2XtfqIiHkMdKAR1ZAjDozhJ4aDnT+I?=
 =?us-ascii?Q?oa2n+gbBwHdVP9V1QFuTSbWNg2KZzI5zDcb32TTzkVJBLnwRGdnXe+L4L43+?=
 =?us-ascii?Q?KlaI4nZVRs2YZX7KIAC3a9s+4hGud+bSkS+PI7y/u/smiP5RVb5PMarwHkho?=
 =?us-ascii?Q?KWDBUvIFup4leQN0H9s+wVDne4lyr3iQWQ2iNX0hPUITE9RIoeJwUAXorbwM?=
 =?us-ascii?Q?rZrJpKtGNtimNfqLHs3YGSKh2TIGnhGwrPZpH/cDSZ/p5Rf2GjqLmjoD+shz?=
 =?us-ascii?Q?aUBj3C3gmxYV4pDhwFV9x+atnY193Zx77Tgyj/pZ+npwnzsWEDVwwQHEBI/C?=
 =?us-ascii?Q?+rDZCh37ThIWgAJAFkSm8euA3h5wF/KHvtC+LLTY9wYeCRYhlY7MzydfkOS9?=
 =?us-ascii?Q?fztkdzdgFiinLXSakn6n5Xm+e4Mm67EAjHWGVIiaRSyMITMloh+7PC6oP/fo?=
 =?us-ascii?Q?/AYwsNzhuwRxH+WmQWDX2+EUXa7Vj/JUh9WW4n3ZDTqk/O9hfDXOOrkMIqQQ?=
 =?us-ascii?Q?kS5yYu8Ix+18t1cVaM21w9WA3aqv3ftQunvqII09UJn6eWjz5l7k+A5PbVHT?=
 =?us-ascii?Q?wDDLnfcyvp2GRK8gf8IGtZ+Nw7DJtGfKW2eaor8SaNEPWv+4L+ANldNQwOwG?=
 =?us-ascii?Q?Uy51YGlpLuQlYf3D/6sra3ycxO+dw/7EtMi+bGk9O+ySBbjwnotVKJpJC+H0?=
 =?us-ascii?Q?qzVZnAbxiHdvS9d91G/Ri0uLNOgvOQZNh2hffbQoblky5cxfVrrO18z/rz0T?=
 =?us-ascii?Q?GMa/2GEV0Jk5pX2jPiBDShyBx7eMlkmREaZ9uutqzCO1aXxRqQcour9HTysQ?=
 =?us-ascii?Q?DS4sT0UzeTaR4meH/v0ibBgj6S9GWlmbV2grayUdhNCHYggEU5JU3TcbMvVg?=
 =?us-ascii?Q?9PdrO8pGd8qnbOsZi/xjp4FyF/InZGxpjNzjF1G1qb+j5a6bTyGRNSJDNxf5?=
 =?us-ascii?Q?7Bpc/FSBymvdcp6IRPCIr0DHVXV1UNxwFoz71V+y/4lXDAip3EoqmNZ7c6lQ?=
 =?us-ascii?Q?rcPPIlXaHMyYBQsaQHxL5g8vdxL5rUQ3NGQm+RvsYlnzuxvv3R5f3AbUW7Rh?=
 =?us-ascii?Q?Q7gXapP3xwznZJpWGeL0Jq3QLEoipF2gQfLuUJhrT39qmONohsPtFezdyxL9?=
 =?us-ascii?Q?XSPvInJsmoHNoOil1MXTnizQ4ReazIj4wbniH+378c+y6yVLlTerz6E2vLNr?=
 =?us-ascii?Q?J6s5XICy7CvMz945d1oUw7sC2r6SVjZyUa5GGKncwD1Y5LtxBCSsBikaYH9S?=
 =?us-ascii?Q?DPebdReLgKuaXOUYoCOB6hMgQmNnTVXqXZCrCsbNXCYy4yShcWNgdD6/Nebz?=
 =?us-ascii?Q?+kYJbcnyZLnFSDH/u+nA32vibrbP+KoqsrjF6L64oH14OtwMlfEJ4LzZiwrI?=
 =?us-ascii?Q?gCBPmel/ByQ9OjXQ14AXOLVC11BT/LL/3UkI9QM4XFVncYTeYwOP8sgMKFPj?=
 =?us-ascii?Q?gR0ZL9ikSxfZ8HPw++WY3dUlmxvtRyL9/0UIjMJg67B+TXVONugxMaqudoeX?=
 =?us-ascii?Q?x10r/sO3ZphWIQr0yiX5mvLmDrpmqsQyN1+HeouSMB4VIrQ77zUS4lWKjPQr?=
 =?us-ascii?Q?TKoE0GmezfGpFr09EbvwX8ayfsZwxBKEqpQRHsNsHVrtVqrqdFvbTpR6bWbT?=
 =?us-ascii?Q?fO+XUe+I5vlOSnT5XSI7gAL7wlbB/eM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 255d9587-df7f-49f3-953c-08da1b97423c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 08:42:49.6155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ok+6ZAOQWwbcQ1+qgfaI/O0gm1UXpBkEJZcbE3L3JMOtdC2nt8v38b4cY6RoC1d856okw9/pnPqxusuzDMPq38doi+yB5hZEBrIvCkwJrcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3194
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.858
 definitions=2022-04-11_03:2022-04-08,
 2022-04-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204110048
X-Proofpoint-ORIG-GUID: euYts9bH-fBCM6VGzI1UFSszm7VBTSzR
X-Proofpoint-GUID: euYts9bH-fBCM6VGzI1UFSszm7VBTSzR
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 kbuild-all@lists.01.org, lkp@intel.com,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/drm-mxsfb-Implement-LCDIF-scanout-CRC32-support/20220410-071222
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-m021-20220411 (https://download.01.org/0day-ci/archive/20220411/202204111055.ETeht46W-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/mxsfb/mxsfb_kms.c:444 mxsfb_crtc_set_crc_source() warn: variable dereferenced before check 'crtc' (see line 442)

vim +/crtc +444 drivers/gpu/drm/mxsfb/mxsfb_kms.c

5797982b2ba894 Marek Vasut      2022-04-10  440  static int mxsfb_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
5797982b2ba894 Marek Vasut      2022-04-10  441  {
5797982b2ba894 Marek Vasut      2022-04-10 @442  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
                                                                                                               ^^^^^^^^^
Dereference

5797982b2ba894 Marek Vasut      2022-04-10  443  
5797982b2ba894 Marek Vasut      2022-04-10 @444  	if (!crtc)
                                                            ^^^^^
Checked too late


5797982b2ba894 Marek Vasut      2022-04-10  445  		return -ENODEV;
5797982b2ba894 Marek Vasut      2022-04-10  446  
5797982b2ba894 Marek Vasut      2022-04-10  447  	if (source && strcmp(source, "auto") == 0)
5797982b2ba894 Marek Vasut      2022-04-10  448  		mxsfb->crc_active = true;
5797982b2ba894 Marek Vasut      2022-04-10  449  	else if (!source)
5797982b2ba894 Marek Vasut      2022-04-10  450  		mxsfb->crc_active = false;
5797982b2ba894 Marek Vasut      2022-04-10  451  	else
5797982b2ba894 Marek Vasut      2022-04-10  452  		return -EINVAL;
5797982b2ba894 Marek Vasut      2022-04-10  453  
5797982b2ba894 Marek Vasut      2022-04-10  454  	return 0;
5797982b2ba894 Marek Vasut      2022-04-10  455  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

