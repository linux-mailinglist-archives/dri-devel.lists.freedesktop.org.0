Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E36F8C4845
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 22:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E2410E957;
	Mon, 13 May 2024 20:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iB88xcWr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B874310E957
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 20:35:39 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-61be4b986aaso55055597b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 13:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715632539; x=1716237339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K5gJymEU887CrNC6X289CM2zG0sNjhqiEQwzbLWQ8aI=;
 b=iB88xcWrQ9nWKX67qw1NghsJlyB5HRNB+hSJaxNY4juvZYXGRIQ6LVomETaa0Sy0b1
 lQp53IJSVAvciW3IHE2JxG9Edr6iLuV0o8MYTdvl1JX1UEI8fTBrVioStBKoxdTfbjFL
 oyHacs1keIH6pIBGTtywuUtSpuP+juDOgHKgymlB+Xv2YXDJOU2/wexZCN+XBHKK/Chp
 R5TJCnregG1Wk53nw1Oq9YiteS9J8Ub4Imbve84qLg8GVxF1NWfvWshFaRmZneb6Ygay
 mHgpybBR0nWp80td85iQyVCSsaw1iytyz44fduV42urhafRgJgUZGlZKg3Mg6T+LUnfk
 js6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715632539; x=1716237339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K5gJymEU887CrNC6X289CM2zG0sNjhqiEQwzbLWQ8aI=;
 b=d3lQCpynbopVPWnfpxvER92R9r3IqmmGOUMX17DQvlqyXVgtqNwngWkHjTe772rydD
 jJmpXtFBpnLjeKJ1zxab/BxK08qGpx/Gx1qTKvLRKNy81buDlRqndxdiYmA0GBWoWbmB
 Hq63btUXAy6qElYBKVFtfDtvmcNoBYw2yyaEIRKOANQwamv7ohTxm6otB8UQ/OboJOAw
 jTQYME2iQoJcGZVSggBu9DBrrY8ELq2gjmc0d3QD7EQejcB6aPRyLK6sH1g3echj973p
 fav6Ziwttuy8u82qp3A1eWAP8a6tNeNPYYCB6o/oIaPF7QZo33XGGELl9Gnv05nny1aj
 WZOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy67VWE4uxng6kSb9r8G2V92NHQPu6/jptWHOiv8ZILToR7xfun2czbB/SM9yRqam8fHuzRurAOwwxLb1s4cEGTpMJBxCDJFQdLJONVPcc
X-Gm-Message-State: AOJu0YypuTzFrr/P+nPpjFKvlLhu5y8YCZIMHOhmDDkPmI7MJwP4uAE7
 EfAxiUg1ivWOpZFjV373HgGJkikERXCmL3d+MFn6Xt2vWHT3yqBaNiP0ueDlLNFsKBEsFJtWob1
 QezfyI5IceyIsE/ie+duEGSypry8FJOF72dp4KQ==
X-Google-Smtp-Source: AGHT+IHSl/yR0nTZcRlSe+ORPztjmoog4CRZc8k44qPEv4107dBUri0sSEMdFfUGHggaDXOsYQE07EPlHgu7P5eK1hg=
X-Received: by 2002:a0d:df16:0:b0:618:83a4:588e with SMTP id
 00721157ae682-622b013d333mr108562117b3.37.1715632537678; Mon, 13 May 2024
 13:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
 <20240511021326.288728-8-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240511021326.288728-8-yangcong5@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 22:35:27 +0200
Message-ID: <CACRpkdb0YQZsFY-uYFKLo_aqE_G4mQ+5mtiszDGsrgFz5R+CcQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/panel: himax-hx83102: Support for IVO t109nw41
 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
 conor+dt@kernel.org, airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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

On Sat, May 11, 2024 at 4:14=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> The IVO t109nw41 is a 11.0" WUXGA TFT LCD panel, use hx83102 controller
> which fits in nicely with the existing panel-himax-hx83102 driver. Hence,
> we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
