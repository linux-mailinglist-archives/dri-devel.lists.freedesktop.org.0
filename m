Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A046335C1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 08:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE6C10E0A7;
	Tue, 22 Nov 2022 07:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D6110E0A7;
 Tue, 22 Nov 2022 07:16:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrJvlBjMWQ/UqCHsnT7Tb0u7y74qE2RRpiOBP0tqa4xImUtatzAY+sK1dTG1e1NFadPUkQ21X4K9W8qbDc0q2NvisprjOMUyFSWNe/KuWOBGCv7GFoT8PhcB4aNassqXDmifDnQXQpaVMwfBXvmHDAhsskTzIlkxi1uY1DJjpGfjnsHRdpNbQTrUmWIi//ZoaRQTPPnTZYnOWdiqB73T92DqTvuxcUFF4RLR66d30GDNaHBEXG//WYH54QlR7uDV1Y7z8uXXb6SIByF+FrJ+tjzK30y/uS9uD6EL9x56YCBqUBwFFHO9yBH15m/FpV/sRFppDIni/D2Xm8AljfTlog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XcNwHLqudl+cc1ar9pjAA4k9ASzBXPPixGgFaStQtU=;
 b=H7jWy2mEtstS9mCJSkIkFjUAHDJPwzao2hQCeQAGrGqsgNZ33WDI1D9PUrjtTYrcoGpAvqPbSZ1dYqY1CAuz6PGkFwMOP/FUG4TM9aR2LnwyUJrSg2S28bwuqG4PbZ306RcEtQW0htl+9u6RSWUhXfvS8RRDpcca0cVZMjghpZVkQJWHdS8KAC1b7sebqh9pTNXL7Mq4K+MW886IrE9fQgt2ch3xIc61TZfdBO2BIwPujzIzEWpyheQVPNzLWxl72mQKKFMXc8ROpPzTbmkNPDAtVHnlzVPAozNVLKcmDbjk5TJ6k2mcFMtq+Mi0ntFooCdcTMrKbRvONLRDK74piQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XcNwHLqudl+cc1ar9pjAA4k9ASzBXPPixGgFaStQtU=;
 b=lB1dKvD9o2Y9hh+tUX5OTT6nPDGHdAW1V2E5+EaYupUyxXaSGLxT3ljJwVzsJgoSFjQqz71/XpwjRDfO/9LcJE3d35cWijEbVNEdK/EnL84ksYMKp1l1KT5cHvhEjdzK+2ukYjO35VzZLZ14vkiLSB6WOTkJujsVPd3Jnbv1s9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 07:16:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 07:16:29 +0000
Message-ID: <dcf71c8d-aab1-e1ab-72ad-6822a7450257@amd.com>
Date: Tue, 22 Nov 2022 08:16:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [6.1][regression] after commit
 dd80d9c8eecac8c516da5b240d01a35660ba6cb6 some games (Cyberpunk 2077, Forza
 Horizon 4/5) hang at start
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com>
 <a67598e8-c826-2740-03bb-33d37c8c8e4b@amd.com>
 <CABXGCsNvFvJz4=N=JKYSGVcd=dKfQ3Nv_zOssMb0Z6oK79xZ7g@mail.gmail.com>
 <a537212d-4b42-4ba4-7707-1e397234c8b7@amd.com>
 <CABXGCsMCfACsJRDPqZDYQGMpaA_6LKhQ0XqAmDN04GSMeetXnA@mail.gmail.com>
 <ca6c98eb-fdb0-5fee-3925-5b697e3e6b50@gmail.com>
 <CABXGCsPJFvNXfbdR=_sb4gLdd2E30aRN9usSiZc2XYmZNSKBcQ@mail.gmail.com>
 <dc802bd0-ed77-d268-25e2-1cf162202912@gmail.com>
 <c5c4f572-4720-04ff-3c70-30bba9c37202@amd.com>
 <CABXGCsMW7+dWU0S8ePUygWkkvmLBiHU8gSBKZcSMsBCE_gv4Ew@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABXGCsMW7+dWU0S8ePUygWkkvmLBiHU8gSBKZcSMsBCE_gv4Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f96a18-550d-4d40-e7cb-08dacc597975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygPa11c3A7jzyAzbFGL/xeL/SvUktc4r2Z/MIyZiSMv40v0UA5xJxzib9Dh6mAus5Kd+ULKIAJxs3W/63hGeda87q1RDLPp/CtZmAa5ywRrOftl9o3JA85bKTRfJpKjbGpxlxiXXP49MyTAVn779JD34XZRYH4jy9H6haTJAF+NcGHWxcyF1T8Sdo4pAG60CiqKHfclzc6ESljfLcl6Zd4m4zWokCURWp3WNN/S8DOYr+EfkH2Db0z/L4T8I6pXWAc7PilxKOxQwXMnIW+a/ufG5XOdMhOTnFnyLVbvWC7aByI/qWGXR5GfyVxENKlqqFdAyjgUEyZZUxaUoOYxIL+gladTTVwYvuP27bGDlqBZWKGs4QOkSC0N8oY/ppY/DcAJkSwajR2WRPm8xyioJuG5WIXMiwOx12QSiAy86VQ7ozgBNIyyJeF8ihRx5aHsqEQcKWuF3bCSdCDSbC4g1Zvx+0xWWiMhrnWvIl5PF2e6kovofeO/NDQq3ZTM5V+/Ets6nXgOJqEtadmb+9ZcWVgn60RM0V973QGf96bZSiA20SWO/ayeXfLV/ihoX/vuLaFzoay1B9QWsGrRmGpHFQI5UzuJ9aWe+lysSewzNi1qjd/8C/r4JhCtjOdhIYTa19OFcEdJeCAAEbzlTJCcPvYs/kwZR5Bp62hO2Oh7Vy69oKsWEJ8je2R3JwniAgEFYt9WHud80nzZ4TsujJWuTYynRmkdRrTlaKqlScsGO/HO6G+3KS+6xwzjxGZmh7M9F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199015)(2906002)(31686004)(2616005)(66556008)(66946007)(53546011)(41300700001)(36756003)(31696002)(86362001)(4326008)(6506007)(6916009)(54906003)(83380400001)(38100700002)(8936002)(6486002)(5660300002)(8676002)(66574015)(66476007)(186003)(6512007)(478600001)(316002)(966005)(45080400002)(6666004)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzg0RFFZMVczS0UzTmN4cnBWeGZiZDN3N1RIZE5mVW1TbGt2RVNqekRIUXQ2?=
 =?utf-8?B?VEpudUJxRmZVeExlK1ZTdE52dVhncTZHaGwzT1YwNWhBTHFraVF6NjEzL3VX?=
 =?utf-8?B?WDhkaWNHUWErZXk0ckhPT2NBL0MzeWd4UjhoQm9GRFNFRVlqRUd2d0N2Zld4?=
 =?utf-8?B?RHBYY3ZUOW1DNU1aMzBTQ0NuVUExakpzck1UL2h3Rk9PZHVzUHUraFFuUjZ3?=
 =?utf-8?B?R2ZQbDdzelFvWENiUTJFUHhQcWF5NG1KNDhYcWsxdXpaUmx2Ry9iZnNzbFd3?=
 =?utf-8?B?KzFRWWhuV2NBRjN1YVF3UXRsN3ZTWG9zZThLT2hDaHBiVHNiaVBKU0Rrbk96?=
 =?utf-8?B?UytWUXlYRnBUT0ZlYm5oOUdBTmlDUHlGNU1JYW1Uc3VHZitEK0J0MStScmVZ?=
 =?utf-8?B?M0RETUtOZ0EzcTgyVFFtUERZdkhCdmVvYnlQTjlSWFBRb0ZUYzJaVGFjNy9N?=
 =?utf-8?B?ck9CU0JBbmVZTzJWNnBiMzRLbnFuTXA5dS9tNnBLSjFjOU5UYUQ1SC8wbWpX?=
 =?utf-8?B?cDIrR3BkK3NXTFR4Yy9sdG9ZcG1kdFkydkI5dldNTys4bHoxa1JyKzY2RHl6?=
 =?utf-8?B?SFBwTFpjQ0xzTWozckRTYWo1OWp5YmtQZzcvaXZ5dFlWMm5XL3Blcnp1M3gx?=
 =?utf-8?B?OVp5ZjRaRlFaTC9qMGJ2UG5FV25nTGRPckJaL3Vyb3NyTldvTVdERDBQbkNS?=
 =?utf-8?B?eDdMY214cHFXUGJkekR0blFBSjlqdTlCOC9ickFLdXNDeXFGeGsxU1FSUklH?=
 =?utf-8?B?cDZhMmpzMGllV2lhTXBHbFZoN01VR3pVOUgxTGExd1NicFVNRXlETWhzNHov?=
 =?utf-8?B?T0dyRXpISUVXVnJraWVPOXJRajZFelc2N2phck1BeXV0eVRTZ1Q1SzNLaEJH?=
 =?utf-8?B?OC9oeHRIbEI3K21rRTBGd3Y1dXdLMDZwek5aQ2dFUFVaR0U0VSsrYyswRFdE?=
 =?utf-8?B?TnBOMm9rWkNxZVMrSHVRYnNCSm1reGswNHhKS29acDM2dVZVVjl0TUNPc1Az?=
 =?utf-8?B?QnczT2ZUR3FqRENabmNUVk92MUU4cFF6eHR3Y2hFem5vQkc4TlFudm5ORmFk?=
 =?utf-8?B?VXg3MkdnYmZ5TFk1Q3BQR1RYbDF3akR4SFBObXlzc0VaQkRpNUhDU0hTb1d1?=
 =?utf-8?B?eiswOEkzYm42M0lOamowQXZDcnh4M2phY3lKbXU0Y1pQNWNJRW03SWpXRndt?=
 =?utf-8?B?Q04yN1RCNkRqVTUzcnl5RkU4NkxEaERMZzRpaEV3TFR2THJndk1VZGFvM3NX?=
 =?utf-8?B?a3BkVVpYMzJ0U1RyVVFaV0NPTk5PQ2pBZ3VKTWdVZUVjQjRsQ3NhaEZ1VVA0?=
 =?utf-8?B?TVZYaU84b3psdWpTWG5mZmRGMTBMYlIwTUJsbmdHd1FCODFLQUVtSlAvbEhu?=
 =?utf-8?B?YTkyOHhtTUQ5ZVVtVUMzZ0ltM0dMQlpKR1dYWDNiSGpUc3BKbU1ROVNxQ296?=
 =?utf-8?B?Rmg0MmhtaFVkdTBwTXVwcWQzZDZDdEhNZmJqY1FOUUpJaEo3eDh6SVppbVlQ?=
 =?utf-8?B?QXJMUkZXRXcrejF3aERLOXRzQU5CZ2UzdVhnbmR0YkJZNHlxSElUYnBmVHZR?=
 =?utf-8?B?RVRwekRXdXJFQ0k3bi9SMnZPY1k0djhBQk9xV3JiMWxZTERneDVBWkFHLzlP?=
 =?utf-8?B?WWh5Zk9MZUpKRjM0S3d4eVZEZmNrMmtYQnZjVGhML1k1azU0YWlpOHA5U2M5?=
 =?utf-8?B?WEE0MXlia0h3a05Xb1R3bmhLNWxXQy9xbHdlNllZUzRUbm9qTmdCVTlwaEx0?=
 =?utf-8?B?NEYrdXZYcVFUa1Myd25yNEEwZW1ndi9zQ1l3SjVyemZ5Q0h4cTVoWnVPVEt2?=
 =?utf-8?B?MjQyN1dndVErQjNhVVoweVJRZEI1YldZRHVQZVI2a2FONTVSR0F6Q3R4MDJH?=
 =?utf-8?B?d2RkdUp3YytMRkUwK0tmRnVRMXZ5U3FPTnppejIzUTFpVnVVS2ZlQ1FlUTdD?=
 =?utf-8?B?MnZXalJYN1pHRjh5QVFWazhweXd2bjFvQ0c5MDRWU0ZaaDZ6aVYxT1NXNjF3?=
 =?utf-8?B?cmVpNzhIK1RwT2FpbnpXZHRiRkE4VGd1YWxlWXZoRWgyREJPdHMxcDYxSStn?=
 =?utf-8?B?WjFBcEFHT1NEaDhXeFB5b2N0UmNDeVZyTTZBRHJFeXVqUHBrMlVCV21oVkpz?=
 =?utf-8?Q?5Oy7HB6r9u6FJU5Uk3DCvRUgt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f96a18-550d-4d40-e7cb-08dacc597975
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 07:16:29.0459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrydETzeiRB6MN0dHLdQe7qe6Pyry0QHjRORHeHdr8EGuF11LzVHeY81EGUV9rbk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.11.22 um 00:42 schrieb Mikhail Gavrilov:
> On Mon, Nov 14, 2022 at 6:22 PM Christian König
> <christian.koenig@amd.com> wrote:
>> I've found and fixed a few problems around the userptr handling which
>> might explain what you see here.
>>
>> A series of four patches starting with "drm/amdgpu: always register an
>> MMU notifier for userptr" is under review now.
>>
>> Going to give that a bit cleanup later today and will CC you when I send
>> that out. Would be nice if you could give that some testing.
>>
>> Thanks,
>> Christian.
>>
> Christian, I tested all four patches around week and can say that this
> issue is completely gone.
> All known broken games working.
> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

Ah, thanks a lot for this. I've already pushed the patches into our 
internal branch, but getting this confirmation is still great!

This was quite some fundamental bug in the handling and I hope to get 
this completely reworked at some point since it is currently only mitigated.

> The only thing I don't like is the flood in the kernel logs of the
> message "WARNING message at drivers/gpu/drm/drm_modeset_lock.c:276
> drm_modeset_drop_locks+0x63/0x70", but this is not related to the
> patches being checked.
> All kernel logs uploaded to pastebin [1][2][3][4][5][6][7][8]

No idea what that could be. Modesetting is not something I work on.

The best advice I can give you is to maybe ping Harry and our other 
display people, they should know that stuff better than I do.

Thanks,
Christian.

>
> I wrote a separate bug report about "drm_modeset_lock" [9], it's a
> pity that no one paid attention to it. I even found the first bad
> commit. It is b261509952bc19d1012cf732f853659be6ebc61e.
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpastebin.com%2FWZWczupk&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C5df2793e7deb48add3f008dacc1a176d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638046709676882205%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=wdVnVqVbQ2Ru1fZRmg6P%2FAvP6n98%2F9lkbFQJMXFX%2BBo%3D&amp;reserved=0
> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpastebin.com%2Ff4i9pvjS&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C5df2793e7deb48add3f008dacc1a176d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638046709677038445%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=MnnBdy%2FaxmTwfu28WHgGW7Pu9glPsHDsL6oZ8lQl%2BoI%3D&amp;reserved=0
> [3] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpastebin.com%2FrsDWaMR1&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C5df2793e7deb48add3f008dacc1a176d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638046709677038445%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=SOC29d5HCDj1qiLQl2KMTea7K1TCv4WCIi0EDteUwcQ%3D&amp;reserved=0
> [4] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpastebin.com%2FtDNEYJq0&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C5df2793e7deb48add3f008dacc1a176d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638046709677038445%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=xNrjwqAUVWYIzsS6zkci09ursNvlufn1dHFJtyx7N40%3D&amp;reserved=0
> [5] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpastebin.com%2FxfZVbm1f&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C5df2793e7deb48add3f008dacc1a176d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638046709677038445%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=B6P5oIjmqQbaet56%2B3eFWM4%2BrYvqLdRxuzG4DvCsrQw%3D&amp;reserved=0
> [6] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpastebin.com%2FVx9gDyKt&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C5df2793e7deb48add3f008dacc1a176d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638046709677038445%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Im0yuNgmRl8kwiAbZD284dp08jyrtIpTzNa9qsTYnfQ%3D&amp;reserved=0
> [7] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpastebin.com%2FXvRkLckV&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C5df2793e7deb48add3f008dacc1a176d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638046709677038445%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=sHeQUZGur1kC5PEJV18KwNHha8WUPNj9wgAfNusg4H4%3D&amp;reserved=0
> [8] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpastebin.com%2Fpd8WBkgx&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C5df2793e7deb48add3f008dacc1a176d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638046709677038445%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=SWI76x2nLqiI%2BLWSfBo8iU5nYMnIN9gplDdhsg8jrFg%3D&amp;reserved=0
> [9] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg367543.html&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C5df2793e7deb48add3f008dacc1a176d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638046709677038445%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=M7VtIH0pKJJ1PpQ3ihnbC7w7PEXRfZ1CfYx9bRzEH2U%3D&amp;reserved=0
>
> Thanks.
>

