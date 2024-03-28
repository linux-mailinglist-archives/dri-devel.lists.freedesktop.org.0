Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF6B8908CC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 19:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5285211244C;
	Thu, 28 Mar 2024 18:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N0E24+u2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5FA11244C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 18:59:37 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-56c583f5381so984969a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 11:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711652376; x=1712257176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SV03oY6mA1k7yFAqo606Edki3tImpf784xBEQW1rWUc=;
 b=N0E24+u2U+AC/sJnzBT8+i69H+wooKcSdvOqffSpQZCqsc8Yy5dOlW6n97QO/+APtz
 sCimyINCW7iYB9fVIhtSGfroswaUPwBxab98LcCK/ULBo51u9Qr/XtSI6rjGwIritGSS
 GLLyUNIFsnLcRw96HlYnNkVmhTNtChgQ5pntNoLvEV7TCFEOHiG6kBSEmG1BCwpJY6JK
 5Aa20LwH5Q7brjJYXgyRkg/HbUcJkw2ffXevAGsdpUUkRsyhBajYSP3DHK2f51pCtmA8
 qM4bb2RpEUw2v11cXIHTSySqv1/twgmVxx3naSmbAekm8siR0DRFmw+Q0o9vKIWSmN1x
 BFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711652376; x=1712257176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SV03oY6mA1k7yFAqo606Edki3tImpf784xBEQW1rWUc=;
 b=lU+GZREVEqxLE3Fim6sAx79hpuDbadZPJk9eQnU1g3+qG8T57lXpggE9kpuSki5Fn2
 loov5eYGhZqA8ZU1QVE/FJiclcKACOQ85HPi0+xcp4jmzGv+uJtx2sXZ18M0Q1NdxbH1
 8SxQrPDPmWU8oXBpiBug393GMqcfX3vrEKpduijudCnN1lehAS9hFBnI5hUkPZ3dF5Zx
 I4gNQmrJ7Zo4MkMyLmYVVHH1v2A754x0oeVz9c+qxBnatRmZdRrXJcBEKBVJWLVKGjlp
 edRZKLf27FEMl8kJ1VFSCpjXjcTjG+FS/0s08AlhsVD2nG3LXpynSpSnzpbNHaUWWIOc
 6swg==
X-Gm-Message-State: AOJu0Yw/ObWPR8deArg45LXGOkbxvpuF/EokVm90Qr3P/Y6Vq9xSN/W/
 1DjPPst6Xp+1YFSK/1eduXyBXRt47iL6TpWEdgun968CNtJpKEb53wPYauYGn+Ta4XCoTwvZdWK
 KA+uw2400W/5uXKoAmDGNkzKYHSI=
X-Google-Smtp-Source: AGHT+IHH6kALHqnYmeUzkijmT2flDCiOXUQodFJ0YRAefUwzLtPQNiMfdrwYHt0+Y04OzFPVBmxtNxsdJW80RtmOanA=
X-Received: by 2002:a05:6402:5107:b0:56b:d013:a67e with SMTP id
 m7-20020a056402510700b0056bd013a67emr243546edd.18.1711652375798; Thu, 28 Mar
 2024 11:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240322214801.319975-1-robdclark@gmail.com>
 <1Wwj_q3RYer6np0Orz0wJd9dlF82iBSX-PIVSlhCgJbpfVBMHF_CF04gHojkvqnvz9NXH6kACZGXQG9yXwtkbjIzLmdi-GNDkO5Nz2E-J9Y=@emersion.fr>
 <CAF6AEGvUsP7fjqFH9Co1vE0ZGRmMXmFBCrNc3hCQwxky3mME3A@mail.gmail.com>
 <y5mjLoUp9fKwSNrAEOQJtfqfDZ5cYtsf_KcbNCWQieZE-uJXQJE6bQhC6oLfS6aBZRimZSarDjUmeakjwYZmtQZWPM_3lAENdY17K-VyGsc=@emersion.fr>
In-Reply-To: <y5mjLoUp9fKwSNrAEOQJtfqfDZ5cYtsf_KcbNCWQieZE-uJXQJE6bQhC6oLfS6aBZRimZSarDjUmeakjwYZmtQZWPM_3lAENdY17K-VyGsc=@emersion.fr>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 28 Mar 2024 11:59:24 -0700
Message-ID: <CAF6AEGtCcrjBG=EMgc0NrsR75qd8jJL=-kFYoVBur+L3PY64Dw@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Unbreak virtgpu dma-buf export
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Dominik Behr <dbehr@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
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

On Thu, Mar 28, 2024 at 11:54=E2=80=AFAM Simon Ser <contact@emersion.fr> wr=
ote:
>
> On Thursday, March 28th, 2024 at 19:47, Rob Clark <robdclark@gmail.com> w=
rote:
>
> > any chance I could talk you into pushing to drm-misc-fixes?
>
> Oh sorry, I thought you had access=E2=80=A6 Pushed with a minor edit to r=
emove
> unnecessary parentheses to make checkpatch happy!

Thanks!

BR,
-R
