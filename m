Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9946FCBE6
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 18:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E214510E3A5;
	Tue,  9 May 2023 16:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD3E10E3A5;
 Tue,  9 May 2023 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683651431; x=1715187431;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ul8IPCwkb4oIHx1B6WDzggsWBwPboJNa9ftks4uuZ1g=;
 b=B9u/L47zH6tzYMO7oxWgFb5a/5CdygXmwxmPMuBYeMEEW9wCOWo0AM0Q
 LjwxmrMzY4LilQ8TKEN9oTBtLw1rQAIpRxkcl/RgANCr26qgTIK1D4l07
 gHdAHVJq18DKUuOu2VDensBIMEeMXSn65s6EXekivh3AmHMIQVZMGV2eS
 rTx4gUv1vqcrYvvCBOvfALK7yU9Pm79rG/O4SqObihu7KxJD2gHcx+0DS
 uGm4lu+rFujAOA+RyUqRskOHzqP0DW4aYzUZDFQmyzPZ8y8ZRwWLmtOZY
 OWa/WkBv+JNHDPqoAV0HSv/S0vLSg8S46GWBNGFEDFWdCjK65MVe76vMx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="347452621"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="347452621"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 09:56:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="810787801"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="810787801"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 09 May 2023 09:56:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 09:56:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 09:56:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 09:56:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 09:56:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVbpBeYQ/Xb+m+V0kYeDiyllV6NRwvoYgOeY503p0s2hogZZF4aaPbV/EcTeff/ESVDGy07NtU60f9fZTApB+890h5NwcWL/AV8X/ooJIRUymGACnl4To3/ll+B/2uDBrS5820UFhHM6T3D79009B8jHfbl3smtH7zCFDivlElF1oszqyVPsZJ64cuGuG6jdbS4wrn5bvZyEY/ndKsdITfVKOQv6zcCXBg49CFDrRpU8Y/OI4ekTyZ8tuecLiIsfmVFRt2iKfpJO7xJtPSgucattLAIR72TtGNtdCvSPz2r7UDpoJlUdTWnz2Wu2hemfMppxQSUkdIscgm9X4HHCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPzf19JLageo9SOVdwQM/pgHcBt7gDe4Tibpsrb/BaY=;
 b=cTLnLDA4TFJmMUVWj83UoWgcEaCDdZSE1/tbJBgvSq2SYsvlTe7T2TdaTtv4KKrscjehERtm3NOuV1w2Z+7AEn8fSgfSFkSxxjm7ggSTFLj8qnyYffrkbN7TqTk6VgHoN5NX6kNNjQkVZm00AEErK4sApb3WIiEJCYwo7dXZawjcpwQffDuYGSna9/qx7YsdH6qKJeneUME/rNNc8dW8TSGzRqpfCGscyacpmWwBxEoyjLcn8tnnektryKQVpMPJ5t2uVfLgvzZNninXqOo7TRn+mWD0hK7Q3Pc6YhY1v3UGyPH2aDfnqUjcObSoWr+awGrAqIHLj8aJgFJ7FrnKvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Tue, 9 May
 2023 16:56:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 16:56:36 +0000
Date: Tue, 9 May 2023 09:56:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Make xe build dependent on STAGING.
Message-ID: <ro2hcqlyzx4sfd7atm7r2kmqk74gymkpyo2kgt7heabvkolpre@xcfkmdn77ot4>
X-Patchwork-Hint: comment
References: <20230509151008.1434683-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230509151008.1434683-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f0ab5f-4386-4ab8-8546-08db50ae59c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AaNQwBbQQFFNhTuVEOlWb0NnAHtSQ+hk5ZRHwOsx3v3o0znaKRUF+O5OrRs0jXRMI0GJq6ap6BkDpy/Lp2RHiEXeCaYOaSm3D8/T0sA6A0BHVs77s+qoddLK2skdO4QHqP+3atYKV5jtoa/8C2/vMmb+MIpWsgseUIvHmx03KOdVPAndET4/2mAQLIgXGeq73uzLhu96KrJsqbYVVwM41uJfmOIx/fi0OVk8m7/tMV9EWKCJtlm4mr9HwhgCClAnZH7xzw1rIlsCkplClVVky8GQqoQ7CwqbNlw4zVz7u/rBUhYhjFroelCchHPdLMi4FvaPZzEnGaf7/rxksSLA5Vn/a3aIoAj9GRZdsttjKUPjbBC/sPrn77WQp+y3iaJqqVO8AfrgXtgA/b75K9b86WP8jP+eKg50XWm0yorkqTeUOd2gpeMyM0W/LJGM3jv7sCLyfN2ALFPQDXcUXivjbJ1FWHVrFAMbXZvKooP18Oixb/RMqi67SDaC7fMQ0cnXylEhSk+fikhyy+8Pza/UPReFKi79dP4h52cQnvnXg2shlaUC0iGPDpf5FoLHAZls
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199021)(186003)(66946007)(66476007)(66556008)(6636002)(6666004)(4326008)(316002)(33716001)(38100700002)(41300700001)(5660300002)(86362001)(82960400001)(8936002)(6862004)(8676002)(478600001)(26005)(6506007)(6512007)(9686003)(6486002)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUUwdjQ0VWxSbVgvRXZkUGRRQSt3SHNkdFQ3cC93MEdXYUdoN3UxRWVqK1Bm?=
 =?utf-8?B?a0dkaXdxcWV2SCsreUZpOEtibjVRelZ6VGNLMUZERllCb21xZTN5anRpUHdX?=
 =?utf-8?B?b3YzUkh4MG1vQy9reVlQalhNRzJpRTBsZHBrZEc4MlZCTjB6bDE3R3ZNMWxQ?=
 =?utf-8?B?ZlZEamZYNjk0YXNhams3RWQ0b1J0d3RUaC93NGpmS2lZWDRKbEl4dCtkMGJt?=
 =?utf-8?B?ZGVJcG13bzI2TFdFd0tiWXNndzFDcmNkOStkbXZCTmlNdTBGZkhDYW5xQnll?=
 =?utf-8?B?ZHNtNGtJT0IvaGVuSTNCN3UzS2ljQ1c0UjNOUHZ4OWFrT0Q5QzZaV1pYVzln?=
 =?utf-8?B?ZWR5allGUTZnS3Vlb2lyYks3L3JpNU1ha2dZR1UrekFjWVh5MkRwUU9hRllO?=
 =?utf-8?B?V2d5YmxUSTFSWUtKaTM4L1IxalduUkJkZktYeXFCeERveXIydlVWeG9rZnRG?=
 =?utf-8?B?SHJBZElVYUdHZFBuQmUrVEJMQ1daUWJ2WGRvS0JlTk5OaE84VU9UTC8yVitT?=
 =?utf-8?B?UHZaSkJ5U3VscnE1NDI4b3lWNGRPWHBId2JTNkVqTGtISFVwd2dzR09VWEpI?=
 =?utf-8?B?SVVyaDRKRGFxZDVhb1dmenB0UkhkMGFuRHRtSG10WlJrQkRlTmV6SWNnU2dY?=
 =?utf-8?B?NngyVVdIdzhRbFNEbFRia1crdTgwR1JjNUExR2l6U2c0WUVQeHQ0ekR4NDJm?=
 =?utf-8?B?Q3hTdnNIbG01UCthRFE4bG1BckN4VVU1S3F5ZXowNURONkJra1FiUDNYbjFn?=
 =?utf-8?B?blFNRitmK2UwWWpFdE9XaG8xS0tZR1BEeXg5Yi9wdDhMTTJxbzZvSG8rYUNJ?=
 =?utf-8?B?SGxvZ2lyR2tHWXQvaS9VYW1nQzB4Y1ZpQlcxbXErTnpISk5RMnE2UThrVkNU?=
 =?utf-8?B?TkpYbG5reUNDRGxjSExHWFcyV1UyeTNuMU96WkEyMllreFd1M21sLzVMa2Fj?=
 =?utf-8?B?ZllnOFZVdEQvSlprbzJKYloyNTB1dHYwWlVTT3kzcnBrOFBGRGVXL1gwOXNn?=
 =?utf-8?B?YkNGUTlYaWptMEIrZlZ4VG5HNVhaQVd6MzlOWmFybGliQ0V6WllWVFFmYWFY?=
 =?utf-8?B?dzdPSWhLbzhQaUJFUHd0ZTF4RFNKenFNRDhVWms4c3Y2b01zZFlDdndtdjIy?=
 =?utf-8?B?WmRQeGFILzk0Mk1jd055RTRmd3VyNXhvM1pCRmNRWUwxOHE1VWNLclVJRkZB?=
 =?utf-8?B?T2p0Qkp4TnRUcjNsT1VUeUNMbzRVaUxVbE9sSzJ4TFNwV0o4YWlybytGcVlz?=
 =?utf-8?B?aER4aWh6Z1FaalBwRTdFdFB4OVNHdHNUZytCS1YyN0N4THhwMjNpNzJzRkJy?=
 =?utf-8?B?QUIvUEVISWpHYklORlpucXFRejloQ01GQlI0T213ejN5NXdHUXh0TUMrc3VL?=
 =?utf-8?B?c3BnUDkrM3NtNmtDMGxlU0xaVlFVd040SC8wMUZZTmt2Q3cxMFRGWEsvMjAw?=
 =?utf-8?B?ckczT205ZmxWa1dxN2U4cEJSYUZROWR1aEgzcVlqMGxZYXRHaW5EM2Fid3FD?=
 =?utf-8?B?RERCbmViS0crN0VxcW9Ld0c2dUp0RllhZ0NMcWZsaGZocUJUWHFSdHJGcmdS?=
 =?utf-8?B?TWRGakJYUlNqWUlsSjFjUFl3dGhsMmJSTi9FUVpJVXNPQTZieGhoR1oyanBm?=
 =?utf-8?B?RlFlOW03YkVQRW81Z0tTUGcwOFU2dU1rNzNTN3ZuRmxIZDErejFiM0ZZaVBB?=
 =?utf-8?B?Vldpa1JHQ2Y3aHdnN2VIWHBuSHNFYVZabnJwOTNEeEtzMzdsSnJxZUZRNUJo?=
 =?utf-8?B?SjNFR3FsWTdXWkRpa2tjMEdZNGZRNmgzY291MEltWjB5Yko4YWllTEVNbWxq?=
 =?utf-8?B?NW5xTlhLV3czbzlBckdqRlp6NGJRRVVSeXd4bWtWOUY0d0h3TlpsSGh5Uy9X?=
 =?utf-8?B?Mk9JZ2d6REZvUnlETUwwa1hXZnVrU3RaaVBKRnp3K1Q2bGp0UzkwTWRLcWxm?=
 =?utf-8?B?VVV5b09SdnBQcEc2SFZrWURJNVNIMzF5R3V2SWNGNk50dmJOdnJRY2xnOFlr?=
 =?utf-8?B?U0NSUmNuTkFyS1p4cjlYR0NmZ3lwQUtyaE1xUTliM21GVmJnWW1UMjFaR3FJ?=
 =?utf-8?B?MHFaUU1CQVZqbVRGM1VYSlR6WWFVU3E1a3JTZXdDbmEwa1VNU0JvdStNVExG?=
 =?utf-8?B?WGVTNUVpTTlVNWloMzY3cU9HVFZWQlZVbnFrTXNoaXlMTEVGVjlwZXVzVHVW?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f0ab5f-4386-4ab8-8546-08db50ae59c5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 16:56:36.6162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcz2UpeFdg7OVWwmIiUVb+tIyeu6hVKUjZHeTW55HlCqpLj5DuFEoFhqEvkZUnDmxNYCjrvNnRZv7U8h5G79P7fVZv184FwY/MfmTsvEkAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
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
Cc: Maciej Ramotowski <maciej.ramotowski@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 11:10:08AM -0400, Rodrigo Vivi wrote:
>As documented in drivers/staging/Kconfig:
>
>STAGING means "that these drivers are under heavy development" and
>"may contain userspace interfaces that most likely will be changed
>in the near future."
>
>As explained in Documentation/gpu/rfc/xe.rst:
>
>"
>Xe driver will be protected with both STAGING Kconfig and force_probe.
>Changes in the uAPI are expected while the driver is behind these
>protections. STAGING will be removed when the driver uAPI gets to a
>mature state where we can guarantee the ‘no regression’ rule.
>Then force_probe will be lifted only for future platforms that will be
>productized with Xe driver, but not with i915.
>"
>
>Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>
>Cc: Maciej Ramotowski <maciej.ramotowski@intel.com>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I agree with the idea, but I was expecting a few more hits:

	$ git grep "\bSTAGING\b" -- '*Kconfig'
	drivers/gpu/drm/nouveau/Kconfig:        depends on STAGING
	drivers/gpu/drm/tegra/Kconfig:  depends on STAGING
	drivers/staging/Kconfig:menuconfig STAGING
	drivers/staging/Kconfig:if STAGING
	drivers/staging/Kconfig:endif # STAGING
	drivers/staging/vme_user/Kconfig:       depends on STAGING && PCI
	drivers/staging/vme_user/Kconfig:       depends on STAGING && VME_BUS

Are we doing something wrong here? Documentation/process/2.Process.rst
talks about drivers under staging/ directory rather than drivers
depending on CONFIG_STAGING.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org

Lucas De Marchi

>---
> drivers/gpu/drm/xe/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index f6f3b491d162..1a410edd38e4 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -2,6 +2,7 @@
> config DRM_XE
> 	tristate "Intel Xe Graphics"
> 	depends on DRM && PCI && MMU
>+	depends on STAGING
> 	select INTERVAL_TREE
> 	# we need shmfs for the swappable backing store, and in particular
> 	# the shmem_readpage() which depends upon tmpfs
>-- 
>2.39.2
>
