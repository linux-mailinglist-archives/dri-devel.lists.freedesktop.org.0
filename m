Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C045F7DF2E1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 13:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D600910E09B;
	Thu,  2 Nov 2023 12:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDFC10E09B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 12:52:51 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5a84204e7aeso11191417b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 05:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698929570; x=1699534370; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkAF/PZfI+WcIMVb9OirzvXLigR8HCnTm5LBRbHreQ8=;
 b=uzG3QWHqircAJxI0unBV8oanzAST6j/S1X3g6xQWYi+p/QxN4tLRNo2GVt674jXlI2
 XBVk8b+TXKg1JLgfh6K+EkegZ9cpopTb0nw3WPjqGNbjvbD3OBnN5B2fUBBFbko0soXj
 jCi+x8Gii9KF/93mFKVjXPkutLqOLULsdreOkvRCxRLOTXGoGcI9XQhoqbn5w/roCM/H
 4xsY2JBod/muzCy0lYRkhNEFjZY/0DCkn44ExfVNkKILg6R4KuNYr5OtVMxCM/G9Fi82
 ZrBuTJWUFZjbxpqdZ0whA4gUQRJOm/qBPeJYcxvBF9SX/0filfi25lj0EueGgTL4of4R
 J5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698929570; x=1699534370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NkAF/PZfI+WcIMVb9OirzvXLigR8HCnTm5LBRbHreQ8=;
 b=AiKMoiXBkWHyaauFPNlDXYyi/IdFav94PhP+1WexGAQU85p01dbp2N1SGAHyDks2lz
 r4M4SFAYOWB3ZLDKr1yZ2U8LMVC33Z9MChtlDg/b/G3sR18M/XjDeqYiIfTJ4vJvYobO
 omOmkTFD7eEtaN0K6Jjm1HO6ADQ8yodt+yS3lTafCpfCbPK41biGl8AljE5b85xY2WZ/
 bED1rDbJrNq0/H8rs67bLNObC1sKoIom2CfgHWgz3aJp130ia0fvUaVfJSrVp7FcrZKe
 qYrTfe/EOtOkFhTF5WzOHdNhD8Ie1CoM+oYyj/Nd7GV9odyxiVyO8Tbrls+gdIaZRJe4
 2ovQ==
X-Gm-Message-State: AOJu0YxIk+/xCJBbm7gfIUaODPfpSV+6koaC7iUhUwkPMmPSk5OUttI/
 zf/XISAtUbdgN9DrW/lXbNc9GY98/13MGRhygom6hg==
X-Google-Smtp-Source: AGHT+IEm5KTzKFJCbkkeKGbycJaUyyW8Clx4xfeXUOila9bUE2hnM4hISA/tiCWJmcYbmvIqZOLlyTt4OscrRjvOsrI=
X-Received: by 2002:a05:690c:ec8:b0:5a7:cc02:68b0 with SMTP id
 cs8-20020a05690c0ec800b005a7cc0268b0mr28010361ywb.23.1698929570185; Thu, 02
 Nov 2023 05:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231030072337.2341539-2-contact@jookia.org>
 <20231030072337.2341539-6-contact@jookia.org>
In-Reply-To: <20231030072337.2341539-6-contact@jookia.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Nov 2023 13:52:39 +0100
Message-ID: <CACRpkdZYfqyOhzzoNMUCAkQoUKSLD99SNUthZ7-m=rmcNvWUMg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 4/7] drm/panel: nv3052c: Add Fascontek FS035VG158
 LCD display
To: John Watts <contact@jookia.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 8:24=E2=80=AFAM John Watts <contact@jookia.org> wro=
te:

> This display is extremely similar to the LTK035C5444T, but still has
> some minor variations in panel initialization.
>
> Signed-off-by: John Watts <contact@jookia.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
