Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 915486ADBE0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C476010E402;
	Tue,  7 Mar 2023 10:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6FF10E402
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 10:28:02 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id bx14so8529368uab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 02:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678184881;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3IFfZ13qRP77Th42gjrEoIf/Fv5yp9Te6g4rfCja/g=;
 b=Eb1zByjEKOExnu+tNlf2T0VWXBDVQVZyWGR4wHcACaXrTYPFfwm+L3H+ouePH9SVw0
 nSm0EQDWkfocza6ZSKpr6gFmNHjWZyTGLQNSi3ncAmKH2Cw4exaWsf8lOIQAp1zC0zxm
 dRrSdXqOmbW8Zob+dovbN4ZHH3LmK8bLwoCfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184881;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3IFfZ13qRP77Th42gjrEoIf/Fv5yp9Te6g4rfCja/g=;
 b=XZey8PlLJihhBrUGScfgulX0StfAw1/3GtbJlMQezMsVejoNnwCWEptBuhC5TSXV0X
 unSq7YzZyEJ+1Ex1zrjLfRY6mSAkckEj1DqSUtyaU9oHQXveYgF60Czb1aN5BUxS/yrP
 8Li7BNpbwk8/a8CdRCNaM5zWHFAcnQDizmK6erKokiXEVVJTKLz+xfnTiLVOtKGEWfcq
 eQbbOGdufjkTvvMg4wvKdLIceJlkt3mbTPYMx3w3SrJER/3UD/xmLxYfQTP4/aJxM4X0
 mQD+9JE3TsNlryi636NT54Mj4WQRV2yONZInhuMx+8r6viH9K3jcdUYSmXwt4aM9k1VI
 e0MA==
X-Gm-Message-State: AO0yUKU0wTzQvv3dyaD3f/Da5EaHbecc7VwcfIOIdLOjkFEE1iKjYOx5
 xqXPQvV5foUrhMUy1MsOzIU3JL+0zEKvkl2uS2wing==
X-Google-Smtp-Source: AK7set8/lmXFQ2Q8tP+xEm+sKmdCV9Kt/WO3yq7gKbFeKv90cNmH+N5U/jM1j+nH6ORz9vhUBxZNHa5P6CnunTtzeow=
X-Received: by 2002:a1f:c507:0:b0:401:2297:b2e0 with SMTP id
 v7-20020a1fc507000000b004012297b2e0mr8280600vkf.0.1678184881167; Tue, 07 Mar
 2023 02:28:01 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 18:27:50 +0800
Message-ID: <CAGXv+5FZSZiTw7RH_VZyT2buk_i0eVpz-rKo9ds1M4yNt3fboQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] dt-bindings: gpu: mali-bifrost: Set
 power-domains maxItems to 5
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding (and fixing) power-domain-names and MediaTek
> MT8192 bindings, allow up to five items for power-domains.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`
