Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E2BAC54B1
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 19:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE1310E18F;
	Tue, 27 May 2025 17:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FA7Obeek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E83810E18F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 17:02:56 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7fd581c2bf4so2062553a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1748365374; x=1748970174;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i1cD0wSUoGRAfow7hZRrSlocwlqH/rpj2EVVATTYGe4=;
 b=FA7Obeekr1EaNzQ2IdgVsMLKGp7Iy5L2mxE1C5487a/cshTiXrn0NP9bYON01kuL4+
 oQqtK/jfZNIA8t+Qls73Jb8mNiusiwlWfhOXULybbxJ7JgEwmSC+EmB87h5kmxjjqE15
 QGixkNKZFjNeeHFHygqszqq8Y9Z0kVzfLPJ8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748365374; x=1748970174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i1cD0wSUoGRAfow7hZRrSlocwlqH/rpj2EVVATTYGe4=;
 b=OQjkW7QfG31di6IMvJjVx9PvgUo7dWUeCMab6z57u4EVCFNlNYvQVvy49ooMufl10m
 7ixnJoOrB66elijp4xlVuuLEvxIOpfrMozI0GTBoFTXPXKOPJJURc+Ndw1tU/s9KdHL7
 UjZ1mfKzV/Sz731TF7XhvDmaJ4tsbB/OUQIR/h0/YO4pakFBWpCdGbg9QwVRTSuUJaTj
 D6G1Cq+LDMTw+SoKm3N3iCh7rx25UYrZsSAmBCEafysqqIkUn67AYBK8obED34xLUyIA
 E+yJVm/0nJ/dU5T7FLOMPp2bVGNUdcv6eWHcgdgG2SbXZMPp4GK1z7XEJD6BYEGA5Zv+
 eS5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdvRUZxAh65p78vhIKWjpnt7p5KtdIqv4NswO4AoaKzNi63whxEYuxhLrHtb+M8Kjcq2t54X2hSHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR31VwLBQRibT7kHB3ACuu5dkt8nRt9SBIvuaFQcXkfcyyI7SB
 ZgOe4McEMoGHF8F1OlVOSBuSpoDHBx2+h3qV3Y86kdyJpvFz9NjJq30aKPdu/kxyeh7bdvGVy7h
 jK7Y=
X-Gm-Gg: ASbGnct4+hozK14ZMwaRQ72fG+JcTDN0FyJ4Uk1iTBwNFSXkaXZmVh7Bdvv8b/wKWXL
 mHavnRgBz1Eur26QIzIHHD24qrtS8UiFLIrr6QTYg7FNYpV4qNXf32OUWe76nApafZvFF7LfAkf
 GO0NjLE9/ZdwlcUOoryv18TpzGjBxC1V8wLxzq08kYLbrMyfNEFA2MODIiZvORh77c5XQwVZbzd
 fDjbP2z+f3wJQflbeIddrBlh50WsTF3zL8yDY6KOXRkHIqLwl2G6NWbd2g/xLwM0iOe1vMLj9Rg
 npYTI9DK6+1haE9ZnhN9BXuXzNFhzmRKngqhVDgFq7v71MCwjSU+WXQKAdix++kmNXV4xhN1PHD
 z7dbfI1wJTfrAYmPOpWA=
X-Google-Smtp-Source: AGHT+IEBONgBbnw203hYwrcdkNHnhXljDuGOzVTOEiFU81agR3kXDqDIwsE9FvpEHj7XPD6xaUZpMA==
X-Received: by 2002:a17:90a:d60e:b0:30c:540b:9ba with SMTP id
 98e67ed59e1d1-3110f0f9b4cmr23039341a91.10.1748365374033; 
 Tue, 27 May 2025 10:02:54 -0700 (PDT)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com.
 [209.85.215.171]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f365b22a9sm14469686a91.6.2025.05.27.10.02.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 10:02:53 -0700 (PDT)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b2c384b2945so1374491a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 10:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1eeMwWrg17uDkpZxEHQRCmYQcHXCO6ukHYZBGg5pgG0Gz8AtbEtZjrKIOCen/BAO64IBIylmbbcw=@lists.freedesktop.org
X-Received: by 2002:a17:90a:d60e:b0:30c:540b:9ba with SMTP id
 98e67ed59e1d1-3110f0f9b4cmr23039125a91.10.1748365371916; Tue, 27 May 2025
 10:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-2-2c1e6018d3f0@oldschoolsolutions.biz>
In-Reply-To: <20250524-tb16-dt-v4-2-2c1e6018d3f0@oldschoolsolutions.biz>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 May 2025 10:02:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1-xhzWjftAkSiwTR5AE=2nGxFSaiv18_KXFJkKL1USQ@mail.gmail.com>
X-Gm-Features: AX0GCFuyCqgo7k3OkEiBoeoIIm92d204Z5xqTgDrr1m_iEfNQkkSSlBFML6TL54
Message-ID: <CAD=FV=V1-xhzWjftAkSiwTR5AE=2nGxFSaiv18_KXFJkKL1USQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/panel-edp: add N160JCE-ELL CMN panel for
 Lenovo Thinkbook 16
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Sat, May 24, 2025 at 4:48=E2=80=AFAM Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Panel is widely used in 16" laptops, and also in my Thinkbook 16 G7 QOY.
>
> CMN N160JCE-ELL EDID
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0d ae 2b 16 00 00 00 00
> 20 20 01 04 a5 22 16 78 03 28 65 97 59 54 8e 27
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
> a6 00 58 d7 10 00 00 18 35 30 80 a0 70 b0 24 40
> 30 20 a6 00 58 d7 10 00 00 18 00 00 00 fd 00 28
> 3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 31 36 30 4a 43 45 2d 45 4c 4c 0a 20 00 95
>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[2/5] drm/panel-edp: add N160JCE-ELL CMN panel for Lenovo Thinkbook 16
      commit: 126bf397bf58485cdd631824190cdcfeb86f5d9b
