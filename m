Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0801299126B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 00:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F09210E11D;
	Fri,  4 Oct 2024 22:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MgtDB07V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E54D10E0CB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 22:40:43 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42cc8782869so25558015e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2024 15:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728081641; x=1728686441; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pm0SUmL0h+/zFum7zGqvM26tqKRl3o1sbbm2mcZg8yk=;
 b=MgtDB07VBDueuJdxm52DNs9aRT5NBgHKe7AOxkyKGOY5PMsErRI3DmjVvbvm7XgHP/
 5Cs1e9ht907mXRr4zj6BVhQTt+S94/z/SDVJPljeOqvW2MeK2miWmkPlNilyDgtpco7A
 sDP5uHqfNXhYKgGIge2trN2/nuC+gjtTgt51QtxbMBX6OxzbX73k/QSmgis3GFau9i/C
 tAHgGI8n/uJUwULdn6aIj4idhUVv6JP+u0aNlNRAD/zNScwzrhmXtPkVFqanvwBZN/Wf
 fIrOT6gSDT1OmkRkdJtsOyDw96EXOQ0F+m9LMe+vNsTiQc/3kp8pGLqZmMmlV9sRBauW
 c8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728081641; x=1728686441;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pm0SUmL0h+/zFum7zGqvM26tqKRl3o1sbbm2mcZg8yk=;
 b=Hfida3zmG8ua1ESjSuyb8tgv9vcPtFq5chieXFeMvJKK2Tf7MRmkaYGq/pEKHnR92R
 2+rqUjhqPU+93cp3sZ0c0oGPEYYCj15VpzkVuNG25VvL6mzdOMggy/Ji9dHBC3g7XBKW
 VKyiQGTu0kOvcG6U2+2Kdey30Dd8HbMvUnRvymPDsIFIVlYiXd8BrNcr4I03/Vo4BrIK
 cga9kV556hPd2ec/MKVLfy05Utfu5jm3DvMOpNd6D1xSQtFva9b+LSfwXKWfAH5FaAJs
 ldA1yn5OBbPNHS9BUQNfLSg01wBBApWQq853HF0RUKTWIgAdtsAIbrdjcz2N4XJHgVfg
 Zh2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcfKjzfBk/NO/vJZ4dDKEy4ZbZPcquXuvQ4UcX2pdduL7kAMCpy0j8bApzgwMnUXXu7fQYQ0CY+GY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhfwthvSF0+keKEp595w8E6DkYD2JFP4110wYYafiKksAOccTU
 y1bkH751mm8RyC66qcLdBjIYQXJhVtCmEnK4iUo2lMS6xXuRGiKqQBdCDBkhzc4=
X-Google-Smtp-Source: AGHT+IEAyWl+ECruivGYhlckYJ/sRggq+bTCKeTD26RE/A1w2YG5iYaNE6u8Y3RrX5FvA49B42jmoA==
X-Received: by 2002:adf:f741:0:b0:371:8e8b:39d4 with SMTP id
 ffacd0b85a97d-37d0e77eea6mr2854008f8f.28.1728081641222; 
 Fri, 04 Oct 2024 15:40:41 -0700 (PDT)
Received: from [82.195.85.209] ([82.195.85.209])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d16920445sm544722f8f.52.2024.10.04.15.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 15:40:40 -0700 (PDT)
Message-ID: <782f6c32-73ed-4e58-ae10-ff2d486b499c@linaro.org>
Date: Sat, 5 Oct 2024 00:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240910070733.156127-1-jfalempe@redhat.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240910070733.156127-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Jocelyn,

On 10/09/2024 08:56, Jocelyn Falempe wrote:
> drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
> This is not a full replacement to fbcon, as it will only print the kmsg.
> It will never handle user input, or a terminal because this is better done in userspace.


I tried this out on the OnePlus 6 (Qualcomm SDM845/freedreno) and it 
looks great :D

Here's a demo for kicks:

https://people.linaro.org/~caleb.connolly/drm_log_oneplus6.mp4

Tested-by: Caleb Connolly <caleb.connolly@linaro.org> # freedreno/dsi

Kind regards,
> 
> If you're curious on how it looks like, I've put a small demo here:
> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
> 
> Design decisions:
>    * It uses the drm_client API, so it should work on all drm drivers from the start.
>    * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
>      It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
>    * drm_log can only be built-in (and drm must be built-in too).
>      The reason is that, if you build it as a module, then a userspace application will be more appropriate than this module.
>    * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
>   
> v2:
>   * Use vmap_local() api, with that change, I've tested it successfully on simpledrm, virtio-gpu, amdgpu, and nouveau.
>   * Stop drawing when the drm_master is taken. This avoid wasting CPU cycle if the buffer is not visible.
>   * Use deferred probe. Only do the probe the first time there is a log to draw. With this, if you boot with quiet, drm_log won't do any modeset.
>   * Add color support for the timestamp prefix, like what dmesg does.
>   * Add build dependency on  disabling the fbdev emulation, as they are both drm_client, and there is no way to choose which one gets the focus.
> 
> v3:
>   * Remove the work thread and circular buffer, and use the new write_thread() console API.
>   * Register a console for each drm driver.
> 
> Thanks and best regards,
> 
> Jocelyn Falempe (4):
>    drm/panic: Move drawing functions to drm_draw
>    drm/log: Introduce a new boot logger to draw the kmsg on the screen
>    drm/log: Do not draw if drm_master is taken
>    drm/log: Color the timestamp, to improve readability
> 
>   drivers/gpu/drm/Kconfig     |  19 ++
>   drivers/gpu/drm/Makefile    |   3 +
>   drivers/gpu/drm/drm_draw.c  | 216 ++++++++++++++++++++
>   drivers/gpu/drm/drm_draw.h  |  56 ++++++
>   drivers/gpu/drm/drm_drv.c   |   2 +
>   drivers/gpu/drm/drm_log.c   | 391 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_log.h   |  11 +
>   drivers/gpu/drm/drm_panic.c | 247 +++--------------------
>   8 files changed, 721 insertions(+), 224 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_draw.c
>   create mode 100644 drivers/gpu/drm/drm_draw.h
>   create mode 100644 drivers/gpu/drm/drm_log.c
>   create mode 100644 drivers/gpu/drm/drm_log.h
> 
> 
> base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8

-- 
// Caleb (they/them)

