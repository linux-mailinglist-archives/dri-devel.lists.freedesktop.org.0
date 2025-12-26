Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E03CDEAF5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 13:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC665113831;
	Fri, 26 Dec 2025 12:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="P/DEmCrD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91901113831
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 12:19:39 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-477b8a667bcso98818075e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 04:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766751578; x=1767356378;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+g8DS1brekFilhKPqU24+jmoPGWM9uP1uONclvMxcpM=;
 b=P/DEmCrDCk5Wv3TFBHHqYtVF31BcjnrsXTmCwJrMVoc8R/cLx7iRwdueD+stpq9pm6
 pNcntGE5YcmyUU/6ERs0IEj0nUbwnNY10FNDPcR8B+UncnmETf8fu3MRmcC/drB8Vcqs
 ym8AKHUlHtDc+dpjS3AUqA75kgj2A0fvSnePdUZAKPNFJEqk+O1yVMxYY6pAX91bIfet
 6KjgbxpU39JnJBc2ZfHGdaoTfxwn8qEFQe94EBtUtS0p9msj9TLCWU5wxdo1wu0xD4Xn
 xdW62f/K0CA5YsCy4XMVg295/JVgMV0NLVuTBFAgvVTVAgqa37Cz4fsmTuI9hVQXD3yl
 r1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766751578; x=1767356378;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+g8DS1brekFilhKPqU24+jmoPGWM9uP1uONclvMxcpM=;
 b=EOUe3Y7tJ1M2k42mPzHJR5uD4QorkfJQbJg5Erq71biEQxa/fJgjCj6xezOZk+aK75
 GcMySp8cXl/yw7MPkovp9d8H2v0j+vVa11+f0kKnB0o9+ErzQzMEe/man0aeyMYt+WOC
 pUNb3Qfcq2fA4PYlCCXL136o2NG2MihDMhe+LhBqpKbzhsoBoucnBBdnytan3JYXFPDW
 4IpgH4s/s05XSuvKpICg+rGdH1agVzkGmXm0ljeNIq6tgvJCBT7fTPFh8xR5hUVXHuYc
 C0FTVUAmJqmpPgtJWA2R1B4d5uUXLTlJheuMmOBFgGyBPOTYw2Gxi34HzyDbat7klC69
 8N+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGv2dgtxLQjwRjzsLjSZOw5B340asjQmQZS9cBKzaYybtBekY/E3wrRKnF3uOHPm6/o4cMjBdx0W8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI/EdPtkS26IVkRX0b9St7VotKpiFmWnxOlAbSBY+szSJ6jUXz
 a7Ir1XuN4eV2sAzZrhK8tEpvU+LKVtSTHvL4GsRNLAwAPyF6Xaw0aWwWysKPiry2iDBOGpSZmUa
 Oo4Tr+xec1Q+13ZFESA==
X-Google-Smtp-Source: AGHT+IFiggyRrqbfO1UeaiphOJQUgu/7SgrR6uhdhGWRLerzvldj49nIHMXvnyLCABaCe1ZzEZ7d+vvSof7EsZA=
X-Received: from wmoo20.prod.google.com ([2002:a05:600d:114:b0:47a:9f70:c329])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524f:b0:477:b642:9dc1 with SMTP id
 5b1f17b1804b1-47d19594b2emr227167795e9.20.1766751578096; 
 Fri, 26 Dec 2025 04:19:38 -0800 (PST)
Date: Fri, 26 Dec 2025 12:19:37 +0000
In-Reply-To: <20251223120436.33233-1-dakr@kernel.org>
Mime-Version: 1.0
References: <20251223120436.33233-1-dakr@kernel.org>
Message-ID: <aU59WdNfBXyeS385@google.com>
Subject: Re: [PATCH] MAINTAINERS: exclude the tyr driver from DRM MISC
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
 carsten.haitzler@foss.arm.com, beata.michalska@arm.com, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Dec 23, 2025 at 01:04:34PM +0100, Danilo Krummrich wrote:
> The ARM MALI TYR DRM DRIVER is already maintained through the drm-rust
> tree, hence exclude it from drm-misc.
> 
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-fixes. Thanks!

