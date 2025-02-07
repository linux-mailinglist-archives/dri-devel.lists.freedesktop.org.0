Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F9DA2CAA7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 18:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBFE10EB90;
	Fri,  7 Feb 2025 17:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eK4N7al7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEEC10EB90
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 17:59:32 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30229d5b229so22623711fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 09:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738951167; x=1739555967;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UAyA9k3gE8c5Mnrd0sbdTuF+3Mk11ZW10JEKEegQbhc=;
 b=eK4N7al7mLE9KyROSyZCfmmWc8nwGWy91PqJcUM7CmW/KNNx6r6cJeBv4OynDKcsxi
 MUPA0YNkRgcSXCcEpelqlcZdsxOIR3Bgnr1V3RlBunOVDRws8aaqmSpdgVThvqmKi23j
 QN4XPzN1JABVc74ZyaX/AuyweQnFGfBC5M0lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738951167; x=1739555967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UAyA9k3gE8c5Mnrd0sbdTuF+3Mk11ZW10JEKEegQbhc=;
 b=UkEdIDVz3359NFbROri+/esYCEAQ409lqEXiY2wjF3zni5EklAFDlDn9xy47nymPoX
 jTZqLa+gl+SawDmBsJBsf3nfzu/TeGe84I8jxjYHrni21SSsoz1KfmxIKEUpCX4LArQp
 3WOMoBb5FiOVHYLk1tmW5/fIj8XRW3kIyLpvjIPT2RKOsw4k/KoGeTtQ42Hi9NDt+4SZ
 AObuUrYb+DqG2aCd6mXf0tOy0iVgRxHMZI0nHD5GX59MurLEXxtHFUB37qA6AJduanL3
 EgiJj7Zd7pzFivy+ccau9c2TqMuhTr1ktzP3qjdZ3mLSwz77t3HvM8wbt699GAun4fGq
 JUTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQUSIXHwIdrqexWZ9UTMXqoOV+grHj4OmhPBvI8dATMVobGDMjg4H15e2cyu5BNZTM08InMTSSZjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytTBbWVzU0WSrco+vxMxBvuKKJKbxzmayHr52uqyY+VaToZjsm
 jk0dHJI3/hk0KtF2iyVK3Fu0Db9fXk++TJlAACyEP35uKCdzwFXhHG3KaSCspjzueXlsi86pI9n
 VtsKL
X-Gm-Gg: ASbGncs1tMc3W8Q8W15tSNeXhPegDca3JX0aJW4DInQG8Phydg9e1/YwllM/vfYbcHm
 WKMJUso5zfekC9HW0tcq+JkbeVYfAnSCexIFK+844Y5pd7biMxkfQEtYjTlaHTDryyEF+Qf4+WM
 aUIM+QTRNlmBXtRS19tgOVaOsYsprUE5clgbIhbYRp87pWblR2BkIZWyt9X4/woVekl9mVpTldK
 rgGuvqwtE+U9gY1T0/AHWUycsLq+urN24ON05pynN2inHNcD2WSY5JiXjRZJvu5xsJpYm+Oq3Kz
 D91A/8gJFuDBFj4wI+pD2g5wfDGQZFVa4sVlKszqEvotB+zXgXbSLHw=
X-Google-Smtp-Source: AGHT+IGsKNPi3cBqbrLZQOlLlUvk3Bb951f3G5m/QPjijoezTjv/xYIgCmyQexOS9rz7CqcNk3K9uA==
X-Received: by 2002:a05:651c:198e:b0:302:49ba:2550 with SMTP id
 38308e7fff4ca-307e580015bmr13719761fa.21.1738951167106; 
 Fri, 07 Feb 2025 09:59:27 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2f6aeesm5319911fa.110.2025.02.07.09.59.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 09:59:26 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-543e49a10f5so2606155e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 09:59:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWVGNgfMZyh9b9eJa40SygrXEL0AOoyA5oYQSZyIhXlc5jWKgkOZjFVq6Twyk6/gow6ltAHnocVrHY=@lists.freedesktop.org
X-Received: by 2002:a05:6512:4023:b0:542:98bb:5670 with SMTP id
 2adb3069b0e04-54414aa709dmr1057707e87.25.1738951165202; Fri, 07 Feb 2025
 09:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com>
 <20250206-uselessly-riverbank-14c097e62ae2@spud>
In-Reply-To: <20250206-uselessly-riverbank-14c097e62ae2@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 09:59:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UybUjCSqtk0-QvYc4GLY-J1=hLep9eCoPwB73psw4BeQ@mail.gmail.com>
X-Gm-Features: AWEUYZk_zCmx3_FAd9S6oDwQX9ETkP9z4pnHHk7HPMygPYUX8J-m_i6ND9efCG0
Message-ID: <CAD=FV=UybUjCSqtk0-QvYc4GLY-J1=hLep9eCoPwB73psw4BeQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add compatible for
 CSOT PNA957QT1-1
To: Conor Dooley <conor@kernel.org>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
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

On Thu, Feb 6, 2025 at 10:14=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Feb 06, 2025 at 09:12:59PM +0800, Langyan Ye wrote:
> > Add a new compatible for the panel CSOT PNA957QT1-1. This panel uses
> > HX83102 IC, so add the compatible to the hx83102 binding files.
> >
> > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Pushed to drm-misc-next with Conor's Ack:

[2/3] dt-bindings: display: panel: Add compatible for CSOT PNA957QT1-1
      commit: 36947218ca90c1f560f43c88c438124f8df884d4
