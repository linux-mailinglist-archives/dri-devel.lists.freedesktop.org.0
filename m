Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10DC827A27
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 22:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905E010E2E3;
	Mon,  8 Jan 2024 21:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEA910E2E3;
 Mon,  8 Jan 2024 21:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704749056; x=1736285056;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=w1bZCtgTVwS6/KT5MbLDsjOQ19c1Rd8mDPKhQ5jRdpk=;
 b=FvnZoQBfdtGtFTI/v3tdM0LtbYhXvbfVUXHp3x1etji4EaXYXTLOIjG3
 PIeq52v/zk8RZza37Gp+IQLfmOL4CJYlPmAjOuFbwfo+KArgwZjV3LEhF
 di4U8TQRjL76ew3S+G+sbe9Ldyr+G67Qed2jY8s0v2ckwNDt1fZ7YtHie
 u/FHU2A1TQhVHUSkEZseGPS237UUFSoSuYZW77Fx1strhRd/uDXxWIQFv
 1giT2vb/pGksWAqamNViuc3ZryMxMekDmT04guU4GhLBBT6Obp0SPpaFn
 yG66XErtOW5t9mSfLZtj2EJxWEHNRs2vFJphFJG9fdqiSSWQgpSSfYapu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484188139"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="484188139"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 13:24:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="815734236"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="815734236"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 13:24:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 13:24:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 13:24:15 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 13:24:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDxRXclbpCKQ1jv2AW8SKkouRRgqj5c87tyBxm3ocwFApX8UhIn+K3J8iKa0nbYRwxsXebBbscESrWzYRSPo1dVWRcfCGiZH8jCvzl0Wx7CulC5v0+aBPUVBqF8sfCCc/zUvYHsPWG+CTMEw3atvwqcmoETgXTeIdN8TzffGFyvhRQ9UTMlvKbAOd0FvWTWwC4KQUDDFx/R8ZK0nUYpH57TevDrnMSx7/nzq9LqM/RbFHmandl6Tg6cHWksYAOiNJITdFQd4D8g0on5SBwLnjvbTQtVubRUKcoLCChbT8wc3umU2Zg9/7uvKNVIylRscSkmoB+8dYx+K3h0w7zejHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lasIAx2FZHpYhebXF5w/8Z9aBlIpIGh/J/GvFMftw/E=;
 b=HowvIQK9vkSCUPhk6QNrV+LHPXCbOt6D0rozfA/baX2FX0aBLFlCuToseBGqPPANgN5wBsuYwblu4eM8lIsAevhJ+Yupy51UDpuOHDbYCCQZZJJK/6uhGNwJUk7kQ3W4P5oLyp3lSlWmA7cjea6cnBBQ5jmgBm9fKIghxK3j15QcufZJHzcrvXs2cpyxmpqJ0mdL6pCg4Du4luBaatbbzXHF6a6ejmcpNdImbbvfSVQK/7xuf+n4Pc1SupfCZm6EhyQtLFHpF1oYUVjOndP259XlWXCWiNmtX0Rdz3glbMFdWM2VJJMCg3VclhnMJOahRATsjQpMTA0ROoQfGfX7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8051.namprd11.prod.outlook.com (2603:10b6:8:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 21:24:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 21:24:12 +0000
Date: Mon, 8 Jan 2024 15:24:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: clean up type of GUC_HXG_MSG_0_ORIGIN
Message-ID: <7vb3ql7z5dac3kwo7nhibh5al7wemt45ibzuyk4bpyzpltzjml@go7rtyq4m6hq>
References: <ec22d742-632b-426a-ac86-62641a38c907@moroto.mountain>
 <e5g3qkwvc3sjfpxcdvn43fiwbxthpblqgg2getxpbkd6g4lp5k@pgfm75tsg7wz>
 <84a5c289-e2f6-4e30-a093-5a1c5b335057@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84a5c289-e2f6-4e30-a093-5a1c5b335057@intel.com>
X-ClientProxiedBy: BYAPR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcbb7e8-48f1-4878-b02d-08dc109028d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ByIXKWLc6CUAiAyh/fAg01zyFDY9T8EbJSMzSoJrhMGQDjHk1mHy2FOXsl91aKgps9hpnwFT9P5wPnvx2NgX0BiFJ/vFs1bz86JCuBTQTCNuno9vNdWwLhDhEN2O3QwN6LzfMuxD4hvTjeamfxUsxvAabsSNxS8FmNNUlFIopA2B3gEi3RWyyxU0Bp2e6gz2OVAF3q9ElFn1wePQWgNb6hAIbQ/eba96d/MvXE8aiK7DRzf91cgBC8dJxYxw1i26nobQ/4TX6Mkd3kP0LGm/+eMiaRX+ZhIA2h8A6ySLBXcs+EVLvOb0pej0fDhzGeup0BBD7+RzoJ6Rlo3oQeN15H918YNvZMci3cgmBio3E/jzU5vL6aZxsQPxNp03bbLdv0YLGC1JUwKQXjOe/+FfSVbkHWjCEesc2ySAIwQwpy8W27J0ssTsFusOro50rFVnsCmwD4VZkTNUW+Sp4w6gRpAsh37fNHlBmUbP20lF6/RXBpiM9WosvkJ2E2y5P7RitkjnffW979LXHK/q6BQvtEdGcCT6vPN6KN51Gq8mK2UqiOm7CUmLN1yNr46yEt9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(82960400001)(33716001)(8676002)(8936002)(38100700002)(54906003)(316002)(5660300002)(6862004)(4326008)(478600001)(83380400001)(6636002)(6506007)(9686003)(6512007)(6666004)(26005)(66556008)(66946007)(66476007)(6486002)(41300700001)(2906002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8154ZlYi6YIG5M5rZfvxIg+50oRFGQvkxja0lUS46JORKbacVmae9rLsyo?=
 =?iso-8859-1?Q?nxa9sfsv6zpOWOLUDkeo2AT1eK0Sd9I3qGYUE4X02lGTdWWm4iEkbyEDzz?=
 =?iso-8859-1?Q?TRZ8LKrU7m7a/8ZsDx5bP292+KD35nsFFWRroTyLaERC3gwFjiTRMmrUWR?=
 =?iso-8859-1?Q?HHz9I3Rj6IjwVGiDdrC9w0snBtTaYiPdc05lEDhW1FaJlbkf1AME8vgSnB?=
 =?iso-8859-1?Q?4FNVXbk8p0RMhg1oA39XoevARS1/IwmO7o7IBlB5ypd4FLvOmts7vLG1Zy?=
 =?iso-8859-1?Q?eLRyC4V5yUthHrmQGCdcNy6DTEm2RelNwItJDO/minZcuJ+XEHCnMklrn+?=
 =?iso-8859-1?Q?5JYrAasVKFkw1PhL3tePk/W09+vFAVEi9XO2ATtNHpU4tXL3PmlubMtndj?=
 =?iso-8859-1?Q?ehDlm9IOEkfTwO3JjUZwBW8pSShYAb+wgU+muRD2pygU00u+a+GAPCTD7V?=
 =?iso-8859-1?Q?rvdzkAtnPmgarGvk/Eo/n6rs6Q5ssfFXsPgLPyBk8/DnxvncckaK3ZtpLt?=
 =?iso-8859-1?Q?EXEID/ebKNlP+nuL7z3O5EvW66PY6ljoM35niLhShAHsBjBVGuvYMReXZV?=
 =?iso-8859-1?Q?yk/fuZMNkpLX9oWpqrSWoGOvZXqQj/0CNcuAl3ZjyKbYO5wmgONXYiH5Si?=
 =?iso-8859-1?Q?yoOtH5HNPlljIFBhSIl63nRSuXtPAZKNnc2NPyWHgo+HuC/nz26GG3N097?=
 =?iso-8859-1?Q?Co67yq0qLNgUhyQMJhFJEXP9RADgDqHPVxkJNhf8D9JMAPcCI1aWnjK7F/?=
 =?iso-8859-1?Q?WFUnPNB7pBEg5OWCqEBDPQVMvuCmW0wA7uf7YO9Qz3zsxvIPvKPgE1FF8P?=
 =?iso-8859-1?Q?kgjU4a7yMavwYgfXXfKWyEM9ftGnUq6+1TQRtcgEItvZ+RvwYtLRG3TjvM?=
 =?iso-8859-1?Q?g3KUwygWoybYoY2NuNkswBUK7cGq25jYeVfe7ZwqzJNEPYoUrG0Oh1U4Js?=
 =?iso-8859-1?Q?g8UH14QybkUWZCse5i4CEYQX8dCJFtRN/+l08gQz8NehIemrUkWDSWOGR5?=
 =?iso-8859-1?Q?+KGBm3yMJ6d+pRZ8KSyElXWUis+Y9VUd70RXTi55z5pVBsARK/2KfUr6Ji?=
 =?iso-8859-1?Q?kYTLeCzBp4WFCDcLVEhOCgn5+sZuTXEjR4UrRG6AVSwVmis/WYUqkpfshV?=
 =?iso-8859-1?Q?URKNNkc4pvwxce8uSMNQ4dzC3U/7SSw1P7b/1NEIkGEDrhYVAAeGyaMLRp?=
 =?iso-8859-1?Q?j/T7hgcbJCTfj27i1xtmwxHpif/ywNknlyw6/jYz4dgQAcqm7Q2hFSPzG0?=
 =?iso-8859-1?Q?9H7lYKyTF8YphgiQstm6OYuPVBvFT9Cm6kLP36iqRZAosoe+Ppa/i31njQ?=
 =?iso-8859-1?Q?Jwh8JZMGWuyQF1XHGVHfSs2kuHbsCPU8vgQsRQ9WrcIdUyMDUGux01SfO1?=
 =?iso-8859-1?Q?U3+DrchV0hCUmAwRQnEo0XX0Jm8m4+ZQk/A1JDag1UwFJtU5fpQBX8j6oM?=
 =?iso-8859-1?Q?7kXAhr8W90Fcp9DyWDHkaENdsHJnYgBq35NB9adeCG9W0sYUZJtv3dFkui?=
 =?iso-8859-1?Q?8qewxDdVuMvxnZul1zGwDJwDRJdIRoLR+LP9sv03fgcKHE0q8fvz1Z020h?=
 =?iso-8859-1?Q?gRptReC3LoM/IeU00rPv2NHMd7NaZaMZX/3NP0V2XhYDRUZ6ShVzKWAYiR?=
 =?iso-8859-1?Q?qKqx2TChHzlWaDNLST8WIctcMyNwxl4EJmD44/7QsXO5aS64lXReFfAg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcbb7e8-48f1-4878-b02d-08dc109028d8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 21:24:12.8299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liggtMur+9K9iq3hyZl3wLaVGLrtiZVrUkZirDefq2GEcf6Dr8P+xY4rSTk49/JoaQ+Xccfgfp8flmeo28sbolz2n/UPr6jvbaupZEXpjUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8051
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 08, 2024 at 09:46:47PM +0100, Michal Wajdeczko wrote:
>
>
>On 08.01.2024 15:07, Lucas De Marchi wrote:
>> On Mon, Jan 08, 2024 at 12:05:57PM +0300, Dan Carpenter wrote:
>>> The GUC_HXG_MSG_0_ORIGIN definition should be unsigned.  Currently it is
>>> defined as INT_MIN.  This doesn't cause a problem currently but it's
>>> still worth cleaning up.
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>
>> it seems there are a few more places to change to follow what was done
>> in commit 962bd34bb457 ("drm/i915/uc: Fix undefined behavior due to
>> shift overflowing the constant").
>>
>> +Michal
>>
>> Could we eventually share these abi includes with i915 so we don't
>> keep fixing the same thing in 2 places?
>
>it should be possible and I guess we should plan for that while
>discussing all this new xe driver...
>
>anyway, what about creating new intel/ folder under drm/ ?

include/drm/intel/?

>
> - drm/intel/include/abi
>        guc_actions_abi.h
>        guc_klvs_abi.h
>        ...
>
>the only question would be what prefix should be used for macros:
>just GUC_ or INTEL_GUC_ or XE_GUC_ ?

if using a intel/ dir, probably better with INTEL_ prefix

>
>then we can also think of creating library with common helpers for GuC
>(for encoding/decoding HXG messages, preparing ADS, reading logs, etc)

with the other differences we have, I don't see much benefit,
particularly as it won't change for i915 wrt supported platforms.

>
>btw, we can also consider sharing register definitions:
>
> - drm/intel/include/regs
>        xe_engine_regs.h
>        xe_gt_regs.h
>        xe_regs_defs.h

same as above, I don't think it's worth it as xe will keep adding to it
and it doesn't care for all the previous platforms. For those files we
may eventually autogen them like done by mesa.

Lucas De Marchi

>
>Michal
>
>>
>> Lucas De Marchi
>>
>>> ---
>>> drivers/gpu/drm/xe/abi/guc_messages_abi.h | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>>> b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>>> index 3d199016cf88..c04606872e48 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>>> @@ -40,7 +40,7 @@
>>>  */
>>>
>>> #define GUC_HXG_MSG_MIN_LEN            1u
>>> -#define GUC_HXG_MSG_0_ORIGIN            (0x1 << 31)
>>> +#define GUC_HXG_MSG_0_ORIGIN            (0x1U << 31)
>>> #define   GUC_HXG_ORIGIN_HOST            0u
>>> #define   GUC_HXG_ORIGIN_GUC            1u
>>> #define GUC_HXG_MSG_0_TYPE            (0x7 << 28)
>>> -- 
>>> 2.42.0
>>>
