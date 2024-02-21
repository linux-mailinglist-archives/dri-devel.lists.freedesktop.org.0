Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1B85ED65
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 00:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743A810E841;
	Wed, 21 Feb 2024 23:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h6lhgayA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F5410E841
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 23:50:46 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso4888340276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 15:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708559445; x=1709164245; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dRyWhwvB+YgxB8WYY/8RDhojBr0l/X72f+I+EDyaksA=;
 b=h6lhgayA3Mf0xg51KT9zmdVH949PnTB3NmOCkUFsuB2Qpw2dv2D7j/qXr+BgXD83Cj
 1THFV5fb1zZrhrBjJgUvUrSc3asSh1t0kmfz9FHNO5cTd3vMyF8i7krbFg7axZbHuhwe
 eS/E0y+nz/uKhZ0+fAWxf5R/L4qbrsKsrph4uZ3gS38RsfQsfMYRENJEpL49VflHuaXn
 +xxIa6ryUfjkZcQHqDJCRYmmdwjuFCPYLC0pXWYUNhQDoTgu+dBPftA+jlLxtt5K64Oy
 l6mYRyfm7r7OiXUt5IvMSD5r9XfGtwjf2B5N2RYmH0hci23whjWl0stZRr1XBOc6jagQ
 j0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708559445; x=1709164245;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dRyWhwvB+YgxB8WYY/8RDhojBr0l/X72f+I+EDyaksA=;
 b=Es62dlY/tuN6O+rOmXXZT6zdDjMxz6/vkaI+ZnOwAED+YJBVrl0oSZg0kUUdvTaMDh
 OiYJYjA/vNHThdKAQJpVUfGICQTaLA+9QrqwGGMjERpIMvQ13y+bSefLwh++TsHMZ7wW
 ZQnEHuKmpI1ryQdquHSoZY3+oDkgG4rSubQOwTZV+5Q9gLA2Y2TcHxc++MMi6hOOR2Pa
 OWbNjN6KgZyS3ZJYXX2tuqpoYqQeCYWe0bK6MYW2EykVXqiyjVOo0Mg2R799L3M1SNt5
 j7ogNn/fM0XoUrZ/atQyHjcpz2HY7WmM38DgXShGlOPB3ScoqNfijnZG1gHc8nFUHev9
 fPrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZVbqGm6UqKUgZtcqyUfEqqecTNu+7n4942H2HfJJUh5YBYsjhgrO6qQdSTI9OX46pwZY+5EsFDRxANixHAtGx1pP4SK+RsYqKBmLH7/pq
X-Gm-Message-State: AOJu0Yzb6QQCxPCPeCGCqboNNyY8YcrTLtm4uF4rkmwbzo1gxZYcukKa
 6pfzQSSzo9JYftjiIHSXfOiXP7fHDAOLraOCXZ/o3C/udl56HTSac4S1qpy6sVM/DnhsaURzg5z
 CuBpa9PClzW9vcvuB/Ep9mXdZUwuDmkr5oCPWFw==
X-Google-Smtp-Source: AGHT+IHU3Y06Sp27kn+vm0riOHx7jAbAYGiCMmYl9aItPwEeAoJ6loAk6SaQpv3mn4p+wcmpr6CrNg3BZNb7xYkUQRU=
X-Received: by 2002:a25:8d01:0:b0:dc6:c2b2:c039 with SMTP id
 n1-20020a258d01000000b00dc6c2b2c039mr882350ybl.41.1708559445157; Wed, 21 Feb
 2024 15:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-7-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-7-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:50:34 +0200
Message-ID: <CAA8EJpq=kFhdqbnLXLLdQ3AkYb=vNOzjn1hMoNJx8qEJ4FLx-Q@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: qcom: qcs6490-rb3gen2: Introduce USB
 redriver
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> The RB3gen2 has a USB redriver on APPS_I2C, enable the bus and introduce
> the redriver. The plumbing with other components is kept separate for
> clarity.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry
