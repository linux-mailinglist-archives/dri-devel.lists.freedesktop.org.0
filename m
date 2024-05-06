Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85C98BC7CF
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 08:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00735112159;
	Mon,  6 May 2024 06:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WwBx6Xu1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FB510FF3B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 06:49:37 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-61bee45d035so17075477b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 23:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714978176; x=1715582976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnMA7ErfNqKPuWteFTyprk6+lWU7AKOkz4CgphnWuMk=;
 b=WwBx6Xu1MhkeuJDDLnbfQH2UB1NqWEZFqOqX5zoduwGZJzpI+nEZ2Zfm68Ppqy2Rkf
 pHTvtYoqA1TrarC6K8vpp0qO3l5w/ZBiLavZMRqx/eVmY+tbmHvIWcG5FBQdd1JfmFre
 L8uKEiBvgiG7AyQHvwdLRoFGtFW7/qLegJRYRtVIYnX5Oz9l4Og7gtYWR6oz9evKP0Kb
 4TH6dXfiAJJNsdkjekINH0VlH2e/E2GlvjKI0ejJKzDOOVcmlpG3Ro5hw/Pgqn9vGzA7
 nerpejWSghhnnToZWqyhLb3+9FJjxkf2Yo37JUKEmJDRrWps1MK02njKjZl2dd/qioKx
 eZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714978176; x=1715582976;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mnMA7ErfNqKPuWteFTyprk6+lWU7AKOkz4CgphnWuMk=;
 b=qt/lf3RRopu5td79wI0suhIwWewwlyoeU1rNiVtjSEq4ONgF+KziXXsJe+MV7Uw1Xr
 Uma4e37QV1kMzTdPn11rqVvP9c5/bAho2Tl84xLWm7Ccik4WEFobPFYpJpzSPz+j9XIa
 8G6HltLmpbvv5liVQ4Wf627VJXRm6rozcw7us7Iy4GSdsM9SQlaybiUsoQXBwAAvL6op
 lFOk/3FEiSydFlj6WvCJgllV68TC1wFlvxQPHs9c0SNi8GB5JNZ7GxSYkZlivwEdTPmJ
 NeivUgpxGet/EymMHuiaeDYl9E60RcmkKAJs0pecny2L4E3hnrnJ0KPt9IdB5IlYunDU
 rQUw==
X-Gm-Message-State: AOJu0YzdnFW3ilx3cxB3ECkGTu4nqWiA4jSu/EA0+ynjGqxxCQQt8vyl
 nmcjSpc6mURmptvJf1Vb/lDyLvVR2PR7LVriCLofXUB7fw/93E6RDUzBV0QG5EOeuwrPPLTsC19
 B/THnX3lzDl0gg6gEclA9JOGTJG+moks9J/9ehUR2Q5RZ9g/p
X-Google-Smtp-Source: AGHT+IH0hH3+COymJPJl26UVpAMkDQL0eTyMe4aTaoCJoKbhPlu+pDGsv3OMsBrEFsgQa8L3URT8RtIK4gzEII6Co0U=
X-Received: by 2002:a81:8443:0:b0:615:1e68:9080 with SMTP id
 u64-20020a818443000000b006151e689080mr8502525ywf.26.1714978176344; Sun, 05
 May 2024 23:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240503213441.177109-1-dianders@chromium.org>
 <20240503143327.RFT.v2.47.I2513fd6824929a17c1ccd18a797b98a1a1063559@changeid>
In-Reply-To: <20240503143327.RFT.v2.47.I2513fd6824929a17c1ccd18a797b98a1a1063559@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:49:25 +0200
Message-ID: <CACRpkdZgvHRb=KGUskiu5+=R=05yMQ_gqZ+ScP2oLpf6DibSfA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 47/48] drm/panel: sony-acx565akm: Don't call
 disable at remove
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Fri, May 3, 2024 at 11:38=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> It's the responsibility of a correctly written DRM modeset driver to
> call drm_atomic_helper_shutdown() at shutdown time and that should be
> disabling / unpreparing the panel if needed. Panel drivers shouldn't
> be calling these functions themselves.
>
> A recent effort was made to fix as many DRM modeset drivers as
> possible [1] [2] [3] and most drivers are fixed now.
>
> A grep through mainline for compatible strings used by this driver
> indicates that it is used by TI OMAP boards. The TI OMAP driver
> appears to be correctly calling drm_atomic_helper_shutdown() so we can
> remove the calls.
>
> [1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.o=
rg
> [2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.o=
rg
> [3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.=
org
>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
