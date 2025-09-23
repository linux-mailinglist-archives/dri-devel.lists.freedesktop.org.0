Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C6AB94F42
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0577510E07C;
	Tue, 23 Sep 2025 08:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m5I7cRPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2042310E07C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:20:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3fd7f3e8edfso78372f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758615605; x=1759220405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IzyzWewMNK9Zl9E9xETHmxZ1NeS51VeZso1zp+2bU2I=;
 b=m5I7cRPJyuuaMN/trPmx7TaK5GgmAEjQNFRzElZq58DBVVsVHbFrqwbQUnKzs4YYBk
 UOxShVwfmmzPp6pHo2cPFqom+ZwkwUgbL/vdF/S8QCboYoVjxfSzWeYn++XfAdcAPh5A
 6BwiUGOfRbQ6Mg63RTeVZBoGFD7aIs8CXC0dyHOtUBDaTKpbpRtk6hhHYEhJKlfi/70b
 CvBQvIdQbRy8/MZzkchUFckr7GCKG2Z9C+sbFuPHEOefvk+CR7w+1x5Icr20n/TB69nt
 +S8HA+2Ix5kOxGR0vWvzOJUrjzrtle/21Sy00e3PTeLUzLoSznHKQDvBwlZDeoalft13
 MD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758615605; x=1759220405;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IzyzWewMNK9Zl9E9xETHmxZ1NeS51VeZso1zp+2bU2I=;
 b=jayL+nJ+Q9hREHJkdY1NXp8eDRTtazF8PGc9eNVqQvoC74AMa+50ZZg5ROt0uRTDtO
 nGM4zTjCuV+tNguWXxCkBjYwAKO6VLwR2bVNYGsZH+etCrSK4pZ4pcwpPXBeWqDGpygs
 O1xdQLljrioXWucrCjPxVvRFMbDl1LqoiMflotyWKkwstzj0cJug+jFCfsd3Jm6CaX7d
 5btVEApJGr9OFjPA4uQMQjFCzXevRiP5isxCnpfJvxc5tyN5QWhRp3rfrIdakzYKziO7
 KX25mRgp0NmsHhPPIY2y+qhW13vkZoJfj/+jY/RUdr937WZPSOSGQPUQGygGuW5Zavf/
 F6PQ==
X-Gm-Message-State: AOJu0YwysfuskXDiSzeSOpM8zZ8h/nhXDs67WNGiSxAHjDo+6s6OhQq3
 85ER5LLk1z3XHJ7nhinUPyzGWUU2Ne7V6ysbAKfCW+T6jxR5xiiQzF1v
X-Gm-Gg: ASbGncubkGy4NnpCxxdsrr4mGe46t0kSMKuvrNpxHFRLahHTR8xdO61aGAcvHrT9/CP
 UG6XmzVPGP7etJKWMkxA41xw0RcG5mWOvaSpJzjMmYLvn7Ub7Nm4O0xGgUnz/Jkf+UKRKbI5T+Z
 t+tM0secJx/jo1mkaM4ba58cGjRfd5MW5wFbCbhv4Qsa8eQcfRbF7INOytHri/iM8VPx3GBDJFy
 BRTe7ri3rZbPQT1kt8n/q7QbPEZaPivLM+EYzSuUTnlcjQevK0qEuszoij10GYf34aPuj1D6xEU
 QXUlMpBOoQJPNlHGmA6d7mCGt0I+98o0zg3IAQ0NKCoPgvTK82FyqHFRBuQUUX1z6O/xB+45/bJ
 dt6O5W1d1U9ap1rOvrddOpEK3zDs8DVnIuBlCsHmqEGHOcQ==
X-Google-Smtp-Source: AGHT+IEMgeYQXIZ6KZjIiu5Q+SFOyifqT76gOV1N5xNcfsbVxIXA4Ao4Gbib8xuNk1pacZpZMn/dMw==
X-Received: by 2002:a05:6000:268a:b0:3ea:75d0:cf0a with SMTP id
 ffacd0b85a97d-405ce97fe14mr543601f8f.11.1758615605145; 
 Tue, 23 Sep 2025 01:20:05 -0700 (PDT)
Received: from [192.168.100.110] ([102.170.50.198])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee073f53c4sm23321598f8f.3.2025.09.23.01.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 01:20:04 -0700 (PDT)
Message-ID: <989ace7c-92a3-438e-a0a6-3cbeb46adba6@gmail.com>
Date: Tue, 23 Sep 2025 09:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gud: Use kmalloc_array() instead of kmalloc()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, mingo@kernel.org, tglx@linutronix.de, jfalempe@redhat.com,
 Shuah Khan <skhan@linuxfoundation.org>, david.hunter.linux@gmail.com,
 rubenru09@aol.com
References: <20250922174416.226203-1-mehdi.benhadjkhelifa@gmail.com>
 <063fbed8-915e-47e5-99fd-ffae22cfb6fa@suse.de>
 <fda2b300-dd91-4357-8cd0-a82347907164@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
In-Reply-To: <fda2b300-dd91-4357-8cd0-a82347907164@suse.de>
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

On 9/23/25 8:06 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 23.09.25 um 08:34 schrieb Thomas Zimmermann:
>> cc Ruben
>>
>> Am 22.09.25 um 19:43 schrieb Mehdi Ben Hadj Khelifa:
>>> Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
>>> calculation inside kmalloc is dynamic "width * height" and added
>>> u_char as the size of each element.
>>>
>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>> ---
>>>   drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/ 
>>> gud_pipe.c
>>> index 8d548d08f127..eeea0cb4c7aa 100644
>>> --- a/drivers/gpu/drm/gud/gud_pipe.c
>>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
>>> @@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const 
>>> struct drm_format_info *format
>>>       height = drm_rect_height(rect);
>>>       len = drm_format_info_min_pitch(format, 0, width) * height;
>>>   -    buf = kmalloc(width * height, GFP_KERNEL);
>>> +    buf = kmalloc_array(width * height, sizeof(u_char), GFP_KERNEL);
> 
> u_char is more or less guaranteed to be 8 bit. So what's the point?

i thought it would be more "clean" to have a data type that is of 1 byte 
size to use as a reference for the size of each element here.


> There's a potential overflow in width * height. If anything, you want to 
> call kmalloc_array(height, width).

This was more apparent to me after i have sent the patch and was waiting
for a reply first. Since my initial though was that width or height 
alone couldn't be treated as a reference to "n of elements" or "size of 
each element" but your suggestion is more logical since leaving the 
calculation width * height in the kmalloc_array would defeat the purpose 
of switching from kmalloc to kmalloc_array since dynamic calculation is 
still present and overflow is still possible.

I will send a v2 patch shortly changing to your suggestion.

> Best regards
> Thomas
> 

Best Regards,
Mehdi Ben Hadj Khelifa
