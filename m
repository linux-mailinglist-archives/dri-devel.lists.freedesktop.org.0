Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48C7CEC26
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 01:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D55A10E077;
	Wed, 18 Oct 2023 23:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307E610E077
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 23:35:12 +0000 (UTC)
Received: from [192.168.2.39] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A4816606F85;
 Thu, 19 Oct 2023 00:35:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697672110;
 bh=tzFoOcfO2LLY/7rp0S3zN3AaI/clLpAKH1kAfPrC9K8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hkjJDe0XXwbDR7epaJvYTuRQNY+iUKetwStS3N48Zd9XLyjAmP4tnIzReALet53C7
 cnn+esbO+5myarT9pBT1LElGWKK6kG/pQQgfZWj7JzH88zeThFVPqNRvI/4rb6LU8U
 bYtpHREY5tmH3mYl9XU8CUE+HsmQzvODeaxojE7nyl6qQBUvVX8Ech9UHiosf1QYgU
 q9VDo6If4FTzIDamXo68GQvZbsUJg7/AkhP5jZDQc+EoWEvKUZwW14EdldgIZQlo3R
 UjY/M/aZqPLkgFkOzpCqUiWEQo7M7ZKQWH77AuekDioTLHSVJJiyjxhOubJwhguukZ
 GJAKKZaVzlA4w==
Message-ID: <ca115816-ed99-df55-828b-a333f377ac0e@collabora.com>
Date: Thu, 19 Oct 2023 02:35:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] drm/virtio: add new virtio gpu capset definitions
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 Huang Rui <ray.huang@amd.com>
References: <20231010135722.1142265-1-ray.huang@amd.com>
 <2f8bcce1-6551-6c2d-481c-67502c82bc68@collabora.com>
 <2c162058-288c-9e9e-48d5-3b2ddb0cc1fa@collabora.com>
 <ZSYnQbHUecuUlwvr@amd.com>
 <CAAfnVB=Mki1zEyjByJ_7tRrib74E4KSbjezqQcb_Uia8EQEXHw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAAfnVB=Mki1zEyjByJ_7tRrib74E4KSbjezqQcb_Uia8EQEXHw@mail.gmail.com>
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
Cc: "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, "Stabellini,
 Stefano" <stefano.stabellini@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, David Airlie <airlied@redhat.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/19/23 02:25, Gurchetan Singh wrote:
> On Tue, Oct 10, 2023 at 9:41 PM Huang Rui <ray.huang@amd.com> wrote:
> 
>> On Tue, Oct 10, 2023 at 11:52:14PM +0800, Dmitry Osipenko wrote:
>>> On 10/10/23 18:40, Dmitry Osipenko wrote:
>>>> On 10/10/23 16:57, Huang Rui wrote:
>>>>> These definitions are used fro qemu, and qemu imports this marco in
>> the
>>>>> headers to enable gfxstream, venus, cross domain, and drm (native
>>>>> context) for virtio gpu. So it should add them even kernel doesn't use
>>>>> this.
>>>>>
>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>> ---
>>>>>
>>>>> Changes V1 -> V2:
>>>>> - Add all capsets including gfxstream and venus in kernel header
>> (Dmitry Osipenko)
>>>>>
>>>>> Changes V2 -> V3:
>>>>> - Add missed capsets including cross domain and drm (native context)
>>>>>   (Dmitry Osipenko)
>>>>>
>>>>> v1:
>> https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/
>>>>> v2:
>> https://lore.kernel.org/lkml/20231010032553.1138036-1-ray.huang@amd.com/
>>>>>
>>>>>  include/uapi/linux/virtio_gpu.h | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/include/uapi/linux/virtio_gpu.h
>> b/include/uapi/linux/virtio_gpu.h
>>>>> index f556fde07b76..240911c8da31 100644
>>>>> --- a/include/uapi/linux/virtio_gpu.h
>>>>> +++ b/include/uapi/linux/virtio_gpu.h
>>>>> @@ -309,6 +309,10 @@ struct virtio_gpu_cmd_submit {
>>>>>
>>>>>  #define VIRTIO_GPU_CAPSET_VIRGL 1
>>>>>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
>>>>> +#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
>>>>
>>>> The GFXSTREAM capset isn't correct, it should be GFXSTREAM_VULKAN in
>>>> accordance to [1] and [2]. There are more capsets for GFXSTREAM.
>>>>
>>>> [1]
>>>>
>> https://github.com/google/crosvm/blob/main/rutabaga_gfx/src/rutabaga_utils.rs#L172
>>>>
>>>> [2]
>>>>
>> https://patchwork.kernel.org/project/qemu-devel/patch/20231006010835.444-7-gurchetansingh@chromium.org/
>>>
>>> Though, maybe those are "rutabaga" capsets that not related to
>>> virtio-gpu because crosvm has another defs for virtio-gpu capsets [3].
>>> The DRM capset is oddly missing in [3] and code uses "rutabaga" capset
>>> for DRM and virtio-gpu.
>>>
>>> [3]
>>>
>> https://github.com/google/crosvm/blob/main/devices/src/virtio/gpu/protocol.rs#L416
>>
>> Yes, [3] is the file that I referred to add these capsets definitions. And
>> it's defined as gfxstream not gfxstream_vulkan.
>>
>>>
>>> Gurchetan, could you please clarify which capsets definitions are
>>> related to virtio-gpu and gfxstream. The
>>> GFXSTREAM_VULKAN/GLES/MAGMA/COMPOSER or just the single GFXSTREAM?
> 
> 
> It should be GFXSTREAM_VULKAN.  The rest are more experimental and easy to
> modify in terms of the enum value, should the need arise.
> 
> I imagine the virtio-spec update to reflect the GFXSTREAM to
> GFXSTREAM_VULKAN change will happen eventually.

Thanks for the clarification. Good point about the spec updating, we
should document DRM context too,

-- 
Best regards,
Dmitry

