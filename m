Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53408927128
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B935610EA17;
	Thu,  4 Jul 2024 08:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J6ejTcjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191D710EA19
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 08:03:14 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so4141121fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720080192; x=1720684992; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u24iGCJle8wB6047zc0I+RZs8YvZ6yx2WYNcbcQDNlk=;
 b=J6ejTcjF11YLvg/t2ZDJ1t4CfqLYbR+CaUsqrg0kqB/8feBU9M8jEUNyK277WRMSgA
 E1Pf4b/fqOvX4DV1R34xSpNcTh6PDAfxlYvvZmOBT5XA+LxYalU8fOt75NxaAaNy76mD
 pQh4Mi9haoXh47YNG1d1UmsDpDO00Oomwk17KmVD4Sga6oQMObhER37xEzWdD/i7F6Od
 Nr4/w0YJae5d5L1EK6BzfyVdP88Gra1iFGIGWVZ7i4ZaLJqLZTyC5LVDU9DDPcuWvjo5
 1a5j8VoaIA14FVMol5da8d7jQjI9OgWpPOnTc0exygom6+b5pAh6ynrYSCBP3yFUn59J
 HDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720080192; x=1720684992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u24iGCJle8wB6047zc0I+RZs8YvZ6yx2WYNcbcQDNlk=;
 b=LcMm1xmSEMoLVNfC25RFEC1N4Q85fGjNWS1ZAt5mVhcOmqV0lzkumN+j805Gv/OsG5
 +HkGZ8GdeXaoulh2O3diuv5GWxXlIftDV+qST+jb0G7chchCAJPtPRXWiUZXgYgrC86P
 abP8GoGI1rCDV7yB287dV7QqW/h0VXFHtGOH4mby3yhqgjETelyh0NTj6EbVcopLYL/0
 imjXNTNaTqCBFiR4iW/LYmyVbIggjJXodiAhrX6Mc2VDNRPgJuLs7lO62ZLZAGhUoUpD
 +oaGqbz9J8OL6SEA/oWnrf7091wNur9ASgjZhiX7psyBMpwVN2oB1+oPNpo/6mWZTh5I
 ngCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqLERGpC2lpd+yPCO2guGnEjG47TOyQiq2fH68113l+d8yZqt25L7jsilN20YPctNm9KB4W3ytFswiG6AxgCQFBVmJUXWO2CeJnSlXN9uH
X-Gm-Message-State: AOJu0YxeFwOI4sJo2TF3TXaE1BfbeSnVjveOpG/je5C5f+F9YrhDf06Q
 P/oeM1O7i47tY/CQR4DLcMugENn8nSr/KEqWq1i30VaS60efgEbqYAJ8tmpyIgFNG9w2AtNWCkA
 HA+CGlKAWQofHyVk2by9fo7bOOdGHxOh6HHgl+APWzzUqBew9
X-Google-Smtp-Source: AGHT+IF0EDMknjR6sXLPpKbWZIPGUiSupL2hDO53Je9rRxH2mDMZnbcki7Z7suRePmiFrtoavB7I1uEKzuH/HpArOLI=
X-Received: by 2002:a05:651c:b95:b0:2ee:7caf:db5d with SMTP id
 38308e7fff4ca-2ee8ee2a014mr4391111fa.51.1720080192282; Thu, 04 Jul 2024
 01:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240704045017.2781991-1-yangcong5@huaqin.corp-partner.google.com>
 <20240704045017.2781991-4-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240704045017.2781991-4-yangcong5@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Jul 2024 10:02:59 +0200
Message-ID: <CACRpkdaj2quvNdD_UDzyYPK9LyBndDHr0GNb_y8CBFAWakSU+A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: jd9365da: Break some CMDS into helper
 functions
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, swboyd@chromium.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, 
 lvzhaoxiong@huaqin.corp-partner.google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Jul 4, 2024 at 6:50=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> These panels have some common cmds (e0h~e3h,80h), let's break
> them into helper functions.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>

This is a good start! :)
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If you get time one of these days, see if you can add some defines for
the other vendor DCS commands as well, but no hurry with that,
let's merge this series first.

Yours,
Linus Walleij
