Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB808BE42B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D195B10E9B5;
	Tue,  7 May 2024 13:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ps9Zkia0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6D210E9B5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:34:47 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51f0b6b682fso3268683e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715088886; x=1715693686; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IKHBCvFKsC6Nzkx2NIWqoEqwLv1oOisbbcdd9aYPJks=;
 b=ps9Zkia0Hgmj2eE/cBzoNtUXmMaUfm0HjZWrl/4gBm0d0m/T8pzxIYyhQj66P/8GGm
 NTyLxGCA9FW9HZmxIK4Qk6+TZ6E8vKzkFn+r4KXGX4P07AMUU1B5+Fg63n+dTfrw0NUa
 gDFV5f2OoDYnY9GQY7TnBQBAiQnGShJKKagkDqcWMMKqrBL5ogg45dU7h3wVm14UBNXy
 58U6Kw+tzMsqByYxZT21Z3tbo6OT/IZtFOLkr/IZcVnfgfzxl72YK1J7MJiSoCU4bgsm
 lwJ7qrxYQMfzL819aUCJmV/ECb8ipQQHRr0zW2IThdvMi371E9ctjoXXKvvDPaaHztOg
 YF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715088886; x=1715693686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IKHBCvFKsC6Nzkx2NIWqoEqwLv1oOisbbcdd9aYPJks=;
 b=EBwDQumajIKtb45H5u41GrVn7GdjPaPe2GwKj14jW+SYVYR+1g+UnAOeFS4NRQNL2w
 uH6L8WUTWUpm3Sm6U+s61RjjBYB7jJsS2UauXcnrHah50r+9J9b4XnH7zucRBJO6Gj5n
 7IpM3PfL1AZgK4smxNsj3ev7fekBxMar73uWoglWsrXtN/9YG2n/Y99fYv6A4JwxgUZD
 ZkvI8Wn5aYHxVoCH/02xyu2Svwh92dbrME3ok3M4RnRAUvw21IrL5aCLG0HScT0rMx8Q
 s+WRJLR9OEqjH1KkcuacYF8ZA7lVXdqnsQB2o84K8TcjuhOBhpnYDJnPnXXEo8phnRcM
 KKNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF2o4/wnVplJ6jQqEYaagIUtOatelmYeEa7UP3Jn0ADAuTsCcXXbT/1yZcPqqOd89uKVITXvNdK7+dc2CpU5YQkQYRASKN8IwdHWD2TUsS
X-Gm-Message-State: AOJu0YxAYnX1sBbXGkeefUencjLZYq7NpmZMGrYMx0H/OFrlQR/5FQZt
 JRL6d0WsyLiiWOXDR7od2sPC2sqn54r3oqQ6n96jDRP4gllKsDQ2o0CTF9ti2HM=
X-Google-Smtp-Source: AGHT+IGyKKhW4HnullLr9tx7zUu9woNhXXRdGqxwVRSmjqIAiK9LODOmA2YK6g9UQq++3wQQpsuazA==
X-Received: by 2002:a05:6512:4016:b0:51f:567b:c399 with SMTP id
 br22-20020a056512401600b0051f567bc399mr14982616lfb.62.1715088885984; 
 Tue, 07 May 2024 06:34:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 t6-20020ac243a6000000b0051d87562dfasm2116396lfl.27.2024.05.07.06.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 06:34:45 -0700 (PDT)
Date: Tue, 7 May 2024 16:34:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maxime Ripard <mripard@redhat.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>, 
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <xwozli5vbte53ohjhjmne6zzfgmdxey43i35d37ht7rrxooixi@ijfqthxe6voj>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
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

On Mon, May 06, 2024 at 04:01:42PM +0200, Hans de Goede wrote:
> Hi Sima,
> 
> On 5/6/24 3:38 PM, Daniel Vetter wrote:
> > On Mon, May 06, 2024 at 02:05:12PM +0200, Maxime Ripard wrote:
> >> Hi,
> >>
> >> On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
> >>> Hi dma-buf maintainers, et.al.,
> >>>
> >>> Various people have been working on making complex/MIPI cameras work OOTB
> >>> with mainline Linux kernels and an opensource userspace stack.
> >>>
> >>> The generic solution adds a software ISP (for Debayering and 3A) to
> >>> libcamera. Libcamera's API guarantees that buffers handed to applications
> >>> using it are dma-bufs so that these can be passed to e.g. a video encoder.
> >>>
> >>> In order to meet this API guarantee the libcamera software ISP allocates
> >>> dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> >>> the Fedora COPR repo for the PoC of this:
> >>> https://hansdegoede.dreamwidth.org/28153.html
> >>
> >> For the record, we're also considering using them for ARM KMS devices,
> >> so it would be better if the solution wasn't only considering v4l2
> >> devices.
> >>
> >>> I have added a simple udev rule to give physically present users access
> >>> to the dma_heap-s:
> >>>
> >>> KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"
> >>>
> >>> (and on Rasperry Pi devices any users in the video group get access)
> >>>
> >>> This was just a quick fix for the PoC. Now that we are ready to move out
> >>> of the PoC phase and start actually integrating this into distributions
> >>> the question becomes if this is an acceptable solution; or if we need some
> >>> other way to deal with this ?
> >>>
> >>> Specifically the question is if this will have any negative security
> >>> implications? I can certainly see this being used to do some sort of
> >>> denial of service attack on the system (1). This is especially true for
> >>> the cma heap which generally speaking is a limited resource.
> >>
> >> There's plenty of other ways to exhaust CMA, like allocating too much
> >> KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
> >> differently than those if it's part of our threat model.
> > 
> > So generally for an arm soc where your display needs cma, your render node
> > doesn't. And user applications only have access to the later, while only
> > the compositor gets a kms fd through logind. At least in drm aside from
> > vc4 there's really no render driver that just gives you access to cma and
> > allows you to exhaust that, you need to be a compositor with drm master
> > access to the display.
> > 
> > Which means we're mostly protected against bad applications, and that's
> > not a threat the "user physically sits in front of the machine accounts
> > for", and which giving cma access to everyone would open up. And with
> > flathub/snaps/... this is very much an issue.
> 
> I agree that bad applications are an issue, but not for the flathub / snaps
> case. Flatpacks / snaps run sandboxed and don't have access to a full /dev
> so those should not be able to open /dev/dma_heap/* independent of
> the ACLs on /dev/dma_heap/*. The plan is for cameras using the
> libcamera software ISP to always be accessed through pipewire and
> the camera portal, so in this case pipewere is taking the place of
> the compositor in your kms vs render node example.
> 
> So this reduces the problem to bad apps packaged by regular distributions
> and if any of those misbehave the distros should fix that.
> 
> So I think that for the denial of service side allowing physical
> present users (but not sandboxed apps running as those users) to
> access /dev/dma_heap/* should be ok.

What about an app built by the user? The machines can still be
multi-seat or have multiple users.

> My bigger worry is if dma_heap (u)dma-bufs can be abused in other
> ways then causing a denial of service.
> 
> I guess that the answer there is that causing other security issues
> should not be possible ?
> 
> Regards,
> 
> Hans
> 

-- 
With best wishes
Dmitry
