Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A5F8C4842
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 22:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CDF10E03E;
	Mon, 13 May 2024 20:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cGmCORiN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A6F10E03E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 20:35:13 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-61b68644ab4so45579167b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715632512; x=1716237312; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pTEzGIDxoUNXBmZiuvepDPcIKsUrMofBXWSemmO6LLA=;
 b=cGmCORiN4m96c4k6phFLWrW99Jv1GEgMK1K4iY/+4ODGRWDksUsYQXrIK8FIX8ipsL
 PjYshUq7zociESsPNKeaEXshEJ+ZtzJHrOGSLbBWQJ5d58x8cFc1yq0i83KZ9/HsDv2t
 4geVtFYvCE1tq91PsSjgYDwqNZXBtHzzCYoxgSbf1QNwn8xrqUHjjHB8qjkjhO1+5m/A
 GOHKrVo/AUVDCv7ybnPUySKIOGJaIKJHxJbndWENoR4d5YNGJWFSjwDSUCBOhVgkPCiZ
 QuDrOwX9ruIWxW5PXL4gSDyl1+IXnapxYaGhOfJFTA28g8JHtCVHuRiDPaLGrzoXk0K3
 rsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715632512; x=1716237312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pTEzGIDxoUNXBmZiuvepDPcIKsUrMofBXWSemmO6LLA=;
 b=BDqJU76ujRhS37fiG6DidTdVN/McSmXFD9AeE3vmLrMoCl5Ol1CDVp+yx1b0Lw+6e9
 atsSmOdPOMpGPokAF6DntSldseiPAGOIAr8zsOt1/l4g0cce+wTeU2cX6yLJsJ+ImDNx
 O0KYUNU0d9pkBoU0DwjzuO0QF34wdDrNU9P0wxVe6HQVBli9pqm9B5D6qvWZJvJa8S3S
 3j4BrTau7Pfy8zgt5VP7N8IaTSywLjqu5PEUYZGXOJ7XOewpn9ptOqTrwO7ZTqr7zkMn
 zYqnbBNi87q+UdKQIcIgOK5oiqT+FDn80ZhxNK2+ReZcTRgjOgDDlSs5zHWWE74XQneF
 NR7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUenpsCUNgIhA6pw2xj0iuaAw/u+TRA8JnK5dCdEDDUDYw0FxM6evW17mFuPI8+24zkW7JKP+ugs/RjECKkYMveq3TGOr1ZLogZJAFPlnUu
X-Gm-Message-State: AOJu0YyWpJgXTOX1DTQFnbCQlhkZRXdxGDdrvwWK99oin8re/PwIDBMt
 iy2zkmCRZ76yF1mMamcdQdHZmywL1pYAYXE61z3HJuZYK+DmeSt/XVQPFML8UGy+cwhoyozEvfZ
 sJmrHx2apKjM1BUJSUSdEPrAKwVwriK/defbtXg==
X-Google-Smtp-Source: AGHT+IGmJyPMVsbnq4yfAa6HqzPJ3VX1xQsgoe90edGz5HOQOSfJzFbjTDY3qBrnK5tvkbNi7jtaibG1icr0I8RbCiw=
X-Received: by 2002:a81:4305:0:b0:61b:349c:811 with SMTP id
 00721157ae682-622affc51e7mr108109127b3.10.1715632511805; Mon, 13 May 2024
 13:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
 <20240511021326.288728-6-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240511021326.288728-6-yangcong5@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 22:35:00 +0200
Message-ID: <CACRpkdZAwPH6J0FwCc8VfGvz6pn4_ZryMRhZG5QvdLavjvciOw@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] drm/panel: himax-hx83102: Support for BOE
 nv110wum-l60 MIPI-DSI panel
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

On Sat, May 11, 2024 at 4:13=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, use hx83102 controll=
er
> which fits in nicely with the existing panel-himax-hx83102 driver. Hence,
> we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
