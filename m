Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806C69DF54C
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 11:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3761810E604;
	Sun,  1 Dec 2024 10:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VXotg4u3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF70710E604
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2024 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pIYGDQUgxSMsHEhgz7+8NJ3BA4sDZ87cnKdjAIxbhdY=; b=VXotg4u3ckoajzMHAUk6I6lHXK
 0ajFyN3YNnGXqI2K+4S2BC3mdZbdQpEdMnBkz81zgzF0VxfjeDdOHZD/ldqPY4WLYPL3d8FJV95Bd
 O6X6WHeMDFp7S0TUXtqduJExaDZHpmJbvsfS2uDI9sQUEvZrN16S9LZYime5YIuifAE2VzrP/pUnp
 ZBOUT0kNPuqoprAnCAXhzPFu880cv3QRLud4kaZ+G5XMqnSmD1gggIN4SgFUNwU2KgpFinvPs1vbF
 e+JE41k36t0KcCdYxaptto2nXdxwlvJdb0UkpaAS7bOeU+PcSXqRgnpJE6hK47YSGy7wGCZ67IEOX
 04y48y6Q==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tHhXG-00EyNo-F8; Sun, 01 Dec 2024 11:50:42 +0100
Message-ID: <dad9b7f8-322a-4af7-9285-39004fe82584@igalia.com>
Date: Sun, 1 Dec 2024 07:50:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Interest in Contributing to VKMS Development
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Ananta Srikar Puranam <srikarananta01@gmail.com>
Cc: dri-devel@lists.freedesktop.org
References: <09cf19a7-b153-4da4-8704-f702f41909d3@gmail.com>
 <Z0v19YeZa2IAooUV@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <Z0v19YeZa2IAooUV@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Srikar & Louis,

On 01/12/24 02:36, Louis Chauvet wrote:
> +Cc: dri-devel@lists.freedesktop.org
> 
> On 30/11/24 - 13:49, Ananta Srikar Puranam wrote:
>> Dear Louis Chauvet,
> 
> Hi Srikar!
> 
>> I was able to successfully compile Linux with VKMS enabled and have set up
>> igt-gpu-tests in a QEMU machine. I can now run some tests successfully.
> 
> Congratulation!
>   
>> I have a surface-level understanding of the DRM and KMS subsystems
>> (framebuffers, planes, CRTCs, encoders, and connectors) and am eager to dive
>> deeper into the VKMS module and contribute.
> 
> I am very happy to see some interest in VKMS development, do you have a
> specific feature that you want to test?
> 
>> I understand VKMS helps test the DRM subsystem, but I’m struggling to fully
>> grasp how the absence of visible display output aligns with its testing
>> goals. Any guidance on this would be highly appreciated.
> 
> That the whole point of "V"KMS, everything is virtual, even the display
> output :)
> 
> There are two way to get some information about the output content:
> - CRC compuation [1]
> - Writeback connector [2]
> 
> The CRC will allows you to write a test like this:
> 
> 	create_reference_image();
> 	ref_crc = grab_crc();
> 
> 	test_procedure();
> 	test_crc = grab_crc();
> 
> 	assert(ref_crc, test_crc);
> 
> This is used in the igt test "kms_plane" to test color conversion, they
> compute a reference CRC and then test the conversion between multiple
> formats [3].
> 
> The writeback connector is useful to grab a "screenshot" of the output,
> but it is a bit less efficient. It can be used when a simple "reference
> CRC" is not possible.
> To grab a picture from the writeback connector, you have to do something
> like this:
> 
> 	setup_pipeline();
> 	wb_fb = create_fb();
> 	while (true) {
> 		send_fb_to_wb_connector(wb_fb);
> 		wait_for_picture();
> 		do_something_with_result(wb_fb);
> 	}
> 
> There is a writeback example in igt [4], but I don't know how it works.
> 
> [1]:https://elixir.bootlin.com/linux/v6.12.1/source/drivers/gpu/drm/vkms/vkms_composer.c#L209
> [2]:https://elixir.bootlin.com/linux/v6.12.1/source/drivers/gpu/drm/vkms/vkms_writeback.c#L171
> [3]:https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_plane.c#L1036
> [4]:https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_writeback.c
> 
>> Additionally, I noticed the TODO item to add the plane feature (background
>> color KMS property). It seems like a good starting point, and I would be
>> grateful for direction on how to approach it.
> 
> I think this is the good direction, yes!
> 
> All your patches must be on top of drm-misc-next [5]. If you are not
> familiar with kernel contribution, I invite you to look at the kernel
> documentation [6] and at the amazing b4 tool [7].
> 
> For the implementation itself, I think you have to work in the function
> blend, probably around the fill_background function [8]. You also need to
> attach a BACKGROUND property on the CRTC [9]. I think you have to do it
> somewhere in crtc initialization [10].

I implemented this feature to VKMS last year [1], but there were some
discussion about the user-space use of this feature, so the development
got stalled. I encourage you to read through the discussion.

The thing is: when implementing a new DRM uAPI, you need a correspondent
user-space implementation. From the DRM docs [2],

"The short summary is that any addition of DRM uAPI requires
corresponding open-sourced userspace patches, and those patches must be
reviewed and ready for merging into a suitable and canonical upstream
project."

Therefore, it is important to talk to the user-space compositors
community to check their requirements and see if they need this
property.

[1] 
https://lore.kernel.org/dri-devel/20230410125435.128689-1-mcanal@igalia.com/T/
[2] 
https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requirements

Best Regards,
- Maíra

> 
> [5]:https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next
> [6]:https://docs.kernel.org/process/contribution-maturity-model.html
> [7]:https://b4.docs.kernel.org/
> [8]:https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/vkms/vkms_composer.c#L389
> [9]:https://drmdb.emersion.fr/properties/3435973836/BACKGROUND
> [10]:https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/vkms/vkms_crtc.c?ref_type=heads#L273
> 
>> Thank you for your time, and I look forward to your guidance.
>>
>> Best regards,
>> Srikar
> 

