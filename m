Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7707EA2CAA9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 18:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF62810E1A6;
	Fri,  7 Feb 2025 17:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TS+OQnGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C328010EB98
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 17:59:48 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30613802a59so25533941fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 09:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738951184; x=1739555984;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7PwmuaIBJ/10qYXXlbzfefJdtGyrGJpw93xkGEeBXLI=;
 b=TS+OQnGvF4FcCQA0qYeeXrQ/bigkk+nhc7qX2/gjYwRBBPlbFwRFpHBoNNn+Wx2g3+
 iHKJbbzrAd8YE/Kze9p7X69TXUuvGlvdHWqA5PWf8dKAPwLmz+MIkMY10mBwXHng9qwi
 WUdY0lnJekjX/xxxkmAlstDNfEZatdQqskHYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738951184; x=1739555984;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7PwmuaIBJ/10qYXXlbzfefJdtGyrGJpw93xkGEeBXLI=;
 b=hF7KunQANdGjVGKgP7pw5rPpiSsmdPHeaf2sTdAtM6lG916IT1IPfokBCtFO18ymKJ
 N0VCyinjuVs+hdZIQ4ffXNadOoQ3qfyxQY7RrgCdhwbyPxFaMfY1+9rQ8mnXTWxVW+MJ
 EVLOAKfcc7IExCruCbgZz/m0WPhiIf2FpedWA+KGzAAdlIKNz13E3S+RgGJAbDd1Dwp5
 EvAVkGxypAMpeS8ipfAiS09dbRQREfChONJI6PJ1aLR8h9YYK9xbQR2rxuegygNr5XH/
 e6f4g6/S2pP4ZjhD/BiPxdKVZhrXh3Tc6nZ4kShiqeoc45BivJrDAy73Uz5dZyvtxAza
 Fpfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoZI4YSjwNFrdLjCsK/X1Zc6BGnu9uaKDK6Ac2545LjKGJATIJff0wLFsHt3ykiIVXBqjnwVase0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkjGPBkAW52CicEBQm8gL2bJULbY57uA1SRq6QrsSFXeY73wmM
 nsmrozfsmFIDeKwpi1SOQd4+Ktb9Uh7B0odwq4Cf81lBud+SkTYVaFNwhBo5w8zMFZ/ThfJ4vKJ
 pcuDL
X-Gm-Gg: ASbGncsoK3rOAeEm/HWcjzqeIw/ItlAscVIo9F2qvSKix1nxPyI/FyQSk68yyjiLiJ/
 KJye8f0tTJA+sHkGCI5IGdbl6bM4aPJRsTbCHJzwXzAMPooBvL/2fnxorsSMuB1msvyN0nWt1Q9
 ph6AdeEi3g5kTNKWgc6I0h1AyXIGFMgE6azErJ9S8/7CPlbmUF7h6TsxP6AILLGmMU+JOgsEgyv
 zGvVl160JBJk0Y4fV3hcDTH5t1pMfeI/gprcmRPyI9V1Hg/zVDCAq77RetxyIaodFF9/36oHagC
 yKuC5ZND/Dt4zV2U5ceYO0Tbo7rl7VS+OqB4Owf0suPNTZ+uwnGCniw=
X-Google-Smtp-Source: AGHT+IG9kYJpUK7lwamniW9r/sKKnBwtKuws1PO1YAFwmA88x1jWYQGuhVzjU0vOmQ9dO4EPkDU+qw==
X-Received: by 2002:a2e:a545:0:b0:300:3a15:8f23 with SMTP id
 38308e7fff4ca-307e57bc496mr12432161fa.7.1738951184236; 
 Fri, 07 Feb 2025 09:59:44 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de1c7a61sm5154901fa.64.2025.02.07.09.59.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 09:59:43 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54410d769f7so2272952e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 09:59:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhYKqDUy4E8OYRtGu7hjzgIANbEpV7FDBTHluTDnGkMqCkw/pXamoPf4AK13s1zWt3xdpNAuncU50=@lists.freedesktop.org
X-Received: by 2002:a05:6512:b8a:b0:542:6105:bb72 with SMTP id
 2adb3069b0e04-54414a9cbc3mr1362214e87.19.1738951182378; Fri, 07 Feb 2025
 09:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-4-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250206131300.1295111-4-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 09:59:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xe90b6x4JF716=O==U3US-vONovcvDm0yfOconkFRPcg@mail.gmail.com>
X-Gm-Features: AWEUYZnN1bml-NA4ebUvH8W9aveGL3aSVmaC8yx15fMw7Kdh-ZCSTxHkG5ADkjk
Message-ID: <CAD=FV=Xe90b6x4JF716=O==U3US-vONovcvDm0yfOconkFRPcg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: panel-himax-hx83102: support for
 csot-pna957qt1-1 MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
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

On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> The csot-pna957qt1-1 is a 10.95" TFT panel. The MIPI controller on this
> panel is the same as the other panels here, so add this panel to this
> driver.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 123 ++++++++++++++++++++
>  1 file changed, 123 insertions(+)

Pushed to drm-misc-next:

[3/3] drm/panel: panel-himax-hx83102: support for csot-pna957qt1-1
MIPI-DSI panel
      commit: 05345cea4ff5a857612df3f10144dec685c07e6d
