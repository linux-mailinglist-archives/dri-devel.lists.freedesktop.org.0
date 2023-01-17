Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2A866E5D1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAC310E5A4;
	Tue, 17 Jan 2023 18:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3639610E5A4;
 Tue, 17 Jan 2023 18:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sVLrriLzNWuTkASPXhLh0iNImC/zJdYCmZuTrTCVsJc=; b=Q5D2FLsj5AdKLKLioJZglxOjkl
 IIhBuso9kgtbg0Nt8whjK8ysiKGN39oVMs7ku/gzdeJ6NuiHcjx1lZ6eBtmDAie6LHHjcx/mi4Ms1
 CLndNiczNMnplNit3tYgRF+dWbC0pxmvKN3qKJSIMj6Rr1poYPucdLhL1yOUgxN6iHVfooVR2CxJv
 Aw551yoluTq5wIj4u+46c7BKxzUtkCFzzqsl/jAI5fnGA9T4J08MDpAGsFxZAPLaeQy43/xVmKIrp
 Sku4x6Qj5CG0d5V5bEA3iYnFTndLDbNmkPlCEVcsPlqyUzqMZs1jQXtxtfj+/KYSmaGDjW0g6UVAF
 wjAwRyfw==;
Received: from [187.56.70.205] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pHqWU-00AqlK-NV; Tue, 17 Jan 2023 19:17:26 +0100
Message-ID: <0e2b4f14-11b7-5713-59a9-6add5f3cb32a@igalia.com>
Date: Tue, 17 Jan 2023 15:17:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/2] drm/amdgpu/vcn: Remove redundant indirect SRAM HW
 model check
Content-Language: en-US
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230117175836.914304-1-gpiccoli@igalia.com>
 <20230117175836.914304-2-gpiccoli@igalia.com>
 <MN0PR12MB6101FE6B2CC0AABB239DB06BE2C69@MN0PR12MB6101.namprd12.prod.outlook.com>
 <3526e25c-c0bb-a61f-319f-1c313f8fbea1@igalia.com>
 <MN0PR12MB61019DC93A66101D672C3E9AE2C69@MN0PR12MB6101.namprd12.prod.outlook.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <MN0PR12MB61019DC93A66101D672C3E9AE2C69@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "Zhu, James" <James.Zhu@amd.com>, "Liu, Leo" <Leo.Liu@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/01/2023 15:14, Limonciello, Mario wrote:
> [Public]
> 
> 
> 
>> -----Original Message-----
>> From: Guilherme G. Piccoli <gpiccoli@igalia.com>
>> Sent: Tuesday, January 17, 2023 12:14
>> To: Limonciello, Mario <Mario.Limonciello@amd.com>; amd-
>> gfx@lists.freedesktop.org; Deucher, Alexander
>> <Alexander.Deucher@amd.com>
>> Cc: dri-devel@lists.freedesktop.org; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> kernel@gpiccoli.net; kernel-dev@igalia.com; Zhu, James
>> <James.Zhu@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>; Liu, Leo
>> <Leo.Liu@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>
>> Subject: Re: [PATCH v2 2/2] drm/amdgpu/vcn: Remove redundant indirect
>> SRAM HW model check
>>
>> On 17/01/2023 15:08, Limonciello, Mario wrote:
>>> [...]
>>>
>>> Should have added this tag too:
>>> Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
>>>
>>> Looks good to me, thanks!
>>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>
>> You're totally right, thanks for the reminder and apologies for missing
>> that! Just sending V3 heheh
>>
>> Ah, thanks for the reviews and prompt responses.
>> Cheers,
>>
>>
>> Guilherme
> 
> No need to resend.  Patchwork will embed the tags when we pick this up.

Already did, but thanks again for the info - learning a lot in this
thread =)
