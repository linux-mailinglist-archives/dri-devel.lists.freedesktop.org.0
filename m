Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7542EA563B8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE2D10EB20;
	Fri,  7 Mar 2025 09:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ryv72UAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3A810EB20
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 09:26:01 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54943bb8006so1817030e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 01:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741339559; x=1741944359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lQaPnTMrNhYTA3wyfboQpWCi5jJ+nnpfBr+z980m1/4=;
 b=Ryv72UAZMVbV115Pfm6iaOpUGLbAvkfIdJS9mhrjJ0Jk/2xjHLR1XfMjpOspt3/HB6
 UROIZTayM3oA9EerJggrxETNsw1glJ8E2igKZbPysSZYqvSGtfbYQaIXu0MhCnA6iH7P
 8MRMCh6VMclcEiky563SVQlMxcEBzDFRBQ/muiZEiDFqH5F+7RIfz3w9lX/3Gd7sEwNS
 VKugiW39SljF1jbqI9fdQB04G8P6vAogpp3sAPXe5NARInvlQwYpnvRv4UINN+qa4bt1
 Zef6L/Rl/WsEFTyWbToTELTJRK9S3BC5OFpEitNHYdoViD2xG88b7qp0GdkgqiuBMlYa
 G7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741339559; x=1741944359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lQaPnTMrNhYTA3wyfboQpWCi5jJ+nnpfBr+z980m1/4=;
 b=lMfmPhqImaNy3y4FrAUKs/s3QHkcCiiIt2xHMPJ7G4ipksaxQl7RMlbcS6yglCDC3C
 4jvFAe5DP32oJtRY/NU4tVSvgq/ePt/8W3vDoZEi5LRv4W3dM9/Sj8xhwET/99HWIt+n
 XbWq7cX8dAz8XyABwlWDYH2ElOQaMGTeXl/6lKjzAfCMj/dk84y92G3PEONVhBs4Oh8M
 HReMjOPvjyNkL2pUaKmj83LeLwO08X82ZJMjRT4bhBkwfDo6GoKXgexN39dPWxscm8pG
 3hQb3f5BPjgcrm4Cciz0JZb7LspHWki/HwlokLLcz1LJyh1qZ5byfcZBLQuGNetEurrz
 tPSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKW3WUAluySH22UE8ZlPGmi8bkOWzsrROfmYulZdF0+85if+4g3aDQ2py3h0B/hB4dR6C6l8EE7vc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpZMnpPPDJgx7f+ZbvGVSMeyoAgkdMeJEXZVXZa/0LVXsxBW+8
 hyXdDWvltNDZvfRVtgUEpz/G1yT/hRwcIiIIjDOjeMvbYEzaNC1Jroe9I3u6DVUHvhWuEVxpoTI
 OpCXMi1wrEuLYKWZpOLFgzlxBmiG4pK/w7YLC9g==
X-Gm-Gg: ASbGncvjG2iaO4v8xRSFErS7hZNJDI6Y3ikf6w6jUzBdoZwPyPk6BiLByZ6wC6pVH2F
 L+YnBHvIQjNBfTaIhp73qJtAcxgN9m9LQlxx4YuPYGdr6G+ghpANlb7DIID+p0RyMD1eH2MDotF
 idcnh1flntrjlh6i0XDTEXl4rp6w==
X-Google-Smtp-Source: AGHT+IGTMFg4rHCTu6ttxl0Mr+bTUADbHsG+rzinRECLP3rop37VYukVmNbikYkvL3gcLQNvGyPZVOEAOsxdj/JgNGM=
X-Received: by 2002:a05:6512:398a:b0:545:4cb:b25d with SMTP id
 2adb3069b0e04-54990e5d965mr764732e87.13.1741339559573; Fri, 07 Mar 2025
 01:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20250305102540.2815-1-hanchunchao@inspur.com>
In-Reply-To: <20250305102540.2815-1-hanchunchao@inspur.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Mar 2025 10:25:48 +0100
X-Gm-Features: AQ5f1JrjUjFMK8KGTJ2kXkFBNIlWquflwX47xXJyI38Ro8Xernzfe-B_XkKBVe8
Message-ID: <CACRpkdbv0f+JjLoWRYO45BOskFtUh7FYnHEKamapvqvhSdezyg@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: fix inconsistent indenting warning
To: Charles Han <hanchunchao@inspur.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Wed, Mar 5, 2025 at 11:25=E2=80=AFAM Charles Han <hanchunchao@inspur.com=
> wrote:

> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/pl111/pl111_versatile.c:504 pl111_versatile_init() warn: =
inconsistent indenting
>
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Patch applied!

Yours,
Linus Walleij
