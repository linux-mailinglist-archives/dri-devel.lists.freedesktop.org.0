Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C070AC33169
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 22:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8465210E672;
	Tue,  4 Nov 2025 21:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="QT2Brp8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE2110E672
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 21:34:13 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d1MCk0hwdz9v6t;
 Tue,  4 Nov 2025 22:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762292050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b+dDwJ+0qI41d3Nk94wkdQOdtSTxFTbLoEYJNyRM9I0=;
 b=QT2Brp8Q4z/2gGipDpcjXBAthS1OVn4Df9xhyWHNQm4oZP0QohMcTVAuZBaTrh0t0R+pAe
 rBUWOSJP6ZJ+g2PkpIWoSuh4AeYMZ6YVcEkuSdlUQ48y4e5xXF8yS5OWGASlLSt+/bx9FV
 7i6C7On0YWeSViNFa5iMJzKilnWLLMNDp62kuKSuUJk8HwlRtGZdfh7lXjRzHNYCBUMPrk
 XqLXOGK1J4cwMYbazUxDiQ4aw/NkuRVtWzU67PrkmWu+ZzDyL0OTMI4Z8DoSCKRy3IP7of
 g1271tbxUxrTwgTo4E3mW4kWqB8SZE4NAydV9YNdSDUMZ5AkjJpLp4nuyCu7Kw==
Message-ID: <4ac9dd98-adc8-4be9-9f5c-4e653f656453@mailbox.org>
Date: Tue, 4 Nov 2025 22:34:07 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/etnaviv: add HWDB entry for GC8000 Nano Ultra VIP
 r6205
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250919183042.273687-1-marek.vasut@mailbox.org>
 <CAH9NwWcK_z_4CcDBRYS2nf3AxYV9-XwirvTd+O9uJtHMhyA3Og@mail.gmail.com>
 <CAH9NwWdkjpV5YHmOpuCE=f7RVm1kXzqAOgN6=Sx1s-wxO_SGGA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAH9NwWdkjpV5YHmOpuCE=f7RVm1kXzqAOgN6=Sx1s-wxO_SGGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: hgewqfoan3j377woijwwhgfm6xd9jmht
X-MBO-RS-ID: 6c9625f36239ef4b00f
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

On 11/4/25 4:50 PM, Christian Gmeiner wrote:
>>> This is the GPU/NPU combined device found on the ST STM32MP25 SoC.
>>> Feature bits taken from the downstream kernel driver 6.4.21.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>
>> Acked-by: Christian Gmeiner <cgmeiner@igalia.com>
>>
>>> ---
>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: etnaviv@lists.freedesktop.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>   drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 32 ++++++++++++++++++++++++++
>>>   1 file changed, 32 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
>>> index 8665f2658d51b..32d710baf17fe 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
>>> @@ -196,6 +196,38 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>>>                  .minor_features10 = 0x90044250,
>>>                  .minor_features11 = 0x00000024,
>>>          },
>>> +       {
>>> +               .model = 0x8000,
>>> +               .revision = 0x6205,
>>> +               .product_id = 0x80003,
>>> +               .customer_id = 0x15,
>>> +               .eco_id = 0,
>>> +               .stream_count = 16,
>>> +               .register_max = 64,
>>> +               .thread_count = 512,
>>> +               .shader_core_count = 2,
>>> +               .nn_core_count = 2,
>>> +               .vertex_cache_size = 16,
>>> +               .vertex_output_buffer_size = 1024,
>>> +               .pixel_pipes = 1,
>>> +               .instruction_count = 512,
>>> +               .num_constants = 320,
>>> +               .buffer_size = 0,
>>> +               .varyings_count = 16,
>>> +               .features = 0xe0287c8d,
>>> +               .minor_features0 = 0xc1799eff,
>>> +               .minor_features1 = 0xfefbfad9,
>>> +               .minor_features2 = 0xeb9d4fbf,
>>> +               .minor_features3 = 0xedfffced,
>>> +               .minor_features4 = 0xdb0dafc7,
>>> +               .minor_features5 = 0x7b5ac333,
>>> +               .minor_features6 = 0xfcce6000,
>>> +               .minor_features7 = 0x03fbfa6f,
>>> +               .minor_features8 = 0x00ef0ef0,
>>> +               .minor_features9 = 0x0eca703c,
>>> +               .minor_features10 = 0x898048f0,
>>> +               .minor_features11 = 0x00000034,
>>> +       },
>>>          {
>>>                  .model = 0x8000,
>>>                  .revision = 0x7120,
>>> --
>>> 2.51.0
>>>
>>
> 
> Applied to drm-misc-next.
Thank you.

I _think_ I will try to respin the flop reset patchset next.
