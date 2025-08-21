Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5480CB2F744
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DBC10E95A;
	Thu, 21 Aug 2025 11:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EUYkgAnc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD7910E957
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:56:37 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-333f92cb94eso7828751fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755777396; x=1756382196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NTRZmz9b45Hl2bTm1apFpY/NlVi3bfWcm6ULUt78zN4=;
 b=EUYkgAncvtSc7jTkoFKO0bE5ni8koCH9Y128dnTLVCK5DVDqqbnMMDti8PVW9tJmfl
 TFdwyEob/p9ocSGxORxh+z6GnhGVc0leoRBKEb552iztlW2XrbVxmdCCnP4ehAOd3Xxq
 bt2s9zUfwGOIpndNYvGpzO/ThnY+KC+TZOnlcmIP3cas8b/ajP44z3JlR0dLDidZREbM
 tUWKvrLHo56CZuPhLFSbLKtznJ3XlF5BbrlD8yj8MHsmQByGx4moqADSSuuVXHKhauRu
 Y22udTAK9UawiPAo+SWM1nxLW41DzDa8xiqNjA2FvGFb5j2Qk3lrg57L0qHepN3qUfOB
 iQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755777396; x=1756382196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NTRZmz9b45Hl2bTm1apFpY/NlVi3bfWcm6ULUt78zN4=;
 b=AndTALAWU8xzm8T4P8TJAP9YtDfHQg2aN4korff19FY2JN7EpPfbnvMh3vz8y2FD9k
 sqkDdhGoAdtekEveBLfr6+In+Fx86KACybLvJf684zN6CMEeRbBNEC8b8sf09YjG1kDO
 b9U0WF1sAOudc5xxgt8Wn7VvX9tkleywXVzR/BlbBl0kIbuAmv8xM9Mj5yjs245ruvbH
 cNKeSVNlil3yvpucTyXXLX3HnaiXepWojV/F9Z2eghdIwQM9g0mzG7r0JRe1DbJScMh1
 CHQTKNy21gQBVDLMJ+HgBySBgTyH4jS7Cs+rGyR5/lk7zdmn/Oqr0hCjCVGZCgZRQwFX
 rcYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBG0qc6Z+R7Xe85vN2n42iNj3apDRf+aM+IUXwaSt2FtCkRLMUKJcYU6hRd3Iwh7vXNJMNrnqpo2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDEbWVa8NucCp9cLJwiYTuHB7xi1n70ckQI5HJInSvAeVGCOni
 IwUm1VHCtT3m2/I+7mVJjS/sejlQAIqJKFZFWnefdMynHppHfk7XhDLWiggIxxj62zNSF/Q7aBK
 iTnud3823+jDFJfoakezAQ6WnSxJrJor9Mkxfa5FAYA==
X-Gm-Gg: ASbGncvo5KD/e7L/r9KJf6zjY/Qol7SqqUw9KVUnw5+2Mc4yXUI3ObvUrhg5p0/WARz
 eP8GdSxvYf8TaLsJBLGk4pc1e/m7rm13bPIAtjtv3CmpgwXzjeLFAIE5apA61eqYND0iAb6JfoV
 FYRE7FbP8QmY4tROQJ9V+rEIJWHer1Z2C9qz5vmd2RJUOZauEvKCjU9ZAKKtKkk4wM/n1iEiE0v
 vN8DxI=
X-Google-Smtp-Source: AGHT+IHLNT7GNgIK+Yc1AUKtRsJ+Pu3qxvF99KQLgmBORucS0GzpXEZZoUCuuB+z9QVIQwaQ+MKKQAluSVZweFngFeU=
X-Received: by 2002:a05:651c:54a:b0:332:57b8:92eb with SMTP id
 38308e7fff4ca-33549e7e81dmr7293611fa.10.1755777395492; Thu, 21 Aug 2025
 04:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-14-ariel.dalessandro@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:56:24 +0200
X-Gm-Features: Ac12FXxjp4iK3cFyWU_S6p_GaEq9BIq8dd_UPbgZlXscJTvrfMnMiNgyqvjOGHs
Message-ID: <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
 broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
 conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com, 
 edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
 jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
 krzk+dt@kernel.org, kuba@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
 support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
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

Hi Ariel,

thanks for your patch!

On Wed, Aug 20, 2025 at 7:17=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:

> +  ce-gpios:
> +    description: GPIO connected to the CE (chip enable) pin of the chip
> +    maxItems: 1

Mention that this should always have the flag GPIO_ACTIVE_HIGH
as this is required by the hardware.

Unfortunately we have no YAML syntax for enforcing flags :/

With that fix:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
