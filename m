Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641AEB10588
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA7E10E907;
	Thu, 24 Jul 2025 09:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jI2pxmkq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452F010E90D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:17:04 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-553b5165cf5so900199e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753348623; x=1753953423;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PzAImXvw7ltOkAeF9aE1vYSBycD64FXcVdqDkDZASUk=;
 b=jI2pxmkqUpZ77LyhuguoaNe98gQQ1kVOcgH4US+75MegnlwaloqHClr6t7qgZEpJ0U
 3dthSVmHTj9NEHEd/OKd+H8QPi0Kza6l/MI5qV8LcmaRv5SweVvs7F/xPh6ci0X9EDEc
 6C3vEhD/PURFdzYIl3XgR3CBPFrWRx0fqlUvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753348623; x=1753953423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PzAImXvw7ltOkAeF9aE1vYSBycD64FXcVdqDkDZASUk=;
 b=KGRqx9Waq803ylt2fx8jp2m1297IZd5SJ11aryG3YkkIaZdIsrJPWQWu19rCWjUo2s
 w6/oFLhQBlR0coAGxw4xtz+lFOytLsjJhQt/fTDapqzBEmgvhMip+c8FX0xQXrBM6ehs
 5vQNl3+U0FgpmZ81qnNw+9xhV8VMJKeSFjuruo133dG2fysKbljNx0Ixzf8gylv9zigl
 j5q/3ArUpFeXcunVcTlo0apQEs400BQMT2wGfnE0YDjS2uqkI0PMMpAUxMBED9fF8cAj
 iVoTTPBMGu3cdaq/KT77ApZjPvoz7CFyszDTYS9jUczUoDLFt64y0oWVh1Dp7OlM/NSj
 7l1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKu+omqZedre04d157cnOoVty5ZhYQV8pEjB7lsweZP6nqfy2aet74Adu7b/B80ab7z0zLAUroV+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/Y+rpousSUWoYggCbxXXAa5OFyUCAw9ZjomK9wTNUb8J2Adt2
 lsXdWEAZgF/haAZYlobCGFD+g9nNI8qFoH5AGG6nK+6FiiEdbNiiwTRmOc8dghqHmzv1e+D9ytL
 /8ZvDs+7MFMjkO02bxqNeMh+lgKcF8Iot6a5HSzI4
X-Gm-Gg: ASbGncvLaAdH1aF7O4sJE+ISfzMXEy44K4P1rxOVZGIPy3q3DNEztGsj+RkUr+EeQYA
 Ankjb+folKxqT2KOeitJtXti1loKEc7bDznZl88AIh6GEkW7mqiP+YelD+vWbhsMbuD7h7m+dgH
 sjWMEWOQ7HxD0eV51eKSGOLA3RmbRfErUILqLXikWtft5AePZULHoTiuELl49LCivddqcwueF0Z
 9te/4V9xjBXyU0ljkJI7EDo1RIklcklvLfooaJtfdzpLw==
X-Google-Smtp-Source: AGHT+IGEMdfa/7pI/vtQhZpE9t+GCiAKzWTtoHMGXUrvfqlTr4xGM3G4p6O55TyjazqugJ0Dpoksr/xy8ncvPcXnu9I=
X-Received: by 2002:a05:6512:3a84:b0:55b:57e8:16a5 with SMTP id
 2adb3069b0e04-55b57e81981mr94240e87.32.1753348622453; Thu, 24 Jul 2025
 02:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:16:51 +0800
X-Gm-Features: Ac12FXxEOfXERpbm54RTrpt_sFAe6oyRhPRCsENRyO12HQ_K_abqIUXAGxmi264
Message-ID: <CAGXv+5Exb0X-6V=bdJefaz+m=eXSrrw6_SgWY6vDF3rF1RmVBg@mail.gmail.com>
Subject: Re: [PATCH 02/38] dt-bindings: display: mediatek, dp: Allow
 DisplayPort AUX bus
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
 herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
 mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
 ck.hu@mediatek.com, houlong.wei@mediatek.com, 
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
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

On Thu, Jul 24, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Like others, the MediaTek DisplayPort controller provides an
> auxiliary bus: import the common dp-aux-bus.yaml in this binding
> to allow specifying an aux-bus subnode.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
