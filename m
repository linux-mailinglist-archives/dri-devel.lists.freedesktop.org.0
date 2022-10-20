Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1AD606C30
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 01:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC9310E451;
	Thu, 20 Oct 2022 23:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C31A10E072;
 Thu, 20 Oct 2022 23:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666309681; x=1697845681;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZUN1WEqrBdqyjZ00MSZ9FoKRkJNXUkjI7KQlQVtcnsk=;
 b=Yq0gMizWWsPU/uAfmrkAShsaj6vRtgV4vAbRncqLd8Of9SjXMLZ3Sf9j
 LLpS66VW8iQ7JDuAD/CmalC9Jn5uNNu4R/boke/AfmRBrLdvYY76BQPYI
 tC3/vmfV8TH7t2mfTonuK9rhD7drm9U0lUFXFAmWQGLiHnUHu/qcTKrl1
 6JXRSK+a0iayC9+AgqS+xZoBAoewMhd/wwGYARX6Cf3rV5X5jrD6wHk/l
 ClsTCNGw03DY6Hh17NzTsOowAfCZ7c1h4B6JIHdgbBOo4muUQBoMH4pRS
 gbEJdT4//lpyIaS0ABvRdJpyimmNwsh0CtOjmPWw9IcBFr2/2l3BT4+vB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="371079544"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="371079544"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 16:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="632568458"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="632568458"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 20 Oct 2022 16:48:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 16:47:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 16:47:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 16:47:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJ04ECNtDJ6yhEGDyVEXYp3nphxuOnymM+SoX/rKAYLE/wwBdMTQ4pnKSNRnQiQbUfBjnEd/AFI6UHhU1FwfZO8T56pWfDLCuwi/+IjVK0FtWE4XBKW5IHB+fzougNvfl7nH4jAfN/OvFkw29um04kEL1OcHfGx4XIKbjPUU0O7JdA+HVyEAjAP1Z3pxGitVPxMvj1uoCtMaEbLG7ghotic0ZS6whAO5Yjk6gwxxUUnWjH0KpbTnhNzXzS6hooFbzTmhg3hXRbeHeboYxoROwxx2PJeinGUGabBlzOldG7+ICyNjrI1uUf+je+Nae9zEZ22YRzGYNaclkOO4RQg2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYRkagJiHbYTlmDSGZD11+b0sKKz6nZItZGc+LE0KNs=;
 b=eqFoBk+tWT3fE7HrXsFhy41WndZn+U3i8PwcVNB66LD9BY+shtqCS5XTOrW+kpCYr+EgB9cfovbdvVy4PHQTrpUU0M4sujD+KMnPMyo1NRin8LoywVKFIc6sE+PRWrWhvdVZkCBNcnZ5rs58OYP+A7g4iI18q1Bq6ZTtKsv/EZdQavyvbmTRq0YlngJKQBIH+01eoZO4CwbFdp4v7HuQ1keDTDmoMkU1Xxbso2pspBxkBBL6Pg9XM6cQ9fNtVqHsYbIYXWqLMX43S0vyWt+co8VHuMUqhs2Jy0+gDW5bdp5bxRo0K3gzEmyqQjN7ag6/RUpS6NXfL/Cb73QioIZrUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5470.namprd11.prod.outlook.com (2603:10b6:5:39c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 23:47:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%3]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 23:47:58 +0000
Date: Thu, 20 Oct 2022 16:47:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] Random submitter change in Freedesktop Patchwork
Message-ID: <20221020234755.ycj35ipr2qyabprm@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <878rlaqyc7.wl-ashutosh.dixit@intel.com> <871qr2h41x.fsf@intel.com>
 <Y1F1aEIbdktSYpPG@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y1F1aEIbdktSYpPG@intel.com>
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b41cae3-f15d-4bee-29f7-08dab2f5840f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWuoQvhEVGfMxNKLr+pf5cLmuufN+P0csCja52LOt8u4THJsH1iPATqiMR7bsTBGnLpd0Kt9IW6k1ZkuKpyJI66OQPczPWK3RonkpjmX7j2zlb/arGzjBOkJ8FmUn0nhdu5vncS/TkHoZz7q1n1TZLTctHhTS5vgcilVXGyyczLloDPOrYifsviUTA06aGiWc0i3gKLRDVkD53YPUfFOo4FMJvXp25AZccJW6XZwJk9OpDe82Fuef0afHCt/xX4uyN98j+MTjGJfPIT2lEL7jgBJxFpOf36t89WOKhaQ0A071y73BWe+RXWK63Kj5gmJ72w2kFDU7KVoCVON9nSr+IjaDNP61edwOnnGNISNjdZ5bCaKdTDc0XnXkDjacPwXWKWxeO96+ko7YyzBvXD1vlMbycBUeKXZJJlmQnpKkuRCp3cM7j6xihrWJASwZhx2pY46VGjQeJV+HHbeXq1TPW9VDMDDsVDgZ9pXI6r5/FZqFUtyurI30kiXFPQCIi7MEVUxdXpEMAxS8qjaAY3i33zyHWCJPmA1Vi2w3VdTi1X3XcC/KecOwuvzCuXFFN8SIfoSkDwqxiPApi13hEoM6ZOyEPWr+G9GGt3Q3rt+NDSQg02gtmq46PADrGkoHq+bZLLOe0bMQL3YGnkzSYhOqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(186003)(86362001)(478600001)(4326008)(66946007)(8676002)(8936002)(6486002)(41300700001)(54906003)(316002)(966005)(6916009)(6512007)(66556008)(66476007)(38100700002)(82960400001)(9686003)(1076003)(26005)(6666004)(6506007)(83380400001)(66574015)(36756003)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wobAXS1c7n2H8PvAyEgZo+3yi/8GEEssF8fk8XsNancrafeT+sJagE7+Nb?=
 =?iso-8859-1?Q?NFX4YSiMHXb9JV9y0XxH6bjQbcSTHcO2AXlX/mfqhbRaT7xkZau2bRBfVs?=
 =?iso-8859-1?Q?kIJW/d1x+O9jrkgtrk74m2VbFqreMLtkJivHvNU4ixAgz7sgNLFzkI6c54?=
 =?iso-8859-1?Q?boPEinJow6DJ7jyy8O0A7cHC+XdEE0Jk1OJwukh1gk4seqQ4rU9h5F8RSa?=
 =?iso-8859-1?Q?S3qvDU5rX5WTfGXr9eSgtExH1EP5dwaJ95wFlEz7vhR1rr/nI4ka/K2yF8?=
 =?iso-8859-1?Q?m/M/FqfJUiGLoxpmGGNY3393xAJtnSRs0RGQFjhVnkSBx7zeVqdsXY5bX2?=
 =?iso-8859-1?Q?t2ASrs388a78md9uen0PVpbYDNpdKdm6v/zCI8tstCLBQVyxYrlqRW21C6?=
 =?iso-8859-1?Q?VgPHaePGr3RbVuYttjENBTgWO9RqZ4EXW0GTXX2ASfkDMfSzX0ccBRMZVi?=
 =?iso-8859-1?Q?RrrlMWnfoMjHiM5H7ICjBhQL88yRKz8DbygJff+hFv54XzzhiNXzFHpj+J?=
 =?iso-8859-1?Q?4HL1T9zQVMQ8tQb6Vo6DIhlS1k3PEooaoq5HrWQ9gOyok+qh7UsTpgcErE?=
 =?iso-8859-1?Q?9PTzMlSPTe/rFGGWYQBVeLBN5Ah82Ul2Rwpo8gai3zo7N55biZRKjHU8dD?=
 =?iso-8859-1?Q?C3yt9FYiQYaZkSHeMlcKBpkkThEpORUf0EllmGSDAA1B0o/KpaeHN66bCT?=
 =?iso-8859-1?Q?sF0889gHfwAxHBEtoh+3rh6/6ro6yZ0/bJLxPVlQ7Nxnk2ead9Yk8Lc+cw?=
 =?iso-8859-1?Q?CYY3UA7cjw5qnESTFCcohV8FCBpvUKCIaO23fccyBoazWxlgB7jlyPW3Dl?=
 =?iso-8859-1?Q?I+Gjvie6cYfuvjgZnZh9YZIAUSKMLXUAohlYh+TeDcnim1Y5GR3wo7tgHN?=
 =?iso-8859-1?Q?EE2j+dneLuA3061M2srJzvuqdrZM/A6yXbTSy1KeJOZPfUaMWYe1LebmOU?=
 =?iso-8859-1?Q?6GMG21nkH5efaJOLZ+YcHif9MCwi86Gcpiwu1u9ONYN9mQrKMF4F5PjnWU?=
 =?iso-8859-1?Q?0DFfPE+g/djq5BQK8XXBldlbmLQaolS/e5N3FoDuZmfCulT71nimes+Xkm?=
 =?iso-8859-1?Q?f9rkCuIE/ikXfs7CoaoZ6wn8INdJBbaxEOVslVayThLFD2zzJpU7GulS1t?=
 =?iso-8859-1?Q?Q07pdrzPWFL8tAiPoNnUq9gp5k5pgGJ7fiKM0yMhYCjQsaKWMbCamckS7F?=
 =?iso-8859-1?Q?Dq2mskerEdrz/CrnN7LherzhQodEea1PDI3AUh5M3rEasVYHarClgTV5s4?=
 =?iso-8859-1?Q?aAgjwH1MU8cJgtDcZBBu1VdGRa6GeVWpsOdo4BiNBNf9fw7DndNWLAa88J?=
 =?iso-8859-1?Q?Yhe0AY7fZdVy3w8Jzv6mBDxI82sNnvXuXNKFEHMYCPkcVdgqtUSul3lfRa?=
 =?iso-8859-1?Q?fimsmpoM/yBVy6RkSflN8xZArz2emqZoJEBtbbHBmV0ZYLogGraM+NgUrp?=
 =?iso-8859-1?Q?4MbHFpEK0Pkdq1YUwbyuGx0EqpQjcyrjYwrMUYa8kCSOkoCo6yUyiW2697?=
 =?iso-8859-1?Q?hFGn/Nt3nVx9MYAMxWQ4GwjQtXyC8FxlUWoGfw/80dRX0p/UZjo1biwPqp?=
 =?iso-8859-1?Q?g5xH1bZ2QZlkxo9cIhRfn0tjJCtIDMHXhi09nC4gkB4OJr3DPEidlrcdr1?=
 =?iso-8859-1?Q?UV7c59XQ10YdjjhHkAKpldGb6WEMYtP8ApeaR1qf9+yA8CE2wAQ/aDaA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b41cae3-f15d-4bee-29f7-08dab2f5840f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 23:47:58.0539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UlXu+7mhE393et982HuzNo1QY1w4U2qd0sUEozWMmQb28LkjhNHkB8m0jpE/ssfmzVRIy/seb7gwEbKLWlnXucoIRXEdp3n+SlL9kZ60Xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5470
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
Cc: tomi.p.sarvela@intel.com, intel-gfx@lists.freedesktop.org,
 Ryszard Knop <ryszard.knop@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Karol Krol <karol.krol@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 07:20:56PM +0300, Ville Syrjälä wrote:
>On Thu, Oct 20, 2022 at 07:07:22PM +0300, Jani Nikula wrote:
>> On Thu, 20 Oct 2022, "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:
>> > The freedesktop Patchwork seems to have a "feature" where in some cases the
>> > submitter for a series changes randomly to a person who did not actually
>> > submit a version of the series.
>> >
>> > Not sure but this changed submitter seems to be a maintainer:
>> >
>> > ------------------------------------------------
>> > https://patchwork.freedesktop.org/series/108156/
>> >
>> > Original submission by badal.nilawar@intel.com and subsequent submissions
>> > by me (ashutosh.dixit@intel.com) but current submitter is
>> > jani.nikula@linux.intel.com.
>> >
>> > For the above series I believe the submitter changed at v7 where perhaps a
>> > rebuild or a retest was scheduled (not sure if Jani did it and that changed
>> > something) but the build failed at v7. Also note root msg-id's for v6 and
>> > v7 are the same.
>> > ------------------------------------------------
>> > https://patchwork.freedesktop.org/series/108091/
>> >
>> > Original submission by me (ashutosh.dixit@intel.com) but current submitter
>> > is rodrigo.vivi@intel.com.
>> >
>> > Similarly here submitter seems to have changed at v3 where again the build
>> > failed. Also note root msg-id's for v2 and v3 are the same.
>> > ------------------------------------------------
>> >
>> > The problem this change of submitter causes is that if the actual original
>> > submitter wants to schedule a retest they cannot do it using the retest
>> > button.
>>
>> I presume it's caused by me responding with a review comment that
>> patchwork interpreted as a new patch in the series [1], and changed the
>> series submitter too.
>>
>> Sorry about that. It's a known issue that I sometimes forget to work
>> around when replying with diffs.
>
>I just permenently stuck a 'my_hdr X-Patchwork-Hint: comment'
>into my .muttrc to avoid that.


https://gitlab.freedesktop.org/patchwork-fdo/patchwork-fdo/-/issues/46

recently closed by https://gitlab.freedesktop.org/patchwork-fdo/patchwork-fdo/-/merge_requests/13

so maybe it just needs to be put in production? +Ryszard, +Karol

Yes, I also have the X-Patchwork-Hint, but the main issue is everybody
would have to add something like this. I don't like submitting something
and then trying to find my pending submissions just to find out it
changed.

Lucas De Marchi

>
>-- 
>Ville Syrjälä
>Intel
