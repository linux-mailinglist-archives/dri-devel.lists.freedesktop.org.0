Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E389A3737
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B0E10E8B0;
	Fri, 18 Oct 2024 07:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GALW/PKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6724A10E8AA;
 Fri, 18 Oct 2024 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729236859; x=1760772859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XleJ1IOvvJrVC326wJXNCI0AXUEQBzqLmaakdlxQc8c=;
 b=GALW/PKlnIJ1h+jjgQq4O9DvhIzNWtpiTihLPawV+tBTv0mMwAG6fGzM
 KmTVTrl+gdAp7U5FPpSoDs8765xlod0vYoZO/kBL3danSy2ZeJ0HGoZwG
 OFOwviJdS0Hn/iV3zIwh4Z5w96sT892iascGDykw/z8Br0jtyKN1Cs+4j
 9f214TT2jP6t0gc+IRf3RV1Yb1FC8UXru8Nt/rou1m2GmEwv6Gw4/Pat/
 2Ijry7GfL6NF9yEQ0ob3+1bX8iLLBso07gqfFHJY+gaH2Fus2M1GsOVPZ
 qbixI13I+4LIBKHpiN7ygvIU3KmhY89U0c3ZBrIMRIjUF12v8K/lWqUMO w==;
X-CSE-ConnectionGUID: w1TWm25MRXiAfSchCCGEKQ==
X-CSE-MsgGUID: WIi1QSNCTiCLfmPQgDKAnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28547605"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28547605"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 00:34:19 -0700
X-CSE-ConnectionGUID: q1yb1ImMRaG+PPzrMriAfQ==
X-CSE-MsgGUID: 8+P4uH6TQseJBalS8dTQ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="109602377"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 00:34:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 00:34:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 00:34:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 00:34:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMif4YHF8z4oFDrJgDL33JvzNgUn1vdNOsMM36ADMKuJa6FTMF+JnBszvZhoLp3MmJCZN+bpRoYltZvv4NOHE3BPGwK2Lcr3fRCuDsp/Qp2gejAZBBXVid+Mxw53QrosdalZVu206DsDkXu9nefKhDA4Cu0pZnqEqmYd67OpctMDfncu3HgqMR/GnNXCDmtA6PSLwPi6MtR82Sf5Pf2zrnY61L4qa3N+/5gg0Bb0F9R+nTobAtqaRZq1w9RdQYheKQGuYVvdlTAM2/IIH4l2fLp/kkQfmRfwGM9AWLkDuwo7qAnHteO69G0MvaVAiVrxL/qU6eV3gB/C7tYuiswqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOnldGhctH3yfDFbOloQlk1TptUn7olpaE/jmAXg46c=;
 b=NftMBRz2PtylASTzg7ly1S6bds70UpkVkGzjJYSginoWuvfzkzJevnsdYoOvklxi0K18EB29i2v6XNq5tCGvhguoUlsjA5nk2nJweCxRh2hEcV7W5B3SyrhIO0licFUTOHCUUE1xRt0NL40MhIPU5dmZCCVfAsv+XxrRSiikH6mF55/jtTGHmGvIjuqeslyg/6MeeOPaRWr4j6ZIA3YYqcCPU+5HdH6lNm0DRZtJdhsBbDQa/BURXy7bNIG3ThFFLhxpSxR6gST9O/lwvhL3ZAsXF/DAMXiq3QEKSjIE6LKNj0JSXb+Mn0WICIeQE3lvmd1fdTHIO67LzeNKjR3OGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Fri, 18 Oct
 2024 07:34:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 07:34:15 +0000
Date: Fri, 18 Oct 2024 07:33:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Message-ID: <ZxIPRvr5SNjeLzwa@DUT025-TGLU.fm.intel.com>
References: <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
 <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
 <87zfn3mg69.fsf@nvdebian.thelocal>
 <ZxEwAIc4dW7Sig36@DUT025-TGLU.fm.intel.com>
 <87r08emlb7.fsf@nvdebian.thelocal>
 <ZxGxr76OcW4bJ/Qi@DUT025-TGLU.fm.intel.com>
 <87zfn2lz6z.fsf@nvdebian.thelocal>
 <ZxILP39RTgPEgEPK@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZxILP39RTgPEgEPK@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: b84b8f34-2a5f-4238-e026-08dcef474492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CPo7Ln3iQTwk/T2vIpWr3znH6lOrE04XmZZYWV6993phOCytIpv1Ny5l4/Pe?=
 =?us-ascii?Q?C25mIkoQeWX4vjcGIyKtCg2uDGjn1NKA0U36eUIoqfoMhyoMz+I6krFPl5og?=
 =?us-ascii?Q?HQglo6q0k3rbeID6LnVwrDSYs4nBS7QPX3kWg6MhJp7C+N4js5HFQwnjl/9k?=
 =?us-ascii?Q?vSHS8OfYx8/gdCGNr66nOfcRz0Z6yZeiHshN4q+jtof83wq0umD7rbqw5CMu?=
 =?us-ascii?Q?xvYuqcTF+L/o9VkzRRnZFXFv3vNqIFltiU6nyaqQXeTVSvPQ3BvFosgkSJyO?=
 =?us-ascii?Q?6H2WYTm+j7IXnNOoR57vm0lfwuEX23r84VvBSRvTF7qhRFMgi2h+llzLiZcX?=
 =?us-ascii?Q?wqlC4/8RfmHah9u0m8ubVBPfCPxuluw8B9UvOp3HpMPukBQcKJxzF1oKEc4d?=
 =?us-ascii?Q?k+cfIsvANx8BrD7C6PdDqAXRC4ubTW9Y7qhBClE8VMLeCXKdSUSj3PJCWY2Z?=
 =?us-ascii?Q?m1zS0W8hmymTY5qCinC9+nwq5EAes6lLLGAFewVz2r1Bu69F1+Tm9SF35rz2?=
 =?us-ascii?Q?friLpE/huB9VY66/r5UOt3wIlMq8//3zflGV+eypjfRazPlRWnRN/dpSHnyt?=
 =?us-ascii?Q?QCmu7npoEhTDAcfmMR5KZzj4x1borJp4hLMlFphIRgy3drduOysbfd51C/iP?=
 =?us-ascii?Q?UhflRwaHLjw5BQNF/aVzT24ycJXDWstSJSzI4ZPZi8h4kO8Z2cGyzqc0mjxa?=
 =?us-ascii?Q?LHYGuoVGs3v4HsyHrJZEHUvLZ3tIeHVTAG493+PeEK1+SfA97O9JpZgkxRs3?=
 =?us-ascii?Q?sbsnKEOHb65CVxOTrof9ZDLyuHw4JIAZ++Iud/ogzA3kpApEv+KVgKUya7xQ?=
 =?us-ascii?Q?zGCPUOM4UgxmeLHih1vpNeZlT1n9VpJovx8sL3LXTKbUhm0tTBLK+BpaijvT?=
 =?us-ascii?Q?oL7NYakWfH8D7NgIHI1IX87SVS03WQfL8ZuiQOgGuzh3L4o8wgQ1V89fl5kk?=
 =?us-ascii?Q?aEpt2i8oyU1u9lnGjEQF4Vb4ZgqIxV2ovQHBcRxqD1Q0s1A8xu2YpwqtA2gA?=
 =?us-ascii?Q?6et5O8XkgkBBYtkbkgHGBP80lCJgRN9xHq1aQTBJQizPPbCew5QEkzfXZfpk?=
 =?us-ascii?Q?UKHBtlINydPZCR6/5zAYX0s2KNRH2/WPWhu7RJYSH87vbLbA+j7v+QDFNm7b?=
 =?us-ascii?Q?mCFbQw3F1qH2yv7CaYIRL+cOFaZ+whEjGOj9BSWVhM50NLdgsFG9x67v5LY3?=
 =?us-ascii?Q?0B4QMi1u5OMJleP+fUUlN4ZPoPk4ay/IP2B20LPQBmo1eot3hQMvJ123RsNY?=
 =?us-ascii?Q?R+kEk1NfVAkGQaeGX3ItkTE74n37FCBtMZlNio6fMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qYyoILT6nF8N8po85cPqR56KCw0pcgAbHPn/SPhYjZqFEXdbmYgyAh/wSecM?=
 =?us-ascii?Q?1w4X3QF7lYR5LHzYEr1PWWU3SjxeCYmgN19N07mBv3CbP6b0wXpGsutGvC9n?=
 =?us-ascii?Q?XtQn4p7EpvaNVw44x73vAOyt3cYjXB2RUrTUD75fZLB3afbvdL7nqtJQpUX9?=
 =?us-ascii?Q?ubiM8gL4jfANHxGdd5Ma28fm7d08PDJS7mmoHsu0AG/ecSiAmPTTZqmUgB0/?=
 =?us-ascii?Q?J6phedxKKCrOjksS7WTiw2kH0BofvpJNaXKtEWfEEQxpFylKB1jUf2KnzUOZ?=
 =?us-ascii?Q?qhhuXuRl1TMYVK5eSY8IZn+QFdHjv5hEY5iPL1cMCjyF7HzTV5DBJ3Tx3MSF?=
 =?us-ascii?Q?hsbSFafxMh1o2nOczys+gFJ3itIIiXNqP8dnabqXTFiQhj4HPLIndyYCoX4l?=
 =?us-ascii?Q?U9X1Zscoa2LmR7EDY4fm5BGwg0duYsqya4dTKXWoT4Ccptew0pyv9/YRJ29K?=
 =?us-ascii?Q?/olgpuEDLuPoEmWQxtRDTLiD6z2oMJm0B8+kOmu0FvgkSRSQ4ksMG2Ln3nJe?=
 =?us-ascii?Q?SsFcOHjnhlxt8Y5zEKy2l+d8gyHEc6mNDNK41M9Kt0BM7A/hAMAZhoTQlP0R?=
 =?us-ascii?Q?AXE38b6QduCHKRhtAUzrEt+NGt7JLZUElooBsAUthsoBJ6LQoZsX/4/vFmEN?=
 =?us-ascii?Q?6g8MOIPUwymhU9KJbmX7ABpYFo5IYwGD7UN+jhoabA2LTvLhwRqsyl7EVP7B?=
 =?us-ascii?Q?TAV+1VphXqEbRkhNevfnXrkNZYgZl0zat9MIc8BIKGCgHCex1e7z8P2iR+qa?=
 =?us-ascii?Q?YyMlS75nUor2d3TviPr5pZMdP/uvTqk5WSJfG+TUEe5PQxvDS8DuE97FR86g?=
 =?us-ascii?Q?8eCFmH4MGkr2jOTz8KZQeCTBgZcBfNy1hsx+ZP/6ioUpDu555F6FGaI5lHum?=
 =?us-ascii?Q?+4NriBrXj6m2YlD9rzuscx1v2/eQCfVEJ1aOmOdQ7W5EDRUosxwlD2HzA9fU?=
 =?us-ascii?Q?Rw/7rPnxSTJAJpQ5zvdEKEzCsarxvClSUnIGyLERCkdTZYgv9T8AoRLjDii/?=
 =?us-ascii?Q?u+wO/L82bt4Rb5Hcz6UOrhEz12lGNSmNHOjiDXtO+nGirIaM4XMoF5bcyLYw?=
 =?us-ascii?Q?NgeE71yR2rwR19aXn5PUgGHT+Zd16PpeprwYyK3hyCRuDMHsNgNVL01Cayo4?=
 =?us-ascii?Q?bWSzo4voc8/YY/UuvavyrvG1jqxXHTVm2GA4s+Z/GSFLbwtG0qRSMk6E5JtD?=
 =?us-ascii?Q?DsFnC0ZG9NLx1t0eRyvX5mo1PiqB/eE7vPYzAvsJIt44XIWA6ce1N9oKtM5u?=
 =?us-ascii?Q?QU9hwcL35/Cm4Gtqvab4w8ufm+sWgCZvBKjgwSDnAmD2SkKcU9ody7Gn6upW?=
 =?us-ascii?Q?OUQ8BMOVv6hNr1SsLxChkyQasM9QMyHc+k3ST5z7vj2n7cQBGCYDKpj2/blh?=
 =?us-ascii?Q?YtYymGZwWJLLczk3tr0brApB8qOHLcw1plMJDOd0nI7MOqkbMQeGc8KQOYyG?=
 =?us-ascii?Q?3zuyQdVT1PE2p/Cjsa2VV2Bk6OlMREHP0k7s7JL7NxJR6hpQ3rHyQb9C/YyP?=
 =?us-ascii?Q?dxFbnHP5S3D2zQyNpTDLkHl9Sy6Lu+xipEirYk+QjbUHFd5ufnFtTzPJC1Lk?=
 =?us-ascii?Q?U5rigJGHV41Du8x1+cvAbzyxLPKgEgmIl5OVW8UrQTDtrWoicxXksOQ+wkNO?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b84b8f34-2a5f-4238-e026-08dcef474492
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 07:34:15.2956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJAdUuoQdYT00JVp0XBq6666hkdl1riJkv2MridLCjr9wx8KFVEbq4n/KJ2aCoiYOFdejj0duVbofxuFgs2Erw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 18, 2024 at 07:16:15AM +0000, Matthew Brost wrote:
> On Fri, Oct 18, 2024 at 04:59:05PM +1100, Alistair Popple wrote:
> > 
> > Matthew Brost <matthew.brost@intel.com> writes:
> > 
> > > On Fri, Oct 18, 2024 at 08:58:02AM +1100, Alistair Popple wrote:
> > >> 
> > >> Matthew Brost <matthew.brost@intel.com> writes:
> > >> 
> > >> > On Thu, Oct 17, 2024 at 04:49:11PM +1100, Alistair Popple wrote:
> > >> >> 
> > >> >> Matthew Brost <matthew.brost@intel.com> writes:
> > >> >> 
> > >> >> > On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
> > >> >> >> 
> > >> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> > >> >> >> 
> > >> >> >> > On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
> > >> >> >> >> 
> > >> >> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> > >> >> >> >> 
> > >> >> >> >> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
> > >> >> >> >> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
> > >> >> >> >> 
> > >> >> >> >> [...]
> > >> >> >> >> 
> > >> >> >> >> >> > > +{
> > >> >> >> >> >> > > +	unsigned long i;
> > >> >> >> >> >> > > +
> > >> >> >> >> >> > > +	for (i = 0; i < npages; i++) {
> > >> >> >> >> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
> > >> >> >> >> >> > > +
> > >> >> >> >> >> > > +		if (!get_page_unless_zero(page)) {
> > >> >> >> >> >> > > +			src_pfns[i] = 0;
> > >> >> >> >> >> > > +			continue;
> > >> >> >> >> >> > > +		}
> > >> >> >> >> >> > > +
> > >> >> >> >> >> > > +		if (!trylock_page(page)) {
> > >> >> >> >> >> > > +			src_pfns[i] = 0;
> > >> >> >> >> >> > > +			put_page(page);
> > >> >> >> >> >> > > +			continue;
> > >> >> >> >> >> > > +		}
> > >> >> >> >> >> > > +
> > >> >> >> >> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
> > >> >> >> >> >> > 
> > >> >> >> >> >> > This needs to be converted to use a folio like
> > >> >> >> >> >> > migrate_device_range(). But more importantly this should be split out as
> > >> >> >> >> >> > a function that both migrate_device_range() and this function can call
> > >> >> >> >> >> > given this bit is identical.
> > >> >> >> >> >> > 
> > >> >> >> >> >> 
> > >> >> >> >> >> Missed the folio conversion and agree a helper shared between this
> > >> >> >> >> >> function and migrate_device_range would be a good idea. Let add that.
> > >> >> >> >> >> 
> > >> >> >> >> >
> > >> >> >> >> > Alistair,
> > >> >> >> >> >
> > >> >> >> >> > Ok, I think now I want to go slightly different direction here to give
> > >> >> >> >> > GPUSVM a bit more control over several eviction scenarios.
> > >> >> >> >> >
> > >> >> >> >> > What if I exported the helper discussed above, e.g.,
> > >> >> >> >> >
> > >> >> >> >> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
> > >> >> >> >> >  906 {
> > >> >> >> >> >  907         struct folio *folio;
> > >> >> >> >> >  908
> > >> >> >> >> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
> > >> >> >> >> >  910         if (!folio)
> > >> >> >> >> >  911                 return 0;
> > >> >> >> >> >  912
> > >> >> >> >> >  913         if (!folio_trylock(folio)) {
> > >> >> >> >> >  914                 folio_put(folio);
> > >> >> >> >> >  915                 return 0;
> > >> >> >> >> >  916         }
> > >> >> >> >> >  917
> > >> >> >> >> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> > >> >> >> >> >  919 }
> > >> >> >> >> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
> > >> >> >> >> >
> > >> >> >> >> > And then also export migrate_device_unmap.
> > >> >> >> >> >
> > >> >> >> >> > The usage here would be let a driver collect the device pages in virtual
> > >> >> >> >> > address range via hmm_range_fault, lock device pages under notifier
> > >> >> >> >> > lock ensuring device pages are valid, drop the notifier lock and call
> > >> >> >> >> > migrate_device_unmap.
> > >> >> >> >> 
> > >> >> >> >> I'm still working through this series but that seems a bit dubious, the
> > >> >> >> >> locking here is pretty subtle and easy to get wrong so seeing some code
> > >> >> >> >> would help me a lot in understanding what you're suggesting.
> > >> >> >> >>
> > >> >> >> >
> > >> >> >> > For sure locking in tricky, my mistake on not working through this
> > >> >> >> > before sending out the next rev but it came to mind after sending +
> > >> >> >> > regarding some late feedback from Thomas about using hmm for eviction
> > >> >> >> > [2]. His suggestion of using hmm_range_fault to trigger migration
> > >> >> >> > doesn't work for coherent pages, while something like below does.
> > >> >> >> >
> > >> >> >> > [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
> > >> >> >> >
> > >> >> >> > Here is a snippet I have locally which seems to work.
> > >> >> >> >
> > >> >> >> > 2024 retry:
> > >> >> >> > 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > >> >> >> > 2026         hmm_range.hmm_pfns = src;
> > >> >> >> > 2027
> > >> >> >> > 2028         while (true) {
> > >> >> >> > 2029                 mmap_read_lock(mm);
> > >> >> >> > 2030                 err = hmm_range_fault(&hmm_range);
> > >> >> >> > 2031                 mmap_read_unlock(mm);
> > >> >> >> > 2032                 if (err == -EBUSY) {
> > >> >> >> > 2033                         if (time_after(jiffies, timeout))
> > >> >> >> > 2034                                 break;
> > >> >> >> > 2035
> > >> >> >> > 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > >> >> >> > 2037                         continue;
> > >> >> >> > 2038                 }
> > >> >> >> > 2039                 break;
> > >> >> >> > 2040         }
> > >> >> >> > 2041         if (err)
> > >> >> >> > 2042                 goto err_put;
> > >> >> >> > 2043
> > >> >> >> > 2044         drm_gpusvm_notifier_lock(gpusvm);
> > >> >> >> > 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > >> >> >> > 2046                 drm_gpusvm_notifier_unlock(gpusvm);
> > >> >> >> > 2047                 memset(src, 0, sizeof(*src) * npages);
> > >> >> >> > 2048                 goto retry;
> > >> >> >> > 2049         }
> > >> >> >> > 2050         for (i = 0; i < npages; ++i) {
> > >> >> >> > 2051                 struct page *page = hmm_pfn_to_page(src[i]);
> > >> >> >> > 2052
> > >> >> >> > 2053                 if (page && (is_device_private_page(page) ||
> > >> >> >> > 2054                     is_device_coherent_page(page)) && page->zone_device_data)
> > >> >> >> > 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
> > >> >> >> > 2056                 else
> > >> >> >> > 2057                         src[i] = 0;
> > >> >> >> > 2058                 if (src[i])
> > >> >> >> > 2059                         src[i] = migrate_device_pfn_lock(src[i]);
> > >> >> >> > 2060         }
> > >> >> >> > 2061         drm_gpusvm_notifier_unlock(gpusvm);
> > >> >> >> 
> > >> >> >> Practically for eviction isn't this much the same as calling
> > >> >> >> migrate_vma_setup()? And also for eviction as Sima mentioned you
> > >> >> >> probably shouldn't be looking at mm/vma structs.
> > >> >> >> 
> > >> >> >
> > >> >> > hmm_range_fault is just collecting the pages, internally I suppose it
> > >> >> > does look at a VMA (struct vm_area_struct) but I think the point is
> > >> >> > drivers should not be looking at VMA here.
> > >> >> 
> > >> >> migrate_vma_setup() is designed to be called by drivers and needs a vma,
> > >> >> so in general I don't see a problem with drivers looking up vma's. The
> > >> >> problem arises specifically for eviction and whether or not that happens
> > >> >> in the driver or hmm_range_fault() is pretty irrelevant IMHO for the
> > >> >> issues there (see below).
> > >> >> 
> > >> >
> > >> > Ok, if you think it ok for drivers to lookup the VMA then purposed
> > >> > exporting of migrate_device_pfn_lock & migrate_device_unmap is not
> > >> > needed, rather just the original function exported in the this patch.
> > >> >
> > >> > More below too.
> > >> >
> > >> >> >> > 2063         migrate_device_unmap(src, npages, NULL);
> > >> >> >> > ...
> > >> >> >> > 2101         migrate_device_pages(src, dst, npages);
> > >> >> >> > 2102         migrate_device_finalize(src, dst, npages);
> > >> >> >> >
> > >> >> >> >
> > >> >> >> >> > Sima has strongly suggested avoiding a CPUVMA
> > >> >> >> >> > lookup during eviction cases and this would let me fixup
> > >> >> >> >> > drm_gpusvm_range_evict in [1] to avoid this.
> > >> >> >> >> 
> > >> >> >> >> That sounds reasonable but for context do you have a link to the
> > >> >> >> >> comments/discussion on this? I couldn't readily find it, but I may have
> > >> >> >> >> just missed it.
> > >> >> >> >> 
> > >> >> >> >
> > >> >> >> > See in [4], search for '2. eviction' comment from sima.
> > >> >> >> 
> > >> >> >> Thanks for pointing that out. For reference here's Sima's comment:
> > >> >> >> 
> > >> >> >> > 2. eviction
> > >> >> >> > 
> > >> >> >> > Requirements much like migrate_to_ram, because otherwise we break the
> > >> >> >> > migration gurantee:
> > >> >> >> > 
> > >> >> >> > - Only looking at physical memory datastructures and locks, no looking at
> > >> >> >> >   mm/vma structs or relying on those being locked. We rely entirely on
> > >> >> >> >   reverse maps from try_to_migrate to find all the mappings on both cpu
> > >> >> >> >   and gpu side (cpu only zone device swap or migration pte entries ofc).
> > >> >> >>
> > >> >> >> I also very much agree with this. That's basically why I added
> > >> >> >> migrate_device_range(), so that we can forcibly evict pages when the
> > >> >> >> driver needs them freed (eg. driver unload, low memory, etc.). In
> > >> >> >> general it is impossible to guarantee eviction og all pages using just
> > >> >> >> hmm_range_fault().
> > >> >> >> 
> > >> >> >
> > >> >> > In this code path we don't have device pages available, hence the
> > >> >> > purposed collection via hmm_range_fault.
> > >> >> 
> > >> >> Why don't you have the pfns requiring eviction available? I need to read
> > >> >> this series in more depth, but generally hmm_range_fault() can't
> > >> >> gurantee you will find every device page.
> > >> >> 
> > >> >
> > >> > There are two cases for eviction in my series:
> > >> >
> > >> > 1. TTM decides it needs to move memory. This calls
> > >> > drm_gpusvm_evict_to_ram. In this case the device pfns are available
> > >> > directly from drm_gpusvm_devmem so the migrate_device_* calls be used
> > >> > here albiet with the new function added in this patch as device pfns may
> > >> > be non-contiguous.
> > >> 
> > >> That makes sense and is generally what I think of when I'm thinking of
> > >> eviction. The new function makes sense too - migrate_device_range() was
> > >> primarily introduced to allow a driver to evict all device-private pages
> > >> from a GPU so didn't consider non-contiguous cases, etc.
> > >> 
> > >> > 2. An inconsistent state for VA range occurs (mixed system and device pages,
> > >> > partial unmap of a range, etc...). Here we want to evict the range ram
> > >> > to make the state consistent. No device pages are available due to an
> > >> > intentional disconnect between a virtual range and physical
> > >> > drm_gpusvm_devmem, thus the device pages have to be looked up. This the
> > >> > function drm_gpusvm_range_evict. Based on what you tell me, it likely is
> > >> > fine the way originally coded in v2 (vma lookup + migrate_vma_*) vs
> > >> > using hmm_range_fault like I have suggested here.
> > >> 
> > >> Thanks for the explanation. I think vma lookup + migrate_vma_setup() is
> > >> fine for this usage and is exactly what you want - it was designed to
> > >> either select all the system memory pages or device-private pages within
> > >> a VA range and migrate them.
> > >> 
> > >> FWIW I have toyed with the idea of a combined
> > >> hmm_range_fault()/migrate_vma_setup() front-end to the rest of the
> > >> migrate_vma_*() process but haven't come up with something nice as
> > >> yet. I don't think mixing the two in an open-coded fashion is a good
> > >> idea though, I'd rather we come up with a new API that addresses the
> > >> short-comings of migrate_vma_setup().
> > >> 
> > >
> > > I think that would good. Here we actually need to lookup multiple VMAs
> > > and have a sequence of migrate_vma_* calls as it possible for VMAs to
> > > have changed after the driver range was created. It might be nice to
> > > hide the VMA lookup from the drivers with an API saying collect and
> > > migrate all pages of a type in a VA range much like hmm_range_fault. If
> > > the range spans multiple VMAs that would be hidden from the caller.
> > 
> > Ok. I wasn't really considering multiple VMAs. UVM and Nouveau don't
> > really have a requirement to migrate across multiple VMAs but if that's
> > neccessary I think an API that hides that specifically for working with
> > migrate_vma_*() might make sense.
> > 
> 
> We can run into multiple VMA scenarios if a user does something rude
> like this:
> 
> mmap	0x000000...0x1fffff -> fault migrates 2M to VRAM and creates an internal range to track
> munmap	0x080000...0x17ffff -> now we have two VMAs instead of one and the range has a hole in it
> 
> In this scenario, which we believe to rare / unsual, we just evict
> remaining VRAM pages to SRAM, destroy range, and fixup on next GPU
> fault.
> 
> > > Matt
> > >
> > >> > Note #2 may be removed or unnecessary at some point if we decide to add
> > >> > support for ininconsistent state in GPU SVM and Xe. Keeping it simple for
> > >> > now though. See 'Ranges with mixed system and device pages' in [5].
> > 
> > As someone not very familiar with some of the DRM layers can I ask why
> > having virtual address ranges with a mix of system and device pages is
> > hard to support? It seems to me that in practice it might be quite
> > difficult to keep a VMA range as exclusively all in system memory or all
> > in device memory.
> >

Sorry double reply - missed 'VMA range as exclusively' comment.

I'm refering to DRM GPU SVM range being exclusive in system or device
memory not a VMA. A DRM GPU SVM range is relatively small and controled
by the driver, via a table, and VMA boundaries. In Xe, we current
support 4k, 64k, or 2M DRM GPU SVM ranges. So say if a VMA is 1 GB, we
can have individual 2M ranges in either system or device memory based on
access patterns. What range allocation size, that is migration
grainularity which all pages in the range being exclusively in system or
device memory.

Matt

> 
> A few things that make this difficult are:
> 
> - Our (Xe) bind code would need to be updated to support this
> - TTM / DRM buddy allocator doesn't support freeing / reallocation of
>   individual pages rather aligned chunks of initial allocation size
>   (e.g., 2M would be common allocation size).
> - Spliting ranges would add complications
> 
> All workable problems but since we are writing a new common
> implementation trying to keep it as simple as possible for initial merge
> of the design. Almost certainly at some point we will add support for
> mixed ranges to the common GPU SVM layer with a driver choosing if it
> wants mixed or non-mixed ranges via a flag to function calls.
> 
> wrt to being difficult keeping exclusively in system or vram, in
> addition to the above case the only other case I have found in which
> this occurs is CPU and GPU faults to same address range racing. This can
> cause hmm_range_fault to grab a set mixed pages. In this case again we
> do an eviction remaining page and restart the GPU fault.
> 
> I don't have real workloads yet but I do have a very aggressive test
> case that intentionally does things which could break the design in a
> highly parallel manner and the design as work. Is it ideal? Maybe not.
> But getting in a simple design which we can build upon is the current
> goal.
> 
> Matt
> 
> > >> > [5] https://patchwork.freedesktop.org/patch/619819/?series=137870&rev=2
> > >> >
> > >> >> >> > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
> > >> >> >> > [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
> > >> >> >> >
> > >> >> >> >> > It would also make the function exported in this patch unnecessary too
> > >> >> >> >> > as non-contiguous pfns can be setup on driver side via
> > >> >> >> >> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
> > >> >> >> >> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
> > >> >> >> >> > in [1].
> > >> >> >> >> >
> > >> >> >> >> > Do you see an issue exporting migrate_device_pfn_lock,
> > >> >> >> >> > migrate_device_unmap?
> > >> >> >> >> 
> > >> >> >> >> If there is a good justification for it I can't see a problem with
> > >> >> >> >> exporting it. That said I don't really understand why you would
> > >> >> >> >> want/need to split those steps up but I'll wait to see the code.
> > >> >> >> >>
> > >> >> >> >
> > >> >> >> > It is so the device pages returned from hmm_range_fault, which are only
> > >> >> >> > guaranteed to be valid under the notifier lock + a seqno check, to be
> > >> >> >> > locked and ref taken for migration. migrate_device_unmap() can trigger a
> > >> >> >> > MMU invalidation which takes the notifier lock thus calling the function
> > >> >> >> > which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
> > >> >> >> >
> > >> >> >> > I think this flow makes sense and agree in general this likely better
> > >> >> >> > than looking at a CPUVMA.
> > >> >> >> 
> > >> >> >> I'm still a bit confused about what is better with this flow if you are
> > >> >> >> still calling hmm_range_fault(). How is it better than just calling
> > >> >> >> migrate_vma_setup()? Obviously it will fault the pages in, but it seems
> > >> >> >
> > >> >> > The code in rev2 calls migrate_vma_setup but the requires a struct
> > >> >> > vm_area_struct argument whereas hmm_range_fault does not.
> > >> >> 
> > >> >> I'm not sure that's a good enough justfication because the problem isn't
> > >> >> whether you're looking up vma's in driver code or mm code. The problem
> > >> >> is you are looking up vma's at all and all that goes with that (mainly
> > >> >> taking mmap lock, etc.)
> > >> >> 
> > >> >> And for eviction hmm_range_fault() won't even find all the pages because
> > >> >> their virtual address may have changed - consider what happens in cases
> > >> >> of mremap(), fork(), etc. So eviction really needs physical pages
> > >> >> (pfn's), not virtual addresses.
> > >> >>
> > >> >
> > >> > See above, #1 yes we use a physical pages. For #2 it is about making the
> > >> > state consistent within a virtual address range.
> > >> 
> > >> Yep, makes sense now. For migration of physical pages you want
> > >> migrate_device_*, virtual address ranges want migrate_vma_*
> > >> 
> > >>  - Alistair
> > >> 
> > >> > Matt
> > >> >  
> > >> >> >> we're talking about eviction here so I don't understand why that would
> > >> >> >> be relevant. And hmm_range_fault() still requires the VMA, although I
> > >> >> >> need to look at the patches more closely, probably CPUVMA is a DRM
> > >> >> >
> > >> >> > 'hmm_range_fault() still requires the VMA' internal yes, but again not
> > >> >> > as argument. This is about avoiding a driver side lookup of the VMA.
> > >> >> >
> > >> >> > CPUVMA == struct vm_area_struct in this email.
> > >> >> 
> > >> >> Thanks for the clarification.
> > >> >> 
> > >> >>  - Alistair
> > >> >> 
> > >> >> > Matt
> > >> >> >
> > >> >> >> specific concept?
> > >> >> >> 
> > >> >> >> Thanks.
> > >> >> >> 
> > >> >> >>  - Alistair
> > >> >> >> 
> > >> >> >> > Matt
> > >> >> >> >  
> > >> >> >> >>  - Alistair
> > >> >> >> >> 
> > >> >> >> >> > Matt
> > >> >> >> >> >
> > >> >> >> >> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
> > >> >> >> >> >
> > >> >> >> >> >> Matt
> > >> >> >> >> >> 
> > >> >> >> >> >> > > +	}
> > >> >> >> >> >> > > +
> > >> >> >> >> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
> > >> >> >> >> >> > > +
> > >> >> >> >> >> > > +	return 0;
> > >> >> >> >> >> > > +}
> > >> >> >> >> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
> > >> >> >> >> >> > > +
> > >> >> >> >> >> > >  /*
> > >> >> >> >> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
> > >> >> >> >> >> > >   * a reference on folio which will be copied to the new folio if migration is
> > >> >> >> >> >> > 
> > >> >> >> >> 
> > >> >> >> 
> > >> >> 
> > >> 
> > 
