Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CE5A653C2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA7D10E40F;
	Mon, 17 Mar 2025 14:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dbDxO33r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73E010E40F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:37:41 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-224019ad9edso31690335ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1742222261; x=1742827061;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4BhL2Yaks2q5eYLwQGsQ9FtBVskiaGmEN11DByoOu+E=;
 b=dbDxO33rNgYukKA177fjCflkPS9jlYJni86JhHXDrcVIzig435+zt6kPQCbbRD4MiD
 wpQzzDaZmijCVG98yPkgqOnX6S3//80GK9Jq7cU9WgRCQdz8mrq4itKJAdDRNK4znoMY
 ltnaA5H8hpGbCZyxk6lbxKonoDKlUNi4mEYxiLgsYnNyPsCekIPCD0r8UI59f4nFJ6ay
 UEzPVnUcF8GBr3Pdm6LL5Ug4jaNF1kY9pq+qgRiXFfaxRq9qgxwAqlJh7ig2b3Ajjfwi
 k4HHF6AiBGsUwWbDpRQvBeVczyi5iVNSgqcjohXyach6PN45b9pyX4HDInXRdeBhNy8k
 tzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742222261; x=1742827061;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4BhL2Yaks2q5eYLwQGsQ9FtBVskiaGmEN11DByoOu+E=;
 b=TtSpzVb6pEPZ2ekHzd3+bsnjC9pERGx7HjG1XNXQrd8vF3EpasVHn7xiL4xAAB6+9y
 4plvXq7FsPM7daOmKlBrZb9AToJC21LQaJiTNuCOOD/1mcbLhbfQLy5crRQnaUXm2d5D
 CSO1np+KoKhMNy2+I2Jqa4Jy0wMdVG1ddM+keJJVFQdiDqhohYT0WP21KLdQOmm0fd0w
 YNTjb3BZjuWGBYdSZRB8qebAp1XWIokHThoncR1JGxEN9UhLo7LvVCNAgsJkA/FwprjU
 VIFA4ZcHvejx7tzoRu3T5soADQABAw2atzRUaNCpmxO3c6WcIn2alyRYAQ+fXcyS8ohf
 PnkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBxecLgEisIRoKehZMO6oyOpBniaHWauHKohmkRW/OQt2TdHuft3n0B2NqWh0ffBQuQlOpyViBIZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN2+IlOOlsEE+UrUBM8+ilczlFo6E2l3HOYsnpohcLf93y9X2b
 r846VqmuAQ2/VsVOiZh5NH0aNGAAG63y2HAWCVmIy4/9JEb7x4ecCJvhXCl5Di6tsSHwtHt+25A
 crdRd9Ctzrqm+dThvn/2otwOHvhMG1cujUOQXbA==
X-Gm-Gg: ASbGncv3Rx6KuciF0sMmIhthUmnCO6n+PSahMdClQjMctbUK4TrR5uV3HsA7PfSUujE
 GvaftYWKyP93Wn4zQbE1dQJJ1NEk/baH/2fJkzGR4wNvmWXzB0cC2cgNwar0jbPK4cSV8m9LcfO
 MfwkP46ALMHLd1oLHN4Kz/hZqtajiKPzqSejuZb5+0vYfo4t1TBdQB+2InUfgTPNpD8TsX
X-Google-Smtp-Source: AGHT+IGbXl28itf7kvvrqy540KzfJLaX7CDKqwGYMcvVjxyK45BPZ4IUPj0mY8ZSR8GW/D32D7pW6DWKUA8JlPuFlUs=
X-Received: by 2002:a05:6a00:2309:b0:736:4b08:cc0e with SMTP id
 d2e1a72fcca58-737223ccf1dmr15014447b3a.17.1742222261342; Mon, 17 Mar 2025
 07:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250312-vc4_hotplug-v3-0-d75878677de8@raspberrypi.com>
 <20250312-vc4_hotplug-v3-1-d75878677de8@raspberrypi.com>
 <20250314-armored-tourmaline-lizard-cee8d8@houat>
In-Reply-To: <20250314-armored-tourmaline-lizard-cee8d8@houat>
From: David Turner <david.turner@raspberrypi.com>
Date: Mon, 17 Mar 2025 14:37:03 +0000
X-Gm-Features: AQ5f1Jpk2qj6wLi6ea6sCKp_tWqRzPOuJWPTh71dRl9BYdVEBR9Y7uhNYp72rwI
Message-ID: <CACXvZi-3mkusGHkZTz=kDo8WcNQZR1A3bddajh+CFT6tQxJSCQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/vc4: hdmi: Call HDMI hotplug helper on
 disconnect
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
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

Hi Maxime,

Thanks for the reviews.

On Fri, 14 Mar 2025 at 13:33, Maxime Ripard <mripard@kernel.org> wrote:
> I also think that it's wrong, it's not just about audio. It just needs
> to be called as part of detect no matter what the status is. Audio is
> one thing that it will possibly handle depending on the driver, but
> EDIDs, CEC, etc. might also be dealt with. So I don't think it's right
> to focus on audio there.

Does this wording sound ok?

 * This function should be called as a part of the .detect() / .detect_ctx()
 * callbacks for all status changes in order to update the HDMI-specific
 * connector's data.

Best regards,
David
