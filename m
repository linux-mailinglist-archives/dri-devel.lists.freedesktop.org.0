Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA73CCFFE5C
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 21:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7143A10E65B;
	Wed,  7 Jan 2026 20:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C92jH3rN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DDE10E5E4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 20:01:32 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-78fcb465733so27729267b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 12:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767816092; x=1768420892; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bw1dDqtzxhWwWEi8xX5ZmaE/Mztn8IdFjmib1q0cdJY=;
 b=C92jH3rNpiTRcDuYLvDB0CztAeCV9rsSun2FH+iOulKteRc9IN8nW6T3RW+TP+YI25
 zThI/XUVXLZh9IY04070wDw85M2/6yQzGJn8UwT2/s03KgCQQFQ+iqLOevP1wQVQLf/N
 57pSeZMyOZhL7d4Xi8OtJkHlImBgqcxlwMHwdL8/Ve1ngzYPpLv8yfOjznxncT63hi0l
 p42XRD2o1SrQswrpkoKnKaxyCNlIt6t6QtGsaGk9xNZBF11nk0+nLHTdnbPVs1IJy4nJ
 2JxuExfeHFG9uLoNRwGF9B51CgMo4GLct66ynoHKYa3qvFxLJW9lpXQLI+DaMsHFgSq1
 sQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816092; x=1768420892;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bw1dDqtzxhWwWEi8xX5ZmaE/Mztn8IdFjmib1q0cdJY=;
 b=NB7uz5MGCM71WhRZ3OHfjP5S/6MsrtzuMTEQMzTy4Ad/sDG/oeu9RkrsroWwRCqldM
 voJd6yVwvE9WFDYuTbJ+Fi8StLW3dZ+O9fIN75yRCy3oOlOjP2qcIWhbSX7uBoaBxFbN
 iyYFTjPIbY7U03wA2ORvUKDwem7ybrxsagDEc5kjLz1Np9xClbCKf0SoIC+Z+uL8AL43
 vwz8m6B/GXeStwwUQlRpG86kKxLzkatbc8RPxBLyGhSilwccJXiqiMi5AWa0fkyNin9n
 BpvJoxA0TBaGPV4ur1wjGrfGhTsh7v50ekZ6nJtPpDbOZ/S1CO39n0gceMCbolps5iK4
 JL4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEcfrujI7zvF9DoRioqSRYUc8E5oAN4R5Hj17hZmkfToY47LBZEnbqi1ps4CKeR1rdqMUe6I+4xS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkTryGShxtLs26qSElQyxnYtYoZ9EiGwvisjLbskzrM7kjVucF
 LvgMGTNl8e9R64ceH+NjVxnDP+EjS/8E4AfiFwt3SLpwAEiWvfuVd9AzuxTr5yD9BBYZWu1VQea
 8xRLKYI5PUd1N3mP0Lm86XRXDJCDDM0k=
X-Gm-Gg: AY/fxX6xIHb7RE5OP4yG99VPIBm8fWc3i/XgOGmF/ooU50tOcWIythg+Q82MwHR/bMS
 rngoxxIUUH+4ntXIpriTov9EffjkLOEwWyxwNc0PwAqxwJrENHfSubUhs74NnCg+fxsklpnYSI1
 HV01t33i1obqeWu4/HgiBgYphoRBcAuxNW4ig1GAS7Urssvjspn8LqcjHI+txEUwmf0VB0vwgD/
 OdcNBxEWsIyGVkpS+qvhJsh7cLWUfa6o6vnzeTcpWqpkvvBo/e1X2d6IIcz8MVFGO0dneN2muja
 p16i0To3ciQ0FypEGMTE65tvqdHuUw==
X-Google-Smtp-Source: AGHT+IGvHXnVPwLtk2AfaYjIl3ufVpWEoMzjf05Wlyvun5/WGBAyf6b3AZpMO0jrqG+zCakLOjQyoYGCFgMnaCLej7U=
X-Received: by 2002:a53:eac7:0:b0:63f:b5a5:37c with SMTP id
 956f58d0204a3-64716bbb65dmr2504318d50.2.1767816091690; Wed, 07 Jan 2026
 12:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
In-Reply-To: <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Wed, 7 Jan 2026 21:01:20 +0100
X-Gm-Features: AQt7F2o4QulUaJZZRb2rNrPuwYD0wKGX8_-w5ECTaHV1w_JbEvoPR6OEd3x_uPI
Message-ID: <CAFZQkGxdizG15chbehb-TGfBy4yL4NRy7GVD1b51mASmRG+0sA@mail.gmail.com>
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
To: Shengyu Qu <wiagn233@outlook.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, daniels@collabora.com, 
 ariel.dalessandro@collabora.com, kernel@collabora.com
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

Am Mo., 29. Dez. 2025 um 19:53 Uhr schrieb Shengyu Qu <wiagn233@outlook.com>:
> > The curves supported by Gamma are:
> > * scRGB
> > * BT.709
> > * BT.2020
> > * HLG
> >
> > Given the lack of support for writeback connectors on the MediaTek KMS
> > driver, combined with limited hardware documentation, I haven't been
> > able to verify the correctness of each curve, only that they were
> > visually sane (gamma curves made the image on the display brighter,
> > while inverse gamma made it darker).
>
> Hmmm I don't think this is acceptable. sRGB/scRGB has two transfer
> functions mentioned in original specification[1]. To keep color
> accuracy, we need someone from mediatek confirm whether this is
> piece-wise or pure power 2.2 transfer function, this is already done in
> original amdgpu color pipeline series, sRGB means piece-wise while also
> dedicated power 2.2 function exists.
scRGB is a different specification from sRGB and has only piece-wise
and linear, not power 2.2. I seems unlikely that there's really a
problem here.

- Xaver
