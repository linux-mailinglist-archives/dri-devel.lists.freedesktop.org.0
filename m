Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE836D6CC5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 21:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62F010E207;
	Tue,  4 Apr 2023 19:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D7E10E054;
 Tue,  4 Apr 2023 19:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680634813; x=1712170813;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wBjdYZ3Ym+Ew7qEuKYoUpHUYMfooO7vfv5Uvze3V6O4=;
 b=KaQCFRiUb7nEmDhUCDwCh88OCQjSezwIwiTbHmFM67lfk9j91qhhYLZe
 1W9LRQJzfr67KZs8/UO+pL7D59Ek7Djy9hZDJDM02xTRn57YWqYXUmLVf
 kbZE8ZmHgli6udAubK3opXQTwbznOMpOfBxYjDFaNq2ujR6626m/XAtPs
 OCJv1uKNv8w6/RAz+anqNnBpAFSIy3dey41GzAwf5EerEJ8NgCMtobwh2
 VgmyQsCrHajx3NvRcYWdWrhiBqjU670XseiX7fYUxMrtR4e8/PxZ1MRAq
 x/BGESO1/gOY5rjamd0stmCiHP8UsuPNkC5Ol5NkCn2FPbS45mHDx1QHa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="344850448"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="344850448"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 12:00:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="1016216438"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="1016216438"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 04 Apr 2023 12:00:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 12:00:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 12:00:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 12:00:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 12:00:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdlQazDkk2u70Ro3F5CpcdewWBKuaJbhzuf6qN/Db4NAfkEn58YufZ8zNS6IeTTeCRb0oNgSTXOFsMHran9C2ATe3UE9D5+JGTJopjUlC1HThX57ziUdf9SVMPEnwWk5vK19FJ41LhJXNERZelMYjmfNweV6kvVEPmcWva/dE4wXnTlp00ab3zmFzj27z2Qj8P9H2J+4l0oELigkSiZD2xl0FPsASRej3BNI9Uv1TCujDGoiFQkU0T5eRMldAKSPE0mM3HgY4fNH124dN3aZFB8x9jeWKufSMb2K+2kkXXsklgrLByXBdlif/5WsN/sBa+NLWeNYwyHfJredjNMS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqD/Nx9h5mY19mbkJY1Zese1oQdKbn5YkVVTikFQZr4=;
 b=msC4TCE0rCkXlccemty2ztjhe2VfNaFz2T0H64W0z8Q9i6+UipRo3/7RNtcArvLjDgjePrHH3dEJ0Laf2RkYfFVpdF8uY3uQ8qYod2ppZaugZ9THl7mzt0TRLDUBBpeZCPWUqaz6eSCWtnu89AOZ6famTOv2RoEVZ/OvPd9xnkBSHy257o1OgI1dKiMyo5jWyxuw/gXabo71ViCD/D/dG6y1QclnqcMy3LyqjJDIe9D7tSwAh/T2KaK6uzL20EcIAVpwq6bdIJD0W5aWs5jq7oHUOCAQz8ffGQM9r1Q7o1hTVfSdpYKMgdoO1LOpSST4V5BXdhelibDhj4ZrF1JL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6442.namprd11.prod.outlook.com (2603:10b6:208:3a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 4 Apr
 2023 18:59:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 18:59:59 +0000
Date: Tue, 4 Apr 2023 11:59:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Update GuC/HuC firmware
 autoselect logic
Message-ID: <20230404185955.hwhdp2qympixzvza@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
 <20230324051754.1346390-4-lucas.demarchi@intel.com>
 <SJ2PR11MB771527702FC1B562638E67D1F8889@SJ2PR11MB7715.namprd11.prod.outlook.com>
 <20230330034621.zdlunvob4mc7nzxt@ldmartin-desk2>
 <SJ2PR11MB7715344964E17CACB72E6AE6F8929@SJ2PR11MB7715.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB7715344964E17CACB72E6AE6F8929@SJ2PR11MB7715.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: f671941a-5de4-4345-dc9e-08db353ec9e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dcxYKzEV0N4ry42UVTCyWjnYlWjP2kdQfWHaZ84palY6xdehJM5/kuBEMJfdZpPD3MfqWWEnr9LO6o2lzuz25plPjgpQoxl7gPaxzm4gUvWQ7bifBgJOESkYw+j/RYTXQQn8R2EiY+4ml7dg7WsJu5PW9bkQLQLvtigszIBtUmlYETCCElrkK7EcYCvNlVhOz31tohE2cZxxOIDh0Vopphtmx2QNIzhldat7+gRkHoq6pIzjvAIf1evVH7Qax3sF+XihswnZP9S9xdh07icvMqjnMoR8u0jAaHNUdJmIdIiFxNBz4QXs8w34XVsEmiUlPPGYqJRwvfhWtjZ06UrOjJtoKFvSd9Vf4JQLcxBRGn715To1dFOUoxQTZ383/EobyhP0ucsJm7dd2rtVlpwBs5TM5WWHjPN/o1fe2UGvHQST+pCxqmfclntt0vNYD6wHSfN5tqtKJSVhVpmxewL/yF5cZc/+Pq9lfEMWT7jinor9ZvhvW3mP+R0JYj1oVppbBNRsqX4NJvzxdxtlsMMH5Gm7xLCXTkfYKeE6oFZ5hUJc2/A64Ofi+6eITLzYRyam
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(5660300002)(6862004)(38100700002)(8936002)(4326008)(66946007)(8676002)(66476007)(66556008)(41300700001)(82960400001)(86362001)(30864003)(15650500001)(2906002)(26005)(6486002)(36756003)(53546011)(1076003)(9686003)(6506007)(6512007)(6666004)(186003)(83380400001)(316002)(478600001)(54906003)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VxyfHtH+VQ/9dUqtNedFZRGVx6ssqq8qW2DmFDdLRl6rcGQSWWwqVV6Mv8Zq?=
 =?us-ascii?Q?U3H53SsgmnmV65FI9SlVsI3D8FBZhTSr03VPCWBuChUoa8igHOaatYLunkPo?=
 =?us-ascii?Q?kVUi/ypJhrDDVKMSn3zksGAmmLmM5otUa1Q8vJbe8wqRKH5faak7DBNLOYS/?=
 =?us-ascii?Q?SkZLHdAvX9oD2pm3TKUtqgzsL+8DI3OhAEhQXLGMQhLgqXeeRfngH3qVI3AV?=
 =?us-ascii?Q?+UzsB26fRaGRVsT/+TSifTp9oeWQkX6J58zv2FxA1BFvQYWLMkxEhr8MAw8E?=
 =?us-ascii?Q?3v6eksr0k6QMFkSdf+FvTkCAhh9XsUEsMr6b+GVHyfs1jxFjaEL6dCQQ8FCv?=
 =?us-ascii?Q?X673MJ9lHGb7X3GPbiWdTTdW6LvCRyma7QCEsQ6iOB52ZJqP7FaYjYZDN7HA?=
 =?us-ascii?Q?LbYXWmYDG7403RyFX0xQTIZC7rTK0R906EmVwLBcQQcN4duWrrGyTwW8m4Nf?=
 =?us-ascii?Q?Mv6YEp6Iwd7X8qXZyS2gLFTv5HQb6omCkl/ch3ESY7Ld/FlVBzPbgpp0mPGI?=
 =?us-ascii?Q?kM253NQ2x+zZ2hig8jqsR8/FVYEXW5RxGJ7Fwh2XiJTSNZDDsqFjbux+kRu9?=
 =?us-ascii?Q?XJpfyyFIQPPgqNOHHQyUG4AWZcuBD/jNBhl2tGQl9Qz0y0UiA8BC8VS3V0n8?=
 =?us-ascii?Q?Xg2zJqcnuHbmkAHU6eaM8oHnZxPxPJ27gsLdN+7tpyazMr6RH6MLdcL0XQV3?=
 =?us-ascii?Q?p12gWIGXF4KXV50Uzwzk+Mf00eeqdQENFBUN/wFqCnLoVh7QMpbJW7Xn4Te0?=
 =?us-ascii?Q?RKzkT0jIEkwL1V/V34ShpfqNvqLH9jj4iOO074c9ct5vuU2UI9fDLD+YmXyG?=
 =?us-ascii?Q?inycXHkU2D8izPX5EIs7HE037+gQLcG2IwtHqxtl755rIoHQQRhX9WjlfMEN?=
 =?us-ascii?Q?xPVTmiKGPuiTRzoqN2GS61BxgrL8RmmM0+2XogOT1/GdvKApj6Sv4ZhSw/Xg?=
 =?us-ascii?Q?XDZI3qr5eg0H9cykh7PaukwnOTFEX43aaosZxmKSxOweCzsNTnwURLXo2ro0?=
 =?us-ascii?Q?CkYPN2XOCCo+h8B7Ky+QGk1oJqUvEhqHYpnDpBUfp8aB1p6fguNMIu56ajjO?=
 =?us-ascii?Q?Sh3ZXy1IASQbHIk09DAyVJazDJr9oi1D2JjK8T8VFF3Ysc4j/VY3pYVLTzcp?=
 =?us-ascii?Q?BA8CiJtAkonlByAQbdBp+J6kjRmhCn08P5XeFIm/cKKNdObCTqY4Of8Afplc?=
 =?us-ascii?Q?MbJTcIC4AuABk5M3HlyOHL5EQrICszkzqJPmAJZk70dHNXrlKelEb/dYps/3?=
 =?us-ascii?Q?AGH87qlABlVVRKVc3IiAEarw3uQNS4a+VFQxwzLPBAi0pmDp9Khsn2Y4tkJ5?=
 =?us-ascii?Q?XDJVqoK9+UdrPT5TXozUCYVe/jKtEX3VSIusaQ7iEmsmUy65KwwVvelebJ6l?=
 =?us-ascii?Q?7nGqkGxP3LNcEH9yq1XO6ZwvfSU1l4lPhAsmkZ9LjJtJcWTzzEVBp1QYvRMb?=
 =?us-ascii?Q?h6+UMm5BgriFbTn0E+raTfHGn3Fl298rAPFU0LiNrvEol046W2sr+qR8BFPV?=
 =?us-ascii?Q?eBNTYrYRJKIR8/ym/BzDa0DYWh+BGWq/yPGoAEu+K36p6T0xyHS+pyRScosm?=
 =?us-ascii?Q?qJJuZyr0E1aKM1Z3olzm+IIVIVz+jYZu9aneBvmclVvjm/3uPZXGDSt6au2s?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f671941a-5de4-4345-dc9e-08db353ec9e3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 18:59:59.6843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjz50IDCMvcGnAb0BYn3uNJeP9M4l86g8sZYfYRW8ktWjjuWYwYM8f23PNisNOFc7ktlB4S5iR6T71d+SvPyKY23nGYCKNRAbJ3JONmA6jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6442
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 06:09:10PM +0000, Anusha Srivatsa wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Wednesday, March 29, 2023 8:46 PM
>> To: Srivatsa, Anusha <anusha.srivatsa@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Harrison, John C
>> <john.c.harrison@intel.com>; Ceraolo Spurio, Daniele
>> <daniele.ceraolospurio@intel.com>; dri-devel@lists.freedesktop.org; Daniel
>> Vetter <daniel.vetter@ffwll.ch>; Dave Airlie <airlied@redhat.com>
>> Subject: Re: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
>>
>> On Tue, Mar 28, 2023 at 04:31:13PM -0700, Anusha Srivatsa wrote:
>> >
>> >
>> >> -----Original Message-----
>> >> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> >> Sent: Thursday, March 23, 2023 10:18 PM
>> >> To: intel-xe@lists.freedesktop.org
>> >> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; Harrison, John C
>> >> <john.c.harrison@intel.com>; Ceraolo Spurio, Daniele
>> >> <daniele.ceraolospurio@intel.com>; dri-devel@lists.freedesktop.org;
>> >> Daniel Vetter <daniel.vetter@ffwll.ch>; Dave Airlie
>> >> <airlied@redhat.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
>> >> Subject: [PATCH 3/3] drm/xe: Update GuC/HuC firmware autoselect logic
>> >>
>> >> Update the logic to autoselect GuC/HuC for the platforms with the
>> >> following
>> >> improvements:
>> >>
>> >> - Document what is the firmware file that is expected to be
>> >>   loaded and what is checked from blob headers
>> >> - When the platform is under force-probe it's desired to enforce
>> >>   the full-version requirement so the correct firmware is used
>> >>   before widespread adoption and backward-compatibility
>> >>
>> >Extra line ^
>> >
>> >>   commitments
>> >> - Directory from which we expect firmware blobs to be available in
>> >>   upstream linux-firmware repository depends on the platform: for
>> >>   the ones supported by i915 it uses the i915/ directory, but the ones
>> >>   expected to be supported by xe, it's on the xe/ directory. This
>> >>   means that for platforms in the intersection, the firmware is
>> >>   loaded from a different directory, but that is not much important
>> >>   in the firmware repo and it avoids firmware duplication.
>> >>
>> >> - Make the table with the firmware definitions clearly state the
>> >>   versions being expected. Now with macros to select the version it's
>> >>   possible to choose between full-version/major-version for GuC and
>> >>   full-version/no-version for HuC. These are similar to the macros used
>> >>   in i915, but implemented in a slightly different way to avoid
>> >>   duplicating the macros for each firmware/type and functionality,
>> >>   besides adding the support for different directories.
>> >>
>> >> - There is no check added regarding force-probe since xe should
>> >>   reuse the same firmware files published for i915 for past
>> >>   platforms. This can be improved later with additional
>> >>   kunit checking against a hardcoded list of platforms that
>> >Extra line here.
>> >
>> >>   falls in this category.
>> >> - As mentioned in the TODO, the major version fallback was not
>> >>   implemented before as currently each platform only supports one
>> >>   major. That can be easily added later.
>> >>
>> >> - GuC version for MTL and PVC were updated to 70.6.4, using the exact
>> >>   full version, while the
>> >>
>> >> After this the GuC firmware used by PVC changes to pvc_guc_70.5.2.bin
>> >> since it's using a file not published yet.
>> >>
>> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/xe/xe_uc_fw.c       | 315 +++++++++++++++++-----------
>> >>  drivers/gpu/drm/xe/xe_uc_fw.h       |   2 +-
>> >>  drivers/gpu/drm/xe/xe_uc_fw_types.h |   7 +
>> >>  3 files changed, 204 insertions(+), 120 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
>> >> b/drivers/gpu/drm/xe/xe_uc_fw.c index 174c42873ebb..653bc3584cc5
>> >> 100644
>> >> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> >> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> >> @@ -17,6 +17,137 @@
>> >>  #include "xe_mmio.h"
>> >>  #include "xe_uc_fw.h"
>> >>
>> >> +/*
>> >> + * List of required GuC and HuC binaries per-platform. They must be
>> >> +ordered
>> >> + * based on platform, from newer to older.
>> >> + *
>> >> + * Versioning follows the guidelines from
>> >> + * Documentation/driver-api/firmware/firmware-usage-guidelines.rst.
>> >> +There is a
>> >> + * distinction for platforms being officially supported by the driver or not.
>> >> + * Platforms not available publicly or not yet officially supported
>> >> +by the
>> >> + * driver (under force-probe), use the mmp_ver(): the firmware
>> >> +autoselect logic
>> >> + * will select the firmware from disk with filename that matches the
>> >> +full
>> >> + * "mpp version", i.e. major.minor.patch. mmp_ver() should only be
>> >> +used for
>> >> + * this case.
>> >> + *
>> >> + * For platforms officially supported by the driver, the filename
>> >> +always only
>> >> + * ever contains the major version (GuC) or no version at all (HuC).
>> >> + *
>> >> + * After loading the file, the driver parses the versions embedded in the blob.
>> >> + * The major version needs to match a major version supported by the
>> >> +driver (if
>> >> + * any). The minor version is also checked and a notice emitted to
>> >> +the log if
>> >> + * the version found is smaller than the version wanted. This is
>> >> +done only for
>> >> + * informational purposes so users may have a chance to upgrade, but
>> >> +the driver
>> >> + * still loads and use the older firmware.
>> >> + *
>> >> + * Examples:
>> >> + *
>> >> + *	1) Platform officially supported by i915 - using Tigerlake as example.
>> >> + *	   Driver loads the following firmware blobs from disk:
>> >> + *
>> >> + *		- i915/tgl_guc_<major>.bin
>> >> + *		- i915/tgl_huc.bin
>> >> + *
>> >> + *	   <major> number for GuC is checked that it matches the version inside
>> >> + *	   the blob. <minor> version is checked and if smaller than the expected
>> >> + *	   an info message is emitted about that.
>> >> + *
>> >> + *	1) XE_<FUTUREINTELPLATFORM>, still under require_force_probe.
>> >> Using
>> >> + *	   "wipplat" as a short-name. Driver loads the following firmware blobs
>> >> + *	   from disk:
>> >> + *
>> >> + *		- xe/wipplat_guc_<major>.<minor>.<patch>.bin
>> >> + *		- xe/wipplat_huc_<major>.<minor>.<patch>.bin
>> >> + *
>> >> + *	   <major> and <minor> are checked that they match the version inside
>> >> + *	   the blob. Both of them need to match exactly what the driver is
>> >> + *	   expecting, otherwise it fails.
>> >> + *
>> >> + *	3) Platform officially supported by xe and out of force-probe. Using
>> >> + *	   "plat" as a short-name. Except for the different directory, the
>> >> + *	   behavior is the same as (1). Driver loads the following firmware
>> >> + *	   blobs from disk:
>> >> + *
>> >> + *		- xe/plat_guc_<major>.bin
>> >> + *		- xe/plat_huc.bin
>> >> + *
>> >> + *	   <major> number for GuC is checked that it matches the version inside
>> >> + *	   the blob. <minor> version is checked and if smaller than the expected
>> >> + *	   an info message is emitted about that.
>> >> + *
>> >> + * For the platforms already released with a major version, they
>> >> +should never be
>> >> + * removed from the table. Instead new entries with newer versions
>> >> +may be added
>> >> + * before them, so they take precedence.
>> >> + *
>> >> + * TODO: Currently there's no fallback on major version. That's
>> >> +because xe
>> >> + * driver only supports the one major version of each firmware in the table.
>> >> + * This needs to be fixed when the major version of GuC is updated.
>> >> + */
>> >> +
>> >> +struct uc_fw_entry {
>> >> +	enum xe_platform platform;
>> >> +	struct {
>> >> +		const char *path;
>> >> +		u16 major;
>> >> +		u16 minor;
>> >> +		bool full_ver_required;
>> >> +	};
>> >> +};
>> >> +
>> >> +struct fw_blobs_by_type {
>> >> +	const struct uc_fw_entry *entries;
>> >> +	u32 count;
>> >> +};
>> >> +
>> >> +#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)
>> >> 		\
>> >> +	fw_def(METEORLAKE,	mmp_ver(  i915,	guc,	mtl,	70, 6, 4))
>> >> 	\
>> >> +	fw_def(PVC,		mmp_ver(  xe,	guc,	pvc,	70, 6, 4))
>> >> 	\
>> >> +	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))
>> >> 	\
>> >> +	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))
>> >> 	\
>> >> +	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))
>> >> 	\
>> >> +	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))
>> >> 	\
>> >> +	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
>> >> +
>> >> +#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)
>> >> 		\
>> >> +	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))
>> >> 	\
>> >> +	fw_def(DG1,		no_ver(i915,	huc,	dg1))
>> >> 	\
>> >> +	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
>> >> +
>> >> +#define MAKE_FW_PATH(dir__, uc__, shortname__, version__)
>> >> 	\
>> >> +	__stringify(dir__) "/" __stringify(shortname__) "_"
>> >> +__stringify(uc__)
>> >> version__ ".bin"
>> >> +
>> >> +#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c)
>> >> 	\
>> >> +	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a ## . ## b ## .
>> >> ## c))
>> >> +#define fw_filename_major_ver(dir_, uc_, shortname_, a, b)
>> >> 	\
>> >> +	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a)) #define
>> >> +fw_filename_no_ver(dir_, uc_, shortname_)
>> >> 	\
>> >> +	MAKE_FW_PATH(dir_, uc_, shortname_, "")
>> >> +
>> >> +#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)
>> >> 	\
>> >> +	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),
>> >> 	\
>> >> +	  a, b, true }
>> >> +#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b)
>> >> 	\
>> >> +	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b),
>> >> 	\
>> >> +	  a, b }
>> >Why is b required here?
>>
>> because it is setting the minor in the corresponding struct uc_fw_entry.
>>  From the tables above, basically for the rows using major_ver(), it will use up to
>> the major version in the arguments to decide what is the
>> *file*  to load. The path for the file is constructed with the macro above, so it
>> can be used by both MODULE_FIRMWARE and by setting the patch in the
>> uc_fw_entry.  The same major_ver() is used to fill out the rest of the
>> uc_fw_entry, where we need the minor too.
>>
>> See doucumentation above. Copying the relevant part here:
>>
>> 	<major> number for GuC is checked that it matches the version inside
>> 	the blob. <minor> version is checked and if smaller than the expected
>> 	an info message is emitted about that.
>>
>>
>> Lucas De Marchi
>
>Thanks for the explanation. The auto select logic looks good.
>With the extra lines removed from commit message,
>
> Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


thanks, applied

Lucas De Marchi
