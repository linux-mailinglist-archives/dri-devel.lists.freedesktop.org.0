Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB8FD089D3
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EE810E890;
	Fri,  9 Jan 2026 10:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c5qX8Iho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE00510E890
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767955052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ipuoDX2rtJ56VEsP+6WugM42BQVThpNDN2xp89WYaWo=;
 b=c5qX8IhoFAkB1wom+/WR0T580xx4vHrTpPRH09muh78EaI/CNpnmfQSSnOwskJ9KUu7kAN
 vi77wVaMfmyF52l2RAi7jZSNmiLLShN9qWbafkkiOSBTh81jKKqVrRbMtD+0jBi6Se9qT3
 c67y8Ij5fiEERAeArCbmIPta875M/pc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-7Lf_cvBBN_-nbUu0-RAb0Q-1; Fri, 09 Jan 2026 05:37:31 -0500
X-MC-Unique: 7Lf_cvBBN_-nbUu0-RAb0Q-1
X-Mimecast-MFC-AGG-ID: 7Lf_cvBBN_-nbUu0-RAb0Q_1767955050
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477a1e2b372so37541875e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767955050; x=1768559850;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ipuoDX2rtJ56VEsP+6WugM42BQVThpNDN2xp89WYaWo=;
 b=qwokqSBuhrsicpkVc5QleNz9+b8VFztqtnFADhM7CRKBO4Pvd/woE7a9niE/Y0Qrm9
 JpHMM6Bs/eUOPjFunHp9ur33hratiG6yUCHRNd8mDpe8zWC/cd7NXJm8MjDN2r6J0v6P
 mb8FTyX9x/8VGDPG1PsQr1vpFz8oZrtqacpM1HBIJU8GomJy/BxjevPgF+MyTAldrKxf
 1jm4rVYdxQRiEFt7LXCYOgKcVDK+mzEBR0zDC6WiltRzOhPkqqkweHsW1K2mkRQusucR
 UvBtT7Fs1+5OpwBlZ+oX4MPn/nJoCfJnBqdI7CqUR/odOrZzkHuo3DCYM2Khu9wzyGaM
 MUSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk3hIX2hy0yKufDOt9XfBVWs2vAotPHvWuCH99fk8M8KJInM3FiAiizWPSJK/sh9EhOwz5xrGVWM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPoeSl808hIC3RrS1uGSoWdfLto3ysLi2lh20jwB+SdV60KQ6H
 GSRatcVt4jOaHtWhxi9CF9hP5cIIMWibePc0izRGsY1S53N5SR4d8mj+McXnolSuBrqZ7m20qOu
 hQWoC+xhMRjz/bBTFH4g6PJzIjCVEGqULb1trhqLJ2+VhjrybnDOXnHySoM4+Nz9ktqe6Mg==
X-Gm-Gg: AY/fxX7p/K/c+MiOfOeQpj9RN0yvbkePW3WKPOLeXpE443lDtZ9+3jIhX6e7eToy3go
 61dzQH3bhkN9p/dMRl0tGvJfl0bcTwkkP0ENA3hAqxkPa+2iM49YnsgpJ1lPJF8pVa2Dy++KVgW
 JywiVf80sJKbUaJ25ruOF38OtSoq4SOeNvi1CGRIVaRR2H35U0xRrMOi5ElW5W61uAZvE6L+1HC
 pT4hgSmID1NyfjoBQgFB/xKFW4kYmxY8wYACS3/S5M2mkqd8f9Z15lxtICzv9RMpZjV5055+fbg
 9ZmTW47F8e5BNdL3T5d/i5lm8GdY+o8kBNE1dkue+Q5pfDIFkP3P5huDBMk+UpkNHx2GGnYlxMY
 3FU9lVcL+iYriwPjGps31rScWhuUUt+X1tMiB5/dG1olUTU0TbxPmxks6LQM5pFqFF40U
X-Received: by 2002:a05:600c:8b2c:b0:47d:3690:7490 with SMTP id
 5b1f17b1804b1-47d84b1849emr110853925e9.9.1767955050356; 
 Fri, 09 Jan 2026 02:37:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETCK7XKY5/aWdQyBTZZ8C1HEHfaJgnGTLB3Vai329iWuwNw67ymEzlG9XniABoH2eVUx9ipw==
X-Received: by 2002:a05:600c:8b2c:b0:47d:3690:7490 with SMTP id
 5b1f17b1804b1-47d84b1849emr110853625e9.9.1767955049923; 
 Fri, 09 Jan 2026 02:37:29 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8384646fsm167654735e9.15.2026.01.09.02.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 02:37:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Brian Norris
 <briannorris@chromium.org>
Cc: tzungbi@kernel.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, chrome-platform@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/8] drm, coreboot: Add DRM coreboot driver
In-Reply-To: <8d1b915c-b1c4-42db-b941-cf62613c17bf@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <aV_zKzBth1TJNFvJ@google.com>
 <8d1b915c-b1c4-42db-b941-cf62613c17bf@suse.de>
Date: Fri, 09 Jan 2026 11:37:28 +0100
Message-ID: <878qe7f4wn.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X7yDawPZhAAlATzo8_SGMNScmw3hoUMj518cJqEwcLs_1767955050
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 08.01.26 um 19:10 schrieb Brian Norris:
>> On Thu, Jan 08, 2026 at 03:19:40PM +0100, Thomas Zimmermann wrote:
>>> Coreboot implements framebuffer support via simplefb. Provide a
>>> native DRM driver. Keep the simplefb code for now.
>> I'm not much of a DRM-er, but what's blocking us from just replacing the
>> simplefb driver with DRM completely? Just being conservative and
>> allowing flexibility? Or are there technical reasons this wouldn't be a
>> proper replacement? It sounds like supporting 2 drivers provides at
>> least some small complications, like in patch 1, where you're trying to
>> avoid repeating similar logic in 2 framebuffer-handling drivers.

>
> Yes, that's true.
>
> There are currently two drivers that bind to the created 
> simple-framebuffer: fbdev's simplefb and DRM's simpledrm. The new 
> corebootdrm intents to replace simpledrm. And simplefb is deprecated: if 
> no one uses that any longer, I'm all for removing coreboot's current 
> framebuffer handling.
>
> Best regards
> Thomas
>

As Thomas said, simplefb has already been replaced by simpledrm. DRM
provides a lot of advantages over simplefb, for instance is a KMS driver
so one could start KMS apps (e.g., a wayland compositor) which is not
possible with simplefb.

And as Thomas said, fbdev is deprecated and likely going away at some
point in the future.

The real question is about simpledrm vs corebootdrm but Thomas also has
explained why that change is an improvement. Then simpledrm could only
focus on DT based systems and have dedicated drivers for EFI, VESA and
Coreboot system framebuffers.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

