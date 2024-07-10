Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664DC92D8EA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 21:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B793D10E2B1;
	Wed, 10 Jul 2024 19:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Pkd2d2Bl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB4010E2B1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 19:17:20 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-79ef810bd4fso7134885a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720639037; x=1721243837;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eble5/KJqCeozSW1njrXYIJ6tIyz2Xy8oZVn7c8VBIg=;
 b=Pkd2d2Blxp2GMIRmCawteGTduv1V6pMsnFS2QUVmqMcVOQRm+lWxghAxO/dbcSv47b
 lFwM36Qb6/GLmxVpu9xzBb/7xgIwsnnlG914CdP5OyXv+KXIa7VmcixWpgr7GWXSO4zL
 tBw2lZ3GljnnISsALq2OA+2q5tti6MBr403do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720639037; x=1721243837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eble5/KJqCeozSW1njrXYIJ6tIyz2Xy8oZVn7c8VBIg=;
 b=qtSO7o010RigwoSx+HwYp6zmRui26QGXwMSIOUBdTDSDuqeK9Rt7iEsECwPPoBk1BO
 7x6lvbwYsVT+OGCuVhJQZpqOCLADI7bkq20box+lDE3geUwI3LzAZz81U1lBhMMYsCeF
 nvZJ+7Y/98WAx1mA+WkXzaOCMpCvGBXe/cjRNQhFBgnU8M3R69bun1jBzswLnmoPuj2C
 kTyYmwx4nIxwCuOvqI0670ZaUm1p40beIp/yR364UCb/rlPRzlXoxQY0lPJW/6gizG7U
 vBMqp7lB1D8N0LqVSJROFNtFNzbNrf/QUMKMI1NLuArB5ju+YZeG+epKPt4xvKoTiXGK
 +EwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRzRWfFqaTZpNAaXqm7rn32dv2H6hOX3gLl77+z5Ap21/7wE6w3ahSAEjfK2Dk0zqBJX1jC7S9hPqgEApZuc6GHIt4m6PCFQ877o0a82qu
X-Gm-Message-State: AOJu0YxfDyog2X50a4Z1kN03qERzjmDyLyU1gtu2UnqcvLtbO+iwAQLE
 ZCfYUIaCztD7gF8q7rRwXwzdEII/zGiSfusN3/49pIJFVlttvLKexn0FKC3Avh6QA2/fSUPcNBS
 LzA==
X-Google-Smtp-Source: AGHT+IF64xscRQU8j1qardCPKu6rS20GY94X1citJqGKgk0ALoI2bEkY4wVet1LYpwNn/v+ff9eE0g==
X-Received: by 2002:a05:620a:1da8:b0:79e:fbef:d23e with SMTP id
 af79cd13be357-79f19a6f20cmr675804585a.17.1720639037431; 
 Wed, 10 Jul 2024 12:17:17 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-447f9bd2b54sm22851011cf.63.2024.07.10.12.17.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 12:17:14 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso85701cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX3dVJtttNGjGt7FYKj3WxzpzXEKwXXv6xW+SquP8JT0Hi+EF5PJsD4ZpEabt2jk6qrz3CPwmbwN7MK/K43KhOrMPu5vhVAMcpIzQSmgC81
X-Received: by 2002:a05:622a:4cd:b0:447:e8bd:2fbe with SMTP id
 d75a77b69052e-44d0d631091mr605041cf.1.1720639034173; Wed, 10 Jul 2024
 12:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
 <20240710-x1e80100-crd-backlight-v1-1-eb242311a23e@linaro.org>
 <CAD=FV=XJuV12mStW3eUm5MHG8BA9W_fn0skN=BrtmqC+fnCZig@mail.gmail.com>
 <Zo7a6qso7RZ2pkmb@linaro.org>
In-Reply-To: <Zo7a6qso7RZ2pkmb@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 12:16:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U_knZPsM3jnpUOqK7rcBjJeqPAHDG9QRgWhLVeKGZwGg@mail.gmail.com>
Message-ID: <CAD=FV=U_knZPsM3jnpUOqK7rcBjJeqPAHDG9QRgWhLVeKGZwGg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
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

Hi,

On Wed, Jul 10, 2024 at 12:03=E2=80=AFPM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> > 2. In theory you could make your compatible look like this:
> >
> > compatible =3D "samsung,atna45af01", "samsung,atna33xc20"
> >
> > ...which would say "I have a 45af01 but if the OS doesn't have
> > anything special to do that it would be fine to use the 33xc20
> > driver". That would allow device trees to work without the kernel
> > changes and would allow you to land the DT changes in parallel with
> > the driver changes and things would keep working.
> >
> > ...and, in fact, that would mean you _didn't_ need to add the new
> > compatible string to the driver, which is nice.
> >
>
> Yeah, I considered this. I mentioned the reason why I decided against
> this in patch 2:
>
> > While ATNA45AF01 would also work with "samsung,atna33xc20" as a fallbac=
k
> > compatible, the original submission of the compatible in commit
> > 4bfe6c8f7c23 ("drm/panel-simple: Add Samsung ATNA33XC20") had the timin=
gs
> > and resolution hardcoded. These would not work for ATNA45AF01.
>
> Basically, it works with the current driver. But if you would run the
> kernel at the state of the original submission then it would behave
> incorrectly. This is why I considered the resolution and timings to be
> part of the "samsung,atna33xc20" "ABI". The new panel would not be
> compatible with that.

Ah, oops. My eyes totally glazed over the description since the patch
was so simple. :-P Sorry about that.

IMO I'd still prefer using the fallback compatible, but happy to hear
other opinions. In the original commit things were pretty broken still
(sorta like how it's broken for you using "edp-panel") and the
resolution hasn't been hardcoded for a long while...
