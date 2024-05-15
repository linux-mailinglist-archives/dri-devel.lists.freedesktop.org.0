Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6608C6910
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 16:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7648C10EA34;
	Wed, 15 May 2024 14:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DRh7maF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E73D10EA28;
 Wed, 15 May 2024 14:56:49 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1ee954e0aa6so56167075ad.3; 
 Wed, 15 May 2024 07:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715785008; x=1716389808; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NpV1PvoVw8yDbXCaJdRMDpZhAFkan1lht8KhkaNjpEk=;
 b=DRh7maF7AWAxYAr8JZibsYP414UuVtfTZRQru4wEIcIP6mNKJUR5rXaVN/igLOvIiN
 pp7coMFtT9Xi4SpC7G0QAVs4fg4bmPjeiPmi1khkuYmOESPi1VEfMF+r8Ez6R6n/y8bB
 NXdWS+i1yefAA5u+T0F7wgeXCtjqCGdcgEKNLd4/5JjWS+HrI0a3/3oWNJoqbyP6JPba
 9oeqA1OWCTXDOTM3f/75QKyhu4m72BQcXBQY/ed9UNESrtjx0yURrbxjQ0+Cfkoyfkx+
 QAAF/mVAFovgDZqanOVHYiNhITM7cIfrlZruDHTcRLlsFavqgz5KdNi9GVmUTclU4Lrv
 y1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715785008; x=1716389808;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NpV1PvoVw8yDbXCaJdRMDpZhAFkan1lht8KhkaNjpEk=;
 b=uJMWD2hyiq0BXn2mWQSeRpZgYLnkTiZxCMvXOMR28Z79hIX7johaiWnXnL7mNEE75k
 F+W0ObPt/dgAQGDtNDx6WvVUeSI3wioJr7AMMmfjuD7jCU0pk6dt6msW3pMcU6suZXZm
 bWcVwdPYoWmY8b2WI3fyAnkiGFlSZRGnNl0ekHg2YTxtTXgwcueeTI6zbRWlpJH8dG/p
 wrRt85LaV5IoYlnepWLI8QpK4HYwcDJh9KbmhgOAlMnPLgPhIF8aHf037CSXII0+yJyr
 x0LaVscUoZGRcqyzGIlB4XK7FuwxaYnOBTQbGH+BAek9sjys0yGUGtzoifHizu9Fmzbj
 s4pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpW4HT13hiBu+DeOcy9HVe51Bf62OE3/+8nj3uP98zxL4YHCx83jXJe1pGTi9IeqNadka6j7BfwoE/jp35+0glMaPWe9zZFPvC2j0EMbqm
X-Gm-Message-State: AOJu0YymrlZDMFxp+Y0jOtoFuT2SyDC6ht+wAg32UFzWXIkPXbw6oEi+
 Rn6fwXIht70fyYWVH7t0sdog+WNqh+uPxyCAhTjQWpmC4v1rDDWB
X-Google-Smtp-Source: AGHT+IHYtohL2ZlK1fujK/GcREqXwaYJ9JOJjf3IvKigR5atvw35DpjD56Adac8lKPkpc2Xd6EfHcw==
X-Received: by 2002:a17:902:e94d:b0:1e4:a667:550e with SMTP id
 d9443c01a7336-1ef43e284d5mr177801355ad.20.1715785008425; 
 Wed, 15 May 2024 07:56:48 -0700 (PDT)
Received: from joaog-nb ([189.78.25.193]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d38ddsm119426555ad.47.2024.05.15.07.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 07:56:48 -0700 (PDT)
Date: Wed, 15 May 2024 11:56:42 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: Re: [PATCH] drm/etnaviv: don't disable TS on MMUv2 core when moving
 the linear window
Message-ID: <20240515145642.t2747f7s2t357hzt@joaog-nb>
References: <20240515121358.2027178-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240515121358.2027178-1-l.stach@pengutronix.de>
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

Hi Lucas,

On Wed, May 15, 2024 at 02:13:58PM +0200, Lucas Stach wrote:
> On MMUv2 cores the linear window is only relevant when starting the FE,
> before the MMU has been activated. Once the MMU is active, all accesses
> are translated with no way to bypass the MMU via the linear window. Thus
> TS ignoring the linear window offset is not an issue on cores with MMUv2
> present and there is no need to disable TS when we need to move the
> linear window.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Tested-by: Joao Paulo Goncalves <joao.goncalves@toradex.com>

Thanks for the patch!

What do you think in backporting the patch to stable and adding a "Fixes:" tag?

Regards,
João Paulo
