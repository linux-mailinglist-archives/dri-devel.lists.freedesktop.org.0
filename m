Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C5AAFA34
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 14:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1618010E3A8;
	Thu,  8 May 2025 12:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="grgfDWin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3DA10E3A8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 12:39:47 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30effbfaf61so11904441fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746707986; x=1747312786; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nYbRnTvngXL8TZ/RUSCi51dLsk/tokgb7Y1lJ3Uts/I=;
 b=grgfDWinW7sGd/4X2pa1xQrhU5VOCN6OUru4/xRAiKZn0wk4eT4GrRwpXQKNtsV7NP
 yS2LI7xIMr7iWLTUS20c+PHWrIjfP15WbAplYvlKsjlDUDTZHyLzj2ZtFnFfO4nritmb
 tTZYWHaFSx38CfeYR5GqprIoc4MNL9I0MpAKuEAB6G+xjeBzG/mCt3JLofnhYi8gzGYj
 L2UzBInTQNgaEiEvz8VYwT0d7I5bEvO8AbE0fslTUppKnNNiWBodb0Z76t+1r6eJDfyc
 69Equ3571gStECRvN0Ym+fUKqwr3Qygm9R12UNjRjshtoiCASGMYS3PRSCRqxxslSfZP
 eNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746707986; x=1747312786;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nYbRnTvngXL8TZ/RUSCi51dLsk/tokgb7Y1lJ3Uts/I=;
 b=Mnvm6beie3XdJzGm73WJvW2Y2cRlxxcVRYUfLt7FOxzq7ZpGuFQM2Uu1VezRPOG40F
 0cS1lGdyRkhCD8PzZguheInWvEj5QIcZAFtSbPOFMiRiEkIEG9COSnwLOTnKBA3ZhsAx
 I+OBuOx66O30yiIv9iEAIVzXKRn9Smt4I5o5y6qJuEJb1K2M0mT/7MMXazbPMplEpb7n
 HqoR6l4c1E+c2wtRKZlRoirRmGYSGTL5rg302nAvmFRPMU2f1uzWZGfq05JIXr0ShMnk
 qeqD4jR+o5hpe+1rM6mTOjM18sPD9NgX2ywBhmreSPGjNB7H+FKHCLTWJhAmNbFFKs57
 df7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9fU9RexSx67rNePgojC7bRSU7eOT4fxzeJNCmVrJkEdxK/EqwmGKadou5l8SYiQCuISGo85JmduI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUs9rfXLiwJqvIKQrPCVrYLRoHOBg0H45XYLRHBOVIppSIsfS+
 xYxOWoOVaisVQ5AIjdMElKangin+zlWjr3EbdpRS5cyILbceQRgKJ6F4Tt5roDq/lKbApquxM3W
 +IlWzoFN3saiIQH45zfs64QIAfej+BJSJlaN3JQ==
X-Gm-Gg: ASbGncvl6lrDCNUyeZHYHCMFPZWvMcbEEaimqzO/xmuHMi2DQ/Cg0774+/fn3Q2LKze
 6sG7Poapo3uvFeuAjfffdl5EzH/lF3+s+N6TACqF6whBJHHkVcMWNbsvFLSJoUr1UMlBR1QIkwN
 a0+CrmOahNKEaQvIVYiJGV6Q==
X-Google-Smtp-Source: AGHT+IGq3VdGMjg8OazCCc4CII0+nPRQNZ01hABaFqWf0AEHwQm7ayKUJesfbQ6Em4uNq6qZQ9GpKePgPTEqMruD+oY=
X-Received: by 2002:a05:651c:1516:b0:30b:ee7d:1a88 with SMTP id
 38308e7fff4ca-326b75c3463mr11198921fa.10.1746707986261; Thu, 08 May 2025
 05:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250506092718.106088-1-clamor95@gmail.com>
 <20250506092718.106088-4-clamor95@gmail.com>
In-Reply-To: <20250506092718.106088-4-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:39:35 +0200
X-Gm-Features: ATxdqUGblqi1KlMDIXY7oub3qeO9KDXkWp2T7tIpa9zxqTaWBLntJfiKyh9725E
Message-ID: <CACRpkdYo9ve4ERJ3Qv92eZW-ODqjhD-gxZ92T2hZaD8NJ2GErQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display: panel: Document Renesas
 R69328 based DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Tue, May 6, 2025 at 11:27=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:

> R69328 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
