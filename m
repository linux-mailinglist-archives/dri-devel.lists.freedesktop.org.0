Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D90A1A269
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C8610E7D0;
	Thu, 23 Jan 2025 11:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+PDZlK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B351710E6A5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 10:12:10 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so5539986f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 02:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737540669; x=1738145469; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=20FAdf02NrSkEdbz0cWwrE4L3hm/YhIyOMV5uB/eaDI=;
 b=c+PDZlK5IL7uuKrg59PsItq+3/XZQmgE1nlYw3gG/X1C9bnBi7tOEx+meUM6F4bEdm
 Ng+qHMB+TAbTR3tVL1Ul/SxD8cAnH4LE6KNRZVqEN/fbyZOIv7ej64WboMFDxdBZXem6
 n5GV8GSmX6JnDgNTLjEDqv+MYfQ0xSUuRxE887RZQFiJafPidhN0qirCFLq2EoI1uC5d
 NQ+ywQByS49fHvgO6aXGiENgySjSIg+CaAb0xc26CZBEFRbpvX6VVs0wene8kpyiCxJ3
 qegOB5SyXQIRRF1eNOUeaHymxrEpbxhCTK6PSpdrhBA5wJHNb+zGmXKYNmBVq7nB22Gv
 4qkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737540669; x=1738145469;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=20FAdf02NrSkEdbz0cWwrE4L3hm/YhIyOMV5uB/eaDI=;
 b=GgAjZ9e5Eq34hi/b4qx1pfcWJRDLKvO2oBedWyC1/vEpsI6oR6ZJhokjX8+tiYrzAd
 U3dPJeNbC//NPC9Gi4I7MPsPkuMGr6YSDDBbT5TWLC885XZW2wp2PXe0KqItpJVz4n93
 IYAcWaMlFeMomxY7Pk+SI+zVwZlfFY35S2AvmiUVDbYnNRFOXrEAwue5Z6M0tI0z6+aw
 1W47CibyjEXH/6LA6FfMNooh/V+kf09f2aRCzMilWGnJaWYe2jOz5snL3PxOCr07VGTY
 3muf75yh2GeM327PE8dI0o220xK81VDNSHzQ4JtHExMzrdtLqtZfj5+QjsvUmiRQO/cV
 Bu6A==
X-Gm-Message-State: AOJu0YyZ1dnfJpBdrWzjppclsrO5bGU27oLZqe7tlWR/lvpAVfNV93kF
 WxTuvLzzWOFzn+YX3LvIPqXi6OQJ+/04yS5BvI5Ibp9R37bRBVkuKvUj5qAyijSYtQNYY8sXz5c
 mHZoQuADOTfVCwMpx6vzaDQyFSrY=
X-Gm-Gg: ASbGncsYSEFUbVR71VBfh81Y7YbRQw7E9LFW8OU8PejDymgs/nnJS/6plR9ZAT4JD1W
 P/pghQ3z27ZBaO3mgZUfiRoK8VMC6HJbT2gLC9VnHg6GtA97QsATP
X-Google-Smtp-Source: AGHT+IE8JY+rkDYH3zsd4p+dqjYEetE1zmZVVPdNASmTjxFsjiottwCYgW5LnuvweIAbLA8aAFc6uCP+Y0gCHFI9aGU=
X-Received: by 2002:a5d:698d:0:b0:38b:d8e0:a862 with SMTP id
 ffacd0b85a97d-38bf58e8af9mr16014557f8f.43.1737540668953; Wed, 22 Jan 2025
 02:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20250106121054.96739-1-jesseevg@gmail.com>
 <CAA8EJpqO9Ci6mNSA4WRBuiT7tp4D3OLoQfjFnDV_kfo5i-TPuw@mail.gmail.com>
In-Reply-To: <CAA8EJpqO9Ci6mNSA4WRBuiT7tp4D3OLoQfjFnDV_kfo5i-TPuw@mail.gmail.com>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Wed, 22 Jan 2025 11:10:57 +0100
X-Gm-Features: AbW1kvaufqpGClMmrIK_PdXGLKlUjxGf1O_Q7jDhZseLIc7Cv9enLNo0a0-J-gY
Message-ID: <CAMdwsN-GGHAbViUPkriA-eKq2KSH0p4i5KMXb77XG--nXPOkew@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: adv7511: Switch to atomic operations
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Adam Ford <aford173@gmail.com>, Jani Nikula <jani.nikula@intel.com>, 
 Mads Bligaard Nielsen <bli@bang-olufsen.dk>, Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 23 Jan 2025 11:02:12 +0000
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

Hello,

This patch seems to have been archived but I can't seem to find it in
the drm-misc git, is there anything else I should be doing to get this
patch approved and included?

Best regards,
Jesse
