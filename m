Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E77A2A426
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 10:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6958C10E11C;
	Thu,  6 Feb 2025 09:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q1nyIGzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCFA10E11C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 09:24:55 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e58a7e02514so587989276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 01:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738833894; x=1739438694; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R0Aj8VkeJ1ljtNruUSkipfngsktgaMJyC1xm5s9bvks=;
 b=Q1nyIGzVEusz2GAqOeibISopP1OWFezCW9rFZfLWmk/StJKIkAtlz9iMRQoyumpKmn
 Rkn4/6zZ0BeX41WBd/Sa3Tk5AkXlIDDf6qD2J6ooQSJ5VA6n9HpATYsCPEp2La+lRWcI
 Py9xBgynjANHgxbxO9MRoI9mKrGEH0Pa5BfIk4NMIrnTSdQPRLO6bwXjaoprX/LCduKg
 UcxvNN/pMOVbhNQ+1kJDdc6wqpdjnH77ANCPnwjlAFIKG/E79DIOKGB5SlmS2aNprZY3
 7je14baoCcD2LG38MqVWKpG1Zj631c0st/xby3BuXYlhoTjvwxwKiyANiiSvgrSLIm+1
 h5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738833894; x=1739438694;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R0Aj8VkeJ1ljtNruUSkipfngsktgaMJyC1xm5s9bvks=;
 b=BvROZe5y/t7gTavkPXhNnE8MWjdlzc45slnmzDXt9zrLbg9dyoJuoBec+vm/bQXrrp
 OvDTC1G2yoN0BaJ0Kiz6BKKRyXbDULhaqtXC/HhWOINCxMbxsFKaery6oKUEe/T4vQW/
 RVIM9pjuRBl35mIsx/2lvRZ9dWFYfh08EdPKbFGXVkHex5gl6lm11/ka/fjCEfZ2Xooz
 GhL4/oMAZNrBC+m1lMCkeDr13QN12IBmwyc5k2BNN+6vqkcBcY/dL7OKOidqcpANZ0BF
 MF+JCJkwInq+bsGNgdgm3vg7qsAMq3SQaFq4R63V/gzGvZAhdNHSsVWw0fuFAFykXU23
 4nog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXeFTYhiJg08HEQZJkh5pdCt/cCLy42SKYpBIdbABdRkzNfTwXPvRo64p2UH1yxZUktDSiQfWJ4YU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKdRRvW8n6c5y9crBWC+FNWdMJVeNLk1ykFPX2UIhkMPuru/RT
 yrVcGZSe6NQHVAxXfE1S2b2JeNzmBJCJFhTAcsfLXUfnxalrPQb4/ac0N3D5vZScIQbH72fgEsZ
 w9n5b0uef42OrtaKETgF2Q2SwhQI=
X-Gm-Gg: ASbGncv/un5ijqcBed2drQdbxKPRT+b16ssCowdt8GT+UcGf6duSnTJDYeY7DqjLWf/
 ZDTnVgsBvL9U9/YLeEUudBnfyrmD8Eti9A5NcG/le1p3sFymPXPJ8T9xKAO7F5QLJyCvn6xAIoA
 ==
X-Google-Smtp-Source: AGHT+IFbC6DM3fJVG17MrSGBXdIfeROMfW7VK5TSEM0p/SsdBlf6NEx0KbnND2bApOZ90AM+CmqzpnxiCUvcGg1/hdc=
X-Received: by 2002:a05:6902:2843:b0:e5a:e604:78df with SMTP id
 3f1490d57ef6-e5b25b95544mr4817982276.17.1738833894216; Thu, 06 Feb 2025
 01:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
 <20250206-caped-premium-squid-595ecd@houat>
In-Reply-To: <20250206-caped-premium-squid-595ecd@houat>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 6 Feb 2025 10:24:43 +0100
X-Gm-Features: AWEUYZn9JAn4vxk91DxbpJulbYrsp1RnWuViBY7aesXFIweT5vWahzqXS6ccsNo
Message-ID: <CAMT+MTQBSuWCz0T13RkhyJLwV7tuk4_BmVH6vACFOYx=msc09Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display
 driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
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

On Thu, 6 Feb 2025 at 10:17, Maxime Ripard <mripard@kernel.org> wrote:
> Sorry to figure it out that late, but how do you plan on maintaining it?
> Where will the patches go through, and who will you send PR to?

Downstream development is done via the https://github.com/AsahiLinux/linux/
repo, then send patches to ml. Not sure if i want to send PR personally,
it will probably go via one of the drm trees or via asahi-soc.
