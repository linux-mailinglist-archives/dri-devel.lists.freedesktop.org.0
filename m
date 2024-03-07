Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E548755A2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 18:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97031120F0;
	Thu,  7 Mar 2024 17:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLZP9f0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A72A1120AF;
 Thu,  7 Mar 2024 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709834203; x=1741370203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r33WxjdPHip5yGT/qAlNOCCL3mdIGHErSgHWThvQ8bk=;
 b=cLZP9f0pVuznbwpKIdNJamvoHB/LhmGojtAxJkkFrwAQYAcGo4rfmFGy
 fq9eytn8CMx5jbL6XreV+ecDcra5vPBiXuQKHHinkxLW01DuqEO0gnL0N
 LD3ejiUm8jvHEuOVRTAVtRJms0NfbCXfoG4aSJN+QdazYXrwYeKmgEVjb
 YbBNq9tnB/H0Le0Y2s/ao/Z/pXg+lYEzFKuBWoQGrHqwD1cdc15buYu6R
 W3TwNbn8zCuVQ3m201ge4GDoopXl05S4m213hxrqG8dmVLed2I4WUdtK8
 TUPtvpwEKu5eSW1e+3ycjRKyqJSFzaQ6JMK+3Ta0CqblOZ49bpPzXJVnT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4373771"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4373771"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 09:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="14846268"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 09:56:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 09:56:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 09:56:40 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 09:56:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnLm93Swfu3iYDRCtbsLaoKNRdeX8VLFcQr6K18naO8Dy0iiTMOyjkPVw3s1k3fLYk0kX2p6Nd3/yVWd2RWg6A5WV4BR6uV8VDvT6UWnKkJeGnsx6oWnsmvBUovz4UaAdOXsexZ/TkDjkKEZB3eJGq5X2zxlOXhU06QyIIBHjZYGuELndSnbMIa5sHmTyEAm8p9ppOY8tS8W/mbGzIIzgGj2twsVR9yCIrv24OiHHdr/D/9AC6xYWpdRHI0fINERvdapmFpZ8E9gHBJoIR2JaDHHP5IZZQaSNCLpKmZ1VNOyNUFSasybby8/aGQwwH9dZrTB2RtCjvb8ZnzCVEzrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r33WxjdPHip5yGT/qAlNOCCL3mdIGHErSgHWThvQ8bk=;
 b=ZpBU6ENGOv6ua9pFokDah6thbDfTlCXSRaLZvmLUVZzxK0LWbvkEvkgvi9C+EANENXfTmjl6u/KhhaIqXrCSg+M/nUP00no0rWolm7cKhwQM6uN+4pmFFvqJj8qQqzmcHXSOUhjbLwBFdJL2mk4Z9Jvjm5VyePJFwJjzV+iKLBiJFJblpvbzOGKSm+Ndq627zpzfQ64CsmgP5Qihp5VvEhXv8qGUq/GdM4kTKJbIvQzfeLuyb8e9TcwcUAs0QEZ3CN3UHZAdjlAOgduRldgzmxr9z010ukEdU/0PC8jHYqX9Q5C915ye1lT24CC9GSPBVykXXiA5JvPjtBwd/tbZmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5982.namprd11.prod.outlook.com (2603:10b6:510:1e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 17:56:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Thu, 7 Mar 2024
 17:56:37 +0000
Date: Thu, 7 Mar 2024 11:56:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 15/22] drm/i915: fix i915_gsc_proxy_mei_interface.h
 kernel-doc
Message-ID: <la4hjel2nspfzuwx5qpkebddmgc5mf7ynifsgzy3xzfv3hlpil@zq6rkusikb3l>
References: <cover.1709749576.git.jani.nikula@intel.com>
 <5093112670715dbc37b73dffc5ba26a911047e05.1709749576.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <5093112670715dbc37b73dffc5ba26a911047e05.1709749576.git.jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:332::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 725e9cf7-c500-4833-be47-08dc3ecfef77
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40J7qbgLcirGXRK8DgboE9L3Xh9dxvVOAwXXMOzV7WKn0wD7q1ThuevESh56RCSRbqFojW74acinaFdIKBVZyhwbxfw2BZpNRBhhJOQDvQphY8GKQ9qJ9Vbq9fui5Ecvb/Xh6V/esjSwY9Xbx6EblcJbSgUP8T9WD9mcU/8EKwoJjivT5VdmRDpns8ql9b9LEnLOageraVACA5XSr0cKEjFGIU+zKfz/dY5PVE6b9Nm3yS9F6j1JUD/VboYDOUGfHr6PxSM4+AMlr0mCJK7EhWyWDotdpw4DeBTPKRHhcKThxnv4rBSpTU6g+X/pyGIwBtWV4TpcxWTfUMIphQv5qES/qd8qfbUjKY8M3F0L5iHzeo4pVgcmtLWBIKvPgdCHN+CrrUJJkAUblxlJOooqdZpLO9r2s8fq2Bk4gHsMc2W0M1A1veeHNWbu4dr2J3ECXH3nUD9Z7X+9xTkBai4ehsJenS5SUlqC9F4m2dVos701gr6ZVRdwF6IYGTEXQWg7R+6dqPhY/oAVzHe3PJTP+3Y6sdT/u3iJ+rNqmN4UEDV6nhvpxmNDmkAYtgq4WcIAl1gZHSay3jRY4FHklntXMCRBfA3rppm4wGgRtSQixQJqt8mjNvVkBTzh8Vovm2JbobygGqMHz15ZYKs0c/ceuJ19zbkwr4diEW4KTJ5e4mA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vQLHJSFo4LsQJCpHvWzCGOLysblZG/I9NYUAbL7hy35kjmMeO6psOevFO7Wq?=
 =?us-ascii?Q?Eo8A8fgJ0xTfoQl0b/4uslUc3pJuC6nvXcwqNZdER8cXPGTXmc27Xvx9HaTU?=
 =?us-ascii?Q?BJt1wiQt1tiLcDTypMbAznTPP406MPACgyuHR4of5r6ouEoS3Ke+TxMJDT5O?=
 =?us-ascii?Q?pnOwoIR0OeG6BXj38vLbt2GWyKTcYDYlLtq+x+zIO8BXqs8T9NpoxvlCThwZ?=
 =?us-ascii?Q?gCpbAZorbFRK8LHC0x8eRvsCFWLB5l5O8jmp4Dfudybk0iZ/4GYHOz9+R0F9?=
 =?us-ascii?Q?os1QakdqyeHuQDreRm/WxQ+98vyjNy2HbMrGZ/6qb+TX4UwUOgeSdAFm2i1H?=
 =?us-ascii?Q?mbjGoSWFXufB+2UAvAGk3xkqHAwj9nojKH6Ivv3H2BysyEl0vivSlNBL3kjC?=
 =?us-ascii?Q?OtlupNl/iYaAvOwJ4Swku5Lzd23mWLDxtQYFlMESw0YWTlI/6lXOagYjgSPS?=
 =?us-ascii?Q?kIhIFCQEAQn3LhXkCG9BVvlWb1/HXVdl49N2GcKO/dXNtgvlQqWUd6yTFc/o?=
 =?us-ascii?Q?LvLebxIccEJfSDzNqgdNd9WouEOoCPKaiOzIzQ7HwsdqcKHGmOs+m6HNy87/?=
 =?us-ascii?Q?2igyn52ZkP3JTFIttd5OXYa09WieERrZHcsO4dD8aTtwNaVY05yKgbBeSett?=
 =?us-ascii?Q?JBAaaiH0TKtv8IW7x1jaxpvagWp/cf9dG2DhRh3wdsXYRWS3yDW7cr6eyipv?=
 =?us-ascii?Q?2yIoT7dzZqooBw4TxsXPMI+h6MtLs3sxrI5oH+ks6xSNabeuxUVL1xA1zuyg?=
 =?us-ascii?Q?ZgLXlqqB73FrzsoQyIhHSOWp0BcXu3OWKpptXs+Barl5KayA8+FtYT+/0Yd4?=
 =?us-ascii?Q?wbiBhzjN31tPF+UhY9cQ9zCJU8x2uffW7rgI5FlOJi6pd0Z4PHwlD5gED2Hh?=
 =?us-ascii?Q?296Rf3mZR4QI7lErJ/Jaz7RrSlVwMpJWDaJPHumP0LNIbCvb8TimOa2fx1Rd?=
 =?us-ascii?Q?x0iejSLHINrnAdYB93vqY+NYh38HgLwqv8X6Mg1snmh+uE75lbGiTeIDDjkx?=
 =?us-ascii?Q?7KfBUrGSyBXAA+dwA5nhCm6nkPiVPx772CQo6q2WdGbEwlijuXkHN0yugyhp?=
 =?us-ascii?Q?WOmcSvZgHsZPQEtQ8vH7R3pZl6AOh2UUUXBRaQ/ZdsC9YcOVwQmOMboZOH3Z?=
 =?us-ascii?Q?ByF27XkGin/ASRwVwBLxFwo5ALNQSacuKrPoaJrnp463pqgenZftroZHNLWL?=
 =?us-ascii?Q?MINT7UHouo+a1jTdpLeYgzlDkZfULE0oCmPsGo0kc+7kAlC4uT4BPwq+d+mg?=
 =?us-ascii?Q?dhn9ZVc98KPBsTDZROhiE1L1Q/BN6gtZmfNwdXWv1kMlr1j8Rlaa8LvtUzIB?=
 =?us-ascii?Q?I6CKCB3UEWFnOjR3BWzepmpjlt4W4mSlakfiFPSYjevLlhWIbOBgYepSthpv?=
 =?us-ascii?Q?hRtCqvAc1gqJoQQV6C+KSUNV+m+c43zupQfiO9mnlA3EhRBBz141klarpaBU?=
 =?us-ascii?Q?Yczu07FUvW4e2L/VhIijUQT68YI6+QCOSjSzRIbS1jBOANVHOGUjnAJVsmaY?=
 =?us-ascii?Q?5eg5NMeck1WYQRbJfP7H/QB/fuYdHBjk8yo3re5IVxr1zQVrfROQboxIUMia?=
 =?us-ascii?Q?J0oVoY+90JKiTb18tYVFcl+XR/fNyHEr7rW5nC5EvQOBGIl8isFbPG820P9a?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 725e9cf7-c500-4833-be47-08dc3ecfef77
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 17:56:37.7757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+X5wEEmlJdCDtz/TkQ2LLtRuRGZe5v2ugjPOskNzbZoDyzKDPZkSYkEAKj6YaJPUqAdZPY+qLLGYIvwHHzTqbtLt/jb4RhdYV0ReoyVG8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5982
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

On Wed, Mar 06, 2024 at 08:31:20PM +0200, Jani Nikula wrote:
>There's no proper way to document function pointer members, but at least
>silence the warnings.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
