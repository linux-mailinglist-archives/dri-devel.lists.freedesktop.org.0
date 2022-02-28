Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DCB4C70CE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 16:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC0E10E47F;
	Mon, 28 Feb 2022 15:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBA810E47F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646062574; x=1677598574;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gtj204pyY4NpOMWmkM7LzInN+kodoyzztJenj7ciMWM=;
 b=lRdYtHbhbdq/qUGnfUNOQ9jDg0r7VQuXm7T/6W8uJ30M8i8aYRKcmRun
 4Jh32AOcNjL0S00xDxfWUCml77z3lbhN+992XRONF2fEK1yE4NigSIEq+
 mZJHCr7wrvMg8wi8+M5kxfSxPni6WBwZZUWXrldQRXFUdK1gpIMq30som
 jPYYywURZyx2m4dJI8vUempCTFuhf99vj6DtSlMHXfjGdvwUjanJDdI5K
 2167YiKbo8oiq9VCqfBHMXMeOruxxMpqtcJQk2GNlUCcVMsqslbUeKVdR
 QYxzNaPj9DzUTfPnbomKfqlrlr7yHgmfl8g8VLl4JgiVeK+PlFXN4bfd5 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="240317885"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="240317885"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 07:36:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="575347454"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga001.jf.intel.com with ESMTP; 28 Feb 2022 07:36:13 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 07:36:12 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 07:36:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 07:36:12 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 07:36:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUmw6n3dIt2CqFhMnfamTSy/oDqVRD7ZwL2nusd4PdQM5/00BpZpkbB0fqngKBr+pHWnUxRU7IQgLpWHl01hkGRI4LG6k/Yoxn83l/ziNbvI2bjLQRacdvtwyg3GH2o854IkJtnFZO76U6JwnBseaUfZlkF7remt2xP7eMtMY6XZRWG6oGKxZgeiiqCfKEgFKoIwiYdLvlpoE/BQ40np952t3KNnXJUswViYILgSe31axzaVLAzkvyC/U0xyrMj7Wcw8rwpewxAJbdm0QGvp/AqnZpxxZQHxvGJGarAIdclqjUVZjnKefTU8fetzlXtFRFoXvJkhNyPb2qI3E3eLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylVE6lL7zOSlKghbs+xwQeWSYO/dXbXJsjQm9/uLkcY=;
 b=GM3rZifLc6OsCZF5TlQSgId1/0W7M/1Rg7mEfJXEKX6G+C8MTmhvAbR835a/6GyvoYFYAzCyavZOiDx+7IvXX1KOYG8RoOiXw354KpsSmBIpDbXitE2xLSYLcmKVl/chs/KeLrpY+yNGLqSEF8g/TIsF3yjQ1v3/5CyHV1J4ixYDOQOFwfLJO5JbQCnOZiMoSvD090Pb9WFBkHoEJb+x9Cif2npFhKeQmhcrsvCR1JB50wJ5EwwUPewZJXj+Je7gT6qUH6sFMsgCJVkFTyJfQwXNrXvj91P1GpvqZlxVisMNBISxPLDeILLodGjehasOgxqQrWRoJdf9J5sBknsg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BYAPR11MB2584.namprd11.prod.outlook.com (2603:10b6:a02:c8::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.26; Mon, 28 Feb 2022 15:36:08 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.5017.022; Mon, 28 Feb 2022
 15:36:08 +0000
Message-ID: <35234e49-8e1c-b88c-2764-cd79e50dd0ad@intel.com>
Date: Mon, 28 Feb 2022 16:35:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] drm: Introduce DRM_BRIDGE_OP_UPSTREAM_FIRST to alter
 bridge init order
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
 <4c6511bd7f4ce52aa3323141b6f0a68ae2773787.1645029005.git.dave.stevenson@raspberrypi.com>
 <YhSD1zHxaOeCitgz@pendragon.ideasonboard.com>
 <CAPY8ntA=1ZD2kgFy=deuV4FWetT7wq3s_=eKH6kJwOx6CBLTkw@mail.gmail.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAPY8ntA=1ZD2kgFy=deuV4FWetT7wq3s_=eKH6kJwOx6CBLTkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::35) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90e194d7-b4fd-422a-d5c5-08d9fad00a24
X-MS-TrafficTypeDiagnostic: BYAPR11MB2584:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB2584FD30B42E611201C7022EEB019@BYAPR11MB2584.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7F8xzslWV/JiX8KYA0LNH8ZEeSd89PZJW5BOHJO04mFXLue4pG6wen6sIxWS02/UwH+9TMeeRkmphN4M3fAqTb2Y6ETWR1aMW7g5CHtYbllmI6DyuWZFBQb8NAtaqPficWHDxnLpQntaL63MWVy7yJ/saGzB3Ptdc3iRgLg29zOEa8FiOFhqnzRSCxJEXXELSZf9dVZf782kTAxYhFE2xzIg/abgqP7fNB9vd0tOOlfBDKzSPn9oEv9ZwxqGIvP7QbKVEJOEZItYEieZAOy36vD/oYfsjBj1Bgw/ByEDw/+zbUCpmmciw1s0S7QXLjtG1TFsU2Jq56FfQVKZk5jlVKb8iyC9uj0jKZcFmXwNHBF8f/bymNIvH/fwZlhCJMVwu1pKvKfXxCZTqbximeLJrRnDPcAnZdPC+FvXhgZI/VZBEjfv0jDbSgt4eiuCSV1dpa582mR/8Uma0kJO50Z/DrvXClucao630vJm6LxfHPNtlgDSRDQuBbBqlnMecYD4s3D6JjgMBUuUR5Zf4ui02FNlRqDpYTTNyFmyMcrtOQjyKWdXEVxbj87pQT/OZ2hw88JTQuO6hmDDy2n6cx7J+AK99/O7N4jrbzFV3eKT6kQYU9ywB08d/ufXsWSgHwtioHMbI1E+SWVjEyzeTKiNM35C6dsMoI/VqKFULjYbuh/YiPck8KQymB2e2d2qCIjXWTwu1QIW9GQLPI3iKGMCC89XuVIL7VGGGc6zM67YFsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(66476007)(316002)(186003)(82960400001)(4326008)(2616005)(38100700002)(54906003)(6486002)(86362001)(31696002)(30864003)(44832011)(7416002)(8936002)(5660300002)(508600001)(26005)(110136005)(66946007)(66556008)(6666004)(6512007)(6506007)(53546011)(36756003)(2906002)(36916002)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtKc3g0ckZXUE5zUktjWjZ3cTJPWHMrc3F1V3I1TmJ4L0E2N3JKZm9VbzVy?=
 =?utf-8?B?T2w4ajhSd3BVZVNDNXk5eURrMjFOWEMwL05ISld6SDVxblNDUXRyTlRLUzlC?=
 =?utf-8?B?R0oyTkxXTm04MG50Q1VDUVB3THFJTXhwbngyMkRXbElhU25idi9jZ2hURUtk?=
 =?utf-8?B?MVArRWNuRlpHcmRralhTZENTWTJvQzhCWkxSRm8yR2hjVHlpRjM0dTJoUEox?=
 =?utf-8?B?V3VNaTlGdW5pak02U1hQYTBnQmtxYkhQUzk1WVVaOTJ5K2t6c3BGSkdodm5r?=
 =?utf-8?B?SEFqalIvYUs1aExZUzc3eHl6T1Q2eFo3K0NGR0RROWd0QldCUnEwK1F4aUFp?=
 =?utf-8?B?ZEI0NjNZOW9LMDRRV2Q4UkZMSExIZEE4WjVPbTFib2l1NEFSL0xsWHlQdTRB?=
 =?utf-8?B?Y090R2prNmZVY1lWQmpkYXQ0VW5NSHRsTkdqU1JtZW5MWXFZcW9LTitReElj?=
 =?utf-8?B?SXl5R2ZOWXM4bWdFUFl3N0N5TTdIa1kxaE1WK2VMRjJEYmlRMVFkNXBaVWFV?=
 =?utf-8?B?SUpSSUpTS3RPS1lmWG1USHZnVWtrdWNmMlNaRlpZbFhOSUxsOXlieUM5VWFm?=
 =?utf-8?B?SFhnYnJtdUhmclZRRGllSVhpa0xPQ1haakVRakFxdWx1dlllWUNwVENlT0g1?=
 =?utf-8?B?TGdoR0tiWExDdmRQYk9zQ3NaR20zakJoa2gzZzVrL0M4eGJyUFB0VFRhWmVm?=
 =?utf-8?B?bVhMTkJ5RHBjSDZBcHp2VzNiYTRoeTQvMlZMVEtWV0dQbHR5T3QzOVlqRUNE?=
 =?utf-8?B?d0lQRFE5dWhTK0xlc0lWL21yRndnd3Qzak5yc3ExWXcwMUNpV21JMEJiUmds?=
 =?utf-8?B?NENZTzROZHZVWnI3MDlzc2ZwY2I2d01rNjAvOVl0OXdXL29SUTlmdWFWVXNI?=
 =?utf-8?B?dlRmSFhjYk5SNGU2Wk9lbEhnSWI2TG9LeGtvL1hnSTFTdUJPUlRWb01hVnU0?=
 =?utf-8?B?eHpLQWRBMFcvMkxraGNzRUJlS1cxQTIrSmtIUXYvNnh2UnhSdmZ5ZFFpcTdU?=
 =?utf-8?B?UHF5bVRwWEQrUUFtdFJ1SFZrcmw4SDBUOFlESjdCUHJUaFZGMStKMGZxM2RJ?=
 =?utf-8?B?bGVEVGU5M04yY2RnTEhDR2w5OTZ2UzJIUHg1eUxFRGdMRi9ZYXN4VUl5VXZx?=
 =?utf-8?B?c212NDMvTS8xRjJnd0JVNTZHREo4MmFZVG1vT0F1aE5LWlZXL1Q2QWJzY0Nv?=
 =?utf-8?B?QnkyS0IyN1h3UUZ5NzZkRGNMMXJES2JhZlpmTlI1T0gxT0NGRC9ib0ZSM3Az?=
 =?utf-8?B?Q0lZL1ViZHUyNjlSdHFJNXpJV3ZRYWpGbTVDRk9ZU0NLZklUSWw4dVplQWs0?=
 =?utf-8?B?TGFSMjlDV1dWbzl2VUFtdnZZTW5FVkJNc0kraUxEYjRCV0w3ZHQ3Zi9IaGp4?=
 =?utf-8?B?R3B4UzE5Sk5icmxXZTdxK3FLMnhIeUNNQU9JbkRNQlg5Q1JkOTg3a0t4YVN5?=
 =?utf-8?B?dUQzOHRwd0t3QU1tUllheXpXUnBRbE9LTVBpeDkrTzR1YWdPaXNsSlV2YVpK?=
 =?utf-8?B?N2lyUElzajViYVBhTGhtb3hZR3RKakFVUUJsbzQ3R3hMVFQya2tmU25QZm8r?=
 =?utf-8?B?M24vVkM4RHhYVjNSR2JsYlVaR2laZzRlQjkzVzJ4a3pNaVdkM0tBSGVQdTZD?=
 =?utf-8?B?a1BFQnVkd2swaUN5WmhIUnpjQ1A2YlBWTXVOS041N0NrL1dHS3k3UnZycDZo?=
 =?utf-8?B?RG1Ma1lITEdyNjQ4RjFSc2RlZGdsSmJuMHFDTk40blVVUnhkcUk2MStPM0lr?=
 =?utf-8?B?WmJERjdKc2luYjdFa1I5OEJVLzZzYUhiWTc3dS9vamIzN25aVi9PSlg4NEFh?=
 =?utf-8?B?UUJ2K0NEMHEzWHBuRWNHU29DaElKNDBybVBUWlh6SVd6RlJUeVNyNmw5d3NG?=
 =?utf-8?B?WHQxQUN0WUc0TzRaZUh2aW4xekoyNlVzUndCNE9DNXlRRUN2TjNNQWtuYzZI?=
 =?utf-8?B?Z3dVbSttNGJGYW81cnZrb0tTS0NkQ3BXMW1BMTUwTjlrcmV3MUpYREY1MEVn?=
 =?utf-8?B?N2dNcXFFSjAzWCtNZW5SOFRRYkRXNG5oM1psQUVOYUV2VUlxSzZ6MHdTU00z?=
 =?utf-8?B?ZERadGdJakkrazNHMFp6QjQ0M3grOEVSdEgxeW5mdHVhOXFRZTg4Smg0VDJN?=
 =?utf-8?B?MnRnTkhMa2tMbUdxeG1uMWRmaHgrcjRpZ1J5NmQxVXB6Q09ndWRnL0JzcUJs?=
 =?utf-8?Q?vdRaFjQjIroO9wp/9WphEjE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e194d7-b4fd-422a-d5c5-08d9fad00a24
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 15:36:08.2463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4TL8yscJ0fw761xtWBP7AdzmjFL6/GZ2adlwd2N+jJWyqUFiCyN45929KAkfkudu9AO+uAwPqC/SNAwPfo0JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2584
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22.02.2022 09:43, Dave Stevenson wrote:
> Hi Laurent.
>
> Thanks for the review.
>
> On Tue, 22 Feb 2022 at 06:34, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> Hi Dave,
>>
>> Thank you for the patch.
>>
>> On Wed, Feb 16, 2022 at 04:59:43PM +0000, Dave Stevenson wrote:
>>> DSI sink devices typically want the DSI host powered up and configured
>>> before they are powered up. pre_enable is the place this would normally
>>> happen, but they are called in reverse order from panel/connector towards
>>> the encoder, which is the "wrong" order.
>>>
>>> Add a new flag DRM_BRIDGE_OP_UPSTREAM_FIRST that any bridge can set
>>> to swap the order of pre_enable (and post_disable) so that any upstream
>>> bridges are called first to create the desired state.
>>>
>>> eg:
>>> - Panel
>>> - Bridge 1
>>> - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
>>> - Bridge 3
>>> - Encoder
>>> Would result in pre_enable's being called as Panel, Bridge 1, Bridge 3,
>>> Bridge 2.
>> If there was a Bridge 4 between Bridge 3 and Encoder, would it be
>>
>> Panel, Bridge 1, Bridge 3, Bridge 4, Bridge 2
>>
>> ? I'd capture that here, to be explicit.
> No.
>   - Panel
>   - Bridge 1
>   - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
>   - Bridge 3
>   - Bridge 4
>    - Encoder
> Would result in pre_enable's being called as Panel, Bridge 1, Bridge
> 3, Bridge 2, Bridge 4, Encoder.
> ie it only swaps the order of bridges 2 & 3.
>
>   - Panel
>   - Bridge 1
>   - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
>   - Bridge 3 DRM_BRIDGE_OP_UPSTREAM_FIRST
>   - Bridge 4
>   - Encoder
> Would result in pre_enable's being called as Panel, Bridge 1, Bridge
> 4, Bridge 3, Bridge 2, Encoder.
> (Bridge 2&3 have asked for upstream to be enabled first, which means
> bridge 4. Bridge 2 wants upstream enabled first, which means bridge
> 3).
>
>   - Panel
>   - Bridge 1
>   - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
>   - Bridge 3
>   - Bridge 4 DRM_BRIDGE_OP_UPSTREAM_FIRST
>   - Bridge 5
>   - Encoder
> Would result in Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 5, Bridge
> 4, Encoder.
>
> So we only reverse the order whilst the bridges request that they want
> upstream enabled first, but we can do that multiple times within the
> chain. I hope that makes sense.
>
>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> ---
>>>   drivers/gpu/drm/drm_bridge.c | 197 +++++++++++++++++++++++++++++++++++++------
>>>   include/drm/drm_bridge.h     |   8 ++
>>>   2 files changed, 180 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>>> index c96847fc0ebc..7c24e8340efa 100644
>>> --- a/drivers/gpu/drm/drm_bridge.c
>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>> @@ -522,21 +522,58 @@ EXPORT_SYMBOL(drm_bridge_chain_disable);
>>>    * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
>>>    * encoder chain, starting from the first bridge to the last. These are called
>>>    * after completing the encoder's prepare op.
>> Missing blank line, as well as in three locations below.
>>
>>> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the post_disable for
>>> + * that bridge will be called before the previous one to reverse the pre_enable
>>> + * calling direction.
>>>    *
>>>    * Note: the bridge passed should be the one closest to the encoder
>>>    */
>>>   void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
>>>   {
>>>        struct drm_encoder *encoder;
>>> +     struct drm_bridge *next, *limit;
>>>
>>>        if (!bridge)
>>>                return;
>>>
>>>        encoder = bridge->encoder;
>>>        list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
>>> +             limit = NULL;
>>> +
>>> +             if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
>>> +                     next = list_next_entry(bridge, chain_node);
>>> +
>>> +                     if (next->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
>>> +                             limit = next;
>>> +
>>> +                             list_for_each_entry_from(next, &encoder->bridge_chain,
>>> +                                                      chain_node) {
>>> +                                     if (!(next->ops &
>>> +                                             DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
>>> +                                             next = list_prev_entry(next, chain_node);
>>> +                                             limit = next;
>>> +                                             break;
>>> +                                     }
>>> +                             }
>>> +
>>> +                             list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
>>> +                                                              chain_node) {
>>> +                                     if (next == bridge)
>>> +                                             break;
>>> +
>>> +                                     if (next->funcs->post_disable)
>>> +                                             next->funcs->post_disable(next);
>>> +                             }
>>> +                     }
>>> +             }
>>> +
>>>                if (bridge->funcs->post_disable)
>>>                        bridge->funcs->post_disable(bridge);
>>> +
>>> +             if (limit)
>>> +                     bridge = limit;
>>>        }
>>> +
>>>   }
>>>   EXPORT_SYMBOL(drm_bridge_chain_post_disable);
>>>
>>> @@ -577,22 +614,53 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>>>    * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
>>>    * chain, starting from the last bridge to the first. These are called
>>>    * before calling the encoder's commit op.
>>> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the pre_enable for
>>> + * the previous bridge will be called before pre_enable of this bridge.
>>>    *
>>>    * Note: the bridge passed should be the one closest to the encoder
>>>    */
>>>   void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>>>   {
>>>        struct drm_encoder *encoder;
>>> -     struct drm_bridge *iter;
>>> +     struct drm_bridge *iter, *next, *limit;
>>>
>>>        if (!bridge)
>>>                return;
>>>
>>>        encoder = bridge->encoder;
>>> +
>>>        list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>>> +             if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
>>> +                     next = iter;
>>> +                     limit = bridge;
>>> +                     list_for_each_entry_from_reverse(next,
>>> +                                                      &encoder->bridge_chain,
>>> +                                                      chain_node) {
>>> +                             if (next == bridge)
>>> +                                     break;
>>> +
>>> +                             if (!(next->ops &
>>> +                                     DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
>>> +                                     limit = list_prev_entry(next, chain_node);
>>> +                                     break;
>>> +                             }
>>> +                     }
>>> +
>>> +                     list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
>>> +                             if (next == iter)
>>> +                                     break;
>>> +
>>> +                             if (next->funcs->pre_enable)
>>> +                                     next->funcs->pre_enable(next);
>>> +                     }
>>> +             }
>>> +
>>>                if (iter->funcs->pre_enable)
>>>                        iter->funcs->pre_enable(iter);
>>>
>>> +             if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
>>> +                     iter = limit;
>>> +
>>>                if (iter == bridge)
>>>                        break;
>>>        }
>>> @@ -667,6 +735,25 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
>>>   }
>>>   EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>>>
>>> +static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
>>> +                                             struct drm_atomic_state *old_state)
>>> +{
>>> +     if (bridge->funcs->atomic_post_disable) {
>>> +             struct drm_bridge_state *old_bridge_state;
>>> +
>>> +             old_bridge_state =
>>> +                     drm_atomic_get_old_bridge_state(old_state,
>>> +                                                     bridge);
>>> +             if (WARN_ON(!old_bridge_state))
>>> +                     return;
>>> +
>>> +             bridge->funcs->atomic_post_disable(bridge,
>>> +                                                old_bridge_state);
>>> +     } else if (bridge->funcs->post_disable) {
>>> +             bridge->funcs->post_disable(bridge);
>>> +     }
>>> +}
>>> +
>>>   /**
>>>    * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
>>>    *                                     in the encoder chain
>>> @@ -677,6 +764,9 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>>>    * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
>>>    * starting from the first bridge to the last. These are called after completing
>>>    * &drm_encoder_helper_funcs.atomic_disable
>>> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the post_disable for
>>> + * that bridge will be called before the previous one to reverse the pre_enable
>>> + * calling direction.
>>>    *
>>>    * Note: the bridge passed should be the one closest to the encoder
>>>    */
>>> @@ -684,30 +774,69 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>>>                                          struct drm_atomic_state *old_state)
>>>   {
>>>        struct drm_encoder *encoder;
>>> +     struct drm_bridge *next, *limit;
>>>
>>>        if (!bridge)
>>>                return;
>>>
>>>        encoder = bridge->encoder;
>>> +
>>>        list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
>>> -             if (bridge->funcs->atomic_post_disable) {
>>> -                     struct drm_bridge_state *old_bridge_state;
>>> +             limit = NULL;
>>> +
>>> +             if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
>>> +                     next = list_next_entry(bridge, chain_node);
>>> +
>>> +                     if (next->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
>>> +                             limit = next;
>>> +
>>> +                             list_for_each_entry_from(next, &encoder->bridge_chain,
>>> +                                                      chain_node) {
>>> +                                     if (!(next->ops &
>>> +                                             DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
>>> +                                             next = list_prev_entry(next, chain_node);
>>> +                                             limit = next;
>>> +                                             break;
>>> +                                     }
>>> +                             }
>>> +
>>> +                             list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
>>> +                                                              chain_node) {
>>> +                                     if (next == bridge)
>>> +                                             break;
>>> +
>>> +                                     drm_atomic_bridge_call_post_disable(next,
>>> +                                                                         old_state);
>>> +                             }
>>> +                     }
>>> +             }
>>>
>>> -                     old_bridge_state =
>>> -                             drm_atomic_get_old_bridge_state(old_state,
>>> -                                                             bridge);
>>> -                     if (WARN_ON(!old_bridge_state))
>>> -                             return;
>>> +             drm_atomic_bridge_call_post_disable(bridge, old_state);
>>>
>>> -                     bridge->funcs->atomic_post_disable(bridge,
>>> -                                                        old_bridge_state);
>>> -             } else if (bridge->funcs->post_disable) {
>>> -                     bridge->funcs->post_disable(bridge);
>>> -             }
>>> +             if (limit)
>>> +                     bridge = limit;
>>>        }
>>>   }
>>>   EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>>>
>>> +static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
>>> +                                           struct drm_atomic_state *old_state)
>>> +{
>>> +     if (bridge->funcs->atomic_pre_enable) {
>>> +             struct drm_bridge_state *old_bridge_state;
>>> +
>>> +             old_bridge_state =
>>> +                     drm_atomic_get_old_bridge_state(old_state,
>>> +                                                     bridge);
>>> +             if (WARN_ON(!old_bridge_state))
>>> +                     return;
>>> +
>>> +             bridge->funcs->atomic_pre_enable(bridge, old_bridge_state);
>>> +     } else if (bridge->funcs->pre_enable) {
>>> +             bridge->funcs->pre_enable(bridge);
>>> +     }
>>> +}
>>> +
>>>   /**
>>>    * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
>>>    *                                   the encoder chain
>>> @@ -718,6 +847,8 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>>>    * &drm_bridge_funcs.pre_enable) op for all the bridges in the encoder chain,
>>>    * starting from the last bridge to the first. These are called before calling
>>>    * &drm_encoder_helper_funcs.atomic_enable
>>> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the pre_enable for
>>> + * the previous bridge will be called before pre_enable of this bridge.
>>>    *
>>>    * Note: the bridge passed should be the one closest to the encoder
>>>    */
>>> @@ -725,26 +856,42 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
>>>                                        struct drm_atomic_state *old_state)
>>>   {
>>>        struct drm_encoder *encoder;
>>> -     struct drm_bridge *iter;
>>> +     struct drm_bridge *iter, *next, *limit;
>>>
>>>        if (!bridge)
>>>                return;
>>>
>>>        encoder = bridge->encoder;
>>> +
>>>        list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>>> -             if (iter->funcs->atomic_pre_enable) {
>>> -                     struct drm_bridge_state *old_bridge_state;
>>> +             if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
>>> +                     next = iter;
>>> +                     limit = bridge;
>>> +                     list_for_each_entry_from_reverse(next,
>>> +                                                      &encoder->bridge_chain,
>>> +                                                      chain_node) {
>>> +                             if (next == bridge)
>>> +                                     break;
>>> +
>>> +                             if (!(next->ops &
>>> +                                     DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
>>> +                                     limit = list_prev_entry(next, chain_node);
>>> +                                     break;
>>> +                             }
>>> +                     }
>>> +
>>> +                     list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
>>> +                             if (next == iter)
>>> +                                     break;
>>> +
>>> +                             drm_atomic_bridge_call_pre_enable(next, old_state);
>>> +                     }
>>> +             }
>> This is hard to understand, I have trouble figuring out if it does the
>> right thing when multiple bridges set the DRM_BRIDGE_OP_UPSTREAM_FIRST
>> flag (or actually even when a single bridge does so). Comments would
>> help, but I wonder if it wouldn't be simpler to switch to a recursive
>> implementation.
> Recursive - such joys!
> With the explanation above, I'm not sure that recursive helps, but
> certainly can add comments.

It could be recursive, or just proper iteration, for example pseudocode:

list_for_each_entry_reverse(...) {
	if (iter->upstream_first && iter->prev)
		continue;
	tmp = iter;
	do {
		call_op
		tmp = tmp->next;
	} while (tmp && tmp->upstream_first);
}


Regards
Andrzej

