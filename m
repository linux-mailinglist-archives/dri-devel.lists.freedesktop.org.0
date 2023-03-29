Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB26CED2E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C836910EB56;
	Wed, 29 Mar 2023 15:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DF210E17B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:42:27 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id i6so19878871ybu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680104547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pS8+AD3cQkxrFzJTH9IweCQbyHIF0dM/9S7t8SUlbGM=;
 b=jzRBMBOaiXKQFHZWv5P8YP92yyqIgYT7vNvIUCw/4L5P+zdAXFTXuCjFQZOpSrIv3L
 eLXqewuo8uv5esSacojCB96yvbNEo7E0Gb4t2Xe8/NxbP3WA8f6/1RvtGEYPkLPlc1Sn
 a0rtap6GhrqHYJLN8Tc2xDzLa4HI7lGwW/NRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680104547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pS8+AD3cQkxrFzJTH9IweCQbyHIF0dM/9S7t8SUlbGM=;
 b=SizGFsA+brj74goMeLRNFSMGwn6OVI7Zw7eyycGZTDg9aD+30+Pxyi9rvIibd9vJxv
 /8yVXRDDPmU+xojnyCMKY5Nkmu6jbLwElNeCI0Ru1lSBg6hLFy+Rkzr1uTGJt003Nb4h
 oUWlU0pXaxKiIneAdtfWvDmmkcojNYzx49sljacP+eMvN9BrQPFLwj+Q/Rj19MCCDkfR
 /dbR0jmpasfqhuk0efdSkdgfY5/UcjVdYaIc8q4L19XwFCgrv9nM6P0C042EQyySGe84
 iqHsOJnkbqTkdqlVas7Amiz/uuLZ2EDez4Kyy1zlb2wiNmjJryBr4jHbl6s3rL4UkIHP
 DgcQ==
X-Gm-Message-State: AAQBX9c5HScjrIDxxGKcktwx4EaHHtDwWa3HY/QDgPqKiZRk7mOTx0Jc
 sII82PzwtOLI/H8MB3OmndEQKKQ6zw7TD9r2WsTvcA==
X-Google-Smtp-Source: AKy350bJqV9lEqGaTrn1zxndLS8oYHTNrILsVhExwkudwcLjG0SpWZe5ey3aRXvbk610+0fMyI64Rzp/yPi80ZHWedQ=
X-Received: by 2002:a05:6902:154a:b0:b3c:637f:ad00 with SMTP id
 r10-20020a056902154a00b00b3c637fad00mr13586904ybu.5.1680104546805; Wed, 29
 Mar 2023 08:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230329144155.699196-1-festevam@gmail.com>
 <20230329144155.699196-2-festevam@gmail.com>
In-Reply-To: <20230329144155.699196-2-festevam@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Mar 2023 21:12:15 +0530
Message-ID: <CAMty3ZBBXNp4Fju0TsOW=cD-34pj6qs3FBA5gMrND2-fnWQOPw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/exynos: Implement support for DSI clock and data
 lane polarity swap
To: Fabio Estevam <festevam@gmail.com>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 8:12=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> From: Marek Vasut <marex@denx.de>
>
> Implement support for DSI clock and data lane DN/DP polarity swap by
> means of decoding 'lane-polarities' DT property. The controller does
> support DN/DP swap of clock lane and all data lanes, the controller
> does not support polarity swap of individual data lane bundles, add
> a check which verifies all data lanes have the same polarity.
>
> This has been validated on an imx8mm board that actually has the MIPI DSI
> clock lanes inverted.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

Prefix would be "drm: bridge: samsung-dsim: "

Otherwise look good to me, I will give a test and update.

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
