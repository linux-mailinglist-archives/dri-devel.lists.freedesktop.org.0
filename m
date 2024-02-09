Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9DC84FB06
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 18:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9107C10F843;
	Fri,  9 Feb 2024 17:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="fXW13YKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AAE10F842;
 Fri,  9 Feb 2024 17:29:44 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4TWgpH4LXCz9xHK;
 Fri,  9 Feb 2024 17:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1707499784; bh=GNXFfuIo6etfr26GOWDyGr43d3FBCEn4aPSI6Qk+tBs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fXW13YKue7UZMYnuicnacdD4SC4je+Z9rwGssa2IrVHVHPqseVS+Aj8+1RJVfasZR
 o/x5bf6utXBB5Q6gr+WZCDyPnG8Aqq6I1DhBKOUgLfGEr+0TdiA9tK/TsPsy7SKnWA
 JzubbACKdikG5RKdBCErgC+O6Hu6M5BE6KPELVEE=
X-Riseup-User-ID: 9F949E80DAAF4F28D678485BB84FA833BD33B75557B5B2839561E80087299B44
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TWgp71Tj9zJpbL;
 Fri,  9 Feb 2024 17:29:34 +0000 (UTC)
Message-ID: <6b033c46-284d-41df-ac80-cc96d2f05032@riseup.net>
Date: Fri, 9 Feb 2024 14:29:30 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t] benchmarks: Add VKMS benchmark
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240207-bench-v1-1-7135ad426860@riseup.net>
 <20240208115050.73d04796@eldfell>
 <738490ac-56a9-4408-8de7-63de059d0a54@riseup.net>
 <20240209103211.4f7e9fc6@eldfell>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240209103211.4f7e9fc6@eldfell>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/02/24 05:32, Pekka Paalanen wrote:
> On Thu, 8 Feb 2024 16:38:31 -0300
> Arthur Grillo <arthurgrillo@riseup.net> wrote:
> 
>> On 08/02/24 06:50, Pekka Paalanen wrote:
>>> On Wed, 07 Feb 2024 17:17:15 -0300
>>> Arthur Grillo <arthurgrillo@riseup.net> wrote:
>>>   
>>>> Create a benchmark for the VKMS driver. Use a KMS layout with deliberate
>>>> odd sizes to try to avoid alignment accidents and run it for FRAME_COUNT
>>>> frames flipping framebuffers in each plane.
>>>>
>>>> Link: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.localdomain/
>>>> Suggested-by: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
>>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>>>> ---
>>>> This benchmark was suggested by Pekka Paalanen on [1] to better analyse
>>>> possible performance regression on the Virtual Kernel Modesetting(VKMS)
>>>> driver.
>>>>
>>>> With this benchmark I was able to determine two performance regression:
>>>>
>>>> - 322d716a3e8a ("drm/vkms: isolate pixel conversion functionality")
>>>> - cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion functions")
>>>>
>>>> [1]: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.localdomain/
>>>> ---
>>>>  benchmarks/meson.build   |   1 +
>>>>  benchmarks/vkms_stress.c | 203 +++++++++++++++++++++++++++++++++++++++++++++++
>>>>  2 files changed, 204 insertions(+)
>>>>
>>>> diff --git a/benchmarks/meson.build b/benchmarks/meson.build
>>>> index c451268bc44f..3aa66d6dffe2 100644
>>>> --- a/benchmarks/meson.build
>>>> +++ b/benchmarks/meson.build
>>>> @@ -20,6 +20,7 @@ benchmark_progs = [
>>>>  	'kms_vblank',
>>>>  	'prime_lookup',
>>>>  	'vgem_mmap',
>>>> +	'vkms_stress',
>>>>  ]
>>>>  
>>>>  benchmarksdir = join_paths(libexecdir, 'benchmarks')
>>>> diff --git a/benchmarks/vkms_stress.c b/benchmarks/vkms_stress.c
>>>> new file mode 100644
>>>> index 000000000000..b9128c208861
>>>> --- /dev/null
>>>> +++ b/benchmarks/vkms_stress.c
> 
> ...
> 
>>>> +
>>>> +igt_simple_main
>>>> +{
>>>> +	struct data_t data;
>>>> +	enum pipe pipe = PIPE_NONE;
>>>> +
>>>> +	data.kms = default_kms;
>>>> +  
>>>
>>> Hi Arthur,
>>>
>>> all the above looks really good!
>>>
>>> Some things below look strange to me, but I don't know the igt API.
>>>   
>>>> +	data.fd = drm_open_driver_master(DRIVER_ANY);
>>>> +
>>>> +	igt_display_require(&data.display, data.fd);
>>>> +
>>>> +	kmstest_set_vt_graphics_mode();
>>>> +
>>>> +	igt_display_require(&data.display, data.fd);  
>>>
>>> Are you supposed to call igt_display_require twice?
>>>   
>>
>> Only this way the writeback connector appears. I took this from
>> `tests/kms_writeback.c`.
>>
>> I now did a bit of lore.kernel.org archaeology and found why this is
>> necessary:
>>
>> Rodrigo Siqueira sent this patch:
>> https://lore.kernel.org/all/20190306213005.7hvbnwl7dohr3vuv@smtp.gmail.com/
>>
>> It places drmSetClientCap() before drmModeGetResources(). (The patch
>> description is wrong, as noted by [1])
>>
>> Without this, you don't need to call igt_display_require() twice. I
>> don't know if this patch is wrong, but it is good to bring it up for
>> discussion.
> 
> Hi Arthur,
> 
> did you mean "*With* this, you don't need to call igt_display_require()
> twice."?

No, I really meant _without_. The patch has already been applied, it was
added inside commit 3642acbb74f5 ("lib/igt_kms: Add writeback support")
(it says on the commit message).

If you remove this change you don't need to call igt_display_require()
twice. But, based on you explanation, I don't think it's right to remove
it. Although, for some reason, you need call igt_display_require() twice
with this fix.

Best Regards,
~Arthur Grillo

> 
> All DRM client caps do need to be set before any call to GetResources
> or anything else, exactly because the client caps change the kernel
> side behaviour. Client caps may also hide things, not only expose
> things, at least in the future if not already (color pipelines will
> replace legacy color properties).
> 
> If you need to check DRM (kernel) caps, that should be done immediately
> after setting DRM client caps. I think that's the most logical and
> safest order.
> 
> 
> Thanks,
> pq
> 
>>
>> [1]: https://lore.kernel.org/all/20190318104128.GH26454@e110455-lin.cambridge.arm.com/
>>
>>>> +	igt_require(data.display.is_atomic);
>>>> +
>>>> +	igt_display_require_output(&data.display);
>>>> +
>>>> +	igt_require(data.wb_output);
>>>> +	igt_display_reset(&data.display);
>>>> +
>>>> +	data.wb_output = find_wb_output(&data);  
>>>
>>> Should igt_require(data.wb_output) be after find_wb_output?
>>>   
>>>> +
>>>> +	for_each_pipe(&data.display, pipe) {
>>>> +		igt_debug("Selecting pipe %s to %s\n",
>>>> +			  kmstest_pipe_name(pipe),
>>>> +			  igt_output_name(data.wb_output));
>>>> +		igt_output_set_pipe(data.wb_output, pipe);  
>>>
>>> Isn't this strange if there are multiple pipes?  
>>
>> Yeah, I forgot to place a `break;` there.
>>
>> All the others comments will be addressed on v2.
>>
>> Best Regards,
>> ~Arthur Grillo
