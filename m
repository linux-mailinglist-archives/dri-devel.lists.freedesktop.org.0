Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9745B38B2C1
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A7389081;
	Thu, 20 May 2021 15:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1446F486;
 Thu, 20 May 2021 15:13:13 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14KF4LkH007728;
 Thu, 20 May 2021 15:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=0xYnAIkgh1BwKAYG8Oc0wkWW+OYh3L3q+iC5Y2chTMc=;
 b=OiG/tAlG3jMxr8AB1GMIGTYu2VsY8WzSp//lL8uB20Ui5braFpsgAV+1juYb4qzr2vq+
 YMF5DCyu1LvBZnQwPgvKJ2QS5/uPQAlmxfo3jDa2tumKNnXoFv//UoNWjEeFmv6W6fvw
 rew3ylRyOLMriHIu89o508KE6Js8u6Y05mG6y92StocLJGQBceiI0XUmXO7Fixtyo/KA
 Uf2ziRMpc2oetbppt3nvpwT/fpH/Zaq6V7Y/HPTuIqCZBVHQWb3/dLRqj+kKwIVcvi8l
 +oo25//UA+XS9K8XaoytO9VuIs7H1Sn6xOADiHMRzddO3hfJuLWt1t6yh8oSTwyafEOh 1Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 38j3tbn4ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 15:13:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14KF6ZUB045317;
 Thu, 20 May 2021 15:13:04 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 by userp3030.oracle.com with ESMTP id 38megmm6fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 15:13:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ER6wx1EeSXza1MTKq+gHljXzOKA0t6vmol1oMx85Ri311tR9TVsxnFW/dFHE8KG7CN7FskKRSLy1jV694Wc6M64XUnlZqOLnaWYHWv4l6pp3tZ9IRFtODd2/armmvNNxgBifHr4PJoh1//XKrbN5O9ZWK1TgrQEKjD/NmYDrcN9rhJQ6cTjFPIkst6vLmuuedgpB4RRFQFmK/L1CNJj6xC/eOL+ui3L2Tv39eQKEsuI6uK2g+K2UCkg8n3e4Cti9n6737kTQoALyPLgDrWbuJ3COpHYMX+i/SHFWWEcFLNGrW2WOVJOSFYhXitDH6ZfME+XEKiSVFZ6bYMnhXUS39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xYnAIkgh1BwKAYG8Oc0wkWW+OYh3L3q+iC5Y2chTMc=;
 b=Mpfb+V13PKF+QW4J7wZwbFy3MXbQlj7uPBd+ju9jEC7xOIXl+NanrtI+VLFGhdQQzOzHmC07gRoBcOmtdWE8d32/OzvLi+2MNkG1LYWDsejA6NgBFODsr6nHzff0fMJFqi3aMj10A0YUFC7/qoyhIAsQC3jFrIi+rINoerM0d9IdgTC+eAV6pM/Q/EJI8apJnyQyU+HrbGHYBkUK1zP5PgAnyKrBUieS81xzXBc3oLJ2Jb0Nbp4eX+mxA7h9X0vkoWwm3aKB23J0VnTNMaHRJeG6E7fkJSATdjLW3WnCXDZT1YnNONpROreqDjAlFl/8UfYzWV4A4riChBbWTwQQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xYnAIkgh1BwKAYG8Oc0wkWW+OYh3L3q+iC5Y2chTMc=;
 b=bbEMMJaN9irCu239mSdxcPv5ysHGWwA29reFg0gmjRQvOEOWABhssd3c046l+lOXnSzAW3ZqV6wtJZlYYMTW3ri5Bpd4kh33A2hOIUcS0vNAe3ydUpAHoIUZUzimAZJb72vhWnRoHIcFgPUaU0KqqiH9A33wBYa0dqiWnmjvA2E=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB2854.namprd10.prod.outlook.com (2603:10b6:a03:82::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 15:13:01 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 15:13:01 +0000
Date: Thu, 20 May 2021 11:12:58 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: i915 and swiotlb_max_segment
Message-ID: <YKZ8eqnSnaso3aoe@0xbeefdead.lan>
References: <20210510152525.GA30093@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510152525.GA30093@lst.de>
X-Originating-IP: [130.44.160.152]
X-ClientProxiedBy: BL1PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::28) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 0xbeefdead.lan (130.44.160.152) by
 BL1PR13CA0083.namprd13.prod.outlook.com (2603:10b6:208:2b8::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.14 via Frontend
 Transport; Thu, 20 May 2021 15:13:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bec2e65-0c50-42fe-f105-08d91ba1c279
X-MS-TrafficTypeDiagnostic: BYAPR10MB2854:
X-Microsoft-Antispam-PRVS: <BYAPR10MB28549774B0967373476D1BF3892A9@BYAPR10MB2854.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZ7qyA9WNa07lZ/k4PiGEstI83cNnt/fXrp68X85bEw8atA3mnaFUuPlj641O03PQXJVaMMCmUjuwd8vz9PMvw0BBTHeQmy6reOHiAFRi3GxjwOU0E2vxBY/0L7ju+BAGGi+iXUldUMzdSmOzPzpPeim0GlHf7rr3Yb4+S7xH/aAcakbJIBfaiplrSZIocar+6Q8YBVdWNkxLx6cPpZBG5N/BN4vt3adCaI9sbXGUlLjhG51XxBrxLLL8M5Gjz3hYRJWlD2AKSn0gv8Id7oYpk83/mBKYrItBEmbS1CCrAFiSl01NUDTlw4x1gFrlFnLByU1tIsMgFJdZdQf2h8JXIBTbiklYi3WoadGYfveyrZFA0C5ZlJSk2cRcUQMXKgM7jEhXMYU3hbxjWml3hAKwg20qEEXAXOPMHcAOsspcSlybFVJrivHNcwfq+qztr4ptOLA8Qez1l6G84mulIrhAVbgGDYClVJ9W6Prj/h4cu8G+Lnhkgsg597Y2Us81olrULvxLAUuoKm02iFDZEaL2xfTMVjoxDlGo5baWCQGEkfomJ0aIA8XjSwA3BFfnYmWY+PPEgoenFdFd9zACVWgvX9iBBEsSPMxmytp9NSnD2o5A/NoYLDnKXOezGHATqo0l3e82dbXhicKkLuZ7Lp9XQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(366004)(346002)(39860400002)(376002)(66946007)(66476007)(66556008)(7116003)(52116002)(38350700002)(8676002)(6506007)(36756003)(6916009)(478600001)(7696005)(38100700002)(86362001)(2906002)(55016002)(26005)(9686003)(8886007)(4326008)(54906003)(5660300002)(956004)(8936002)(83380400001)(16526019)(186003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PWwOblGWJzn/N0HB7aeOhosDlb9WUZH6L6VVwFh6rMnvDwXBHwtlmcCKiUOn?=
 =?us-ascii?Q?7N51wqbBfmONiZf3Yr6OxVR9PBTfeGVsBJIlhhVkfVefBha4vpEMk9DYHzrr?=
 =?us-ascii?Q?qfcaSUkGVtEFZ5aJ647F4MU0UzLSQsk7Y8H9tUFbgfsEol2TXlRhrQKesuwA?=
 =?us-ascii?Q?o3umwuoPVFkylf8x/sUggRlvU9qzqTwibwzaXKZ9YuU8WM6qLss55d4KGdwb?=
 =?us-ascii?Q?jyOUr+o1BoaDbXTOQiIRQx0kMWFQUAwOZzW3Y86rXl5VoM7UZB/zGCk7jBVK?=
 =?us-ascii?Q?QqF8IcsmySuSHNGD5ElS7dy1tPCCwFqr9uZd2GLCSaVapwlL02bv2BG7ua3S?=
 =?us-ascii?Q?PvSaJAw0XWantQnURdLux9+YqOgIdVTEwwBLxBT+HUHSdp47EZEm0GuXUkth?=
 =?us-ascii?Q?O4vFe9tfIphHsc6BOulN5Kip9ywyjWDrDEtKZIUCizhjXLt4UEwGJ3zBqo9S?=
 =?us-ascii?Q?eZkzq5eqtu06gw9J5KBvvZ0TxfPMvSycN35DJv1KvLjsfN9/mhsN7BvyyRFN?=
 =?us-ascii?Q?3L2L1GZKFGf0aos/WVqas0+sodiDTReTiZzrQR/64jesh/Yv0BpIWTvQ7nH4?=
 =?us-ascii?Q?+f9L3S4yhLenp8KOD4DVAU5W4qfm6grdn4XPnaQuaPBvBXInY+dSQ/o1LBxk?=
 =?us-ascii?Q?7QB5ocxOJpG4kRanmWlilcD7f/f5QfOBAM9p0Ar2uVIx73U9Vffkg2tZYaJV?=
 =?us-ascii?Q?+WZyojftE13r9C5OHmPOBEU5KZGQUY4euzm9P5PNnXm9odM6IRhU4+a0Ujjo?=
 =?us-ascii?Q?aqqdkxNNXa5za8SkZZiOJLMsZqZJPPq7hyjzy1h11MEGcvR28M2bBQ/rE/J3?=
 =?us-ascii?Q?N5roQx1aGRG4p9RosUsGTeFKrWg/i8PnxsOakDVIqIeplx7EEFXGAFQLRwZ2?=
 =?us-ascii?Q?ZAa4yn0VheSLAYw8kiP6d3m0cgsbyI4jJY0hzJV0GS9SwG4CbB/rOOcAD20J?=
 =?us-ascii?Q?1vcoh6kx2wH2G5afGxSyDbfcg33xq7WKV16/p3WRHhmlotbzPDVUOW4530aT?=
 =?us-ascii?Q?621xCLz8pDs3n7XBa3B7J7dzWPGmUC/94Ctc9ZzVlwB2ecZgwFJYtsfMJc6N?=
 =?us-ascii?Q?WxyBnGV4ugXiMwyd9bnLQlkSt1fjLGqibyB3iyXA3AA3v6vfvAw5Qn2Mk1t1?=
 =?us-ascii?Q?1+tBKknbAaV6jLeqV4dCCTSJpEYg5EFMD4vGijeNxKigWo3sqHQtoywlx70+?=
 =?us-ascii?Q?QbKBGuC9vJ+fU/hpdBCdcayH9LbYpvBmg3j73/+/lD/mf3KfXv1F3YVQDW6S?=
 =?us-ascii?Q?IVr/9cpiMi7DmHyQEfTl7u9fSktY0Bvfbnrz8IPESBpCQRqV/MlGT+wj1Xt1?=
 =?us-ascii?Q?8T69yxuWv696VTCpzSm7eYAg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bec2e65-0c50-42fe-f105-08d91ba1c279
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 15:13:01.8560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHFzwvEHBiZFymr+F+jt0Zk2jdRVjXxu3AQepinPQTXI6HGe7wYEv/ztIoAiS1a+MohB7D1DJSuBkIPYMm/yVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2854
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=949
 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200103
X-Proofpoint-ORIG-GUID: 20DwqjZ89jcJ-n0SnR2-YZPFd6wo8Yaa
X-Proofpoint-GUID: 20DwqjZ89jcJ-n0SnR2-YZPFd6wo8Yaa
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 clxscore=1011 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200103
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 05:25:25PM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> swiotlb_max_segment is a rather strange "API" export by swiotlb.c,
> and i915 is the only (remaining) user.
> 
> swiotlb_max_segment returns 0 if swiotlb is not in use, 1 if
> SWIOTLB_FORCE is set or swiotlb-zen is set, and the swiotlb segment
> size when swiotlb is otherwise enabled.
> 
> i915 then uses it to:
> 
>  a) decided on the max order in i915_gem_object_get_pages_internal
>  b) decide on a max segment size in i915_sg_segment_size
> 
> for a) it really seems i915 should switch to dma_alloc_noncoherent
> or dma_alloc_noncontigous ASAP instead of using alloc_page and
> streaming DMA mappings.  Any chance I could trick one of the i915
> maintaines into doing just that given that the callchain is not
> exactly trivial?
> 
> For b) I'm not sure swiotlb and i915 really agree on the meaning
> of the value.  swiotlb_set_max_segment basically returns the entire
> size of the swiotlb buffer, while i915 seems to use it to limit
> the size each scatterlist entry.  It seems like dma_max_mapping_size
> might be the best value to use here.

Yes. The background behind that was SWIOTLB would fail because well, the
size of the sg was too large. And some way to limit it to max size
was needed - the dma_max_mapping_size "should" be just fine.

> 
> Once that is fixed I'd like to kill off swiotlb_max_segment as it is
> a horribly confusing API.
