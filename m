Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC085CFA4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 06:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F357D10E5FA;
	Wed, 21 Feb 2024 05:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dq6CsAdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C696310E5FA;
 Wed, 21 Feb 2024 05:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708493403; x=1740029403;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I+H4pbKRHHRs+CZMOnvKU0zVSWx+QSEfgQNVM7O0ZDg=;
 b=dq6CsAdfAawoyeHYXoadszFVdQGO4LkdtlsjA5HlIQQ3uMNh7j9fSzOf
 LHp2HkrMrJvXE79qyvNAHHN8pF1OdfWRw1ApqoxoGQo80bEs6Wc6Zi2sC
 /U3VPlRvWMzChFBziTd+AqKJg1H1bfAaQN5b6wcbOKy7QXodk5RWxZ7la
 5WjySIQEp8BMeCaQf9gD+b8EnzNySYv/+wIHC/25wwJqkrJgdIsZ9Nhtd
 XXyQF72RF9NQG6Dr+VBsf0teLVRvXXtrTAhhfsNLINEFPq+OiScOcQTfZ
 6IP5Xl+HzSeHJxGhxGEh8gCMRGJxqEoEYXO4cCiJR46EB6lmAQKvOsR+w g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2748002"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2748002"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 21:30:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5382776"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 21:30:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 21:30:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 21:30:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 21:30:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sgl2AwVke+yY4Oaax7COCzU4K8v2zbx4JWoYAr328KHujO8k6k4TSTY3NW1pgXLrnu79VGYUGLgv0bKQ5O1Sy77/4aJLIhS0LUnE9gqlxMTAuUNQX5SsBnXL6h+ZGhVZFVXWyy3DfHw1+cNAN4hsYT8AxJQ5HLMRmkIeGzNQUQN3xjjjLQPqx8dvKLBxZKvv/EnnXS4YRGYiIoH/XeyZ3SUqrO+bbdU4BDiW0aAvnO6TIyGH6SzmJslfDMe2oamo9blWrGxOl9+Bqj0Fumbq3DmfZUzaz01oTaH2nDSjS1qB6wExbwFI4YZ2cnsDRzPdDVJ/pPDyCFEJFy0h2BfcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aC5iu6/WQk+A/iM/mDv5D9xD77ayHdW7BMEQ2bMxI4Q=;
 b=alTRW9B79qCR9yr+iwpYngkUE1Uy36qSgj98YGb+yRSjtbPjFlMGSe2pzU9UiVvpbiMPdKnIwlpDP4C78xnEPNxPv7dWMVN7MLyk0xe0NXJcG+I/PRS+SOQ5O7jdm2b+omF/N1rFqZLC8NcDE17G0NnGbBM8GcNSa2F8VN1rUcDjDHlnkdCcg7fjw3V0mnaY/MjTuVFQKEcXlc4bKVgpp1nNyWtVwv1nIS1aixZ/FMuwj+6EOmfGFx4iOfJtN/3zEWCyNwpNXXTkY936FKpUuV8UGEkPeT3lmMBb3xU8uD1QIvVXOqBeDwW/V7I2dG2YySybdOMfu3vFqx6cDZDv+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7318.namprd11.prod.outlook.com (2603:10b6:208:426::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Wed, 21 Feb
 2024 05:29:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 05:29:58 +0000
Date: Tue, 20 Feb 2024 23:29:54 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Arnd Bergmann
 <arnd@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@rothwell.id.au>
Subject: Re: Re: [PATCH] drm/xe: skip building debugfs code for
 CONFIG_DEBUG_FS=n
Message-ID: <ngu6vq5izal6suyr57p4vlxnrn4kxyii4ewdktxvw7k3uezlcz@6oevav3wpcjh>
References: <20240213134817.3347574-1-arnd@kernel.org>
 <877cj88lck.fsf@intel.com>
 <17209419-093b-4674-8b43-06c92312ef61@app.fastmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <17209419-093b-4674-8b43-06c92312ef61@app.fastmail.com>
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: de1e3478-cc4c-4107-8a7a-08dc329e24df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3RP8zVNYnmT+MnN6r1vLovY9fs1TKDX1UX6A27LWNWih9E/1gAEHln9ds+cetRN1nGOx2qBgZfa9lKnWz/R60Hyhs+idnMGAHnkoXqr7cVuFnvQLBoRRPhpRQEdZvSXc25557xwZZuuVMlTm0tGDzU1ZNKaQNl4ierC+6Yvsr+A6lhEq+cx3eW+1ZPSlnt4Bj3itFyi1vrs/ayaZULds7AHQjkBpqKaS5G3F2YHquf4cho1UEOhfJmnZiXm4b7zN0RuuC+zMDU3Xn0M6vo6M9SejvRJVbbG8oP40hRc6iW8lD4o6fL0iENQafnXDH57ZZNsrDdiEb3UO4OlERoJ7pmAuiN94d4aSTSDz2kES3SyjihS7EvUKn6pDEGgcAdEZoYpfkjIeLBeUx1Z0d/kLrBMUwWozb8HWsJaE9fL3JFafDVu6kMSBvFGv5t09L5+ZvxUXv6i8GqZeuJCtOcmnarX38yPGW9RPgW2E3h1OsbIqqzCcLVNRNhI2ApDaZ++TlRrAArplJwaNwQOrTPzsgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dYM+ilssFElxHFJz/EUjheRCnhvIBdtpOQJFlutj/DAK9D9BRLpIV4IXBO4g?=
 =?us-ascii?Q?dRkSOVfzFdSgoniYANhBCywVsgtmaQORPFuYfTZP/bZ6Q9dgsZl97kT3KEPo?=
 =?us-ascii?Q?XRgAbOjsnZmFH+NV/066waTF/CvT23Hnu80S4+I995BImOnVb5ZanFnsPYlO?=
 =?us-ascii?Q?oYNbOjPxu3TBLAvrKXBM8JEl2+XCNpeMp1HvwQTYkQ7d16fIIxmi6HknJutN?=
 =?us-ascii?Q?iemS5lp0WFnmv/0esxdWsgCImrO+9FgSU5G9d6NtjEivgH8zOeEArtvsiP/S?=
 =?us-ascii?Q?jo8hO3dj7wLit8g6jAKYoh7CNEyIbP7cT5+7aSqoiPutNgnxG+nqqtxocREN?=
 =?us-ascii?Q?bUkqiHVefFMkAQPiR2NZBOP2qzgITxEXji437X+hrhCCoPoQ2wyPBbhsFMgy?=
 =?us-ascii?Q?zAqdI5jc/VsfdRVdBUsJyPHCbwAZ5RPUixnoHu19xiLJFsqQ6wn46DKmNIny?=
 =?us-ascii?Q?3HaG0tMF4T3A/PZRP2Z6Tc3YOEaTMUGZCMWyh6MDo1vIxjjozk2rrylbptks?=
 =?us-ascii?Q?cJTiSS0JcsEN24BHfw6z11VGigz8ud3N0eRqgjX/1WjTITfqVWPCnOTwePWu?=
 =?us-ascii?Q?0yduZzlL5dTOhyBinXp1G6hXVyBvTPREf9a8e9cPlQ3STZnu3bGHP0XwRgFE?=
 =?us-ascii?Q?qT4ENGVvCZ8fLaZU9q1G0nDjB4LTziloMKaSEdA+2N3iLevR25oGVC7lA77e?=
 =?us-ascii?Q?skqg4d1oSRATCqTerHUO35u6IAKb1zX86Rib5j3Xusm1wShgZh11UOX7Dkbp?=
 =?us-ascii?Q?CvCErZLzLnQyIsoFRUT1gzmmTrQ0NW0P0u81KNvwRSHNZXy+ZTbtQcnnAx/N?=
 =?us-ascii?Q?27f5xK28FQ9ERd+Gt7/n07VK9O0GqfHsZe0/lV+9xBSsquMSi3OZFr/Hmz+i?=
 =?us-ascii?Q?8YXXoK2YqNcG5PGn4uj+q825vEr2U8nrH1pjV9agM0HURRHrQUmh7nE/Djij?=
 =?us-ascii?Q?Y1yQ3xoqfWrDBosVzvnV8rL4puxAkANy+G8ko5l3kCFLPXNuqBe4OiVAb2M/?=
 =?us-ascii?Q?SsDjFKW2iP0KpX1fHTpmvxG1JcQNjh105tzZiu1S4y56FXL6/qH/c4S/Sz12?=
 =?us-ascii?Q?q99616CB5YxzcyDVtC4uH+AkdcID4rTZNs+a2+9qWVe72fsIz4jrXj8e9Nxz?=
 =?us-ascii?Q?7uAhmMlAOZx0X6XpjsM0gPHWKwZMQgqF0zAyV0wg54sGWrX4J/aLQ+VE/3GL?=
 =?us-ascii?Q?WGdZCDP2dljzLZ+Cu5TDTeJTn/+IxjQ3zqBmFGQNXCMVkb1vI3NXdcpePtOY?=
 =?us-ascii?Q?fUB01bAOc5XNo4SXZXsaVujzwX+wAFSGElYc4oxWoCmDxIf8rtok/DoQRKSH?=
 =?us-ascii?Q?hVG/YIAJ17VI96rr0JsrsvhXGuONFi49VCkPt0WqDZo7cZ5G7ucTwfw/EdXe?=
 =?us-ascii?Q?O99gv3/VsEGWm/DsSSioq/6Mu6acge2dpMB0vNo8Vhh4mO/qYvKAf0Z7vPo0?=
 =?us-ascii?Q?LlEK9vULuDlR+xi6hDq06vdAlG2wP6GC5uA/CtY6BSg0Tz1GGh3Zk0BQ5q9R?=
 =?us-ascii?Q?nPNsfnFNyWGrNTSpnGXHr3W1cMc5xyaL5VTHg5SKq61ma1JBi9XQ3wTz6Ets?=
 =?us-ascii?Q?5APGH2JjedtfYYBKMTEVYk6UqT1t0HrKjNyGjh8KJr9PtYa4bCYcWwFh5M52?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de1e3478-cc4c-4107-8a7a-08dc329e24df
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 05:29:58.6202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06DlL/u3Gr9QI136sy5+C+D3XxMn6yO+irj4YhgdoL+7FIcoSVgfERlzuf10AdJkivixjySzLYpAfQMiJeY8Fps4RlJab1X08Rc6ZXTrmYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7318
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

+Stephen

On Tue, Feb 13, 2024 at 03:58:54PM +0100, Arnd Bergmann wrote:
>On Tue, Feb 13, 2024, at 15:55, Jani Nikula wrote:
>> On Tue, 13 Feb 2024, Arnd Bergmann <arnd@kernel.org> wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> Some of the debugfs functions are stubbed out in these configurations,
>>> so trying to build the .c file with the definition fails:
>>>
>>> In file included from include/uapi/linux/posix_types.h:5,
>>>                  from drivers/gpu/drm/i915/display/intel_pipe_crc.c:27:
>>> drivers/gpu/drm/i915/display/intel_pipe_crc.c: At top level:
>>> include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
>>>     8 | #define NULL ((void *)0)
>>>       |                ^~~~
>>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:549:20: note: in expansion of macro 'intel_crtc_get_crc_sources'
>>>   549 | const char *const *intel_crtc_get_crc_sources(struct drm_crtc *crtc,
>>>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Stop trying to build them by making the Makefile entries conditional,
>>> same as for the i915 driver.
>>
>> Already fixed by commit 439987f6f471 ("drm/xe: don't build debugfs files
>> when CONFIG_DEBUG_FS=n") in drm-xe-next.
>>
>> Maybe that needs to be picked up for -fixes?
>
>I made sure that this still happens in linux-next today, but
>it does not seem to contain 439987f6f471.

Looking at https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
it seems we still don't have drm-xe-next branch in linux-next.

Stephen, could you please add it? Or do I have to do something on my end
before that?  This is the branch:

https://gitlab.freedesktop.org/drm/xe/kernel drm-xe-next

thanks
Lucas De Marchi



>
>     Arnd
