Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E2A8BE413
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81524112534;
	Tue,  7 May 2024 13:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tmW1Vs1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB85112534
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:32:23 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2df9af57b5eso42258051fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715088741; x=1715693541; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=huJibqJN85r8uyZHaWnhr5W8KxIdUNVSaNrUGy1RNcA=;
 b=tmW1Vs1rGKZuv47vaht0oK/PnjKioM7r8BuOeczhmpDzUmNIKq88/l1XXiUUJiWQAG
 Xdcl+88KbJ9TSDcgaomT/VsHPwAueov1F/81bhrCuOvXBkvhtP7rFbYQt46O+wKRAoMQ
 9rfUUobPCa+oT2ZerYFH39ZNIrPJUe0j+9lGlgvdVwV0WyXDT0n80CV5Ml6lTn+pYY6/
 ZaWg6dAMhpaXwZMb3YX2s42SzJPkeJJCza3saL6zQTYLRLsKFqJXJwpcJMw+1MimzG42
 CnTkiWlUO3dBqAOxZ51IEvK2IShPi/Zxh2LPvUObzWjx3iJ6S8920VzlcvcgRFi6M44g
 ZyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715088741; x=1715693541;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=huJibqJN85r8uyZHaWnhr5W8KxIdUNVSaNrUGy1RNcA=;
 b=LVXDrvs3HWd8E/9WqDyjux1ukkFqBJ4zkuL0a0pyt5tMF446mIXVnabkwyL/8+tXar
 I7jlCIXkdrUi3q2jetTWonkH/ORKjgzUo2JJMKRJnc+9QNOXXYn+0IWPyKlIGMGSz5SE
 9RkHUw3YbF+ibU9gKhZ2akN2Xtziz+ODvdBvhF4YE4u47QSI6AF2gugg0H/JtsTh5h2D
 oHt+nlrsg7muaX0reFHmlWgZcbdPauNsPe+KjVVnbhDqugPmhcjsb97eDb+1LAvbJiEL
 RlqddaOFn1RLqUUiXgCKaYGWq2DT0dRYSs3G2/wvjm00MclhFaEyQ7DYlZ6ZhPpvXG80
 fmHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOtQcV2BiVS64E1y5L2QKuQwFNe9Cmt39o4xPwVLb28FFpAvLkB+eLs4mO0japeoTFRT8Rru1s/+A8gRosFvLbJBcsPuRyI2RbWOIqqWz7
X-Gm-Message-State: AOJu0YwPIwccEbzeUWRXk9VUHwJBHhvG9JkXJ2L9tTqsHs55gHSjddXO
 4hpe6OxoVZ5Cgn7OUgwzedHYpw4zMutmyEAsFobqm7/4Yy2GL8CumOtJa2vr2qw=
X-Google-Smtp-Source: AGHT+IGD/JeQgTpquE7MLFJE26/XO1UVjUN5TKpuK/IVcoLAzeSx3fB3SA/M1rPKsXsUuic7yU+dKQ==
X-Received: by 2002:a05:651c:20a:b0:2df:dea1:5378 with SMTP id
 y10-20020a05651c020a00b002dfdea15378mr10307465ljn.16.1715088740904; 
 Tue, 07 May 2024 06:32:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a2ea366000000b002e2b229d8d5sm1403183ljn.83.2024.05.07.06.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 06:32:20 -0700 (PDT)
Date: Tue, 7 May 2024 16:32:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>, 
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Milan Zamazal <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>, 
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
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

On Mon, May 06, 2024 at 01:49:17PM +0200, Hans de Goede wrote:
> Hi dma-buf maintainers, et.al.,
> 
> Various people have been working on making complex/MIPI cameras work OOTB
> with mainline Linux kernels and an opensource userspace stack.
> 
> The generic solution adds a software ISP (for Debayering and 3A) to
> libcamera. Libcamera's API guarantees that buffers handed to applications
> using it are dma-bufs so that these can be passed to e.g. a video encoder.
> 
> In order to meet this API guarantee the libcamera software ISP allocates
> dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> the Fedora COPR repo for the PoC of this:
> https://hansdegoede.dreamwidth.org/28153.html

Is there any reason for allocating DMA buffers for libcamera through
/dev/dma_heap/ rather than allocating them via corresponding media
device and then giving them away to DRM / VPU / etc?

At least this should solve the permission usecase: if the app can open
camera device, it can allocate a buffer.

> I have added a simple udev rule to give physically present users access
> to the dma_heap-s:
> 
> KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"
> 
> (and on Rasperry Pi devices any users in the video group get access)
> 
> This was just a quick fix for the PoC. Now that we are ready to move out
> of the PoC phase and start actually integrating this into distributions
> the question becomes if this is an acceptable solution; or if we need some
> other way to deal with this ?
> 
> Specifically the question is if this will have any negative security
> implications? I can certainly see this being used to do some sort of
> denial of service attack on the system (1). This is especially true for
> the cma heap which generally speaking is a limited resource.
> 
> But devices tagged for uaccess are only opened up to users who are 
> physcially present behind the machine and those can just hit
> the powerbutton, so I don't believe that any *on purpose* DOS is part of
> the thread model. Any accidental DOS would be a userspace stack bug.
> 
> Do you foresee any other negative security implications from allowing
> physically present non root users to create (u)dma-bufs ?
> 
> Regards,
> 
> Hans
> 
> 
> 1) There are some limits in drivers/dma-buf/udmabuf.c and distributions
> could narrow these.
> 
> 

-- 
With best wishes
Dmitry
