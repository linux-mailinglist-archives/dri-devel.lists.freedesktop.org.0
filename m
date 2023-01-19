Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238B667457E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 23:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1400910E277;
	Thu, 19 Jan 2023 22:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DE010E269;
 Thu, 19 Jan 2023 22:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674165966; x=1705701966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7Gbcpl+Lav+jvU7PIvH2NlsAuLetOrzRpdQhhoF/wuI=;
 b=B3zqRi9d58uT6u4bP7UtUTuL881L7q1vbxciLVf7x8wv/Z5fhOa3WDvW
 iYrC+GK55YjaTshED6P3lEyxHZQ8HGrwMD8R0sSHd9T9JFaqj4U7IuTFo
 UQqslupyCCjMbKUvdztcNwjcKjYsnIW3Ozsi4JbmqEPIPDJf1ycZXphmQ
 7GDmrrkb+Mg0WYoKVzB9iVauaIs1f6f5W8yVsDFDd1YHL1zIUVU+kURdo
 ZCE2YylkoDD0IRLU+DsVJCeEfh1LT2il2pmn/QSJpTCPHIus6R17GQVFJ
 7n9PR6zhIdYLsVrVlcgO2JDOES3NhLipdINwftEnmSQeRW7gYAqVPEWRj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="309016940"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="309016940"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 14:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="723683526"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="723683526"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jan 2023 14:06:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 14:06:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 14:06:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 14:06:04 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 14:06:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NENhUUZQmR2NiGpjXlp0bNhRJySvVPR7s0J458xviYr9hp2wgVjtdZn2mDC9ltXRaKsFOsci9rWuQq18sclKxVCnn7Un1I17CQvSqSOHltYlzFIn2gXDT39C9W/NooR/NFk3j2hbLk3Acs2ZeKyX6HOsRqSWomCYcOiy/iG9EwvdEZZdJT+Oiklr/DI6P5jkfb/5DWgHI4iLuW1xy6WqtfukVtkajMzUVSDRhJq/t21DmyvXzbVdvNyyD7gHptiKMFFQfQmMKCgDNdN5EoV7Ru57zajTg7HEtPeWSxydpRTIvxR4HuEAJu8rmNnIijy1lGcjUYZcYypawTSgS273Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4W/akzkeUC24Iyj+B08ERmZp6mX0V0s7w/TWnYzFGU=;
 b=bjXLdaIt2s9rncI3KQR0E4Yt3i4DNYfw5uQaURZsQWuiHZD97XQSZMrKbeWdVwxeUry2+kRhXEob5ee/8SKXPTcpZ3v4CSinpUnW8oXN7HT6ki6fLnWMfkqxSTVMcOOeadO8mLgu2ZfVQYO7lfjqgvYqveE9VrVw9Anlj+wZWQk+11CgugqHEPkHDscBoQiQ+AV6JUMrTp7yDvBJnGS4B51Ahpop9LeyxuMWd8iTURmWuoUi9dT38X7vwIlNYmIUUYC0jhsKsZFewvzgLJZ4fuLq9cFCKTomDIjTW+juPR9jpDDxwQ/ycfKiJJNvXWxzMXjxKk/lXUXuI1SDkKF7Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5045.namprd11.prod.outlook.com (2603:10b6:510:3f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 22:06:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 22:06:01 +0000
Date: Thu, 19 Jan 2023 17:05:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/gvt: Avoid full proxy f_ops for
 vgpu_status debug attributes
Message-ID: <Y8m+xBhGCa3kgcO2@intel.com>
References: <cover.1673375066.git.drv@mailo.com>
 <188df08e0feba0cda2c92145f513dd4e57c6e6cf.1673375066.git.drv@mailo.com>
 <Y72zVXYLVHXuyK05@intel.com>
 <Y8TkTi+/GQwhiMvO@zhen-hp.sh.intel.com>
 <Y8b3IRhx976Ke99X@intel.com>
 <Y8d6CwD3dHLKOUZ5@ubun2204.myguest.virtualbox.org>
 <Y8giB988U5cqsGdd@intel.com>
 <Y8icPEqkdF+7mg7E@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y8icPEqkdF+7mg7E@zhen-hp.sh.intel.com>
X-ClientProxiedBy: BYAPR08CA0040.namprd08.prod.outlook.com
 (2603:10b6:a03:117::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: c8939b6e-d5c1-4ba9-7464-08dafa6959f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LnsYCvuXcGdQYz8XQFQsOPgh/Bcy+o6ZwhKPaik8neJv1JmFqa64vdIvT8mxwuLnump0Lj7Zjx547rY1mRCP1iqRjoteshxXkc0w5jcs4X0b4b4MI9KO/EX8fDRX1Xa56wDZcttqcP86de/v4A+zf213ZuiUaBhkg7Eu32fVcrAKsx1qpE7rRT4ZhNmsJ+prBkGwNLLWN4/+YXsi0v1NhCv77tOeUMtrfl1Fcut9l4hYfvOU9BAP7eG9qP8l+J/VnDpRD8/kfFuQHGcqgHsY7KCzFfP7uYV0k4NxtMrGBjF58pEtoH0ZDo7s91bqlTChN17sJ7nfWyigQu8C/H3wrJGPa/e1w4KmSuVmDtZm+zbMsfsoJIiBUZaoEqbrT3Qsm5VkYVb3wW+dXQHNMtADHHjw1CvlfFHGGL9O8A9vE2/fEDyzcIqGhAIvBxJalWn+MuoCdJd633NBhM4fdr7XIfrbQ3peHsUVlloA5oapiPUuM8UOeoaloOYbgzmrmg5UQUsZFKgj1YXnuUaO4K9FS6W+ipMZHnmPg4N9VMaGJYhCg5+9Q324STInWp+sltl1c6qtzs7VlLthny3M7NAVGr9P2jBZL3P5jcAXcOJvKTGNK6AQLXw4pxCb4gtIyDQhGDQywJYo2F6UexmskxfXb1oJyZ3Jbm7P0KeSn+2Ij9UUnHPuIsyJqFJdCNmoAUMSNz7ZHZlW5+vw0A6ExWh7iJOv9VKPof8MPOaLQjrkGL0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199015)(38100700002)(36756003)(82960400001)(86362001)(2616005)(6666004)(186003)(6506007)(53546011)(6486002)(478600001)(44832011)(26005)(966005)(6512007)(5660300002)(8936002)(7416002)(2906002)(41300700001)(66556008)(66946007)(6916009)(66476007)(54906003)(4326008)(8676002)(316002)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3l9Xxy53yxM7MMT09jR/OHPecoxN4a3PYoVKaal9W8zNvWWqrmIWF2Lkg8FZ?=
 =?us-ascii?Q?+dFLHyt232QhQu442sdCWxuIV9GMm5B/gk2yrcLB6PTA9nJaR39CQk2K2kzd?=
 =?us-ascii?Q?eD6WsjK/SGp3liJrJiOD8nmlRFTfZeNap796SAKmhqqv/eczw5oBBt7yjm6m?=
 =?us-ascii?Q?1untaf7bFh0f17B0bnND0pkRvIw1rSjuaGiu5BZkNiwR3RhEf+9wn4veUid3?=
 =?us-ascii?Q?JrZQ100vw1StftMgHZKGRIS1RQYPPl9MD4B5wiEsO2T35c8BWInOTTQUd/sc?=
 =?us-ascii?Q?rl4biSAEpoxEtLUlPNgB2InE3kzxnvClP3Zra3IGamNFnF1Vs0VSCJRlaHxM?=
 =?us-ascii?Q?G/CUN3NbzFovGEEp1Hc+mGaG4jUEVNLpGc11gh6gCLtlE+Mc+HzVINlZgmVg?=
 =?us-ascii?Q?g4SHfIxnDD2Gz0oWl8PLh8+HT/msTWmnrrKBPjpOdjKKPrxV6MWYqbQtMico?=
 =?us-ascii?Q?I1IVKcfGgPexrYVXVh5f8Zi1m6BxlWtME6q1iD7HO31Ab0zSzyxNgWGm3oDk?=
 =?us-ascii?Q?Ofi7HuN/BGLQl4pCHEw1rdwq2gY36wFi0iw+R1dPrdcgi7RPqcyOnd7KziSI?=
 =?us-ascii?Q?TuFa7BzJrUHvV+1naL1FqsCnNa04sbDYzY+GgWLKOKF7GH2cWnv8lC15dwvp?=
 =?us-ascii?Q?Nzdiwyd2/8DwxYnGIiSfk3keR5sCC3me1ANFJZ2KgY98y1T9HxW4sty+kJih?=
 =?us-ascii?Q?LWvN9dJa1oqvl0y460KNclHzuIK8SeYJvPlhjNXJMF1FnEREHlXLnCzLG+tS?=
 =?us-ascii?Q?Ql0yclcf5Bup2jDJUfK5zLb5iD6lZ3EOjTUpANSeF7tJO9jZUwlsIhYSbwUe?=
 =?us-ascii?Q?6BDRcpsdUFkDrBciWYf5XTO5rL2FTJAIm6sQuNB/VGlcIPLSjHgjnb99BuQH?=
 =?us-ascii?Q?ufNHMTbvMK1Bxnwy8/wcxLNp7Rkdn03fp/Ok/N2We65sjFXqjhJgs+sdfO0d?=
 =?us-ascii?Q?2jg7SA8PHXv3nyoPdIMQ91NsJajBOCMzpiDaVNrILI8z9VdbWUqNad6cSswp?=
 =?us-ascii?Q?LNHQH0xIgOrn4r+XtuyZEEm9JK/+ba6Gswl8vppmNwIUr+bvSco1q+bwn7IE?=
 =?us-ascii?Q?bT8NsG71B5ioj52K0k5cU3IsHYYdOXpcrOcY8Bw7U6lcbmGnUkYhdCI8UJUf?=
 =?us-ascii?Q?xDVd0YIT0bZ2y+raAVrHbAqifA7jy8PPxmeJHLL0lgY2Ics3kN6HNQnLlwwd?=
 =?us-ascii?Q?2vBbx3cVD3eJUHt158bEcpkdG77j4K9wDZ7pljLaof5hbJCTfoXxyh92AdTE?=
 =?us-ascii?Q?q3dq+rpmUTBOOMHKwqmqTrdIPAo0biI11YDW4/29HlOxQF5tk8i7KjRSGati?=
 =?us-ascii?Q?s/AO133pACRpR4dyKO87oYrj91kP/eq8M3TOr8ByeZeNdEF1vnfoK5FLQYFq?=
 =?us-ascii?Q?i5HpjJdjhk6EhcED+V0atUqIAldjQMScVi7LpRlK4IqmGqm/MFScZk/c1Yem?=
 =?us-ascii?Q?h/mCQNscpl7Ij/bo8NpF+cXMokit7KHS4eJMCOVQWXHU0RlyMoiPDcgPiZGt?=
 =?us-ascii?Q?a7z4Td380fAsxRQ+BTyaVDTw7Q4/tVpI9BTtt8cb//6GW6zsJpyc/68DQNrX?=
 =?us-ascii?Q?82hMp6lT5PGQ6kn11qresZ0uc3S1j8/mwtw8qAFT886rWyOh4zqbRZXjvT2r?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8939b6e-d5c1-4ba9-7464-08dafa6959f8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 22:06:01.7137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qz7Q4wKYj1yt1F0vDx+Xxgx85nGeqhdFDcl1oX4m6GjADUJgQyBHsFY5vXWXI90tgTpbMleHq991pMxGHQPnIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5045
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
Cc: Deepak R Varma <drv@mailo.com>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Saurabh Singh Sengar <ssengar@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 09:26:20AM +0800, Zhenyu Wang wrote:
> On 2023.01.18 11:44:55 -0500, Rodrigo Vivi wrote:
> > On Wed, Jan 18, 2023 at 10:18:11AM +0530, Deepak R Varma wrote:
> > > On Tue, Jan 17, 2023 at 02:29:37PM -0500, Rodrigo Vivi wrote:
> > > > On Mon, Jan 16, 2023 at 01:44:46PM +0800, Zhenyu Wang wrote:
> > > > > On 2023.01.10 13:49:57 -0500, Rodrigo Vivi wrote:
> > > > > > On Wed, Jan 11, 2023 at 12:00:12AM +0530, Deepak R Varma wrote:
> > > > > > > Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> > > > > > > function adds the overhead of introducing a proxy file operation
> > > > > > > functions to wrap the original read/write inside file removal protection
> > > > > > > functions. This adds significant overhead in terms of introducing and
> > > > > > > managing the proxy factory file operations structure and function
> > > > > > > wrapping at runtime.
> > > > > > > As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> > > > > > > with debugfs_create_file_unsafe() is suggested to be used instead.  The
> > > > > > > DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> > > > > > > debugfs_file_put() wrappers to protect the original read and write
> > > > > > > function calls for the debug attributes. There is no need for any
> > > > > > > runtime proxy file operations to be managed by the debugfs core.
> > > > > > > Following coccicheck make command helped identify this change:
> > > > > > > 
> > > > > > > make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > > > > > > 
> > > > > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > > > 
> > > > > > I believe these 2 gvt cases could be done in one patch.
> > > > > > But anyways,
> > > > > > 
> > > > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > 
> > > > > > for both patches... and will leave these 2 patches for gvt folks
> > > > > > to apply. Unless they ack and I apply in the drm-intel along with the other ones.
> > > > > >
> > > > > 
> > > > > yeah, they're fine with me, feel free to apply them directly.
> > > > > 
> > > > > Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > > 
> > > > Unfortunately I got some conflicts when trying to apply on drm-intel-next.
> > > > 
> > > > We probably need a new version, and probably through gvt branches it
> > > > will be easier to handle conflicts if they appear.
> > > 
> > > Hello Rodrigo,
> > > Sure. I will send in a new version. I am current using linux-next git repo as my
> > > remote origin [tag 20230113]. Are there any specific instruction/location from
> > > where I should access the gvt branch?
> > 
> > https://github.com/intel/gvt-linux.git
> > 
> > but with the linux-next your patch is probably right for them.
> > 
> 
> yeah, I think so as currently from last pull request I don't have
> other updates in gvt tree, maybe it's just d-i-n hasn't included
> recent gvt change.
> 
> I saw Deepak sent a new one, feel free to apply. Let me know if
> there's still any issue.

It still doesn't apply in drm-intel-next.
Could you please take it through your branch?

> 
> thanks!
> 
> > > > > 
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/i915/gvt/debugfs.c | 6 +++---
> > > > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > > > index 03f081c3d9a4..baccbf1761b7 100644
> > > > > > > --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > > > +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > > > @@ -165,7 +165,7 @@ static int vgpu_status_get(void *data, u64 *val)
> > > > > > >  	return 0;
> > > > > > >  }
> > > > > > >  
> > > > > > > -DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > > > > > +DEFINE_DEBUGFS_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > > > > >  
> > > > > > >  /**
> > > > > > >   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
> > > > > > > @@ -182,8 +182,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
> > > > > > >  			    &vgpu_mmio_diff_fops);
> > > > > > >  	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> > > > > > >  				   &vgpu_scan_nonprivbb_fops);
> > > > > > > -	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
> > > > > > > -			    &vgpu_status_fops);
> > > > > > > +	debugfs_create_file_unsafe("status", 0644, vgpu->debugfs, vgpu,
> > > > > > > +				   &vgpu_status_fops);
> > > > > > >  }
> > > > > > >  
> > > > > > >  /**
> > > > > > > -- 
> > > > > > > 2.34.1
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > 
> > > > 
> > > 
> > > 


