Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4728325BF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 09:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EC010E1CD;
	Fri, 19 Jan 2024 08:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446A410E1CD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 08:27:50 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5e89ba9810aso4134347b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 00:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705652809; x=1706257609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6uj8vGAtWaSglPusO+zY1nNoEfV/kxZM7/ahLuGXb4=;
 b=xbQeY5hCe3/wO09EmEwAbjKGYsvNf/uuVJmP1Dc9+CKmVG7+EG5efyzB/mAm5RYQGI
 OkiZKOihtrE7L6W3QJ8AWAbmyhsor4oQgrAsulAHhiS1g3rz2jIk8Aj/QJ7cART0O7MC
 tgS4kz+v3l2xOXqOVqpSZJqf2dRLaYMIHIMCfwH8yeRbzqhibzt8xTTVHkwqMEh9lepf
 K/OuhtGojhcwIOuUlhpUSmenGF9oTUSnfLBMFb/feMRfnYaaRiT+sU5LnWC+o5OzReZn
 7O6u2xVxY2lj1qzkDKZJjJMlMOQ1cY7f4a5yi8EAsIZRRlgyddvmYjUpvBnTblaz3HA0
 ZUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705652809; x=1706257609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u6uj8vGAtWaSglPusO+zY1nNoEfV/kxZM7/ahLuGXb4=;
 b=XWbLZrhZwUl8MUevAW4wLn6xD4rL250We9V9QDbzLPZpTsrp03141zISOAFlWvfA6f
 stVEHuoYJCi0yqYVnoDK/AjNuEFxT1jCsZUPz6aZuiXd9YG11geF6lYGsZiCB1biAPv+
 0lGAixSgekeIfcc/jsw8jUnrY3xCNSAqNI902lmp5FvIdtZUAGEZVNcithfUaZl3cT4j
 65Kp1MGBcGS6nyLJMsFdLvvsxbqXkO8Vx9wNHVbBuplfnfOShGnmMraRi1uXUlCl6yF+
 gZSRXZzGQ9DLHGYZ9UIOQJ0Q/2KkRMNkkY/OxwNszqUV64mu9qkCc/ggBhTk6LqUD4ND
 IyVA==
X-Gm-Message-State: AOJu0Yy7HES8BGjk9cy6/mqvcNOIlP/at0tm+srZW7l33YZeQhNdUbn0
 R7cNeeioeKBJ61FUlFkXCH0TvBQo2KBmsEvjlD/LCIce+Od0fddnmDLaXEqOU5p3H21eZxyhwhk
 6VXRQ13J7/DIQ8rifNeXj7q6gRiNS4WcYlpnx8Q==
X-Google-Smtp-Source: AGHT+IFZAqizoPdRuii626y01xkZm8MM4MJIrfjqmCqvUZtFJj6JtaG5ZTQJR1iBiKLFo2+ioyraQRvAy9rS/GrdsSw=
X-Received: by 2002:a81:6286:0:b0:5ff:957d:a018 with SMTP id
 w128-20020a816286000000b005ff957da018mr1588062ywb.45.1705652809496; Fri, 19
 Jan 2024 00:26:49 -0800 (PST)
MIME-Version: 1.0
References: <20231222030149.3740815-2-samuel@dionne-riel.com>
In-Reply-To: <20231222030149.3740815-2-samuel@dionne-riel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Jan 2024 09:26:38 +0100
Message-ID: <CACRpkda9kF8pcuccSj3Wyy6n7Q7Fd7NmCGcaMzT9sKbTKN1LJw@mail.gmail.com>
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add quirk for GPD Win
 Mini
To: Samuel Dionne-Riel <samuel@dionne-riel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 22, 2023 at 4:02=E2=80=AFAM Samuel Dionne-Riel
<samuel@dionne-riel.com> wrote:

> Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>

The patch looks OK, it was missing a commit message so I added
one and applied the patch to drm-misc-next.

Yours,
Linus Walleij
