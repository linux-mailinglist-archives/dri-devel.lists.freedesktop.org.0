Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B78ED3B3021
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 15:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F786EB91;
	Thu, 24 Jun 2021 13:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2085.outbound.protection.outlook.com [40.107.101.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F88B6EB90;
 Thu, 24 Jun 2021 13:35:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ud0DX/bZSY7AbLUMDJ89vt9MGOB1dXdqrYY9/jAVVXIBnrVyHw6WQuV6DRxMWoAVE0MQaJWZhb077DFjHkbdF1QBADdGmVfBKYm+SpEV7Ywjd5J/aJL397hlnA4DtKBAksusWqI654ZJeU6pFaQawq7TZqacSxZ2ZjXS6hVIWecCz3IOske0XIBe+hkbvhls06dZ0kyy0vcKhQlYXuCGQ5fPdBF7xaR653CINUJ7X9+mHCJ3rkHQffSTd49fF/2ibd7qwjabQPStxOXr7TMHfRvxP4xwVCV5CyftuzQaitLZ//qaHviG9L06n9AzR09jmRnMWnj58iGRxWfUMfb1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsOzKu7Hj0n42rOpCIjUHjqREcCVMuotiuvH1N7Nwkw=;
 b=DBmRmRm1uNBWPX3KKAYpAa/Gph5EauG22q0R8xug8M0IbxHldssqAWVfIfQQ3F1Xp70dbBAHwzG1pLwMX06jVut4ildX8Y/gnCMsE7AdRs+tl2ydPtLPrmk241Y5mrjNp/X2eqWF7MDt8HFYqxGSFwcGLJXlQGwHP9W1RiPUGlf5cUC9s/L8xvon2aNHsjP5+b3vjDucZL0WiGkpEyd81lLxfFSie2+NDu87eemq7QVG1YHJwZJcVyri4QUCFwbE0+44KLZUgl4TgA2XZj1QBo+b//Bomri59HHfKxnEMxMu8X3n4P3WlqdR7kUW7Qr4zl5uot6iMWP3lKVof8dR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsOzKu7Hj0n42rOpCIjUHjqREcCVMuotiuvH1N7Nwkw=;
 b=K3UldxIG0BxDbujdim+UIFNOLNogXNhlSo+oLn0IHwv9kP1yZw01tVBpbDvu69Yufxh/YtrwTDX3E4G7i7HCGoWFxWbYK3RSiqgUtT+SOs1RJ/D3YU3LzRX0qX+Fv/iuk2qOyelyWyTjxuoQZakz8ifRWBp4XMfr+kS8/EvChxo=
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4929.namprd12.prod.outlook.com (2603:10b6:208:1c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Thu, 24 Jun
 2021 13:35:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 13:35:26 +0000
Subject: Re: [PATCH 14/15] drm/gem: Tiny kernel clarification for
 drm_gem_fence_array_add
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-15-daniel.vetter@ffwll.ch>
 <4ed8f1d3-eb9c-74d6-d93f-ee28971af7f6@amd.com>
 <YNR9hSMVmzYmotF0@phenom.ffwll.local>
 <4fba7964-3306-4e2a-f87e-906ebedbe7fe@amd.com>
 <YNSJaizc5BpmTM8p@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3800d89a-3591-daf5-6a9a-292f95c58619@amd.com>
Date: Thu, 24 Jun 2021 15:35:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YNSJaizc5BpmTM8p@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8a1c:e700:29c4:44b6]
X-ClientProxiedBy: PR2PR09CA0019.eurprd09.prod.outlook.com
 (2603:10a6:101:16::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8a1c:e700:29c4:44b6]
 (2a02:908:1252:fb60:8a1c:e700:29c4:44b6) by
 PR2PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:101:16::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 13:35:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70f3e53d-addf-419c-20e2-08d93714ece9
X-MS-TrafficTypeDiagnostic: BL0PR12MB4929:
X-Microsoft-Antispam-PRVS: <BL0PR12MB49296ACC694C74A3B735C99883079@BL0PR12MB4929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I2hBUeYmFWbrrexQ0oOuulI4KfPTgJjwOJvqgQ4ZPbRd4WKUikG3QgYlMzfRStYrPJKiOzeKtutifi7PUeYiWresukhvO106qYuxFGVVqy5sDZkQf9aUtvqMfjvNKSaCOphNHYWUj9Mygk8ocYd/tT8hlReiRa2R6jY1WRPTJTgI4PHfwnVIFC2qq+ab5gfyxyYv7idTWXqrAfxL6XQ6pgOa1206ROBPcNOUZyywhocXmgNsvdtGZUIzG/K7ho2NaBHsFVzaoXOBuzVIyAkX+gAJUG++aMekd9CE2oIcWJ+MdtdIQvwPfwKdMS1dAETyYPSQUXiJ5SQ7ksce1H1xd9VB2WCJv4EwvQ9ZD2+Pb+Cm2LeqBOjUCJns650CuHdwmlCpQAsVRKimJfN47jozVfB+XVbL4XAbMGD4CxJPx8YyePU+eqjtq5QBX1zwTrP5sZrNnCtRhUMMiJHDiu1jeT7ueegtH75OWZpfb7PAUFs/lalokdGdT1EksX4s4T/Po+aEqPRPKm09iMsa0Ogt3H+mN2o7+etIR835B6vdTfsuZRtXiYNRHebU0Jo6w4jHJe9ZsqU7hRaoNEdIOZWGlIhmf7iG6yAdHMcLxqOpa7JorWU5hItgn+Ka0x5aV4785qqRgGmKpnlc9p/Z9izUrAWqYu1ZS1less5ySgnLEGqK7rxwo7WH3v/NWYxlFC3x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(7416002)(2616005)(8936002)(83380400001)(4326008)(6666004)(5660300002)(186003)(478600001)(8676002)(16526019)(36756003)(54906003)(316002)(31696002)(38100700002)(31686004)(6486002)(86362001)(2906002)(6916009)(66946007)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXFyWkdVL210ZWFEMHBrMTdHbjFPNXhDd2VtZURYdkRkTWN3enRseDlkTzdk?=
 =?utf-8?B?RGpxUzFqSjdNMnBKdmRXWVdKaXpHaHdKSDhHQzI3VGtpOC93Nk1YQ3VDVFFQ?=
 =?utf-8?B?a0lLTmtwR2xKSzE1dHBpK3hHYlRidVErSHpGeVRiK1ZMVnZuaEJTOHhvaUQv?=
 =?utf-8?B?SUYrejZwUU9JUEJHODA3bUIxdU9Eb3lEU1YwRncrZGV1Uk16eC93eXhmZHN3?=
 =?utf-8?B?SGsrdU9JMWR5TDVpaUJzbFdjR2NIZUJyVC9hSnJXcHBPREJQb2VLaWhMSkxr?=
 =?utf-8?B?dGVkcG5CYk1HUHZLSG91bXIybWl5Umhxa2grUEI0cVNubUFoRGJWZTlDYkg0?=
 =?utf-8?B?REkxZ3dSMHI1eGpMOHhtRmlwZi82eGhiZlNjZ0pEcHVTRXpCc0xHUlgxc1Rk?=
 =?utf-8?B?bVZjN2pyNkJNU2NSQWFHN1pTVGlPRnJBdmZiNG1ZWFM4NDRrU3FYVjZMSjJ4?=
 =?utf-8?B?WkIrQjhBeUtGc2RKTmhRMjdLZkQ2TXhBa0tyK25QR0hkWTE3cndMNk1rTGFF?=
 =?utf-8?B?VU5WWTEvdmRkeFcxUHhUYm9jaEd0ZjEzV05PeXlmNWdXMkZDUlJHY2pJWXU2?=
 =?utf-8?B?Uy9iMHN5enRmWjhoNy9BMU9CTTcyWlZPRzZ3ZUViZEx5eWxtVGJybWxDQzcz?=
 =?utf-8?B?WUlJdlFUY2RWNVZaL0hFN1VscjJaTFdpUk5oUXVlV1BUREpBOUdGaUN6OEs4?=
 =?utf-8?B?M2EybFdxZmJ0SnRCU3BjOXp6aWhLaXVYajNtQWpBZmQ4Y2lYd2NaWDR0ditK?=
 =?utf-8?B?MHY4WHhCcmdBZHFkNkZBTzRUQWNHeUF6OFFGOVFCZHBHajU4N1ZsaG8rbnZn?=
 =?utf-8?B?dXEzTlpDaDI4UkdlenlHanJObE0wTE1sdm9qRnN0ZExhZTF2aCsyc2tGQzl3?=
 =?utf-8?B?QU85THlDSElLZ1JZSzlHTnFkUGtRYWlvVTIzWnc5clhpVG0xRTVaeHhpaUlW?=
 =?utf-8?B?VXYvdWlhZ2d4TnRRRUNFWm9TUVlmYzZmbDg3a2FYUWJ6aWh4QVF6ZmNVS1I1?=
 =?utf-8?B?aXAreE5rVkNQbFl1WmVDaE9JSFJKcTN1QmVtYkFDTVUyenZRUlhWUGZDalQ2?=
 =?utf-8?B?TWZnRmx3OHVBTXNHaXA0UytmRXZ6SlViaVF4a1cyNVdmcXpiSkxjWGpyelNa?=
 =?utf-8?B?VEFQYi83YTI1SzBzNXJVNXRYMzQ2TlYzWTNmeUE5b0VBWmIzY050UG01Q2pi?=
 =?utf-8?B?QW93SlFNVDg1WTc0cjQ5RnRIb2dHOEM2Y1M5a3QybTh6QWh1RGtZdmN4WHI1?=
 =?utf-8?B?YXhGWWNVN2dlU010WDRibmNZTm5KcVpBMUFkZXhaZ3NGZ01zeUVpTU9ocVdF?=
 =?utf-8?B?cGJIeVhtczYwck4vamlWdEMwUFVTbzcrRGU3QjEvMkFwbmtPK3VYcFlOd3Fl?=
 =?utf-8?B?NyszZEdncVkwNTZPMzZCcHZaNzRVeC9BRUxkZ2VTelNxL0N2dzYyL0Vhbm1S?=
 =?utf-8?B?V0diVk8rdWIveEtTKy9LL2VIZWZJaVN2YmF5MHROTjFXcU9yRC9zTzJ6ekNo?=
 =?utf-8?B?OHQrc1ZBK2JKTkJQbjlPRGJncktrNXhBdnlGZHpMcHd0WTA0UEVTMjhteC8r?=
 =?utf-8?B?UmZ4enovNHRsRWRjUmF2RnNyVW9oNXRiNkZaUUZYQkRUMkJxeEFZbkVCdGZn?=
 =?utf-8?B?aUhBV3pJbGNYdE1MQW8zVzFKV2FxdDVFd1ZxV3lpMk56RkJ6bWErMEV4aHNt?=
 =?utf-8?B?L3k1KzNRZ1AremRBZmNKQ2s0UHNqQ3h3UnEycDZWWmdhUUNpdjFXaVZ1bW5B?=
 =?utf-8?B?cDZxT1lRZ1A2UFoxbFZkRVAzOW5rV1JyZElmUUtoZkRINGk4RlNlcFdOUWtk?=
 =?utf-8?B?eUtIN2Y2QUhiZ3QyVnhmaFFySTFQekpUZzlZRlNlMTl5L00yMGk5YmlrQSsz?=
 =?utf-8?Q?Y+NdK1/xcwT1m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f3e53d-addf-419c-20e2-08d93714ece9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 13:35:26.4170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQeana9K59dx9zv9PcBGAASlKledh42GL5oguT1iaurOWqv4MQ9T771BvnY1K6wf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4929
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.06.21 um 15:32 schrieb Daniel Vetter:
> On Thu, Jun 24, 2021 at 02:48:54PM +0200, Christian König wrote:
>>
>> Am 24.06.21 um 14:41 schrieb Daniel Vetter:
>>> On Wed, Jun 23, 2021 at 10:42:50AM +0200, Christian König wrote:
>>>> Am 22.06.21 um 18:55 schrieb Daniel Vetter:
>>>>> Spotted while trying to convert panfrost to these.
>>>>>
>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Cc: David Airlie <airlied@linux.ie>
>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>> ---
>>>>>     drivers/gpu/drm/drm_gem.c | 3 +++
>>>>>     1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>> index ba2e64ed8b47..68deb1de8235 100644
>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>> @@ -1302,6 +1302,9 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
>>>>>      * @fence_array: array of dma_fence * for the job to block on.
>>>>>      * @fence: the dma_fence to add to the list of dependencies.
>>>>>      *
>>>>> + * This functions consumes the reference for @fence both on success and error
>>>>> + * cases.
>>>>> + *
>>>> Oh, the later is a bit ugly I think. But good to know.
>>>>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> Merged to drm-misc-next, thanks for taking a look. Can you perhaps take a
>>> look at the drm/armada patch too, then I think I have reviews/acks for all
>>> of them?
>> What are you talking about? I only see drm/armada patches for the irq stuff
>> Thomas is working on.
> There was one in this series, but Maxime was quicker. I'm going to apply
> all the remaining ones now. After that I'll send out a patch set to add
> some dependency tracking to drm_sched_job so that there's not so much
> copypasta going on there. I stumbled over that when reviewing how we
> handle dependencies.

Do you mean a common container for dma_fence objects a drm_sched_job 
depends on?

Thanks,
Christian.

> -Daniel

