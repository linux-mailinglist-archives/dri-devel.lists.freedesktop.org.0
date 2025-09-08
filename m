Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CCBB4949C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 18:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FA110E17E;
	Mon,  8 Sep 2025 16:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="coqkE+gC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029DE10E17E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 16:01:14 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2570bf6050bso7336845ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757347273; x=1757952073;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XDUqzdcg17KtqKCQYpEmkhfy4yLIsN7gEnd2+8GZlgk=;
 b=coqkE+gCP3G0un1FCZYYNm8iY3JlR3KNNkikExhaqRiS9PBjrpDLbIHyJdthKNCxAc
 cqc+/Q8ZXS9jSbpTw/YdHlH9yBmqiQcuFtw/orKT84Ab8K+j+KwTR/NkWcHTUsMNhvRN
 2toZOOoOPCnsdfzJBzcdvL8fbTsGaywmK4TK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757347273; x=1757952073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDUqzdcg17KtqKCQYpEmkhfy4yLIsN7gEnd2+8GZlgk=;
 b=HChxIeqcsgcISkJOAbIzduFyt/hTbE24kpWYGaBbHo/w4KKQ6DCpwvYIqkhntOkMsY
 EVl5Ms74tz/ACBVWyZO5P2S0Ta14xaZDJwRAEM4nW35FZLKXGOtBJwdDxDabz/0dbH1N
 ZaRUvZNi+QM+CNy18WefkGvQu9gEPoK0ajIryj2aTK7OGdkOEORAHSIkl7f5HW5vcr6i
 r+1T+Q/IvAGSvUzGRn0cIPsluBIW297gwuw9AY7nI0CTspuRHoOVlDCMX35ihV0kRd6E
 6abQCxp0XCsfdEeH0MLArwXD7/i6EqcSE+FjoFMG2da0gMR4V0fX/W4CyjwwNHSx+GWi
 UsjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0P+D57g5Yi5xG3SBiDMxLIB/ZKGKUbzTS4OtbHcDFSmtEQfsKpfbd6+OhaV0Zs5yLPPoba4n4hoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSTAO5JgfacoEHNLW8IDj/ccEx64vSF2EjXfcGKhfeacRmBGY8
 WNuaihVesZkerhR1JRKRu/EmKbCWJgTTOQGtBcsEJoJ0/MtHgqcGQm8Z+AhF4XiKA55qnnBGYN0
 /B4Y=
X-Gm-Gg: ASbGnctGfVXM2UCFuLp2BIsr+bc4GuR4m7QDVg2SnhQIoOXhAlp9Vn/Se25H+TV3FJX
 EcvJcw1hq2jLoV+7Ihs/HRPrY6xCKwOzbSfQEkl3lrG34Td7nXMQfD8BzCm5gfQgR98jDsQ0P5a
 CotnPICH5Qx0zz/ypf5N8lzB39AGW++Y+WoW5ta+VUeQwMHwgurmIUPEPClJ2QKu3avWAS2uA6b
 vHzVBxnBqobP/BCOwqwiIV0vgV3wnH1XL6Zeqcy4ufEskU+KXq/G7Ax9t1DxW++rF9UPi4veS3u
 jO1gqOaBbgsmOUQ31u/u+wNVUmuZED0GXt/P4gyFhsF1oF/xkyJfhmLM8a+8OLgySJLWVl6RAAO
 otI9FJez/FeyRo1rgNCwbV0/NhZEek1pfxFsl5auX7fE+PYs3aXzQr+qKeSbYZCwhHnrkGDriDE
 wp
X-Google-Smtp-Source: AGHT+IFqd4FrKSJWS8dh4vAu9CmXpbQJEeYeHmHdXtkw2NogBFafmZYehzcP1T9q9y/qZPJDZuHNvw==
X-Received: by 2002:a17:903:40c5:b0:249:308:353 with SMTP id
 d9443c01a7336-25173ea19fbmr104250975ad.41.1757347272611; 
 Mon, 08 Sep 2025 09:01:12 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com.
 [209.85.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24c8e94b34esm148745295ad.94.2025.09.08.09.01.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 09:01:11 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-244582738b5so37976035ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:01:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXldJPkiowQ9qqx0I0FM8inbR45WcrVnHnPfXnOlm9eISYLI7cCW+s0thQq7oMRP4sp5oCCM7vw/KQ=@lists.freedesktop.org
X-Received: by 2002:a17:902:ec8e:b0:24c:cca1:7cfc with SMTP id
 d9443c01a7336-251761680f7mr126471995ad.59.1757347269705; Mon, 08 Sep 2025
 09:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250908063732.764289-1-wuzhongtian@huaqin.corp-partner.google.com>
In-Reply-To: <20250908063732.764289-1-wuzhongtian@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Sep 2025 09:00:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U5CYQ8x7jya6y=eqEY4Zi87unrRTKfexEahVeBXMD5yA@mail.gmail.com>
X-Gm-Features: Ac12FXxPVHg-eiaA8fURwy48KzU3M4U1RJrwAg8wF2uEv9ufhRs9yYWmoT3IaoQ
Message-ID: <CAD=FV=U5CYQ8x7jya6y=eqEY4Zi87unrRTKfexEahVeBXMD5yA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel-edp: Add 4 more panels needed by mt8189
 Chromebooks
To: Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Sun, Sep 7, 2025 at 11:37=E2=80=AFPM Zhongtian Wu
<wuzhongtian@huaqin.corp-partner.google.com> wrote:
>
> Add a few generic edp panels used by mt8189 chromebooks. For
> BOE-NV140WUM-N44 , the enable timing required 80ms. For
> CSW-MNE007QB3-1, the hpd_absent timing rquired 80ms, the enable timing
> required 50ms, the disable timing required 50ms. For CSW-MNE007QS3-6,
> the enable timing required 50ms. For CMN-N140JCA-ELK, the enable timing
> required 80ms and disable timing required 50ms.
>
> BOE NV140WUM-N44 V8.2
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 09 e5 6a 0a 00 00 00 00
> 2e 20 01 04 a5 1e 13 78 03 fb f5 96 5d 5a 91 29
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 61 40 80 04 71 b0 3c 40 30 20
> 36 00 2d bc 10 00 00 1a 81 33 80 04 71 b0 3c 40
> 30 20 36 00 2d bc 10 00 00 1a 00 00 00 fd 00 28
> 3c 4c 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 34 30 57 55 4d 2d 4e 34 34 0a 01 7c
>
> 02 03 0d 00 68 1a 00 00 01 01 28 3c 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 06
>
> CSW MNE007QB3-1:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0e 77 6e 14 00 00 00 00
> 00 23 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
> 36 00 2d bc 10 00 00 18 2b 30 80 a0 70 b0 23 40
> 30 20 36 00 2d bc 10 00 00 18 00 00 00 fd 00 28
> 3c 4a 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4d 4e 45 30 30 37 51 42 33 2d 31 0a 20 01 69
>
> 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> 00 3d 8a 54 cd a4 99 66 62 0f 02 45 54 40 5e 40
> 5e 00 44 12 78 2e 00 06 00 44 40 5e 40 5e 81 00
> 20 74 1a 00 00 03 01 28 3c 00 00 00 00 00 00 3c
> 00 00 00 00 8d 00 e3 05 04 00 e6 06 01 00 60 60
> ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 68 90
>
> CSW MNE007QS3-6:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0e 77 3f 14 00 00 00 00
> 00 22 01 04 a5 1e 13 78 03 2c c5 94 5c 59 95 29
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ea 3d 80 c8 70 b0 2e 40 30 20
> 36 00 2e bd 10 00 00 1a 88 31 80 c8 70 b0 2e 40
> 30 20 36 00 2e bd 10 00 00 1a 00 00 00 fd 00 28
> 3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4d 4e 45 30 30 37 51 53 33 2d 36 0a 20 01 80
>
> 70 20 79 02 00 81 00 14 74 1a 00 00 03 01 28 3c
> 00 00 00 00 00 00 3c 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9e 90
>
> CMN N140JCA-ELK:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0d ae 41 14 00 00 00 00
> 25 21 01 04 a5 1e 13 78 03 28 65 97 59 54 8e 27
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
> a6 00 2d bc 10 00 00 18 35 30 80 a0 70 b0 24 40
> 30 20 a6 00 2d bc 10 00 00 18 00 00 00 fd 00 28
> 3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 31 34 30 4a 43 41 2d 45 4c 4b 0a 20 01 14
>
> 02 03 0d 00 68 1a 00 00 01 01 28 3c 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 06
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>

Note that I hadn't actually provided my Reviewed-by tag on your
previous version, so you shouldn't have included it here. Even if I
responded to the patch, the Reviewed-by tag means that I've happy with
it and I did not provide that on your previous version.

...in this particular case it turns out that I _am_ happy with the
current version, but you should have still let me say that and not
added the tag yourself...

...hmmm, and then I tried to apply your patch and it didn't apply
cleanly. :( Please post your patches for edp-panel against
drm-misc-next. This makes it so I don't need to manually fix things
up... I've fixed it up myself this time, but next time I'll ask you to
send a new version.

In any case, I've gone ahead and pushed it to drm-misc-next:


[1/1] drm/panel-edp: Add 4 more panels needed by mt8189 Chromebooks
      commit: 490b30fbaca2abbd6afa8bdc7e2df329b5d82412
