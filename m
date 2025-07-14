Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D47DB046C5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 19:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0085810E29D;
	Mon, 14 Jul 2025 17:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="V1fU6I0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB4B10E08E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 17:42:14 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2352400344aso42640265ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752514928; x=1753119728;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6hN8YccMgbb6UtBF/LeELrVcLJIBR2bmzofizaUxZUo=;
 b=V1fU6I0XNchFdnupx2R8LBwGfbGxetAhbgZzeF8Sh6pU6oGVLWno4ngBvqenTygMCI
 ayW+EIdoKBOezGu+wrweoNyZxb3I+CWmw5Moy/vWu7z7Hdicej9wW20rH+YaXy/1LN2q
 TSxKyuMT3uYQVgqNvljrH7zIou5FH0AW0xyHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752514928; x=1753119728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6hN8YccMgbb6UtBF/LeELrVcLJIBR2bmzofizaUxZUo=;
 b=iSDaYwfBob8JjO1tk3aJF9OxK2eJ36sOpGtVTPfgXrCg6Vq5NrN9m7EoXKvdYh7RUK
 NgTIpLxmON/HhCkIUyMGvEvDE9qSW/vs2tC5+ntkn/GfctbCIj7w2cSgJF9Mo2UdCn/l
 9PyRPcYdPtMsnka7cqqdFgyHuEGj2DgHu2XwbTy7gqvygCz4tMDpTJqkU606RhmL7t3x
 vvXW7UC+bR2TGzn9Jouin6oNjire5WZUSAcC83KbCmcvRZQRiUD9kvBi1yCtClSWvgIb
 M7cVLhgjmlFI4QslDTZTbyntzLLk16Wqj1qPsj7r1Vv3vOB9abHYjnE2a5nrdEN+HAtI
 eZyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyr2JyFVPXngG8ccB/l6SC4izBiz9x0iGIaeiL+BuAeGbev+RWc+aA0HiBBNI0YJRCmZOSsVJqKBQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDfi/LXMkjRreby59ha7yXzyE+W54BHt6VtOitg46S+dp+xvK6
 tO1+NTaizFIpEvaO5jQSRCMfnQY+1ok63jVszd7ppWsrXjCoFXMLeL+ruVnf9wYZBGUhfrkKB6f
 H2I4=
X-Gm-Gg: ASbGncu7ZD9ZFT9gpxsicP9cvYV1/Gx4OwNdFokLA00Y7MZync9Lrfb7Y8MYEi15phX
 JhGR1Bt9/VmgOzYwUEF7VTw7p6odgWN50s2N5mInLYmDTqcQBx9nGAYEwMexu709yIDlNO8cGoP
 UqKamTavteD40RRcmXBI/2HCOryr4WvLl1wre8PIOAdlMUML8x9eol8Gf5upJ1f/d3hYaJRVdOJ
 Zj+iDyTghHc1rESn8BbnLh4/xvIlUytzXQMOdX386M2hUemF7hy54FUUdxwyVxSamocWjGld0dK
 oLyG2Qe9xX3gw0mrOTC0Q0uIxQX08pc9+q3IMfZRg7NEWu3mGfh1uIyzuUfTdu+pNRdKnQBI1VP
 atspKIA17+PSgpewN4tjkuIHtLzzn/Df1JjCuyXzVomuE93n6hz/0UCiZzq1FIg==
X-Google-Smtp-Source: AGHT+IHoH0GBLTU7EftPfbIEk/ppIApHsH7/JPwjuO8jxK345TG2A1JbW+YtgPDMeR2j6UzfWyKqjw==
X-Received: by 2002:a17:902:da90:b0:235:e8da:8d1 with SMTP id
 d9443c01a7336-23df07d7a01mr173069085ad.8.1752514928299; 
 Mon, 14 Jul 2025 10:42:08 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com.
 [209.85.216.48]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de42ad295sm96037475ad.81.2025.07.14.10.42.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 10:42:06 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-3122368d7c4so3806979a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:42:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVwfn4X6to+zxumXd8bgmietcUGgtxmpWWYzytPiYL1Zu1xmwTxTydwvVm0pCg5EaWURRd2FpLJVr4=@lists.freedesktop.org
X-Received: by 2002:a17:90b:33d1:b0:31c:15d9:8a8 with SMTP id
 98e67ed59e1d1-31c50d5dfc7mr17730062a91.1.1752514925305; Mon, 14 Jul 2025
 10:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-3-daleyo@gmail.com>
In-Reply-To: <20250714173554.14223-3-daleyo@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 10:41:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8Z8Vq_XP=n_YGh2Junj3N4nWwdU7PeWWt323wsonL+w@mail.gmail.com>
X-Gm-Features: Ac12FXwYxUojKbVSCKrTAuLidZaZV_hTeWFSLtqTJMBGCZSvoJjYkTTdNAw6f-M
Message-ID: <CAD=FV=V8Z8Vq_XP=n_YGh2Junj3N4nWwdU7PeWWt323wsonL+w@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: display: panel: samsung,atna30dw01:
 document ATNA30DW01
To: Dale Whinham <daleyo@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>, 
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

Hi,

On Mon, Jul 14, 2025 at 10:36=E2=80=AFAM Dale Whinham <daleyo@gmail.com> wr=
ote:
>
> The Samsung ATNA30DW01 panel is a 13" AMOLED eDP panel. It is similar to
> the ATNA33XC20 except that it is smaller and has a higher resolution.
>
> Tested-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
