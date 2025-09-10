Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59021B51DAD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BDF10E968;
	Wed, 10 Sep 2025 16:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i3bHVD+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA08D10E947
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:17:32 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4b61161c35cso52537701cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757517452; x=1758122252; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C1mzq7QAamyCDgZjqIwsPENWf0k+ggNwYSd/FkLWnRs=;
 b=i3bHVD+0fUbmwjMlHWh+zn9AHF7RKJkk68GkMpY8WWUZTrjb0rHGfVAzimtrXoSqqp
 C7nUhf54pTXjeGMgWVxONYP13597YxuFH3fMiFIS4L3dJg6TzvdfNIfZzjjEovDCgCP8
 wqfCA9yoN5IYZnliBFXyzUsIzHlqiSifdG8oQpG7CkEYCrwCnz4lS6V8g8Urbu+xouKI
 bfoCt9/mxJ5LBt7fA1Jc0hny9B57K1RwkzOz2932wtp9ZkOsMUfNQod3eHhEIs1gBp98
 l5Q4zZbJ3KKreEAHhsxv34ugv1J6xFcgVYAgXtxmrq/gnx6kM1FgXP+nV1EHY7IIFWtG
 C4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757517452; x=1758122252;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C1mzq7QAamyCDgZjqIwsPENWf0k+ggNwYSd/FkLWnRs=;
 b=k1ED0PQfZynU9lpiVnBZ4/ZzVNTyQZLCTz0g2w/Mu2kitnxWsxOoaM/thohCOr0NrY
 eybFKZCsk0wg1zzvFMubRVm4S3cbJtrUApaahP4ArovKgI6zCaL/KtwVofBPcL3NUksG
 HZTdOH7rhJTNnWioPG5xQ5ucU7HP2enuXQh5SqlKJjLRUn+wtj/Eir/EOqlRDFateb+s
 guZgnaO5ib9PmGl+DXZ1+zfY7luLOZJu65sMc8JJAg9HlPYcBiJuKsEUbPwDPwBr9idN
 qM75yj+orQMpaYKk4KDDJrV76afAUCcSxU3z6O7L7JbSeHefmrRHqZrPhzGGvb8Nhqoy
 0r5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdsHmbJ/mmyiOcFPfESrrfxzVvOBHezDvtL7q/vQ5YI3ZXATMS5t7zHIfVymSeqTV1PH/KIesKNQY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0Ij1C/D3c9dWbsPxl97TugOEyk/De6wayINNKRk1mJMh6ju2R
 OqIJY1kRYCgXblh+Bjuz4adWqJkPvSqzO1fQwXfsQ0slY97+T+gZzbEfV9k9WqqcjRZwlN/D2Ko
 I54H738F/AUDH3OTWFT/muDGNon0arCk=
X-Gm-Gg: ASbGncv7HaBB9G2Bnk1jr6CO5LAFNbf5KLrIDB6pL7R9HcF4VL5iHLLfNKOY4a5AvXy
 /qXAqaQWxWYhDVftcXoLHi0BKAXfld/7tFVgR9gA3kekIK1y8MmiRvbJcnJPDE6CGQnQA6Qefe0
 U2YjnapJxtUwg3pJ5KlI4cNmrB5TZdR2ZSE+EcAz+UC0X6MPk6DXxJ8vrKGj5zHVVRaL+X6Wp9B
 f9uwDoYqyj/spYO
X-Google-Smtp-Source: AGHT+IEn8qLkTWj3W7cFUn0zV2zlgKzDIbStPJ8mNqM9yeK3nj1hkEfb6zWsFfNBsnId52FU4XUstuGirGgUZY2sHX0=
X-Received: by 2002:a05:622a:180a:b0:4b4:3788:baae with SMTP id
 d75a77b69052e-4b5f844743cmr179099701cf.43.1757517450398; Wed, 10 Sep 2025
 08:17:30 -0700 (PDT)
MIME-Version: 1.0
From: Vicente Bergas <vicencb@gmail.com>
Date: Wed, 10 Sep 2025 17:17:19 +0200
X-Gm-Features: Ac12FXxyvwjkGBqU5CGnwwYoBL_GhGR4Pi-bYCMRWWnvxg2lK5-1tJY_LVyPzDg
Message-ID: <CAAMcf8BfxMJx+5ttEXx0kONP2OYWSLFqEYF6rfVBKoRg5TKZzQ@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
To: aradhya.bhatia@linux.dev
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 alexander.sverdlin@siemens.com, andrzej.hajda@intel.com, devarsht@ti.com, 
 dri-devel <dri-devel@lists.freedesktop.org>, j-choudhary@ti.com, 
 jernej.skrabec@gmail.com, Jonas Karlman <jonas@kwiboo.se>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, lumag@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 neil.armstrong@linaro.org, nm@ti.com, rfoss@kernel.org, simona@ffwll.ch, 
 tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 10 Sep 2025 16:29:53 +0000
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

Hi,
this patch causes a regression. It has been reported in
https://bugzilla.kernel.org/show_bug.cgi?id=220554

It affects the gru/kevin platform (arm64,RK3399) with the Panfrost DRM driver.

When it boots in console mode, the blinking of the cursor keeps the display on.
If it is turned off via /sys/class/graphics/fbcon/cursor_blink, then
the display briefly shows each key press presented on screen for less
than one second and then powers off.

When starting the graphical mode (wayland), if there are no
applications drawing on the screen, the only way to keep the display
on is by continuously moving the mouse.

Regards,
  Vicente.
