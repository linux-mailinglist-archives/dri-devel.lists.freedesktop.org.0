Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D4B67117B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFBD10E074;
	Wed, 18 Jan 2023 03:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F2F10E074;
 Wed, 18 Jan 2023 03:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674011233; x=1705547233;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TDvsOWMdZ1R1z0LrNJby69+F5qB6uM2WmFoC8icp8uw=;
 b=b9ZyA2uhHGqYVUBOxM2GyCFaTDriA6TVsdxXeLNT0YQGSWkdNHLqaqmH
 jESdwipMm7eX6X5gVN2351Txec/sbSLQIPfdj7ufhopzFeGV8Z3Nyu7IQ
 ISo7xdczyS/D9PIuJk4r5oAx1TMDprQGOJIq0dDsZjfyxD5mBZ2FzjCwT
 5FQdw4Y/oDwjf0k9HsasWbq3obso43N870skSdPjCCa8gfxdvL1+3QhjT
 Imu9VF0GPz4kFLbF+2hWo3UXOwJPv8kT7qu8BEM7I2bSnYYl5eRZ4kgui
 CDEBK11QvGl1uop8AF9VUo27LJvY6JPOTb7uTk6e28IzbA4ELkgZ5kS23 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="326962211"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="326962211"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 19:07:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="748279828"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="748279828"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2023 19:07:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 19:07:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 19:07:12 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 19:07:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKM6c0YHd2tH5/Jiffc1xdRirPtRsCXXiLWLJsnFfDGCBAPVU7WeNS0LVW+W0ZkklN9jtEydRrbjH2JZnVxiuHpn5ntaY69A7GEQ7llyv7EbK+stbeAIum+3k0cEQpD8q2OXVW5b1ydxzdauPpFZA0DtMxZB8qJ955dq7WWY9DXjfNJpLHi+y3BvrEfCCn3Ch2CedyLl90anxYS0dRW7ZUUsrCa9Hl5biuLgyvjQgkhNs9WtozqquaWCDxrKKnApKXDbdKloTzQHSyb2/WjZ3gyXjAXC7ila00iNB8umDBTwNkSH7eQx7sU60LFlkpmSdIXSIWUPWxfH76NNu3w5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGcl2IHBEjcsgL0JFUkGso5W/J4iM71x6krtBGMvTNo=;
 b=aZQjxt+Nl0XkYJ+utUzUIrZcyXTcVucHrOIGctKU2Vf9nZ+ICL88RIunBUMtQhS5k6wbrYKod1JCrdflIFLRPzne5otuCyb1CI0FYyhUWrME0Qac3/hPiKXe6mhy6qvo7aQPzMFuB5kgwLgF6zNiYxorpN6+MLX/LzutAASgfpXoDexqE2Aoq8b2Voet2QeKNtAf/XTPTk5UiYjy1oOS8DVU82YpDJqxnsvt9RRB3tOQfu3OL3yONoP4YAJW3GegScl8+36+oDFamnJgg++fgekZFfEvBPkoPigBvEG4InzrmDWK3N7qHvx75VJLpk3mOfx237MzB+QSmubUjZ/JvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7785.namprd11.prod.outlook.com (2603:10b6:8:f1::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Wed, 18 Jan 2023 03:07:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Wed, 18 Jan 2023
 03:07:03 +0000
Date: Wed, 18 Jan 2023 03:06:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <Y8diSJRTdArk0nWl@DUT025-TGLU.fm.intel.com>
References: <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <CAOFGe957uYdTFccQp36QRJRDkWQZDCB0ztMNDH0=SSf-RTgzLw@mail.gmail.com>
 <705a0b3c-2fe5-0393-0fda-511f288007c7@linux.intel.com>
 <CAOFGe96KQUmy20_h3OmmXGVmuGkEm8iDhnLzgBjM5dnPApqYvQ@mail.gmail.com>
 <Y7841j8PZ1T9MPEl@DUT025-TGLU.fm.intel.com>
 <CAOFGe970mwYgt10RdGURiMYc1x+MFy-uYOBT++Mygz4tu1XN4A@mail.gmail.com>
 <37381bd9-5529-e531-623b-cfdd8ced1037@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37381bd9-5529-e531-623b-cfdd8ced1037@intel.com>
X-ClientProxiedBy: BYAPR06CA0069.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: b87d2280-e96b-4f04-77d0-08daf90112dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ntn0+vsI6NdsQuqaT2nQgfju20Hb4DRj1FN8GHPHCELyKs4F6PXdNEcSsEORTLXXD0mAO/5hifRbDXCyIYhr4AT/+GgatLPSMWgokPpX4ovgtme6/UPic8kOmwpyTWnt5nSY+QMbrn+MT8m7QZ7zlPyXvW0W18DpUXrrveQtGT2cZ96y1JsXUro7MHXX12I2PBzVLneM3MPzutXXamQLncVY5sUC8OX9M51ojJ44A6vkzJ86YFUTMmwfhqW+pPi7+KTgcmyzNUvYrmyFs272/GHkLgDJiZQR6aK+gu+FQRI7r5aiTWJ8hpdreTdOcxQnVoutHtgVjKSo/58T+A4DXU4eeYHj1mp84GHYf4tBMGs64pAjaLe5wDQUjTW5du4UmssBSX9ASKSjDLuKkR8UWE/fQutWtk5FtW2ri/tmfRa+1pD78Lh1gTZQRybZc6vUf8xLA2mzW8brKg1tGsr3BI7x2w9v0MHiinPYsAJFlotx1jRmeeiUEQESECPyUtxU6RagXMza7GOOhf+p9/nqMDK7dxj1Hrtyi9W8R4Ng8GM7bJzmnDYY9XabnjR0oZ9VQcsdnP7YsoR4nzNrbNu1fQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199015)(82960400001)(38100700002)(86362001)(66476007)(6862004)(5660300002)(8936002)(2906002)(44832011)(30864003)(66946007)(66556008)(316002)(41300700001)(8676002)(4326008)(26005)(6512007)(186003)(83380400001)(53546011)(45080400002)(6636002)(6666004)(6506007)(966005)(6486002)(478600001)(66899015)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmxXUTVMTy9QL1FCUkdqNEdMZGJhNXZqbUhKbk1tWTZBSFp6N0JDL1lsUTE0?=
 =?utf-8?B?ajZHMUorR1g5UStNaDhqUnBBOTR2UHJ3WklXaDcrbE4rc2ZvY2JTdzAxMW1H?=
 =?utf-8?B?L1JPZWxSS3I2QVNvMXN3aXVPa1ZkSGpZcUhsSnJhdlNvaXpSVnR2S2xyWko0?=
 =?utf-8?B?amxBaVd4TmVXRWY3T2VudUN3MDFKa1hMbnBtMHIxVVhCa2IydnJEZ1RGWkxP?=
 =?utf-8?B?RGZlUTdWZDBSWU1NTUpjcTJnU29iU0JIYUg2WFA0WGl0NEhOdGp6VWNJMzNV?=
 =?utf-8?B?YXBvU0RYMUFpaW1qY1Z0dUp4ZzZXa0xpbjVDUGdFendzVnM0VThmaVM2aEVm?=
 =?utf-8?B?V2ZwcmtNaUNRNGtSVVJCaVpRZ3ZERm42Q3JvRHMvZEpSb2FzeDdsVGE1aEky?=
 =?utf-8?B?eDBhaXh6anpmbDdHUFNmYlJCRFVLSzZwZmd4SU56dzFPYTlmS2o1cUJjUFE3?=
 =?utf-8?B?ZUZnTDRBVUpxYVAvaEt4cUdFTTM4dnU2R3RITGJLK2JQcXpadXVWNXVyWHpa?=
 =?utf-8?B?V3NXQndiRGZmVzY1WmRHOS9WZ2FLSVAvUkF1bXBBaDAyTGNDbWZ1b1pKWHo1?=
 =?utf-8?B?ZXA5OW0rQ1NuRkZVanFlVjFScDFKN2xOaGw1SS9lcllyU3VEdHVTNkJlVmtH?=
 =?utf-8?B?Nnc1cnFaUm55NlVLMFowZHljd2R2enk2OGpXdExUR3BHQ2tRTmp4cDdJZndu?=
 =?utf-8?B?aWZrMGpQNzd0dkErVDNnTEIySktITjljMS8xMEZMSmlpeWhZd240K3ZTZzlG?=
 =?utf-8?B?SDlVNnRWMEMyWUQyTnpPTjRVMGEwWFljOGNqbFphVU5LdWxWUkthdlltRlRN?=
 =?utf-8?B?dHk4S2g2azlGYkNWWEFuU3lQbHpTMkJCb25Pa3c0WER6Rk5Lc0tSWDltakNv?=
 =?utf-8?B?Z1NHRk1aOTYrMDdIWTc4T2hUdUtmdlVJRE1FVEplWENyeStCcnhHTytvK0xM?=
 =?utf-8?B?TlRqU0hMNHh4cUhhcjFSdWxDVzZzazlHTkJwUzBTZGpWU2YxVWtaaUNtc3Rw?=
 =?utf-8?B?Q3dnNnJNNlJGdUpnZG9wRVBSeEl4elVNR3lVNHN2Y0srN2F1NnF4MXp2V081?=
 =?utf-8?B?YWRjNWM1R28wdFhzdFAzV0hrbS90ZEk0RWF0em5Gb3FTU0VCMDljUEllMWNk?=
 =?utf-8?B?bnUvSkFHOXd3SHl4aWVLdk9tWitqZnBpeG14cFdyWCszSUtnOVIza3hqOWU0?=
 =?utf-8?B?L1kzTm90UmE0YlVyWmJ6TXhNZWliY2hieXJZaHpzQ1UycjFYNElQWXloZFZY?=
 =?utf-8?B?ZGhndW9Vb3dScGNpRllPRVZXVS9XMktnbjY0SldVREJBNy82bm5rRkxZQWNE?=
 =?utf-8?B?VURvS3UrMVBFSHArZ2s1U1BLYW55YTBwd2xlUUZsK21uVEdtUUdxUzYxVmU3?=
 =?utf-8?B?RW4rdFhIaWNvMGFrK256SnpUd0JFbjlEZXdVbnUraGhaTGtPV3RSeUJRbDQ0?=
 =?utf-8?B?SHoxQjc3L2ZWYkhybEtBRVMvaCtRak03aFZ5SlRSYjJEMjhJUG1sNXQxU0ZZ?=
 =?utf-8?B?amhnYWFqTU1HaFF3Mll0blFLVlpPWldVRHNuQkVDaE8zcWtwR2U3eGcxZlRL?=
 =?utf-8?B?Z0gvVTZETCtvZURnUmI5VEJueVhlMThzdWF6djFnWkRMQTFJUVZ3ZnNLNXJo?=
 =?utf-8?B?cjRIZUVJaTdSdTdrb3VmT1VMUHZMRTlMbFRGVHpVN3RRM1ZtQTFSTUhtaDZu?=
 =?utf-8?B?OVkzSVIvUnpZbGhWOWMxRVdBbWtBNGRtMjVBMGV1UVArTUdNQWZNa2hPYk9D?=
 =?utf-8?B?VFlvaVFzVmMwTHBVMVlXbWJEcTVTRUV2V09LYnEzdEpISzlRRm5xQVhMR05I?=
 =?utf-8?B?clNPak9WYjcxRGozWXAyaFdVVzNkVkpJOEZiRWNGMFIxTWp4bVhXUEtDYXI5?=
 =?utf-8?B?Q0xMWGUrb0trTGJZNEVCaXZmQTF6MmVRbFZFTzlXQ3NyN2pPcXVTcGpzYmdl?=
 =?utf-8?B?VGZqTWtXWUlLcUZTQ1k0VFBKSFk5TjlCZ3AzUlpNRFgxZ1lzRlhKb3RzM29z?=
 =?utf-8?B?MzVhTmhpZDB3bG1XZnoyYVlHR2tUK0R0aFp1cWg4Qm1FSEdTbVFobGpha0Jx?=
 =?utf-8?B?Z1gxcnlPMGIyODNseWJ1M1BYSElyem1Qb011Z2VUaHRzaW9USjhxaThxYmNS?=
 =?utf-8?B?S1ZQQTY5cGNhVkRKa0VKL0V3cnhqa2xGR2M3bnhHSUZTbnpFQXJGclNaWFky?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b87d2280-e96b-4f04-77d0-08daf90112dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 03:07:03.5633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYgxDuQXdgD3iZgoU+m/SfMcFM8mJUoea7nENNH4lEJRC9l7TeFT3attxTDll5vZsaLxfk2/VfQtdjt8Xktc2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7785
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 04:39:32PM -0800, John Harrison wrote:
> On 1/11/2023 14:56, Jason Ekstrand wrote:
> > On Wed, Jan 11, 2023 at 4:32 PM Matthew Brost <matthew.brost@intel.com>
> > wrote:
> > 
> >     On Wed, Jan 11, 2023 at 04:18:01PM -0600, Jason Ekstrand wrote:
> >     > On Wed, Jan 11, 2023 at 2:50 AM Tvrtko Ursulin <
> >     > tvrtko.ursulin@linux.intel.com> wrote:
> >     >
> >     > >
> >     [snip]
> >     > >
> >     > > Typically is the key here. But I am not sure it is good
> >     enough. Consider
> >     > > this example - Intel Flex 170:
> >     > >
> >     > >   * Delivers up to 36 streams 1080p60 transcode throughput per
> >     card.
> >     > >   * When scaled to 10 cards in a 4U server configuration, it
> >     can support
> >     > > up to 360 streams of HEVC/HEVC 1080p60 transcode throughput.
> >     > >
> >     >
> >     > I had a feeling it was going to be media.... 😅
> >     >
> > 
> >     Yea wondering the media UMD can be rewritten to use less
> >     xe_engines, it
> >     is massive rewrite for VM bind + no implicit dependencies so let's
> >     just
> >     pile on some more work?
> > 
> > 
> > It could probably use fewer than it does today.  It currently creates
> > and throws away contexts like crazy, or did last I looked at it. 
> > However, the nature of media encode is that it often spreads across two
> > or three different types of engines.  There's not much you can do to
> > change that.
> And as per Tvrtko's example, you get media servers that transcode huge
> numbers of tiny streams in parallel. Almost no work per frame but 100s of
> independent streams being run concurrently. That means many 100s of contexts
> all trying to run at 30fps. I recall a specific bug about thundering herds -
> hundreds (thousands?) of waiting threads all being woken up at once because
> some request had completed.
> 
> >     >
> >     > > One transcode stream from my experience typically is 3-4 GPU
> >     contexts
> >     > > (buffer travels from vcs -> rcs -> vcs, maybe vecs) used from
> >     a single
> >     > > CPU thread. 4 contexts * 36 streams = 144 active contexts.
> >     Multiply by
> >     > > 60fps = 8640 jobs submitted and completed per second.
> >     > >
> >     > > 144 active contexts in the proposed scheme means possibly
> >     means 144
> >     > > kernel worker threads spawned (driven by 36 transcode CPU
> >     threads). (I
> >     > > don't think the pools would scale down given all are
> >     constantly pinged
> >     > > at 60fps.)
> >     > >
> >     > > And then each of 144 threads goes to grab the single GuC CT
> >     mutex. First
> >     > > threads are being made schedulable, then put to sleep as mutex
> >     > > contention is hit, then woken again as mutexes are getting
> >     released,
> >     > > rinse, repeat.
> >     > >
> >     >
> >     > Why is every submission grabbing the GuC CT mutex? I've not read
> >     the GuC
> >     > back-end yet but I was under the impression that most run_job()
> >     would be
> >     > just shoving another packet into a ring buffer.  If we have to
> >     send the GuC
> >     > a message on the control ring every single time we submit a job,
> >     that's
> >     > pretty horrible.
> >     >
> > 
> >     Run job writes the ring buffer and moves the tail as the first
> >     step (no
> >     lock required). Next it needs to tell the GuC the xe_engine LRC
> >     tail has
> >     moved, this is done from a single Host to GuC channel which is
> >     circular
> >     buffer, the writing of the channel protected by the mutex. There are
> >     little more nuances too but in practice there is always space in the
> >     channel so the time mutex needs to held is really, really small
> >     (check cached credits, write 3 dwords in payload, write 1 dword to
> >     move
> >     tail). I also believe mutexes in Linux are hybrid where they spin
> >     for a
> >     little bit before sleeping and certainly if there is space in the
> >     channel we shouldn't sleep mutex contention.
> > 
> > 
> > Ok, that makes sense.  It's maybe a bit clunky and it'd be nice if we
> > had some way to batch things up a bit so we only have to poke the GuC
> > channel once for every batch of things rather than once per job.  That's
> > maybe something we can look into as a future improvement; not
> > fundamental.
> > 
> > Generally, though, it sounds like contention could be a real problem if
> > we end up ping-ponging that lock between cores.  It's going to depend on
> > how much work it takes to get the next ready thing vs. the cost of that
> > atomic.  But, also, anything we do is going to potentially run into
> > contention problems.  *shrug*  If we were going to go for
> > one-per-HW-engine, we may as well go one-per-device and then we wouldn't
> > need the lock.  Off the top of my head, that doesn't sound great either
> > but IDK.
> > 
> >     As far as this being horrible, well didn't design the GuC and this how
> >     it is implemented for KMD based submission. We also have 256 doorbells
> >     so we wouldn't need a lock but I think are other issues with that
> >     design
> >     too which need to be worked out in the Xe2 / Xe3 timeframe.
> > 
> > 
> > Yeah, not blaming you.  Just surprised, that's all.  How does it work
> > for userspace submission?  What would it look like if the kernel
> > emulated userspace submission?  Is that even possible?
> > 
> > What are these doorbell things?  How do they play into it?
> Basically a bank of MMIO space reserved per 'entity' where a write to that
> MMIO space becomes an named interrupt to GuC. You can assign each doorbell
> to a specific GuC context. So writing to that doorbell address is
> effectively the same as sending a SCHEDULE_CONTEXT H2G message from the KMD
> for that context. But the advantage is you ring the doorbell from user land
> with no call into the kernel at all. Or from within the kernel, you can do
> it without needing any locks at all. Problem is, we have 64K contexts in GuC
> but only 256 doorbells in the hardware. Less if using SRIOV. So the "per
> 'entity'" part because somewhat questionable as to exactly what the 'entity'
> is. And hence we just haven't bothered supporting them in Linux because a)
> no direct submission from user land yet, and b) as Matthew says entire chain
> of IOCTL from UMD to kernel to acquiring a lock and sending the H2G has
> generally been fast enough. The latency only becomes an issue for ULLS
> people but for them, even the doorbells from user space are too high a
> latency because that still potentially involves the GuC having to do some
> scheduling and context switch type action.
> 
> John.
> 

I talked with Jason on IRC last week about doorbells and we came up
with the idea after chatting to allocate the doorbells with a greedy
algorithm which results in the first 256 xe_engine each getting their
own doorbell thus avoid contention on the CT channel / lock (this is
still KMD submission).

Coded up a prototype for this and initial test results of
xe_exec_threads /w 245 user xe_engines, 5 threads, and 40k total execs
are an average of .824s vs. 923s for /w and w/o doorbells. Or in other
words 49714 execs per seconds /w doorbells vs. 44353 without. This seems
to indicate using doorbells can provide a performance improvement. Also
Jason and I reasoned we should be able to use doorbells 99% of the time
aside from maybe some wacky media use cases. I also plan on following up
with the media UMD to see if we can get them to use less xe_engines.

Matt

> 
> >     Also if you see my follow up response Xe is ~33k execs per second with
> >     the current implementation on a 8 core (or maybe 8 thread) TGL which
> >     seems to fine to me.
> > 
> > 
> > 33k exec/sec is about 500/frame which should be fine. 500 is a lot for a
> > single frame.  I typically tell game devs to shoot for dozens per
> > frame.  The important thing is that it stays low even with hundreds of
> > memory objects bound. (Xe should be just fine there.)
> > 
> > --Jason
> > 
> >     Matt
> > 
> >     > --Jason
> >     >
> >     >
> >     > (And yes this backend contention is there regardless of 1:1:1,
> >     it would
> >     > > require a different re-design to solve that. But it is just a
> >     question
> >     > > whether there are 144 contending threads, or just 6 with the
> >     thread per
> >     > > engine class scheme.)
> >     > >
> >     > > Then multiply all by 10 for a 4U server use case and you get
> >     1440 worker
> >     > > kthreads, yes 10 more CT locks, but contending on how many CPU
> >     cores?
> >     > > Just so they can grab a timeslice and maybe content on a mutex
> >     as the
> >     > > next step.
> >     > >
> >     > > This example is where it would hurt on large systems. Imagine
> >     only an
> >     > > even wider media transcode card...
> >     > >
> >     > > Second example is only a single engine class used (3d
> >     desktop?) but with
> >     > > a bunch of not-runnable jobs queued and waiting on a fence to
> >     signal.
> >     > > Implicit or explicit dependencies doesn't matter. Then the
> >     fence signals
> >     > > and call backs run. N work items get scheduled, but they all
> >     submit to
> >     > > the same HW engine. So we end up with:
> >     > >
> >     > >          /-- wi1 --\
> >     > >         / ..     .. \
> >     > >   cb --+---  wi.. ---+-- rq1 -- .. -- rqN
> >     > >         \ ..    ..  /
> >     > >          \-- wiN --/
> >     > >
> >     > >
> >     > > All that we have achieved is waking up N CPUs to contend on
> >     the same
> >     > > lock and effectively insert the job into the same single HW
> >     queue. I
> >     > > don't see any positives there.
> >     > >
> >     > > This example I think can particularly hurt small / low power
> >     devices
> >     > > because of needless waking up of many cores for no benefit.
> >     Granted, I
> >     > > don't have a good feel on how common this pattern is in practice.
> >     > >
> >     > > >
> >     > > >     That
> >     > > >     is the number which drives the maximum number of
> >     not-runnable jobs
> >     > > that
> >     > > >     can become runnable at once, and hence spawn that many
> >     work items,
> >     > > and
> >     > > >     in turn unbound worker threads.
> >     > > >
> >     > > >     Several problems there.
> >     > > >
> >     > > >     It is fundamentally pointless to have potentially that
> >     many more
> >     > > >     threads
> >     > > >     than the number of CPU cores - it simply creates a
> >     scheduling storm.
> >     > > >
> >     > > >     Unbound workers have no CPU / cache locality either and
> >     no connection
> >     > > >     with the CPU scheduler to optimize scheduling patterns.
> >     This may
> >     > > matter
> >     > > >     either on large systems or on small ones. Whereas the
> >     current design
> >     > > >     allows for scheduler to notice userspace CPU thread
> >     keeps waking up
> >     > > the
> >     > > >     same drm scheduler kernel thread, and so it can keep
> >     them on the same
> >     > > >     CPU, the unbound workers lose that ability and so 2nd
> >     CPU might be
> >     > > >     getting woken up from low sleep for every submission.
> >     > > >
> >     > > >     Hence, apart from being a bit of a impedance mismatch,
> >     the proposal
> >     > > has
> >     > > >     the potential to change performance and power patterns
> >     and both large
> >     > > >     and small machines.
> >     > > >
> >     > > >
> >     > > > Ok, thanks for explaining the issue you're seeing in more
> >     detail.  Yes,
> >     > > > deferred kwork does appear to mismatch somewhat with what
> >     the scheduler
> >     > > > needs or at least how it's worked in the past.  How much
> >     impact will
> >     > > > that mismatch have?  Unclear.
> >     > > >
> >     > > >      >      >>> Secondly, it probably demands separate
> >     workers (not
> >     > > >     optional),
> >     > > >      >     otherwise
> >     > > >      >      >>> behaviour of shared workqueues has either
> >     the potential
> >     > > to
> >     > > >      >     explode number
> >     > > >      >      >>> kernel threads anyway, or add latency.
> >     > > >      >      >>>
> >     > > >      >      >>
> >     > > >      >      >> Right now the system_unbound_wq is used which
> >     does have a
> >     > > >     limit
> >     > > >      >     on the
> >     > > >      >      >> number of threads, right? I do have a FIXME
> >     to allow a
> >     > > >     worker to be
> >     > > >      >      >> passed in similar to TDR.
> >     > > >      >      >>
> >     > > >      >      >> WRT to latency, the 1:1 ratio could actually
> >     have lower
> >     > > >     latency
> >     > > >      >     as 2 GPU
> >     > > >      >      >> schedulers can be pushing jobs into the backend /
> >     > > cleaning up
> >     > > >      >     jobs in
> >     > > >      >      >> parallel.
> >     > > >      >      >>
> >     > > >      >      >
> >     > > >      >      > Thought of one more point here where why in Xe we
> >     > > >     absolutely want
> >     > > >      >     a 1 to
> >     > > >      >      > 1 ratio between entity and scheduler - the way
> >     we implement
> >     > > >      >     timeslicing
> >     > > >      >      > for preempt fences.
> >     > > >      >      >
> >     > > >      >      > Let me try to explain.
> >     > > >      >      >
> >     > > >      >      > Preempt fences are implemented via the generic
> >     messaging
> >     > > >      >     interface [1]
> >     > > >      >      > with suspend / resume messages. If a suspend
> >     messages is
> >     > > >     received to
> >     > > >      >      > soon after calling resume (this is per entity)
> >     we simply
> >     > > >     sleep in the
> >     > > >      >      > suspend call thus giving the entity a
> >     timeslice. This
> >     > > >     completely
> >     > > >      >     falls
> >     > > >      >      > apart with a many to 1 relationship as now a
> >     entity
> >     > > >     waiting for a
> >     > > >      >      > timeslice blocks the other entities. Could we
> >     work aroudn
> >     > > >     this,
> >     > > >      >     sure but
> >     > > >      >      > just another bunch of code we'd have to add in
> >     Xe. Being to
> >     > > >      >     freely sleep
> >     > > >      >      > in backend without affecting other entities is
> >     really,
> >     > > really
> >     > > >      >     nice IMO
> >     > > >      >      > and I bet Xe isn't the only driver that is
> >     going to feel
> >     > > >     this way.
> >     > > >      >      >
> >     > > >      >      > Last thing I'll say regardless of how anyone
> >     feels about
> >     > > >     Xe using
> >     > > >      >     a 1 to
> >     > > >      >      > 1 relationship this patch IMO makes sense as I
> >     hope we can
> >     > > all
> >     > > >      >     agree a
> >     > > >      >      > workqueue scales better than kthreads.
> >     > > >      >
> >     > > >      >     I don't know for sure what will scale better and
> >     for what use
> >     > > >     case,
> >     > > >      >     combination of CPU cores vs number of GPU engines
> >     to keep
> >     > > >     busy vs other
> >     > > >      >     system activity. But I wager someone is bound to
> >     ask for some
> >     > > >      >     numbers to
> >     > > >      >     make sure proposal is not negatively affecting
> >     any other
> >     > > drivers.
> >     > > >      >
> >     > > >      >
> >     > > >      > Then let them ask.  Waving your hands vaguely in the
> >     direction of
> >     > > >     the
> >     > > >      > rest of DRM and saying "Uh, someone (not me) might
> >     object" is
> >     > > >     profoundly
> >     > > >      > unhelpful.  Sure, someone might. That's why it's on
> >     dri-devel.
> >     > > >     If you
> >     > > >      > think there's someone in particular who might have a
> >     useful
> >     > > >     opinion on
> >     > > >      > this, throw them in the CC so they don't miss the
> >     e-mail thread.
> >     > > >      >
> >     > > >      > Or are you asking for numbers?  If so, what numbers
> >     are you
> >     > > >     asking for?
> >     > > >
> >     > > >     It was a heads up to the Xe team in case people weren't
> >     appreciating
> >     > > >     how
> >     > > >     the proposed change has the potential influence power
> >     and performance
> >     > > >     across the board. And nothing in the follow up
> >     discussion made me
> >     > > think
> >     > > >     it was considered so I don't think it was redundant to
> >     raise it.
> >     > > >
> >     > > >     In my experience it is typical that such core changes
> >     come with some
> >     > > >     numbers. Which is in case of drm scheduler is tricky and
> >     probably
> >     > > >     requires explicitly asking everyone to test (rather than
> >     count on
> >     > > >     "don't
> >     > > >     miss the email thread"). Real products can fail to ship
> >     due ten mW
> >     > > here
> >     > > >     or there. Like suddenly an extra core prevented from
> >     getting into
> >     > > deep
> >     > > >     sleep.
> >     > > >
> >     > > >     If that was "profoundly unhelpful" so be it.
> >     > > >
> >     > > >
> >     > > > With your above explanation, it makes more sense what you're
> >     asking.
> >     > > > It's still not something Matt is likely to be able to
> >     provide on his
> >     > > > own.  We need to tag some other folks and ask them to test
> >     it out.  We
> >     > > > could play around a bit with it on Xe but it's not exactly
> >     production
> >     > > > grade yet and is going to hit this differently from most. 
> >     Likely
> >     > > > candidates are probably AMD and Freedreno.
> >     > >
> >     > > Whoever is setup to check out power and performance would be
> >     good to
> >     > > give it a spin, yes.
> >     > >
> >     > > PS. I don't think I was asking Matt to test with other
> >     devices. To start
> >     > > with I think Xe is a team effort. I was asking for more
> >     background on
> >     > > the design decision since patch 4/20 does not say anything on that
> >     > > angle, nor later in the thread it was IMO sufficiently addressed.
> >     > >
> >     > > >      > Also, If we're talking about a design that might
> >     paint us into an
> >     > > >      > Intel-HW-specific hole, that would be one thing.  But
> >     we're not.
> >     > > >     We're
> >     > > >      > talking about switching which kernel threading/task
> >     mechanism to
> >     > > >     use for
> >     > > >      > what's really a very generic problem.  The core Xe
> >     design works
> >     > > >     without
> >     > > >      > this patch (just with more kthreads).  If we land
> >     this patch or
> >     > > >      > something like it and get it wrong and it causes a
> >     performance
> >     > > >     problem
> >     > > >      > for someone down the line, we can revisit it.
> >     > > >
> >     > > >     For some definition of "it works" - I really wouldn't
> >     suggest
> >     > > >     shipping a
> >     > > >     kthread per user context at any point.
> >     > > >
> >     > > >
> >     > > > You have yet to elaborate on why. What resources is it
> >     consuming that's
> >     > > > going to be a problem? Are you anticipating CPU affinity
> >     problems? Or
> >     > > > does it just seem wasteful?
> >     > >
> >     > > Well I don't know, commit message says the approach does not
> >     scale. :)
> >     > >
> >     > > > I think I largely agree that it's probably
> >     unnecessary/wasteful but
> >     > > > reducing the number of kthreads seems like a tractable
> >     problem to solve
> >     > > > regardless of where we put the gpu_scheduler object.  Is
> >     this the right
> >     > > > solution?  Maybe not.  It was also proposed at one point
> >     that we could
> >     > > > split the scheduler into two pieces: A scheduler which owns
> >     the kthread,
> >     > > > and a back-end which targets some HW ring thing where you
> >     can have
> >     > > > multiple back-ends per scheduler.  That's certainly more
> >     invasive from a
> >     > > > DRM scheduler internal API PoV but would solve the kthread
> >     problem in a
> >     > > > way that's more similar to what we have now.
> >     > > >
> >     > > >      >     In any case that's a low level question caused by
> >     the high
> >     > > >     level design
> >     > > >      >     decision. So I'd think first focus on the high
> >     level - which
> >     > > >     is the 1:1
> >     > > >      >     mapping of entity to scheduler instance proposal.
> >     > > >      >
> >     > > >      >     Fundamentally it will be up to the DRM
> >     maintainers and the
> >     > > >     community to
> >     > > >      >     bless your approach. And it is important to
> >     stress 1:1 is
> >     > > about
> >     > > >      >     userspace contexts, so I believe unlike any other
> >     current
> >     > > >     scheduler
> >     > > >      >     user. And also important to stress this
> >     effectively does not
> >     > > >     make Xe
> >     > > >      >     _really_ use the scheduler that much.
> >     > > >      >
> >     > > >      >
> >     > > >      > I don't think this makes Xe nearly as much of a
> >     one-off as you
> >     > > >     think it
> >     > > >      > does.  I've already told the Asahi team working on
> >     Apple M1/2
> >     > > >     hardware
> >     > > >      > to do it this way and it seems to be a pretty good
> >     mapping for
> >     > > >     them. I
> >     > > >      > believe this is roughly the plan for nouveau as
> >     well.  It's not
> >     > > >     the way
> >     > > >      > it currently works for anyone because most other
> >     groups aren't
> >     > > >     doing FW
> >     > > >      > scheduling yet.  In the world of FW scheduling and
> >     hardware
> >     > > >     designed to
> >     > > >      > support userspace direct-to-FW submit, I think the
> >     design makes
> >     > > >     perfect
> >     > > >      > sense (see below) and I expect we'll see more drivers
> >     move in this
> >     > > >      > direction as those drivers evolve. (AMD is doing some
> >     customish
> >     > > >     thing
> >     > > >      > for how with gpu_scheduler on the front-end somehow.
> >     I've not dug
> >     > > >     into
> >     > > >      > those details.)
> >     > > >      >
> >     > > >      >     I can only offer my opinion, which is that the
> >     two options
> >     > > >     mentioned in
> >     > > >      >     this thread (either improve drm scheduler to cope
> >     with what is
> >     > > >      >     required,
> >     > > >      >     or split up the code so you can use just the parts of
> >     > > >     drm_sched which
> >     > > >      >     you want - which is frontend dependency tracking)
> >     shouldn't
> >     > > be so
> >     > > >      >     readily dismissed, given how I think the idea was
> >     for the new
> >     > > >     driver to
> >     > > >      >     work less in a silo and more in the community
> >     (not do kludges
> >     > > to
> >     > > >      >     workaround stuff because it is thought to be too
> >     hard to
> >     > > >     improve common
> >     > > >      >     code), but fundamentally, "goto previous
> >     paragraph" for what
> >     > > I am
> >     > > >      >     concerned.
> >     > > >      >
> >     > > >      >
> >     > > >      > Meta comment:  It appears as if you're falling into
> >     the standard
> >     > > >     i915
> >     > > >      > team trap of having an internal discussion about what the
> >     > > community
> >     > > >      > discussion might look like instead of actually having the
> >     > > community
> >     > > >      > discussion.  If you are seriously concerned about
> >     interactions
> >     > > with
> >     > > >      > other drivers or whether or setting common direction,
> >     the right
> >     > > >     way to
> >     > > >      > do that is to break a patch or two out into a
> >     separate RFC series
> >     > > >     and
> >     > > >      > tag a handful of driver maintainers.  Trying to
> >     predict the
> >     > > >     questions
> >     > > >      > other people might ask is pointless. Cc them and
> >     asking for their
> >     > > >     input
> >     > > >      > instead.
> >     > > >
> >     > > >     I don't follow you here. It's not an internal discussion
> >     - I am
> >     > > raising
> >     > > >     my concerns on the design publicly. I am supposed to
> >     write a patch to
> >     > > >     show something, but am allowed to comment on a RFC series?
> >     > > >
> >     > > >
> >     > > > I may have misread your tone a bit.  It felt a bit like too many
> >     > > > discussions I've had in the past where people are trying to
> >     predict what
> >     > > > others will say instead of just asking them. Reading it
> >     again, I was
> >     > > > probably jumping to conclusions a bit.  Sorry about that.
> >     > >
> >     > > Okay no problem, thanks. In any case we don't have to keep
> >     discussing
> >     > > it, since I wrote one or two emails ago it is fundamentally on the
> >     > > maintainers and community to ack the approach. I only felt
> >     like RFC did
> >     > > not explain the potential downsides sufficiently so I wanted
> >     to probe
> >     > > that area a bit.
> >     > >
> >     > > >     It is "drm/sched: Convert drm scheduler to use a work
> >     queue rather
> >     > > than
> >     > > >     kthread" which should have Cc-ed _everyone_ who use drm
> >     scheduler.
> >     > > >
> >     > > >
> >     > > > Yeah, it probably should have.  I think that's mostly what
> >     I've been
> >     > > > trying to say.
> >     > > >
> >     > > >      >
> >     > > >      >     Regards,
> >     > > >      >
> >     > > >      >     Tvrtko
> >     > > >      >
> >     > > >      >     P.S. And as a related side note, there are more
> >     areas where
> >     > > >     drm_sched
> >     > > >      >     could be improved, like for instance priority
> >     handling.
> >     > > >      >     Take a look at msm_submitqueue_create /
> >     > > >     msm_gpu_convert_priority /
> >     > > >      >     get_sched_entity to see how msm works around the
> >     drm_sched
> >     > > >     hardcoded
> >     > > >      >     limit of available priority levels, in order to
> >     avoid having
> >     > > >     to leave a
> >     > > >      >     hw capability unused. I suspect msm would be
> >     happier if they
> >     > > >     could have
> >     > > >      >     all priority levels equal in terms of whether
> >     they apply only
> >     > > >     at the
> >     > > >      >     frontend level or completely throughout the pipeline.
> >     > > >      >
> >     > > >      >      > [1]
> >     > > >      >
> >     > > >
> >     https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
> >     <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1>
> >     > > >   
> >      <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
> >     <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1>
> >     > > >
> >     > > >      >
> >     > > >       <
> >     > >
> >     https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
> >     <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1>
> >     <
> >     > >
> >     https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
> >     <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1>>>
> >     > > >      >      >
> >     > > >      >      >>> What would be interesting to learn is
> >     whether the option
> >     > > of
> >     > > >      >     refactoring
> >     > > >      >      >>> drm_sched to deal with out of order
> >     completion was
> >     > > >     considered
> >     > > >      >     and what were
> >     > > >      >      >>> the conclusions.
> >     > > >      >      >>>
> >     > > >      >      >>
> >     > > >      >      >> I coded this up a while back when trying to
> >     convert the
> >     > > >     i915 to
> >     > > >      >     the DRM
> >     > > >      >      >> scheduler it isn't all that hard either. The
> >     free flow
> >     > > >     control
> >     > > >      >     on the
> >     > > >      >      >> ring (e.g. set job limit == SIZE OF RING /
> >     MAX JOB SIZE)
> >     > > is
> >     > > >      >     really what
> >     > > >      >      >> sold me on the this design.
> >     > > >      >
> >     > > >      >
> >     > > >      > You're not the only one to suggest supporting
> >     out-of-order
> >     > > >     completion.
> >     > > >      > However, it's tricky and breaks a lot of internal
> >     assumptions of
> >     > > the
> >     > > >      > scheduler. It also reduces functionality a bit
> >     because it can no
> >     > > >     longer
> >     > > >      > automatically rate-limit HW/FW queues which are often
> >     > > >     fixed-size.  (Ok,
> >     > > >      > yes, it probably could but it becomes a substantially
> >     harder
> >     > > >     problem.)
> >     > > >      >
> >     > > >      > It also seems like a worse mapping to me.  The goal
> >     here is to
> >     > > turn
> >     > > >      > submissions on a userspace-facing engine/queue into
> >     submissions
> >     > > >     to a FW
> >     > > >      > queue submissions, sorting out any dma_fence
> >     dependencies.  Matt's
> >     > > >      > description of saying this is a 1:1 mapping between
> >     sched/entity
> >     > > >     doesn't
> >     > > >      > tell the whole story. It's a 1:1:1 mapping between
> >     xe_engine,
> >     > > >      > gpu_scheduler, and GuC FW engine. Why make it a
> >     1:something:1
> >     > > >     mapping?
> >     > > >      > Why is that better?
> >     > > >
> >     > > >     As I have stated before, what I think what would fit
> >     well for Xe is
> >     > > one
> >     > > >     drm_scheduler per engine class. In specific terms on our
> >     current
> >     > > >     hardware, one drm scheduler instance for render,
> >     compute, blitter,
> >     > > >     video
> >     > > >     and video enhance. Userspace contexts remain scheduler
> >     entities.
> >     > > >
> >     > > >
> >     > > > And this is where we fairly strongly disagree.  More in a bit.
> >     > > >
> >     > > >     That way you avoid the whole kthread/kworker story and
> >     you have it
> >     > > >     actually use the entity picking code in the scheduler,
> >     which may be
> >     > > >     useful when the backend is congested.
> >     > > >
> >     > > >
> >     > > > What back-end congestion are you referring to here?  Running
> >     out of FW
> >     > > > queue IDs?  Something else?
> >     > >
> >     > > CT channel, number of context ids.
> >     > >
> >     > > >
> >     > > >     Yes you have to solve the out of order problem so in my
> >     mind that is
> >     > > >     something to discuss. What the problem actually is (just
> >     TDR?), how
> >     > > >     tricky and why etc.
> >     > > >
> >     > > >     And yes you lose the handy LRCA ring buffer size
> >     management so you'd
> >     > > >     have to make those entities not runnable in some other way.
> >     > > >
> >     > > >     Regarding the argument you raise below - would any of
> >     that make the
> >     > > >     frontend / backend separation worse and why? Do you
> >     think it is less
> >     > > >     natural? If neither is true then all remains is that it
> >     appears extra
> >     > > >     work to support out of order completion of entities has been
> >     > > discounted
> >     > > >     in favour of an easy but IMO inelegant option.
> >     > > >
> >     > > >
> >     > > > Broadly speaking, the kernel needs to stop thinking about
> >     GPU scheduling
> >     > > > in terms of scheduling jobs and start thinking in terms of
> >     scheduling
> >     > > > contexts/engines.  There is still some need for scheduling
> >     individual
> >     > > > jobs but that is only for the purpose of delaying them as
> >     needed to
> >     > > > resolve dma_fence dependencies.  Once dependencies are
> >     resolved, they
> >     > > > get shoved onto the context/engine queue and from there the
> >     kernel only
> >     > > > really manages whole contexts/engines.  This is a major
> >     architectural
> >     > > > shift, entirely different from the way i915 scheduling
> >     works.  It's also
> >     > > > different from the historical usage of DRM scheduler which I
> >     think is
> >     > > > why this all looks a bit funny.
> >     > > >
> >     > > > To justify this architectural shift, let's look at where
> >     we're headed.
> >     > > > In the glorious future...
> >     > > >
> >     > > >   1. Userspace submits directly to firmware queues.  The
> >     kernel has no
> >     > > > visibility whatsoever into individual jobs. At most it can
> >     pause/resume
> >     > > > FW contexts as needed to handle eviction and memory management.
> >     > > >
> >     > > >   2. Because of 1, apart from handing out the FW queue IDs
> >     at the
> >     > > > beginning, the kernel can't really juggle them that much. 
> >     Depending on
> >     > > > FW design, it may be able to pause a client, give its IDs to
> >     another,
> >     > > > and then resume it later when IDs free up. What it's not
> >     doing is
> >     > > > juggling IDs on a job-by-job basis like i915 currently is.
> >     > > >
> >     > > >   3. Long-running compute jobs may not complete for days. 
> >     This means
> >     > > > that memory management needs to happen in terms of
> >     pause/resume of
> >     > > > entire contexts/engines using the memory rather than based
> >     on waiting
> >     > > > for individual jobs to complete or pausing individual jobs
> >     until the
> >     > > > memory is available.
> >     > > >
> >     > > >   4. Synchronization happens via userspace memory fences
> >     (UMF) and the
> >     > > > kernel is mostly unaware of most dependencies and when a
> >     context/engine
> >     > > > is or is not runnable.  Instead, it keeps as many of them
> >     minimally
> >     > > > active (memory is available, even if it's in system RAM) as
> >     possible and
> >     > > > lets the FW sort out dependencies.  (There may need to be
> >     some facility
> >     > > > for sleeping a context until a memory change similar to
> >     futex() or
> >     > > > poll() for userspace threads.  There are some details TBD.)
> >     > > >
> >     > > > Are there potential problems that will need to be solved
> >     here?  Yes.  Is
> >     > > > it a good design?  Well, Microsoft has been living in this
> >     future for
> >     > > > half a decade or better and it's working quite well for
> >     them.  It's also
> >     > > > the way all modern game consoles work.  It really is just
> >     Linux that's
> >     > > > stuck with the same old job model we've had since the
> >     monumental shift
> >     > > > to DRI2.
> >     > > >
> >     > > > To that end, one of the core goals of the Xe project was to
> >     make the
> >     > > > driver internally behave as close to the above model as
> >     possible while
> >     > > > keeping the old-school job model as a very thin layer on
> >     top.  As the
> >     > > > broader ecosystem problems (window-system support for UMF,
> >     for instance)
> >     > > > are solved, that layer can be peeled back. The core driver
> >     will already
> >     > > > be ready for it.
> >     > > >
> >     > > > To that end, the point of the DRM scheduler in Xe isn't to
> >     schedule
> >     > > > jobs.  It's to resolve syncobj and dma-buf implicit sync
> >     dependencies
> >     > > > and stuff jobs into their respective context/engine queue
> >     once they're
> >     > > > ready.  All the actual scheduling happens in firmware and
> >     any scheduling
> >     > > > the kernel does to deal with contention, oversubscriptions,
> >     too many
> >     > > > contexts, etc. is between contexts/engines, not individual
> >     jobs.  Sure,
> >     > > > the individual job visibility is nice, but if we design
> >     around it, we'll
> >     > > > never get to the glorious future.
> >     > > >
> >     > > > I really need to turn the above (with a bit more detail)
> >     into a blog
> >     > > > post.... Maybe I'll do that this week.
> >     > > >
> >     > > > In any case, I hope that provides more insight into why Xe
> >     is designed
> >     > > > the way it is and why I'm pushing back so hard on trying to
> >     make it more
> >     > > > of a "classic" driver as far as scheduling is concerned. 
> >     Are there
> >     > > > potential problems here?  Yes, that's why Xe has been labeled a
> >     > > > prototype.  Are such radical changes necessary to get to
> >     said glorious
> >     > > > future?  Yes, I think they are.  Will it be worth it?  I
> >     believe so.
> >     > >
> >     > > Right, that's all solid I think. My takeaway is that frontend
> >     priority
> >     > > sorting and that stuff isn't needed and that is okay. And that
> >     there are
> >     > > multiple options to maybe improve drm scheduler, like the fore
> >     mentioned
> >     > > making it deal with out of order, or split into functional
> >     components,
> >     > > or split frontend/backend what you suggested. For most of them
> >     cost vs
> >     > > benefit is more or less not completely clear, neither how much
> >     effort
> >     > > was invested to look into them.
> >     > >
> >     > > One thing I missed from this explanation is how drm_scheduler
> >     per engine
> >     > > class interferes with the high level concepts. And I did not
> >     manage to
> >     > > pick up on what exactly is the TDR problem in that case. Maybe
> >     the two
> >     > > are one and the same.
> >     > >
> >     > > Bottom line is I still have the concern that conversion to
> >     kworkers has
> >     > > an opportunity to regress. Possibly more opportunity for some
> >     Xe use
> >     > > cases than to affect other vendors, since they would still be
> >     using per
> >     > > physical engine / queue scheduler instances.
> >     > >
> >     > > And to put my money where my mouth is I will try to put testing Xe
> >     > > inside the full blown ChromeOS environment in my team plans.
> >     It would
> >     > > probably also be beneficial if Xe team could take a look at
> >     real world
> >     > > behaviour of the extreme transcode use cases too. If the stack
> >     is ready
> >     > > for that and all. It would be better to know earlier rather
> >     than later
> >     > > if there is a fundamental issue.
> >     > >
> >     > > For the patch at hand, and the cover letter, it certainly
> >     feels it would
> >     > > benefit to record the past design discussion had with AMD
> >     folks, to
> >     > > explicitly copy other drivers, and to record the theoretical
> >     pros and
> >     > > cons of threads vs unbound workers as I have tried to
> >     highlight them.
> >     > >
> >     > > Regards,
> >     > >
> >     > > Tvrtko
> >     > >
> > 
