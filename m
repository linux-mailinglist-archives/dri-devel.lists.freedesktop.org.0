Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C709F710F96
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFE110E17E;
	Thu, 25 May 2023 15:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FC210E17A;
 Thu, 25 May 2023 15:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685028594; x=1716564594;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=WFgBhjZpOv79lFlmgDblfPICrUbV8jqdxaURgvMPKjs=;
 b=ipvgjnCj5RBAb1PqWVGhRVYkveuLT0jK6V6ErM4RR1FlI9ajrbYln/fH
 zkq+pdzoC6vTzN0wPJcH0t5CAg6A2b3lYY1y0FRi8goxJcifixyvxP972
 VDEtys8h/BjrJcP7SmNIgNn9lG9mDfFpQvlu9RyNxcqoNScqU2IkG4jYR
 vdW7qz5u8H0fV8oH1yyajrhOWuWW05iRh8y8KVwe7KLk0omtoMjsDb270
 Ld5FVg6HjRGWvRg9/rT/p9U92l2jOEbYJTAB0BCUXbNASIhPZThMd0Cct
 gd2IZ2wn4sAQu6lmrk75A7n6CZqTDTnhoT2Y6zHbm3aIk8QGR7YXO6iJi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="419662741"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
 d="scan'208,217";a="419662741"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="699022728"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
 d="scan'208,217";a="699022728"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 25 May 2023 08:29:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 08:29:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 08:29:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 08:29:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tj0SfIg2uVfQ8W7sSW7y+TZP5IVJy/r7dyiCEbPd3yXG5eDJHxBP+SNQE/Xoveuqldog8t8DXdDvk7DOR3jptF89RHBG2MLgfAQ8fsTld68FpWnsjknaRz9cAC/QI10X+odG8G8QMJb3i6NbvA9Kb+2Av+P236EtVE6Qd1dhAdNW8bErZ4zFONGWn9vPiVu/Dyx2CMDc5K2gyH8yy2pyPpO2BG593t9+D+DX+qu5vnEPyZoaImzOsPGQF9mYbUaH3/rTR5n3r58gBWKnTqKZAzJ761tfe4B7siM0rgrAvuik6l7jwTWRw4AQqEC4GZXmPDURRsBQsh+t4pnAKQmPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaC5f7dt9SEr7Jhgrx9ISIPiIlzWngERd/IzTkAgPNo=;
 b=feDjAQ2b3oi2CkORP1MkLWecwESPkcZWT71MmHjk6v6zB6ZPxyW91Rc7V/7mxedVK6nKIOrwgo4Nr7BrfOShzCaAEDQkolYRp8gGQVnS+g6eA2CpPxwxHwv14M8rfFOybhDMB6lEhnf3pzmjivrBIf5gS9+Z3EhV1b36UMOP0YYdS3GDVikY3y5cWXoM+1LA40mgtVPg0azh6V6G3HSZtkkBjrNdaBLzS5j8d1e8uY+WXNa7k8O87v6WGCjD0RdTBMQFAFHx4YD3zO6nEdatbFb1S56WTcqIadU44eGwlRrHXS4cNh5qyIkYkHkqCiONej6ToQhWyn9jKn+sTfymfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SN7PR11MB7538.namprd11.prod.outlook.com (2603:10b6:806:32b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 15:29:45 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008%3]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 15:29:45 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Topic: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Index: AQHZjnqnJ8PZ7Ur6xkyxJe9rIFJU0a9qqhsAgABvbA+AAAS9MA==
Date: Thu, 25 May 2023 15:29:44 +0000
Message-ID: <BYAPR11MB2567BACAC55CB9906E9FF49B9A469@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230524200255.443021-1-fei.yang@intel.com>
 <78124d6f-7f46-afbe-d320-9dad77082f3b@linux.intel.com>
 <BYAPR11MB25673475B8C523F25A54DC029A469@BYAPR11MB2567.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB25673475B8C523F25A54DC029A469@BYAPR11MB2567.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SN7PR11MB7538:EE_
x-ms-office365-filtering-correlation-id: 0011c5f4-e528-41e8-d94d-08db5d34de20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ok7I9XBhOaoYeuFZovLvMbWx0TtxgTuH/JCy8JUDOXlcu2bCIT3QCyo8gKOnc8i4kEE3tHMf40LUEWz/JJf2eaDq2P/B/KpOhs1QyGdeXZF7E599OFo+eLrrwFfqWXw1cJGppVVs4ikCUPAxEIUakzjWIOFg6vWIlBKxoUf0lOpFcVYNYLmy9Akl5zttpEszdy5I0KIj/TC9HVWl1h9KQKMPSMhLfJl4k41qv6vgYX1YazMntwVLLm8TFYkvJuLvUAOL49pvQet1cjFeYBku6m6ZS4Z5Xk4v/YeoIVtVxW7c47/3iJ1iBTgYBezKt3wApg1IOkLwxmBF/me7Pvf6zJb3+O407cygjKaGRJhKGqOwuhBj1unEr/AjbJBvwwucgiD5e56MhBNs8fCt7kitUhtYtNPGbqVl4XnRJJb0USR9c6V97qGHVMOcCeealLO9iwtii8SQgNPVBzAn53jPXOBlSIxO/PjnxRJDVGvhnRFE8T7z67bRRih44KwQvtVGIa+txwAzSkMUNgcaOHwDAsLYJKQBf+Hdny1MIuM77hKjbqT8GgP54TjZMtY4gjaQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199021)(8676002)(8936002)(76116006)(5660300002)(52536014)(186003)(83380400001)(2940100002)(26005)(122000001)(86362001)(6506007)(53546011)(38100700002)(9686003)(82960400001)(166002)(38070700005)(41300700001)(7696005)(33656002)(55016003)(966005)(71200400001)(64756008)(66556008)(66446008)(478600001)(110136005)(316002)(66946007)(66476007)(4326008)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qf+Mpypbw7XBMHJ2Vi1NIH80p2koOPUTiDlkkxCY6TxjUyg+Qubdjy66Ck7s?=
 =?us-ascii?Q?P1Scytnfu5jBlze9B1UxlNGnL5wngHQVA2pem5jx96c3lgFl91U6wyFlmWzu?=
 =?us-ascii?Q?lDyAQeh6LDbcG2wmZnctPzLcIQLryvZnoBukzzO4asKCG2wrcONE/zb/qGEc?=
 =?us-ascii?Q?od9J//2+p7TnYEfL5uwFonfi7j6fkE2KP0LU4wpYfhILbM1v/zKsSIA01A77?=
 =?us-ascii?Q?S2DrFfrSj93CqgaFXtb5AdgZEjvzCWdQAk8w8/jTa/5L3jYsGzdEM+Nls4ds?=
 =?us-ascii?Q?vEjQg+ZKRZr+MBMI7kpZ9DxvFP99Or94Q1E6G+LqePhcTj4fjORtYN5CnhF3?=
 =?us-ascii?Q?+TsgPkhF2NBs2VASWU6EAuh9W31qVsc3amSeejITGiDZY6Y3QG/JCXnwNsir?=
 =?us-ascii?Q?rZQYEjpmPtPjCLZGrJTaG95K5UZDh1fyMg96iqSXcGtkhO/G51r/N8xT6RDy?=
 =?us-ascii?Q?yYjmz+GowlNZdDP/N79IdlER2rjsFk4P2id1txMhS+Fv+EEeksqk2Yr2b8z8?=
 =?us-ascii?Q?3gBCArGsZlfQIiUnE/MHTnobK8irWplNMWcQWuKugltdY+3b2upyWFN7LtEb?=
 =?us-ascii?Q?GNCociqwx+t98kTVRxZJGKn+hIX68IhNpPmQ01946u/DC9EU2mwKjc+6soft?=
 =?us-ascii?Q?0Bk+J/w3BSLPzmGGVaHBTMEp+S6f0Ffl1lX+4vHmmoWC5wDhtY6Al/9QegeI?=
 =?us-ascii?Q?OewGtVLyXV/GbbPwclIboTfb2fOSHUiEpe0iDQ/cZXWn/Ia75EhpQ570HIHV?=
 =?us-ascii?Q?fYcLBY1zEj+y/r0RGABLbNeFZ6gk4fvCrGFd5luMB78jB432uMOCk/XOeizG?=
 =?us-ascii?Q?2EGctdX+fluWMpjOa+PbkhQ6OXcT8Ep7hJun3HOTJLZc8vE4pGzifHM4iG99?=
 =?us-ascii?Q?b5KPKNgLD2+7RugX1uZRiQY5+LOJLjkpZixeGPGDNSVSxhR13LBSGePZwvmE?=
 =?us-ascii?Q?BDDGOWoA1cZW9uio+/gzrkWmbGtoI6KlryC9ae+rpOHEFOom06EMAwGRC6k2?=
 =?us-ascii?Q?bts9FZHMjAjUxLowIMlUIrqhhDJn+MJ3jIn1h5sr53TzgOReRFS9W2MPNctK?=
 =?us-ascii?Q?ZYPlPcbbU/StQ+dKT8/UlG0r0f5s2ye2MJupWealqwXQIyESflSLeCUL9yYU?=
 =?us-ascii?Q?O7khJoDqKZyZq+HqdzrRA66ZBRCI1MTY8jXXB0cKXOp7e8oLmjojWwW5+gpu?=
 =?us-ascii?Q?ngiaLA5lzweptwVQWi78FfWAJDULuGrPonCSredYwn6sFTrKSE6SdubyRzpK?=
 =?us-ascii?Q?79AYmvH42vGiiph9IpZklJY34t1Q6jI8Lhak89BOCMDmvDRSdKpK5j0rxFNs?=
 =?us-ascii?Q?GbU/J3ppf7zxubhDG8ahNJF8oG2SbN4zQ4G7+4+3zIN0+xEtpJFu8kZizNTE?=
 =?us-ascii?Q?wC9B+q26Myw1FT9sSRKNUDC9ZfNqmmURwIvbJQEL1lU+WFFG8QbgEhTviXtN?=
 =?us-ascii?Q?U3kUlu9Vb28njL+lQbOtnGX9PNLcpoe3epmwjAk2oUcJfiRL5t3IfUcy5+Db?=
 =?us-ascii?Q?zTijSd7vNVqmuNRiuV0+p6GUJDDeFsjXDppmMFw370kXzqV8VNouOR3aAhUM?=
 =?us-ascii?Q?A4e/mGx4DNaf1yjCoSA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567BACAC55CB9906E9FF49B9A469BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0011c5f4-e528-41e8-d94d-08db5d34de20
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 15:29:44.9159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IU0s00jrOm2D41NlCshqQXARVv66AleDm7HS3kgVbD2Xkd5AOXPPZZvXoDJNDrcNLbbkxL+Ffp8evJ3+y9IOMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7538
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567BACAC55CB9906E9FF49B9A469BYAPR11MB2567namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry replied on top of wrong thread.

From: Yang, Fei <fei.yang@intel.com>
Sent: Thursday, May 25, 2023 8:12 AM
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; intel-gfx@lists.freede=
sktop.org
Cc: dri-devel@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set cache =
at BO creation


Sounds weird to have a platform restriction on uAPI though. UMD not using t=
his extension is not a problem, is it?


From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com<mailto:tvrtko.ursulin@=
linux.intel.com>>
Sent: Thursday, May 25, 2023 1:33 AM
To: Yang, Fei <fei.yang@intel.com<mailto:fei.yang@intel.com>>; intel-gfx@li=
sts.freedesktop.org<mailto:intel-gfx@lists.freedesktop.org> <intel-gfx@list=
s.freedesktop.org<mailto:intel-gfx@lists.freedesktop.org>>
Cc: dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>=
 <dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>>;=
 Vivi, Rodrigo <rodrigo.vivi@intel.com<mailto:rodrigo.vivi@intel.com>>
Subject: Re: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set cache =
at BO creation


On 24/05/2023 21:02, fei.yang@intel.com<mailto:fei.yang@intel.com> wrote:
> From: Fei Yang <fei.yang@intel.com<mailto:fei.yang@intel.com>>
>
> This series introduce a new extension for GEM_CREATE,
> 1. end support for set caching ioctl [PATCH 1/2]
> 2. add set_pat extension for gem_create [PATCH 2/2]
>
> v2: drop one patch that was merged separately
>      commit 341ad0e8e254 ("drm/i915/mtl: Add PTE encode function")
> v3: rebased on https://patchwork.freedesktop.org/series/117082/
> v4: fix missing unlock introduced in v3, and
>      solve a rebase conflict
> v5: replace obj->cache_level with pat_set_by_user,
>      fix i915_cache_level_str() for legacy platforms.
> v6: rebased on https://patchwork.freedesktop.org/series/117480/
> v7: rebased on https://patchwork.freedesktop.org/series/117528/
> v8: dropped the two dependent patches that has been merged
>      separately. Add IGT link and Tested-by (MESA).
> v9: addressing comments (Andi)
> v10: acked-by and tested-by MESA
> v11: drop "end support for set caching ioctl" (merged)
>       remove tools/include/uapi/drm/i915_drm.h
> v12: drop Bspec reference in comment. add to commit message instead
>
> Fei Yang (1):
>    drm/i915: Allow user to set cache at BO creation
>
>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>   include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
>   3 files changed, 83 insertions(+)
>

Do you also have a Test-with: run against the new IGT somewhere?

Regards,

Tvrtko

--_000_BYAPR11MB2567BACAC55CB9906E9FF49B9A469BYAPR11MB2567namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:Consolas;}
span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Sorry replied on top of wrong thread.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Yang, Fei &lt;fei.yang@intel.com&gt; <b=
r>
<b>Sent:</b> Thursday, May 25, 2023 8:12 AM<br>
<b>To:</b> Tvrtko Ursulin &lt;tvrtko.ursulin@linux.intel.com&gt;; intel-gfx=
@lists.freedesktop.org<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org; Vivi, Rodrigo &lt;rodrigo.vivi@=
intel.com&gt;<br>
<b>Subject:</b> Re: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set=
 cache at BO creation<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoPlainText"><span style=3D"color:black">Sounds weird to have =
a platform restriction on uAPI though. UMD not using this extension is not =
a problem, is it?&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&nbsp;<o:p></o:p></sp=
an></p>
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Tvrtko Ursulin &lt;<a href=3D"mailto:tvrtko.ursulin=
@linux.intel.com">tvrtko.ursulin@linux.intel.com</a>&gt;</span><o:p></o:p><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><b><span style=3D"color:black">Sent:</span></b><span=
 style=3D"color:black"> Thursday, May 25, 2023 1:33 AM<br>
<b>To:</b> Yang, Fei &lt;<a href=3D"mailto:fei.yang@intel.com">fei.yang@int=
el.com</a>&gt;;
<a href=3D"mailto:intel-gfx@lists.freedesktop.org">intel-gfx@lists.freedesk=
top.org</a> &lt;<a href=3D"mailto:intel-gfx@lists.freedesktop.org">intel-gf=
x@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lis=
ts.freedesktop.org</a> &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.or=
g">dri-devel@lists.freedesktop.org</a>&gt;; Vivi, Rodrigo &lt;<a href=3D"ma=
ilto:rodrigo.vivi@intel.com">rodrigo.vivi@intel.com</a>&gt;<br>
<b>Subject:</b> Re: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set=
 cache at BO creation</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal"><br>
On 24/05/2023 21:02, <a href=3D"mailto:fei.yang@intel.com">fei.yang@intel.c=
om</a> wrote:<br>
&gt; From: Fei Yang &lt;<a href=3D"mailto:fei.yang@intel.com">fei.yang@inte=
l.com</a>&gt;<br>
&gt; <br>
&gt; This series introduce a new extension for GEM_CREATE,<br>
&gt; 1. end support for set caching ioctl [PATCH 1/2]<br>
&gt; 2. add set_pat extension for gem_create [PATCH 2/2]<br>
&gt; <br>
&gt; v2: drop one patch that was merged separately<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; commit 341ad0e8e254 (&quot;drm/i915/mtl:=
 Add PTE encode function&quot;)<br>
&gt; v3: rebased on <a href=3D"https://patchwork.freedesktop.org/series/117=
082/">https://patchwork.freedesktop.org/series/117082/</a><br>
&gt; v4: fix missing unlock introduced in v3, and<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; solve a rebase conflict<br>
&gt; v5: replace obj-&gt;cache_level with pat_set_by_user,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fix i915_cache_level_str() for legacy pl=
atforms.<br>
&gt; v6: rebased on <a href=3D"https://patchwork.freedesktop.org/series/117=
480/">https://patchwork.freedesktop.org/series/117480/</a><br>
&gt; v7: rebased on <a href=3D"https://patchwork.freedesktop.org/series/117=
528/">https://patchwork.freedesktop.org/series/117528/</a><br>
&gt; v8: dropped the two dependent patches that has been merged<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; separately. Add IGT link and Tested-by (=
MESA).<br>
&gt; v9: addressing comments (Andi)<br>
&gt; v10: acked-by and tested-by MESA<br>
&gt; v11: drop &quot;end support for set caching ioctl&quot; (merged)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; remove tools/include/uapi/drm/i915=
_drm.h<br>
&gt; v12: drop Bspec reference in comment. add to commit message instead<br=
>
&gt; <br>
&gt; Fei Yang (1):<br>
&gt;&nbsp;&nbsp;&nbsp; drm/i915: Allow user to set cache at BO creation<br>
&gt; <br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 ++++++++++=
+++++++++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/gem/i915_gem_object.c |&nbsp; 6 ++++<=
br>
&gt;&nbsp;&nbsp; include/uapi/drm/i915_drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 41 ++++++++++=
++++++++++++<br>
&gt;&nbsp;&nbsp; 3 files changed, 83 insertions(+)<br>
&gt; <br>
<br>
Do you also have a Test-with: run against the new IGT somewhere?<br>
<br>
Regards,<br>
<br>
Tvrtko<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_BYAPR11MB2567BACAC55CB9906E9FF49B9A469BYAPR11MB2567namp_--
