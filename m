Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A1440B518
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 18:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292946E516;
	Tue, 14 Sep 2021 16:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A7989A8C;
 Tue, 14 Sep 2021 16:42:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/qtgoFEyThtWNbBPNhjySWy/ooaWvAmz9B4YWednG7a6+diiLuEfEdIsjKD3AWWnLtumvSfDEKPsOV/3PCNpxRYz52viEM9jXPyBCBlDn7XpjS73DSsqHovJnXxztA9FoGPZaRre1ZtUUGpEc6mnHUochHQSUkuTihPoQaW1rAzPfiNaRvy6DvMaRYLcJMOQUKiLKFk1MfngzTTHUOPmiv8Smyl4GpIgvWKwTKp+gJCzpuViWBs5Ota6fnjlidHynh5OgDzflb3NU5vCYhIae0hZ9ClbT6r78wcPQ60SU5m6BWwqmiC+lxis5NqMRvFB6lYCaaIrMzeNaaCRBi78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8rOWYiMxSJgAkAlDyTUb91GiXzLnAGUjyME0Qe4hP3Y=;
 b=alAn5o03JB0H45gZHTJnDHB50M92er+HEpTKO2o05QVRQS5Z/WbC942sxFZ24RG37jH2Wi8aqGPdr2yMJmZWhVbeYkU1y1bcifJpQ+6dvyt5AMv6L/OP8+7d7lhC0KumW2IiG/r3b6Ni5nxQAMn0LpbKx0vZj0S49VFDNCUyCvt/+JbJ8Xu0EPdd41hsBDtjjH7GGZf+8Y6+Fmk5Ia2ywNhh5J/I2eZ3xO7+sXB/nl4aDjd4UNiSx4Kzs8IAsMr+K77Cs+r3NvT0MKNPhtCmV1XD+fUJkvo2n9g2ZauGT4X1sMMO8cqXmzQVWvnVYzyynQh0Edb+y/F2qHwdK5MejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rOWYiMxSJgAkAlDyTUb91GiXzLnAGUjyME0Qe4hP3Y=;
 b=mnycNXhcJYT3j+BeXLzjSLLBrnSiNXk/jzWX8slvLWAGmzoJrz0zO8s+u/OKO64iD9amW2Z9vmHimjD26mqOLZwZVoUgiuO3ub2kcMgOvWLhrm5kk8TO3koSh/KS5JmpnWscm2vsGh5mVtQ7a4xJe6QA1XS8wYWR3tqx4jzDpww=
Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by SJ0PR12MB5422.namprd12.prod.outlook.com (2603:10b6:a03:3ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 14 Sep
 2021 16:42:52 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::384a:ae5d:717:8ba0]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::384a:ae5d:717:8ba0%8]) with mapi id 15.20.4523.014; Tue, 14 Sep 2021
 16:42:52 +0000
Message-ID: <864e45d0-c14b-3b12-0f5b-9d26a9cb41bd@amd.com>
Date: Tue, 14 Sep 2021 12:42:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: amdgpu: atomic API and cursor/overlay planes
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Sean Paul <seanpaul@chromium.org>
References: <JIQ_93_cHcshiIDsrMU1huBzx9P9LVQxucx8hQArpQu7Wk5DrCl_vTXj_Q20m_L-8C8A5dSpNcSJ8ehfcCrsQpfB5QG_Spn14EYkH9chtg0=@emersion.fr>
Cc: "Cornij, Nikola" <Nikola.Cornij@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <JIQ_93_cHcshiIDsrMU1huBzx9P9LVQxucx8hQArpQu7Wk5DrCl_vTXj_Q20m_L-8C8A5dSpNcSJ8ehfcCrsQpfB5QG_Spn14EYkH9chtg0=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::12) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
Received: from [192.168.50.3] (198.200.67.104) by
 YQBPR0101CA0109.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 14 Sep 2021 16:42:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e5b5127-7fe2-43e7-e46e-08d9779eb180
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5422:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5422373F45E65949A5439B5D8CDA9@SJ0PR12MB5422.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2meWrF2yXjl87SJOS4P1EEHlmMRXsqbVbkna5Fsdx+mLoa0dnoiJtU53aW7pm+5Oz6J9DENKLFKpuEnYRuf27WByNSnGp3gGy1B58kPMUiJz0b4LTwF2y4lk2PiWTa7Xm0NiYTEGFd2rA4OVlvOCV7+gYsuqLFHEw1ZDpM5pbXFQMq9iUOpBBUW6K5rbF/AnbWgxKBI5p+u6yWQH/NTt9xkzTBna82avPaps+3N3ObW1zyce5CA27gnvJJ8VKDHBGriJAd1C+VIUNQs8zobFf5TfJB9G5XRgkaVy0IE9rEXwyskN6P8vq/UVWLaSMveiJyEMIqv2lLzpaP2vPNYQIEYttJfk+kMdZ3xL2y17ty2I+u5JHr6fR69K9Qro2vIgP6SYVQL1mg5k5HTnf8xekZ1sLmcdH4oMM3+Q/t7fjK/GTpH80vUeNSE0qPORpo4ltzraRa2un4oHQpY0fxgoyd6O2mAp4sbjCwP4eTs49F+lvXgV/4yPpRUEm8KB2Pb3xpGFaiHxfifZzQd6CwKtEVpTBXAz79tW3S03DtIvK1eib9P5QH8b0bKbpwlOM7xulHOTCl4lW6gHkfuhzxzuoUPl9iNekcOH3H2RPm1dodsPlzDVhaq2YWUiGekbEiCmWnEV9LjIilLhUwTRTu8MZ8HoSH3zSwqWmAZU8qVeDpHiUObMne37+1JpH1D/rszPqW+riNkOVAV30Y3V2vYyhwlag5xZd/ZX+bdsYbUQ6muN+/N7pqKwbQWrQbrb7LnxDuG0oR49AeOFG+8U7stJaho7c4q5t+n3e3ltxXyu+HtwdgZByV5MSORjl/GFi9HbhGsZEkv0Inh2pNrNTwf6Lqr2qs/r+aCnDWmQau/U7eo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(26005)(6666004)(44832011)(86362001)(186003)(38100700002)(31686004)(36756003)(2906002)(53546011)(5660300002)(31696002)(6486002)(478600001)(2616005)(66556008)(956004)(66946007)(83380400001)(316002)(966005)(16576012)(8676002)(66476007)(110136005)(8936002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZqZncwUTZDQm5NQmJCL2dCTlFxR2NHTXphbHVrbUZsK1k0WlNBbkI1VExK?=
 =?utf-8?B?SFdtc3JveWJQUjRFVE9ZSXpKZVVvY0VHaFhrUUhUK1BacHA1TUgxN3hvN2VW?=
 =?utf-8?B?Q28xdTF0RUEzNmVnQUZrUUVHYk1Jd1B4U3E4c3BvemhGcDQxUTVNVk5XZmlh?=
 =?utf-8?B?R0ZGMEpWMXhtZFZ2TktjbGN6TWpWcnBnRnZCcXJobzFkb2lHMmxUZ3l2czIv?=
 =?utf-8?B?RXBqUDdGS3lOWFRsd0k4STFWNVBMcVVSeHFvL1BmSWU4YWowMXM5NExyc0k0?=
 =?utf-8?B?aEVZbGhkVGtZVCt4bTZvQ09rMDlWY0VGRWFUK2Ntd2lkY0t0cWYxS1ZKaUgv?=
 =?utf-8?B?U2lUMFBwMTV3MU9nalFCemhxNVRnMzMzVi8xVVB2MzdJSSs4N2Fwcjgvd1g4?=
 =?utf-8?B?dWJGYVpEMUhOTFpvU1J5b3J4ckxhV3B0bmROcWRFaE1LZG5HaW5MQ0Q3SmNp?=
 =?utf-8?B?ZlE5UU5zdElHMHhSUC9BQ0d5U2cvZmZhWnc5REdpYmpDNzhaUXVlY0d1bkZ6?=
 =?utf-8?B?TWdiVXVXTEdqbytlbE5kZk5mUjhRMjFUb3FWaE9DeWYzVXB4TkZRQUdzcGJG?=
 =?utf-8?B?ZFhYVWFJTnJOQk5URXN0NG9nUkxiZGFvMVZvZWlpSncrTEVJQ3AxQjZaZlNx?=
 =?utf-8?B?STkzWk9WRFVFeG5wM2hBaXRhMllWTHJkbmFZdlVZYklqV1VtcUR1TWdRdVNT?=
 =?utf-8?B?MVpVYXlGTSt3Y3R0ZjAvU3M3VkdpcXN5ZUR3ZzhhRWVxRnEzdUEyQk4xYUJw?=
 =?utf-8?B?ZkNJd1FiZG0zcEFmSUlaUkhBMzBPWEpnVVhrek4wdmtvdE9yTTBvQmFTd2FE?=
 =?utf-8?B?VHVhNnVjU0k5ZFVmOWhxUDZIYkQvNThkUWlLeEk5ZFQ0VWJ5MFIwQW9TMWRN?=
 =?utf-8?B?cmEyYnpjR2wzbzk4c1BRaU41SGVqWlNzSnR2V2VkZWppNlZac1pKelFDZU8r?=
 =?utf-8?B?SWhsazlLM3RNd2IyNW9NM3V0azhobE1pL0ZVdTNna09CUmJVd2FNcGZvZTFy?=
 =?utf-8?B?Z3NuYVBDd3pIOEJHL1ZWN3ByREpNOTJQZXNUdldyRlBsaUhKY3NndmhMbkZx?=
 =?utf-8?B?UzhWNmRodGIwc2xkNVkzNERERWc4aGkvZkZCbGdXOEhtZVg1QWF2dlJRelpM?=
 =?utf-8?B?a1Q2ZnpaM1hReVZVM0NxekpVQWs2eU8zM0lXbFcrb2hIUHU2enpCZ0ZsWENC?=
 =?utf-8?B?ZytxMmV1UUV2bm1LR2hCWElhY0V6aUxtWGE2R3Q3ckF1dnBZdHdDRDFWRTF0?=
 =?utf-8?B?NUZjS3ZEN29YbWQ3VUdFRzc2YkgxTXcwU0tCMW4xcFNIQnloRFhIT2lHV3F1?=
 =?utf-8?B?SkUvczZxb253WVVwTTJDeWtWVnpFMUt3Vk9rd2tubW9qOURzNG85MmFLR0pR?=
 =?utf-8?B?Z3VWa285dnZ2bGEwenJ2Y2pVQ2tyWU1vdlJ6akR1RDRwQUhEUXQ0OFZkZGtr?=
 =?utf-8?B?ellDbFJISXFqbWErbFpJS1dON3NTWE1wckdQbndsZFVoOEpqY1ZrL01KbHJX?=
 =?utf-8?B?K1lIR0krL1lnZ1ZjMUZUUlNVQ3N1RG80aGlNNzdqM3NlRTJhdTZnQ2s3NUw3?=
 =?utf-8?B?aTZEVUg1VTNIdXB6QU9hV29nRXRXbUQ2T2RxWG5KaGhjTllNbjlvTklZOU45?=
 =?utf-8?B?NnowSU1xRU44VUNRUEpMaWRsRmh4bWFhaVpNZjJZSmxsem5wdVV6Wi9GTTg0?=
 =?utf-8?B?UURtaGlINkZ5eVFweVkwak95VEpkMnlXV0h4NXJXZS9hSWJKdUNHbHpYbVJF?=
 =?utf-8?Q?EtORtIoZZiUud0WEo1cBtlk6LWYM9DdAk4prSFI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5b5127-7fe2-43e7-e46e-08d9779eb180
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 16:42:51.9732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9myOqxIhW/68adRxv+O048U3O/bnqTjei0U2EM3euNafNf1dDriui5IUVXXiMM7+JUYUn3oi88PiZaHgtwsjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5422
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

On 2021-09-07 10:03, Simon Ser wrote:
> Hi all,
> 
> Recently I've been discussing with various people [1] [2] about amdgpu's
> handling of KMS planes. AMD hardware is a bit special when it comes to
> the cursor plane, and it's not always 100% clear how that maps with the
> KMS API.
> 
> Up until now we were using cursor and overlay planes in gamescope [3],
> but some changes in the amdgpu driver [1] makes us unable to use planes
> (and makes us fallback to composition). Basically, now the overlay
> cannot be used at all unless it covers the whole CRTC.
> 
> The root cause is the cursor plane. The cursor plane can only be
> enabled if there is an unscaled plane covering the whole CRTC right
> underneath.
> 

A bit of background on why that is:

DRM thinks of cursor and plane blending like this:

┌─────────┐
│ Cursor  ├───────┐
└─────────┘       │
                  │
┌─────────┐      ┌▼──────┐
│ Plane 1 ├──────► CRTC  │
└─────────┘      └▲──────┘
                  │
┌─────────┐       │
│ Plane 2 ├───────┘
└─────────┘

AMD HW is designed like this:


┌─────────┐   ┌─────────┐      ┌───────┐
│ Cursor  ├───► Plane 1 ├──────► CRTC  │
└─────────┘   └─────────┘      └▲──────┘
                                │
              ┌─────────┐       │
              │ Plane 2 ├───────┘
              └─────────┘

It means that the cursor cannot be drawn outside it's associated
plane, is scaled with the plane, and treated as being in the same
color space as the plane.

> So one might assume that as long as the cursor plane isn't used, the
> overlay plane could be enabled even if it doesn't cover the whole CRTC.
> Unfortunately, ChromeOS uses the atomic API to setup primary/overlay
> planes together with the legacy API to setup the cursor plane. This
> means that at any time ChromeOS can toggle the cursor plane and will
> expect the cursor plane to work.
> 
> For this reason, amdgpu now restricts the use of the overlay plane.
> However this penalizes all KMS users because of a single user-space
> implementation.
> 
> After discussion with Daniel Vetter [2], it seemed reasonable to add
> a ChromeOS quirk in the kernel which retains the current behavior, but
> require everybody else to use the atomic API properly, ie. not mix
> atomic overlay plane usage with legacy cursor plane usage. This would
> allow fully atomic user-space to better take advantage of overlay
> planes with amdgpu.
> 
> Does this seem like an accurate summary of the situation? Does this
> seem like a reasonable path forward?
> 

I think it's a good summary.

Won't adding a ChromeOS quirk break old ChromeOS userspace with a new
kernel?

Though it seems to me that the ChromeOS compositor is doing atomic
wrong when it comes to the cursor, so the proposed solution might be
a decent temporary path forward until ChromeOS teaches their compositor
to not crash when cursor enablement causes atomic_check to fail.

Sean, any thoughts?

Thanks,
Harry

> Thanks,
> 
> Simon
> 
> [1]: https://lore.kernel.org/amd-gfx/SrcUnUUGJquVgjp9P79uV8sv6s-kMHG4wp0S3b4Nh9ksi29EIOye5edofuXkDLRvGfvkkRpQZ9JM7MNqew2B3kFUhaxsonDRXprkAYXaQUo=@emersion.fr/>> [2]: https://oftc.irclog.whitequark.org/dri-devel/2021-08-27#1630077257-1630078046>> [3]: https://github.com/Plagman/gamescope>> 

