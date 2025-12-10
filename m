Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9C7CB460B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 02:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF9910E6AB;
	Thu, 11 Dec 2025 01:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="muwuElG3";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="vdggCx9E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF8110E285
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 22:11:08 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 8F3D3EC0608;
 Wed, 10 Dec 2025 17:11:07 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 10 Dec 2025 17:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1765404667; x=1765491067; bh=M/M0xoEjhT
 478rvOxhkSGXYLAw9o6474uIo0ZXlPsdA=; b=muwuElG3NU+romQF7KWeD+zuZk
 DwK1SvXDl5nh52GMSyvJjjCgUlCo2pwUvHj2GV5ibFpgoaoboX7pS+PJB3jYamNI
 xFDkIUIKE/kHbWl0BVZ0l0g1KW/3NJ0Fa1jjVgWWhvlR6ubhzT27qUtpGYYqPgN3
 PbQmxOUGtwEoCsuRKVYzCtrQkdAWupda+QLPNbxzEdSnIXqW1tlCaTXmYlVi5ZhN
 DEFC+6i99LqFue3zyFKkjZ9JZB2iERvvWujAEQ4oWa9fuSQ9EpY1B1RNyb29IAKk
 uEZWMrNaXXSCMhn7jxh/hIKQIETjvm3K+CGO6zbb29BN4KB1nsjTKk6+DHZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765404667; x=
 1765491067; bh=M/M0xoEjhT478rvOxhkSGXYLAw9o6474uIo0ZXlPsdA=; b=v
 dggCx9EGtRK8yUu+bXHi66i5PqXZW2NVMOgI8dVn5tBSOZerEOPC6Rha5lySS0XC
 9pHIseOOAcGHxj1VOz+rvIkioeTEuvblA/cuBjoB3sPvNPNadwMCq+GLZGxspSC/
 4E4f9XAtsN4y2ZSG6bPq3HKUggmshfrDTHbnTLkR1qx7OOTF79b4+AXQ1Z11Jqmb
 FiAY/nx0UsUrh1TzytsThnntbNxRFYQhJaTZ5dPtwmk6HMeQetdPTzp14H5FoeKi
 R+sA2NKb6boWU25rhg0TEEJKPfXzmaCk6l5cqTz3DwwmaxvWUSNiFKU34dYw9th0
 F8THbMCdpxrblfMKzSrrA==
X-ME-Sender: <xms:-u85ach9bYILFt4Sz1L8NFCivAZJQHL-IwCvkrk1bbTZQ1-OpGJzEA>
 <xme:-u85aVexqn8ZJlCXuoQi6xAD011YHmNzw1JfTcIrle2ZR8KPMtMnu8Wwcxh6SbI9I
 c8zHhZG5a_wMa4w2w0hRa6sQi2lbU14SXPg-GxgQv7jbsKGsdE>
X-ME-Received: <xmr:-u85aT0cGQZp5Pz3WD8mVQiPoxfCsJTnkqGJJ7uN0gyBgIq2DaiQA2QxkmaAWfc04-3qXMnaGRFsj9rPw0RkL_u_CcIGIpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeehlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepgggrlhcurfgr
 tghkvghtthcuoehvrghlsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
 cuggftrfgrthhtvghrnhepkeduteelgeelkeejtdehhffhueehteeiieduueevvddtjeel
 ueeitdefiedvkeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepvhgrlhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggp
 rhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughmihhtrh
 ihrdhoshhiphgvnhhkohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegrihhr
 lhhivggusehrvgguhhgrthdrtghomhdprhgtphhtthhopehkrhgrgigvlhesrhgvughhrg
 htrdgtohhmpdhrtghpthhtohepghhurhgthhgvthgrnhhsihhnghhhsegthhhrohhmihhu
 mhdrohhrghdprhgtphhtthhopeholhhvrghffhgvsehgmhgrihhlrdgtohhmpdhrtghpth
 htohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtgho
 mhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhope
 htiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepshhimhhonhgrsehf
 fhiflhhlrdgthh
X-ME-Proxy: <xmx:-u85aZqj3WzkVOwn_vA-2ltqXYEnYojUX9rL0FTE_tKUyzYt-zVz_w>
 <xmx:-u85aTgP_vNpWLl6Fv-nNjV7JDhLL1EFWWx2mZBn4vJPvmn-tnYojg>
 <xmx:-u85aVkqLHCEyGUmJnhSuvLIYDUoQTFv03gPVi5gqmVpEskAgDJTJQ>
 <xmx:-u85acqFN70yvolqCg8i0W9hXYGukgDRJnEIuJvotp6ILsSgjz6xDw>
 <xmx:--85aSlY1pIHkugvHmF2SqkinIKf_rYVATLSmBVUnaCaAt5ggsKVOXUj>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Dec 2025 17:11:03 -0500 (EST)
Message-ID: <1005ebfc-6f0e-477f-afae-2d42b44a5fa3@invisiblethingslab.com>
Date: Wed, 10 Dec 2025 19:11:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Allow importing prime buffers when 3D is
 enabled
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251210154755.1119861-2-val@invisiblethingslab.com>
 <a8405071-8489-4965-9a59-fc58f78cb250@collabora.com>
Content-Language: en-US
From: Val Packett <val@invisiblethingslab.com>
Autocrypt: addr=val@invisiblethingslab.com; keydata=
 xm8EaFTEiRMFK4EEACIDAwQ+qzawvLuE95iu+QkRqp8P9z6XvFopWtYOaEnYf/nE8KWCnsCD
 jz82tdbKBpmVOdR6ViLD9tzHvaZ1NqZ9mbrszMXq09VfefoCfZp8jnA2yCT8Y4ykmv6902Ne
 NnlkVwrNKFZhbCBQYWNrZXR0IDx2YWxAaW52aXNpYmxldGhpbmdzbGFiLmNvbT7CswQTEwkA
 OxYhBAFMrro+oMGIFPc7Uc87uZxqzalRBQJoVMSJAhsDBQsJCAcCAiICBhUKCQgLAgQWAgMB
 Ah4HAheAAAoJEM87uZxqzalRlIIBf0cujzfSLhvib9iY8LBh8Tirgypm+hJHoY563xhP0YRS
 pmqZ6goIuSGpEKcW5mV3egF/TLLAOjsfroWae4giImTVOJvLOsUycxAP4O5b1Qiy+cCGsHKA
 nCRzrvqnPkyf4OeRznMEaFTEiRIFK4EEACIDAwSffe3tlMmmg3eKVp7SJ+CNZLN0M5qzHSCV
 dBBkIVvEJo+8SDg4jrx/832rxpvMCz2+x7+OHaeBHKafhOWUccYBLKqV/3nBftxCkbzXDbfY
 d02BY9H4wBIn0Y3GnwoIXRgDAQkJwpgEGBMJACAWIQQBTK66PqDBiBT3O1HPO7mcas2pUQUC
 aFTEiQIbDAAKCRDPO7mcas2pUaptAX9f7yUJLGU4C6XjMJvXd8Sz6cGTyxkngPtUyFiNqtad
 /GXBi3vHKYNfSrdqJ8wmZ8MBgOqWaaa1wE4/3qZU8d4RNR8mF7O40WYK/wdf1ycq1uGad8PN
 UDOwAqdfvuF3w8QMPw==
In-Reply-To: <a8405071-8489-4965-9a59-fc58f78cb250@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 11 Dec 2025 01:01:36 +0000
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


On 12/10/25 1:51 PM, Dmitry Osipenko wrote:
> Hi,
>
> On 12/10/25 18:39, Val Packett wrote:
>> This functionality was added for using a KMS-only virtgpu with a physical
>> (or SR-IOV) headless GPU in passthrough, but it should not be restricted
>> to KMS-only mode. It can be used with cross-domain to pass guest memfds
>> to the host compositor with zero copies (using udmabuf on both sides).
>>
>> Drop the check for the absence of virgl_3d to allow for more use cases.
>>
>> Fixes: ca77f27a2665 ("drm/virtio: Import prime buffers from other devices as guest blobs")
>> Signed-off-by: Val Packett <val@invisiblethingslab.com>
>> ---
>>
>> Hi. I couldn't find any comments on that line in the reviews (on patchwork), so I assume
>> there was never a specific technical reason for that check, just an abundance of caution?
>>
>> BTW, while here.. The drm_gem_prime_import "fallback" seems pretty much equivalent to
>> `return (-ENODEV)`, as drm_gem_prime_import(_dev) just translates the call to
>> gem_prime_import_sg_table which we don't use. Should it be replaced with `return (-ENODEV)`?
> Returning -ENODEV should break dmabuf self-importing where virtio-gpu
> driver export dmabuf and then imports to itself.

Hm, I don't think so because the self-import case (for when `buf->ops == 
&virtgpu_dmabuf_ops`) is handled right here, right above this check.

drm_gem_prime_import would handle the self-import for `buf->ops == 
&drm_gem_prime_dmabuf_ops` which shouldn't be the case since we have 
`virtgpu_dmabuf_ops`..

>> ---
>>   drivers/gpu/drm/virtio/virtgpu_prime.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
>> index ce49282198cb..2fedd5d3bd62 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
>> @@ -312,7 +312,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>>   		}
>>   	}
>>   
>> -	if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
>> +	if (!vgdev->has_resource_blob)
>>   		return drm_gem_prime_import(dev, buf);
>>   
>>   	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
> At a quick glance the change looks fine. Will take another stab after
> Holidays and merge if no problems will be spotted. Thanks.

Thanks!
~val

