Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455C25AE221
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 10:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DB410E5DE;
	Tue,  6 Sep 2022 08:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFEC10E5DE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 08:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662451942; x=1693987942;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oDaSCo/+BbeCvw8L/UZbLk6SsOPSCc9OXF86I78qeWM=;
 b=J5SANXlpJWjxXkaofnZNUiEacz2hxi28mMXaSiE4Kyw4L5uOuV/DPdjE
 3ew4stCfIJMpbKrDGDz6f8w/n5Gyu0P3HXVgl1sFLpo2qAWBQNWWI5BPN
 er69q5Qh3azA1cpNWxgZdaa85EYtfCPahwSAEwr1jDEHYX1BSYEC4Hw/i
 Uasuzi9cG9Sx6uDs66fS0/1rrdxSfD8T17NEBQDWi+Wq8129wHuR/cGb7
 pB0RUhkYvBFi5vs3tJjlFBx9l+dG1ZJsJeKmhDbkVkymigIXrvFYyQCUK
 XjL2ABxnO5YgthAvlqHhlqAjV2XmpfLKyTp6S0LFtaTrBodLn1IwASx4Y A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="294119275"
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; d="scan'208";a="294119275"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 01:12:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; d="scan'208";a="565007455"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 06 Sep 2022 01:12:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 01:12:20 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 01:12:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 01:12:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 01:12:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ba/RL7FJKOygvMtLeLggW8BCo5pMquOsT71qKuJGWNEXTrgKfSvmrt80QvXmhsYTQFPHVk1ai/AyUHOM2tpOVvZTCEDd1ajatT6CWPS4IPxiHt1n0y5M16/ZzO6nYzPeGZImwWZSeqYde85O0Qu4sG6u3CKKoiF0fPhW79FteqNfjFwsIbsv/eWMpOkymnNkvQ+bHtZeoA8vMITDdrMVXGeHMrXrNvW1twm/N1yo6Z9k/CVI6mPTfFqpdj48a4ATfwGKdPpoHzTHBW/7YnoCrrwxftJWFqxDvrjjMtCBmjPl2TniIicW++v/dk/t5Hiy2mXxc7+u08rMKpMeKqerdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4PQcoNB8PR6S56/s75haMJZvbY3JHdqMtMoPOaehRw=;
 b=Hs2vBB9ELSWMA77EBqYUYc1Rtzq3+gGQY49n4NtmqvTaKhWhBxp6Kf7B9XFzvt8g5tZQk+Cg7McgUDZ4WVp8EjK56deUptmyVe/d7Fh63oxewAlAFydqnP+NEgb9lZk6IMlNaDvZV0JZmVw3maRbViwR/PCy+q5iaS+ifpLcak0Hbcl0FQfFyQZpIezAi2P6FiGolznbS+fIG3tDJovGq7Fn9m8koVKau5dAGApmRl/1YPGwr2jhrR7PTn8cR9bpYbjc9ThoHSqIez4y92XZg9J0L0XpHwsk8TCyy/aJCTSiPkR0Plk00PETi7m0UUVWfIcwxsFUp6rDCD9p46lEkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Tue, 6 Sep 2022 08:12:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 08:12:18 +0000
Date: Tue, 6 Sep 2022 10:12:11 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH] drm/doc: Custom Kconfig for KUnit is no longer needed
Message-ID: <20220906081211.i6r3fhopkd76w7vw@nostramo>
References: <20220905184711.391022-1-michal.winiarski@intel.com>
 <0131b046-a891-2fae-d2a5-6510455c3449@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0131b046-a891-2fae-d2a5-6510455c3449@gmail.com>
X-ClientProxiedBy: AS8P250CA0009.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a15cb77-5141-4980-2632-08da8fdf8437
X-MS-TrafficTypeDiagnostic: DS0PR11MB7311:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w7RyrzVk8ELij7KxJtJ5eBeQL5dQbJ0wTefsGaeyItTO7hJcXkjoagLCgY0udnF+9z5OAhrIggzuvWMdJ73KgkQYYMz8Vs0zqvPBQ+QHyTsUxN14EeJfOSa9dTg7XMbXQXDd1zmEfOl3wxe2A8xjZEN/KTqj61EsZ5D+e+dnpP6hY3Drc8P+c61FvnL/HrVIUjXusy8sc9durwI4WeFYRkKRGFPStvCmkTcxXRGxt5cu3xCZop79d8YJi7msNbBwvoF6FwxTY4W+k4Lz7IXsDjPH0RWyLffPJBtx2LJZd5/k6DwZL7S5eLmuaAQf/VNcdgPJG7HSeMaHCSF0oYMvBpC8Xwk6Vx+bV0D4yaVEoWG/ecJ2mvFhdhnqfuH9LmEc7a0+DJXwbvMED9+vXZnkueIPxzWrrBlcxouOFLz1A98OVGQaR/iwZoGJIRh9JBpd2Pgr7eed3lI6Om+zm6qJrDp++2hkLF08V1WiW/wDTW9RQz3XBtQFs4VsP9gv2lmcOG7TfgMxPqbnaFeT1nMMlCFyRc53C92sh3/GHFZkkAE3T4h5zubl0HuAL92cgkH96TBS4P8e9zdy5n2cvJs2gT29/vEaSv2XFoDsmnC5lGrO2lRQ2EItfQV7Sf4jskA1vfuzUvOvH/og4KVMwzDjLGAss1Q8bw/orWZMEYZX7cFOPBKkuex5u6El9oMg6ZMUXPmvbZcq+rE8lM3T5FG3hQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(39860400002)(346002)(376002)(136003)(396003)(66476007)(8676002)(66946007)(4326008)(66556008)(54906003)(83380400001)(6916009)(33716001)(6666004)(316002)(6512007)(86362001)(26005)(186003)(1076003)(9686003)(8936002)(82960400001)(2906002)(4744005)(5660300002)(41300700001)(6486002)(478600001)(6506007)(53546011)(38100700002)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUIvaVZXci9oZnZNY2RtYW0zQmExZmNUWmdBeWlJUDBPeUdqcktrK3hDdEF0?=
 =?utf-8?B?QjR3dkRlc0J2YncyRWhySHJWRjhRNFFnNGdLaHprRjZpYm1WT2FHL0sxVkxG?=
 =?utf-8?B?TWpUTEtWdVpDSC9WZG80ck5HUWlFNWRWeVlkNDhZbDg2L0daWlVGNU5DV1Ri?=
 =?utf-8?B?cVdDWDVvSlRqQUVtdlFwcUh0d2l3N1Zaa08zNE04dGttUmRxS2NsY3VtS3Y1?=
 =?utf-8?B?NUZtYS8xY25tUWllZzJlZDI0ZWM5YW9NME5GbVFNbEVjQ3QxRm9BcW42SXFT?=
 =?utf-8?B?WnozMlV5aE1EbFdCenBzajVrWHRBYi9FZ2VIalp1Y29GU3V4NkhjRTZjTmFz?=
 =?utf-8?B?QlFKV1R4RHdJREZUZkZTbFRTeFF2RVh1aXEyaExzdExlQzY5RHJFR2V1OXpR?=
 =?utf-8?B?cFgrY3J2cmtIbkZNN0lqQk13eDJYRlk3Zm9UQ092YVVMbHlreFlGT2UvY0lC?=
 =?utf-8?B?SnpOaUttOHNsMURCS1lkMGdLYjVTVFd5U3pZZkZ6UU1HS1ZhdTdNdW5nMS8r?=
 =?utf-8?B?M3hEMGVsZGdyejlacmpacVMzZko0SzJWMjNzb1FvNUxLRXJkRTBRN3FLanZq?=
 =?utf-8?B?blZBWVMrNHBkUHp5ak15YXpmNU1yQVlCeGw3NnB2a2g3QXV1MmpMY25seC9n?=
 =?utf-8?B?SFhrQmZjZWYvS1paNTcvQ0VyWmNzc1VjcWltbldjWWczL2RYL2xFUDdFUXhw?=
 =?utf-8?B?U0ZaZzZRNW92cUNrYmVjb1Z5R3BZR0JiVU5PQjN3VGJ2Mjl2TE93QUtwNGxX?=
 =?utf-8?B?Vmp4c3greFFPQzloTXM1TXhpWk9ROEJSMVY1dHM3RFQvN1ljVzd2eE9FN0da?=
 =?utf-8?B?VDVYZGlkUGdMYWVsZ0FvSWFWVEhjN3hDS1lhTzBCaG5tUXdkdjhBR2RmVDlR?=
 =?utf-8?B?TUt2a2VGRG42enJQZ21MNko3S2x5UndUSWUvcGtMSEZrTEwvelNkKy9mOTNs?=
 =?utf-8?B?Zm5zQlhBVmtJUGYzWnlXeXg3d1JFVkNtYTdRUUZBOHZEVlBQTmxseldsbm9z?=
 =?utf-8?B?aHk5bnFqOGlLM1k5andvQnZWcTVycXQrekh2bjRZKzZiSHZsd2lXL3BXYmdu?=
 =?utf-8?B?dldZcVA1QTJkMjNWZTZ0d1NBUHBEb0FVUzlhQmQwd3Joa20yV0hCczE5Q3oz?=
 =?utf-8?B?S0c3SGQ3VFcwTmNGVml0cUFsWGw2YVRobVFIandsb0NUTlZqMzlBb2pnODNT?=
 =?utf-8?B?VFZMZ0xhaHlTMTRRTEVwYlM4Q29VZHlKZ0t6aGc4Mjl0dDE3TWNSenYxVk5s?=
 =?utf-8?B?SVJMSy9Kb2FuTmp4UE5uMVc2S25sbWY5U3dGK01vaXpScVQvTTlKOU9HajlP?=
 =?utf-8?B?UmQ4cGpCQ0VkdCtuQ1ZwWDJiemlTOG1MTzBUdjd4S3pGYlRLUzNBS2VPbjB3?=
 =?utf-8?B?TmJDNFFJRG9WdVUyaSs4WDl2dWpHQzBlSHdNS29PbDRGaVJLQlR6M2tjRXpP?=
 =?utf-8?B?MVN2anhueXlXY2MwbTVHRjZpNWVMMis4cUNnYjRqdEp4Wm5LWTFtRU1lbU00?=
 =?utf-8?B?Mjd6Q1AvbHl2ZmloR3pXeHFaWjEzNEdDeVE0M2R4WnQ1WUxza00yTGtUbkV6?=
 =?utf-8?B?UXp1bFZDNGhFT2xXTG9QN1dFK3FpTXlUQ0hxUytaa3hLMDFnZnEyNVBTU28x?=
 =?utf-8?B?SGgyOHlFOTQyNVU0WXVTTVdTekNwbXAxcytrWEVNeGY5a0J0QjhCdVVRMmZ3?=
 =?utf-8?B?cDRQRmtzWXRrQk5lcCtjRkVoT1p1TnpnbGNWdCtsc2RmbUx2bTI3TDVqV3E3?=
 =?utf-8?B?SjFZeWhlalRIdW1FeDdLTjBTSGFsQkFtWXNRcGRzSFQ2czNRK0NZaHBPc3VV?=
 =?utf-8?B?djBwQzI5YnE2TVJuZnpxOUxZWnM1K2xzdHpqbzA0VS9UL1N0dUpaNGdMd1JM?=
 =?utf-8?B?YU81Vk05YVhCZld0aGFLMkt4bGJENmZKY2dBdjgxck85YW5uR2Y2d0V3bjlR?=
 =?utf-8?B?WTVjUGRaa1kyeG1qdnpOTXdBRWZ5bkZxeVFpV2NjdCt6SXpRRlkvREx1SnFM?=
 =?utf-8?B?eW9RQk1SNzQ2SDl2Sm5ZUmlzeU43RjE2M1BWT3NXYng2b1NJRWhtWG1WSk11?=
 =?utf-8?B?YXJGQW5CSGxKT0pRNCtvWHJaaytnRTFodmlweUdIK3J2cmc3a3dHMjNXY2E1?=
 =?utf-8?B?NUxoSWNDT0E3S0pKalpUUW1ERklEQmtNM0h6MHFPYXdSM0p6MnI4WVhONkhR?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a15cb77-5141-4980-2632-08da8fdf8437
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 08:12:18.6906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSt1WuIArS7FGsUGv49peAU6Ctxgt0xZ7bHZFe0hAuVoQL/6JdR9GZ2tQxzMBzg7pcuSakAPqw+M52jAp81mgvyzblCT2GEymespX6eMDuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
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
Cc: David Gow <davidgow@google.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 08:37:00AM +0700, Bagas Sanjaya wrote:
> On 9/6/22 01:47, Michał Winiarski wrote:
> > References: commit 6fc3a8636a7b ("kunit: tool: Enable virtio/PCI by default on UML")
> 
> Use Fixes: tag for bugfix patches instead.

Can documentation update (when the referenced patch didn't touch the docs)
really be treated as a bugfix?
Or is it just a reference, validating the reasoning behind this patch?

-Michał

> 
> -- 
> An old man doll... just what I always wanted! - Clara
