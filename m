Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70397674593
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 23:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD41B10E275;
	Thu, 19 Jan 2023 22:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB27710E275;
 Thu, 19 Jan 2023 22:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674166306; x=1705702306;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=updzMQ74X/QiFpN6nlsmFJKfZFNn55SJEZQyMONzavY=;
 b=PD3rUTSQOVNbID7Oj6VpD+Gdb1csOLlMmiSaKluPR9t7ygWml+Al5aci
 26YJIdiIQIeWBAtsIxouxWKPt2w61CTdB0iyLNLOedrCWviRsQ6PRuR4o
 p1yhl3CWSQFi6/X9i1tFCG3kT2MvmvLrYO39/6T4IlixhKGLZYXtTG4ql
 FEj28ION2zD+sNBNQj4O/AUMKo68/4gZS9G8OnDiDZ3DlpRv6epLqMIYJ
 0okwyL9+A3ACO15RsHimG5oz3ZCUcsJVjoMRbdUgPEXl8BLho7TNZOe1Z
 7N83nrEQyiJBFaGegXUxZ7dzHF0J13ErWDIjlR5PaWlqO1t+eu9wEw7tj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305807466"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="305807466"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 14:10:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="653550890"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="653550890"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 19 Jan 2023 14:10:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 14:10:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 14:10:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 14:10:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahghHEUdEhE4x46cR5fc8BmY0mnCErFKm7EQnWpEth3iRi6quSmmJHJF5JO591RJtU43rQ7vW5BH3bsECsTwNjCSofFaB5UqyabdP8UCyfky42uFGWAJoET9PEOXqRetcBcBVqMeeG4/eZ5Kfi4XHRwHqs35S9xSMK3zQG+GUpWCK20WkxxeYlx/TZzRvxHcfzz7h0+rheROcYOdBhvz/w+nFESq5K12NnFEU9T9J4yxpMFQZb3VUWMx3XAogJeESkg/1b9NrZsne1/XJwDsGZbMVGQhJ/1lT87Hdu0Xd0YrWkdWML9mzY0Khu4sBSYCh5TaQhsgu/UOSKaC1eMG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hry/Fc9zeC/bQjbzoy12+bSd1Kt2qSZd0IhtMoO1yKU=;
 b=jYdf/Dk5kd7GcgN/mGsQVD4uvDmX/BXt1JLpVG9qNhsxeLxxcfIciSOD287XafBMBisXki4d5ANTo0MZmXa34kfm4WE+9elz3//pH64/Cr9reaUvLbnNrsU0GicakwqpGWL9fLqdDl7Sb1gWhS53L/wYwv3nSZTA1VBSFfVti+fXJt3dbdL0YALb3mWpQXu8T1CrVoq+q1jPQp0MC1C4Ce8+DGNsQn1WYaZlF+aSUHy3Drhp9zhBczGn4KAx6BWdkEW5IiNAi3OS2Dsd8HuoWzC2w6yUKG+dGVz/imLvxJdSjhRQhdKaJ2x/1BA8IqMSEdItSUEOFZ0JqwhBaClJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 22:10:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 22:10:37 +0000
Date: Thu, 19 Jan 2023 17:10:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Intel-gfx] [PATCH v2 2/3] drm/fb-helper: Set framebuffer for
 vga-switcheroo clients
Message-ID: <Y8m/0UZl/aXxOnBS@intel.com>
References: <20230112201156.26849-1-tzimmermann@suse.de>
 <20230112201156.26849-3-tzimmermann@suse.de>
 <Y8hGsX+yafmFbq4g@intel.com>
 <7ec650c7-d530-54f7-5323-45c05ee50802@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ec650c7-d530-54f7-5323-45c05ee50802@suse.de>
X-ClientProxiedBy: BYAPR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:40::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM8PR11MB5655:EE_
X-MS-Office365-Filtering-Correlation-Id: f411d7a1-1695-4330-935f-08dafa69fdac
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dj4DXeuqaoK+4KnW2uTYgwBJ4/Ru3GeF8JblWcVE2DrmYzh5ZRSkfHn4IYlmGbc6YIUu8GhiUWYYan5yi8qTVGnNHyYOD66y5uh0L8XWlbBwOCb6kN0jEbccNN6xAeHFWO9MsM9iUVQeGN1sYr3l0Fo+scRZcOpdQ+mEGSXeOZtSt3z+SUNICKDLde3o8emH9arivXnSOO13GxzrmVjWMXXB9tHpRAtRqd9wHhQpri6cUlhpx1KfeVEv5l2sDbDCxO1daND7+GKdym9eziTCE0HDy2lZfGPJqbPQ0MQq0ucXqkf+R6hbHPQu5TJM1j6uruc4BuWiJY8LbEfvy/cTtuuiu/qZ9Sn25Uedln8zrTMGgktm4BtxpCqj2opb7aFX3bQRosWtvBuCIUSc+KsWrt8g0tHoKYcrmRLPR+pOOpklAcjn1YwJqKFvN2d3gmA3CiNLx6LU5FLHZM4O36EoaCNTst4wgJhh5MVe2q5YGwXTwdHjHkSNalyMJuyOCYdsTHJqXOVXQUenjcX3ByHA5A/7tbUrEmP0M3Ur4zu1B9AOi7LV3vvkap+p5igIPqrFDogV2jUWi7z150mW7ZLGvFMEdJdKUsI2JkP0zo1f1MFCOzlv8oI7kmFIm/7shv2GOGKgag+4cVfXuU1jIpf/uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199015)(86362001)(6506007)(6486002)(6666004)(478600001)(36756003)(8936002)(5660300002)(316002)(6916009)(38100700002)(66946007)(82960400001)(66476007)(4326008)(7416002)(66556008)(8676002)(7406005)(26005)(6512007)(186003)(41300700001)(83380400001)(2906002)(54906003)(44832011)(66574015)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cy9rMllEKzczejNhUFk3eWYveWg4SmNmWEZKRXo0a2RFVlc0M3Fka2xISUk1?=
 =?utf-8?B?RDZyVWN6OStIZVBtUklhakgrZWNCLzJ5UWJjWGFEelgvOWQ4c2tUUHVaTDg5?=
 =?utf-8?B?R0syVHlTdWphSEY4YjBZZGIyTWxSaVVHNkllakJLSjM5L1VHKzNFMEJvSGFq?=
 =?utf-8?B?TlhTckNLZUFkN2FwK1F0V0VTb0FqcUhOUmF4VFFWMGdaemx0VStNc2xBT0hx?=
 =?utf-8?B?NDJvQU5rVHVjaFZNaTVDOEpBR1hGSkxRbVZwNTRPUFVzT0ZVMzB2ZkxrQ1I3?=
 =?utf-8?B?OVptS0J0ZHozOThvMkRudzZaVDQyUWpIMXJ4SG5pNW85L200dFRTVTM5d21Y?=
 =?utf-8?B?ekI1LytHcnVIaWZTZFh6b3VOS1pRUkhLdjFUemNnSkdHZzgyZitoMW1wS01z?=
 =?utf-8?B?Z1ZnSFFTaDVzNE42alFVZUdxRW9ReEp4aXB5bmZwdWhnWTVnaSt6N3NHeWdM?=
 =?utf-8?B?czRKR0ViWHhvUzAwVGJkL2VJaHlmc0VCUDdVN0x4Y0hhN1pTbTkrU0YzSVRt?=
 =?utf-8?B?RnhobjBIb3FpWnByeDdBdHlHeGtQNEhJd0ZkUUR4TWhFL0k4RTgvMnZPY2N3?=
 =?utf-8?B?eXdoQ2RqTWJzQjJleXZlek5TRkxma3pCZWc1UXViM0dkQnBPeWkwWmhUbE5n?=
 =?utf-8?B?VWs5a2tHN28wK3hSQjhSWHFBZ0drVDlRR2Vqc2tHRzI3MTVxSTV1UmhEOCtK?=
 =?utf-8?B?dThGcTZyc2g4SldtWnZCYmdaWU5nc2R2Ky9MWUpOMDdsZFE2cGdqL0VtaEpQ?=
 =?utf-8?B?ZkVySjAxT0JFNTBGRVN2QzhSbDdZVWtlTEZrNTVmRDlpaDcvSjhFaER5SDFu?=
 =?utf-8?B?YVJURnBvL0cyN2ZGNk5SS2VBbVY4MFo1Y2F2TXEzVmJIYzhENXVKRkY4S3J2?=
 =?utf-8?B?MlNBU2lYNDhZdWgvbDN6dnZYdDdoRXpIdjBzMG1OS0FMUzhSTEt4NTBaNnN0?=
 =?utf-8?B?VWdtVThuMm5OVStPRk5uNlVkZ25VMkdpRW8xRmk2NGtreG1VcDcrclZ1QTdL?=
 =?utf-8?B?b1l5cFB6MU1MZmE4amIyZ3lGMTBoR1JvWFNpRDhkN0hHQWJqK3Y0bHZ3QndU?=
 =?utf-8?B?SmdGNkNma0FrVktFWmZQRnVKemcxeEtDVWNnQnEwak9reG9MQkwrdFF0SS9t?=
 =?utf-8?B?TWFhbTlBYUM4S25QcnlDUGFncktETG81a1dkUTk1ZCt2N3U2OUkyV1lrNVc2?=
 =?utf-8?B?dVBwQkRsbTR0OWluVGg4cXdPMXc0TjBwVCtnUm5KdU5jNjBmT1U3SG5CUTBU?=
 =?utf-8?B?bnRnOWlMdWhiOUh0cm1YTjdBNFU1aDF0UHJxL3BoeS9rL0RBaHlhb2g5NXhz?=
 =?utf-8?B?TFEyT3ZpMnhlVW9ncGh1V1dGOFRoQkpGWFg1VkVJclA2RzlnZmJ5QWRhLzIx?=
 =?utf-8?B?VVdMRmRpUFUzOXoreUlrZFBKRWVCdzZ3YVFFQXE5V0RBNFJ5UjlKOEh5ZFI0?=
 =?utf-8?B?VVpQRFp3ME9kYjlRNmRlQmZLbFhQbjdySU5COGluVlhNeGlyQytSRGx5Y1JT?=
 =?utf-8?B?OEhxYWtqdXVmZ3U3Q1FiNmJKZTdsa0JpN3YvWG81aTd4MldyWjFtYmRiVi9h?=
 =?utf-8?B?ai8vZ0pkOEZzNVNaVHJYenNnNEE0QTRkRGNzU1R3UDFVV3FaU1R1V1Z6RGQ3?=
 =?utf-8?B?Q1oyaVNLUUtYOFdCU2cxK1l0ZVU1SDFYMjdOa0REYU9ZdXN4Wi9ZNGVQeEZY?=
 =?utf-8?B?YkhBci82Ym1RdUFrTUljUjJLMVRxNzhiQS9OYUFCckJTMVBJTDhqd0VRN0Qz?=
 =?utf-8?B?SXpOL2g2S3ZHTFArMC9KVk9JUlNBMk5rd0FpWU0zZ3dySnJuQ1NFQjdXUjV2?=
 =?utf-8?B?Q2ZrbUpXZk1YdzhVdGhBTWRIY1JxSnQyTVk4TC9XMlRMZkVyNDI2TkM1ZDAy?=
 =?utf-8?B?Ni9CMlcyb2RtVDFVR3FXNDFMbkV6VnM1QnNrdktjcXdhcTFRSU8rU2FzUjI4?=
 =?utf-8?B?VStSOWtpMkt6ZXEzQzB6QmN2d24xMVc2UjFwWitPRmxFOGtPamlFdUk3WG1U?=
 =?utf-8?B?QVJ4QzlVOGJjS3U1QnRGVjQ5b3BVSmkyT1VsNWJPc09TU1F1T1B4NmliSnd1?=
 =?utf-8?B?a01NdlZjRk1lZjBtbmFiN3cyZnFwKzlNTHlMNVQzK2p3SXlDam9GWW83QlZ2?=
 =?utf-8?B?cEMyN3I4blVXTDdIVk1TYUUvN0tyejJlYWxvRFhnZ1ZUd3RIRWRCNDc5T1Rl?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f411d7a1-1695-4330-935f-08dafa69fdac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 22:10:37.1728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1vrK0RHOA33U9YGxG8WtGG17eb/s0Ho8PUUmPas+dO9spS0ZMJUqH37MjPkdcGWQ3vp0N9kNKElHfxc/HlWrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5655
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, kherbst@redhat.com,
 Daniel
 Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, YiPeng
 Chai <YiPeng.Chai@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guchun Chen <guchun.chen@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, airlied@redhat.com,
 intel-gfx@lists.freedesktop.org, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 "Tianci.Yin" <tianci.yin@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 jose.souza@intel.com, evan.quan@amd.com, tvrtko.ursulin@linux.intel.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Felix
 Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com, stable@vger.kernel.org,
 Solomon Chiu <solomon.chiu@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, alexander.deucher@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 09:06:54AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 18.01.23 um 20:21 schrieb Rodrigo Vivi:
> > On Thu, Jan 12, 2023 at 09:11:55PM +0100, Thomas Zimmermann wrote:
> > > Set the framebuffer info for drivers that support VGA switcheroo. Only
> > > affects the amdgpu and nouveau drivers, which use VGA switcheroo and
> > > generic fbdev emulation. For other drivers, this does nothing.
> > > 
> > > This fixes a potential regression in the console code. Both, amdgpu and
> > > nouveau, invoked vga_switcheroo_client_fb_set() from their internal fbdev
> > > code. But the call got lost when the drivers switched to the generic
> > > emulation.
> > > 
> > > Fixes: 087451f372bf ("drm/amdgpu: use generic fb helpers instead of setting up AMD own's.")
> > > Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Karol Herbst <kherbst@redhat.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Evan Quan <evan.quan@amd.com>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> > > Cc: Likun Gao <Likun.Gao@amd.com>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Cc: Stanley Yang <Stanley.Yang@amd.com>
> > > Cc: "Tianci.Yin" <tianci.yin@amd.com>
> > > Cc: Xiaojian Du <Xiaojian.Du@amd.com>
> > > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > Cc: YiPeng Chai <YiPeng.Chai@amd.com>
> > > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > > Cc: Bokun Zhang <Bokun.Zhang@amd.com>
> > > Cc: Guchun Chen <guchun.chen@amd.com>
> > > Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > > Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > > Cc: Solomon Chiu <solomon.chiu@amd.com>
> > > Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: "Marek Olšák" <marek.olsak@amd.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: nouveau@lists.freedesktop.org
> > > Cc: <stable@vger.kernel.org> # v5.17+
> > > ---
> > >   drivers/gpu/drm/drm_fb_helper.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > > index 427631706128..5e445c61252d 100644
> > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > @@ -30,7 +30,9 @@
> > >   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > >   #include <linux/console.h>
> > > +#include <linux/pci.h>
> > >   #include <linux/sysrq.h>
> > > +#include <linux/vga_switcheroo.h>
> > >   #include <drm/drm_atomic.h>
> > >   #include <drm/drm_drv.h>
> > > @@ -1940,6 +1942,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
> > >   					 int preferred_bpp)
> > >   {
> > >   	struct drm_client_dev *client = &fb_helper->client;
> > > +	struct drm_device *dev = fb_helper->dev;
> > 
> > On drm-tip, this commit has a silent conflict with
> > cff84bac9922 ("drm/fh-helper: Split fbdev single-probe helper")
> > that's already in drm-next.
> > 
> > I had created a fix-up patch in drm-tip re-introducing this line.
> 
> Thank you. Is it fixed for now?

Fixed in drm-tip, yes. But broke linux-next as well. This
resolution will need to go up with any merge...

> 
> > 
> > We probably need a backmerge from drm-next into drm-misc-fixes with
> > the resolution applied there. And probably propagated that resolution
> > later...
> 
> Backmerging from -next into -fixes branches is a problem, as -fixes should
> be close to the latest release.

doh! Indeed I should've known this by heart... -ENOTEHOUGHCOFFEE

> 
> Can we solve this by merging -fixes into upstream and backmerging this into
> our -next branches?

hmmm... probably better just wait and let folks know the resolution
when the patches are moving up...

> 
> Best regards
> Thomas
> 
> > 
> > >   	struct drm_fb_helper_surface_size sizes;
> > >   	int ret;
> > > @@ -1961,6 +1964,11 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
> > >   		return ret;
> > >   	strcpy(fb_helper->fb->comm, "[fbcon]");
> > > +
> > > +	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
> > > +	if (dev_is_pci(dev->dev))
> > > +		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
> > > +
> > >   	return 0;
> > >   }
> > > -- 
> > > 2.39.0
> > > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev



