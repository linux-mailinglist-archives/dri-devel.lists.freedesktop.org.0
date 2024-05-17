Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AA8C8AF9
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 19:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7991210EF31;
	Fri, 17 May 2024 17:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Vi5TTRYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFAB10EF2E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 17:27:03 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-47f298cedcfso101829137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 10:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715966822; x=1716571622;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZcxVTcFh7NO1RmeggMzvCad9BHQKhjKuD/Oz3pjme8o=;
 b=Vi5TTRYPdDcDbEpTz3HufKCCjcL9f9ywv1PvuQy5xnXDEemvLozmW8Ls/zI8X6B6nt
 bSnGExaA7LDG9FnokD3k6q0ItVhAlSqD+Y1FCrczj4ZV6bBrYJocYPXc/eWLbDgxcRY9
 0IDtTY6qcKDo5X3FS+rFHKhoTbBE77bV2fSFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715966822; x=1716571622;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZcxVTcFh7NO1RmeggMzvCad9BHQKhjKuD/Oz3pjme8o=;
 b=A1f4XCI2sJJW9cf8QNUqdKjX/yDEiRkHSnpxJ3gc6koltQsVqnCRolKL7O4xveZlug
 c96Y6sPjxxiTqQ2yBXFfIbK91Rw1tvVFcSJGrW8O9djIUHGnqtcJhvLgFqgFdjpCoizD
 uTX0F5FB4z9lsKlmmxsrNeXG1LhegdNBDPf+1IAiKIdIzwO0dcuoRtqsu6Cr9gLKn+Ev
 lKt75kgTuVQrLxYN/zZnkS3XQbGPmKODFu0Izeojozn0vdJwapA8IkcAYkFnrj6BOxmV
 r3xTs1QVhlZvJPsGFhbtTuIIqcpqaGmLRoy1PLo07KYtEfuUk4PjNFo/RSvlfkgRcJsw
 GGAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTGpP4eSufZLGCCbJriO5zRDz8zVJsImyooRUvkVNcVmu9ciqjBcUdPGjXjk2B530WIP/bQTAbxKGIFU7wGPUMnBIP33tEXXBrpVuzmc/I
X-Gm-Message-State: AOJu0Yzda34YBNPapok0b5H+vRu/3yxPSQ4s6nRF96jXtvNF2iFGOY2D
 iCx0hWvDAtfqV5HaDhbeKgNQZcJMmOLiFIHLaDLwfVYeEnCV5xqzaCmGQeEOdmtKj3mnUINBmrN
 F8a91Gb3XbsnfS1d4JBpPNwXXRflpFnEyH8iD
X-Google-Smtp-Source: AGHT+IElyxDzLSoeVKTnHsADhpEMO/j0Y0exiEY0s5o2jQhNssuaMk0JL5QwXxOtxjka7wlQqKZ7P260uLD752jOyqw=
X-Received: by 2002:a05:6102:14aa:b0:47f:2c10:24e2 with SMTP id
 ada2fe7eead31-48077e5bfaemr26084771137.28.1715966822410; Fri, 17 May 2024
 10:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240516115721.1.I8d413e641239c059d018d46cc569048b813a5d9b@changeid>
 <9dd1cfd1-fe13-4434-a7cc-e14113dcaf53@amd.com>
 <CADnq5_NGLrrFmFHFX2bC7naByJGofEiYQyWvRP6CO4BDFo52TQ@mail.gmail.com>
In-Reply-To: <CADnq5_NGLrrFmFHFX2bC7naByJGofEiYQyWvRP6CO4BDFo52TQ@mail.gmail.com>
From: Tim Van Patten <timvp@chromium.org>
Date: Fri, 17 May 2024 11:26:51 -0600
Message-ID: <CAMaBtwFQxeARGyhVxo+WsYCHgmJNJ7ThjtPcFv=LZqRNJtVxsw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=1
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 LKML <linux-kernel@vger.kernel.org>, alexander.deucher@amd.com, 
 prathyushi.nangia@amd.com, Tim Van Patten <timvp@google.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Ikshwaku Chauhan <ikshwaku.chauhan@amd.com>, Le Ma <le.ma@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Shaoyun.liu" <Shaoyun.liu@amd.com>, 
 Shiwu Zhang <shiwu.zhang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

> Fair enough, but this is also the only gfx9 APU which defaults to
> noretry=1, all of the rest are dGPUs.  I'd argue it should align with
> the other GFX9 APUs or they should all enable noretry=1.

Do you mean we should remove all IP_VERSION(9, X, X) entries from
amdgpu_gmc_noretry_set(), leaving just >= IP_VERSION(10, 3, 0)?
