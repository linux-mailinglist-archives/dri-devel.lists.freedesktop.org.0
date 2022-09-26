Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2995E97EF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 04:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A8B10E4BD;
	Mon, 26 Sep 2022 02:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A3B10E4BD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 02:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664159857; x=1695695857;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Odfw14AN8MWLImLxvv/aqXZehcKLVRDrXvauVlqWoSU=;
 b=TLQkjRm682EW1OkrG2l/RKj6AMDYWOV3M74EFeTMKZduLzV+ii0AsYeA
 nS6wBzZ1XvsrxVUBWSJG+2f4Y1X52L3mjNLzaCHzTOMHqVoVmu7fQkqe0
 rqLCoMzQY4fXQRbJenudVl3chobG7DwPGKOg9s7iKKUKZSbYdYLrQtrrI
 AFE39VIQQzx9EEB94YzG79/l5U14VnIaczcI6tua4brbhx/nm88bAAJ/T
 qYfa7Pph5XOZVyPSOJ7NjcPuCewMW5JoEk1iJOQkc+nwaPCs6UIDqnI8R
 BHm6mR+laPYB3rOsQ6L1NDauz7MNdLAm7P4P/MmvSKOuH2ODHo7TW75SK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="280648138"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="280648138"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2022 19:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="949682327"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2022 19:37:37 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 25 Sep 2022 19:37:36 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 25 Sep 2022 19:37:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 25 Sep 2022 19:37:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 25 Sep 2022 19:37:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdXhv/l7a254fvt4eTEP6VwvnXvj6HVAcODziHHfPn0V4xm2kWnsgigdYzCbXaS9czeYf4+PnU5BTTZqD5StRYCR1+nPEVmEjLtjjY8pc/xUV5vHJBYMzhw64T0DVUBdb+brTg80klBMkTcF4nFaF0ws0jcUZH6BeMvu5FGZTafcQEwu3sTfzYNy8lLqKAjaAH+JrcfAgA8vTmxcLW6PB523qDWtrnOQU1JfOQrf2WknnMnRwLnzHDmnCosPc/NUbWHuKX1WpgC9Qh0bQWp4amDbvF5wYaRnaQl3sekeE24LzaiaqMloO9z+aawN7EyCUwg2J2eDTBlZfemaCjZm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwLTBfU1ofjeUUjMGoze//G2MSKd2dfTDnG4ty23GyE=;
 b=X9w7kS18kpYvEFwa04TzVcsyBRS0kidl/aA6bIxRnC1NlqWy8EVcwih8Xz9Udd+3M/j/6R3saoCyFSV99tgmWtub8CEMtZhDJKO0wdiNTXJ5Evso5JDABmkBGRiPMs8MXeZJ/Js6yrMYSvDeG1nFNorG+DFGPOoXiR4cq+YnXRIIJ9FM/dnHtiF3mcqRYDI5o6pzam1wTBr5SKqGInhtHcHexDcLIl4wLZMKgFkgHWvl0RWZ8fV4bMJEIBd+bfFcY8L2NbM+Kd8BGptvXOEhRut0iIFjC8epMMBn9llfnNfZL6AIY7odSDzHJguKM10nRMgPu5HRjDk+ZrcrmC6Sow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 02:37:34 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 02:37:34 +0000
Date: Mon, 26 Sep 2022 04:37:31 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 1/2] drm/tests: Split drm_test_dp_mst_calc_pbn_mode into
 parameterized tests
Message-ID: <20220926023731.46n5amwykwvvlhrd@nostramo>
References: <20220925222719.345424-1-mcanal@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220925222719.345424-1-mcanal@igalia.com>
X-ClientProxiedBy: AM6P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: da382838-28d2-4a15-a289-08da9f68119f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y0xgoXh04NTHXfrTol9LT6OYo0flT7NhWjwWrx0cy9MpjE6I3nOkiELbOjDPvReGUEZwFPrOCqRD7l4pY1nTLZZaLKj/asuvBLCIjyVQrJScylhgihvF53boO4cx+HocnusGCi1+thLCxa9rsPkf3vce+JJD/D9iQnUrghSPQANEWPnj+sUoS5qY6i3pTXG5wXc/BJmBvso/d7E75Jh7kFrOg2+wa9iD9q5drP2V6bMCNuv9m63qG8y9QeG6j3ugTjNzVGveo3QST1VyTYNJZrSIsb9oA6GeEwooMt9i87PxpkYtCDYgTAOHoLkErIVwM6f/kkoCobn77tywcTCX4bPVAH6vVp5M73lYJ0nnKoTAbprKkN0imeu8NRsUnPaKfoSELuuQvu2nnHTUZ/5PFhvj7QBUF1cTOeNNeDBIwPCrjfcSthaMfRmTfh2Phettrwdd4J1qFybTUyWOtB9mH8O8MvtfLOnwIhAvT7g476rM05xeFctotaFl0nZ0KU6Bx/A/X1bNsGhk2mMRdki/d+flXWObYv8X08QyZeA7hznedw4hC6mtdM9tSxLZoCBsMUvsPeQbAN+oF0PsMBL/l6E7l31b9gDmhMOI7OpAvCqPZ1NHb0I9qibvo2vQjOS2u4YIQ/gtCvI5abEnkDaMl/sobmsxPLrTcVPIuBM842my+a6d4IPXyZqCrA7GZhchHGZ0uATCuGwwJmwkCFYfIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199015)(33716001)(83380400001)(6666004)(41300700001)(6512007)(26005)(9686003)(186003)(8936002)(5660300002)(86362001)(4744005)(2906002)(7416002)(54906003)(66476007)(38100700002)(66556008)(316002)(8676002)(6916009)(1076003)(6506007)(478600001)(6486002)(66946007)(82960400001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UENvcVRLblFmdlJWUFEwcFhUaFo5ZWNBbWZKRzdJdWZOMmJMSVVUbHNpbDdL?=
 =?utf-8?B?Z3RJdW1BRWU5QjhXQTlKVjlpSDdjMmsxYURPVGlUTzlvUk9yUytqblVlYnlI?=
 =?utf-8?B?TmVTM3kvOS9HTzVOalZ5aEJ3MHlGTUg1c0M5RkNINDd1ZGh6N2lWVmNOTjhp?=
 =?utf-8?B?Wk56Vm9GNXExNDN1Si9lK1h0dCswd2dUZ25nZmJEQSt2d1BhQytoR2tpN3hX?=
 =?utf-8?B?cmxnemlFWkpzY3QyWVVDUXF4aGd4MmIrL3lCTFZ1cklEZk1hdkkyUW5Lb0Fw?=
 =?utf-8?B?aDYzcUlZZ21YckhTOXRHNTY0NTJvY1hNZmxtYjZQQWxPVDd2Z2hIdW9iNkZM?=
 =?utf-8?B?OWsyZWlVVVc0NGhFMUI0R1d2Z2UvYVVOZzRWTE1WcjRGTS9BN2F5Zi9HS1Ur?=
 =?utf-8?B?djRUV0NBd1VsVkZSM1FrS0dhSGZSQkQxQVpZeFE4Rkt5YXlCMDR0bTBlbW5j?=
 =?utf-8?B?Y0JRSGlTZjVNdTNkMVJ5WjE0UGl4cjFBSUtEZ2loMlkzbkk3WTh5cFl0UlhV?=
 =?utf-8?B?eFBHZmlSazBrcWZ2THl3NEw1dFFiRmZvVm4vL2RUcGYwaHlFdXdUY3NDWmhv?=
 =?utf-8?B?M3dqOTBrTUtOM2VPTEpoajNpNTB5bHJjQlRoS0JTenRPa1h3T0pBNGlzWFpI?=
 =?utf-8?B?MXF1TTVlQnNla0ZLb2lKWnBmTzNDcnYrRE96dk5Kbzh2R0xoVnl5eWhJL3My?=
 =?utf-8?B?VWNMZ1dNKzZjNVA5WXIvallpUjBGamlRalcwb3p2ampnNnd6NFlXNi9ZZ2Jl?=
 =?utf-8?B?bzFiRTNPOHJhQ3FYY2hxTXNrMVd1QUl6VSs1bWZPb3FGVW9nbEw4ZmxKQy9x?=
 =?utf-8?B?aUxNeWlnMjMyOTBzVUhLTDVwa1JxTDdOVzJZaEpXT0ltSTJyZC9vc3A0Z2xL?=
 =?utf-8?B?MDdjUC94R2IwQVNqV0pya3ZkWmxuaEY1bW01aXA3dTFndjV0R05tL3F0SzVv?=
 =?utf-8?B?ZlVoMGh0aU94NzFReHBZbzV6bEZUQkVHOG9aZllhaTBmaENZQXF1Y1h3S1NB?=
 =?utf-8?B?R3l4NnVoQ1Y1dFRyMUFoeE1KdEFFL3JKL3pJbHpldjdJZUx2UExGRkllL0R1?=
 =?utf-8?B?WUlxU1BsMHZrenFwakswN3FjSFo1MU1yU1VPaVM1RWc2T2g4dHRCSWtYN0RV?=
 =?utf-8?B?L1JKWU5ldUo3aG1tWG9pQ2d0UjJKWHhFVStsdmxvTzlDZkhaQVRPNjJDblow?=
 =?utf-8?B?SExZT2hWa1JzOU56R3hTUUxxYWpkZVd3TldlNnVpUFN6TzJKODU5WHJDeU1U?=
 =?utf-8?B?T2RMRWFsZHQ3UEl4TTByS3FYS09PK0Y3ay9vZFZmaThLMGxMUk53cWpxN3BZ?=
 =?utf-8?B?R1ZXc0V3V0c1VGlXOUhBQTlJNEx5bDN6Z0trU1NPTXNkTWxPU0ZDYTJwcUJG?=
 =?utf-8?B?akdOWGFuU1BSWURId0gzZmVjSVpwWXRhODJIa1JMbzErN0N3RHltd3RIald5?=
 =?utf-8?B?d2s5WVFFbEt0bjI3U0RUc0VyRzZSVTA4Z0d5Wlh2QUZxZldGVW03MENyaEV6?=
 =?utf-8?B?cGZqNmFqczZIaDc0N0V3MWVqampCQTFzMG43aUxMNkFKdjYxNzdHUzh2b1dl?=
 =?utf-8?B?WlUwRGdQTGN3UkJjQXZ4NkYxMzFMMWRqT3A0MFdkNEV5ZXRsUXNWR1Z1QUZK?=
 =?utf-8?B?M1ZvQktLc2JybGlKdm40ZDl6cU15dmpUQ2w2MzBZQktWUVhaaUVoYy9EeENS?=
 =?utf-8?B?MWp4VHV1SlMyM2tDT0dtSWFMcUxzNDAyUDMvRFdtdXB3TkNwZTREMS8yd1ls?=
 =?utf-8?B?enI4d2diaGhnTGFZY2hQazJwWFphVnZNWVJ6WGd1czV6QjhGNmpkR2JHbFdB?=
 =?utf-8?B?c2oxcVp4em15U21vOXg2aHFLcDh2bW0zK1ViVTJ3R25ENnpPMjltck5PeDNW?=
 =?utf-8?B?MHRQeFdDbEpBckpVb05Jek5sOUcxSGJoOWVPY2p1OGtVMzlQdG9wMkIzTjVq?=
 =?utf-8?B?TlJhd2o2ZU9tQzlwM24rWG1PeWtEUWRBNGNBSWpGcHJWYnFxbjJjTnZzRWJ4?=
 =?utf-8?B?bHJBQkNqaFhJeGl5dm54Q0ttdHhkdUdrWVErNEVjNUxVNFM3MWRoaWU0a2ly?=
 =?utf-8?B?MUxacHRadzhCNm1kMWdabGdxOXY3NUFHNWVrbjVKaWNPYUtJbDlBc0hSMmpv?=
 =?utf-8?B?Tk96c1JXS3JLNEZDZGpXMXFLR252c1VaZmdEQ0Y2aWl6bWEzQVlmbHlFUmht?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da382838-28d2-4a15-a289-08da9f68119f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 02:37:34.8842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DkVhf40pgBZIs1RAAJaRIicW2dQT7mp+Oxk1LaEQXiXX1HyDvb6F4ELbSIwJh+1z0U+TupUVCdGHwX9ug8+hYQXAM+gptsVhKr+GL4kw+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 David Gow <davidgow@google.com>, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, tales.aparecida@gmail.com,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Melissa
 Wen <mwen@igalia.com>, Isabella Basso <isabbasso@riseup.net>,
 Arthur Grillo <arthur.grillo@usp.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 25, 2022 at 07:27:18PM -0300, Maíra Canal wrote:
> The drm_test_dp_mst_calc_pbn_mode is based on a loop that executes tests
> for a couple of test cases. This could be better represented by
> parameterized tests, provided by KUnit.
> 
> So, convert the drm_test_dp_mst_calc_pbn_mode into parameterized tests.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  .../gpu/drm/tests/drm_dp_mst_helper_test.c    | 77 +++++++++++++------
>  1 file changed, 53 insertions(+), 24 deletions(-)
