Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42F6360F8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 15:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB0310E221;
	Wed, 23 Nov 2022 14:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2047.outbound.protection.outlook.com [40.107.212.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C27310E221
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 14:02:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPZ/H7CGCrARxGTii/SjrAwr9uFvpJGi5nZFWk5ePAX9HRKIzHiLrkPSyFM5RAQ2g+RXfQC3qy5FbqsB9l/0Mj4W5MnTdb4GvqfttIlp9jp41TWOoL4DoB8aj0tHEpxs+H3qtNmL7cwuzmaDYcr9t1UKOHP4bkdtH0ME2jfqO6hkex1Tq/KY4XOTwbuS7sqkS9X8yjRo4OFPaj3rjBUeZGsU3VSRzgR0jXBP4D4ACHTSvmKygsRmA2Rwrix22+P+LHgaCcRggyIovF50mECRcmNYmG57zFfXOsa1v3KVASShRZHc/jxXQ/KCjMabHvkVr7EwRFX2P2uQ3ULdJRLVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iv8gYaw/qRtI0HwMFyuckvTW0U2lSCpcSLdSybVmV0M=;
 b=BThDzPnEIz2RKBsIzfAZ24qIPmSyQZV8Abf70EJPoztgoVw9k7TwfW/NypVC5IziXcWxb+wAXRvN+MP0FHkJ0E3sbiGp62j5qL+stcSHmzqhs584jD2/eumKXPyglaeWZrXhqJd1MyDwAKw91pNU65a9wmBzjMeACkOMTcTB1eQpzIegniIQUx6DPI/x011elgkBZPIeqfMVkjBWrFN5vTTJpoj1O7jnAYW6gYJAIwSEGa31TjbnLczzrLloNOst2T6KnwnfeeyQ4XUrsJV3VG3FA1OvZQyl9ki+0yYYqK8FKXEoJRXNM6zrU/K3bjtBTYqu0AXQc372OyB0WD2oqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv8gYaw/qRtI0HwMFyuckvTW0U2lSCpcSLdSybVmV0M=;
 b=INZoQWQMQJiTDTFNQfBBXUPWlZW3SPIhF6qgznjoApuCaxWA65CvEvMKJ4aUMQ5GYTwhXZ0VNvQr5RQ6ysMUSP1fYx/L1kXEG0cvlkSdUlNVl8yHqpIWZBGdm/TcSsGWBrVQn9uRWXba+D0NcKkC3RrwIpxkUGhqVrNdxOdpLnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20)
 by CY8PR12MB7146.namprd12.prod.outlook.com (2603:10b6:930:5e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 14:02:34 +0000
Received: from MN2PR12MB4502.namprd12.prod.outlook.com
 ([fe80::ff07:a59a:76b4:f06]) by MN2PR12MB4502.namprd12.prod.outlook.com
 ([fe80::ff07:a59a:76b4:f06%9]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 14:02:34 +0000
Message-ID: <799672c1-c2fa-900d-326d-8673ce9e6e7a@amd.com>
Date: Wed, 23 Nov 2022 06:02:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
To: Dave Airlie <airlied@gmail.com>, Oded Gabbay <ogabbay@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20221119204435.97113-1-ogabbay@kernel.org>
 <02c514c0-62c4-1cdf-5d3f-b3d8942ef005@amd.com>
 <CAPM=9ty_YHrM5QhAjgFvNdpkEwnB_WHsouhYG8m5XGrb+kmWAQ@mail.gmail.com>
 <Y3ziqU2vrgwIY4HB@phenom.ffwll.local>
Content-Language: en-US
From: Sonal Santan <sonal.santan@amd.com>
In-Reply-To: <Y3ziqU2vrgwIY4HB@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:510:f::32) To MN2PR12MB4502.namprd12.prod.outlook.com
 (2603:10b6:208:263::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4502:EE_|CY8PR12MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b9d575-cdcd-4607-9c4b-08dacd5b5ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C7y2y2gmTS2JG4mInTzTv2qssdnaZdVBOPo/NIAhBqXxyPOATx5n3OzCSirnvPrVTIHPPg+BFzdUF05oso93Y7aEdsrGxGpJj4wcRf+adP8NZsucxFhlHz2LwOEm/O5mzm8QYpz95BMgr8McJuYcLkEOtDYkm2sCGmC3O/HWz4ed21hfxhe+7BYSOUxPxp/IfqRfC5QEpl/HNTJEJsMH7z4vkGYtZr8iJNQ9xTYjQpdQMOP0MmadM5yvBM0K8CrrYB16dZkqdi/j9VRwh1N+uPvXoYTHeQV+OcHzpcNqBRKBHF2sSkTBEff5+UgevI3KNvQ2Lt1lQB6u3JpE13PjDPU26dICZy5dDTlTVU0emiqOfbQoLqnt5MMXDSS+Ko85tXfeEVwndcFy/U55raP2TqwP036MUV46bu4XgNHVcGNEitH++/Va9o3cXza8AmeNgjFXLE7NesKdGSgcrkVw7djkX4+JNth9eCDqV9Dps28G5QHLshZe3Uclw5OX48THHixjNH6W398x0b8N8jM/BpoEsZ72vQm/NnKZALduwlsetfbuu/dFiHbHQWDes5hflHd+AILNXCDW9J8h68Vw5DpZz0qrFrrCb+wFDeAWxjJFeb6WU6KNMRwywL+5cr9rluejD++WlhxdGk+jl1QnMWOB54Xijx+fA5WkYwpwowo8TkJOtVW7lORCoT9EjaMKXL24EBjfGEUgbnipTQdN1SSdmuLow3mOmyiIQrEpMk3AMW4s4oiCUtY45KF5kckA/C0bJrkQew+sWdhCh4KMTJ5u3XGU0BrTU5FepbWsFjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4502.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(186003)(53546011)(2616005)(316002)(110136005)(54906003)(31686004)(6512007)(6506007)(26005)(6666004)(66946007)(44832011)(5660300002)(8676002)(66476007)(38100700002)(66556008)(4326008)(36756003)(86362001)(7416002)(8936002)(2906002)(966005)(6486002)(478600001)(31696002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3JTYnVJSm9qNlQ5Rm5zNDRPNm1NdjBZV3l4UzhIU0ZYQnBCMXd0bm1NdFVJ?=
 =?utf-8?B?SGx2aklGeSs1eEhiUUtzQmxkbmN4VnBqQzhRSzdoOUF0UE1FMWZjTXh6NStX?=
 =?utf-8?B?cXVKakVvODM0NzZUdzFIc2lRRWNMM2hlWjVLd3lUM3gyNlROaWVQa0pHZ0Yw?=
 =?utf-8?B?eG9IbU10MUlsZVd5blhrUkpWOXpiOTI1Qk4wWVJRRlhVQXBaczEzcldaa3lj?=
 =?utf-8?B?WDN2RnpQVmtnQVlvVkRzdlRLSS8vM09qdldPOUN2QllsRVBiT0JhOHQ5djFa?=
 =?utf-8?B?YU9HcC8yVGozd2ZtTDloUjRkOWluMSs5eXdKNlZibTg5dmo1QnlJKzIyVEsr?=
 =?utf-8?B?Vlk4NGtLNjFCdEpmVDZaUHhyL3ZhMUZMY0h3blFBdnkwNHlMazlzY25kbFZP?=
 =?utf-8?B?cEswNzVTdkN4UEZoeG0wcWtwYmVJd0NTOHhKdDlLNGE2Ylg4QlhRWVA1Qngy?=
 =?utf-8?B?MlJGVlNOd2pqNGRWdi9mVkJKYnQ0QkYrbmdkdm91R0NTM2JkQlJ3VVVBRzh5?=
 =?utf-8?B?Rnhhamxuclo2S2huQUFYQXhSRjJOek03NG5SOGJHM2s4akdFbVM4QU05VnRK?=
 =?utf-8?B?eFR5R3hsQ0kxZWZnbUNIVjYwY3VPaXlvMS8wYkxUQUZBd09OZHYwWkpzeU9t?=
 =?utf-8?B?VGdCQUhVdW03Sm4xeWdSMVNsR0N4U25zUVJoNXFWZlBsNkNiQjRxZGpWTStW?=
 =?utf-8?B?bFd1RTVJZXRsQTBkekExNzU4M3VnYjZmUlpLZHp3MU5sb3pyTHJnVTZweW9B?=
 =?utf-8?B?ZzZMdjFaQTNiOFNzMlQ0Z0FSWW0yVjJnWHh4dlpqN3Jsc204U1U3QVlyK2lG?=
 =?utf-8?B?Tzg2eTM2YVkwc0NhT2hMWTMvbWNrTFJYWUJud3JuTzduVzJUMU1Vc05uVStX?=
 =?utf-8?B?d3lEQ3ozbmFjN2RPRnFPWXdRQzhpMDFmZ3BDcndzVWJrZTQ3ZDdXVGl6WjJ3?=
 =?utf-8?B?bWprSGI5VUJuMko2WEkrQnlwUGpHN283LzB4LzlKL3FNN0E0UnljbWh2SlpH?=
 =?utf-8?B?V2dZNXB2cllTb0l2QTFEdUdCcm9kNTR3Mk82N3QrN2JodXBYRWNaWG9pZkxI?=
 =?utf-8?B?YVBjWnhGeG1CUWpJMTREVFBvdmJSaksrV2d3OFAwNFM0SkN0a1MwL20xdnB1?=
 =?utf-8?B?QjB6cHNSMHdFYWZ6SUhYVjA5RmgrcHdwYWFaamRHaGZBaG8rN1owTTErRG9w?=
 =?utf-8?B?VUkxY2JhSyt3ckgwcFpqZzNXOHVmaE1BekhUdVNJM2JNNHk5TjBTZHk0aEx1?=
 =?utf-8?B?UDR5cXRGaSs2YldLcUd0c1BOOTN3Y3ZqRnVzeVUzRjR5anQwM2l3SE9KdEMy?=
 =?utf-8?B?U2wyUEJHc0Y3WFcyVFRNc1VSTTVBZitCSnRaM1AyM0kxZC95YngySldrWFBW?=
 =?utf-8?B?RzFoUDZJMUR2QXgvTnp3ZDcreUxQVDBIdjZJckxJOGcvUHY3RGE1M3lIa3Ro?=
 =?utf-8?B?anMybnZpTzFqL1RoS0tzK3dycjYvUGR5Vit0R29YR3dnSXl5WTBaNmxuUFVp?=
 =?utf-8?B?clZ2UGZkdnlHd1JNMkVaVTBQYW5Kbyt3Rk9VZFJoMEVQdmhuMzdEYjVzUzZs?=
 =?utf-8?B?U3RyRTNzNU1NQWRiamc0b1pzSWpUd1B4SjNGVE5iNVJmNE1DL2FZN29aR2J3?=
 =?utf-8?B?TjNmZUpkZUFnRW1XM1FORHhQNUdDdlVoNDJ4QThUaHZBUVZXMWVzcjdkeWVZ?=
 =?utf-8?B?VWlpdVllYzFyZ1phNkRpQm1SdHJtU1BnSDA0UzltWFIzS0R0SjlGcExCN1RI?=
 =?utf-8?B?QnVuVmJIblFtb1UwYVdvTW9IM1c2Y0FIdEV1WldnQVpSVU9aQVdqWkpmSU1E?=
 =?utf-8?B?VnN3djFyNy9FcUlKQnoxdG8weXFmNXpqUU5yQ1FIK0dBNGVGejBMbk5kRzJP?=
 =?utf-8?B?czgrZUpSSjFmK1Rqc3RZa3J4NUs1NTRjMmVhcXF3TTFpMG5CZ3BhYWpvek5a?=
 =?utf-8?B?cmZTa3B4aWErd1RDcUtmMTJyV3M5cDVpSmU5ekw2dEVkMlpUWW5DVzhuYk9G?=
 =?utf-8?B?dkRyVVpOTVhLdDZ3WXNyeFh3N2QxNWlsRWtNZHI5L3loenhSeHRzc2Vpanpu?=
 =?utf-8?B?RVhWaDBkYlpKUlA0bHlmODFGWW5rbmNBQ3ZQL1QwM01iUGZOMzRuejZ0VGt0?=
 =?utf-8?Q?v4qG68raKVXpT2bcDQgjVpDnn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b9d575-cdcd-4607-9c4b-08dacd5b5ee0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4502.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 14:02:34.5405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fL/xpenKoLl4x09UVTt+XDAd6MB8EKcGquH2kY6LdMkgbjy8P2o9u1M6BJu8khUU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7146
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/22/22 06:54, Daniel Vetter wrote:
> On Tue, Nov 22, 2022 at 03:46:25PM +1000, Dave Airlie wrote:
>> On Tue, 22 Nov 2022 at 09:06, Sonal Santan <sonal.santan@amd.com> wrote:
>>>
>>> On 11/19/22 12:44, Oded Gabbay wrote:
>>>> This is the fourth (and hopefully last) version of the patch-set to add the
>>>> new subsystem for compute accelerators. I removed the RFC headline as
>>>> I believe it is now ready for merging.
>>>>
>>>> Compare to v3, this patch-set contains one additional patch that adds
>>>> documentation regarding the accel subsystem. I hope it's good enough for
>>>> this stage. In addition, there were few very minor fixes according to
>>>> comments received on v3.
>>>>
>>>> The patches are in the following repo:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v4
>>>>
>>>> As in v3, The HEAD of that branch is a commit adding a dummy driver that
>>>> registers an accel device using the new framework. This can be served
>>>> as a simple reference.
>>>>
>>>> v1 cover letter:
>>>> https://lkml.org/lkml/2022/10/22/544
>>>>
>>>> v2 cover letter:
>>>> https://lore.kernel.org/lkml/20221102203405.1797491-1-ogabbay@kernel.org/T/
>>>>
>>>> v3 cover letter:
>>>> https://lore.kernel.org/lkml/20221106210225.2065371-1-ogabbay@kernel.org/T/
>>>
>>> Thanks for defining the new accel subsystem. We are currently working on
>>> DRM based drivers for unannounced acceleration devices. I am fine with
>>> these changes with the assumption that the choice of using classic DRM
>>> or accel is left up to the individual driver.
>>
>> I don't think that decision should be up to any individual driver
>> author. It will have to be consensus with me/Daniel/Oded and the
>> driver authors.
> 
> Plus the entire point of this is that it's _still_ a drm based driver. So
> aside from changing a flag in the kernel driver and adjusting userspace to
> find the right chardev, there should be zero changes need for an existing
> drm based driver stack that gets ported to drivers/accel.
> 
> And of course if we realize there's issues as we add drivers, we can fix
> things up. This is just to kick things off, not something that's going to
> be cast in stone for all eternity.
> 
> Sonal, with that clarification/explanation, is this entire thing
> reasonable in principal and you can drop an Ack onto the series?
> 
> Thanks, Daniel


Sounds good. The accel patch series is:
Acked-by: Sonal Santan <sonal.santan@amd.com>

-Sonal
