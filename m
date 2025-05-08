Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABEAAAFA39
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 14:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F88B10E8F3;
	Thu,  8 May 2025 12:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nmbSGovA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AF110E8F3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 12:40:06 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54c090fc7adso1392631e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 05:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746708005; x=1747312805; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5BZIpNSbnLLVf6GsMiXvLOEULV8LNBcK7VhrImMes4=;
 b=nmbSGovAY94tFRnQl3OXZTHCGnEeHh9ENfC0ypa3F4TcZ9haYw3m5fAvR2GMSELFl7
 +AxAMViPYDoQOiNzIKYUI5UP4wveX+eVljcYr1nZazpepNK+tpN6LaC5rqg9kyJnzO8o
 n/f2DWA6/lt8TfmPkAl2WwYtSqPNn7YFmy03jx8+SPfM7tlQGOB03Z6sV6saQLe52Z8r
 DuAEB4dCdfMLmnRbcI5SuVnXmuFLcRfx4LyX5VrhT6Id2TO8BOdqZvAFfqIUohvTsHx8
 WE7P76yE72ryuF7BG9wUVrFNlCqKBESinpDtb/oDj46Rk03MbUeUBctViYlzKd27yT6J
 FUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746708005; x=1747312805;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5BZIpNSbnLLVf6GsMiXvLOEULV8LNBcK7VhrImMes4=;
 b=xFe9f+eLLFImuAE05tFVxFMUekJ0mBgGyMvLGVGLLPHiNWSEFTFY1VPyDQpWF0YIn4
 UeY29Ev53kfYQ68X+gW7DUkxngj0chsMG5X9rUfBPqh3JAAx/maPM4uoKpQ6135rhFzs
 AamVy/FIU4lsiC9L/Tceo5RtYt7298v+BygvoiD3VmHM+qPMrddHzoPDpEkI5qwl+qxI
 9mrD3Jnawsgn83SKHJISb1DvU/hNM4X81D8j+PH+35uE1lOtmwHs+igTz9/cjACJEYnx
 s4+ll+UfMCfSpUBftUlHK+j4SplHBUWRrd32eVOIvGkyEk64gpNm1vIaG7ZD0v14oWLa
 SOoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2IxDo4NPt4OPbQKQRvcINFNXqlVIpQPObyl7kQKfUjtQBwzxQIunKlO2bGyqsolTEu/EGiHUU4AM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3DyQXdrSVM86nnuB+RZgvn9cTDQai83dF+abFh4GP6PuUK/sO
 Q4WLOGaM1mS1evPbM6m9vT2/ycun5B7VUwY2aL2WwphwhXW+TUE9A5CiyouDeQbPjGtnEovOc3j
 fngQvdqQ5VN7rAMie+ISYfQsIfQLPMf+GyGPv8w==
X-Gm-Gg: ASbGncuPtkVQn7NPKdVOxSWphrldbzWEIPiw/S/2JLu8eDDzecuQC3tLh6hGnaCZ6tU
 qcgAAukpWjy/qoyQrhZ1Ee9JiWbuA7GodRiKmBHoiFqACuTr0tTtqalIYyF0XqAMSyFDU0i6V1m
 En+VotcHiIloDR0Y7TCignUQ==
X-Google-Smtp-Source: AGHT+IE9Q77Fc9oOyWJ9mYq6tNAso+9Vl6Y1CISquo5bvdrk2LvAwCog/GBR9BhmJk3ThE6vNrzoMsQVh3TPJJ+DPTE=
X-Received: by 2002:a2e:be28:0:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-326b88dc5acmr12360541fa.33.1746708005111; Thu, 08 May 2025
 05:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250506092718.106088-1-clamor95@gmail.com>
 <20250506092718.106088-5-clamor95@gmail.com>
In-Reply-To: <20250506092718.106088-5-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:39:54 +0200
X-Gm-Features: ATxdqUE6Q61XCWcHKJmDK0yBWijzJI2jE1ft8w41_6SRUeW_38JBflpJsCLlEk0
Message-ID: <CACRpkdZ9_GnsH=gYFumDE4a+Ois8eSyrn=s3qVFhHA7YyV3Y9A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm: panel: Add support for Renesas R69328 based
 MIPI DSI panel
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

> From: Maxim Schwalm <maxim.schwalm@gmail.com>
>
> Driver adds support for panels with Renesas R69328 IC
>
> Currently supported compatible is:
> - jdi,dx12d100vm0eaa
>
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
