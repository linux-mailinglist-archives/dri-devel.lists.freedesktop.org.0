Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E404F11CC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 11:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF4110EC22;
	Mon,  4 Apr 2022 09:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D0410EC22
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 09:16:10 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id w7so8357836pfu.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 02:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=Ohll0TfElX01EEztzy+sV8tr7tuFSsEyPNjgblnDlT8+PtNiIx6WFsXQDkcoMDujHl
 KTc1rayEKoCvtugL0Tk30Qi9v1mIFmw5NSch1T39TjTF3En8de8A3fLd5fz0R3k7b+bf
 zB58JpP4y4Lif1EYckcC0EUMbrZb23mNbOGMIn78/NbktPWBBWvqEuciVqd2cpwiQX6t
 diFVTMxqLA2QehP4Dst1DtRg6SWkQ7ss+MbhBh4W0FjB2kZ523j0ke8iDiid4o1tGwKl
 1d7Ms368HPBYU0Vfp/GuXhGAUU9y1PDZGAHaJzIXs8Ms/fSCPSv5fm81wExvMma0EXCB
 1H3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=QXpLxw1M2f37fToNbvTVGI1eahChBRbBOhouyNolbK5Fe7dYYgFmYbP5azUF5mhwBI
 YUr9RPKyTFo9aSwk5IfjFFF4R2pdwMG3pCOyl+TgghDhJIY2YbxC+qIHcjH5aAjkbWSm
 NTPSAge9SpWAdoVD4ujuuVZudKglzpOHuXBdlAdISvRzjN/+fANsXT5Gh3nNBYSmNnlK
 Jr2EdPd0bJoWpYuBoUOKYjmoM5PMPVQOGBEBXXrPTFy9YrmNbtK2A8WYV9qea/zReRkI
 qvGbghm2pJzJtSdPYO5Ju/FxHldjqkuV/JMKUuaRZ38ohbkzKTEjAfy3A5xChk3YOkve
 eIYw==
X-Gm-Message-State: AOAM533zcPX9q4NUV3HQ5IRIlO4S7JCa7oCk4r0eJUIq0tNBhjzlrMYk
 0wdL6dOZdSmJCdsbcJxrKAuhd3mw+y0F4NLnneOooQ==
X-Google-Smtp-Source: ABdhPJwlMLWAwxGS4xUU0ah5k3e4yEZuc4qCX0s2Wk8VrETHTkejVvIwpzU2+cfR5DiXzTynUh7ghPuZk/M/4ELkhJg=
X-Received: by 2002:a63:3648:0:b0:398:a0c9:7c58 with SMTP id
 d69-20020a633648000000b00398a0c97c58mr22867116pga.201.1649063770015; Mon, 04
 Apr 2022 02:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220401150533.7777-1-jagan@amarulasolutions.com>
 <CACRpkdYzHvJ82m4kK8igs0pt0qQ+LyjHTBAz2bui_1e4-9VzWA@mail.gmail.com>
In-Reply-To: <CACRpkdYzHvJ82m4kK8igs0pt0qQ+LyjHTBAz2bui_1e4-9VzWA@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 4 Apr 2022 11:15:58 +0200
Message-ID: <CAG3jFytd5aN-qC9NjUAyny27Wm-M31niFyOf=av0UHryEmdM1w@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: mcde_dsi: Drop explicit bridge remove
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Maxime Ripard <maxime@cerno.tech>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
