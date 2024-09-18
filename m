Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AEA97BD02
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DEE10E19B;
	Wed, 18 Sep 2024 13:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NX6rQyEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD32910E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 13:26:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BB7AFF80D;
 Wed, 18 Sep 2024 13:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726665976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=si8tKUU04m7U00gK9E2ZydnKdgplIpZqDIcFIbAcvNI=;
 b=NX6rQyEme0cDp/HoPxYWGhoBeLe+4Cwqc1a99rEql6+cT67KeRbhgkN3lL+VeYllGSP6v+
 aeqhpghynLzAVMYgJ7oerTZsEcnQMB8M8GBHW5xs/2FmhJAY7z4ggQ/6W4Ju9T6jqsdr5g
 hF8gUxFynyXf3MxZai2RnIMMs4Pbv4+tGv8T1BV3YIMFZcXiMYlLhzuvr4jlhJtI3Gbh3C
 VxF2RSr0+2gRMxO0fYy8UjW5ZJRN1cVXJQ7T+JLVVcxwaONSYzbJ/cuttDkefBybg/Czx3
 +eGu9HdDSOCHYAhqu3fT2Mco+orLkKZIvnbskNpXjGWfXVaeYkspdyPrryyoBQ==
Date: Wed, 18 Sep 2024 15:26:12 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: YJ Lin <0xff07@gmail.com>
Cc: sean@poorly.run, rodrigosiqueiramelo@gmail.com, mairacanal@riseup.net,
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ricardo@marliere.net, skhan@linuxfoundation.org,
 Shuah Khan <shuah@kernel.org>
Subject: Re: Intend to work on the DRM_* logging macro conversion
Message-ID: <ZurU9K3SxwmQ3oJf@localhost.localdomain>
Mail-Followup-To: YJ Lin <0xff07@gmail.com>, sean@poorly.run,
 rodrigosiqueiramelo@gmail.com, mairacanal@riseup.net,
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ricardo@marliere.net, skhan@linuxfoundation.org,
 Shuah Khan <shuah@kernel.org>
References: <CAHhBtNqB=jQTnY1eu8or=toczr93ehUeuBkAZ7axFPr4ZHPjCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHhBtNqB=jQTnY1eu8or=toczr93ehUeuBkAZ7axFPr4ZHPjCQ@mail.gmail.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 16/09/24 - 23:46, YJ Lin a écrit :
> Hi Sean and the vkms maintainers:
> 
> I’m Leo, currently one of the mentees of the Linux Kernel Bug Fixing
> Program 2024 Summer Unpaid[1]. I saw an item on the DRM TODO list
> regarding "Convert logging to drm_* functions with drm_device
> parameter"[2]. It also suggests reaching out to the driver maintainers
> beforehand. So I’d like to understand your opinions toward making this
> conversion on the vkms driver, and I’d like to start working on it if
> you consider it suitable. Thank you!

Hi Leo,

It is very nice to work on this subject, thank you!

On the VKMS side, the current upstream driver can only create one instance 
of the device, but we are working on supporting more, so it definitly 
make sense to have per-device logging. Feel free to send patches to change 
this where it make sense.

Few series are pending on the mailing list, so feel free to point where we 
miss this too! (for example [3,4]

[3]:https://lore.kernel.org/all/20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com/
[4]:https://lore.kernel.org/all/20240912-b4-vkms-allocated-v1-0-29abbaa14af9@bootlin.com/

> (Also, do feel free to share tips for DRM and kernel development in general.)

Don't hesitate to send documentation patches if you had difficulties to 
understand stuff, it will profit to everyone. If you need more 
documentation about VKMS internals, a "big" patch is pending [5].

[5]:https://lore.kernel.org/all/20240905-google-clarifications-v4-1-e43c1f2e3d87@bootlin.com/

Thanks,
Louis Chauvet

> Best,
> Leo
> 
> [1] https://mentorship.lfx.linuxfoundation.org/project/9c354ea7-f08e-4d85-a93d-94d2a3cb30c8
> [2] https://www.kernel.org/doc/html/latest/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
