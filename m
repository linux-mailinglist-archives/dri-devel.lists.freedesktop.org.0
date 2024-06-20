Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BB0911313
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 22:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B826F10E5E4;
	Thu, 20 Jun 2024 20:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PLwe8E1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C170B10E5E4;
 Thu, 20 Jun 2024 20:23:09 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52c82101407so2102600e87.3; 
 Thu, 20 Jun 2024 13:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718914988; x=1719519788; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=buQG3hA8H+059YuPFLgH0tUJpQ/ZzbYiX070xYIXO0A=;
 b=PLwe8E1IKslo79Czzist0ax68fr5JL8IHnS5LoDYy9xPuUXUdmgXIo3sK/tsiRKp1/
 VHFh29zq7kswcix+IAdyV0B6bmV7TtnDPAOp1BZoNjZkVTQGhJIx4Yv2/4Y/vjSRkX1/
 vkJChBqipPfFtNslBY8P2eN/62BlG2NWStLbuAUPCX9P2D5lujhZVpcX+et3SdUuUwaa
 VvkBJECsANswJ7AYLBqHt7bkbuh3B/1WGd8Qc9e1+pDojZK0qp9xYAuwm1YGpRjYZNv5
 08KGaEuswEyjaAVcgei9hpF95AVujSr1GYEf+/xBA3xIFO+PHnET1h7bIP3xeWXkYtHE
 QH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718914988; x=1719519788;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=buQG3hA8H+059YuPFLgH0tUJpQ/ZzbYiX070xYIXO0A=;
 b=D14OqTHBHP8FWpfbsC5eIYQFUWW/Wz6TsaOZFu//psjC/59GUGwiqPi+M2g7mP7xt/
 Ji9A74bwxowibLK1Vflkjc7byDywhjRnqcGn0rv+sJr0iNSqNqPu7JOvPRB3f6+jONLe
 siz5HapRJGw7fAb3PQ6OPTCe1RxjnwL1J2k5SdmkWYLn72eKa/WdWu7mXI9i80O50Vhx
 B3lDr7yMkpyJRkIV5i860TITi22npatmA8i1v47RrRT0KlPn77z8gTTttoQIIRSfCPJO
 /D0mtneMiIDH3C+teWr9Q0EpBLswO0GF6xOdt/2JxmmSqC4i/lmmWnhhfwg/YdGzXDz9
 LZlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzka3LAuHEJ7UPfmiBF3Na2zk76342gNe/xyh4Ygt6x9nZ4f/yHwScO3VgD9/fxlS5y8qcVjqkX/swTC3Zv+X0mGObOvpP9ZDUU7aVCCiXWY1iQKYl7/dnbz928gAz/GNbFTGdIATfqw+9KTz58Q==
X-Gm-Message-State: AOJu0YwydyQz1HAmXy3CKvh/zb2/KbJMz1OWEqUJWzlujX0uWY0+REHM
 pwzZ8m6jxkZ8hlEcJONxLhVjivfFmL8FroplcvqdyEJxTnIGUeKfQx5dI/kLapnsa7llt4dSdqH
 d2jXbxHE0TFitH+LT5XV5hgK6Sr3L2Q==
X-Google-Smtp-Source: AGHT+IFXwVlI3EsVogn6ni914pK5hMdWkVREDnd4EoVjE5Nt2vZNmLYWOmKYYD+QWjXFaAp1hWgSg5Qq67Rtp8onQho=
X-Received: by 2002:ac2:4308:0:b0:52c:c97:b591 with SMTP id
 2adb3069b0e04-52ccaa3695dmr4557854e87.32.1718914987566; Thu, 20 Jun 2024
 13:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
 <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
 <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
In-Reply-To: <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Thu, 20 Jun 2024 22:22:55 +0200
Message-ID: <CAFZQkGy0xuuUw73HQvS8Ce92sUi2rVrRnX25pi1KdNmyQbtBZA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <Harry.Wentland@amd.com>, 
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@google.com>
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

Am Mi., 19. Juni 2024 um 06:08 Uhr schrieb Mario Limonciello
<mario.limonciello@amd.com>
> Thanks!  I don't have permissions, so can you (or someone else) please
> apply to drm-misc-next for me?
>
> After it's merged I'll rebase and work on the feedback for the new IGT
> tests.

Merging can only happen once a real world userspace application has
implemented support for it. I'll try to do that sometime next week in
KWin
