Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439EE82BE85
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 11:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B3310EAB8;
	Fri, 12 Jan 2024 10:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9DB10EAB8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 10:23:12 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5edfcba97e3so68200647b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705054991; x=1705659791; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uoixCIvUaJI+Ikw8bVxT8gSbu0EfclZZOnaz2syKKYw=;
 b=Vn0G+HkUIPmdSIdPwFdYpc/V3/vF8j158bZd04CJt7KEPzoU22oRjvi9icozwXP/EW
 q74K9oWgc50k8o1RrjJSfgk7HcP2SvYvdgUjFZwVKSyKOJ+4tn+3qH9PzSWb5XD4e1XE
 fQPSMA4BMHFValnTIj/w4gtqER4No+ufT0DuqvsXNbyT8KD/lmSwuAbVmEAvcGjal2hb
 bBf8xXMdncQoxvBwA677kIgmwQjLT3pyuK5T4kuovfTzWTQBLYYthMQyVInwLkajiVts
 BEA+6R71O9lmkXHeELOljFfniXXHAsU+gT1yYO7IoJ9eFznA7FoBnPYAI1k032NxHaZy
 X5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705054991; x=1705659791;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uoixCIvUaJI+Ikw8bVxT8gSbu0EfclZZOnaz2syKKYw=;
 b=vdNmrhqxEM9Q4EwhlzcQ1r84l2PUmmiYJ1hJPcscK5ydAJiijxyLr3za7xpUdIfFzP
 0e1sSLpWh1FZoTrSC86PlB45SDBed/ZHrLdl7mFvn5FefLBXRQoRXtlEkW3tf+4C2VHN
 Qz6nUbnGTPqfta1QV+P2WaKbi0zHh6v0b5B3XSR//5jcXk93jOa57GDY7NlY4HkthP9V
 flI7SeMclVdIY4k3aVSAS1Mmm2eG4tSgS4emaevzxV5Pm2AGLNdTgyfl8SLMUeRB6GZk
 crwKlnjxZAOOoSj7o8W8X2F7qPwb6k/Ml50B/P/1PtIn9nLxZnzPD04cJMQ+2tlL0sGU
 mD7g==
X-Gm-Message-State: AOJu0YzofMr09TLDhZhaebrlD24z6Thwc0UXTjBBySBfda1LvFY3N3Ap
 WkezdZZD15au8fIsbBkAXWK+1Xm4hu6X20C4qOzr+EAsiag97Q==
X-Google-Smtp-Source: AGHT+IHmVOQtBdyVCbejqekjIZT/Rhkl+4ZWZHIRmIXNgIVih5i3KRfprEy8VQeiPbDlnOubwhyA1NG9t/mgb8i6gp4=
X-Received: by 2002:a81:ed0b:0:b0:5ee:6491:c2e5 with SMTP id
 k11-20020a81ed0b000000b005ee6491c2e5mr1005535ywm.10.1705054991639; Fri, 12
 Jan 2024 02:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
 <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
 <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
 <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>
 <CYCLSCKPPBOC.1B1MP3VOOC0Q8@fairphone.com>
 <cdc18e2a-b7eb-4b54-a513-481148fb3b0d@linaro.org>
 <CYCMVXHYVDCI.HVH1TR8MWEUK@fairphone.com>
In-Reply-To: <CYCMVXHYVDCI.HVH1TR8MWEUK@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Jan 2024 11:23:00 +0100
Message-ID: <CACRpkdacS9ojXUuogygkz6xxCf3mMq6GG_75sze8ukUu=rxVyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
To: Luca Weiss <luca.weiss@fairphone.com>
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
Cc: neil.armstrong@linaro.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 10:52=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:

> Since there's zero indication Truly is involved in this panel in my
> documentation - much less the number 5P65 - I'm not going to add that.

OK then, I fold, thanks for looking into it.
Keep the Himax hx83112a file name and symbols.

> So in short this panel is the model 9A-3R063-1102B from DJN, which uses
> a Himax HX83112A driver IC.

So compatible =3D "djn,9a-3r063-1102b" since the setup sequences for
hx83112a are clearly for this one display?

Yours,
Linus Walleij
