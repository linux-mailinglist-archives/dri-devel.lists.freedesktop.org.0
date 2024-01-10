Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2BC82A1AD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 21:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D651010E66E;
	Wed, 10 Jan 2024 20:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4289F10E649;
 Wed, 10 Jan 2024 20:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704917265; x=1736453265;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FmczAb2XxW4SaqWB2TmauDGiS8Efj2mE+iiWI1q0/F8=;
 b=TqkGzu7jDjPhuXCIcJ0d5yga1zwzNujcM3UVs5AqTtNCl/enHyn8Kl7p
 3EZGZ98KbIWDsfYuiYi3Mrcu0D8ZDPtCjteySfcQXW3DFg7tdKH51aCe0
 69/+WBHO8s854ZH2aFP0w/6LHpoPUVv947prtY4eU5SJIxkwftagaPIiC
 ABGL952l+S4UDVVW72U/Opki9p5BF9Pw9+Mp1xDRszdPNkbWvPdoi8gjt
 i2ReB2KE3uxkQZOlak1ere0PoeGKphzHn+Lx2sQgxZXDZVovpElyQglYn
 6k2XMUjTpuq5CqQotbwi6S+kqbhRsSJWI0ZqwYe8XNYIuXZ8L1HFiDznf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="484819042"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="484819042"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 12:07:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1029265041"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="1029265041"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 12:07:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:07:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 12:07:43 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 12:07:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hcw1eXfcZ/jc0N1lQcF8UlTuyuk1ilB2zIb1l2UvSZhOZvMUtXb56XyF1zIyonHTllibMWonFoeAR+tDYMTTy/C9zBioCuV6Btd2svP8Q0xE9XqEYVGy/PUN9zbDIBwGuDdXM00YV+YE+qAWRx/7IUY95JZGWMuYm52I/AhwZP4yjM8LY6f1FS4KU1svJ55B1I5BeusZPHBZ7HKsnecOiKakj4bKQr5G9HiAJcP+7t6K3S0fMZ+IxmUsEDL10950jn/F6w6zbjxOkCeDATEAXAkOAtH38xf20lq2/aXjC18Q9cLeHui/TLOVL7+GOA11xHWLOCIPvHO8s8Ym85a7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kcVXCypmLCxVFPbMexQTvxhv9qCg9Y0wzFfvlf5uag=;
 b=SgGePApdAjW8RvKZWkvNM/YV6k/PvlJaiDRRGIhGp3UUzZK3+yKWsavx4eulRC7mrjOKySoB141EsYpZYgZ4ut6DHTZX8pEcHMjf0TsNHBTEZY2ADwh0RM/TTBzKmXeFuIATvvCnXGowELO1gCplb1JzGDZw0wtBpthxCNQ0nb6jGDFEwZIi3GM4l+uhXOVZ9XuAGIA5t/X7ZFIztPcKR7riZl0T0C7/l6mbwalfGLr5jV1FvetYwQJCe9TxHBx946IGmMBOeQdLrzFxx6yf125/5xPazXeI608lxC4LxpdFazWJfQGMmHMTtvuSjKxbV0EZVkLhUIgkSKOsWPaVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 10 Jan
 2024 20:07:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 20:07:40 +0000
Date: Wed, 10 Jan 2024 14:07:38 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/doc/rfc: Remove Xe's pre-merge plan
Message-ID: <xcb5zvot4465q2n3y7bf7pz2fr6um4nntgfk2wdzxghzurz4ky@yqviz73ktgqs>
References: <20240110190427.63095-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240110190427.63095-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: e9e41d78-37d5-4fa0-1114-08dc1217cc40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GA5wZ48+/MGEoJsmrSvxacG8if2zEPcCeZ87uFFSzHvCw6YR6iNlYJjzbYFdUX6uq+py3EaWFuCVhO9pzt6PEvYDjvg9sUcxtXNsinHVTzQoQdtVU7rswhU568vGIBnzDRL9ZoPOqjo5G/mbQMNxMi+Ek6+rprGbUwoudzFiFCzYei9+NYVPDrlOhUxCyJ6ASls5xKUupTBGZWgDrIeBY5DeTgxIB/ihfBoyR+awcWFPuocQHVryZfDQIvSXNFHN7XbLJB+5TTSprgeuV18un6LoVV1TtrykMh/B9eQvVLkTtRG0cGUyQd71Ri5uOMjSkDFu0GdYbneKOhfMPrqjJEYMlI1L1SdYIT8KK7RfsjiudlRgONowtSiWGo6dVHHUTSg8jmrxhkqAteu9yWoW38LNK93mkhFE3laFAR4BEAvWsb5rtRYN0+R4zKTEWLCzx1Z1Cus8cEpJNN3XlR0gfX13z6u/HPJl1Tb+IzAjjb53sydGCjLKJ6vWIA2bN5IwZBw8Tv0EtGyyxQEbm/UHEYgJH9ZCNuMWUKJR959HJp9gxEHye0VIR4ufm0olY5h68kxKbqYyL6Yxr78qFuphotGF1Pdh7GwgJ93LlpJMIQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(346002)(396003)(136003)(366004)(230922051799003)(230273577357003)(230173577357003)(1800799012)(451199024)(186009)(64100799003)(26005)(66574015)(966005)(9686003)(478600001)(6512007)(6506007)(83380400001)(5660300002)(30864003)(2906002)(33716001)(41300700001)(66946007)(6486002)(6636002)(450100002)(8676002)(4326008)(8936002)(66556008)(316002)(66476007)(6862004)(82960400001)(86362001)(38100700002)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmNLZlhFYlZHejUrS3g3ZGtWdmpGOGZ5ck9YUXBxNmtqaWFhdmlWdUhRWUN6?=
 =?utf-8?B?cE1WV3lLS0tzcGtkaEtiRkFyb1AwTnppTjVaTlMxa1N3ekpKOVVKUjdaN042?=
 =?utf-8?B?RDZZQkRSTk5GQmVoRFArV1NMczlGc2dqQkE0QUlJdG9GWitnWm5QRDdhdWpE?=
 =?utf-8?B?YUJaYnZLZzBmdUw4d1Q4UklyNFJkdEJnMFBFZzBrRkluTnJoN3R6WE5Vak9z?=
 =?utf-8?B?VVd1aU1SeVVsUUYyZi9DSWI4VTdpRG5idEY3Q3R4L2trM0lDNG0relU4dUNw?=
 =?utf-8?B?Q2lpZHZ4UlZVdjZiUGVHWHEyVHJ6aWphdm04UWNuVEFFc3A1MStaRHI4STZ4?=
 =?utf-8?B?UkpjakxTNnVMNmdEdUFNZGsyUzQrRmhabHZ6Rm5Vemx3ZVZSRnY0dkZwN3Ex?=
 =?utf-8?B?TXRKVERQazhmZCtwQ2R3TUk5dDhvdU03UHd3YlFsMWFpaFZGbG9JWTFvT2Z4?=
 =?utf-8?B?NHM2Zi9zWW5RNVFISkJuRXZtOWZ1cVNDOTFCd3ZYWDlma09wZWFHL2F1OWE3?=
 =?utf-8?B?LzhpL0x4bCtkTXFtd0VyK3JkMEJnSEJxSE1RaFErR2FEQy81MEhEdTR4aEhX?=
 =?utf-8?B?SzUvaGRra01yVXQ1a1o2M0d1VFRxeStBeW9wU1VaekY4WUpkVENJMHB6dHJT?=
 =?utf-8?B?TDdrZXVaMkx2bC81M0djWWRFUW9nc084bm5DS2VpVXo0c044dHVNY1Yvc1RV?=
 =?utf-8?B?RVRDU2ZhemJhWXhuQUU0NXVoZXErdGg3ZkliTjZBeVpxMmlmYkJOd0s0NG54?=
 =?utf-8?B?MUJ2VWVSeTFoYWNuVWFPTmFvZ0JzQkNwcVJweHFUSVN4dkdVUmRjemdsOGJw?=
 =?utf-8?B?YnNEWmx2UG1Pb2NEc2JPeGNONDU2UVR5TGJ3b05VWnZzRTU4ZVpva09rVVFp?=
 =?utf-8?B?blZ0SlFCRXdBNFdEUmp5T2NWbGVlbFZaTVMySWdsUjY1dGJWUzdWU2EwMm91?=
 =?utf-8?B?djJ3NDRER1RIUUgvN3V5ajFSSjB3OG00UzFQenhBRDNLOGRZeWtwSjdtNnRt?=
 =?utf-8?B?QlI0VUVjUE0xYktaTFpOekhRdit6a3pVMHNtZWRlU1BmZjdFZE9hNEtRZGgr?=
 =?utf-8?B?S2laekxMM1oxTUIwdXpwREpEVEoyazRSN0tGdmVnUHFIaWorRlduY1g4NHhV?=
 =?utf-8?B?blowUnNlV0FYMXFsV25qZFNubmtoNHBvSGo4K3hXY1NEaG5RbnJnalZKYkEr?=
 =?utf-8?B?Wld0bllPWWRhNHRWdnlvejZQOWY5RGViS1oxSmlneWhUM1h6QVdnNEIvYWI3?=
 =?utf-8?B?SGIzakYrZGM0VU40YmF3Vi81Z0h0THZZbm93Ky8rR1A0QUNCVWp2TFNXZGU2?=
 =?utf-8?B?b1Urb01iRm1yTFFOWW5mc2dBdE1DTW5qRWdjUVFJa09yNituWnZYNXBIRFg3?=
 =?utf-8?B?bWp0NTFTZFZ6bkNQb21LbTlpZG9ManNxMmFoZGFYdmpPcElrdkFyM2owcVBa?=
 =?utf-8?B?VVRPQkpVVzEzWGNmTlQxRTdPOENlQkNKVm9DdmsySkVmRi9LaXdpaU1PalBQ?=
 =?utf-8?B?MDc5THdEaXE3R1gxWGJlTm1aQk1QVG9KVnFySFYvSlp5NnpxdGc2Ny9xbTlO?=
 =?utf-8?B?emtVQ29EdDkweXl0TlBZRks0SVNrdS95cXRveEJnM1U4RklZRHYzRGFka21K?=
 =?utf-8?B?WWk2VHhGa2pQMlh5RDBwZWdRdFlpTCtoTWFmUGNROTlDRE5UWTZkUzRUU3Bj?=
 =?utf-8?B?WDJhMGJHMG1qRW1hSEJPM0Rla2g1M1N0RGltWDNrcXdXQmJJZDg1UHd4YXIx?=
 =?utf-8?B?REdOZUdqRDRvMDFKOFRKVDA3K1Z3Z0JVUC9HWU5lMytQcUFYR3VvdEdFWFpz?=
 =?utf-8?B?cW42dVhZSkVnV0E3V09CVkIxWERhdm5PRW9ldVJVWEpPTEFwMFM2em5RcGl3?=
 =?utf-8?B?L1NUa0poNlFFMXM5bFBYY1lBbTVrWU4yc2V5Lzg1NDE3bzM1L2U5MitxdHJB?=
 =?utf-8?B?S0M5UUJSSDZ6dWZOczhVTmh6TWxtMmJ5aWU0dEZ3Z0dPRDVsUXJaRWdiaXl1?=
 =?utf-8?B?VGJ4RSt3SlZzYTUxUVVLOEEwcDRBbGxlUWFqUUF0NTFMWWVzeDhHdFBSOUcw?=
 =?utf-8?B?WGl2bVVFMHg3bzBMaE1GRk5vQjFpZWg0N243c09BTjdtNlN4YVFac2lRUDJU?=
 =?utf-8?B?RGlmSUpRcXBEcUFXUS96dzhZRXhSS29GcnBrMDFNMjViSjNtVlJwOVFwRHlx?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e41d78-37d5-4fa0-1114-08dc1217cc40
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:07:40.1659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhQBK4ZTH84CeYz8uCj0Zpr9PmIyZb9y+K4o7+cP27NXJJsKsIUIVS5j/TUDp4LawhzDnJRtc1c6VLX33fCbdVT2uBuGwATG27xcHE11zb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 02:04:27PM -0500, Rodrigo Vivi wrote:
>The last TODO item here that was not marked as done was
>the display portion, which came along with the pull-request.
>
>So, now that Xe is part of drm-next and it includes the
>display portion, let's entirely kill this RFC here.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Oded Gabbay <ogabbay@kernel.org>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> Documentation/gpu/rfc/xe.rst | 234 -----------------------------------
> 1 file changed, 234 deletions(-)
> delete mode 100644 Documentation/gpu/rfc/xe.rst
>
>diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
>deleted file mode 100644
>index 97cf87578f97..000000000000
>--- a/Documentation/gpu/rfc/xe.rst
>+++ /dev/null
>@@ -1,234 +0,0 @@
>-==========================
>-Xe – Merge Acceptance Plan
>-==========================
>-Xe is a new driver for Intel GPUs that supports both integrated and
>-discrete platforms starting with Tiger Lake (first Intel Xe Architecture).
>-
>-This document aims to establish a merge plan for the Xe, by writing down clear
>-pre-merge goals, in order to avoid unnecessary delays.
>-
>-Xe – Overview
>-=============
>-The main motivation of Xe is to have a fresh base to work from that is
>-unencumbered by older platforms, whilst also taking the opportunity to
>-rearchitect our driver to increase sharing across the drm subsystem, both
>-leveraging and allowing us to contribute more towards other shared components
>-like TTM and drm/scheduler.
>-
>-This is also an opportunity to start from the beginning with a clean uAPI that is
>-extensible by design and already aligned with the modern userspace needs. For
>-this reason, the memory model is solely based on GPU Virtual Address space
>-bind/unbind (‘VM_BIND’) of GEM buffer objects (BOs) and execution only supporting
>-explicit synchronization. With persistent mapping across the execution, the
>-userspace does not need to provide a list of all required mappings during each
>-submission.
>-
>-The new driver leverages a lot from i915. As for display, the intent is to share
>-the display code with the i915 driver so that there is maximum reuse there.
>-
>-As for the power management area, the goal is to have a much-simplified support
>-for the system suspend states (S-states), PCI device suspend states (D-states),
>-GPU/Render suspend states (R-states) and frequency management. It should leverage
>-as much as possible all the existent PCI-subsystem infrastructure (pm and
>-runtime_pm) and underlying firmware components such PCODE and GuC for the power
>-states and frequency decisions.
>-
>-Repository:
>-
>-https://gitlab.freedesktop.org/drm/xe/kernel (branch drm-xe-next)
>-
>-Xe – Platforms
>-==============
>-Currently, Xe is already functional and has experimental support for multiple
>-platforms starting from Tiger Lake, with initial support in userspace implemented
>-in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well as in NEO
>-(for OpenCL and Level0).
>-
>-During a transition period, platforms will be supported by both Xe and i915.
>-However, the force_probe mechanism existent in both drivers will allow only one
>-official and by-default probe at a given time.
>-
>-For instance, in order to probe a DG2 which PCI ID is 0x5690 by Xe instead of
>-i915, the following set of parameters need to be used:
>-
>-```
>-i915.force_probe=!5690 xe.force_probe=5690
>-```
>-
>-In both drivers, the ‘.require_force_probe’ protection forces the user to use the
>-force_probe parameter while the driver is under development. This protection is
>-only removed when the support for the platform and the uAPI are stable. Stability
>-which needs to be demonstrated by CI results.
>-
>-In order to avoid user space regressions, i915 will continue to support all the
>-current platforms that are already out of this protection. Xe support will be
>-forever experimental and dependent on the usage of force_probe for these
>-platforms.
>-
>-When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
>-
>-Xe – Pre-Merge Goals - Work-in-Progress
>-=======================================
>-
>-Display integration with i915
>------------------------------
>-In order to share the display code with the i915 driver so that there is maximum
>-reuse, the i915/display/ code is built twice, once for i915.ko and then for
>-xe.ko. Currently, the i915/display code in Xe tree is polluted with many 'ifdefs'
>-depending on the build target. The goal is to refactor both Xe and i915/display
>-code simultaneously in order to get a clean result before they land upstream, so
>-that display can already be part of the initial pull request towards drm-next.
>-
>-However, display code should not gate the acceptance of Xe in upstream. Xe
>-patches will be refactored in a way that display code can be removed, if needed,
>-from the first pull request of Xe towards drm-next. The expectation is that when
>-both drivers are part of the drm-tip, the introduction of cleaner patches will be
>-easier and speed up.
>-
>-Xe – uAPI high level overview
>-=============================
>-
>-...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
>-
>-Xe – Pre-Merge Goals - Completed
>-================================
>-
>-Drm_exec
>---------
>-Helper to make dma_resv locking for a big number of buffers is getting removed in
>-the drm_exec series proposed in https://patchwork.freedesktop.org/patch/524376/
>-If that happens, Xe needs to change and incorporate the changes in the driver.
>-The goal is to engage with the Community to understand if the best approach is to
>-move that to the drivers that are using it or if we should keep the helpers in
>-place waiting for Xe to get merged.
>-
>-This item ties into the GPUVA, VM_BIND, and even long-running compute support.
>-
>-As a key measurable result, we need to have a community consensus documented in
>-this document and the Xe driver prepared for the changes, if necessary.
>-
>-Userptr integration and vm_bind
>--------------------------------
>-Different drivers implement different ways of dealing with execution of userptr.
>-With multiple drivers currently introducing support to VM_BIND, the goal is to
>-aim for a DRM consensus on what’s the best way to have that support. To some
>-extent this is already getting addressed itself with the GPUVA where likely the
>-userptr will be a GPUVA with a NULL GEM call VM bind directly on the userptr.
>-However, there are more aspects around the rules for that and the usage of
>-mmu_notifiers, locking and other aspects.
>-
>-This task here has the goal of introducing a documentation of the basic rules.
>-
>-The documentation *needs* to first live in this document (API session below) and
>-then moved to another more specific document or at Xe level or at DRM level.
>-
>-Documentation should include:
>-
>- * The userptr part of the VM_BIND api.
>-
>- * Locking, including the page-faulting case.
>-
>- * O(1) complexity under VM_BIND.
>-
>-The document is now included in the drm documentation :doc:`here </gpu/drm-vm-bind-async>`.
>-
>-Some parts of userptr like mmu_notifiers should become GPUVA or DRM helpers when
>-the second driver supporting VM_BIND+userptr appears. Details to be defined when
>-the time comes.
>-
>-The DRM GPUVM helpers do not yet include the userptr parts, but discussions
>-about implementing them are ongoing.
>-
>-ASYNC VM_BIND
>--------------
>-Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
>-Xe merged, it is mandatory to have a consensus with other drivers and Mesa.
>-It needs to be clear how to handle async VM_BIND and interactions with userspace
>-memory fences. Ideally with helper support so people don't get it wrong in all
>-possible ways.
>-
>-As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
>-various flavors, error handling and sample API suggestions are documented in
>-:doc:`The ASYNC VM_BIND document </gpu/drm-vm-bind-async>`.
>-
>-Drm_scheduler
>--------------
>-Xe primarily uses Firmware based scheduling (GuC FW). However, it will use
>-drm_scheduler as the scheduler ‘frontend’ for userspace submission in order to
>-resolve syncobj and dma-buf implicit sync dependencies. However, drm_scheduler is
>-not yet prepared to handle the 1-to-1 relationship between drm_gpu_scheduler and
>-drm_sched_entity.
>-
>-Deeper changes to drm_scheduler should *not* be required to get Xe accepted, but
>-some consensus needs to be reached between Xe and other community drivers that
>-could also benefit from this work, for coupling FW based/assisted submission such
>-as the ARM’s new Mali GPU driver, and others.
>-
>-As a key measurable result, the patch series introducing Xe itself shall not
>-depend on any other patch touching drm_scheduler itself that was not yet merged
>-through drm-misc. This, by itself, already includes the reach of an agreement for
>-uniform 1 to 1 relationship implementation / usage across drivers.
>-
>-Long running compute: minimal data structure/scaffolding
>---------------------------------------------------------
>-The generic scheduler code needs to include the handling of endless compute
>-contexts, with the minimal scaffolding for preempt-ctx fences (probably on the
>-drm_sched_entity) and making sure drm_scheduler can cope with the lack of job
>-completion fence.
>-
>-The goal is to achieve a consensus ahead of Xe initial pull-request, ideally with
>-this minimal drm/scheduler work, if needed, merged to drm-misc in a way that any
>-drm driver, including Xe, could re-use and add their own individual needs on top
>-in a next stage. However, this should not block the initial merge.
>-
>-Dev_coredump
>-------------
>-
>-Xe needs to align with other drivers on the way that the error states are
>-dumped, avoiding a Xe only error_state solution. The goal is to use devcoredump
>-infrastructure to report error states, since it produces a standardized way
>-by exposing a virtual and temporary /sys/class/devcoredump device.
>-
>-As the key measurable result, Xe driver needs to provide GPU snapshots captured
>-at hang time through devcoredump, but without depending on any core modification
>-of devcoredump infrastructure itself.
>-
>-Later, when we are in-tree, the goal is to collaborate with devcoredump
>-infrastructure with overall possible improvements, like multiple file support
>-for better organization of the dumps, snapshot support, dmesg extra print,
>-and whatever may make sense and help the overall infrastructure.
>-
>-DRM_VM_BIND
>------------
>-Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
>-fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
>-development of a common new drm_infrastructure. However, the Xe team needs to
>-engage with the community to explore the options of a common API.
>-
>-As a key measurable result, the DRM_VM_BIND needs to be documented in this file
>-below, or this entire block deleted if the consensus is for independent drivers
>-vm_bind ioctls.
>-
>-Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
>-Xe merged, it is mandatory to enforce the overall locking scheme for all major
>-structs and list (so vm and vma). So, a consensus is needed, and possibly some
>-common helpers. If helpers are needed, they should be also documented in this
>-document.
>-
>-GPU VA
>-------
>-Two main goals of Xe are meeting together here:
>-
>-1) Have an uAPI that aligns with modern UMD needs.
>-
>-2) Early upstream engagement.
>-
>-RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
>-track of GPU virtual address mappings. This is still not merged upstream, but
>-this aligns very well with our goals and with our VM_BIND. The engagement with
>-upstream and the port of Xe towards GPUVA is already ongoing.
>-
>-As a key measurable result, Xe needs to be aligned with the GPU VA and working in
>-our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
>-related patch should be independent and present on dri-devel or acked by
>-maintainers to go along with the first Xe pull request towards drm-next.
>-- 
>2.43.0
>
