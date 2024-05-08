Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187D28BF5B4
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 07:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2F311334D;
	Wed,  8 May 2024 05:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="Rh6TOGwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CAC11334D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 05:47:08 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6a0b4622ea0so14369516d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 22:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1715147227; x=1715752027;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y+KiVnKXCsbPvzNdODTp1oqWb7A8Ywtkjz6UCYJzfVw=;
 b=Rh6TOGwnAHljcmXQFbLl/UmuvbJEmm//4Q3q++WmSeQcH/7zl2cHvHKSHXOvENEkfe
 g5Ty+2QT3opbHK2W47HkYAHLi4RplZSjDYWbmyjK+7WPlAr1pTSxt3sZoTZxWN04DoQZ
 R0zsXv3053bT4K+l7EeyFAVFjbzySYplGh8bX9y1qXbkuhkKDzMSZPd2bxUFfIou9wxP
 qja3FSjaiYJ4iIiOVpF5unbo1BVjy/hr/M/+5ECZcr6xfXF3z0uaZtLu8s+f8j+xWTGG
 fTXtEfWQKSFGvp3VFqhaBtStvCGaGLhihdbnWj6CEFM3E7Jr3pC8gQVUveN5Himt6UO3
 t+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715147227; x=1715752027;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y+KiVnKXCsbPvzNdODTp1oqWb7A8Ywtkjz6UCYJzfVw=;
 b=Uxh0IBnJsXawnw0S3+9ew2eLqr5eqZ3tZC1IoQU74p7lYsjV0MR1V3zTW14T+Kl47F
 /6wORWm/PK7rBiMKUvVcF2Qntf6tXQJE2e/tGAd8afJqhpuNGfAl9e8O8/xsJdsioPnw
 3oeqRwc2WlW07u2wqLOO/YkYza8UlpElpurgNuoxCE3Tix8mKlxcdUXmTxcHr6fMnxX+
 oemYSmWjvJR4VnjzUa7rrTlmdutcPUHOj4tRHEx+U95BfcPR1ejXF8crgjw20EGmh1KM
 D1YZOgwDH1FLckueTsEHpWfX+83ZmtpucIJ4txZMRuTAD3DujOu+/BsmJV/9+d9Nuoh0
 OLWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9f3mIGYp+tGIgyzfugAJYWJ0k1CP6lQIifqjPabZMavCOr4JznyCeXoFkFxBC4A2SZWJN3z1hUNJgivHq9jCp1r2KvS6MPA7vcqB+KI+5
X-Gm-Message-State: AOJu0Yw6MlArD75uRIxzkvr3CWjqDtWj0gHHbg0mxZWsYmxnNqT5dKss
 ZpDADmWZsYA+lw56Ou+MqNs/CmqEMFmpzr7yudSCQhX7ir4nHKEt0f4kmkgWDKO/r2isrQ4vnaR
 9w6TO8LnO+ZLKWpnXo9MQx76Elb8eHwaM8UU6gA==
X-Google-Smtp-Source: AGHT+IFowOzBUiqN7WcnwrA/LBPZg7N9dHpRdxWUo9yBNCLNtQC6wcuw0TpbjZ6kxNa/4cgHeYqTO5liJl8XTfGujfs=
X-Received: by 2002:a05:6214:29c2:b0:6a0:c922:5014 with SMTP id
 6a1803df08f44-6a151528bbamr23726776d6.21.1715147226926; Tue, 07 May 2024
 22:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
 <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
In-Reply-To: <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 8 May 2024 06:46:53 +0100
Message-ID: <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@redhat.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>, 
 Sebastien Bacher <sebastien.bacher@canonical.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>, 
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
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

Hi,

On Tue, 7 May 2024 at 12:15, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Mon, May 06, 2024 at 04:01:42PM +0200, Hans de Goede wrote:
> > On 5/6/24 3:38 PM, Daniel Vetter wrote:
> > I agree that bad applications are an issue, but not for the flathub / snaps
> > case. Flatpacks / snaps run sandboxed and don't have access to a full /dev
> > so those should not be able to open /dev/dma_heap/* independent of
> > the ACLs on /dev/dma_heap/*. The plan is for cameras using the
> > libcamera software ISP to always be accessed through pipewire and
> > the camera portal, so in this case pipewere is taking the place of
> > the compositor in your kms vs render node example.
>
> Yeah essentially if you clarify to "set the permissions such that pipewire
> can do allocations", then I think that makes sense. And is at the same
> level as e.g. drm kms giving compsitors (but _only_ compositors) special
> access rights.

That would have the unfortunate side effect of making sandboxed apps
less efficient on some platforms, since they wouldn't be able to do
direct scanout anymore ...

Cheers,
Daniel
