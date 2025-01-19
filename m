Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03726A163ED
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 21:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570CF10E07D;
	Sun, 19 Jan 2025 20:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HYfMrUxM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685E510E07D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2025 20:43:29 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e54d268bc3dso7017107276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2025 12:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737319348; x=1737924148; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8lAhJ5IrVPZQcoYHV+i/ViFGYILbt1ZiJAEAksEQQDw=;
 b=HYfMrUxMi61WpMEVOwalBEDxJlO3MUSk/z2Bn0KuJd4d/HRQmMR8DCQxZRyethNYwv
 LvRrcxdJiMYHeI1RPAYVUX7lD8iL+AbouuuAJHkZzhkRSejTcll1B9w5y1Yut7uI8qxj
 2xAceOCAL1eydw7pDW2Rn3TnfRXmIZfTlSIoCSR44CKpy6lMaeLzpW5MfBna/dEfNWrP
 ImFT24c8v3Q5u5gmNDtf6nJjJzyy/F8OtMf2teznQQuxqS+XxuGk2Rb9Q1yiQofJxIfM
 XGpwTcm0HyVlKdXrzW74/epFzq25JZNlFGUcp/GS1lOP8tC+a68kfzYw8JdfVIUSqRR8
 5rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737319348; x=1737924148;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8lAhJ5IrVPZQcoYHV+i/ViFGYILbt1ZiJAEAksEQQDw=;
 b=PFoPpEQUdww8UVpwPDXXYD48jF5oGChT4YmIQ5AcHfvM7ybyuLG3gMvlY+LtEsz1IA
 qFfT/9bFu9My99L0oM8xCfQ53ww/X0a6D801vuMyB4I4tq8NkLcS76LTeicUJY/+qQJP
 ZKzDrnVlE0Q4DH80finJzJxSwkDrKNgJbImrkDtH12/CXQWVqQAgo11R2QC9rYYqezev
 kuYPr3wKSHm2onlOQDq1yudCBqLnDRH8uOCkuf0oW7MErHT5yZjlNW06lE8Lh8Ta26uh
 LT7aoLSINy4GxkRlRfxExOgDxrXDtjGLBSL/CoW4GKP1YY/fF5KSO0b3ZocFGO6CNbUY
 3+pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdcTihcuwbIjB119OYN0FR4d+4ZccxnowLIjOW4l8RYHJn4vzO42QTDI4FDLbStia5ejgjHhjEZBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdUMo47k9sHRqTPEyqCWE468gtCN5z9an99ghDc4Nho1X/9aK6
 ckCqNhbHrgI5RpVMjN4V5tAfD4tSa/6w3AksMwMfobQCO4LXyIMceaKPPw8zzdAehYQ8QLU3r00
 jucKwmD3SNTQdFSR44j0lf4A8qYw=
X-Gm-Gg: ASbGncvZNDKkubVz5byX2X9t6k20c7wyifEnmkp5YQAkS/tvc1S+48Tr67SektE601N
 gDOwxmeq1amYMpkHI7V4m6fKOs5nhoapCDXF5fQasobBumYPvnTYW
X-Google-Smtp-Source: AGHT+IGaPnb11OoaGg2ixbnYgp1PVt4lZ/eQ66+OiZixdaacUCgn7+WUkslkBTJ4yop1zjk2PUW+XSykxJ6BzY4VQ/c=
X-Received: by 2002:a05:690c:d89:b0:6f4:dcb1:5bc7 with SMTP id
 00721157ae682-6f6eb658b77mr77228777b3.1.1737319348517; Sun, 19 Jan 2025
 12:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20250109-virtgpu-gem-partial-map-v1-1-a914b48776bd@gmail.com>
 <2f51584c-0590-432b-a4db-7a2af99cde15@collabora.com>
 <CAMT+MTT11xg-14KrcqUTx3DxF=1NnYZAMY8RoZFoTesc0zEiVA@mail.gmail.com>
 <a6b7a3a1-e6f9-4da7-96b3-62aefb82dced@collabora.com>
In-Reply-To: <a6b7a3a1-e6f9-4da7-96b3-62aefb82dced@collabora.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Sun, 19 Jan 2025 21:42:17 +0100
X-Gm-Features: AbW1kvY6AyoKzuXRUCeQ-DonU--FYB1N-89W9fTBo1fqGY0YjUfZ_KrqgSImC4M
Message-ID: <CAMT+MTSCKiRMy6r2uDsT0dpv=jru-G-M5qih6vPSe=ZvpKC-kw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Support partial maps of GEM objects
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev
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

On Sun, 19 Jan 2025 at 21:02, Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> I've tested this patch. Partial mapping with a non-zero offset doesn't
> work because drm_gem_mmap() rejects it. I'd want to see your sample code
> that performs mmaping, maybe I'm missing something.

The entire setup is a huge pile of moving parts, but here is the relevant
function that creates a fd from the cross domain info (this is a part
of the vm agent)
https://github.com/WhatAmISupposedToPutHere/krun/blob/pipewire/crates/muvm/src/guest/bridge/common.rs#L745
After the fd is created, it is passed to a pipewire client running
inside the vm,
which in turn does a simple mmap() (with a non-zero offset) on the relevant fd.
Not sure where exactly pipewire's code does that, the syscall was observed
via stracing the relevant process.
