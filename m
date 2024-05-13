Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E5B8C47D2
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 21:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC6C10E6B4;
	Mon, 13 May 2024 19:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ivce/GJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A2C10E3B8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 19:47:50 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-61816fc256dso47146767b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715629669; x=1716234469; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DUknfNXk78tNoNSV/FKbuOTqBHWDprugew7p/EYSaSg=;
 b=Ivce/GJ2X9nhj6yhOMj5lEQW1tLbh3xNUv/7S1SGokmtjZkwLAynaGliw07FtmPKYc
 tAayaGjZePjDWqqBut251uUXZXnXkfu5agRYBaxD/qY3vayHPR5HCVANr57B5zxDvdB+
 mq9w3XsbOCu4Wy6Ifug8Df0xF7pb1jztV+bef2MzNYZz69Xnf+TL63kju/t4/J0FWMhD
 XJ+IXC/HqMP+lMxe0C3+OL+xa16J9SazfYMuz8q7QEnGb42my90I9KKh/709g5hhCScm
 myaMqy3B0K38j828KdVJhzS6Wh4Xmf9GiMdanBHiy3pmWevsp9NoGYNCs0dT1vK+Q3h0
 ijoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715629669; x=1716234469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DUknfNXk78tNoNSV/FKbuOTqBHWDprugew7p/EYSaSg=;
 b=CPCPYKZXmltb4wRDLh7cJCzlrEUdCdUHuT+EyjGHaT7wRIFnkVWgIblUWrFjs117rO
 DzuNFSSaGOJkN2NS3EXrNQHzTJXwF92/ittiixhiiR9yBvTUJL5qVV9Us4FErwn40ECi
 3EYOUCpWEN90i+I1Slhl0iuYE/RO59UHvdb8vmAJqOxuJGBY1Jrbn0n5YdZP19Jb3c2N
 iF32muGQkvQKxLp4wnugfu4MxaWyVWzA8bOofnPh5SQySbqU3zUCr460yZYG16PUY+e7
 uJBNafgv+cksL2xZxSf7k1CvwBScMzCZSte3Y84Bz/LWqb3WzTXUaEHLP5Gnxla/gS5U
 DN0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV03dLFX52Y4KI6gPrM96juplv3FfA4t15DSDotnN8dOWplU5CdijcxAfk3t3yH7avEGxZHyhMFwvirq5h8IlAs4Y5afm3S6Ier1sT7/p6k
X-Gm-Message-State: AOJu0YxDhfKQQGlxdULCxNCE0OmSRDxrSWNIR1BU8tcCDiAsMptTmhRl
 cdIWGXCFWXSJpkJtjQDDt+Vhi4gkmohnMKwDGW1qfq3ywJJrH99AbaPmT5sp/JIDEG+vj3PuHk5
 sD0U3uJkZVpdeH4BoLmmPr5Au6JCzWAKuydNJrw==
X-Google-Smtp-Source: AGHT+IGnYYmt0EOnAPY00AN8x9tLJNXpR+W6Srvl1WDn62aWdwxJ3ONetwGbkGS/UdOHkoVbG62q60/rx6bF8LH6+Ns=
X-Received: by 2002:a25:f90e:0:b0:dc6:ff32:aae2 with SMTP id
 3f1490d57ef6-dee4f3356e2mr8656703276.63.1715629669087; Mon, 13 May 2024
 12:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
 <20240509-dt-bindings-dsi-panel-reg-v1-3-8b2443705be0@linaro.org>
In-Reply-To: <20240509-dt-bindings-dsi-panel-reg-v1-3-8b2443705be0@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 21:47:38 +0200
Message-ID: <CACRpkdaE0tMQ5=pSofT9pGVcSBLp=dm_7WedpO2EnkbP1w+08A@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: panel: constrain 'reg' in DSI
 panels
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Konrad Dybcio <konradybcio@gmail.com>, 
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>,
 Dmitry Baryskov <dmitry.baryshkov@linaro.org>, 
 Shawn Guo <shawn.guo@linaro.org>, dri-devel@lists.freedesktop.org, 
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

On Thu, May 9, 2024 at 11:43=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> DSI-attached devices could respond to more than one virtual channel
> number, thus their bindings are supposed to constrain the 'reg' property
> to match hardware.  Add missing 'reg' constrain for DSI-attached display
> panels, based on DTS sources in Linux kernel (assume all devices take
> only one channel number).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Looks right to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
