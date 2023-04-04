Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F596D6DEC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E015B10E7A5;
	Tue,  4 Apr 2023 20:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7DF10E7A5;
 Tue,  4 Apr 2023 20:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680639586; x=1712175586;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VJVPCcOkjrx+AuQbtn//dnvvvj9Vlwj9ktyosFHHbyY=;
 b=TeWOSoVR0JVNgu4nHL8IcWeAY/YePPqRuG113dJf96/MewG2YtrYyM9C
 bQVniD6GFEFtlQ/qjkhJFh0mY4qyQElBV2MAixS+nywzzCcKQ+l/n4SjF
 CIpCbI/BRXbUJkYrzyvA4ejGMz5Xu9367IMNbsj6iWv2jRUDjleUw2gUU
 xkoYzGaYLYlhnYb4mYAgHWjRv0vhNJMszKse8GwBt7uubGo6XPgsr0W7N
 5Sm5epr7qWNe/cRiOt5foIoH676SVaDisiFnrDiDss2NvbqmbFt41Fm6H
 xP/u+82We+fI4rsXg76F2j/u1vaTY+89BH2tkyZtt48NsYliLsjBWdPe5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="321953285"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="321953285"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="775778424"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="775778424"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Apr 2023 13:19:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 13:19:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 13:19:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 13:19:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 13:19:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHOQfEuH49fOrfXcsW7V1qTmnyAMf+bswe8AlQk0EZwsmkyFnOHfKP7uH3cX7NfQvMLMQqtDGJgVlu9jYRrbPGfhv8yf3F9kmuJqR+3M7c3Pf+ZP1iw148/u1h6E5dgc7yjktSrp9QsRcFqRR0AHVKm+/EMVqnneVGp9tDRLa53oI95GeFHuacdl+0BUulvbPXgPtkMoZuCDmNVWxm2CyYLtmKASUciaPsfYuA1XOrqx8CRGXXmwEFnFunYHFj92bhEDlKRND9SA/Y/4iQKM+jBsxeYL3sS/3qLfPeXJ6q21yWk6V4qBKf6N5Ff397qcv553AE6VLLH79s2toUD4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trtP1EPeZBggdDePu1lA3zEEOQvsZOlZ0IrutI2DntY=;
 b=UASTURyiWBB+MfZ1cUgz1fqHkU4ZzIsQeStCcLlz4d8oUYrvGpwgLACumqfXr3gZF2EyAPlOZhROIEoMQcRVNhhqaU9lAQdeOLYnor3VLdq2C1RlihCkE8LnNw41nqOan405DW5kuAaXzdqb+3WJB8UHb82mHJzOgQaXPnYddSd3WZobxOYSPI+KYgiJC20qsNElfC2eizLAIIfUp9MEewv1R5lTUkTi+jaNrGFFNGxLtuF8bsI+eQcrd5h+aKc0PDm0YS/ldzJ+Im8mDGfgoWazj7xMfdknODBDLBfOi1PnEtfIgirrNZBror3t1vNKMJPAtUy4KVisqlKaZu6AXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5282.namprd11.prod.outlook.com (2603:10b6:610:bd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 20:19:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 20:19:43 +0000
Date: Tue, 4 Apr 2023 20:19:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <ZCyGWXmQ7q2ZMtID@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <CAKMK7uGeBJRQ4dKfY=wRvw-o7qdzurFHzUymxGsLWr4Y_nQPAA@mail.gmail.com>
 <ZCyCpyFmteD0uZ3v@DUT025-TGLU.fm.intel.com>
 <CAKMK7uG7C9or+L4sS1e7u14wbXt2=0-wGnLxjZ3uSGvM7-Vd4g@mail.gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uG7C9or+L4sS1e7u14wbXt2=0-wGnLxjZ3uSGvM7-Vd4g@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: 294fe13a-c929-4428-bd95-08db3549ecf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h2+MDnySS2gJ5F/7GlaOwILTtDDfWTArKViq3clY1+9tC2hVbSi5r7I6qKGRCfpQnkSvE0n/zn3L/Y7Dm7Hntcw07c17so50YIZ2SY5h5Bfz2JDF7yl59tcuSIiA6qdLC0TPKXLWQtks8ellfeM4qNskZRtDp63E5neQ/HS1Ra8DR3/VZr0l8dY2vAy5nIh+iGBVj/EG60NtSSvl5xsyXHaZbjXxXLflqGuZFmJ8unweJNLCohmCBVLXc1H5hBkYVpGAX+V5ygfkTTrUcuTGdRvOSdGLriGR8NuY9hyCyYjlN2wLcXYtJlzgW9QmFVk0ipwjZsv0qOSLPsPxne61RduEYHuj4Q9++P1QH6+8GGp/tGBBQ8Pvb4QgnkMDhi9fGb+adCecjsgO6x+aUVRcGrMfMK7I6YY2x0w0LrlNY9utaB9KiTjrGZFcedDQCQKzm4z/6aqUVzm4M38bDHPZsFfL+PSam6DXmWeQNw/OptbW5BXtGwRktWyFi8OF3zojKFFW38Qw4ILBjgT3ktbPeSXuYCY7FbGMxLL/HdCBXBaxiu3UirmGlSyZjkbcYO7U7umcTM26NeLaJjJVfZysOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(186003)(6666004)(2906002)(53546011)(6506007)(26005)(6512007)(44832011)(83380400001)(66574015)(66899021)(7416002)(82960400001)(966005)(6486002)(5660300002)(8936002)(38100700002)(478600001)(41300700001)(316002)(54906003)(66946007)(6916009)(8676002)(66476007)(4326008)(66556008)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ysWkG+HLCLO7zlOLCnkHnMigqhwxkr0bbDAsPdYcVccGIVkOnAZcVu5pmG?=
 =?iso-8859-1?Q?rsbAnKAh2iQrp8nSsDsNQx4Nw5qTqQyYfDwTcrJIYqtcaqNHdYQHBHMcUR?=
 =?iso-8859-1?Q?9vFHiXt5KPksXAo4Qk79PfLx0WFdUQDpD/JRVbwmKqzpAtHq+D7xRK/Giu?=
 =?iso-8859-1?Q?9/xzttlhfg5lEvD47HYSSk/offCM9euWMzD6z/1wLAfM5bBL92Q9fsqgSk?=
 =?iso-8859-1?Q?3OauNGvRpn8J1EzRyFxWfodioJecXbvedUlXg1ngc3wXT5ZJvtvnw+i1Qq?=
 =?iso-8859-1?Q?gCYVVT5LmQ80AeXHpmK2w1a4q36TmP9FSZ5lVAdlZ7pQscLn/xo9dlN4OW?=
 =?iso-8859-1?Q?RLkecCwY51fGx/e6gjEfRzl8SVSYh2zigiJIlDUMIHGbUfxG77pEIpiddi?=
 =?iso-8859-1?Q?SzBbjAfzHFfbEVveb6rjShVXNqGaOBAemUSi/YQf8fwLj/BOOsQjsIvJ05?=
 =?iso-8859-1?Q?Tt7U/0JdEUE8cPhbeGnWIzZ0fHpJVMTBYoe7BTi3/0OBtsTq70hJO24htr?=
 =?iso-8859-1?Q?k8rBpoYR85O5POR+CG3HpEI4TfQRA7odLVSb7KxxPw/lvpv1SJLzM8mSSQ?=
 =?iso-8859-1?Q?dcz7/3BVKo5rjUWBtzlNaGPaljkung8ekrCfEa5F3dPNjrLmEW9YopUhs+?=
 =?iso-8859-1?Q?aN5+JIgPFAHfPeWOn2GeS9sMyocFN86xuSTZ+JHMQwoGN9aAMEGgmL2S2k?=
 =?iso-8859-1?Q?6Z5ViD/eQisZ8XZBDfOP3+qZYrUkZcrwNaUk5NWcpNWfEIMHpZ/Covqz/o?=
 =?iso-8859-1?Q?494bZ+jHmJc02QFC7i+j9xXhPs5UKxeVyrrgppHLG+XBIdx0N8wmpIu7xC?=
 =?iso-8859-1?Q?Cl5JCL8KMmswHgQAmbwd0isBf3gh5G6hH2Nme1RkNVwnp0iav5gyG8Vp4U?=
 =?iso-8859-1?Q?uQikiPSK2bUG+I8e2dcVbLH4Xg8wf46EhQZNK6Pn9Ge1I2KnFE1/qd2AYh?=
 =?iso-8859-1?Q?tJpauwCGFh3Fo3aii6IZtnZ4gAtBYL9qyI1B2keTtF8wOYo4ZZDuh5krGj?=
 =?iso-8859-1?Q?bTj2xvDf3p+nnYE3quucfVU+kQ3mTq3CtBbvKYERz9C62w3lJsGzE6TaU2?=
 =?iso-8859-1?Q?CvamZh4r45GVm4qINBs5j/xuh7htVrIwCjcEhdGxY2ocqETXE7vxO9yq28?=
 =?iso-8859-1?Q?9KrBYk2bXJmeIZIsx+Cl2EDIszKrEJleDePIZnkUDodBU5h5L5kaIZaCfm?=
 =?iso-8859-1?Q?mve1wvtIpG4z/wLu5aa7SJO6Uh/TuXaLX/7ykDIORP0KdLS8YkQgWNEqp2?=
 =?iso-8859-1?Q?oUFvLFoVzGxsRMfgxMzdfLmTOIf0IsTaHtSPN/h4dCa3fLuLJ2VwvIQzMs?=
 =?iso-8859-1?Q?K8JyML/Kni0rVjRxtB68DAsZ2ykXIMYKSpctWKFfX5aXLfaNgU7akQaYn3?=
 =?iso-8859-1?Q?qTw90386cqJhWGUAGL9mAgeIRKISDz07xzDD+9es11Ecqm7QgUgMZ1fEAs?=
 =?iso-8859-1?Q?EHLt+xN2Xntc0/cryySkGwLrGmZ40pbLlgQ10CQjPAj98BBm1x5kaAuIrE?=
 =?iso-8859-1?Q?G8mwgFZunbirSijnGCCZVepbWRMf36wPqic/LdAKVioDIhraHdbqHr36Wm?=
 =?iso-8859-1?Q?/hbdLKDUtyjGSqUdUhqspOu8LUJlezzS75n7iYhanMga825+qNsv0e5dpP?=
 =?iso-8859-1?Q?zCY8TejZvgcUegC1RIPdNP1VQ14ts+mHR1/eWVjEM+6vVwW4WJVmjHXQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 294fe13a-c929-4428-bd95-08db3549ecf2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 20:19:42.9137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEHrUIF6z6eWALhjkffpaT9mYEnXp2T17AFxVTtYPTJn73nHzfDpmN310WOM0kwm5ZOi2Gyc9Fa1r2kQth57Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5282
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
Cc: robdclark@chromium.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@linux.ie, lina@asahilina.net, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 10:11:59PM +0200, Daniel Vetter wrote:
> On Tue, 4 Apr 2023 at 22:04, Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > On Tue, Apr 04, 2023 at 09:00:59PM +0200, Daniel Vetter wrote:
> > > On Tue, 4 Apr 2023 at 15:10, Christian König <christian.koenig@amd.com> wrote:
> > > >
> > > > Am 04.04.23 um 14:54 schrieb Thomas Hellström:
> > > > > Hi, Christian,
> > > > >
> > > > > On 4/4/23 11:09, Christian König wrote:
> > > > >> Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > > >>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > >>>
> > > > >>> For long-running workloads, drivers either need to open-code completion
> > > > >>> waits, invent their own synchronization primitives or internally use
> > > > >>> dma-fences that do not obey the cross-driver dma-fence protocol, but
> > > > >>> without any lockdep annotation all these approaches are error prone.
> > > > >>>
> > > > >>> So since for example the drm scheduler uses dma-fences it is
> > > > >>> desirable for
> > > > >>> a driver to be able to use it for throttling and error handling also
> > > > >>> with
> > > > >>> internal dma-fences tha do not obey the cros-driver dma-fence protocol.
> > > > >>>
> > > > >>> Introduce long-running completion fences in form of dma-fences, and add
> > > > >>> lockdep annotation for them. In particular:
> > > > >>>
> > > > >>> * Do not allow waiting under any memory management locks.
> > > > >>> * Do not allow to attach them to a dma-resv object.
> > > > >>> * Introduce a new interface for adding callbacks making the helper
> > > > >>> adding
> > > > >>>    a callback sign off on that it is aware that the dma-fence may not
> > > > >>>    complete anytime soon. Typically this will be the scheduler chaining
> > > > >>>    a new long-running fence on another one.
> > > > >>
> > > > >> Well that's pretty much what I tried before:
> > > > >> https://lwn.net/Articles/893704/
> > > > >>
> > > > >> And the reasons why it was rejected haven't changed.
> > > > >>
> > > > >> Regards,
> > > > >> Christian.
> > > > >>
> > > > > Yes, TBH this was mostly to get discussion going how we'd best tackle
> > > > > this problem while being able to reuse the scheduler for long-running
> > > > > workloads.
> > > > >
> > > > > I couldn't see any clear decision on your series, though, but one main
> > > > > difference I see is that this is intended for driver-internal use
> > > > > only. (I'm counting using the drm_scheduler as a helper for
> > > > > driver-private use). This is by no means a way to try tackle the
> > > > > indefinite fence problem.
> > > >
> > > > Well this was just my latest try to tackle this, but essentially the
> > > > problems are the same as with your approach: When we express such
> > > > operations as dma_fence there is always the change that we leak that
> > > > somewhere.
> > > >
> > > > My approach of adding a flag noting that this operation is dangerous and
> > > > can't be synced with something memory management depends on tried to
> > > > contain this as much as possible, but Daniel still pretty clearly
> > > > rejected it (for good reasons I think).
> > >
> > > Yeah I still don't like dma_fence that somehow have totally different
> > > semantics in that critical piece of "will it complete or will it
> > > deadlock?" :-)
> >
> > Not going to touch LR dma-fences in this reply, I think we can continue
> > the LR fence discussion of the fork of this thread I just responded to.
> > Have a response the preempt fence discussion below.
> >
> > > >
> > > > >
> > > > > We could ofc invent a completely different data-type that abstracts
> > > > > the synchronization the scheduler needs in the long-running case, or
> > > > > each driver could hack something up, like sleeping in the
> > > > > prepare_job() or run_job() callback for throttling, but those waits
> > > > > should still be annotated in one way or annotated one way or another
> > > > > (and probably in a similar way across drivers) to make sure we don't
> > > > > do anything bad.
> > > > >
> > > > >  So any suggestions as to what would be the better solution here would
> > > > > be appreciated.
> > > >
> > > > Mhm, do we really the the GPU scheduler for that?
> > > >
> > > > I mean in the 1 to 1 case  you basically just need a component which
> > > > collects the dependencies as dma_fence and if all of them are fulfilled
> > > > schedules a work item.
> > > >
> > > > As long as the work item itself doesn't produce a dma_fence it can then
> > > > still just wait for other none dma_fence dependencies.
> > >
> > > Yeah that's the important thing, for long-running jobs dependencies as
> > > dma_fence should be totally fine. You're just not allowed to have any
> > > outgoing dma_fences at all (except the magic preemption fence).
> > >
> > > > Then the work function could submit the work and wait for the result.
> > > >
> > > > The work item would then pretty much represent what you want, you can
> > > > wait for it to finish and pass it along as long running dependency.
> > > >
> > > > Maybe give it a funky name and wrap it up in a structure, but that's
> > > > basically it.
> > >
> > > Like do we need this? If the kernel ever waits for a long-running
> > > compute job to finnish I'd call that a bug. Any functional
> > > dependencies between engines or whatever are userspace's problem only,
> > > which it needs to sort out using userspace memory fences.
> > >
> > > The only things the kernel needs are some way to track dependencies as
> > > dma_fence (because memory management move the memory away and we need
> > > to move it back in, ideally pipelined). And it needs the special
> > > preempt fence (if we don't have pagefaults) so that you have a fence
> > > to attach to all the dma_resv for memory management purposes. Now the
> > > scheduler already has almost all the pieces (at least if we assume
> > > there's some magic fw which time-slices these contexts on its own),
> > > and we just need a few minimal changes:
> > > - allowing the scheduler to ignore the completion fence and just
> > > immediately push the next "job" in if its dependencies are ready
> > > - maybe minimal amounts of scaffolding to handle the preemption
> > > dma_fence because that's not entirely trivial. I think ideally we'd
> > > put that into drm_sched_entity since you can only ever have one active
> > > preempt dma_fence per gpu ctx/entity.
> > >
> >
> > Yep, preempt fence is per entity in Xe (xe_engine). We install these
> > into the VM and all external BOs mapped in the VM dma-resv slots.
> > Wondering if we can make all of this very generic between the DRM
> > scheduler + GPUVA...
> 
> I think if the drm/sched just takes care of the preempt ctx dma_fence
> (and still stores it in the same slot in the drm_sched_job struct like
> a end-of-batch dma_fence job would), and then the gpuva shared code
> just has functions to smash these into the right dma_resv structures
> then you have all the pieces. Maybe for a bit more flexibility the
> gpuva code takes dma_fence and not directly the drm_sched_job, but
> maybe even that level of integration makes sense (but imo optional, a
> bit of driver glue code is fine).
> 
> Yeah that's roughly what I think we should at least aim for since
> there's quiet a few drivers in-flight that all need these pieces (more
> or less at least).

That is very close to what I'm thinking too, we want to tackle userptr +
GPUVA too, think that will be next but can add this to the list of
things to do.

Matt

> -Daniel
> >
> > Matt
> >
> > > None of this needs a dma_fence_is_lr anywhere at all.
> > >
> > > Of course there's the somewhat related issue of "how do we transport
> > > these userspace memory fences around from app to compositor", and
> > > that's a lot more gnarly. I still don't think dma_fence_is_lr is
> > > anywhere near what the solution should look like for that.
> > > -Daniel
> > >
> > >
> > > > Regards,
> > > > Christian.
> > > >
> > > > >
> > > > > Thanks,
> > > > >
> > > > > Thomas
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
