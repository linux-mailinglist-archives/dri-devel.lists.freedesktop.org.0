Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A177390BB6C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 21:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD36D10E4D6;
	Mon, 17 Jun 2024 19:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Hi1GL99B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD1910E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 19:53:39 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ec2f4966a2so12650651fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718654016; x=1719258816; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E5Nxfq/zAbxRxbUk7iMcNvntq7z05IDt6TFx9eRzfjY=;
 b=Hi1GL99B1xtYHeMBtW/IiBUj+up1kGyEdAqoiqyJRe5iHRoBjS7lQtftRgXu3IVaEQ
 ObrA42vL9whx8i6MH2MvqEQDv3+8KvBkKdmWH68snp6QIhHGxD38NiOMyUVfhWXJte9e
 H6HOv/2zoT8XNGH/DW1PYA8/5gKQD21kClUf45qUP0d2PfoHfS4R8TGKqEQxLmwZG4sM
 KlwivsenwihyaApoG032Ts53COMxijIMZi8KFjfnErNYFh74YkMxTE3A21jUnuSBPkpR
 W9Hw4yxJ3janIBuKgfdhJUeHh/wNuMbTzWnlohzRFPLJYR6Fb/b23RMKsZxQHYC2zpBm
 T/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718654016; x=1719258816;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E5Nxfq/zAbxRxbUk7iMcNvntq7z05IDt6TFx9eRzfjY=;
 b=pTKxFsmH437/AZ1xalqcXfSuG6ooBRr1tWdaxlAgfuma9I53O5uA0pcrxB1xFzFrnr
 71XQLk4MG1tzxwneupksiQiOJP1n/PK7Ida9RfaF5n+pyrqGJXCIj3bGg2nDiav1hDRy
 AUFvjfJ+UTm96dZjdEdgaITm2cJIoBTVzOxgI4YcLjVxP3LFnV2WQfyLTxdbQu8bLJaT
 uulUzxB6Ottl/ldxzJq5YufpRG7cvUVE3bYt23vMCnN+5/Yt64BEVgsB6jucrzpWAjIU
 hNck1Xn2lKiovlaQkVgWouAgRvmn18gUZcpa7EJBItPPPhXZqpRuFBEVeJJ5NLyJd/ab
 4LFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuUsYhIHghTfzLgzFrRrM9RMGrBls0Y+UcF9PC7+zVH6QSyA/1T4+3+1cEoj7hXHqidpvH6uPgAbHUWpgr/H3FIJHGVwql/zJLcoDLg23V
X-Gm-Message-State: AOJu0Yx4cGtrkELapD4ecCGF5QraMF5qvpcQlIAb5fGfmERuy/+aJ7uU
 ZY+KH5CPcdQZs1029IM661N5/t+s9Bi098gCNXrgKzirmtOd+y92qEXPkq8Xpio=
X-Google-Smtp-Source: AGHT+IFXPK2SWDltA5kaKxH7ANy/aaBeo7RR8HT52CtegGm7yboihGecAkFhsH6t0znnSq5xiLllLw==
X-Received: by 2002:a05:6512:a84:b0:52c:c04f:4e30 with SMTP id
 2adb3069b0e04-52cc04f4e53mr2221836e87.40.1718654016550; 
 Mon, 17 Jun 2024 12:53:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282de0fsm1342075e87.67.2024.06.17.12.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 12:53:36 -0700 (PDT)
Date: Mon, 17 Jun 2024 22:53:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH 2/4] drm: bridge: simple-bridge: use dev pointer in probe
Message-ID: <n3olj4gzxntd6av73k4ccm6tetjb5tsiahsnkrwy4une4njx4a@5igvr4lsrpbp>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <20240617-tdp158-v1-2-df98ef7dec6d@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617-tdp158-v1-2-df98ef7dec6d@freebox.fr>
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

On Mon, Jun 17, 2024 at 06:03:00PM GMT, Marc Gonzalez wrote:
> Prepare to factorize probe function.

what and why?

The patch itself LGTM

> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 


-- 
With best wishes
Dmitry
