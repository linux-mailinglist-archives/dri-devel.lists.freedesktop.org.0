Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D9796FD4C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 23:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072FA10E87C;
	Fri,  6 Sep 2024 21:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bfx7IksE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4598110E87C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 21:26:53 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so2796614a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 14:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725658011; x=1726262811;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=modpcTFGLF9aKbO8/hxRVTkNY+Z5zDvT8kayu0jRlU4=;
 b=bfx7IksEMab2tPY1NH8qqIRiK4JWtvNxR0SVtYzrKvIiq6p+3dGngXRDE7cW4UF41C
 PrehzSGMbdpQTmo7Q4Nz+nTI/WrbehpA6dOIb00reY437bpL+fgQTxqjJ+YnNDR1gzcy
 oFnGJbDJ9wVdDPGpA3bbJBka46M/GwSy9Cbo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725658011; x=1726262811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=modpcTFGLF9aKbO8/hxRVTkNY+Z5zDvT8kayu0jRlU4=;
 b=CPMv3Vr147GHGc9KRviRuCM4PKc+snujP0iZZcdfe/2+LowmWUxJ+jPt4sDksV5B78
 WB/SjappYa+j4oFPi0djJY06ATJrmV/r2USmIvm16/5A/NrIgh2McJ49hKy3tbZssM2n
 HJcKt7Orh4Rnxv4Ggy+8lph4TwnxBj//hVacsdhiJYEH01ut+JnP7MRhaFrhzrm1z/0h
 ELo4iHp1bhCjuETet5giGynmAat720Or1x4L+io7a/DbvURgSV6QegdaoeXFSHsj2ROU
 PwVO3bNoya3ZMk7ZtaZk59zG4zooqiOqeGsc9yKmznXlJbv6HaHx0adcBO9Yu+E86gjH
 jqwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMzQWmYwAF/nGh0ybLhDVWZb55Peqpj72/rUGQHnM4VG2RLFph/LcMYJPVkLH2P0Z7WLSrGSVBh/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcKNStu26PK4qSpbS5ELAgUKty+pJMBOAJdQN2yMve0U5UA9uw
 yVuFCEMlLYElI7BStOz7eoRdLcvy1a/ZQBV5DOjqT5tuWUbSoME/W5Qml8oEib84+m38njkbt0X
 rnedtUcHxNO1AgN/WJQPMeKKnoBLsv1GgEDr5
X-Google-Smtp-Source: AGHT+IHcF5eFRWlqZt110Uz30CQNhxKthjlTRSddSsueRyNGudDWIFoPa9u+T+MfMoSREaLKrpMFRIaqTdFrN9C5Yew=
X-Received: by 2002:a05:6402:35c1:b0:5c2:4ad9:6d9f with SMTP id
 4fb4d7f45d1cf-5c3e953355dmr454244a12.1.1725658011403; Fri, 06 Sep 2024
 14:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com>
 <20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com>
In-Reply-To: <20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 6 Sep 2024 14:26:25 -0700
Message-ID: <CAJMQK-imYrDTuycVzQxkfbkZuHehE8uwc+qS2w=UDShETsBvEw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 knoxchiou@google.com, hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
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

On Fri, Sep 6, 2024 at 1:57=E2=80=AFAM Jianeng Ceng
<cengjianeng@huaqin.corp-partner.google.com> wrote:
>
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
>
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---
> Changes in v4:
> - PATCH 1/2: Add more info for Ponyta custom label in commit.
> - Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjia=
neng@huaqin.corp-partner.google.com/
>
> Changes in v3:
> - PATCH 1/2: Modify lable to label.
> - Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjia=
neng@huaqin.corp-partner.google.com/
>
> Chage since V2:
> - No change.
>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 1d4bb50fcd8d..4bc1777b9ea6 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -257,6 +257,17 @@ properties:
>            - const: google,steelix-sku393218
>            - const: google,steelix
>            - const: mediatek,mt8186
> +      - description: Google Ponyta (Custom label)
> +        items:
> +          - const: google,ponyta-sku0
> +          - const: google,ponyta-sku2147483647

sku2147483647 is not available anywhere besides the factory, so you
can drop this. Same for the v4 2/2 dts patch.

> +          - const: google,ponyta
> +          - const: mediatek,mt8186
> +      - description: Google Ponyta (Custom label)
> +        items:
> +          - const: google,ponyta-sku1
> +          - const: google,ponyta
> +          - const: mediatek,mt8186
>        - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
>          items:
>            - const: google,steelix-sku196609
