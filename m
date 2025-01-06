Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795F0A024A0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 12:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBFE10E0FE;
	Mon,  6 Jan 2025 11:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+J/pJQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A1010E0FE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 11:58:36 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-385e06af753so7147133f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 03:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736164655; x=1736769455; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cn/UeI8mohAjfHea5qr5CpwesH3i9O9KH0lS1CLexMc=;
 b=S+J/pJQaxFpEcmKgK7IUHc3HvWewqy3cYglyqNPz+P4Gvh99b6CnPk5T+XHtn+hjRo
 6svynjdmZ+8yQoodZGGd4Fw4Yha9x621OLrSrpP7ZrtsTW7vd50Dh6/13+Pqq43CFC+b
 A2kRotAV1eaQhxV+Bo9alUerSHyL73N3XNwdR7QZ6Z7GBudgsJBK+4fLgdmeIL2SjKAK
 F1HUBLomvVkNEEtK2dY8WxNDL3t9rZVsd/jA3Px6TB/V8VdV5MLXUXTmQVU9Lv+O7dkL
 GV1tjoz7+eybymIclt1fZoKmYcpKdRb9MoIcoTzYRw7Vy9V76tfn/jf0QRFM84VDGKsh
 Uoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736164655; x=1736769455;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cn/UeI8mohAjfHea5qr5CpwesH3i9O9KH0lS1CLexMc=;
 b=uVbq7yr61BDwcrzY1m4FyJwUL91ONdMVK/JrZaGBREpyW16E9t1zGq4WYlQmPezsSm
 1jwNoExE4pDccbiKfbwnDzh4SBQn2K54BJIISn2HM15ACtP66gbyLiEsi41IuCPB77Jk
 RML+PZVw2TR/V71JU4SjYcPva+g2Mu/9KTitlKDb20TfS0J3iZwH3fZXb/jiYyJv9ajy
 vYQ+HISu4nytMOsSqXtTK8i+ZuBgcY6YJ3O8L7WV01c4pLWSXbMeKpHMPTTIxDWTvc2u
 xBAt0ZPREHNVasOvYiJbTj9e6zP9ryFVJ6nzivKD6VH2ptYzS/Age1qialRqToO2HmU4
 yF8A==
X-Gm-Message-State: AOJu0Ywfk8ZW8PM+JeSca/67gjy9zJxz++v6jEwIr6LOjvL9UX/041OV
 CL5g4W9Bnu1zVnMuHNVFT1N21N8ZdyaiXtopV2Pr/7foS5kJlD/YnyfnWzatMFq9oURFtrP+nZ1
 /PQdKM8Y2sg5fK5HlmwrkHHuxz2eHPkRM
X-Gm-Gg: ASbGnctsnwcnYZZTe0B9Fpyi39kf7pEnnB31LTb2xASOTHwdT5xUUp7RsNsmzOxypdA
 aeZx+QIP3i8aHs2WMlBIPUbhrQv8WcnBrSAS+U8w=
X-Google-Smtp-Source: AGHT+IFopozCUqhyIcbBhOSsHGc3BSmyKmWXPC6lDA0G/Jp18NTAF5dXA+WMXgI9QT5k20+i4mazy7MisWkaXfSFBpE=
X-Received: by 2002:a5d:5986:0:b0:385:f47b:1501 with SMTP id
 ffacd0b85a97d-38a221fa8fbmr45921703f8f.32.1736164654561; Mon, 06 Jan 2025
 03:57:34 -0800 (PST)
MIME-Version: 1.0
References: <20250104181908.15141-1-jesseevg@gmail.com>
 <qfxsq2dmj2ty5knlbjmdge2dm7vcace256qkjosg5hvgfplybi@3wwsn5hcnksv>
In-Reply-To: <qfxsq2dmj2ty5knlbjmdge2dm7vcace256qkjosg5hvgfplybi@3wwsn5hcnksv>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Mon, 6 Jan 2025 12:57:23 +0100
Message-ID: <CAMdwsN9_ehCRmo62L=X3m3=pt6LuDekukXj3e8q8XgbaitgAOw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Switch to atomic operations
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

Hello Dmitry,

> The patch LGTM, but the commit message needs some work. Why/how does
> TIDSS require bridges to use atomic ops?

In hindsight that indeed could've been worded better, the approach
here was as a stepping stone to implementing the input bus formats,
which is what TIDSS needs, so I'll reword the commit as to make clear
that this is done so the bus formats can be implemented to support
bridges where this is required.

Best regards,
Jesse
