Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE43561FF8E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 21:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE5B10E453;
	Mon,  7 Nov 2022 20:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5CD10E453
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 20:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667853079; x=1699389079;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Uia35i7cerejbAody/vZsDCElWPr9eA1mlGBb8KEnKw=;
 b=iQyXiD+1661ZJNzsMFCxob30K9nrKKF3EHdPLLvtNht3XAe9FV9oMQXn
 sdUSWvR3aCBKOyRaodvfVjRW5uvt7MmqjnOo22b7/hEAnHDOIc5ScYx4G
 EJxP61wJFUt2HtBORlLTixnoLhQ/GxJ6fPbtzmj81/hLhbYMfBaffOQ1a
 RjxvO1C94kyr+4Zx4U4r7jvbw6QrF2aRdKCKsy00TmSaWwdXhBydP39aZ
 S2lwnXT8mQBQUjP2enMOiA5s5iIjgkP8TIaUShGywTsm8e47Vs2DEoxif
 Xj9N3Z8ULGvG4OhHUevTV4mCHEb3dBmqa02+Il9B/1ZwEUkDM3GnPL0i5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="374790312"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="374790312"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 12:31:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="587114990"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="587114990"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 12:31:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 12:31:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 12:31:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 12:31:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 12:31:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikNq7iPSyGpjlQnKVWF831NgWWEpP/F1+cBktQYdJxqbaV60lR5sMb+iSU+mEd7ru2RvV88je6nur6LwIpnSPBLKf4wl2XJKMDVaYE+2Nx2RCmXLAWon2dNtHRDa5mm69tEqWxYFKwzBHj0MoIlui0V34RS+Qy8hA5dH9iTu1cvPMRRaSHEoOUbeNSTgm30A+gIAaMHMv7BtMFS+nwmp388ohblqughUqzlLqgZhOTYDUdcgpW6KXXInrEFLhNADG8J9k6ubieudBpmedSi2dW3cXDn9tMf0OJvuWGRWQ5HM69qPNtZ6QmxcP1J/9MhS/2FMT3Pz+jgQjWFJKjpxFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFLt673Q8ChePDFM6HGq3tHaC/B6S/tupB2Em06VILw=;
 b=RNAFgO1DU6kiGl2NupUq4KOAE0q5d0aOvKiY7/X5Y1EgwjokoePwwC1aPsAYQknOXiNYcF06VwaZOvUc7Rs9YH38C9QsG1o2Z8LcqsZR7ZL/bSf5NGHoZDSsPdlXZVFPtto+7xTgEcNsAEtFLNBOj/PQ1sSD08qQ5q40BK3rhOmKgB6eaa8Li5eOeSkeLOcYPos80TY5lzjokZ0B9zz6d029uZ+++Yf3rzdzC8XddUIoiVXekYcmyXlFIIhw+xasJ71jjr34W/vEOrNpSAxHPXhSvoNKIKynlBTsDWKo7f7L97V+wPghvoqIEaU5d0/lxINR3Pt6eLEG5/OZNYjUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:21a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 20:31:14 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 20:31:14 +0000
Message-ID: <413ff283-4341-532b-7815-43956805526d@intel.com>
Date: Mon, 7 Nov 2022 12:31:11 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: linux-next: build warning after merge of the drm tree
Content-Language: en-GB
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>, 
 DRI <dri-devel@lists.freedesktop.org>
References: <20221107142949.516a9112@canb.auug.org.au>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221107142949.516a9112@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b2f36c-7cec-4bac-7f53-08dac0ff0433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtCg4WxB8MfOOmYJlZZ7lMnQSH4qVL9POxc84fVkWE9GnbT1y6dAnHNViohDJeT65ZuqyiocN8zPDuQd/Ko51gkMUA17oZgwq/3FEBFoSjgmxQ0cNw7Y8V6UcabTNn4c3GPbmvFl/xC0EXXDjw/0BXsE+S0EepPMM+p3CRUQmP6v64cbsd2TvOo+19c8BMV+kJLhQ+J7tza4TcXQli1RSlnfkIXCkuAnylSLTVjxhRbm+VNFZNwJw0fHUIoFoNeTaZO0NeXxFAQue+6bV5E6VSz/xCqt2bLV8hMAEomR8yvMZNl0flp7UPOXe6FkR4kCIEaZNk64Ls/UseRI4Fw+m81e40/nJxH1QrIkOJR2pgvb4Tns2lamrtk+Q3z7eM9tkbfKmwRqxwvR5xJvWcKryeIcmDzxqlAfkBzoOhfnjPKVahSovQH3Yg0X4sfbIdzQTOQfJzI+j0N7A0v1wNNFUzJtaaP0Ql7+LN1fGuHQpIv86zIGzhd3YzcK/m0PLGUTlnVcV2AYJwCF8SkdIV3eYjYCNGlByg5+1+fxW5UuDIrjZ8A53o5z2jphpAGxfdSyt2+HaG7ZCOm1T7x3mhQjEA17WxJ1P15ZXUkbfXO+M67S8sEBF4xzvlmleRDiH9xSwhOBmfLS7ia5cwbwE/cVTzjJF7pO0ju1O2jMgYivX+DTMc1Fot/TEMqoS1JK2/aeCitkcXQCzPbZBKL9yR07SzZIFV8Zw3AF6Bzht1xE09uqqAsfjZX/Tggi89Sf2PNJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(31686004)(2906002)(83380400001)(6666004)(36756003)(41300700001)(4326008)(66946007)(8676002)(66476007)(66556008)(31696002)(86362001)(316002)(6512007)(38100700002)(26005)(54906003)(110136005)(82960400001)(8936002)(6506007)(2616005)(5660300002)(4744005)(966005)(6486002)(478600001)(53546011)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWxFWDc3d1RncjZnYTNxeGVVUkJUbW9ITW91dVd4VFZuejB6M1N5T1VrZ0wr?=
 =?utf-8?B?RHVQdzFuc3JLTE4xUzJnY0IvTmMvdjlvdk0vR0lneEN2R1doVEk0dEpmWlA0?=
 =?utf-8?B?QWIzOVY1VS9WcWplOGRwUWE4STV6VEduWEg5VWUvZ3RucFpzS2dZOEdSRzBv?=
 =?utf-8?B?NzAzWlhFLzRBTG9GdXErd0lhczBtU050dWFadGIrbFUramZJb2ZQNEdkR1h5?=
 =?utf-8?B?V0oyNS9pdHhMZlRsSHdjOC80UnNqNWt4ZWhOVkdBY1lIY0VkdmwveHhJQTN6?=
 =?utf-8?B?TzVzOWtQZUI0MldoaW9QWHRLQ1crL2JHNU1OZElYbnE3S25jb0tTeDVDcFMv?=
 =?utf-8?B?L1J4anFCYlptbVN0cDRJdFBjS1pWWXVBL1JxNjFSWE1FMEFtR09tWWc3cXFh?=
 =?utf-8?B?bm9MaW5SMWdHN2c3YVZBKzNSbzhIV2QwR3BnbU9ncThnTXdRN2czNXU3NWty?=
 =?utf-8?B?U2w4TUxZelhSQVF5RkI1UmlneHdHZDluQWtPdlVuRWxJaXVkTCttUlpxLzZu?=
 =?utf-8?B?SHcrTjN4bjczRDBkeDdtWnRkUXFoZnFya1IyVkJCTUhQejBqU29EZzdmbE1M?=
 =?utf-8?B?KzJqSFlXd0R1cmVDcVorRS9ReWhYQnN6ZXlqRERvNHNRcnRDL0VzVFpOK2tN?=
 =?utf-8?B?S0NSa1ZXUlptRS9GOHB4QTRZV2J1MCtTN3FROFJGWmgzZzBibWttSVE4Z0Fw?=
 =?utf-8?B?cnlmbmhuYVVvME9EeThIRm9XczQvYkpGVit1SzYzRit3clVVR0xnYUI2MDZL?=
 =?utf-8?B?QnJ3a3AyN2VtdmFpQ1o5NnZiTHFqT0tiVUY1alRETEhBcnBOSDZPUDRUOXVN?=
 =?utf-8?B?NU9JQkVuQ1NNb0IxTm5yNEw5QWlOT3duMFBCcFEzMFZyOXFrNUVhc2JTOU5r?=
 =?utf-8?B?NFdNcGtVWWFwODhScmlVcm8zaXE0dHNHdHVqK21IQWkwcHBTWGJUMnQ2TEpu?=
 =?utf-8?B?bzd3aG1vdnJIS0ZuTlNPTzc2WDhqb09NcFovNmE2cmNIU2JmZ2NYcEdlVnJh?=
 =?utf-8?B?U0ZweTlLZlUwc2hoa2I4aEJkR2d0TCthcHRBdWlLbk11cTV3ZXJob0FtOWhs?=
 =?utf-8?B?ZTVOWW5qQXA3Q21yRUlQTlZtb3VQNW1pb3N6OTVNRTZoWXI2bHhKcE52ZHpB?=
 =?utf-8?B?b24vcitTT2hsM0kzNElDV0dlSkhEUis5WVZrK2xMTHlnOTVzRHl4ckVqUHQz?=
 =?utf-8?B?cmRwQ3k2bUEwcDZDL2dvYm9CaS9BTmExc0pETGk2Mk1uZGNpK2ZzNVRYK0sv?=
 =?utf-8?B?ekwrT2RkdHZoUko4NjFWNkxjU3VRUUl1NkhrdTZFQTN2VGhMWFg4UHlSOFRu?=
 =?utf-8?B?aHo5VUQ0TmlpZnNKQzlhazdWMjBkbGY0c284d2FHaXI1aXRIbWVERy80TnBo?=
 =?utf-8?B?alVUck9mUnlWVFdUN0RSWkZpeE5DTi8rQ2hycTlRdHNqanhPQ1VxUzhremhw?=
 =?utf-8?B?a1dBK1c0Y0thcEJQUE9FZWhncVV2ZFdlM2Zhb0ZNcWxETGcxQzhUV1U3UXNv?=
 =?utf-8?B?K1FmRGhIV1ZMd3ZVMGZBQTJES3BPMEJQeTJzU3krb2lQNlY5bituRStrNVFR?=
 =?utf-8?B?cTlGcDErd202WjBUUzVPL0p2Z2t4Njh6T0pYMGpYTzNiL0tGUEFHRkpjWW5t?=
 =?utf-8?B?bFRIZVk1QXFmOUthcW9tdE9hUExWZ3hoL0tvLzVpM1BDb1Q3WFM4Sk5NVEhS?=
 =?utf-8?B?SlA1NDZheHl3Z1h0MmY3UmlvaFBGNW5Pbm9YZ25OVDhmRjNUbUQ4T0s2anJv?=
 =?utf-8?B?Sk12dlRlc2JSZ2I5MXBJWm1XRkJDTytWcWtLMTBRYXNMcjFPeDVRTkluTGVa?=
 =?utf-8?B?aEVhcHJXUENhZFVZcFhqM2J6RWUwaDhKWTV3RkhMbGdRemZhWnBDcVJFZHdx?=
 =?utf-8?B?VEpFUlN6V2d5WWQ5TnFaOGNRclE4MmJYU3E3RnpBVm02akQxdFJsTStZWVlM?=
 =?utf-8?B?WjlvSXpuYXBGSGIyUTJlUzFOQjJranBFTVhpSmFUV1BXOUw5bkNSamtBMEc0?=
 =?utf-8?B?WVlhd0o5MXNKYzBrQWN0b3pJOWVuNTczdUtjek1pNlZiMTduNk9QN1YvV2Rq?=
 =?utf-8?B?d1llcXZTNUhGYlpMN1Q4TW11eGFLNkI1bVBUWW9CelRSeHdrbVlxbklrdzFC?=
 =?utf-8?B?bU8rcGFWVlAwa01Ja3lBMWZtZGM5RmJTdjRwZVg5Uzc2ZVY4eEFacW84bkhq?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b2f36c-7cec-4bac-7f53-08dac0ff0433
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 20:31:14.6961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBk04NYGREKROFxmeapyNNcJlcMNqVTDzbCpMSOmXdJSBckPCRSfWNU7fbi4BotlPGf0WAdzJ2HpfJkRmcVKL+cHunkSYN0y6QbXPN+3u2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/6/2022 19:29, Stephen Rothwell wrote:
> Hi all,
>
> After merging the drm tree, today's linux-next build (KCONFIG_NAME)
> produced this warning:
>
> drivers/gpu/drm/i915/i915_perf_types.h:319: warning: Function parameter or member 'lock' not described in 'i915_perf_stream'
>
> Introduced by commit
>
>    2db609c01495 ("drm/i915/perf: Replace gt->perf.lock with stream->lock for file ops")
>
Yes, a fix has been posted - 
https://patchwork.freedesktop.org/series/110633/

It is unclear how this escaped. It wasn't spotted in code review but 
moreover, the CI pre-merge doc build returned clean for that patch set 
(https://patchwork.freedesktop.org/series/107584/).

John.

