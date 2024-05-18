Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139D18C900A
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 10:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755A910E0F0;
	Sat, 18 May 2024 08:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="TvUXdcLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BEC10E0F0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 08:46:14 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-62036051972so10215877b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 01:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1716021974;
 x=1716626774; darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=n+rd4UdCyI+BaLvkA5VSQVIe4oBJ+kbE0mtFLmAsgdo=;
 b=TvUXdcLrHVtN7Xj5mqBgHeHDUz5GSrVehaM0P4zeOwLNvrYVgjAJwA7V30qNVPIEy7
 2923X6SZu5UlNI+bbeLwVdUSijoekvgROH4+Op1NEh/oae0fB9vvwxGB5rzQUAOBxmk3
 A9CVmh3Sx4zbIjL6ffLUqSqLdsERRGa8T5CJ6spqlekXN4uOtNMwo7d5stlN1KditkBX
 F+wdoVS5CvtvVJSf2mlDUmpgEIZSuPKgRRsmZo0hfo4bchluF4UtSEq0JsF9TN4O6ipq
 Uelbq5mDXuhZmBrv+rInCmu1VhI2VkPfGe4msBwBOlHwccLmbPW6IdsHJQEsb93aLioP
 Jd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716021974; x=1716626774;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n+rd4UdCyI+BaLvkA5VSQVIe4oBJ+kbE0mtFLmAsgdo=;
 b=fPKRBEuwpiYPnyvOVpEdBT60rGA9/CXNSds3vuToOKmUOkLdPHJp3xJJY5W0XBpR87
 b7oE2iJkUSTgCWKdtUgE4FnWkv0BAv5Ft23QM3dfgRnOMe2z1nUkdcby1ESCKVtI4Cz2
 tL4YvvF9HL4wZzZz8hmdzSxa2sP4H+YGyoKjEBnXfnT23z/YlJBf0xdXHP9h5BhI54P6
 Mwn5mr2IyZy2Ef3Hg2Yf853RRZTt9ZXtz3N8z+ITTyie2dEq4lwcqejnh9/1S4Ve62ZP
 D9zHfzmFDv0BF/EGxFyd+8jrn7PBHqACmYeVnRIXHTj/aw2228131wi5cbvO+6lzpS80
 cCQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH7GB+XPa43p++aJ4PSQW9S8oHoMkJnNbOrzJYMufceQFBxhGfC8EzoBQKmfHWrySLLsUbaRzBkk63Exj3Tks018wsraPWi7HTdm+jd0EY
X-Gm-Message-State: AOJu0YxBOXNoTgtlpKXmHVKn2RHdxNZgSMoj5P1UptkU2sNuoYN3sfCm
 a6/EHlnV3CqzUNCQzijxYuQAun137EfLRuOxCG2D3xCC4Vs9A0/g1Oh1hf/ZyGXcya2a5/K3JTF
 KKxamQg==
X-Google-Smtp-Source: AGHT+IEy3teKLvur8M4u6Rir5ZEIxLjxCZ/XWoHBM9R6DdYtYZvODOFgBKMKI9GvveqUqgKNt1HDyQ==
X-Received: by 2002:a81:c60e:0:b0:61b:33ae:d9f3 with SMTP id
 00721157ae682-622b01660cbmr217890857b3.50.1716021973628; 
 Sat, 18 May 2024 01:46:13 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6209e488e5csm42178327b3.104.2024.05.18.01.46.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 May 2024 01:46:13 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-df3dfcf7242so961809276.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 01:46:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVLLW3A85p1xa/pPxnmC7AIQgD3+ukW8UMVIH2IlJm8IdMbxsKyxN/BJ26N3Srzr5JOPoPJvJiW87TsFu7nN1UTl3NFMyZp4/yTM9rRavcD
X-Received: by 2002:a5b:5cc:0:b0:dc6:d738:1fa6 with SMTP id
 3f1490d57ef6-dee4f1b8bdcmr21070438276.6.1716021972694; Sat, 18 May 2024
 01:46:12 -0700 (PDT)
MIME-Version: 1.0
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 18 May 2024 10:46:01 +0200
X-Gmail-Original-Message-ID: <CAAObsKAw174AhGaA13Hyw0ANW=TxJHpK10+OwQGNMVca85Urdg@mail.gmail.com>
Message-ID: <CAAObsKAw174AhGaA13Hyw0ANW=TxJHpK10+OwQGNMVca85Urdg@mail.gmail.com>
Subject: DRM Accel BoF at Linux Plumbers
To: open list <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Olof Johansson <olof@lixom.net>, 
 Lucas Stach <l.stach@pengutronix.de>, Jeffrey Hugo <quic_jhugo@quicinc.com>
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

I would like to use the chance at the next Plumbers to discuss the
present challenges related to ML accelerators in mainline.

I'm myself more oriented towards edge-oriented deployments, and don't
know enough about how these accelerators are being used in the cloud
(and maybe desktop?) to tell if there is enough overlap to warrant a
common BoF.

In any case, these are the topics I would like to discuss, some
probably more relevant to the edge than to the cloud or desktop:

* What is stopping vendors from mainlining their drivers?

* How could we make it easier for them?

* Userspace API: how close are we from a common API that we can ask
userspace drivers to implement? What can be done to further this goal?

* Automated testing: DRM CI can be used, but would be good to have a
common test suite to run there. This is probably dependent on a common
userspace API.

* Other shared userspace infrastructure (compiler, execution,
synchronization, virtualization, ...)

* Firmware-mediated IP: what should we do about it, if anything?

* Any standing issues in DRM infra (GEM, gpu scheduler, DMABuf, etc)
that are hurting accel drivers?

What do people think, should we have a drivers/accel-wide BoF at
Plumbers? If so, what other topics should we have in the agenda?

Cheers,

Tomeu
