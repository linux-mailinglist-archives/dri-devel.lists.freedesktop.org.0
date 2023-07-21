Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D0475C6DC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 14:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8855910E671;
	Fri, 21 Jul 2023 12:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC3310E671
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 12:26:07 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-483a629c3a3so1324942e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 05:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689942367; x=1690547167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xluE36BD8mVrNVro8WajFgh+qTA9z/PcVNAY+dwKLfA=;
 b=pIf6X1un4jqkN/qzNs5aHSjweGBRD9IFIwqtxIPEstPA6ZdTcBuaEoa9mC5zDfaM7b
 l8sr9ke9PPXbllJ2MxN8dg3/1MY4m06w/joAgtrIpKSLR57LqTrBgw4ciuLIisHk2HGO
 hEYbzHnQPK/h9LYy6bkznftE7raGK/UgST3pj5IZH14DvQWVGpZ2Zpu6M+56mIxG7kiq
 HkIM8kOkfdwLbFroSYfMkWzM0Nk6AvlIYuzrBT3lH02RDspACz4fwd4rLrwd/FR1hjm3
 xpyNJNGtUqoqK+w/ggeSF1yyC0cNqg96t5BOsxHSC5G/aduDul6FtWrptMl3k/5IA/Xm
 RSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689942367; x=1690547167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xluE36BD8mVrNVro8WajFgh+qTA9z/PcVNAY+dwKLfA=;
 b=Ixs0Al2GNBthQCo8g1St5T6xrHb+C0VxuqBu9vjXJhN4zFmmipuLYcq2nHDYVom/vR
 x0aIjVRT4iY2meQKPabaL3hATVx1qfD6Y1TOi/xybop5uGrgyCQl+l21ks/j7ctvSgYH
 JRmotY5x32w8OTtIMWA+NqXamPkYWk1DEPEwedoTzFiiefx6bnuagvBLHo6+X7/4U8+I
 hrwv9sXYwJMYtd51BZ+Rh/dBnEDPGDMdi9T/yP3WbyduxC/U9g8a1HthJMcx2QD+e/3B
 8+zAjJ4xKpDGZgA7Aw7kgznT0hEQ0FtIRG8OsRqcjXjU84UxVQiaD3t8B5XcLozffDV5
 g8QA==
X-Gm-Message-State: ABy/qLYH2lCxNDeaDoQ2SLjULLnbkPMGz2Gp/Et4d2+q+P+JDDLoFuJy
 La7Uf0heiFZpwj8tm3Vy4tXDrv3WX1Vt79tBEOE=
X-Google-Smtp-Source: APBJJlFSFie+d/eOgAkf4EVoTC3bSAOyfbKhUcbE7hyw5UwumUJ67EQf6xLnDr2X7mdMRCp3uIl4YEbZlZDFiPsbEMA=
X-Received: by 2002:a05:6122:656:b0:477:4872:7f9d with SMTP id
 h22-20020a056122065600b0047748727f9dmr2310534vkp.4.1689942366532; Fri, 21 Jul
 2023 05:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230720124026.356603-1-viteosen@gmail.com>
 <5b9ceb0e-b7e4-d4b3-461e-c70f4a01fa5e@linaro.org>
In-Reply-To: <5b9ceb0e-b7e4-d4b3-461e-c70f4a01fa5e@linaro.org>
From: Viktar Simanenka <viteosen@gmail.com>
Date: Fri, 21 Jul 2023 15:25:54 +0300
Message-ID: <CAFQqR8-O+w-RQnLUSvyL-4h78pJ1cSr67Chce03+tLCTYP7YWg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: add bindings for pcd8544
 displays
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 11:42=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/07/2023 14:40, Viktar Simanenka wrote:
> > +allOf:
> > +  - $ref: panel/panel-common.yaml#
>
> This is not a panel, is it?

I can't clearly tell the difference between LCD display and panel.
I've added panel-common because of 'backlight' and 'reset-gpios'
properties. I've looked at 'sitronix,st7735r.yaml',
'ilitek,ili9486.yaml' as examples. SPI controlled LCD displays, but in
color.
In fact 'reset-gpios' is already in my yaml. I might just add the
'backlight' property explicitly and remove this dependency. Should I?
