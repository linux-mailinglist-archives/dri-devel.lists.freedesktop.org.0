Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCF8B315F7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 12:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EB110EABE;
	Fri, 22 Aug 2025 10:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Nm6GxEL9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD4510EABE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:57:28 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45a1b0045a0so12448945e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 03:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755860247; x=1756465047;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7HBMLCCpgWuee3qZa2JZqxXuB7kIiXGM9JL4gtORBiI=;
 b=Nm6GxEL9r0VnqstLPCYOfYdkSgNXq3bBsX8n844wyARspPcdr3aj1Mxvy8Ysq2uiyb
 xHodzVGSDAK/fmYtqaaNk9MFLfyBoWUU8qHakJtRRedMZJp3F3Cxn+Bc9tLPAVcO2K3q
 zU2zQQ2JndfLCAKZuZXlYLvmFxKNae/ciptmHY0N5fJNt8LNQhA1vI0Td7maGCXBhQwW
 sO13WksYtGvMnvGWTMhPD5LTonXfHhEgM8RGAGcYl4mspbEIwr6Ag8S13zEX0OdEbRxH
 mkJAhsg2XP//0iEz1Ayf2DDo2PpIasb5j9gnMFLnEw+qknG+rIEClDTXNtW+8p+22zjE
 aAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755860247; x=1756465047;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7HBMLCCpgWuee3qZa2JZqxXuB7kIiXGM9JL4gtORBiI=;
 b=STPB5ka9VmuQi2aXwpKG0y4t/x4X6tWMzpA834qf2zc8zr4MPkVEXC4c9TRAG7W1cv
 xswVyat/a3iFQH+QmxqkRdTPlKel+lzWtMrzemTRkOFoeaoPfv7wmhtpnqx1/DQDEsNX
 Y2vuK3LIx1yDD5yXeHT8YPeFcloWHWWLoPlH3ZpwHUvbbn8JRq8Xk+qa9wZbaDgpGAUF
 lVtmP/Vmho9F42U7Rn2Q42qs2uIqrSI5apic9gfcDTY+l3tzqK1vNP05wtVuCV/v60O5
 JMJaY8G/JSJFA4WSmlWj780UuiDagDpp01DtDs6ohPE5o4S6FGz9LUDS0dv5R76xcq1Q
 uD6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy6ZxHs4CJuYza6pFV2im+YCPsyxtATKT/SUKz+SQWh4UHKYP+Ghfv87SAud8ZSs3cc28SN6DKZvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtLQP1LTaZk1E6VCDe8XLNQHKv92WYlHfsyo+2+D4MtrpJPk8T
 WfHlMiJzJx937DVGxRlvygFaaFdkwwnmegkkXXKOJkWyABMEb6CCR3ke1jOPbWkuoPl063Kb71g
 M5PT2c+Y+nsW4S+RA2g==
X-Google-Smtp-Source: AGHT+IFtLd078KoINMXpDW22Ic3sXy4RycWnf1VLTnYuQE76dQbTyWnKjFD4VpOZLK/xGSJAqubgJ4a1/kyy7Zk=
X-Received: from wrs7.prod.google.com ([2002:a05:6000:647:b0:3b8:dd13:ef41])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3101:b0:3b5:f0aa:b1e5 with SMTP id
 ffacd0b85a97d-3c5dae060f2mr1770712f8f.19.1755860247490; 
 Fri, 22 Aug 2025 03:57:27 -0700 (PDT)
Date: Fri, 22 Aug 2025 10:57:26 +0000
In-Reply-To: <20250822115221.24fffc2c@fedora>
Mime-Version: 1.0
References: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
 <20250822-gpuva-mutex-in-gem-v2-1-c41a10d1d3b9@google.com>
 <20250822115221.24fffc2c@fedora>
Message-ID: <aKhNFn7hdsLapLWO@google.com>
Subject: Re: [PATCH v2 1/3] drm_gem: add mutex to drm_gem_object.gpuva
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Fri, Aug 22, 2025 at 11:52:21AM +0200, Boris Brezillon wrote:
> On Fri, 22 Aug 2025 09:28:24 +0000
> 
> Maybe it's time we start moving some bits of the gpuva field docs next
> to the fields they describe:
> 
> 	/**
> 	 * @gpuva: Fields used by GPUVM to manage mappings pointing to this GEM object.
> 	 */
> 	struct {
> 		/**
> 		 * @gpuva.list: list of GPU VAs attached to this GEM object.
> 		 *
> 		 * Drivers should lock list accesses with the GEMs &dma_resv lock
> 		 * (&drm_gem_object.resv) or &drm_gem_object.gpuva.lock if the
> 		 * list is being updated in places where the resv lock can't be
> 		 * acquired (fence signalling path).
> 		 */
> 		struct list_head list;

This isn't a new issue, but it's somewhat confusing to call it a list of
VAs when it's a list of vm_bos.

> 		/**
> 		 * @gpuva.lock: lock protecting access to &drm_gem_object.gpuva.list
> 		 * when the resv lock can't be used.
> 		 *
> 		 * Should only be used when the VM is being modified in a fence
> 		 * signalling path, otherwise you should use &drm_gem_object.resv to
> 		 * protect accesses to &drm_gem_object.gpuva.list.
> 		 */
> 		struct mutex lock;
> 
> 		...
> 	};
> 

Alice
