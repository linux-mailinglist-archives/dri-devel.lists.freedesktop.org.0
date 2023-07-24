Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014EA75FE98
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 19:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA26810E344;
	Mon, 24 Jul 2023 17:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917DB10E0F8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 17:56:53 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-d129edb8261so1321204276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 10:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690221412; x=1690826212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ZhW5guor5Hz2gkFyNtuQtClYHHtgI1jQRPcPTzIh4g=;
 b=zBP6/yssRg6JfCnUlMmgDV1KxmrqEtLeMzVKSNMKDdWWkEQDA4EoLBuC84wHvotvY2
 Qj2MlscVI3d7nbXefmICVw3aBmPAtP9Iy6/OTwfq6JEkjb4vXpdsdgMPwJNqXjAzM1uA
 MFXXwr7tzsIgdikd7fWjX90eygo11I3J+6EBQEbNzVohHcbLLpYf5mJs93AZcTEDkLv/
 hdXt2SSH2TxvFPMAkJepU3KPocNnmuOF5kJtVZJ3C/4r7axqfcJUGws70DY0u/15kH28
 XUBb7ixKkiCBAf69Y+1BvE4u5wVSXEnY6O/cEOFaacU2bmQL5z3uagVZ7j/bj/sUJSGe
 7Zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690221412; x=1690826212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ZhW5guor5Hz2gkFyNtuQtClYHHtgI1jQRPcPTzIh4g=;
 b=PmpeuxNH5uFpXXFlfhkUZO2Gn65A0iIK/OztQbOYXT0r9tQhegq9arbYQ35PjWDyNS
 KKbg/v67pHLPN8uDRHJjxghUfFGRLklpqzSsIWGv/ZxT4gWeg1oB+90DhK3iLRlDz/v/
 5bva1BunB7+n//qU0hhBuSjIyaK6mkv7gKtoZkDCYEAvfjD+mifml05ojnNMG39rWQ3B
 dxPYl4gSJou6a4xFLUiY3lzBX5c4DY+DBdKBBIr+U25xi1UP6oUcVRormEQs+LqoLAFB
 2A8OhMWx+ww1nD5yLezN4Io1TXm9cLGZ50vIRCrAkER+/ogRrZvjApHdmHYy2zttUm8u
 s2+g==
X-Gm-Message-State: ABy/qLaNiVaoFnCnLbMrbNFEnJOZB9raMxFloenSAkQfx4qm4X/bxEAL
 WwofJJJaXtAaIVa9wtEm5KSGPtYuV+i7JebgP1o9jg==
X-Google-Smtp-Source: APBJJlEL49lC9Xnmn+AOa8dWCtiGCXwv36+U8j4wMBcZBf0by+9XagUVQLV+jdt1mUay5/9S78Hs2x+mC09ZmIB3kEc=
X-Received: by 2002:a25:bcc4:0:b0:d07:2183:f547 with SMTP id
 l4-20020a25bcc4000000b00d072183f547mr5274226ybm.32.1690221412745; Mon, 24 Jul
 2023 10:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230719105829.148011-1-luca.ceresoli@bootlin.com>
In-Reply-To: <20230719105829.148011-1-luca.ceresoli@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Jul 2023 19:56:41 +0200
Message-ID: <CACRpkdYshDD0CmdjdeVk_oG1s1W4BHHFzLmzN9QtZeMaEyvTBg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: db7430: remove unused variables
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 12:59=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:

> These variables are never referenced in the code.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Patch applied and pushed to drm-misc-next.

Yours,
Linus Walleij
