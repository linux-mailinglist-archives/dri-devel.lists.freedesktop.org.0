Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3A2B89FCE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E044610EA1E;
	Fri, 19 Sep 2025 14:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JUk7sGcP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E694110EA1E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:33:35 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-26058a9e3b5so16576685ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758292415; x=1758897215;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y2gym8TYp/ovo8G/55zCJFXd/aU/zbsFHKBPG4aVbvE=;
 b=JUk7sGcPWnTOR851C5NcqbyVj8fdxiPZo7ksAOdNjV1PeE9mNY5wKk059pScF6+hfn
 bL2huLLMuLvG2F5sTEO/uOylFYGGaBWSBu1W7s3AjRNQ/ZDt83Pfj/dOV1cPwCqx9oJE
 PfRvJSn5BXRZn4s/RHB2XlF3qcnuruhh8SG7a1jOdD24ypNJOZrSTgB/1TRQsV8YSj7e
 qWYqCbnUb/qXrvCq1X/vq/mj814Vyl041l7v+wZUgCdw+1Id1SenYQ7Dl0Zx/ZxaKyvg
 SB+VWafa8WCm6bV3QB/fwmt4gba/Cn55J/oX6UypQdLSMTxuMMUyj1qd8lvsUZOoLZgx
 rmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758292415; x=1758897215;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y2gym8TYp/ovo8G/55zCJFXd/aU/zbsFHKBPG4aVbvE=;
 b=sUO3naUMxfHQO4S0plizuQQTFo1qAe4D65oEJO54V3lU8bEspgkhT+ETwePw7JJNij
 EXCAvkGRw4tudVm4MzPAXtgnfTjpqPES66MAyEmxXSUsX2H9aGz0eDsz6FTMfz6cu/JT
 I7+X2+kGjcy65FAuBGe2xWwMXug0Yc0/YvKmZb3JpB2SN3L2p9hE+Cgd813QgYX2AsQ4
 /O8H017FLY0FQzYltKUqpRVd/QbvJn3VjKKfnhg936uJ3TDM/f5LvEs0j+qs5n/sf8PI
 pIJd2u8DCKVoqJ/QI/5kqKC7ZBF/7y4y8ozBZgJ5UIxg1X/iAeD5EzMy/spbRgUS4TGX
 MM+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp2djQmuj9tzZUejQtp9vv8TX692K8Me1Bo35Y8KBKEMryLr3QSWOwamFM97fphCPvqUMrHjfdSDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmcTe4OEjG+qEt6Eo8J7Xy61ZGLMawkBBtcI7d2onl1XSvDtiQ
 bUtLuiY+fRoXznRjdDakNLF1nYFESlGemmmIPWoedOneoK9NzY4Qr7Q9TANovLQXr77/v8+V3ZK
 PciC7OtkG141VVnJKB7k5EDztUe7obcNXEf14EPRO
X-Gm-Gg: ASbGncsoFoK00zOe4uZVQu9ZghZGl7GNYca6yX5/J9ajHpVmLBku+jQnkqNPXSLUBsx
 ZKrQSZdu09hNZD6+PJ81vZ/dsK+RjbM8m1AlgxTiar5bmOyvwFlg5WHUlmw01JmQh7VvDbpsPzJ
 mnHR4FKfEiZQsb87su6bNoeZk/Lc6sezap++2ed9efwC0w15UksOqHqsP6Fxo4qYv8bxjniKPTE
 Uv/OKTbStQPV1O5URWvueE4pnHqMW38AMNVpmPgfRz3b7g=
X-Google-Smtp-Source: AGHT+IGoZM0jnVTt1Y2CJHZqnYGBoUxj4B49GMuB7/9WxT3I0dZXKe1ddSPAgfCVn0IDJ7MGh4cZz1erCcimfhFsdfE=
X-Received: by 2002:a17:902:e787:b0:269:9a71:dc4a with SMTP id
 d9443c01a7336-269ba562469mr40478525ad.41.1758292414956; Fri, 19 Sep 2025
 07:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250919111101.2955536-1-yanzhijian@huaqin.corp-partner.google.com>
In-Reply-To: <20250919111101.2955536-1-yanzhijian@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 19 Sep 2025 07:33:23 -0700
X-Gm-Features: AS18NWD7sjIWHslodAybxfuXYKhfB9xyIPTlMG3JfDBvZbYFN3An-yBQPnL5d3I
Message-ID: <CAD=FV=VDChmUn50S7FKUumEDXZS-S4YZyyV4B1-HiHAiiDEn8A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add support for KD116N3730A12
To: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
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

Hi,

On Fri, Sep 19, 2025 at 4:11=E2=80=AFAM Zhijian Yan
<yanzhijian@huaqin.corp-partner.google.com> wrote:
>
> Add panel driver support for the KD116N3730A12 eDP panel.
> This includes initialization sequence and compatible string, the
> enable timimg required 50ms.
>
> KD116N3730A12:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 2c 83 97 03 00 00 00 00
> 02 23 01 04 95 1a 0e 78 03 3a 75 9b 5d 5b 96 28
> 19 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
> 36 00 00 90 10 00 00 1a 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
> 00 4b 44 31 31 36 4e 33 37 33 30 41 31 32 00 a9
>
> Signed-off-by: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel: Add support for KD116N3730A12
      commit: 048deed5faf012c6ecf6057ddf1340c41f69fdb0
