Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8036970D421
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 08:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8624A10E3FD;
	Tue, 23 May 2023 06:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C5210E3EA;
 Tue, 23 May 2023 06:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684824050; x=1716360050;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dBA2/s0ac4TQZWHoiOGMXXT78j8LeJJK4LOGH2851o0=;
 b=Kd/PlOjAQin+YhU8QjeocOcRRxPQzFoUY1OqO5cGLdOzRDAiEFtYaOpz
 bvlSdyYD+L2KciNArCMzwaljqcE9sCud4AJsEe33vyOETQBJhVjEvcoI0
 poLsMysOAktgiph6vujZsg66SRK4HQizuitQxBGT8mVQdl0txUBeBn1aT
 +F+TyQfkpWC3k4cfIIOWKCjF1AYYiful+coN3NrYVssOQhNSgnF4vPNg8
 /emucf7bgjlxYMGIqePgAoolH5E+g+1QGFhBfwO8gEJMp8A7nnEtMTFmZ
 XRx8+lb6h5Qv/kxss4GvVEc2UJEn4pHo7SNIov7ptKX4fNOXDKQl6Oo0M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="351998612"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="351998612"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 23:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="848142363"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="848142363"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 22 May 2023 23:40:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 23:40:49 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 23:40:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 23:40:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 23:40:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVrWLXwwi/gZg3eXLfhqKq/m8bVAMoclZ/i9L/fnWndwQ6du2MHL3luSFyqpltttxY9uCSK/kK/GBX5lwguHejiIiV1KYSLuEkD10ctFzIQNjhYUqMwGrpLexsx5hZKBnjH56tFrQouZ99FREujA0W+3DgmsrQolTUuzjAOnHW70I2fy83i6rSXzIIbfypRHKymLFS9l0togDa5K/1+F1li0cypQBl5gGRe66GJnkgz3mvGJ/0MX03MKdcS6Ytb2LOKaf2gDSSMJ+jYbRUooZnCAqwwJjQF9ec8u+DfAPUv1qUbrqWsporlRURPbC/v/ka6vsSe9G9ygHrIVihktGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKuTqGlin8z4jetESFgSjNx0Fo0jWTQV9jHcrLPXDck=;
 b=bKbcXNAAC2HMg616WB+jMXS/uPTbK2OknLuwzIrECffrMegq1cXkUduR3sBIFziEuK6e+UocE3lEDm+KlNEuF9/J16R12hYUL3/PuutoOtJE8q+FZBXDZVEIf5000jzuqA5mPNi3ds4njVDF5EtRghfot02zMeL3QMv4SBdbgxEsd+X3T7+TVXaWezjPaYOJIRXdPufPMwm14Xx5MNd1G7GWphatm+LV2uTunl4nFyq8cV8q3f0LE000ZJvUoUQcuRxRan3SLy3daYuWrq18fCXOK5KbUXlAkKq+ANd/3jx8lPYasfw9eqCcUpIN+KYgm1neOARHrZYH0nu5aqawwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 06:40:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 06:40:46 +0000
Date: Mon, 22 May 2023 23:40:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/doc/rfc/xe: No STAGING in drm.
Message-ID: <z4dxbo4axtxh3zdpgd5lsgxbvppr7m47klagzvzoa2i3crr6c2@2azkiysgfkbj>
References: <20230522195712.2162736-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522195712.2162736-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0194.namprd05.prod.outlook.com
 (2603:10b6:a03:330::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: 79320a12-e9ee-4339-33cd-08db5b58a38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ct0PacNWLpE89OrF8G+4Gsp5RB+jY3EB6eFdpUpc8zHo3XUI6zskUr2EfQj9ts7ydVrprEFvIZcMqfNVQGt1QzP3sTFQ6gFm9HOKLJLFEDlsxUFVt81vudZRiJM0puPYjvarBK24gWZ/bdI+1MzLE2Fxb771GojKEjw+tPJzvZmyCImmCElwRsC1VuCwJ0OwwCedMGbAb96/KnJTShsCEKsKvYNo3QV312AIkMRXLc9UZZlQ/z+W6A+FeUjWCFHUCKzR42cSLB/kz/sX11IseKQ9LeA8QBEcHfhgWeLuuqFWVeaiP532ToACt+40QOrb3FgIM9ZdAHWsLLk4J6VQIOJRZVHfq3diVvWPCjRx/3nPElsc7qIi7D5BvYLa+JOZzdqqatVfiHqHIrJuQh+4YIIG3TjX0aD1kx1WqtI67KNxbQ31nbjH9rX2llLvkUMoMOfHIsHxuA4Amp6oo74fZyn9pIMTzJZHVBJpRidqdrODwZURUxUF4Rnt9e/mA0WRnGM0tFoeKTMzy0whzAVOlD93BYXVY1yFrPEsoDebisw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(26005)(9686003)(6512007)(6506007)(107886003)(83380400001)(186003)(2906002)(4326008)(6636002)(316002)(66476007)(66556008)(66946007)(38100700002)(41300700001)(6486002)(54906003)(478600001)(33716001)(86362001)(82960400001)(8936002)(8676002)(6862004)(5660300002)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEVTQkovRmtkbDdZVENYMEk1MzV1aU90VmpHS2FENG4wV25EUDNBOTJKQjVu?=
 =?utf-8?B?WnFMTmlOaDY0RlVETTJDemdwRmtnY3BQaFlyYXhVT3ptcFRVem9pbTRKcEcv?=
 =?utf-8?B?ZjBxeWFSbHB4M1pxaWhDYXM3ZXRmMWRpd0MzU0ZFZnpKWHBTZEswL2tTd3Jn?=
 =?utf-8?B?NEZkWERUeFViaGJ5enNZeWNFZWJMbitOaVAvcWNhdTlCMHljNWgwdnQ5cXRJ?=
 =?utf-8?B?ekgwNFYzSGt0OE42MC8welNrTWM3YUt1b2RGMkRnNVVSSE1KMm5yWTZlMm5T?=
 =?utf-8?B?OHNuUjczNUxJNEtoUGFsNGtmOFovOSszaFZGUUxqandnbWtuWTM3MzBHU2xR?=
 =?utf-8?B?SXg5OEhhQ1FWNFJEN1NxcThlUFFFcmdEcXVMSHg4TG8wUVVQTWtnTlJBLzRv?=
 =?utf-8?B?amwxWllMMG5OeDFHYVljVS96SW4ySHpGdC9yYUlGU0x3cUtJMEgwb3BFVllO?=
 =?utf-8?B?RUNWTTFXVEVseUNLdVBNNFh4cks4N3ZoZGVyK3U0RTU4eGN6OEMweCtVMEdi?=
 =?utf-8?B?VzJobk9hemNPb3BkWlI5OVVXWTQxczhORHhzV1JPTEpKVTNwMndXU3ZRdXps?=
 =?utf-8?B?M2hjdnoySWdMbjM1bmdQVXFMRDdBNm9qYklkR3dlcy9ndEVRRzN1NU5rUjZw?=
 =?utf-8?B?VVp2elJuVDdvK204RXY5dGFQQmZqaXJUSmR5eEN2YWtLMHF4dDN6YjNhUUoz?=
 =?utf-8?B?dEVIaEZKQUVUcVE4SEJYTU5DQUc2L1EzZ3BrMWxaa2JwdnUzMGd5R0pqN2tw?=
 =?utf-8?B?ZENxcHpVSnlWMk41alE5VFgrcjhWMFhOS3dvS09KTDcvRmlkZHhtVXNwc3d4?=
 =?utf-8?B?OUxYbjdkaGtlWGozaDUzTWhkdEJXN0VIYnROMyt5MTVzUnBHVHkrc0h4a1lt?=
 =?utf-8?B?UmNKY0Q1b1pPL2Q0VVhxUzVUQnF1ckR1bXZHY1B6ZFRNQWRTd1NZdmx2MG9z?=
 =?utf-8?B?eWZ2anI2eGpwcXptUWJ4RWxwRi90UTNuWms1VmFnRG5XTkRwNVp6c3FnckJt?=
 =?utf-8?B?TWJtRS8vUFVlQVdEb1I1K3JpZVc1NEpET3NlY29iU3VvbXdsVnpxd0RBZVVM?=
 =?utf-8?B?L3BLdWFSY3l5U3o0UWFTd014bFBvSUw5aldMVlllTHl5OFZMOEp5YTFzSjNy?=
 =?utf-8?B?R3d1a3Z3Vjh6NExOaVlDbkY3cTZaUlpKVDhJTGN1TXRQdnZ5cTBqK01tZDB6?=
 =?utf-8?B?R1c1VVJMam5oTjRUQkdhSnEyendUekMzS2gwLzh6ZGhZamFKeE4wS2phT0wv?=
 =?utf-8?B?bWVMdlUvNlZ4ZkJUVWVsZ3p3OWQrV2paaEhTUHlud2s5N2dTWWIxaFBMNlhN?=
 =?utf-8?B?dzIwSG84QldjckZpaXZqZW1JWVc5L3czNjZBdUdmblVtUUIvZG0rbUMrZDFX?=
 =?utf-8?B?VFgxUTNOeEhXMmZqTjhMMGFJcVVheTBKdXRMNWoxblkra01kdUdzSElkSkY3?=
 =?utf-8?B?eG5hRVdFcjBvOW02R1VlZzJwQ21Fa2pCVU1INEdSR3FCNGwyQTdkUW5mU2Fl?=
 =?utf-8?B?TkttU2Y1T1FpbmZqbTdKNXFMKzlKZWRTa3krMjJHVnlUY3VaMW03dGVqaTJV?=
 =?utf-8?B?ZSs0T2VMRjN1bFpNQ2lQSktSSCtIL04zUE5ZTGNRelFvMFpsK3N1LzM4Zkxk?=
 =?utf-8?B?SUp4MkVJaHpBUDd3OXZtMzkyQ09tcUJXZ3RDKzdTRmZHaWwzOCs5dHlZdlpF?=
 =?utf-8?B?c1cyTXFDWEEwZ0NHWEc0aEVzVTcyKytvaEQwdWtGZVdDNFBaRmIyTHVjTlhN?=
 =?utf-8?B?Q3pNVkE0WXlyMUF3RENRZG04MzBxQXhOWkhOWFRqRTBUK3dlaUJBazNSUllo?=
 =?utf-8?B?eW5Sb3NIdGpFUTY4dGFJUUF0RldkVVliNEQ0Q2R4akF1S2pPZUg1R0hYV09G?=
 =?utf-8?B?cGFLaFRnY0FsbW5ZK3dmUFVhb0FTSFkyZkFHMTA4WlUyek05MjlZYnEwMFc4?=
 =?utf-8?B?MlZMUFIxSU1tZ3JZZFh5RGxVSlpnMlJkckNRUGxCbnhaOE1WazYyblZmeWRl?=
 =?utf-8?B?ZFJBek1PYXFXMDZYRlFPNnlRWERZS0ljV01IQUdYUmdtWVBHcy8zZHZrdlRq?=
 =?utf-8?B?UzdoY2pRaHBjOXk1ZW1JcTQrdFJPeFROcURyNktKYnAwb05MVFJxMSsyWWcw?=
 =?utf-8?B?QWdkZVBnWldCVmR1S0tkQjBwbVJPQTliRjB0NStORFNpU3lBVFdhSmtDNlJJ?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79320a12-e9ee-4339-33cd-08db5b58a38a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 06:40:46.4074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NSSf2u/rX72kjjx4oY8LIWAKaJjAhpfSGZFR+bpHlmTSL7bVsY5jExyDGYocFjka8Ma1187v0RmcjGvR8A9aAgISpbnnPTB1XdjyeDLNKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Luis Strano <luis.strano@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 03:57:12PM -0400, Rodrigo Vivi wrote:
>We are not using the STAGING inside drm and the uAPI needs to be
>in the acceptable form before we get merged upstream.

Is this a change from i915, where the force_probe protection 
is sufficient?

The email exchange with Greg KH  highlighted that the use of STAGING
outside of staging dir doesn't really produce the desired effect*.
Would it be sufficient to taint the kernel with bit 10 or
create a dedicated taint for this case?

Lucas De Marchi

* The logic for adding the taint is in the module load code and is
   triggered for modules with MODULE_INFO(staging), automatically
   added by modpost for modules under drivers/staging

>
>Link: https://lore.kernel.org/all/2023051029-overspend-sherry-1b85@gregkh/
>Cc: Dave Airlie <airlied@redhat.com>
>Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>Cc: Oded Gabbay <ogabbay@kernel.org>
>Cc: Francois Dugast <francois.dugast@intel.com>
>Cc: Luis Strano <luis.strano@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> Documentation/gpu/rfc/xe.rst | 7 ++-----
> 1 file changed, 2 insertions(+), 5 deletions(-)
>
>diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
>index 2516fe141db6..8524095a54bd 100644
>--- a/Documentation/gpu/rfc/xe.rst
>+++ b/Documentation/gpu/rfc/xe.rst
>@@ -67,11 +67,8 @@ platforms.
>
> When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
>
>-Xe driver will be protected with both STAGING Kconfig and force_probe. Changes in
>-the uAPI are expected while the driver is behind these protections. STAGING will
>-be removed when the driver uAPI gets to a mature state where we can guarantee the
>-‘no regression’ rule. Then force_probe will be lifted only for future platforms
>-that will be productized with Xe driver, but not with i915.
>+Xe driver will be protected with force_probe, which will be lifted only for
>+future platforms that will be productized with Xe driver, but not with i915.
>
> Xe – Pre-Merge Goals
> ====================
>-- 
>2.39.2
>
