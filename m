Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39E7B0E541
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 23:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2524110E713;
	Tue, 22 Jul 2025 21:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dnoLgrGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4337E10E713;
 Tue, 22 Jul 2025 21:11:30 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-456108bf94bso42714815e9.0; 
 Tue, 22 Jul 2025 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753218688; x=1753823488; darn=lists.freedesktop.org;
 h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=02k7SvjRhCaME9MdUTVrzF7bGQou1g9Sbfk7ChPAhp4=;
 b=dnoLgrGJv70DXxahLGBUjaunK0dM17O+QbdJ5xv3DqDlbBRsRYKGnkACBHIiVeJDI5
 aP+dZTAPyC3QXpNi8RK2ROQFkuZBeHLaDjX2Rxl80a7S8Ptl0TZPzyXNdKAskkvevjWx
 xz3faoRDxhCPfS0Rx5mmSCmQ5A7RxEV+uJV4+u7UC7/KdlCfoesXC8D229fcgAzWcAv6
 poXsQKhoNoUchJNM3kEmIgcqByWMyP25Idawq3luBl9I0HhqpxSlKQCx6ansJbivfMdA
 6MgEjCT2j9/UTeMk79QXIsHJCSrXC1C1mU2g6/AYJ9t77KmrSFFtJ1F+dPtta6RJmF3L
 jZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753218688; x=1753823488;
 h=mime-version:message-id:date:user-agent:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=02k7SvjRhCaME9MdUTVrzF7bGQou1g9Sbfk7ChPAhp4=;
 b=kTpu8dqBaC/q3m19Anr2Tr9+16l0LziyzeqryspzUnjs97z6z9VlB2fLTyggltPqBq
 hQBjP06ciJVfnpIDQja9X1HSr0vQHqywsB53oIxpzBe2RDyG4oChPos6UKZXXbEB+lxL
 KU4ymgslaJ+GuXCAk4HbAEGt4LCf2Dgj4hoaX93ItsjGnDGKQYmXI+2+cWM6N33bJ7qt
 UhxLk+W3Gu3Oo671MPXDP7t/AgGnz/l2yTAHxu3Svqbx57M8ChYJ9SeYxsLxbJl/7xiV
 7lfydncBjZddwj0GOH2dR/gTZxGvRZpDMpTm5yixbvbINwLYqa6ynwcm5FVsQFwL9lyg
 FD0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQrJp1hNdOlpoCD8EU2zyTPew33pTct0Hc5l3ocr0B9i2b4Nu1/ZBrhiBEu4ePJ9aF/LG2U+83@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzot+AU43oGjV+26dx3FGgd8b2Dru4XnsxLYc7d0yajRSPnNckd
 6MFxj+jzm8Qmm08995A88w6faGPK06qiOYLIOr2uFfspLrpJrwscu00VfqIuEGL3yWM=
X-Gm-Gg: ASbGncucNataxCUIfdVRE4rqJT5p01ZDy5ieaVBqhpfIWMCUL6DkxfFiALaTRIJeW3/
 WVGIMS6P4nHnLwNw6ST3r4WQ4WVtqw+Aqn3KpRKlUyQLuBzCD2OrUu5cD26hZbK6lajDpe4ZnCq
 h3gVoWt5dQyb24krMSj9U7v8q930pJFZWCWqypWUUbwbjMpVoR7pgdtVwZD9zibquZxWSOQo4c0
 nKIa2tBcSJ3RWXxhx1PceKq6RRENd27EbzbrJbiRibfbgLJpW6bag3yqIUAbvzCU+GSIFgu6Dli
 tUSsbbem1a6SBO7YSyS0louLQWENOp3c7+37GkMO+azJLgm2Nbiu8Up2QXfvcZdiVl7q9joTqen
 eqblzjFKfhyS4fLtcvAlThg==
X-Google-Smtp-Source: AGHT+IGm5emYv08P4JjpwU1ZgumGvll3d7SmkVojf9n8iNSrvMltAMegiN2W1Nn44QMhhj47I+Y0bA==
X-Received: by 2002:a05:600c:1c8b:b0:456:c48:491f with SMTP id
 5b1f17b1804b1-45868c8cef1mr2752905e9.10.1753218687966; 
 Tue, 22 Jul 2025 14:11:27 -0700 (PDT)
Received: from hactar ([78.180.251.16]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca4c754sm14493029f8f.59.2025.07.22.14.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 14:11:27 -0700 (PDT)
From: Koorosh Lahijani <kooroshlahijani@gmail.com>
To: Sean Paul <sean@poorly.run>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Converting dev_* to drm_* in amdgpu
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 23 Jul 2025 00:11:25 +0300
Message-ID: <87tt34aq2q.fsf@gmail.com>
MIME-Version: 1.0
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

Hi,

I'm Koorosh a computer engineering student, I like to start learning
kernel development and I'm interested in the Linux graphics stack.

I like to take up the task of converting the dev_* logging macros to
their drm_* counterparts if this change is wanted in amdgpu driver.

One small question about the task, it is mentioned in
linux/Documentation/gpu/todo.rst:217 that the reason for using dev_*
macros is differentiating between instances of the same driver, should I
do anything special on the format string part for this or leaving it to
the first argument of drm_* macros is enough?

Regards,
Koorosh
