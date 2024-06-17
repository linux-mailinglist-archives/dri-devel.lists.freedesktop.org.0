Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2290B4FC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 17:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A136A89361;
	Mon, 17 Jun 2024 15:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2aAzArp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2653489361;
 Mon, 17 Jun 2024 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718639174; x=1750175174;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PTDZZ0DYO5TbfG4PMUyhQ3HDdHyug1viK5mKjr3Km1o=;
 b=Y2aAzArpA0ZXi7wteF5LAzXDFIbY+e54wt3t2TP1VNm3js6EkQ2JY7qs
 KYmnFeEPaB4b779QA79bdvBKRjpN8vy0fTedfk24+Vj0Q9otUk0TSrHLg
 T+Hmj94V68bjfL2VwQWNcwoD2hxy4AhUgZRUNlyq9Pc1cgQJwgDcWaYhu
 hlbxTvzWH2o5tKJWGdFhGF9dh135hxAv+v7IC+fuskSHK3B5QoY2TTh4O
 Rrox5CSpglm14aRGCn8BjI/X+1I5P5wHbVzM9l1PyUudJcBN8P7tePNNc
 xMazSbBer1zyFhDDkGkk6SDGbZtAf0zCltHD9v6/2YrRN+qgqX1d0TEyY g==;
X-CSE-ConnectionGUID: JoTZXBCLSeqGUk/l+U4J7w==
X-CSE-MsgGUID: R4yUBEbVQZeTm/XDOFuchQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15345145"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="15345145"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 08:46:14 -0700
X-CSE-ConnectionGUID: akA6c7/gTcC1GH1rOc6F1g==
X-CSE-MsgGUID: GV3JzLfCR8ivM4tXtU+LaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41320639"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 08:46:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 08:46:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 08:46:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 08:46:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNUZS51eaSG66uEYDByqqu3fO6JDMdzuk9IN2twnqds1aoE3FlsmZFWvk20IMeuU7kdgmOj0M5hWp2hBmhlWIR+5oB4wZloak46VBVgi1Dm1WtAH6+LKWXAuXAZO8bVKYPY3F8+abpzhJtNBkz8OZPMts4cXC8GFkKLMkCB4gVhXMwhu1+2XuAR8fnbDrPOc97pWJ05fwQnbXzo4PyTwjWmyauLTVmetCT6hJbR/zU1OW4DBxAKy/PLmtl4q+mTFcJOOwt2DKN9DD3Cy/tUNTu9vlyOgoW9ZZCjvEAinwi0OsUwBOCV+ecijKHzCdCcllObqEuSORtLng2AM5izn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SMHiSWYYLCc/DW38kRfbOgqqphh/tcBaE5CSAB4JE4=;
 b=NU20UGZwp9Ag8cdjwq+ywB2fX/uEJixcXQ/jRgbiXYZ10Oog8lYYc3mzsx9O66RNilm7iSNXjDgExTw6T9wVXGXs0i8WFKkklc84hOI9VDVk9DevWs/Rqi1D2DjffOoQkfWd8qU/tpt+Ksm2qMFUviC46bQGyWD1SvA0euAksnz3Arc8DuejVNQa3ozYVtciD6vcG8PxmCwTwUw7jMzrQ2mPaM2oc/kyCeNUzY8dEUDwWXclU4ulueZczPAPQKJkRswWr33pbEAMPsVgcBE2nRcRdO6rKgKFW5IZVDr5BMRlhEUc+98qRqP0Ge2vHgg9w3i+BbpnNTDlptDCW45Pdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6804.namprd11.prod.outlook.com (2603:10b6:510:1bc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.27; Mon, 17 Jun
 2024 15:46:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 15:46:11 +0000
Date: Mon, 17 Jun 2024 10:46:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gem: Return -EINVAL instead of '0'
Message-ID: <hh6i4vsz2ky52hw5g74l5llhjtzuyuebjtnaebqh3dq7svbfnp@zy4cwkqqzszz>
References: <20240616070349.250899-1-andi.shyti@linux.intel.com>
 <20240616070349.250899-2-andi.shyti@linux.intel.com>
 <3fpme67vq7nf3sswznn7un7m7p53bibfbd5ek3uknnlwkogu6a@34oufw2qwtie>
 <ZnBGk9mUq5HImyz9@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZnBGk9mUq5HImyz9@ashyti-mobl2.lan>
X-ClientProxiedBy: MW4P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: e1090cf6-9161-4331-7ab8-08dc8ee49c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b+2DfhbmfcyFjCdlbpameqFAqJkJLwgLD+3cQ0LKwJl8Pi0Mlz8QPvg1XHwa?=
 =?us-ascii?Q?7wFQ1lZpLTBj7vWFRPcHoeMNvxLQ7xlco9e5Xsy9Yzbjl52+C9v4mZeukCin?=
 =?us-ascii?Q?VNm/lTZ1ID+HVzqo59ZZohF9jFeBUIpy4sO7REDHLmfApZpD8RvYOpBOL/1J?=
 =?us-ascii?Q?LZUZg8awjcqVS3ZzeBCx+53tn1x3hCD69mZT4b07hW++hyUM/RGda+oMPDqN?=
 =?us-ascii?Q?gx/O2i0L7H4LG4ingTCbYERXvg4kRBBOGZ+yRMvGbruCNPKUE8Qt2NsE36x/?=
 =?us-ascii?Q?STRItzwOv9ZKiOn7avX5oaAExYoHkxmAEoEfye1+68fnz5NlDlkq5bQMLQwt?=
 =?us-ascii?Q?Hy8RViL0Cvt+Fec1loWRMkHmN4SO1G9W3a7pr7wlC5CuI5rEGcl68ltqXCd5?=
 =?us-ascii?Q?BDk2aC+XhdBa3ezV9hQv5Q5YoAfh52+PzBvT+oDmSA8F+kFwan3DE1jEwnCI?=
 =?us-ascii?Q?K28PyWMmt456E/5da8ofy1R6h7m5KxdkCcEVQQ46F7WBA7JiMnxOqf3Gk/UQ?=
 =?us-ascii?Q?wmqB8i0UMSY12rnLgfwtZaoWGzpX+9DrORo6d7qvlLwTlNdkzZwFKjaf5Z3b?=
 =?us-ascii?Q?FF83xUFdNXU+1GsSHnOo28RLoPieq9p8tCQumS9aU/1bNyo3v0wHqCsyjJ0r?=
 =?us-ascii?Q?UmCyNTeoBsxeH1BPVmbB41i/Vp9PrMLPF9YqWwT4FQ8kbcQ8WGaNADd9N6M1?=
 =?us-ascii?Q?hWFHyu2k4J3ZNFX/D1ip/nrcgsfkUg1jg/SOeQr2WBRCmSfHzx9CVssaJ60G?=
 =?us-ascii?Q?pUasK6bquyyPnmzigKHlj9TnLLY84v+JAc10RPHs1A0dPgG0hNRlifSL+0zk?=
 =?us-ascii?Q?m7ScQJXxGSI5SfqkOxy+33D0YmDQ30jjnuN8m/2/RL1Gc5jQNk4bf0FhJx+Z?=
 =?us-ascii?Q?FMmndhuvQbuwB6bTHWUd8TCJHw6Icum4pTiSKsHhX+nq6ygx0b/JsRprKdeS?=
 =?us-ascii?Q?lBpZvhbhJD56xicAf9yUJTP8MeS5ygzRVXT1GaUnjWs6Vcojz4B+RdOLYqSf?=
 =?us-ascii?Q?ydiEgGCS9UjFuQgnQ9SAZ9dDM3x5Q+kkn6DFgNWXcIIAAJKwFOkVBQCorMn6?=
 =?us-ascii?Q?2cl4ORpcScxDEViJQgl0O0Qvf+ZoHmqDIPSSoAiRu1n0oHDxTV3OmKx+4swI?=
 =?us-ascii?Q?dgP3SxHrv20AYGM2k385EO9Akb1ukwBDKBHdm0e0hv5dBpdke17jNdTKFTY2?=
 =?us-ascii?Q?Veuols4hm4WZ+oVKl657dhKTOEXClnZCVPta+Y5ZULPBIbaNqttFjyUry7AB?=
 =?us-ascii?Q?ki6IUvTR2jquOsXDzNvrwOb+0XQJs6oX5Y4X9gEZBz3l8jJ1tdSgu7gwV02z?=
 =?us-ascii?Q?SDbr1sHSBEhWx1y9tacrIA84?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kjqT57OMsJ5MrxdW1F3jEuQznkcltR6DupYWQ5ZVvu3O9LXHUxSjlE2sv/Hw?=
 =?us-ascii?Q?0jk59LLkeJB6hv+heOXsjEUhwvnXsDA7ckSsbLwIE8sU0LGGfH4rD2lFka08?=
 =?us-ascii?Q?S6dkOdHZsWWSDhu0fIY1EdsgLFGW8/Gu9SRAfgmf7EuIboWSMcqEtw6zDYCv?=
 =?us-ascii?Q?drlmAME9dO8p4lYr/UYHvbTJuEyW2sfg/ZXirvC/IaMR/JQJKjOJZnvcgvVW?=
 =?us-ascii?Q?6EnwqP8O/80dgOzknKqo7mpxrDO6D56wKax3pPKueb9sOmsgW1Vkxw9+Kr7X?=
 =?us-ascii?Q?lLzg1sx6isvx7FBjbRiO2frkZNlq0UraJoUCjB3n8ogjrwqvF2+F+YSFFaXS?=
 =?us-ascii?Q?kAU259oDfhE0AwXrirw1Fh5hs0vk8yabI7Mc5HQpEFS0+jHxxgDa3DsyGTTi?=
 =?us-ascii?Q?CGWMvzjJFOL0F4Qvsq4iADLEKubHI7iE282ay3n8k8jN5lGnWiynyghMMby2?=
 =?us-ascii?Q?/lIF2MUt4qiENmLbd85x+88ZZutBG8oXLFXvlI+xDZI0UU8FiS50O01N0tY2?=
 =?us-ascii?Q?pPzlgjFnhmtScx2o9gMxlDyUD1ryYkZK4nzDAp1ux+RbZk6+RYfeK829ZO/b?=
 =?us-ascii?Q?0BQX50aKdfznm7qjbwto2ufHPy5tzSrvjtb/arw1EUHiOPqatpCVMMuj7Omc?=
 =?us-ascii?Q?OWXwVGqHhfnJUqnokAGW1N5i35i57dRYQD7jvFM6Mto3oqkR11goHjsXiE0T?=
 =?us-ascii?Q?9uCswIuhP7gpA7KreMwBTu+wbRdwS+7FInh32fmMKG/5y9b5iy1XvF332buL?=
 =?us-ascii?Q?sXXKIgmqATet/jdMxkm3RrXt+KaM+8RNoe/QJQVRoaWhDGPu4TPUkpZSf/kp?=
 =?us-ascii?Q?5ymo99u4dR+4jQpkjIWKvhjTF8HpmZ/2dz/Lz0VxcBXmqBM1PbMrjLqS0TIa?=
 =?us-ascii?Q?qgafDcfd8JXlYEfrEazNx61YPjxKYzPP+uOgLeBXenweKMYL/RLmgZnZeVNv?=
 =?us-ascii?Q?opZnaslYKBcWf83acq2ZrBPt0JiUntgUUo7TKEtsrwwEBiQWOD1CMw/VMylL?=
 =?us-ascii?Q?w67/uh86pHQJg2nS0CmcrZCPT2LbBDaA0GgWFc21BCAnr5hUKP5uW1q4aUWP?=
 =?us-ascii?Q?mCD+VxhUJjL4iDi+EVsqk5bdeVgebJP9p/v8yjm1Yo+oopRasEGaPTG6Lq8H?=
 =?us-ascii?Q?z9coXtD81aYSKzGpTJr5D0da7U17z5lfR+URIyHQdqGsBOjM4CmFSRX5Sze4?=
 =?us-ascii?Q?AjF4WbcNXRf83CVVWkdr8/fksEVCh6dnRRUxIc+uv3p64NPl56WyP0sznn9q?=
 =?us-ascii?Q?eO6wu5uZD/CVTzG456kmAonUF90v59J5iLRIS48F6t2nYgEIhIidAXevFnzH?=
 =?us-ascii?Q?I8fLNVKYCr+wxFFamv8SwxmktkMwjB4Syzz/eD1UCOG4ioL9zTKJAx9XrNTh?=
 =?us-ascii?Q?MY+9/HtAhIf9QZgmrap3bBsK6bj+zOoR+3U/gKsdJwrLKssnk9Yu7KbDgJJC?=
 =?us-ascii?Q?b9/nnBDl/9hdWzDzl26Ha1CgTU6U0SiujsG8TXK1f2EFpvSAjUy7XpGw2Wso?=
 =?us-ascii?Q?N9WHHaV28V7dgY3kSs3lo3ljisDQ1VtF5jPQReAfk+0PPuzaacYCjILd0ieg?=
 =?us-ascii?Q?u9y5obsfPy/ZeTBtl+lcnN4VUQhQNRZoyX3vdAuHILBo9Mlkuy6fIUm+1RcO?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1090cf6-9161-4331-7ab8-08dc8ee49c79
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 15:46:11.1119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHiiE/2JAOoUbDthfggrG4s8iSeWdicBLAiPKxoUgGAznC3Rbs3vkwIVOQoTNiNZGY0WWchDymkh54yWSdwGrmqx9eA1adWEYAIIqs4F6ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6804
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

On Mon, Jun 17, 2024 at 04:22:11PM GMT, Andi Shyti wrote:
>On Mon, Jun 17, 2024 at 07:55:10AM -0500, Lucas De Marchi wrote:
>> On Sun, Jun 16, 2024 at 09:03:48AM GMT, Andi Shyti wrote:
>> > Commit 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup
>> > warning") returns '0' from i915_gem_stolen_lmem_setup(), but it's
>> > supposed to return a pointer to the intel_memory_region
>> > structure.
>> >
>> > Sparse complains with the following message:
>> >
>> > > > drivers/gpu/drm/i915/gem/i915_gem_stolen.c:943:32: sparse: sparse:
>> >   Using plain integer as NULL pointer
>> >
>> > The caller checks for errors, and if no error is returned, it
>> > stores the address of the stolen memory. Therefore, we can't
>> > return NULL. Since we are handling a case of out-of-bounds, it's
>> > appropriate to treat the "lmem_size < dsm_base" case as an error.
>>
>> which completely invalidates the point of the commit that introduced this
>> regression. That was commit was supposed to do "let's continue, just
>> disabling stolen".
>
>Yes, correct, I missed the point while fixing stuff. But patch 2
>is still valid.

no, it's not. It's introduced by the same commit. I went to look into
this exactly because of the second issue: it broke 32b build in xe and
all the CI.Hooks in xe are failing.

Lucas De Marchi


>
>Thanks,
>Andi
