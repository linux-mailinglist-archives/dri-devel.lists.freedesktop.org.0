Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C3C14578
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 12:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A0210E0D5;
	Tue, 28 Oct 2025 11:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vrC+uwUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF3710E0D5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 11:26:09 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-4298da9fc21so1804379f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 04:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761650767; x=1762255567;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=1gp61VUQ5GKZJ4rPcQiEWjfVo83pc6GczcZCQWQ3ucA=;
 b=vrC+uwUQ6TAl26lVxlfGiT5UzD7ReIWP757JglHoFugBTH8DjrorAOVYB2xEsDBm5C
 Ve4+CEUMdE/gWkDN+Uo9OtKaFpMoSNmxGP53EkdEB8dArkheQ7yvrYpVI5RJl1Nuh+NT
 4GssK6Aka5ilS1i9q9XflEb75rqoXSBYXH8GxR2WTZzNPf6IfnmnAqr8iSedqT+H9plP
 2PKDsDPoh03tXxTlZPV3T0LIeL58idB0HnVOxsKmqP8ZOMHZ1K/JHt0CWSHGzOkyEHvI
 PnHQnTMEArVL3gO/CpJJiQFwDCVF2XjAdzAh6HUYeWa4O2cHYitxcc3A7ZnIYDIQrXQg
 y3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761650767; x=1762255567;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1gp61VUQ5GKZJ4rPcQiEWjfVo83pc6GczcZCQWQ3ucA=;
 b=lBb8odV5mSHWP3K/CnLWF3KVLjj4URmZ0539Hs4IPRvaUzOqAyhMN8aFDnp47J3Pn+
 6SuBwFX0aE8i/nlxT1zo5Dd8+3ml9tcs87X/hFT4eLlia2guXBGX5JH8+v19o0OmQ0P9
 Kt7jwGNVG6JqwRPiHoZ/Ekn4koJIAPXiTUeZOfbAgx3yDRJEJQXuhU1p1jeQgAlQK7a6
 RyV0kgNk8p84cinmbQaOYwbSTG/EzWzBCnmiEFa9tl7HMZfqmToAVQ77HeZhTF2GLN5u
 mcQNipnLunaXKb3/jgow1TqtIKdN3Gd5Hl0sdh2GtpfDo1yGEVpYfS6Z2kDGyEQ6xnPL
 rFuw==
X-Gm-Message-State: AOJu0YyOSdYvO02zy57giVPo1ynXAt0zUBODguXtoUqUWafpX6BSqNIA
 04y4TMh153kau+flSiCU/XQYz/qQyx0rgCulG2PPoFg/jQ2Ur8BW+98+P7RM7SEZLR6cy4ypaPu
 wtElvpqRPUo12+nT5QA==
X-Google-Smtp-Source: AGHT+IGCjLcER1nUmaNB8byqj93U1927D6rJQzvZKoDx1wLR/EqOPj6MzP8Te5ivJKOxZOUP2tIzFY+jEWEGTmw=
X-Received: from wmgg16.prod.google.com ([2002:a05:600d:10:b0:475:de83:8f42])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a89:b0:427:72d1:e398 with SMTP id
 ffacd0b85a97d-429a7e9e27cmr2796635f8f.62.1761650767471; 
 Tue, 28 Oct 2025 04:26:07 -0700 (PDT)
Date: Tue, 28 Oct 2025 11:26:06 +0000
In-Reply-To: <20251028104433.334886-1-dakr@kernel.org>
Mime-Version: 1.0
References: <20251028104433.334886-1-dakr@kernel.org>
Message-ID: <aQCoTpzBOp4tvKTx@google.com>
Subject: Re: [PATCH] MAINTAINERS: add Tyr to DRM DRIVERS AND COMMON
 INFRASTRUCTURE [RUST]
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
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

On Tue, Oct 28, 2025 at 11:44:27AM +0100, Danilo Krummrich wrote:
> Commit cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali
> GPUs") introduced the Tyr driver for ARM Mali GPUs, which is maintained
> through the drm-rust tree, hence add it to the corresponding entry in
> MAINTAINERS.
> 
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>

