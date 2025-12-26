Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352DACDED8E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 18:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4638410EC96;
	Fri, 26 Dec 2025 17:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZqnkZrNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F107D10EC96
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 17:39:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7BBC44446B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 17:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBA9C16AAE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766770749;
 bh=6YYD3NiqUlPmAWK3AUob9yBsMIUQ9l9NPJyzY09TdMU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZqnkZrNmLmHrfBVxCxN6OIroW+niaulJGCukAakLdpMQ+LeBvSHR54HOgGf1AJ73D
 7QsqjieLgkpeeaC49eN2lFwYwmDjG9b9RpUHDNcKHpKzfK3da+hDjxOK8wLp4YA5c3
 M++83WkLTv3BaQAclqaAyeurvfyOLw1gSpnNGDkEcExyBNkz+j2UWy/p3/UgQDV98M
 sCtUH43yPamhc4MCYuRKcyUA5Uue0TaTAFOcneXce5fhUGHceEPCqDs91FDMXWkj0Y
 142atF8N2wBsfBj133sNeu5Z3LEKQwfoBXXp42oDJA9SFTbruX1rJfzfdw+PejF7oI
 XZqA2iOLRtKcA==
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-6446fcddf2fso6393183d50.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 09:39:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX9HyoDzi0kVkKzwboQvOPUWUHFIX9TLQDCrLKO40oibDIziZzUdp+JuGFdbn/MGN+Z9lK2DjNAabc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK8BD5/OORbjCI8fIJxgm9rrV+wpxH7/XnsZ/yS9MI0iBBckvt
 5L1egviyhps4K2oOZ+4tA1GLoxWPz78VZHDNb0ABRUY38+NAjijTkeUL8Y3+0fDjgPwCh6hlg2m
 d42jWkZmBKca+kqZZtqM7bw1Pm5EkT/0=
X-Google-Smtp-Source: AGHT+IHDy1SKmnvKbma1fh9m1+utF49KXr4QUbHRtfTU7NPemr+5A9AZffJNUNAn7nR6cxtsV0Un4UOsG/jMcVJ2CTY=
X-Received: by 2002:a05:690e:1892:b0:646:5127:ad5d with SMTP id
 956f58d0204a3-6466a7af275mr19716876d50.0.1766770748432; Fri, 26 Dec 2025
 09:39:08 -0800 (PST)
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
 <CAD++jLmSev3=HJF1j_kTU5j-u2NhxH6TsdE0uUjnD7Vqkt_h-w@mail.gmail.com>
 <aU6QxjOphoq9E1pL@SoMainline.org>
In-Reply-To: <aU6QxjOphoq9E1pL@SoMainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 18:38:56 +0100
X-Gmail-Original-Message-ID: <CAD++jL=HDRAcwDVUeYUKFbamqVnOADqz5qpbSr1XVsr3M1iNoQ@mail.gmail.com>
X-Gm-Features: AQt7F2pJa8cOfkNvqcC-Brl9cfuKQJqQl4-oX9Rm5tlmkSxZYnCVZqaJuwCkEe4
Message-ID: <CAD++jL=HDRAcwDVUeYUKFbamqVnOADqz5qpbSr1XVsr3M1iNoQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] dt-bindings: display: panel: Describe Samsung
 SOFEF01-M DDIC
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
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

On Fri, Dec 26, 2025 at 2:48=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
> On 2025-12-26 14:25:04, Linus Walleij wrote:

> > They are clearly using the S0FEF01-M display controller.
>
> So you're implying or certain that these panel names here are always bund=
led
> with exactly the same controller (making the SOFEF01 part "redundant" in =
the
> compatible)?

Yes that's what I suspect.

See my comment in the driver that all s6e* panels are suspected to be
some s0fef00/1 variant.

> Also, divergence of the driver commands got significant with the last two=
 panels
> / three phones, though that might be down to vendor configuration/calibra=
tion.

That's kind of normal. The defaults suffice for a while, then engineers
want to start poking at different voltages to the display to improve
and tweak things.

Yours,
Linus Walleij
