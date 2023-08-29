Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D331678CC7D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 20:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730E810E488;
	Tue, 29 Aug 2023 18:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAED10E482;
 Tue, 29 Aug 2023 18:53:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Efrjj0GzHdlAkfNKDvXtpCXPwMGy7E1UVw5V8/Vo3zOrBSkHq/6ZPwT/qglmu5MtB+gDUUXeeH9gRGMI0ExN46k95pMt6lhLglMEPLqL6Q5ZiZZT3aMpr0p5RHitrRCEcv4AwNRvkVaz/juEdbM0hse7dTRs37tb0B28oLCx9/q+1N/u8E77RZpWhV8YRb8yIrNrmpxaCC6jpt+itDhuk1OtY2G6VMdd2dNfLC/hyjXreWtFxGQiOmhtmdzM2slyXiD0x9RcQhQ2K7dNP4suBnV140KC7Vs9A3xduZ3hFwRd2DFDSBkeqwxLmv8ltt3+yRY1PmKkso4lvb5POdoGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vWtzzDFfncgLPlaC13PGJqz+uNKmG0YTdQfpEAMgQU=;
 b=GRtUYx+2PpMKaJEG3gM3PhGk2rwBM0A/g9CUdb4bDUYiFdjzEKHg1C4IOsEdGCMfdPYSlg9AKaxFBwaxW54vveNWd2dQS3D0kJ8QgUnSfVjaL+n7I6pTswJGKCkLSPO/8BLi4rRE5nEC6dFhizNLH/rNBRi/2h4lKyQg0s9QZrXQTuYOV1htXM4rRhEpcj3Fzj3H3WoEnN9rn1yreiyAIFCeHwoDuaNORL0qZrskZzxjVbbiLsmg1aRxasGGltGJHrs6M8fZE0CuAl5rQCQconc5zoxj3AP5cy5FqED1BbNArNw4InBGNGnmsELtbcB6s/elN9ZwyV1g/hYBmFdBpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vWtzzDFfncgLPlaC13PGJqz+uNKmG0YTdQfpEAMgQU=;
 b=A0ytJLIKoBcQbClUZ/fPJq2+8sWs4ttfiOlPECFZbQZC0tvqcj60V8bt7KZRMA+FPuKcF0xqx8o+d0S5pkFR2bvuCpv2U7pfRh2LyByWZESPqgMX4oc1nxcJEJ8u34vfhNxqY/XKoCVbymUjSeMSAAfYMboGV6CMyNrEDKsM1Lk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3048.namprd12.prod.outlook.com (2603:10b6:a03:ad::33)
 by SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 18:53:40 +0000
Received: from BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::5d25:7220:4688:563f]) by BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::5d25:7220:4688:563f%2]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 18:53:40 +0000
Message-ID: <1e6aa1ff-9aa9-6b2f-84f4-e0304205085c@amd.com>
Date: Tue, 29 Aug 2023 12:53:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Alex Deucher <alexdeucher@gmail.com>
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com> <87il965gob.fsf@intel.com>
 <871qfm2kg1.fsf@intel.com>
 <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
 <87o7ip252r.fsf@intel.com> <87jztd2332.fsf@intel.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <87jztd2332.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0177.namprd04.prod.outlook.com
 (2603:10b6:303:85::32) To BYAPR12MB3048.namprd12.prod.outlook.com
 (2603:10b6:a03:ad::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3048:EE_|SA1PR12MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 698c7469-ddd5-408a-e8c6-08dba8c14270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFLH2sPr7BidACM0sw2pWA75SVtWo4PeuQKnkygBFLkFqodLFLNsj3a68b8C/FyoZpJNxzqjXXI904bP/n2NnR4erO1F70Pc90+kZZRyaDVDvW+sIC8xk++5IbHDUDc31SSXA5e3ER0/8BN92BE81wNg8lYU7WQy4ldn5IHAq/bnqTrolojunxLkeB06tyz38RMMMxSbT6t5bn9hxjXfoqa++VizR+9Rvcx5HMOOrF5l3HQOUrNm5iK3xpRgWUDRgleQN/v/FFhHtYY7bnEx8yECRwBsTZO6DG5vmAyURp7ku62yhwVh9wnrBco3j3hv+waMWPlFWHxtzsDRUHP5TmTZTbmi6n0qtnBQ1TpgGcX35t8RmLeKtkDXbWboepR6l2TgyBcszrU0wX1gZ7dMOmrAD9JiTmR/j783JE7IvAaaYK18N+D0WKuUmd0OwRcrZa3N9wx9bvur0RK1DTGYFrQsVNRWXRC5XNyyGfLvK1wwClYoNTqaj9gDpbDNSyusJHK6RKq/AbWji/yJwKBgAOlAOe1BtWjuLsHvkOd49ZBSPNLWELAR9zPJAFIK7IRuHS4ZVzPysfwc4IAUbS2G/7pPCJkdCtzFUyqSKVNToMRCBpXVA41g1Jj/M3ddpKMY0RLWLYC6WKV4RK96P7rPUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3048.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199024)(1800799009)(186009)(6512007)(316002)(38100700002)(41300700001)(26005)(4326008)(83380400001)(2906002)(31696002)(2616005)(86362001)(8676002)(36756003)(5660300002)(44832011)(8936002)(6666004)(6506007)(6486002)(66476007)(66556008)(54906003)(53546011)(110136005)(66946007)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWJtZVZQRDlINkMxREpwK0tyUUd6MUVHQW4xd1ZHRGM1WUZzMElDY2JLdHF2?=
 =?utf-8?B?WGUxNGRLRXlOTnJ4VTJpalpHTk5WK2Y1UXlZbysxUTdxRTFVMG1uU1Z6OTg3?=
 =?utf-8?B?M1UzOGl4dzd3RGVPeHVSVlhrQnRDaUZpLzFDaU55Y3RuaHkxVmhENjMzanNn?=
 =?utf-8?B?Ym1XMElrd0xCeFg3OTUza1UvVCtGUThEMndkRkNHUXp4WCtJRjhUZUw2dGdh?=
 =?utf-8?B?OVVHbzRlY2tGV21CVml5REJuaE9OelRBZGVvM1BvbnVGQWVDclhrT0tkUGc2?=
 =?utf-8?B?ZVF4Q2lOQzViWVY4OWRSeUxlalNtcDRlaFFaUmFjLyt5Wm5rS291elFjdTJI?=
 =?utf-8?B?eU5BcnRpNE9rWlVuSWNhT3V1aWhGME94cElFazB2d2hZK1ZQbHphZ01HWS9l?=
 =?utf-8?B?am9ZOFZZbDdNQlNvU0tpdHpZeVlpMTd2cGt1VmpNbEVLai9RN2Z5NTl6aGVV?=
 =?utf-8?B?ajFGYS9uMEhLdzFYVVh1aWJReDlGelM1QUNDc2M5enhXMGtMcEkyRFFrTW9n?=
 =?utf-8?B?a3BQaU1WWEpxNnlrRGMwa0J4L3BKSUdIYVUyby9XWTZmTGFmb09OZm9XWVln?=
 =?utf-8?B?TXM0bTEyK3M4bzg0WGJpYS8wMkh0czRSVk91ck5Oa0hrY2d6Sjl0dGdtbHZz?=
 =?utf-8?B?NmRuOTVYdjRUUkZrOFZTaTJMV0ZBaExQSmZSckNzYjdYbGNoUnp3UnZJNFFQ?=
 =?utf-8?B?bXJseEY2RGdGTlFDR1llelRTSldBY2FPQWhKd2RQLzlra0FFdUZjemEraERV?=
 =?utf-8?B?eDhpT0hFVlZCd1FxTnN4RU5aNjBOMWZ6dktJT1NmZXIzS0JrUmh2VTRwQmYv?=
 =?utf-8?B?NGR0eWRyYWFnbkpWUExmVzF5Wi80OXhxZ09XMVVlZDNUbDhkd3VSZEtRb0E1?=
 =?utf-8?B?UExXT0M1WTF0RUgvS21BczV3UXd2cWpwRDBqUzJra1M4eHdxUGZaZW8vdDdx?=
 =?utf-8?B?Y0RRdjRkaFBiZW1neEthd2tLTTlVWDNHbk5SbW42ZzVvczZOdnVSVVIybWdq?=
 =?utf-8?B?cEJhRldoZFNydmZvQk9yT2dlemVkSVRPRE5SaTcxSDFHUy91dDFUWThpNGx6?=
 =?utf-8?B?emlMOHNKd3FEemsweFBnZ2o4MWNjb0VpUUt1ZStsMEdhRmZOVWU5NFpFUVFF?=
 =?utf-8?B?ZXpQb0FIdmRDZGhBVVBJYmVIbVhWeFZsY3RkRmEwU3RrQmhUWVZOS2Vkdm9J?=
 =?utf-8?B?M2FhY2hON2hqZVdBQ0tYcDkzWElrcmt4akM4TTlBZTIrRjVEKzZBaGtyUXRp?=
 =?utf-8?B?RExsN1M3ZHBUbEkxd2pUMDVaK1pOOXpWbThZbCttblRDYzVpN1Fsdk0rVDFD?=
 =?utf-8?B?RVdSaXR2L0V2a211MUJuSFBRMWI5RG9GcWo1V0w4eFl2RFZjeGp2cytoVVlZ?=
 =?utf-8?B?SjRRWXhIMVV0N25OeVRVUDU1aDQyTkx6M0kzaThnZ1JpYU81Q2kzY2VUTVh2?=
 =?utf-8?B?Rk5idkR3aVFsWENJdG1mdWNMTzVLSTBtMjh2cGk0aGpWa3lUOEI5Tm5JV1ZY?=
 =?utf-8?B?OVJiNmoxZ0Fqa2lGaXIxVmw4Sm01aWxlN3pqVm5uM05ycnJpNzZiOHdEUEtF?=
 =?utf-8?B?MlExZENLN1lKWlJlekcxRHpaV3Fxd1NSTEhPaWJXK3RKclQzbWlOenNWWUN4?=
 =?utf-8?B?UHd6ZVgxOFZIMHJGWHQyTFRSQmQrcFFrMmgrRDlnT3JWQmpITVhoeTZWZ3Q4?=
 =?utf-8?B?K2NPeHBVM3F2TjduT0EzeTc4d25QT2xTaytja0tDZnRXT3FkQmN1emtISHlU?=
 =?utf-8?B?Q2dubXpBSFFpREJSbHpvMFZrUGNRMmVaRHg3RWdwbWQrYkhPcURYM25zRk5G?=
 =?utf-8?B?MTdWWTcvQWRMUDVxRmNtSDFvVUhDU0VBSzZTYm1tK3RlUUowM2NqaVBJdG1B?=
 =?utf-8?B?SzRQei9GdkFGczB6QVJEQVlaYVNJSUtDV2kzNG41SGl4TDd6cnk5MDAyNy95?=
 =?utf-8?B?K2hyeUtKcmhHeG9lVnlEVjFEcC83T3poZ1N1Wm4yWHU2QUFzc0JXNnZYZ2N0?=
 =?utf-8?B?dHVERjFVZ0wyR2R2ak1TOWpHbklGZE5EcXdLTURRcVlNdEMvdFl0a0dpVi9V?=
 =?utf-8?B?WnVGUjU2SU00SEFCQlU5NUdySW1NbldZa2VkVDVzYlNNNitTS20wUDhGRHlk?=
 =?utf-8?Q?VMeBmqsaPqZUXDVZV1eLpIwQP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698c7469-ddd5-408a-e8c6-08dba8c14270
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3048.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 18:53:40.1667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBpPGIKI2LcWymXPzvaVmlyfcaGarK+djBxCj0k3V9/BRH+b6aopOV1jLf9x8x4PvvtXYmEuMZJUhk4rc2tCtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7366
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 "Wang, Yu \(Charlie\)" <Yu.Wang4@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-29 11:03, Jani Nikula wrote:
> On Tue, 29 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> On Tue, 29 Aug 2023, Alex Deucher <alexdeucher@gmail.com> wrote:
>>> On Tue, Aug 29, 2023 at 6:48 AM Jani Nikula <jani.nikula@intel.com> wrote:
>>>>
>>>> On Wed, 23 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>>> On Tue, 22 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
>>>>>> On 2023-08-22 06:01, Jani Nikula wrote:
>>>>>>> Over the past years I've been trying to unify the override and firmware
>>>>>>> EDID handling as well as EDID property updates. It won't work if drivers
>>>>>>> do their own random things.
>>>>>> Let's check how to replace these references by appropriate ones or fork
>>>>>> the function as reverting these patches causes regressions.
>>>>>
>>>>> I think the fundamental problem you have is conflating connector forcing
>>>>> with EDID override. They're orthogonal. The .force callback has no
>>>>> business basing the decisions on connector->edid_override. Force is
>>>>> force, override is override.
>>>>>
>>>>> The driver isn't even supposed to know or care if the EDID originates
>>>>> from the firmware loader or override EDID debugfs. drm_get_edid() will
>>>>> handle that for you transparently. It'll return the EDID, and you
>>>>> shouldn't look at connector->edid_blob_ptr either. Using that will make
>>>>> future work in drm_edid.c harder.
>>>>>
>>>>> You can't fix that with minor tweaks. I think you'll be better off
>>>>> starting from scratch.
>>>>>
>>>>> Also, connector->edid_override is debugfs. You actually can change the
>>>>> behaviour. If your userspace, whatever it is, has been written to assume
>>>>> connector forcing if EDID override is set, you *do* have to fix that,
>>>>> and set both.
>>>>
>>>> Any updates on fixing this, or shall we proceed with the reverts?

There is a patch under internal reviews. It removes calls edid_override 
and drm_edid_override_connector_update as intended in this patchset but 
does not remove the functionality.

With the patch. both following git grep commands return nothing in 
amd-staging-drm-next.

$ git grep drm_edid_override_connector_update -- drivers/gpu/drm/amd
$ git grep edid_override -- drivers/gpu/drm/amd

Best regards,
Alex Hung

>>>
>>> What is the goal of the reverts?  I don't disagree that we may be
>>> using the interfaces wrong, but reverting them will regess
>>> functionality in the driver.
>>
>> The commits are in v6.5-rc1, but not yet in a release. No user depends
>> on them yet. I'd strongly prefer them not reaching v6.5 final and users.
> 
> Sorry for confusion here, that's obviously come and gone already. :(
> 
>> The firmware EDID, override EDID, connector forcing, the EDID property,
>> etc. have been and somewhat still are a hairy mess that we must keep
>> untangling, and this isn't helping.
>>
>> I've put in crazy amounts of work on this, and I've added kernel-doc
>> comments about stuff that should and should not be done, but they go
>> unread and ignored.
>>
>> I really don't want to end up having to clean this up myself before I
>> can embark on further cleanups and refactoring.
>>
>> And again, if the functionality in the driver depends on conflating two
>> things that should be separate, it's probably not such a hot idea to let
>> it reach users either. Even if it's just debugfs.
>>
>>
>> BR,
>> Jani.
> 
