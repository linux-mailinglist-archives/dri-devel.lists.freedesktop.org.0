Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A2B020D8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 17:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066B210E2B1;
	Fri, 11 Jul 2025 15:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NsUNWV8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBCB10E2B1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 15:48:58 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so403238466b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752248937; x=1752853737;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=flK+SksbT18bLb3jG4ILK6UNz0qu/K2MvbsIMeVlTeI=;
 b=NsUNWV8xIIoBfUkx5hhWjLHhFsEanH8QMtGiWZrPNta3J88YZg0NEUTK/rdmlJWYWe
 DyaRagd6B+EaiwgokzmVBbI5IbBpT5J4yEuUQILMlYO3xpkarEkaXp9LWwU4cHaHYbOY
 tv1Kcyhqun2hqWxMJfE0LTLnD1CGidXtl6JlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752248937; x=1752853737;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=flK+SksbT18bLb3jG4ILK6UNz0qu/K2MvbsIMeVlTeI=;
 b=vpQB4J5o1VtAkArRPTMgyzMt952bXdDzFBSBgcX3ODvmWA8iRTWe/I8QlYCDsvz73i
 6XyPHfsuQLFdlR+IXDmvMo257vVzOzAtMr7AXHHdF3m9L0D2Ol273OVn+PZSauvNj6c1
 KJsyQZILr7Zi02Bz9FzYEoFcBOvfx77SGHn6qXpke0/wDZ8BuYwqsnnkz1ex84Y9JsEs
 B3jkl9FnmEmeVthy9YyzsgNTMTarZRHgbm6tLdsz9ByMOPAP89jewN4sY6teYeuR43B+
 b13064ar9YWZXpoX4NStFFFAq2aA3hKLrgPfZVK7G4UvmY08zSFSit5LIQZ3sy0IzLqb
 qjRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHQR6kZtYdQDKsxXNy5OMui1u0B8fzuT/L9VyBLlxOSkq+gvsv0v2ZxOnoIL/aBLoo/hxOnw6WtB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDgRXg2lQ42JPh2T4aSWfkRfsmlS0WsHnWL0y8Z3Py7fbUv+b0
 mYM6dWjbG2PuaJGhifOMnewb61u0uFcFbSacrXAJNEfNGG1yZnl3k88IE5B8QEAZbIO//ZC8DIs
 wmbBOJFutFw==
X-Gm-Gg: ASbGnculpRxvxCd/Ze+UrxlQfOV1Uy5z/POS9bc0YqUmL4wC+ow9KQbI/lEYL6YjFHy
 vuOj8InjF9FpRv//3R/gz778ulnR+/hy/v/+crPOnDraKxfDQfP8k0Kk00sD83FakKWthcIG+Of
 Hn7skuP1p6A4ZNJlIvrJ6hu35qSoxfKdfXDQBMvQZP+9M6FecCbMjE8PgpkrtbDJWcrP9xj4LrF
 sfAWrS6zzvuH6EjP4u1UHfLzz0sJeGS31BtVqXQ5PJ28X+ot89ZOsy68QaLHaSO2r/R5OuZ3mY1
 4xsVy91DoNNOB5yVgi54Qn+ImV4kYM1CVNgg11G/FvwhmEgd6tciCGb+A2PrfGZpFpXiY4W7pPk
 1yY6GW1G3Ix+Iyr6NcplYwHFxLxjW03CK/AxdYn/BxhnN3xJ0RHuLdCD4QJn4AE2FMRGVn4kz
X-Google-Smtp-Source: AGHT+IFfM0FwifVnMhHg2C7tMD9h8saT+4IkqU4cFvNitXyOunEgcG6QfPfl3nOimdBdgskM+jU8KA==
X-Received: by 2002:a17:907:1b0b:b0:ae3:5e70:330d with SMTP id
 a640c23a62f3a-ae6fbc109bamr404212066b.12.1752248936980; 
 Fri, 11 Jul 2025 08:48:56 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7ee4652sm321074066b.53.2025.07.11.08.48.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 08:48:56 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-607434e1821so3072004a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 08:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUKdqIGvgDT+OcQtIf0MjGb8SGevE341VIqVBuG59hXbGbfWrBMPyGCKL+CgcYZxNV2SmC86UIapIc=@lists.freedesktop.org
X-Received: by 2002:a05:6402:2345:b0:606:df70:7a9f with SMTP id
 4fb4d7f45d1cf-611e84881c0mr3248744a12.19.1752248936308; Fri, 11 Jul 2025
 08:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250711093744.120962-1-tzimmermann@suse.de>
In-Reply-To: <20250711093744.120962-1-tzimmermann@suse.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 08:48:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
X-Gm-Features: Ac12FXxfNX9iFY-MTPcFF9E1sp2PSMV-QdcnP7if0RVZKfq1TRX51YyGvLKD3nY
Message-ID: <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, l.stach@pengutronix.de, 
 linux+etnaviv@armlinux.org.uk, kraxel@redhat.com, christian.gmeiner@gmail.com, 
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org, olvaffe@gmail.com, 
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 11 Jul 2025 at 02:40, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Reverting the whole thing is the only sensible action here.

I'm assuming this is against some current drm tree, not mine, because
it doesn't apply here.

I'll try the smaller set of reverts that Simona suggested for my
testing, and will get back to you on that.

Background for others: current -git ends up having odd hangs when
Xwayland starts for me (not at boot, but when I log in). It seems to
be very timing-dependent, so presumably I'm just unlucky with my
hardware.

The timing-dependence has made my attempts to bisect it very
frustrating and non-conclusive, but reverting 5307dce878d4 ("drm/gem:
Acquire references on GEM handles for framebuffers") made things work
_better_, to the point where I thought it was fixed.

Until the hang came back.

The "hang" is not some kind of kernel hang, it seems to be user-space
getting confused by the changes. Because I can still switch back to a
text VT, and there are no messages in the kernel logs. And the system
"recovers", in that after a 30-second timeout (it feels like a minute,
but logs seem to imply it really is just half a minute), I get

   gnome-session-manager@gnome.service: start operation timed out. Terminating.
   gnome-session-manager@gnome.service: Failed with result 'timeout'.

and it restarts, and things work fine on the second try. Except when
they don't - on one reboot it went through this twice, and

Now, because it's obviously timing-sensitive, it might be something
entirely different going on and I have no guarantees, but it does seem
to be related to that commit 5307dce878d4.

And I only see this on one of my machines. Again, might be timing, but
might also be that it only shows up on certain hardware (in my case:
Radeon RX 580).

           Linus
