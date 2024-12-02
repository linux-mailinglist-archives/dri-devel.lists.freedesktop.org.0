Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A1A9DFF51
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717FC10E6C2;
	Mon,  2 Dec 2024 10:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XXYhxROE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4FE10E6C2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 10:50:31 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e3983fe3aadso2648364276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 02:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733136630; x=1733741430;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YoO40zl/s7ZnqzqIb0x9bS2VWKzdum6rohqZrbmtpKY=;
 b=XXYhxROE2/y/L/fbV6HbqxqR5yEBTLIzWf9nG3ObYjP3nPCVrEJIpg37MD9rx5QtGz
 yh8zWK2DtA4aDrQxHgUZceDAB96E1vFjQLSry21FeUFOHj5e1yc9bx4G+Ra0+6Lry8L+
 eVJN0Z5IIW5nZYikt7YNw17N6UIzT9Y3PU8Wcxg11IgspzTzIWlEGnDB7AH+gDOnlpUX
 Fb8cJ0VwNY6EaXooaa9SgGdMmSn3RClqWc+dr4Ue9i57Oq2nVL1QcvPCdWnKFtLIzCBm
 6wCKiA1ycoI5fULakQd393NHchC9M+gmpgyx6jjXPe0LcinrSVzE0l/pAPERfv1gxqiu
 AHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733136630; x=1733741430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YoO40zl/s7ZnqzqIb0x9bS2VWKzdum6rohqZrbmtpKY=;
 b=Bc2UVr6mRmkfHHu/Do17uBIl/aXSPuqttkgbx4LPY9rnNofwW5IXvSva17pihpfs+r
 83gKoXa80/UQPzO2X6hvkAaWQl4LzUgS+Ln1L31CpMiqg+NNXEKnQiKELSxrQjjFLSKA
 7YHUPOznSlbnhdZWmjz5N2oaeTPkX83As918RTbiY3NFG9Tt+iVd43zMfSoz6FeigMQt
 NlVc3HjN606TvSLOq74GO6CFJ2sFm+xfQ+SXj+Dzlaa2vSEEbW9gyrE8PRBN41aL+ZVB
 EYMjV/OyDBJtL7jnPIEz4Hvc9OCpEdjFcqbxA81plQ/Owp8GTCld3CEUfEQUkvCYB73Z
 GGqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg/GYWWUTduqfIW//IedjEXjcG+C47Ym11m4A1HWfpKXERLfmEfnetns2Vwy9Z2bb3e08QVsr9NZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFM9//S15re7ssNjgN9KVfhxwJi3uPZexcX2EWWKcxsN0JVcW/
 grG4MwCHOEtuT23YcpkggMVeLDi5IzAWDSK61ct9+e+qRsX4rJAiwOmVdUrRrV3yczDnOAavH+N
 pU+vm3WNM8YUXcJ7FC+Gl47Mxljz++5Rsu6xYSg==
X-Gm-Gg: ASbGnctKWoqzA9Krz06pIC3OLvqK7RpIWoL0gx1rGk1e3l+BxvDuIJm/kJww6nJnM69
 n/jaohXn+iu+M+bQlWvMiz7qo8vFtNHtK
X-Google-Smtp-Source: AGHT+IExerCQ7sAUwgoXkBOkYbDVHSC68g+nFnlF4d2JadWUyhW3V21jeoCT4WtL5P/vbC1ORnld9fcul7IdcQprIzo=
X-Received: by 2002:a05:6902:c13:b0:e33:67d8:654e with SMTP id
 3f1490d57ef6-e395b9548f7mr22613536276.49.1733136630377; Mon, 02 Dec 2024
 02:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 2 Dec 2024 11:50:19 +0100
Message-ID: <CAFGrd9qe5Q60zBEXyCokcLtFQVk+qa9yajO4_gHZR381i9cVOA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Initialize pointer in
 mtk_drm_of_ddp_path_build_one()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, sui.jingfeng@linux.dev, 
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 dan.carpenter@linaro.org
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

On Tue, Nov 12, 2024 at 11:50=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The struct device_node *next pointer is not initialized, and it is
> used in an error path in which it may have never been modified by
> function mtk_drm_of_get_ddp_ep_cid().
>
> Since the error path is relying on that pointer being NULL for the
> OVL Adaptor and/or invalid component check and since said pointer
> is being used in prints for %pOF, in the case that it points to a
> bogus address, the print may cause a KP.
>
> To resolve that, initialize the *next pointer to NULL before usage.
>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
