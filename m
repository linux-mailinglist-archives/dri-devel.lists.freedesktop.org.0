Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA9AB8E6E
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 20:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F315A10E946;
	Thu, 15 May 2025 18:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="lHRZ55ix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999FB10E946
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 18:04:56 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-47662449055so7997991cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1747332295; x=1747937095;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SqENoL4aMLDUtpJ6J41zIxw9AQzbwBrm9u1/bZHdjuY=;
 b=lHRZ55ix0rpWBPejetRjSUDsmH+ths9TLE6WTc50Z+f1lpKlW6hbvGeLUT3Vhn9ybC
 VE6PamzzaHPYFglBMedcd8OXLHQR3ObXt2nG/Z9unyJveWe7ZItG5ZthxEedpKjkbjkN
 B0wUlqOqkjtS75M2G3GqjYZE3+CfjK0b8QOAsc3/VETIkuhTqC8xosJtccdQxZrBxqQk
 o+K3dzB3qOgtFK5Gu6qVJloWEBYv+v8kp2/sAh4+j1wofCr5QCI6/cCK0QvUjjL5JJgI
 mYnClz9PwWdwncdcqFXuDdxBWaejW3cEWwblynYv9iLXZipT1esDPDg37V2OPpOqYK8b
 ClhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747332295; x=1747937095;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SqENoL4aMLDUtpJ6J41zIxw9AQzbwBrm9u1/bZHdjuY=;
 b=CYEXxEOpb3HrztLMQz6JWxoza4NmN3D6enXrgdPeQDwRwSSr/yz3psbZRH1lu0wjDt
 x68aH8SgCSzMw/GGqumSWU7JUXc3pEQtu4xAxqeGyHAvltMTos7RhwMA71Cktx8nzk8J
 djgOcIaIi7RRFwZ/fRoElj1GWX4Be9yQpurMwgCYn1uOSPjfhBgmxhYW6Kgm0T/6SMzJ
 2xWq9ZA0yWOS9hcxKS7U0MVDaP58Q6B5iReqo7CHXeTx9pITf/C5uQtTxYxlKd5vG4ji
 AmpjPSl32UsvwqE21fkWlSflJltgzgQgaxoJhWFn8XGsYMHzdZdkD4141sc4rQMbsYdb
 3bBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2wjtJc24T2VtPjPS4dC5puUXW8Ha25fHktl7O0g+uUwAqXgFUD2mh4yodHmm06naN9tG23D0iSCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxmIwwl5sum8nG1L22j/wLtih/SFL1YgOSnooBORT/62RhLNPJ
 e8xOkf89IjW5KUi6VAswXuwOWdLo3LTqeGAbnrZeY52RT/oE+qiUkSNsi6Hr8+MBL54wwLRSe7I
 i6Q+33tZtNkiSQasaYdXYl4Hi91h/Jh08niLK7qKNgA==
X-Gm-Gg: ASbGncvEBPB4AFBD76pemq2UKQRGNdQ2byc807+azDZf6445BW6X7BgnauDY3qVwvw5
 rVJrngLA0OYBqG7ZPeFFJlGVWugjR1dL+GkdMe9qKz/hRcpG5IoJRCmyXcYLYikN8wtIcQQegHb
 LCDn5k8pTeYflBxkfOmJREf1vNKp6pb9M=
X-Google-Smtp-Source: AGHT+IGFQP++c9XJDNDJpVGCGwvgZpf4fTxFvv688y33OjFyfYfYLK9l//bZATh/43rI6k4OFGCYqhyQBM5SOYRCBtA=
X-Received: by 2002:a05:622a:59ca:b0:476:9b40:c2cd with SMTP id
 d75a77b69052e-494ae49f4e0mr5251951cf.47.1747332295147; Thu, 15 May 2025
 11:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250507160713.1363985-1-adrian.larumbe@collabora.com>
 <20250507160713.1363985-4-adrian.larumbe@collabora.com>
 <9c0b95c8-bf2d-4689-ac1f-ccacba826060@arm.com>
In-Reply-To: <9c0b95c8-bf2d-4689-ac1f-ccacba826060@arm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 15 May 2025 19:04:44 +0100
X-Gm-Features: AX0GCFuRDimE2NPezlvg51LNRrQrl-sYF337fsjOpF63sMhVPLZez7fPK-61IS0
Message-ID: <CAPj87rOiEa1bTOPqyauYhoVoXEtNeDjE+DkLbzeGVJ1tW9fJcQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panfrost: show device-wide list of DRM GEM
 objects over DebugFS
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com, 
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
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

Hi Steven,

On Thu, 8 May 2025 at 11:42, Steven Price <steven.price@arm.com> wrote:
> I'm also seeing a splat when running this, see below. I haven't got my
> head around how this is happening, but I see it when glmark quits at the
> end of the test.
>
> [  399.505066] Unable to handle kernel NULL pointer dereference at virtual address 00000004 when write
> [...]
> [  399.882216] Call trace:
> [  399.882222]  panfrost_gem_free_object [panfrost] from drm_gem_handle_delete+0x84/0xb0
> [  399.893813]  drm_gem_handle_delete from drm_ioctl+0x2b8/0x4f4
> [  399.900237]  drm_ioctl from sys_ioctl+0x428/0xe30
> [  399.905496]  sys_ioctl from ret_fast_syscall+0x0/0x1c

Soooo. Let's assume it has to actually occur in
panfrost_gem_debugfs_bo_rm(), since that's all that's changed here.

I don't think pfdev can be NULL here, because we've already
dereferenced ptdev and written to a structure member earlier in
panfrost_gem_free_object(). I don't think it can be the debugfs mutex,
because a) that's initialised with the device, and b) wouldn't be
offset 0x4.

I'm looking then at list_del_init(&bo->debugfs.node), which would
effectively execute bo->debugfs.node->next->prev =
bo->debugfs.node->prev. So if bo->debugfs.node->next was NULL, that
would explain a write to 0x4 on 32-bit systems.

What I _can't_ see is how that would be. Even a double-free calls
list_del_init() so we're all good. If the shmem alloc failed then this
would splat because panfrost_gem_debugfs_bo_add() happens too late,
and we end up with an uninitialised list head - so that's one to fix.
But I assume that isn't what happens here. I wonder if it's the import
path, and the panfrost_gem_debugfs_bo_add() call instead needs to be
in the panfrost_gem_create_object() callback rather than only
panfrost_gem_create() which is called through the ioctl?

Cheers,
Daniel
