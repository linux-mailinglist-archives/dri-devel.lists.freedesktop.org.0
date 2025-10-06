Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A361BBDDEF
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 13:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CC410E33C;
	Mon,  6 Oct 2025 11:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CNLRGe0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEE510E33C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 11:31:14 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso3044385f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 04:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759750273; x=1760355073;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hynuoczeLJTVBLZvXLTFWBQJF44SryF2C9fl7xOgImY=;
 b=CNLRGe0bVu1LvU17PtPphs3OoRxdQjYyveGWcW4gPOYFbsJUtDn5JGiTGHr/IjqXNJ
 L2CWiIXLv5VW70S80Qe85MbOnPVnt0dxwK4IyT9Mlby0b2g3aSgkJiz4NrDuqHfvqIMS
 iVdPZ+l9dum6NlGaKFA4QfSW9ll5Eh4KW/wCagUipiT8VXP+KbyHKX+15xiEMiCyDVl4
 RqadTT2dR9lODfPjdbejWvTKLpTjYLY12Uq572zDL1Gv4tuZOM42d/Ag0zfXHzxFp1OG
 qALnBZPJOxJP1+ponbZ/ub1/DA6fuwtCtPK+PguWJfjYtnYotCRrvGH/p9lLhUBqWkha
 WAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759750273; x=1760355073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hynuoczeLJTVBLZvXLTFWBQJF44SryF2C9fl7xOgImY=;
 b=Xtf2/SxJSVje5dmn0Tc2Sz6n+/ocXaLFkjfKj5D+/YftfCSWsQeLalzIONpcwsQ8O9
 VbnafWdWwhMJTvTr41wnmupcUBhHwrNM7yaVLKJDf7WqONaX2eF21/L8orcuhOSU+9oC
 idJG0z7Nlo37kIB1HLsw911WReb91loo3GvfwuIxbmAxpytgPvDOLiy5Iq6hJ2E6IWTR
 jjQjmgQ0fUHdTgqYUHqdwLL4QG5dj/8nUHSnf96hopiHzEoJ4mHD5fsJsxSQDJx7ikaH
 khV5Kgtd71zYiGWrWx4SeXVSH5Y4Q4S+Oevuzh/tqP8V3oNR+AXCj7sDaqIKLZsZ/9fo
 s0rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTR7j3UxPnaM3d6xz8/nujs9gx6PMTABv8hpT6tZUdk5Yvh8UIoBH7XlS6hCcptPkKlmvkvtSd0kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR2S7gNhK4EfPUSba4nAtkPtdk4tpwk7+HOcRNHbmtSMNyRC9M
 A9zyPXfjf23D2cuSBG3v6T35bgxG5u5GM3i+5p8GUBWHmZsvTsJIbnvXxHBVGd6xHJeSGod4srn
 jNONXF/kW2RhcnjV42TxLzfuRgtaYJJgMP1yitUrM
X-Gm-Gg: ASbGnct1gDX1WDA2UDWAgcMkVKPTmI9w787OKvhln3gzLwKRt8vmMvhUgrmUKxJnEBq
 vfObBAZln1O4iv27wxtGQyrmBs+QAeDdjW29LpiiLhcURXkba9ATk8os80CA0qCjm4tRy85UKTw
 yFz6c9OqMZMXNhJPVYZDdfSx/15xm73IfJp7VPC7p/JWg/PFeMqRoMQP9beqNlZF6ARA1MByCuw
 aP0hIg6Sga0bB83HyN3/Q9EalI+TXdnj9FKU8GppmguS0ocety6jXcUm4Eko5yp5bfvCU3JAcT4
 ZXg=
X-Google-Smtp-Source: AGHT+IHvyJbvN6G9/V2BAekCb/eczdhEbJ4N40IyXAkqljeVImgzHiqmjBf+48NckaYcxwY7yRHMElzQvdgz8RRqA3o=
X-Received: by 2002:a05:6000:43c5:10b0:425:70cb:9ba8 with SMTP id
 ffacd0b85a97d-42570cb9bd8mr4248192f8f.1.1759750272637; Mon, 06 Oct 2025
 04:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
 <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
In-Reply-To: <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Oct 2025 13:30:59 +0200
X-Gm-Features: AS18NWDt63QT61YPNpzRLuOD6qlBzTV_WQ7rT6iD_6SVfpk6AHE4bvqw1ogfIKI
Message-ID: <CAH5fLgipghDp3W+Gr0YfHT0HOp3vcF+mfBAbtiAiLOKRYt43Sw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Oct 1, 2025 at 12:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> When using GPUVM in immediate mode, it is necessary to call
> drm_gpuvm_unlink() from the fence signalling critical path. However,
> unlink may call drm_gpuvm_bo_put(), which causes some challenges:
>
> 1. drm_gpuvm_bo_put() often requires you to take resv locks, which you
>    can't do from the fence signalling critical path.
> 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often going
>    to be unsafe to call from the fence signalling critical path.
>
> To solve these issues, add a deferred version of drm_gpuvm_unlink() that
> adds the vm_bo to a deferred cleanup list, and then clean it up later.
>
> The new methods take the GEMs GPUVA lock internally rather than letting
> the caller do it because it also needs to perform an operation after
> releasing the mutex again. This is to prevent freeing the GEM while
> holding the mutex (more info as comments in the patch). This means that
> the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

In this version, I got rid of the kref_put_mutex() usage, but I
realized that maybe we should bring it back. With the current code,
it's actually possible to observe a zombie vm_bo in the GEM's list
because we don't drop the refcount while holding the mutex.

Alice
