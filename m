Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291BF570BD8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A87910AC;
	Mon, 11 Jul 2022 20:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40D7910B5;
 Mon, 11 Jul 2022 20:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657571531; x=1689107531;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cYoDRlglUJJbSNvTFz4s2c0GVNSqXdv6y51BVSrfmVU=;
 b=lFEx3htShxsNAgcZtOKa3oR6Bvw2EHjCWv/6zUg0A1kbh6MfC/KMnNsJ
 FCkv+shzrcfH8vg/nA/EaRVBMbhd5ThcAxTg4vIZsa1+DtJpdrj+yHjrj
 bj/45WPeAm8ifnFWQsm9CnVU4uRuSL0xB4rdliJgyUntpKvI4a8Wz+HfS
 k/3oD8vKf1fKdko4iJrvD21u6+ORARwhry/0gvTxRORj46OG362c/POyN
 I8Zj2cmaattBdbuUFVtQDKonydv6wVycUScqWh0EkqNiOvBV/HXgqZx2a
 cfA0z+VDvhA0iwfHGssYmrBRHwbt0E4P8k4/NCmRiYbsb+xrECCU0hZ0J g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="265174388"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="265174388"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 13:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="721727897"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 11 Jul 2022 13:31:56 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 13:31:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Jul 2022 13:31:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Jul 2022 13:31:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA1AdV0DB0+A3+0l9cLoemm8AQRJcILrDFsLspMXTSqPJymNi++xG9X/s0dCJXIT85zgT4vggYgR9TPtXzx4Qlg4N7vziip45jV11G+xIleC6kMqk1bMWlrg9Bxv2bu5kZiuRuP1c5TtWWD1tt8kutVEI/VzlN7itjO967MavoN8WtmDFY9gq+HkVL7x5pikW7P4NegMgW2WFrzvZdmKE9sVs+UOQb5tfeBk5pOBSKHGcNwmSrB1RGk6PU5Ml9/44Fzg2QViXEfpHyWeR/VlH2D6WIxfMYVhqPRZhC4c+4sn2FU76BGE8ye1UHJItR7pZHhEtW/PeXVM4g8bQ0XkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5+Ok1OeJES4uDhJ3rBR4UTMnDxpHDLG+LGwJnAA25Q=;
 b=jcxxh+R73Lc94Ia8KO8FVUiklDGGyBi1iLmhp79kS0NmKvPT+aJwVpUYTQtt+H8ffEyIu1HufmCz3/u3tn855rpZvjeyBFdBr+THUkMaLrvKTNTR6La9LZfa5PccNU1RAzTjHZnnz3s9eKIYOm9r76KUwqNH0V2JShi4Yb2vjX5i1F7W+Mbqb9clvwXJmzAO3libbJqppIv97ph+hpq4ZJnCp42QvZxOrWFBB+vc/yVa/kWVt/MP7y6RwLKIC5SpzsuHui2TkuRMFBg67w1msBd2hYd/HDnE0lScD+PF3gfotnHDZi1QoITqwTfRP2PB9NTrla1jCeHCYYRp3rZsZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 20:31:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 20:31:54 +0000
Date: Mon, 11 Jul 2022 16:31:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: susetting the remaining swioltb couplin in DRM
Message-ID: <YsyItfiuccW7iQln@intel.com>
References: <20220711082614.GA29487@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220711082614.GA29487@lst.de>
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 671b71a4-ffb0-4473-6b54-08da637c64a4
X-MS-TrafficTypeDiagnostic: DS0PR11MB6496:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: At5Zw+UJo+g6a51qyXLtoFGqFJ5vu+5+w/VIbvWuIkDuFGVbJueyoAYZaIVAZKQ8sHUw14xagJGpbJ3SeJ+pFXJHa+l2HGhrJi37sRtIAd/KlHc/G0co819GEidMPSfON3Es2iHnzqK1p0yZVcJ8MQsFLEYIYtobw0olRJ++zkVy8Nsk3vz6nHrhevYhOknebaI5z8g+guEj1xNFniOTUHowod34evwTC/D/q88PGb4LXYEK1ywZ48Uz/iq0QlQ5QK0Yef6E2NsefAPNhJ+ZVEp7tdPDzxyHCmx+1xglV1XIJqNmKLxEgC2RMfKNXExo1DaJP4zGtRG3LLi5jcdhrck54WDhYc4uzToVj5Xv1spU8CBIoUPNykXxKkhIAbCfX1/cik3tHimCEI6qT0M9qnhVKuP3OIKrus91jQeJfQUomtaq+ezLT4Kx1LqxWbnE0V4n42AKfC51f+EqODaFurY/hel7kdz0y3b8Kesz2UhjmRo7yjzj7JfXYVz4wp/zlID5bt0lW8STEsfMJSDMoo39YUnkAws/OQem8A76qsSycoyS3drnIHENSn54otCJpY9RfPh6njrbuSJhSsfrbL4G2bg4936u99w58gG43B73iWgumh6RIJdkTc0JQhkHx1fx+TuqKgrdsXXDv/mVSR/X/bik8iJWbeiYFjbW1c18lfPVlTD9R+2a6Sugn71n36SMl3hk8CVlMfzogdgiqmnNRcyhZP3+S1y7/lBfEkehqdaF64tSu8MC58aOrmaVTCQNWefbxDqjmCoOPzEvbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(346002)(376002)(39860400002)(136003)(7416002)(2906002)(5660300002)(36756003)(6486002)(6506007)(4744005)(44832011)(6666004)(478600001)(66946007)(86362001)(6512007)(26005)(8936002)(54906003)(41300700001)(316002)(82960400001)(6916009)(38100700002)(2616005)(66476007)(66556008)(8676002)(186003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1sKP7v8c8KJPd59FKSAHOXvNoAuFavvAW7KQfHBXl2Zh67j2p396hefgCEJa?=
 =?us-ascii?Q?p/ei3etQdmhyz7ez88HLj/e0OCohpCKu7CMHVqJeXj/tVRi0BaXzryTZnslk?=
 =?us-ascii?Q?86gHy0VkarZ0K7u60bIRkCxniEbGsDJIN0s/fPDlelsyLVgzvFEooYL2yJPw?=
 =?us-ascii?Q?YAF7dyTYZg2sajy1LddJY+COaXBiwHsc8UEGdb9fo/+SbqL1ZHbsJ75cIXti?=
 =?us-ascii?Q?1kE9c8tgL5s/n5Fbgb3CtWlbQYd1aFPl7O6Ss4qWyC/ZM2a/ou5Xt2byijqF?=
 =?us-ascii?Q?z0wjFCnBpjwRIzbfuTgX1jzv74Jj16NQlt7gxVWCrlZTP82BzTN9nuSxuoni?=
 =?us-ascii?Q?MpKR0+7re5owrZtppHteIy7vTys3F7DvM7avN7A6KTu+HJMhtIq2q23JtpGN?=
 =?us-ascii?Q?7ULw6ms/+c+exlfIUFMLsEUWfomZiH17zwftlFDFXAZHRwpIzxVjdACz/Ls0?=
 =?us-ascii?Q?BD/k+SV0NMjZ2wkPhP3OSm278lxVZEBeEOE6kUR+54E+l/UAhSYfcfZxMuGj?=
 =?us-ascii?Q?/1wuryfhk8+iVxlzHctT5dpy94GA/8XZAkLtgJNmyQ9ruNZx4Sy0zqYuVjVh?=
 =?us-ascii?Q?EBC5LGMf1zOV1FOFRCiPMlOZxMPIXYBwSdAfvA+jfcRV5xOt0B56Q7v1IwIR?=
 =?us-ascii?Q?VzDGgRVnVtCWRCz64i3FBAzKrMbcxn5uOFEu1FF9Vvnc9WifE4/H1zt2T6H4?=
 =?us-ascii?Q?ON4IKfy3BEsnAkw05wayoGa7ffN1Z11hxT8qV+IWtViOArpgH2i0IHGm6jIh?=
 =?us-ascii?Q?e3yhOvKPAvbPMm0AkFK9mUn7XzPFlZf91J5sQLTChAOppXbzuwpa879mBzSk?=
 =?us-ascii?Q?+sTAds9OVSIFLJM9aaYzO7SSzAT8a/r8kFz0HWtb9D8q3XRXXfDhK/L4wljB?=
 =?us-ascii?Q?9SXsZZUl1poaNlz8lUDfg+YyCABSKNWYBzmznNs6yJItgmy5opYiYrRcAbG0?=
 =?us-ascii?Q?IuJ0mQFptSAMVrV6IUHblzSZ06ZxZGHePCjbqi1CA6LszEni047PVAvjsXKk?=
 =?us-ascii?Q?d2HZLam/UzgUZmAMycKBu0qEgV8UxNQ6XJpQ2f+aIqcKiVMvRZbt7ePnGYZC?=
 =?us-ascii?Q?1sWmbgn+hreySwRSIvX6Z/emNh4pxI6MqMpdXKxeVARahHJRTjMewbW4YbvW?=
 =?us-ascii?Q?7OAWbbCX+BdLUe3gur8szF2khKCgunEID432wTwk5H5XLPrKIwSoCKL3b/SM?=
 =?us-ascii?Q?vjXQN+KXjn6boFOKuVGBLu0poAm4ZIYCF05zwAll8fgLDceuY8VhJolmvGaQ?=
 =?us-ascii?Q?SDMRaU5HY44oblytxD7Po83ejm7yBS6W/FHNt09BkErEFFPW9tRFCsAaNxUm?=
 =?us-ascii?Q?ab04Tw3TbfHC0h2ez8/KMzbWi8LHAqdjwmWStgToRn2UVeWaMlE/KhbLkNtl?=
 =?us-ascii?Q?gHws15yxTiQMb8T2Ga4QCdiF80iSuQuGg9XIVXA/7AmqC7FBfxE7ZTvIsG47?=
 =?us-ascii?Q?BQuiwPM1YcE5F0PgOQqSAMWec/KCt7bBLnboxk5cvNuNhi/6ypNA2t5Ae1MI?=
 =?us-ascii?Q?4FXZb7tOajBjpyc8TeLhL2rlPKNax1GMffsSQZs3yMlSc/aMPAMiZHaOPUKk?=
 =?us-ascii?Q?kfsTb9YvZ8I46LLN8Sa0zoQzNoX/R8k5BrXYwh0EWLrqiGfUYZRl4xLB8Cdh?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 671b71a4-ffb0-4473-6b54-08da637c64a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 20:31:54.4449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tv+iDxoGlKh71o+93NDKK4/xB10Zfv66Ha7OChUy5/OqnrNebOWEOUUdAuk5K+FRSSVLL2SnWJUX4QPhgzEIKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Karol
 Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 10:26:14AM +0200, Christoph Hellwig wrote:
> Hi i915 and nouveau maintainers,
> 
> any chance I could get some help to remove the remaining direct
> driver calls into swiotlb, namely swiotlb_max_segment and
> is_swiotlb_active.  Either should not matter to a driver as they
> should be written to the DMA API.

Hi Christoph,

while we take a look here, could you please share the reasons
behind sunsetting this calls?

> 
> In the i915 case it seems like the driver should use
> dma_alloc_noncontiguous and/or dma_alloc_noncoherent to allocate
> DMAable memory instead of using alloc_page and the streaming
> dma mapping helpers.
> 
> For the latter it seems like it should just stop passing
> use_dma_alloc == true to ttm_device_init and/or that function
> should switch to use dma_alloc_noncoherent.
