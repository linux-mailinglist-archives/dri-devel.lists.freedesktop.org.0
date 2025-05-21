Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB06ABEDA1
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 10:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D093D10E6AE;
	Wed, 21 May 2025 08:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GGHK7Z7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0647210E6AE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 08:14:49 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-328114b262aso45456511fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 01:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747815287; x=1748420087; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=syWRW1QS17gGwTZy100XkgZ2g2OOWPNtA8PCK20BwUo=;
 b=GGHK7Z7vP260iOX0VJTsD4y8kR1qX2VYZZsNRYGVmrWz9DmqlQgU3bC0szlVW/FXrf
 S/g27mz9x+SmhlwYbFOu8w3YsFEisZcAzXLyu1PGV3Ay0RJYtY3hkIJQfSPFaDQ33ac6
 RVShY+/yoNHXaO3AECEMMBsKsOGKkReOCelgTwUxw6HNOvigkZL5H09Z6dsut1b1tVEt
 in4rdZERJACessD8kEW0mQ5GGAK/SPaCRNYywLnRjV4pDBkPOiZjV/AueDqOZUek0qnH
 YDaK4UqluEvO7jx/HLa+7Dtfw4KqlJuuXjzFcvXZ6tu/ktpv67b+1LZDb4k8erqNBtH/
 93YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747815287; x=1748420087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=syWRW1QS17gGwTZy100XkgZ2g2OOWPNtA8PCK20BwUo=;
 b=ZHNgxKSbI/r6xAsq2ilwz/1u18/o8eIA+hWmaj1Pda4BjUiaITtNUj+gvc/AX4fgpH
 LELucx58Kj4szxnMEFMEiTs/vRBQe0L/OAjwTuR+nGPxUQxNFFffXg+x28RJ/8XVv9tP
 tAoXJyczdSkHQZ/5EIpIk/bZZdoYO+SppELGaYVExx+Ho0LMlqkzv+pHLkQ9TmuY42WD
 Vum5Mlw8EkFTygfQHLjcWuJW82LsVaN1CZJgozzc9WAT3ZZn3fNMQ6xLWIpr3lXC8RC1
 iBWVhmPSLLQEZlXVxR8q5IN+E0mQEzjYBgCpbr3NTls2x4sD4BEVEdnzHKrFe+Me45nz
 v7TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcuThOSUsolc8w/qIAbm3XkiTDLYO297EtJOfVyq0UwEtN90LJl54kMfrN21gTVAOUFg6dTmeoZSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/qc3+ZI0uwLVvh2rGBldRRuX3ufBWkuJTy/vBvrN9fK0hJp+r
 ONGDkHZxP6Ba3/RG2bpCRZ8hmHY3fDqUCT6UGP3sTixcQPs0+2JFpiA/HQLpRn4VPyyBytMOuVw
 cG+J0CbxCo66OiJqoqXOu9ulXnUNbLDthh0IIVkhPUw==
X-Gm-Gg: ASbGncs0CYRwg+1rjJTg4gIzXJiOhbh2fDhxUJrdjcJai4WBPELH//F2nOKIZ4vxsOX
 R2xg6hbGEcFO0PxW27XfMGqyPMz6rYmJlQcOVnd7CSZ+0uk6Ce+dUEqzvOLGuZGR+fdDW6aK7+A
 AaBKPAau7ljl3uTHSN4TKeOWwPfB06Zkx1
X-Google-Smtp-Source: AGHT+IHILmbPR8KRF+4SEr3ivnimUHNzW6XL9Ylnq56KWMLjwrQ7rryGxn+GsjFLNI2sRbNKvbZuorXIXsMm9bnTEw8=
X-Received: by 2002:a05:651c:421b:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-328075fafd4mr52489051fa.0.1747815287325; Wed, 21 May 2025
 01:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
 <20250520-drivers-mass-convert-part2-v3-23-f7ae7b723c68@redhat.com>
In-Reply-To: <20250520-drivers-mass-convert-part2-v3-23-f7ae7b723c68@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 10:14:35 +0200
X-Gm-Features: AX0GCFv9zMlrePDsYgVeRnE8XiqwGw7een3n-prsmH7v8cQLhUvcN7vdAxWFTzE
Message-ID: <CACRpkdaY5SqeFW7qfjgHuC4LCGH1gJg1haTgpk4_s+h==81Q2g@mail.gmail.com>
Subject: Re: [PATCH v3 23/30] panel/novatek-nt35510: Use refcounted allocation
 in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, 
 Jagan Teki <jagan@edgeble.ai>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Jianhua Lu <lujianhua000@gmail.com>, 
 Stefan Mavrodiev <stefan@olimex.com>, dri-devel@lists.freedesktop.org, 
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

On Wed, May 21, 2025 at 6:11=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
