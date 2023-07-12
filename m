Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B2750D16
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFE910E587;
	Wed, 12 Jul 2023 15:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AF410E593;
 Wed, 12 Jul 2023 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/LA9COlIU72wXOo48I7k1NI7ZbF0OR3REqVWyrDeAeo=; b=b8IbGxSWJ84XVFQ/0aBKKq9ztQ
 Z6VZU6wa0Eqc7+bc/T4iEcgWvgD7L0etQhVY8CDBpoBHELwzuX4d4H/dc/iRitoIwnVP/H4uWhz20
 HnnHfrYg+DKUcAdXNGHBiQ92x7IRW6guSL5hKUxtDBNu8m9wQijtjZ9TsONech1sfb/ulFaZXzq79
 zVr+zVglocJRU8sKlgYTVMPquiJ2vK9RTsqjBrgjfisZo4bJY35xsbtUeKlR0cwR0XoO1xr4K9GFu
 hBFvVUFZWEYgxl9o2Qmz8PAEn2FV5aediAUTO1YsaNpMaq3AxZ797AJcBu9zSpc3arIO23gLxrYsV
 uR1dwsaw==;
Received: from 201-27-237-219.dsl.telesp.net.br ([201.27.237.219]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qJc7G-00DBW5-EG; Wed, 12 Jul 2023 17:50:59 +0200
Message-ID: <ed9963a1-b065-e1bf-60a4-d3dd4e57313b@igalia.com>
Date: Wed, 12 Jul 2023 12:50:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max
 selectors unconditionally for DCN1+"
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230702164407.6547-1-gpiccoli@igalia.com>
 <54092b91-a9c6-7276-1633-13b83a92524d@amd.com>
 <3e4892a5-f8a8-805b-aaf9-c9aec64d9607@igalia.com>
 <CH0PR12MB52846616C04D37205DD1B70C8B36A@CH0PR12MB5284.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <CH0PR12MB52846616C04D37205DD1B70C8B36A@CH0PR12MB5284.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>, "Patel,
 Swapnil" <Swapnil.Patel@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "cristian.ciocaltea@collabora.com" <cristian.ciocaltea@collabora.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 11:47, Pillai, Aurabindo wrote:
> Hi Guilherme,
> 
> Sorry there was one more patch which I missed to attach. Please add this
> 3^rd  patch and retry.
> 
> Reverting that patch would cause high power consumption on Navi2x GPU
> also cause hangs on certain multi monitor configurations. With these 3
> patches, you're getting the same effect as reverting the aforementioned
> patches, but it makes the reverted sequence available only for Steam
> deck hardware.
> 

Thanks a lot for your detailed explanation, and the 3rd patch! Indeed,
amdgpu works fine on Deck with that - great =)

Feel free to add my:
Tested-by: Guilherme G. Piccoli <gpiccoli@igalia.com> #Steam Deck

Oh, a fixes tag would also makes sense, I guess.
BTW, if possible to submit the 3 patches in a proper series to get it
merged on 6.5-rc cycle (the sooner the better), I'd really appreciate!

Cheers,


Guilherme




