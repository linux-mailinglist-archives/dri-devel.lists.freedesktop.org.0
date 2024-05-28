Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A3B8D1956
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781E210E46E;
	Tue, 28 May 2024 11:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ibEARcBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86DB10E46E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 11:23:24 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-df771db8b24so656305276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 04:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716895403; x=1717500203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0jVo10rUkf0hnMGC1osUVoTzkkTpvLNKjNHzwYPz2o=;
 b=ibEARcBivnC4scYjL1MiePeKUVxG587/Pja9EU8sjhOdO9j5LYLFG4DdpHx2z4/00O
 PeaOr05MLb+f7XFiMsrOkdTVCSZPxNOavodiXIrPpufN0jmUc+s8ID5M+Z/Dr4evMdJ3
 hSR8ZfXxvS294gEO7K5WGWT9q4ZbBWzSt7uTgrMrS3KaMadx9RwthQASqbmNnHvUuHmX
 wiNj9nSCM/HIHPHDn+MSsIIFPhK5QiNtukQURWrDinstyMPbfS28uX6lqBQyLE+ksstQ
 ZvbUQxyJeD6zIzbsL0X/Laowu7kED8p0/YUR+Ey4aGPjj/4w53XMWwD0J8eULLx7XfyC
 +s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716895403; x=1717500203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0jVo10rUkf0hnMGC1osUVoTzkkTpvLNKjNHzwYPz2o=;
 b=lPjzr0VCJtkthxWcFqT//i1U2tDauOeMyMlgdvV+IB5UalcSpn6FtkUgawd5tbvM8p
 baaPlvTdORu5Kn2t/6ADur0kWZcs0IfAI2BHzeesOe3POV62HxUPo6miBNox6zW/0fPj
 f/rQpLNVdnLWf0HffshysP6rdiq3PT/2rfQRcGbkPwb1tCUuorg8pUn+p8LjhK9ph0r5
 VcrYfxi353m8ZBq8MZZNO7i2EnObwRhtLNzpQEGr7SEcyZoBLutO8cPB8LwlSy48g5wS
 xtcKYEMi+UPXMH9kniqYv+aF/iemPUAVNxQR5CNnad9YkFX/06h08sI1Cm4ZMUUnaFxd
 3Apg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwBEzYYMeuWWGsqfe3xsXeRPm/UcMh7p/EGFy2840P6zGzc9HQHri8AF+yJ+cNDtYpCI6saaztO1prSQx6TrKbEHqY2HSF/x/1Rvvv2PlW
X-Gm-Message-State: AOJu0YyzllzBzcWH+tzy1VwmJE+Ey2NXLM5Wu2NJc9yuVCQltD6UGgZs
 2P9OC/qwN6t9Z49DSww3NBhwDrCzUyZ3EjWClGVfynnI10d+jLgdG4Ka48fj4Y1zG/JbZy+2CZ8
 cyQRpzhdlpS2MmW6LpcH7/enQOZN3eoCnaEGpMQ==
X-Google-Smtp-Source: AGHT+IFM89jAkbAeUASNdtBBxhAcMHFPFYE/DuNZA8xET9DT6Q3ZDVSx4aTUQ9VgOHYs59aDbb7k8SWmtYtPVwlakAo=
X-Received: by 2002:a05:6902:1342:b0:de8:9a4b:47e4 with SMTP id
 3f1490d57ef6-df7721c75famr10787522276.35.1716895403027; Tue, 28 May 2024
 04:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
 <20240515014643.2715010-5-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240515014643.2715010-5-yangcong5@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2024 13:23:12 +0200
Message-ID: <CACRpkdZEXB4t6V67FwexOPYtpovXkJ+WsG57VG_p04Kv1LSatw@mail.gmail.com>
Subject: Re: [v7 4/7] dt-bindings: display: panel: Add compatible for BOE
 nv110wum-l60
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
 conor+dt@kernel.org, airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com, 
 Conor Dooley <conor.dooley@microchip.com>
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

On Wed, May 15, 2024 at 3:47=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel with himax-hx83102
> controller. Hence, we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
