Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDCB673122
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 06:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3805610E8A9;
	Thu, 19 Jan 2023 05:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E39610E8A9;
 Thu, 19 Jan 2023 05:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674105833; x=1705641833;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rX6ExGAkXBPzJaSZuevjjDd7HYtBywDqiJmhYT+rXVY=;
 b=YVPfQUUEYoco5n6H4WU7DC+1bM14bBsgcTFLRMuBsqcloQPhAFijJITm
 QPB20lePqZRKmFraKVbuIzxWQrP4VtqFFtuJckNI6LCfopPSlcxcjC1a2
 gdaHach1UL9BWR7CXY9pnQ983i1dYsiOca3d+s0OT+aonsrQZRtSfqOai
 fiIqYIC/1XHf3F1WKmQAErMQFZMugkUWJ0pYZi2deIZpsZLCwixxeXV3s
 ZOTTomLp6nBbEc1jejGCtcz/zU+/nTBI9IO7z3XMhQUc61CjqWJ6xfpcI
 XmRCXvm8b1HSxzc+Ug2FatsZHx3TjNMroPz1e8yLe1LgnPMecUKL/bDTY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="304885824"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="304885824"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 21:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723367352"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="723367352"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2023 21:23:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 21:23:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 21:23:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 21:23:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhbi4/8LV6p9Wa7IbkyUwI60HtMPfkqfJPlq5A+8mjnhVCBEpXWy1zeTYnfP5NDY/QUqxAXV7SfFc3SvtuKZP5F+oIKihVcL+8DYeSAeuV/NkYKMzJtEpOhWmTRWkAq1NKKGA5aCJScp3c9pQLyJe1LCdzsxcq9QHVCeFW/FGRFvugCi5LV+w37uUIZXCUuGkpSpKIo65AsE/ekeGt9CBn4o87GhmR3xWBecwW9mbyptrZ9KS1l4k/+8CGBJf5QvJC1X6FpMm05NsbMX273wmiHljdw4GBV+R5qn1cPz+Gkmcursqr8i+d/1aczhFA7jAcCOFk+f97wLDmKsPW+rbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueMj1WzOnEuh4exFgljcllqZVQG/s1foVj67el5cSEQ=;
 b=IsOX00ap6E/fxYO0oor23PMTu7tYJdneEEDKQxK1PYe0UjXDrcRcA7dfbnr5OAseQXXj828KdtmvRSI8dH/VMnAwfCoeRrrRAxWtyGVIescyMVbiadddf6o/m/wL0RByV09X8atQOq8pPS41/Kz2/4bqq4GyR5itIY9vsplqn0vnlx5go1xhcCxUh+rmBejFeRJ7oD/gRMTyTSEweOM3aBcPBQ1YU1M9pP/dYQRaWu3WKiN3t16b74BHBkZoDU6DmzjoOpn9SeKzOyOl/YCH6hHwOYj7v0YaGPSJZdOK1KWIxS1ZA06U/Y2cXqX4KVsmewUtBJNgbkuR2a1Fegq2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7262.namprd11.prod.outlook.com (2603:10b6:8:13c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 05:23:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Thu, 19 Jan 2023
 05:23:49 +0000
Date: Thu, 19 Jan 2023 05:23:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next 00/14] [RFC] DRM GPUVA Manager & Nouveau VM_BIND
 UAPI
Message-ID: <Y8jT1TazLddqZjG4@DUT025-TGLU.fm.intel.com>
References: <db4fa0fc-c9a6-9a48-c45f-1d655b30aff9@amd.com>
 <02b0bcb8-f69f-93cf-1f56-ec883cb33965@redhat.com>
 <3602500f-05f5-10b8-5ec6-0a6246e2bb6b@amd.com>
 <bcbef353-f579-4e90-1c77-be36bbe61c0f@redhat.com>
 <CADnq5_PGaXFW-z3gt+R+W+vBVdeuL4wMuMOQh4muxU13Bemy3A@mail.gmail.com>
 <0f2d6e1a-a3b5-f323-a29d-caade427292c@redhat.com>
 <CADnq5_Nh-1esiHzvTG+qFBCfMjy21efX-YN2jfGG=WC+-4LwLQ@mail.gmail.com>
 <CAPM=9txMZO1uYj+kVdTfmCwV2Fq8uu_b3i4eq4xhqPEPKBW8Eg@mail.gmail.com>
 <7839c47e-6692-b93b-69a8-9584193cb07d@amd.com>
 <6566870d-6256-8eef-5879-cb13711e4bed@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6566870d-6256-8eef-5879-cb13711e4bed@redhat.com>
X-ClientProxiedBy: SJ0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:a03:331::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a200bb3-e5f4-4ecb-72fa-08daf9dd5800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OXqNL8m4zG4XQvreHgFCOfVssSBCZsIUhoqnmoplNe6BcaqPgkyvK2L+Epi7lWGK1p/BLW9Iy/h7Waslnc6hZsTzMivsypSsII1a2Zr5l8kWj7RIINIIsxFV0YXxjUsyU6YKA56eLMAiuXbB13yExW030+cvfXPX7Am2bJhPgxmSD29nl5XscbbQanWnMIV+FZly5ZkADdw4hoXO/pD4ly8PBksLUYEDrlyjgywOzpPd3O7M64THPWWVmpWvxsS5pwa2XN9YN6B0u1Lx8jWdsEm710S1oPYrhCbn2osxth+FCd6aNaev+nLXpRoOXMJXnyp5L4QQWbozfhY3U/iOlv4cPDnJfHpCRckIuEj9TbZLNdYF4225GPXx5sXxakllyhJ2cH3T/Anj+LA6q56337O2mzIh0efdcmkXaFblSwv0UUsT0TSjDSy5Y2bVNeEvQYMQtSUyeK330oN99R6eNklETxRpNTXXaSmDYTLYDvz8bGR1yAhtyfH3AcBVwNH0MTuv5+nrn+lTc3ldNE3PRK0vB/ImhL/tO0IJ4BR0jFNI4i13nymOItd95XoXqExsKvTwhCjNRWAOzGHVl612Ai+kHSUzycUM7AZzSodlUuGe6yqeNZDry1vJxvLWnQmTOaQvqTMFKFJZ3opwjANjoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199015)(7416002)(5660300002)(54906003)(316002)(44832011)(2906002)(38100700002)(83380400001)(66574015)(6486002)(82960400001)(86362001)(6506007)(53546011)(186003)(6512007)(478600001)(6666004)(26005)(6916009)(8676002)(4326008)(41300700001)(66899015)(66556008)(66946007)(8936002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3uoF7PU8gfYroAJNjJPROFLxw1n/NUHYn04pM2w1/zN+tYK42lwJ0zwILQ?=
 =?iso-8859-1?Q?xC4a5Ahte0ezRl/5swZTBqTupBWTAq52ccf52UiOGdnzSYzus1pIgKC0YY?=
 =?iso-8859-1?Q?tRCreweNPd8eFO1gxrpym0CHvkz47HrGGvji7F9MM37jtLYQRFNloiUJpO?=
 =?iso-8859-1?Q?Z5vPWf3cqL3ShPQfHJhPXVBExw0wERMh8vWOikA5CBzgEsEUxpHD3Crtk5?=
 =?iso-8859-1?Q?5hVMILjQyf90SRYKzshcJVX3UefUzgXr0WmobjjLF7Pn18eNRqUKSW5BZ2?=
 =?iso-8859-1?Q?qEOIaeF95iiZMhD24U+1CMFawkngQGQ5S44O2Fs5sSOKwNGlS2G+XMX3do?=
 =?iso-8859-1?Q?g/an1dMZ4vuq4qb33wEjxt/U5X+7w1hILveOeivbV9K4qsEghEvrII90eP?=
 =?iso-8859-1?Q?bHulWYOQtX2b0brqYMug6HaAqan6TyyopDQ60a0Mp1N5dFXJwASTRg2bW6?=
 =?iso-8859-1?Q?6O+yqvZkdDEEPZFMU5ZVFkG57MCAusomRKVBaj0GE2dqHGtqNDSK7YhY5S?=
 =?iso-8859-1?Q?J48vw1xq+OYE3MMVc6ZY6Ng/Xk3IC8L3+uD1p/4fcd4lU+Hfm3cvdmySpj?=
 =?iso-8859-1?Q?XFITMpzFRS4NKsot0f5HmerGd/Jm2dSNBv904Sy4h2Sq21Lo5S9WIZtAO/?=
 =?iso-8859-1?Q?uvGNgZwSuvc4zEWZcWFzv9fCogmaT96QoBiTk6E4mS88sl2NHojzByEt/x?=
 =?iso-8859-1?Q?EJHTGjqCAMlbrpcXMOBrR+TwDrTN4YLRKW3wvghZouF8cSUNbK2LZRZjQW?=
 =?iso-8859-1?Q?MTYDjy/g5Wku5NucTGh6hVkwhozVoktvEEZDvpS+QeWZ9ol91MK/28BxMg?=
 =?iso-8859-1?Q?CQSZrxaSJHjRPg1zB8Di8hMuItRl8hVaXs2221PUEcZZUtHCXQkJYHdatg?=
 =?iso-8859-1?Q?cjLXwHkKvgRIVZfJ0Z0GxiVZVeVN+x7hKFbg4ccUeChrcvhTXYY12LOBND?=
 =?iso-8859-1?Q?aAn28dNQpaBnuR6ds6L+1WZ+xLjG9KQ1/Vt1vey+hZKxQgMLm/PyuJ/RMo?=
 =?iso-8859-1?Q?2trTyx2nkWHn04cUD9G787yhh4FjDZz4DcbbbhLtj0rLNRda/5coyHqiTU?=
 =?iso-8859-1?Q?WXjV4JvePbJlur9PXpmNagcC22XjboR1nZ3I4q8JADv5dotdrkP+axF7G5?=
 =?iso-8859-1?Q?1BS0Bcnjs51eie2yalrE8zqFBoKJ+2V5fu/WXMbUSdzHpCPCMZ20mGwig2?=
 =?iso-8859-1?Q?V5U+4KtYX26dnW68mH6rnzit5eM95JSI9e1XjLDZI7Go+b9+oaara/dPh1?=
 =?iso-8859-1?Q?x6C2V3OJxMZHKVlwO1Fhz8YrYRB1QwWx2UTm5FfsDl7baH3/dpjuuLjze0?=
 =?iso-8859-1?Q?W38fQkawDNiR3VgT/fxNNsHcU7CziIDmu3rK7144uczwRznCMlLYvuxA2q?=
 =?iso-8859-1?Q?/aBODMRsMyhoJ8Eh+sPruS14M5/nn7IHaAk8bmQzXCKZp8alq/ZnpjQ5AF?=
 =?iso-8859-1?Q?/icznDCTxV0VsVdhai/UE4Qyiqh0Wb2RKv1VKycqb6cKv0uY7op57rjirp?=
 =?iso-8859-1?Q?OioHIdKBWhRJr7PmTE1EiLq8tJdQGUCSE2EZc5xL5WKF1SDAs2JVYZ7Fut?=
 =?iso-8859-1?Q?hTQNpxV9tPTb2P5+sWcCmmnkWtMa1weC2E0tl/EuA9qz5dJWTirCkjqWUx?=
 =?iso-8859-1?Q?9JGsRESt19CPEQPKA2mdnkiGsAYg1KoYhbQguyOHGw2nq4YoTVSPsJSQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a200bb3-e5f4-4ecb-72fa-08daf9dd5800
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 05:23:48.7734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsLyreD5Emx0SZYLc7xaw1WtGRqO6HDMS5h9Qc+7BhpB8lve9R3YKYOfebuaoGLDse6SzyazvUxtt/qYDRoOWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7262
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
Cc: tzimmermann@suse.de, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, jason@jlekstrand.net,
 airlied@redhat.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 05:04:32AM +0100, Danilo Krummrich wrote:
> On 1/18/23 20:48, Christian König wrote:
> > Am 18.01.23 um 20:17 schrieb Dave Airlie:
> > > On Thu, 19 Jan 2023 at 02:54, Alex Deucher <alexdeucher@gmail.com> wrote:
> > > > On Wed, Jan 18, 2023 at 11:50 AM Danilo Krummrich
> > > > <dakr@redhat.com> wrote:
> > > > > 
> > > > > 
> > > > > On 1/18/23 17:30, Alex Deucher wrote:
> > > > > > On Wed, Jan 18, 2023 at 11:19 AM Danilo Krummrich
> > > > > > <dakr@redhat.com> wrote:
> > > > > > > On 1/18/23 16:37, Christian König wrote:
> > > > > > > > Am 18.01.23 um 16:34 schrieb Danilo Krummrich:
> > > > > > > > > Hi Christian,
> > > > > > > > > 
> > > > > > > > > On 1/18/23 09:53, Christian König wrote:
> > > > > > > > > > Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
> > > > > > > > > > > This patch series provides a new UAPI for the Nouveau driver in
> > > > > > > > > > > order to
> > > > > > > > > > > support Vulkan features, such as
> > > > > > > > > > > sparse bindings and sparse
> > > > > > > > > > > residency.
> > > > > > > > > > > 
> > > > > > > > > > > Furthermore, with the DRM GPUVA
> > > > > > > > > > > manager it provides a new DRM core
> > > > > > > > > > > feature to
> > > > > > > > > > > keep track of GPU virtual address
> > > > > > > > > > > (VA) mappings in a more generic way.
> > > > > > > > > > > 
> > > > > > > > > > > The DRM GPUVA manager is indented to help drivers implement
> > > > > > > > > > > userspace-manageable
> > > > > > > > > > > GPU VA spaces in reference to the Vulkan API. In order to achieve
> > > > > > > > > > > this goal it
> > > > > > > > > > > serves the following purposes in this context.
> > > > > > > > > > > 
> > > > > > > > > > >        1) Provide a dedicated range allocator to track GPU VA
> > > > > > > > > > > allocations and
> > > > > > > > > > >           mappings, making use of the drm_mm range allocator.
> > > > > > > > > > This means that the ranges are allocated
> > > > > > > > > > by the kernel? If yes that's
> > > > > > > > > > a really really bad idea.
> > > > > > > > > No, it's just for keeping track of the
> > > > > > > > > ranges userspace has allocated.
> > > > > > > > Ok, that makes more sense.
> > > > > > > > 
> > > > > > > > So basically you have an IOCTL which asks kernel
> > > > > > > > for a free range? Or
> > > > > > > > what exactly is the drm_mm used for here?
> > > > > > > Not even that, userspace provides both the base
> > > > > > > address and the range,
> > > > > > > the kernel really just keeps track of things.
> > > > > > > Though, writing a UAPI on
> > > > > > > top of the GPUVA manager asking for a free range instead would be
> > > > > > > possible by just adding the corresponding wrapper functions to get a
> > > > > > > free hole.
> > > > > > > 
> > > > > > > Currently, and that's what I think I read out of
> > > > > > > your question, the main
> > > > > > > benefit of using drm_mm over simply stuffing the
> > > > > > > entries into a list or
> > > > > > > something boils down to easier collision detection and iterating
> > > > > > > sub-ranges of the whole VA space.
> > > > > > Why not just do this in userspace?  We have a range manager in
> > > > > > libdrm_amdgpu that you could lift out into libdrm or some other
> > > > > > helper.
> > > > > The kernel still needs to keep track of the mappings within the various
> > > > > VA spaces, e.g. it silently needs to unmap mappings that are backed by
> > > > > BOs that get evicted and remap them once they're validated (or swapped
> > > > > back in).
> > > > Ok, you are just using this for maintaining the GPU VM space in
> > > > the kernel.
> > > > 
> > > Yes the idea behind having common code wrapping drm_mm for this is to
> > > allow us to make the rules consistent across drivers.
> > > 
> > > Userspace (generally Vulkan, some compute) has interfaces that pretty
> > > much dictate a lot of how VMA tracking works, esp around lifetimes,
> > > sparse mappings and splitting/merging underlying page tables, I'd
> > > really like this to be more consistent across drivers, because already
> > > I think we've seen with freedreno some divergence from amdgpu and we
> > > also have i915/xe to deal with. I'd like to at least have one place
> > > that we can say this is how it should work, since this is something
> > > that *should* be consistent across drivers mostly, as it is more about
> > > how the uapi is exposed.
> > 
> > That's a really good idea, but the implementation with drm_mm won't work
> > like that.
> > 
> > We have Vulkan applications which use the sparse feature to create
> > literally millions of mappings. That's why I have fine tuned the mapping

Is this not an application issue? Millions of mappings seems a bit
absurd to me.

> > structure in amdgpu down to ~80 bytes IIRC and save every CPU cycle
> > possible in the handling of that.

We might need to bit of work here in Xe as our xe_vma structure is quite
big as we currently use it as dumping ground for various features.

> 
> That's a valuable information. Can you recommend such an application for
> testing / benchmarking?
>

Also interested.
 
> Your optimization effort sounds great. May it be worth thinking about
> generalizing your approach by itself and stacking the drm_gpuva_manager on
> top of it?
>

FWIW the Xe is on board with the drm_gpuva_manager effort, we basically
open code all of this right now. I'd like to port over to
drm_gpuva_manager ASAP so we can contribute and help find a viable
solution for all of us.

Matt
 
> > 
> > A drm_mm_node is more in the range of ~200 bytes and certainly not
> > suitable for this kind of job.
> > 
> > I strongly suggest to rather use a good bunch of the amdgpu VM code as
> > blueprint for the common infrastructure.
> 
> I will definitely have look.
> 
> > 
> > Regards,
> > Christian.
> > 
> > > 
> > > Dave.
> > 
> 
