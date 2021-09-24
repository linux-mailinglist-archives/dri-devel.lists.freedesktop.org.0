Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E5C418049
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 10:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1386E3BB;
	Sat, 25 Sep 2021 08:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2E26E200
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 18:03:25 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y26so4174071lfa.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uI2XMoDqIo7QyIdBikgeHMw4E7tlz6pt/JuqgdSU9Ro=;
 b=H3dOkHB7AIHAQSwD2bBU+csOHg766FQWuOf3+mvBFstQtJ1v49uFG/fMmKAJ9ijZkk
 2SQ9p/ANnYgQJ+uKjdwCUolNVMXnzcdkHTMPkc8Hb9nYFag9iYTq1KH7rDSrnFqO5z2c
 j6UWi02dy6eI5EfRVojVi09LSIRIVYsFCKExkLmoIEg8nNQElzQxU8bS1R7M8D20YWhq
 qlX3k5Aa6HpBbcKv1AJ/o7P0Ys3KywQc4vFNMQJEAvuae0QHl7yNM6vqSNYQRNUCGJNu
 XWOurzW42i5JDCpgp0bcpwbXNobvZ4b4/OslJdHSMGfUacHAVR57magaxgb0HZ9HR3T0
 oiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uI2XMoDqIo7QyIdBikgeHMw4E7tlz6pt/JuqgdSU9Ro=;
 b=ugL4Q3TuQyVHdYhzpk5G8VZxKISHvk8+4vra8bo8vkv/lQM6v57pa8xMgWMZsobdMG
 xdP6YvY98+8AZgMmR5h0E7ub2W+usfqraA9Any+odLwHXu5BnZC84erTSxi7yzmhMnfN
 unqfa+CrZDzZfVcwVNhwQPIhKPUNFfPc6/BnWr2vLohAKGdyajEFk4yr/kYxZXsjnsjL
 Dt4jO9+/xbTcrZGRn5hl9/t/UR6x9A3bQC6zpuHlFQDH350LDW1BaK/yjpTTgLETy+Vb
 oHK7+1lIR3B/NPJjtT9ibRbHxhKJIT5yjhp8Y4FVVBpkX9pHIjWEfg4pSrQyhEeXHP1z
 iYMQ==
X-Gm-Message-State: AOAM531YUrpOSLhzyI/+LmEqDYkKl95Y2F5k3OK8/z2DG+3iSpWp24Ts
 3WFT7aL34LdlOXdd4LbCxdjjnOPqfGM=
X-Google-Smtp-Source: ABdhPJzp8G8vBXdEPYJsxg3Vhb+ISsE8oODRNiW+LGnAv/0ydx9iriRb1XVI5OM4VbNux69mlHspTw==
X-Received: by 2002:a05:6512:3e03:: with SMTP id
 i3mr11252152lfv.374.1632506603427; 
 Fri, 24 Sep 2021 11:03:23 -0700 (PDT)
Received: from ?IPv6:fd00:835b:d940:d4fc::5?
 (2a01-036c-0113-a176-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:a176::5])
 by smtp.gmail.com with ESMTPSA id u3sm818141lft.149.2021.09.24.11.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 11:03:22 -0700 (PDT)
From: "=?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=
 <DirtY.iCE.hu@gmail.com>
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
To: Amanoel Dawod <kernel@amanoeldawod.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
 <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
 <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>
 <7486abc7-ce39-915f-b697-b9adb356f98f@suse.de>
 <4c161178-4d15-4ca6-9069-9c9a781c7019@www.fastmail.com>
 <f80168a3-02e3-1c79-98e3-11b9f7573a6e@suse.de>
 <a9839860-6e13-4809-9a85-96821ae5372e@www.fastmail.com>
Message-ID: <dee32db0-fb9c-4b09-0c8f-e602c60b23d8@gmail.com>
Date: Fri, 24 Sep 2021 20:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:4.8) Goanna/20210217
 Interlink/52.9.7718a1
MIME-Version: 1.0
In-Reply-To: <a9839860-6e13-4809-9a85-96821ae5372e@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 25 Sep 2021 08:25:39 +0000
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

Hi,

Did anything happen with this issue? I've updated linux kernel to 5.14.7 
from 5.13 today, and I've been hit with a very similar problem (even 
inside qemu), except in my case the height reported in "bad framebuffer 
height" was twice the actual height, not three times. After some digging 
around I've figured out that at the end of 
drm_fb_helper_single_fb_probe, surface_height is multiplied by 
CONFIG_DRM_FBDEV_OVERALLOC/100, which was somewhy set to 200 in my 
kernel config. Setting it to 100 fixed that problem. (It looks like the 
default now, I don't know why was it set to 200 in my config, maybe the 
old default was different).

However it's still very buggy, even after setting 
CONFIG_DRM_FBDEV_OVERALLOC to 100. On my notebook (ASUS G551JW, with a 
4th gen i7 cpu), this is what I observe:
* after the kernel boots, the tux logos rapidly flicker at the top of 
the screen and I only see text at the bottom of the screen. After a few 
seconds it returns to normal.
* when starting X, whet it switches to a new VT the tux logos reappear 
along with some text, but only in the upper left corner. This is also 
only happens for a second or so, until X overtakes the display.
* when terminating X, the tux logos with the garbage text remain in the 
upper left corner, but the rest of the screen is replaced with the 
correct contents. The garbage in the top left corner remains until 
something overwrites it (like scrolling the terminal).
So it works, but buggy as hell and at this point I'm better disabling 
simpledrm and just relying on the i915 driver, losing early console. I 
tried booting with drm.debug=0x1ff, but by the time I could run dmesg it 
generated so many messages that the early boot messages were already lost.

Now, my desktop is even worse. Motherboard is an ASRock Z87M Extreme4, 
with a GeForce GT 640 and GTX 980 cards (the integrated GPU in the intel 
CPU is disabled in UEFI settings). Unfortunately this requires the 
proprietary nvidia drivers, so it's probably my own problem, but anyway 
it works until I it loads the nvidia drivers, then afterwards (while 
still in fbcon) I instead get 4 or 5 small copies of my terminal in the 
upper part of the screen with wrong stride, so it's completely 
unreadable. And if I ever start X, I won't have any fbcon until reboot. 
So 5.14 is basically unusable on this machine.

Any ideas what should I try? Everything worked well with 5.13 and its 
simplefb.

Thanks,
Zoltan

