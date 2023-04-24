Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9750B6ED30A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 19:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B356D10E1D8;
	Mon, 24 Apr 2023 17:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D18F10E3F1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682355701; x=1713891701;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M3PFv4Cwi8a8pD5XmGf7aJef5fBaPjMpe08udCEvdNc=;
 b=KJaCc/PvN/42L56WmghyYwMetpcrwgxB79MdO61jHx0RpWNu3i2RtnSe
 BPO2P3KHhOP+LFtW0GIaUqz3KSeOaTQSLAV1/lLoTVsb2Qsd50Xti2uj8
 ZgcglS1+yPh05Cl8IqBJsmwcYK54dsGempw5HRmiootGYZnEhf7QFS5gL
 cs55wX78wDTQPz5OGfez+hmSKjh+ZVt3Hxqd3FdyKviVSjUfx5pE8OzfD
 0iVD1pzh2hPwrinV1leqBK93GjjBVZgQmVmb/c34y+0Oskg6eFEyXV6BV
 nZZFZSixNvNleaG4f/qMm20GkxXsNPmX/VUYwrO6LbBaXvyXgLYwWUUFk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330707810"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330707810"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 10:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="1022791046"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="1022791046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 24 Apr 2023 10:01:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 10:01:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 10:01:17 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 10:01:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecgG2cYAmZ+LroktObDVPVxL6XgzO/DV2RNTWAz9JIx5u68SMW6jPAYYX/nkYISOGoDLPyW4uPPF5Z9l5IIF4S9aGnCHV55sG4No7LG+gYQ1jptsEAlmyPU0OUlj6Dx/WMHwCRMAQl/rRSFzbS6YdrQorEZBizHNCK7nlBkZr9PuVRCKNR6WbAk3Vy6XSVwOALHz1/0hXxAxSSywYkpIKsYXVazvOpF3CWI2++PXzmEr9k/sS/he9xj/5FJj2dp3SQNpVc8fm6HIs69GThGnsCM6U3yZRCxgABD217jhsBX05X6WpQCSCjCI7ACYnIFzCbQ6Z+/s27ws7WtecFexjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDxp7ox2xgUlQ0IrTcFmENhsR67ekJtRlswD3vVJ+Mw=;
 b=J47TBSnwZBbGCKPZNM/3QBzsnh5bXW+MQOmqZ2ttZYh/8Fl9MJdmlwTB9WWR+xohRYtOFojcgs5ugMvFw+SLoMPjYdOKSMlgYEZj/sHxGPiSbHjQx6l2goC2QJDMn8ej7lieZv+T5n1sHvF3OTxJaDizrG2hxXZvg/Jo2cwaGHcN4IrpKJVTdZUPklwkxjji3fx3pP5QTuMjtfNIl0MAQTsY3r9FLf8CGhoCI1M86D/RZbT+BDW0cbpv+8ktXYpmq34KVBQAyBsdH3XVFwgB76wUfGxnACYKJaTgFbCNnyWNE3tsGTdDMJkmHF9Vwj1lCLbSvKN3lnGbDd27UVgLAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7129.namprd11.prod.outlook.com (2603:10b6:806:29d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Mon, 24 Apr
 2023 17:01:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 17:01:15 +0000
Date: Mon, 24 Apr 2023 10:01:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] modules/firmware: add a new option to denote a firmware
 group to choose one.
Message-ID: <fsleccud43leoioli6bj4xoydwbdcjb5qr4denuf6morhgtqki@t6xya2mygon5>
References: <20230419043652.1773413-1-airlied@gmail.com>
 <ck2dzxvllhhh74oa3vjlacutc7rdmgl7cfrfq7vgx4w3jcufrz@7jbgxcat42yn>
 <CAPM=9tw0Y2A4DvuTHT_yd58Eit+tUmo63pbEOHwRJ66LeqznEQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPM=9tw0Y2A4DvuTHT_yd58Eit+tUmo63pbEOHwRJ66LeqznEQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3a5dd0-a6f7-49ab-48fb-08db44e583d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dVVQZO8MxRBgyfyfoGyOS57Zj1ngOMC/7HfTKs/A8zf1n2MWKsoBt2Z+yFe3cX3EnnJg5abGAxGi05yRugWPgyK5XVXRkYeAq1cxvAFHPn1LSQcJFqZ0wNwctBIGoSDpCnXRmATPVrKP0zq8DKT/7aq2LWQhHbDF3bCGjGugnlVV/5bNCPFIdu1w8eUn0kZfsJAOSd32K2JjFqIajrMryeGbar7gmmSxV98AVBf/a+ImGzHPYEm+dr7HLOILXllX6WjmZqkZ2oyDjjzcpodT9f8yhUvSZZzorXxrbutWaHcuDJz2qNo4LmYN3QT34yXgsGHKZzI0gNOlGx/Dts7+VZW+YlNEU96aeLw8uKvfQoCzMXg+tmp9zlZMnHFLIv9vkuQk07luLdFCAHfG5MF/aPvJDnOoGnLtu9++z/k0Yar3zl00dHOkkk7rjnz5yrUsIxUaBu+V4OHrEUSF/VKYCh2zu31wkIau/4aTmfkdiVBOo0UCPDIk2PSw9bpM6DfstLZ/MnXcQWjEvfjTYECHkqyyK2RHjcMVbJH5gdKbyo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199021)(6506007)(26005)(9686003)(186003)(4326008)(66556008)(66476007)(6916009)(66946007)(316002)(478600001)(41300700001)(8676002)(33716001)(45080400002)(8936002)(5660300002)(54906003)(6486002)(6512007)(82960400001)(38100700002)(2906002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0lnDFpeW0nb0wTK4cZRoM6AAE43oBxRaUsWy/N/p6x1S1wpn//8zYKDFsSXB?=
 =?us-ascii?Q?1sqybIneg7bwz16AEeKpm74u8EpmV8E+ntpLXaMMKeH1qp6urLBE87n4A6Dq?=
 =?us-ascii?Q?YTk0JphDPNMDijldf+fcW+4c+cMAa4UeAodoAukinO10XneqTgifWqCxPXu9?=
 =?us-ascii?Q?wW4wj6rAQccUK8KSYS6cfn0iVW9muHeC8YXVcL83IpiPZju5iPJeZW91zSTd?=
 =?us-ascii?Q?U+Um5A67w2XBfQO3TRr+cLUGav93ti4ocr+fvRcwRRwO6rcMcLBlMm1Ldn6t?=
 =?us-ascii?Q?P4lmiOdLeSZNgqMJibOkMSb2UOSy1PpluFkHnS8D8ubIki6paMdkVYD2X+KO?=
 =?us-ascii?Q?znaw5rtpHIyCe01ClGZYAkz4WgGPs+X9koQnQU3SptgLjeujrHnI0vF7bsDS?=
 =?us-ascii?Q?Vyc+GLydueq+wgwWkRbOSeYXf6npAcGzc++3KpKwB57UlECkzZsP5gAM5w+e?=
 =?us-ascii?Q?Teeybl2WEISTHTwmYDbZo7kR2KGifLtlbdOKwToZgC29LZayDTqzLZ9kLPOO?=
 =?us-ascii?Q?LWqv1BiJZCnQgQaVUaxk1UpEcC/5l/p+nL0WmUSrFHIHDi6nPR4zOwj77Yc4?=
 =?us-ascii?Q?BdWX/sNLF08H4hlCbBsji8OAb1+Av2RL95jOZO4cbz9xvHmO5ztkKXqSwAy4?=
 =?us-ascii?Q?S5kVhPEfslg4kss92s3fO7NWvUIyBWcoHEImDBpcQFkSR8AvfGN0KzSciv0e?=
 =?us-ascii?Q?ObjmMlYZHpoFUlFdQcwQeURWi0YfgDiCXQk1NCqYbxVzlrrzyp9VTGMrnYI9?=
 =?us-ascii?Q?ppu3PrO9gTlEjB2HozVVyEuen+OHu9q3q0FaAkwjpAfpx29ofsKVy3fTosup?=
 =?us-ascii?Q?KXrApayAZH6pyt/zkrOxNdDMaeOGWfJqxcajGWsWXw9gueWoCrhUebVPNP7n?=
 =?us-ascii?Q?ecKCEEpP8Au8jna6manMQTLzEpa335TCl8SsxwvI0HcxwbGf4SlkPYj8f9uF?=
 =?us-ascii?Q?HIO9NH+L6qiaTlf+6JL3glGdoemjg3ca3jL/Fvgcuy/M1CMDBBuy22nREEmS?=
 =?us-ascii?Q?vXGatZYJ/Z7D7XeFhCs//keGJ4ozSgCyvU/qeSgyRxYhJzb9y5SGi2qEpsJu?=
 =?us-ascii?Q?ibPmo4iCgsTmFGWygmM+CrR+uFjjvnuRlU647bMe9yP4bXLomXyDVOYSYFG0?=
 =?us-ascii?Q?nsthrsM+syeq46k2moAlofYnxFQYb/OAVTIr5w1039HTZh/Vugp9ei0jdUlQ?=
 =?us-ascii?Q?ZaD5am7psFXrb55MvAlp/xcAONP0pKSMPLubM9CtYoA9LqYHP8LVCPOTBIXQ?=
 =?us-ascii?Q?OXiMnBcRs8CySej9oIMG44f6VkKT/lzBkb1Fpq9k8TWTB8Hk8mASY1sjcprC?=
 =?us-ascii?Q?2L8LWhuVcogDpLlnMc74f2U1MN/4LSEudphoxytGUuV3viyMf1/87UwdVGtT?=
 =?us-ascii?Q?/evBjOE11SsrxEDNgwpY3M0lXqjKuSBJC/qrHrzw+MoIpkVIdov3wfvS6lXR?=
 =?us-ascii?Q?oySZQRyWKnBkkIZgIikepuRRrvWiLmCPuOqCs96kZ8klhuf39RC336+MSAc3?=
 =?us-ascii?Q?Fn6rFjIuVUffz6SPXR1PNd4WM0Zb42VI2CGdjPGU3c9QCX2hfzdmXkNK595x?=
 =?us-ascii?Q?VjakyE7k0n/Fn57e1RZXIobRVrbl3hgX5wkdqyy8TZH66era4soi3dsI+Q4M?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3a5dd0-a6f7-49ab-48fb-08db44e583d0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 17:01:15.5283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrkrotFyu4dFql+rxKdIiXRhILYXDJflgnNuw/LpO4XE7WJgkCJw4BwfxoxhQvIOxrJtkvwCPBl9Xh+3LhjI+HHK9U77Him8OwYHgcG1cVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7129
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
Cc: Dave Airlie <airlied@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>,
 linux-modules@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 03:44:18PM +1000, Dave Airlie wrote:
>On Fri, 21 Apr 2023 at 05:09, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> On Wed, Apr 19, 2023 at 02:36:52PM +1000, Dave Airlie wrote:
>> >From: Dave Airlie <airlied@redhat.com>
>> >
>> >This adds a tag that will go into the module info, only one firmware from
>> >the group given needs to be available for this driver to work. This allows
>> >dracut to avoid adding in firmware that aren't needed.
>> >
>> >This just brackets a module list in the modinfo, the modules in the list
>> >will get entries in reversed order so the last module in the list is the
>> >preferred one.
>> >
>> >The corresponding dracut code it at:
>> >https://github.com/dracutdevs/dracut/pull/2309
>>
>> it would be good to have the example usage in the commit message here so
>> it can be easily checked as reference for other drivers.
>
>Good point.
>
>>
>> I don't think we ever had any ordering in modinfo being relevant for
>> other things. Considering the use case and that we could also use a
>> similar thing for i915 / xe modules wrt to the major version,
>> couldn't we do something like below?
>>
>>         MODULE_FIRMWARE_GROUP("nvidia/ga106/gsp/gsp");
>>         MODULE_FIRMWARE("nvidia/ga106/gsp/gsp-5258902.bin");
>>         MODULE_FIRMWARE("nvidia/ga106/gsp/gsp-5303002.bin");
>>
>> so the group is created by startswith() rather than by the order the
>> modinfo appears in the elf section. In i915 we'd have:
>
>The way userspace parses these is reverse order, and it doesn't see

the main issue I have with it is that it relies on a order that is
implicit rather than intended. The order comes from how the .modinfo ELF
section is assembled together... so the fact that your call to
kmod_module_get_info() returns a list with the keys in the reverse order
of the MODULE_FIRMWARE() definitions, is basically because the compiler
toolchain did it did that way.

It's worse when those sections come from different compilation units as
the order then is not predictable and can easily break with changes to
the build infra if the files are linked in different order.

I think the grouping thing here would only be supported with firmware
defined on the same compilation unit, but it's something to keep in mind
and document.

>the GROUP until after the FIRMWARE, so this can't work, as it already
>will have included all the ones below, hence why I bracketed top and
>bottom with a group.

well... that is something that can be adapted easily by using a 2 pass
approach, filtering out the list based on the groups.

I agree that yours is simpler though.  If we can rely on the
order produced by the compiler and we document the expectations of
MODULE_FIRMWARE_GROUP_ONLY_ONE, then I believe we can stay with the
simpler approach.

Luis, any thoughts here?

thanks
Lucas De Marchi

>
>>
>> MODULE_FIRMWARE_GROUP("i915/tgl_guc")
>>
>> There is still an order the kernel would probably like: latest version.
>> But then it's an order only among things with the same key.
>
>Dave.
