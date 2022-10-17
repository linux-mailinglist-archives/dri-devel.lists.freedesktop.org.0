Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAE960155E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033BE10EDB7;
	Mon, 17 Oct 2022 17:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB0E10EBA4;
 Mon, 17 Oct 2022 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666027805; x=1697563805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mwZENXELYAaYW1gD79AGURcDlwoGqP5jC6cGEZevT6E=;
 b=LN55LC24fgVXODc/ehpf6CH7jKUG3rayNfwGL1CQvSjJylxHvzlNQvw6
 HjCmZsNKONWDH9nL2KCVls+Wn2cUw5PJXdjKn8M38bHdBrw4wpHtI9jLJ
 waiZ7qUI7vgx1wApjC+omlDQ2AR8sqtViZ//o8xd6+5xEqzDkZ6O50vrH
 Yj7jukQjXXh7HKkGbNNYGqzS5njkeZ7780IfvA+T9U9x0uvZA/hAT/YlQ
 JjXubkXiQ0R9L3c13vydHxnB29ZjSW++ocAO6Ip3bTs7CLeKOgNwWCqQk
 3dEdhw/eFaCRUFfHodyITdMnuD3UAY+pa4Ymd3IZpCgIYIBOtZmM1smS6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="286258935"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="286258935"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 10:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="770842875"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="770842875"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2022 10:30:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 10:30:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 10:30:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 10:30:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 10:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2cKq9iYPSxV45TUBX3kh4jxJRntwIUynRk6oXYvz22CTEg8B7EcCEnxmPnjKCM2xurYgxYQiRO/dfMTS2z1+I1QZYp2w2b2KokT+oXiU8lNQnlpObPYDIF47BD5fNxPO96SFjRUklQEmLhJ+bpE6b2JWYfO5HPDiGg54TtChAs1YHy9aR/LhevDa85mYJxp+xVbdYRlfXqYLEid0y5PEGWrWW5a4+L0M2CNwnFFupU8ludm7cf5ixflqb2+fk222oRcqntHU05pxSXf0TPp18LbKJ/8glQxYyUHpQhz5SO8MEMDYWq/4Nfn3VEOyY7GuLGhoqyuY0gIuejaRh1daQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwZENXELYAaYW1gD79AGURcDlwoGqP5jC6cGEZevT6E=;
 b=ZS7VetmQmqCRzrWNIcz1B1RFgl425BSpX6vP83SqP0W1RgwgoIAXjAvYAH6kOIraX+GGEfG8M762e664zQeBdkskuDbKl+cXRdKi0KMMyCOVQXTG2qd90enuscaMU6ZTZlUmYH1Edh79oGb9bQnnZfVhUtkjgBxbLDi/JXKOZoIbIso0WvEvb+fCgXHD9U9FJxjFv3X0HU8+LZ3nFa5EV05GIGe1GER8/cdtLN/qwG/83/ExjVoo/UWW7IpT0YFuENEpAr/O0O+Q/45Fe3X0hE5QIpAyUMYgphMctViVwuULem9XeMm8e+BxchfmtVDLa1whYVJBCRcFDdC2Dn1eFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 17:29:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 17:29:59 +0000
Date: Mon, 17 Oct 2022 10:29:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915: Add intel_ prefix to struct ip_version
Message-ID: <20221017172956.qxsw4ursv6665b3r@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221011153851.3781507-1-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221011153851.3781507-1-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dcb242b-6805-4335-9398-08dab065370a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4IFmNsYq8jW/aMpNTyYHtC2dU9So46WbCR6lYBaFPlMAmABDghAL1eXA79re4henLFTU3KYxUm7tv6ziLKlMWpR1z68am39NsARAQ5LX4jYVhLL8e6LjhKNcVpcNItORiXiK2BYnRS7JGoJ60foVUanQ6K5sSVyREBarCDnEzhwRsHdYpeUCjME5PcDnzAVUmmMbKNm3aBXgbj77M6Gcl5cwWHej3rmWp37rQ9I2HNd7oGkIlM3cQkc0vu+91i5+JHoJ/Y5V6E5/F8zU7kHZUUQicda7vDQY/0sM54Y3tz3CJ+I1fgRFd7opVd4Th40qpSADZdp4pUc0ZKqvnEhgt0xrwE81WcTbpToiUus/cB35SuWLCNRm1aUz1kBorCOySdikKm+/lpud2Mxy9Ol3Fj2ZxpP7ID817DKHznfryti92YSg/Kf7vUfhr4ONGHWbrzq/8e8GDhnKMJaqModtpmoKCWwx0JjEt4GYS8xvxtlGrz6A3ljszPO/Q3BMp4wgXFxKA0Aly+2JlM4bFC7+Kx60HEtkBJAHne3TNLkSc/Cv8mP3qLekchVYc3ZiJBMe7cNM00hg6MKJf6JnlMb2nCxyOKhFQdwHgsTlfCiLHrnc28VPb+fwpRAKxLb32APIGigZKFrmADfTX3a4ZjxMpithsnrZfLp5yE2UrWU7LNOZz85VXuR+KUaLIT2nqPSkJMm/FQBQ/qPMUryNcBAzQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199015)(316002)(6636002)(186003)(1076003)(2906002)(36756003)(41300700001)(6506007)(6862004)(5660300002)(26005)(9686003)(8936002)(6512007)(4744005)(86362001)(8676002)(6666004)(4326008)(66476007)(66556008)(66946007)(450100002)(38100700002)(82960400001)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D4+KV/QfnHmvcd8cAWmhnrdmaXRlogeOrPEoKU/en52pZ5dU59/+odGKkMjj?=
 =?us-ascii?Q?Us76Smiew65ahLThPX58YItDRqTO62Hi8IdkenkcopTun35ZlkFtAcngfEu7?=
 =?us-ascii?Q?xrxcibzBfxL5CBWAU8CcvjAuy89o0mE8uYgy1MK4znC7lfPdQTExwDzbeNTj?=
 =?us-ascii?Q?7f12Zyd9pjOD2Tw4FgEe9F6VVPKA24nvsX9Zt6NucAq1TaTDO1XiddjAlMLR?=
 =?us-ascii?Q?Dl/hX9Iobr+/wENQZn54Wcp/+bL05y/eZ+2qsi/zlPgJVUwrO2bZHqyc8xZc?=
 =?us-ascii?Q?S3sxBON4iLGrdFgcbJon931yFV1Kc2X+f5JiDdBET6BPmwmVo1VjnZ1I3GfI?=
 =?us-ascii?Q?7wzEtesIoVtmS4OAxav36AcCC7LcrQnqoErqA/1uWqbQgZzMy06Fyb7hs1IY?=
 =?us-ascii?Q?IVMGE34J5+e2vHJHKFbmUHOFijUzz2i8T31al0eYR2CofkPl2zkp+/S7H2nD?=
 =?us-ascii?Q?wmVp4/PwkdXbY5nNzY+ZeWBkqcDdIoJ643Wyv3Fjws+4j5OLYl9hhP3U/nqA?=
 =?us-ascii?Q?uY7cqZYShZlCTD5txuOsMwUbVSyKxUARntM6qcpCprJGJAA/G95PA4+v+LVg?=
 =?us-ascii?Q?KfQzaf7YgiHwPoZs0j/l+IbjlsVAAQmWA20ve762BhqkR7+mu1ggk8NrRqru?=
 =?us-ascii?Q?8cqLiS06AeHZ0LTmbsTqW24QCUKGRKJ1V6DQX2Y0gTvb2g/ppOBCgvMTcjFk?=
 =?us-ascii?Q?wrqi5cBGH8v5t0xETgftUUChOh9x7M9U+HzS89/vgeANQ22sQXDQP4y6AlHV?=
 =?us-ascii?Q?u26Jd8U20HDt3WOA8cRyYuYgc+V5CxsbyGOG5H1dvJNjC+8b8qdEHuDYy2Ou?=
 =?us-ascii?Q?VUEs6xX9hAoKMR841sgOFJbHtVTS7hNHgtlPN/eTF3OQ/8rG38igtkdris4N?=
 =?us-ascii?Q?/t6bhK1GLm1J8MnI8ILgRFlzDUjiVJqRM8Lk6ZINvQ0O0rJvIxrZ7dmVr6La?=
 =?us-ascii?Q?ZihVs3avvfnk0dNgmrknS4M99hqiX6MoJ5H8p/Fa0TCVKze9f6rkG+kVVYFJ?=
 =?us-ascii?Q?WHjw/FyGK+c29NpeDao1WXZbLgwk9qiiC9Ef3/Cy1tup9ORJZ6qKtuROH586?=
 =?us-ascii?Q?i34Pz71zGKLSYkBwAVI3fyx0pkRv1bgHpWeWlWtc5XoGssJ6frBmwDAeZZw7?=
 =?us-ascii?Q?W67/URN38/wQ9L1yc+JJE8xZ6kWt8weD6qTTXsD7KoTUTbtbbx6ZtX+maPrk?=
 =?us-ascii?Q?hGkFjNNtzYa+fx05ciQzac1wVUGifanITjnja53zdUJJeAt5vYTjd/HC55F4?=
 =?us-ascii?Q?ym4FwU0dcqpFaxypyvxcbrROPe9g6LTAyPg0j1Vu//e10BXsuXdmi8f51ntz?=
 =?us-ascii?Q?Rp/jx3VNRlGEy36goWcyHam9CODpb8g/cg/y/c5y6ldj5+p5JWkShryPtm3h?=
 =?us-ascii?Q?vtH/3BX0j40mGtSP2X2P+94r0RGExfr905jRz0mGTbjBgBg68XsuyuoLtMdg?=
 =?us-ascii?Q?DZES+cR8ZYnMqnEhr0xfjwB22YA8gf2pqgJ2//c5JZHpG5ZADn/pBY5r6Wls?=
 =?us-ascii?Q?kkG7Zk/BbIuY5sf/pv8mbSJ75hXVSpudw7NNY/ZaxwXDXUT9qd7RsvSifmof?=
 =?us-ascii?Q?8HuHyVBv87B/86AlR/Tu9yq3gxN+Zz3TlFticeBEF1ZuFN9qeuVJZVDZkHc/?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcb242b-6805-4335-9398-08dab065370a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 17:29:59.0173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XM41xV53gt69UzKD2AbhpwzgGmN/IKvqQ6s2EkTxGfbthk6+i0Loio8LtErHEuC3j3eufa0B99mABQYvg9kWshfbzAZMqb3yAJWihueWRNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
X-OriginatorOrg: intel.com
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 08:38:50AM -0700, Radhakrishna Sripada wrote:
>Rename struct ip_version to intel_ip_version to comply with the
>naming conventions for structures.
>
>Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
