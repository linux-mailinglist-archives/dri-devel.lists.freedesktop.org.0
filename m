Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD90A93B3FA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 17:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77FF10E72F;
	Wed, 24 Jul 2024 15:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mu3m+yNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD7F10E734;
 Wed, 24 Jul 2024 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721835620; x=1753371620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8UegYP/kzp9a4ftxr0zregdup4k6qhAY4HGOJnRTHyY=;
 b=mu3m+yNWrRKQaK5waccnC6CGZgG1vkL1+FKefBFddQ7qJlQqmFkc2az7
 Q1cN4NruyNjEiY8na7ZAK/JfaoDV9eUZAQ/I7FONJsYOnboNz5w/WSSvD
 vQ1SqmXLZXHlMC1+wpzsdHuX9FUj7sz4eI9zHx0+3WNMcxZzKvEJzwSJX
 YSmzaN4vwiBAaU9wIcLpAuiNwqGH60Lt+374B9gRU7OG7bXxbgYh80gkL
 T/hcB2g9C9D2gI8Y6OhBKbhqT4X95ktGTC0DQBEc8uTq0O54U4DdLRc1d
 bSDJe/IcRhioUFfe3Zkt1q/OKyHkIbTz5GCWnjaqfNXGLAED/M6U4RZ8q w==;
X-CSE-ConnectionGUID: fUlcS0UCRrSmJFh2Y+tBlw==
X-CSE-MsgGUID: Brmu9of0SaSAWTv0mtTRrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19659917"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19659917"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:40:19 -0700
X-CSE-ConnectionGUID: iEqf+yY8QRW3WHbjZRWmqA==
X-CSE-MsgGUID: 6p+OvxgLR4epa2ut08ZllQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="52496547"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 08:40:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 08:40:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 08:40:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 08:40:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFrgBdLsBkp2fII46E2hPVNSFpbst88VOfSXJJnXEA3iPcDQDoQjCheYMm//GjKLv6VhHc85yYg1xTO3xYkng8GCb/+xOfX5MX3rpF1K2MCoiZl25u+w54Su0AL5OPEL7HqhgPXRlOp6zEt2VEIWLqfx4TI5tokaLyOPeDKzESLbV533o+ZCZkAz0tSXBYslDXHGCkxPoMis4ghAj2hSVVnThWuQGGJ/sV1dpmuXBy/p8SZy27nanHPbfRfGmqzgXkUPaoCEGQe6HC0G/ZzhqZ1D0dsucKJ3aoL0JREGnqfERehj/WMj/44K9N8Ny5Y9KQil3aCNf9iHkVfRRov0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nj5wUH7VD4Xl7XzmAiFNrogtrKeSwB6WRxUUXSLNQ7U=;
 b=tTPX8lx/oApZ/5vpaPmK2uyDXSJw+w56KAZFyhWIdJnW5hIIxrQKgP/AYsWHHoKpa7N8P0RYT5q3c1lfX602+cIMo+JIJaawf2HmzDHnbz5QXSNmJKO50TrEOfzZGASvY4phIRN2/qmduptemAoKQy9ao+9O5kzdT4wrPB6uVbNcqTkEjpTzhX5nEG0+K1a4DccKKNclrSu9UfvrrZFE0kjXhk15QEpck/SZ4tDlH5mO6pGYJPvhChe7FXzQe5iOPZLVWwe54MLxstL3SiL+uSyjF51RORBnDQixIGdDB5syQNIShtfSWKKglaZz8ACf/DoVafufNzY4N/ejdzSfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8487.namprd11.prod.outlook.com (2603:10b6:408:1ed::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Wed, 24 Jul
 2024 15:40:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 15:40:05 +0000
Date: Wed, 24 Jul 2024 10:39:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, <intel-gfx@lists.freedesktop.org>, 
 <linux-perf-users@vger.kernel.org>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, <dri-devel@lists.freedesktop.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] drm/i915/pmu: Lazy unregister
Message-ID: <6n2zgfqn5sn6borrd7hfbbavq75ht66u646sdxlq44spbirzru@yv3bxtd2x55t>
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
 <20240722210648.80892-7-lucas.demarchi@intel.com>
 <be3871bd-fc25-482e-b4d4-91afc4d5b5a5@ursulin.net>
 <xsuzfv4rzb4c25sibt5gjskn7xyfwf33wgwaw4nkz5jlnvl2ke@ekur5xvhec3z>
 <20240724124105.GB13387@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240724124105.GB13387@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: MW4PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:303:8f::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 31eb95f3-40b6-4ec2-4e43-08dcabf6e3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fd5wgc28qXNWcJpXBWhRJZ6/X53ivPcRHXF1BGF66e9N6i5FG8EjX1DTxcmp?=
 =?us-ascii?Q?RKlpHkdn+LWozlIVk4Dr1sOYnTc8Czz+dwdGsVcnMOxfL+Grz1DOkPTux/ag?=
 =?us-ascii?Q?qmubM3JIXJuZZuoohNfttEPPQJkJmkvrEzG2aPCeoBOC9xviEloz0+xKh9xW?=
 =?us-ascii?Q?6JiqG0IfFKbBWl3SR5eeR1amKCuoSBvlUo6IPJLhxWMFZLzHbyHOzQqOt5Tt?=
 =?us-ascii?Q?Db85vVhUIdS7yFI96gxrgZ/2Mjvra3A8pbKgriGIGBmF0ouklsBgDBoSWV93?=
 =?us-ascii?Q?zrOGxNxeyjId6friLX+OC2BbYr6JFSh393payNSJPItHCKjqRINteKp7FA72?=
 =?us-ascii?Q?SdSjEXvw3JwYe1fQuNWnmmy5HP39Yd4p9Hvb5Qd46gpKF7SibIaaPNclJzRS?=
 =?us-ascii?Q?HOyu/DXD8PYK+41Zn1/uS8J+VRJQ3mIKxv1rN3bLwalp4/PfdtQYjv/RO4kT?=
 =?us-ascii?Q?rYiwJzzk4O9nR75QbFFnWtx3Q35so7Gh1inLVgF7v9ivbZRfs0cFiZRgZ04F?=
 =?us-ascii?Q?MuLIU4gq3j7ykW/q3KgnNHVCKo41WrjB6+aD82//MfVqLjhuCcD/EwgW5Rzh?=
 =?us-ascii?Q?t2BEhr9B0aw2sTDAzZHPjI+jVOu3g50aiGuVDpZu/pGEE/eoFTDIZndGZPhR?=
 =?us-ascii?Q?kdqOTZUDts6XhX/t7C5da/Q2UAD+xUAgxHplL20NoSNs1WHLbsCiZIut7ysj?=
 =?us-ascii?Q?sCy5V1pWQhtNAx2J4tTF9ACloXYpeLPG3n0uAKKz/SqeLWciUR/uSFLAta0c?=
 =?us-ascii?Q?0J/Z5Zj7yoV+OlSU38GLDFl4GOKKVtxkXZXwtHujwdLCSnbCnweNvP+DlaW3?=
 =?us-ascii?Q?WTJbCl59AYgUYDz1XTpLgS+VGIYxlU2faeXCp5SvHUH+JQ+8I0ZVCqtcS/EN?=
 =?us-ascii?Q?Oc+sxa7DSV+w3FuOpux/EFW8srRkUQHafLt+9tThJRT4oIGOacl/kQ0E16qt?=
 =?us-ascii?Q?lZaWQwY0A7PjiHigMRu1ZNSrj8XUpfTBA07doP3QMW2AMM/zdJJefMkC/7Kk?=
 =?us-ascii?Q?Qg5PEZ+18+HLP+1cEffwCMtrYWYmsCO0D67tQJNMqMDBsheGFk4TL6gQUXGE?=
 =?us-ascii?Q?3pKy8qVhsvQXqz9R8NlvJozUxAeTdOC1X90HcdvVytpfU44XeoK8U1p23fjH?=
 =?us-ascii?Q?ZgZwWyH0IDlK1RMzZvrRiED0+6kBSa6wpzcxLBzB+XQoGZ+e3WOPBChCQj4d?=
 =?us-ascii?Q?Nl5/FsQnLQWkD/sMCIOEItebjEZUtCsy2zfh1SzvkUhc41eG9OnGwzwp6GkJ?=
 =?us-ascii?Q?cxgWOawyVaSkEN6vQxpErtJPGzuWTmHwm+jI5nmgF9VsRBHNHbNraF8M0poa?=
 =?us-ascii?Q?A0dqirtLxFO2VwTEMg+1SVJ5qUEzEOEXHUYXa+EK2tCOMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jR/UcrJqkHGqMHeIt0hACkHUxGSV2hzVEfoTfAax/n2mUbGoFrsEjzORdTq6?=
 =?us-ascii?Q?mmknH9tMEMPMc40z3AmabnJz0pllJpd+1Fcqh2YE2O0xs48QK8d/2BhphVpb?=
 =?us-ascii?Q?aVsKeAds+xldSk9qx+3gsqQClug82JL+8DGavqIMpBpfWRK3BJGANxgl7G+X?=
 =?us-ascii?Q?r8jk62JzdfUf3o66M+fYcAJ5LowSipShQ0BDyOgMwi2U4CL9kvfhEtY4yCMT?=
 =?us-ascii?Q?E6d7HFIE9ClXMbWkOMtaZLtgcdATghvI3amnNvmFchckX9YZUmP5OrcPcv8I?=
 =?us-ascii?Q?3R9Dz8zg3TssfDZYYANmXH/R+VQisuN7ViCHJj01tCJ2MXkGrK0FGMkZhj1F?=
 =?us-ascii?Q?hcMPppVjQ0ZqHGiKfD6BXM9O7dzqBcNro+rG6UFkn2QAsZziE4blbE86GWGx?=
 =?us-ascii?Q?Yf4K0nO/hx7KPxSgYPNWEex6n3yx0HDDZVyTou+0AALowu8wncIxWOhU4viX?=
 =?us-ascii?Q?tXTWBFgl78GUhbo/MMyPTQjdTrk/0ayR1Y4XfuBZ22rZzpCNHkqchYv+jwUb?=
 =?us-ascii?Q?bp5nGOPwbFnds86cC2bJoS0/rnFwiXRS8T5Bl8CsAeEgYJzXECh2gOmYPS39?=
 =?us-ascii?Q?LQ0jNHkvLiclTgtg6sjzW0zgZnkqgdUepCuM6TXwfSR6DGQcnxgBzlL/CHpT?=
 =?us-ascii?Q?0hHKuduRhPbkXykhvfiRhSXlg8Q/BLUcLi71sK+knPBzwcHnHAIJj3fvzC9b?=
 =?us-ascii?Q?Ou+SuLLzDdPl6nfJmyNILP7JYgUt+UZPOH2dpEjob1jCAryNzQjRD+EEjjgZ?=
 =?us-ascii?Q?N6C7TCwM2/l3uWkJ/HYBgwzV/M68ACAPXlM6G2/c9mYw/zJv2fWoM2ajAEoQ?=
 =?us-ascii?Q?2ceDOZrF+SCqvRjx5FP08mcRUMBIquu6XCTzF0DEGhllRG8tNNTh6ZEZj+ch?=
 =?us-ascii?Q?2wMSNv01xRiSOvDIhVLtnAk4NjCEWM7VwjxhWOl9irdGTGpj0hj5+X2c9Rcm?=
 =?us-ascii?Q?CgJjx1MSukg7BLxF0tH0QuwG4qOfvGmjI3X86mxwMjO+R9NsbPoqkuJJY0Dc?=
 =?us-ascii?Q?ik7xP4o1Qjrd3FHAEosQYRRT9cKhfPoQ6m3em4qjMg+CNjDA1CU2hiubDnwt?=
 =?us-ascii?Q?acmZCBOwE3ky11m5Fc/OAtzlCC03JN01fcefQHiOyRYB0SoC6KhMwsg51LAF?=
 =?us-ascii?Q?vvC54V0gOouJCyoOJfdomw/FY+tJvKlCJL9fo3CdbpNKEFccMf8+p6Tl7ejA?=
 =?us-ascii?Q?k1pwIKMEq8q587w/Wqu7PURuSJRdaLHpVYNub20sv7FAY66Cj8HynTbjy7P6?=
 =?us-ascii?Q?XMv0oqfCGhx3L+D72s2PAr7b9Tj8vzW05vvTGG9YJyMpIlucdEZPnzQTqj7U?=
 =?us-ascii?Q?xyadczt73TP27D7TzvDs/L1U1clE2Qpp7lq6TbJCbXu+Gxy5hWsqQF982b2t?=
 =?us-ascii?Q?FeuWSl7xF6LeInauGOOO15b4plQlJJ5rxOWW9pJO/1A6dsCveO92KkxlueQI?=
 =?us-ascii?Q?/h3qg5rlTBzCaS7SRtKmFoGq624JEnD9PHm4iLxuABHQ71laOCwQk87jS8/q?=
 =?us-ascii?Q?4k6EB7g11jHivkTTZ5mtQ41JrY4gjp939v0ePGqVS4lWIYRs3BOd8M5PXZqJ?=
 =?us-ascii?Q?WM+KCk581zlaWK5EAXv/aS6GhPNWMht8gjWljY2y9WGo2jXAcTUE8x0voXpe?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31eb95f3-40b6-4ec2-4e43-08dcabf6e3b4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 15:40:05.2297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKH1Zjncm5q7reWeGSJB5mAPBqBx/YxIxU++c1f2nTg7MY2ItrF5H2YHZyKvP0fPw2Fh2+S2WF+oq8Z8bFAHjdYbrfpw3xhIWg8IIAm9JcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8487
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

On Wed, Jul 24, 2024 at 02:41:05PM GMT, Peter Zijlstra wrote:
>On Tue, Jul 23, 2024 at 10:30:08AM -0500, Lucas De Marchi wrote:
>> On Tue, Jul 23, 2024 at 09:03:25AM GMT, Tvrtko Ursulin wrote:
>> >
>> > On 22/07/2024 22:06, Lucas De Marchi wrote:
>> > > Instead of calling perf_pmu_unregister() when unbinding, defer that to
>> > > the destruction of i915 object. Since perf itself holds a reference in
>> > > the event, this only happens when all events are gone, which guarantees
>> > > i915 is not unregistering the pmu with live events.
>> > >
>> > > Previously, running the following sequence would crash the system after
>> > > ~2 tries:
>> > >
>> > > 	1) bind device to i915
>> > > 	2) wait events to show up on sysfs
>> > > 	3) start perf  stat -I 1000 -e i915/rcs0-busy/
>> > > 	4) unbind driver
>> > > 	5) kill perf
>> > >
>> > > Most of the time this crashes in perf_pmu_disable() while accessing the
>> > > percpu pmu_disable_count. This happens because perf_pmu_unregister()
>> > > destroys it with free_percpu(pmu->pmu_disable_count).
>> > >
>> > > With a lazy unbind, the pmu is only unregistered after (5) as opposed to
>> > > after (4). The downside is that if a new bind operation is attempted for
>> > > the same device/driver without killing the perf process, i915 will fail
>> > > to register the pmu (but still load successfully). This seems better
>> > > than completely crashing the system.
>> >
>> > So effectively allows unbind to succeed without fully unbinding the
>> > driver from the device? That sounds like a significant drawback and if
>> > so, I wonder if a more complicated solution wouldn't be better after
>> > all. Or is there precedence for allowing userspace keeping their paws on
>> > unbound devices in this way?
>>
>> keeping the resources alive but "unplunged" while the hardware
>> disappeared is a common thing to do... it's the whole point of the
>> drmm-managed resource for example. If you bind the driver and then
>> unbind it while userspace is holding a ref, next time you try to bind it
>> will come up with a different card number. A similar thing that could be
>> done is to adjust the name of the event - currently we add the mangled
>> pci slot.
>>
>> That said, I agree a better approach would be to allow
>> perf_pmu_unregister() to do its job even when there are open events. On
>> top of that (or as a way to help achieve that), make perf core replace
>> the callbacks with stubs when pmu is unregistered - that would even kill
>> the need for i915's checks on pmu->closed (and fix the lack thereof in
>> other drivers).
>>
>> It can be a can of worms though and may be pushed back by perf core
>> maintainers, so it'd be good have their feedback.
>
>I don't think I understand the problem. I also don't understand drivers
>much -- so that might be the problem.

We can bind/unbind the driver to/from the pci device. Example:

	echo -n "0000:00:02.0" > /sys/bus/pci/drivers/i915/unbind

This is essentially unplugging the HW from the kernel.  This will
trigger the driver to deinitialize and free up all resources use by that
device.

So when the driver is binding it does:

	perf_pmu_register();

When it's unbinding:

	perf_pmu_unregister();
	
Reasons to unbind include:

	- driver testing so then we can unload the module and load it
	  again
	- device is toast - doing an FLR and rebinding may
	  fix/workaround it
	- For SR-IOV, in which we are exposing multiple instances of the
	  same underlying PCI device, we may need to bind/unbind
	  on-demand  (it's not yet clear if perf_pmu_register() would be
	  called on the VF instances, but listed here just to explain
	  the bind/unbind)
	- Hotplug

>
>So the problem appears to be that the device just disappears without
>warning? How can a GPU go away like that?
>
>Since you have a notion of this device, can't you do this stubbing you
>talk about? That is, if your internal device reference becomes NULL, let
>the PMU methods preserve the state like no-ops.

It's not clear if you are suggesting these stubs to be in each driver or
to be assigned by perf in perf_pmu_unregister(). Some downsides
of doing it in the driver:

	- you can't remove the module as perf will still call module
	  code
	- need to replicate the stubs in every driver (or the
	  equivalent of pmu->closed checks in i915_pmu.c)

I *think* the stubs would be quiet the same for every device, so could
be feasible to share them inside perf. Alternatively it could simply
shortcut the call, without stubs, by looking at event->hw.state and
a new pmu->state. I can give this a try.

thanks
Lucas De Marchi

>
>And then when the last event goes away, tear down the whole thing.
>
>Again, I'm not sure I'm following.
