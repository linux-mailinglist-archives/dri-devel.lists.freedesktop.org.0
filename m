Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DBB9142A9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 08:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C2510E34F;
	Mon, 24 Jun 2024 06:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fSH/BxsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5971410E248
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 06:22:06 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-57d1d45ba34so4098113a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 23:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719210124; x=1719814924; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=izV8xtFw87LJRHc0H3NGdhgh/pXNsAOWlHQntv9q9Z4=;
 b=fSH/BxsQRvQhPLbWLRPiKGpupzSVOeOay9oKnOSbjI9fQT5ZTFtT/AjHyoVltWXt8X
 G6P0sAK6xT46+5XaSaKR6yefEXOWRRq/y2Wqh+gzGhOF5LQGtvW2QRdar3HFkBSGCRVT
 R3W/i1GDgxRrPs12ZLBpXqE1+TWkaGd4CLi+/k9/crTQtedmzQfKodsmpzPhenYGS+QI
 m9hUz2XIO7jIEU2Bj0K7PNHKu52ZpDOnilNDzAA/WJ5DhFkD2YOPPrR8WnyjUPLywitr
 M5PsGSG1fIjK36iRl164KeLeEuaFNv5cw6abf6+PkqyHHLUi4TF+C0HGbdulHVwKwbfF
 CFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719210124; x=1719814924;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=izV8xtFw87LJRHc0H3NGdhgh/pXNsAOWlHQntv9q9Z4=;
 b=s9cPQ4xSKWwhB7ZpFK1Qx2l8KLG+C3ng0y5Di9R09Kzdpb3Gci97Swerwa7DYUUgxX
 Oh+onyOngLQyshlsPygHAwY4vSQJirsaeUUXmgfMM1DVVnFAWcFNJ3jR9STqu8DdBcU2
 NAT+Ktp7V1F8Q7eJBursdV5UuO8hv5jzJmicJitgwncQ8M34qvhrKCntSaLWcsf1hBk4
 1jHO5W8YPkmFsiURZNFk6bN2G/GNeDtcozFL8O/5aNCue3G/Xo7DdJ7csILhSMr7+tWj
 FfA6ItOP3g1LXHm4/lFGBhu3UoilxERcJkaq458U8rSsinJ6eyl9RxhGVDEVDeubCzbF
 pAlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7xIVfDZss8RipzUv0q91EhLeEWXAG+SHVVBvG6PgybD8TIRUdGWgpgKQUKZkeV4qXNxBbaJyBATkGVDsICae8ZR5sQJm62ZWL+B1ZSOT7
X-Gm-Message-State: AOJu0YxOuc4UDQx71z10V++5tXfjaOZXEunj3kB4cAAUFrB6tYAbtiPx
 SHCKEIz5Hn7rsJa28K9DB9805/HOPbreCJn+7msTkr/apYAhrLYrMyq6pIjs4D0uXpE2DtCTkGJ
 gDmqCKUdVcNVr6/xXXO/FKQffOF4=
X-Google-Smtp-Source: AGHT+IF4p3kQuq5bMoS6IT8dI6Brsx4Molp0hz/DWisb09x1f9QYxKJIHq/2rFVb9+bLYmidFi0EDdziT1pi0FXCcqc=
X-Received: by 2002:a17:906:f851:b0:a6f:5091:467b with SMTP id
 a640c23a62f3a-a7245cf27e8mr209723366b.39.1719210124278; Sun, 23 Jun 2024
 23:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240603-md-agp-v1-1-9a1582114ced@quicinc.com>
 <650386f8-16c4-4988-b05c-1e4fc1c9167a@quicinc.com>
In-Reply-To: <650386f8-16c4-4988-b05c-1e4fc1c9167a@quicinc.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 24 Jun 2024 16:21:52 +1000
Message-ID: <CAPM=9tyKZKPo-bkhGFvwNTOaojV033j0S-5ex5FPmY766x4ocA@mail.gmail.com>
Subject: Re: [PATCH] agp: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: David Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
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

>
> Following up to see if anything else is needed from me.
> Hoping to see this in linux-next :)

I just pushed this into drm-next.

Thanks,
Dave.
