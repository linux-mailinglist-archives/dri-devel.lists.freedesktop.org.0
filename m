Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA11C91719
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B92F10E1B0;
	Fri, 28 Nov 2025 09:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4HO99erj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D422810E1B0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:29:46 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-477b8a667bcso16011585e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 01:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764322185; x=1764926985;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kz4odsY9az8NKfblDAsTmnF718nRgG5QxRoVjCQoF0Q=;
 b=4HO99erjNJ+GmnLVSEdrNYFh/8/Unesd005QaB3iq75NiIEFPcPyVWweze2ynwJ0zj
 tIBVoHHOXGrAQrtMGse2dnGkORm8a9JW1r0tT32pxXUIzuRQ1y4VPr5nGiaO0AXKNNKg
 ctX/xJucummM2pImiRm8ujjfnTsXq8Lmp3AaWV13hCxAm/rJMjW+nBa8KUwKza/u/Ujz
 fSsP3lDLIVkic05E8ElPhEKa/0+HCk23cEcL9rVobxS5u/i7gFTWq85qZ3C1TfhnxUa3
 ndXf3sp3mKBdVBUNNPuqzur6daAE+kM9mbSM+xnPkBCwetC7iiUcYGQuUZy21KE/FQEw
 xbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764322185; x=1764926985;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kz4odsY9az8NKfblDAsTmnF718nRgG5QxRoVjCQoF0Q=;
 b=UJgS7jBNx6DtBP13Ek9bksMUDZISAYjoZ6Axo5WqwIIY8/8aozE4tQrwkESoe1JSTB
 yyzb3pQTIenhpqSI45UFTw5ZejT1R8WKW5CRNsCyr6Sb7vJTQKx7R4qjOu5PRJUlCgh3
 cVtS3UpfQf3KjVkEJZHmYvPL1rvmaBCpXH22AuLwoHpo+IfWgks+ZfQo+CbT32iunfsD
 U4d1GfCqCl1pqIXqoJ9PPpEixw1hUz5r3qScAApWevNnvreepXv2UW3u19imXVl90T2f
 YqoWHwMwmkbDEcfV0si22ak46qwFZRstJzq5JIatKHQ8Ndf/ggTpByF+aMLRs0MbDyKE
 MPPA==
X-Gm-Message-State: AOJu0YxgFC+awn2uvldon5MxCkDbtpJ+Wbh/hUDH8O7FZFnj7aymx+ex
 rT+9DzEKqlcvT9cwNBWDpC061SW6mmMp/UG/6eg7h9VpfFtYHkXzy/jqHHIVWF8Ru1iHKG9NHp9
 gwo/mVJ6/v214KXnkBw==
X-Google-Smtp-Source: AGHT+IEGr+RPs42E0FQu4piPGms3EvqaIxP+0rfbrSCad6KhByZX+KpeKxsk4YrEGc87+/LJciZbG4DOXLS5/dA=
X-Received: from wmfv21.prod.google.com ([2002:a05:600c:15d5:b0:477:93dd:bbb1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19ce:b0:477:79c7:8994 with SMTP id
 5b1f17b1804b1-47904b25e63mr144378965e9.30.1764322185489; 
 Fri, 28 Nov 2025 01:29:45 -0800 (PST)
Date: Fri, 28 Nov 2025 09:29:44 +0000
In-Reply-To: <20251127211843.46258-1-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20251127211843.46258-1-deborah.brouwer@collabora.com>
Message-ID: <aSlriGna43AyfdBX@google.com>
Subject: Re: [PATCH] rust: drm: tyr: use generated bindings for GpuInfo
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com
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

On Thu, Nov 27, 2025 at 01:18:43PM -0800, Deborah Brouwer wrote:
> Currently Tyr's struct GpuInfo is manually copied and updated from
> include/uapi/drm/panthor_drm.h. But an auto generated struct is available,
> so use that instead to avoid copy/paste errors and to stay up-to-date with
> the panthor uapi.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
