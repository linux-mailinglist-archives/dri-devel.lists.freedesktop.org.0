Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F7BFE686
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 00:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C863E10E859;
	Wed, 22 Oct 2025 22:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="Il06z+Ve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93B110E85D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 22:25:18 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 757B633F50F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 23:25:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1761171916; bh=xOMage7Kj5f4P5vJeOI/qz+Z1CRKjQ+HmGwdie8uBbo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Il06z+VexLCN5tme/wBC62bpS0KzD53xc09C9XIgaEwmX4cUAvmS66Qtivsn2kKgd
 ydfn+aHVLx4g2g61DO+ceieagWWBq8NP3PgGwcWXOOK/D50cfg0Pjq4VaAU/hAtXBg
 Ka3oUyeObPek6zSoJRu8y11ffGJ0WHEPnjowid7PSEtPAlvJNtcFHOEz3Ep2Iq52tk
 Tof86CW4Ds/x8WlJXXad84iHKeMk7FFIrHwIPorlvdYlhY2ZhneQ+QamVMYe2UJKBq
 /D/hRArwzMqk331pQjxd7fs24QNn1GVnBJPRHrHDcUy4IFK6y2fKvDlREmhvc/jh7J
 r3foLpYf/eIZQ==
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b3f5e0e2bf7so35291566b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:25:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUW8e8jJrWdDrR3+WGIa4mX0dVt/EImCjZxkEQPKj5k6ENEyeY0105929JAaC7fcuAqUUfiUpkE4qE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzepAIWFwTsnQAfFnBQdvNhWziXqq3638uGJcqevDa4HFJsbqsS
 drTPrnmrAt/0kPXWgq4PfmJ0napvqR1ioTMUlkleXDC0FwfCydgeN71irVZL2o9T1nhgYvevFLI
 jFrP5OlUAM1Q9DRZG6ppXTCRwkknW/RI=
X-Google-Smtp-Source: AGHT+IHZKgMJi136OWI0tem+NWbkLTHFWUk5Xj9RVg34I2Ds/B3fz1aItrzvusUCvXWuyOZyR5cH9IHj4116YP+GwAo=
X-Received: by 2002:a17:907:940f:b0:b3c:8940:6239 with SMTP id
 a640c23a62f3a-b64750108aamr2686677466b.52.1761171915973; Wed, 22 Oct 2025
 15:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250718192045.2091650-1-superm1@kernel.org>
 <20250718192045.2091650-2-superm1@kernel.org>
 <CAFZQkGwvu-aLC4j5+=oohT8qcF8y4gBCDfkKYy7V9t8HY9q-Fg@mail.gmail.com>
 <84f5971a-9a0c-4cc3-89a3-1eb1855aa862@kernel.org>
In-Reply-To: <84f5971a-9a0c-4cc3-89a3-1eb1855aa862@kernel.org>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Thu, 23 Oct 2025 00:25:04 +0200
X-Gmail-Original-Message-ID: <CAFZQkGwLWcyS0SqCHoiGsJd5J_u4aBJ0HMV5Bx3NknLdLkr8Uw@mail.gmail.com>
X-Gm-Features: AS18NWB4c8ZR2FPPY2F4sG5ZZjs-f0XIJMZQsXv12nUFKQGBievP4K3UZxeML-k
Message-ID: <CAFZQkGwLWcyS0SqCHoiGsJd5J_u4aBJ0HMV5Bx3NknLdLkr8Uw@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] drm/amd: Re-introduce property to control adaptive
 backlight modulation
To: Mario Limonciello <superm1@kernel.org>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Simon Ser <contact@emersion.fr>, Harry Wentland <Harry.Wentland@amd.com>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Leo Li <sunpeng.li@amd.com>
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

> Is this still on your TODO list?

Oh, sorry, I forgot to respond here.
I updated https://invent.kde.org/plasma/kwin/-/merge_requests/6028 to
use this property. I still need to add a GUI option for it, but as far
as the API is concerned I think this is good.

- Xaver
