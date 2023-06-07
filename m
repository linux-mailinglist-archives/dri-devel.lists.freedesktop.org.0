Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1242172547B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 08:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506BC10E437;
	Wed,  7 Jun 2023 06:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F98F10E437
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 06:40:15 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-565d354b59fso80211157b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 23:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686120015; x=1688712015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9d2sCd7ah2vbojw+2oUIoDVwhMBRN5y5qh24H2kySsU=;
 b=f0RZdEMQ464ceL/uRZ10D3Eig8SLZ9Ww3zWyqBRJvU9jMbPmnw4KZw0aCajmu5ElKD
 IlC/f7cx6mivVp7ryDID9C6k1iebxdKMJ8zYKQqeiKdzFEmn065WdfBBMoHJgRR3H6t4
 mzKaZve8nW/ROna1hFKTqqkAxuAMflmTUNOiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686120015; x=1688712015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9d2sCd7ah2vbojw+2oUIoDVwhMBRN5y5qh24H2kySsU=;
 b=J92e0JFqR55DC86C29pWQ1SivFE2uCTlrBuKqlbhmshPgdK04CceRS5BCj6xEnQR4q
 37S5QwSOK8N9bZagYkjdYrMBp4PKhwIYvEoXfwJd4X/S4SGEzaIYvrhGrQq08JhbgyYo
 bAVvrKWYYOOUx5jUnk1zlbX3XHcbV0QO9DpGqFWCESvQpUTXJzPdtrCAp/A1VIoG1314
 D4Lt1oHXmGDrVPnf86K7IQ/N/aRqxdgUvvKnGc4/MC+RMIaEtlWnoG91ShDVj+RoJ66c
 2j6UeMip/vRUV52OBVSA8394TU9OMrJ1R7xUOUKnq9+HpjCuHCfM9Zig5PsmAk8EDfZI
 v8xA==
X-Gm-Message-State: AC+VfDwnZUvvcFvzvrhHzgVoxKEUibcj61jIN9B5uUb/xwjCPC77zwgN
 0nBzsJ/2oPwViRknZZHNxpsk72tc5/zbg4KTzfTnow==
X-Google-Smtp-Source: ACHHUZ4FcSqI9UJuhz5QJp3BxxWbzaB69qaQ0llUyrzZcvr85u9WKmZk2Gw3vKaFZgAl6y6Ws+AbiDt3xWboKEU4CHM=
X-Received: by 2002:a0d:d552:0:b0:566:c47:d06a with SMTP id
 x79-20020a0dd552000000b005660c47d06amr5357912ywd.13.1686120014887; Tue, 06
 Jun 2023 23:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
 <20230607063139.621351-5-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230607063139.621351-5-dario.binacchi@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 7 Jun 2023 12:10:03 +0530
Message-ID: <CAMty3ZA-8zyzqzjOehKa1=zE+GoMw8j2NbgZuythAafSjHVczw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/6] dt-bindings: display: simple: add Rocktech
 RK043FN48H
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sam Ravnborg <sam@ravnborg.org>, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 7, 2023 at 12:01=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> Add compatible to panel-simple for Rocktech Displays Limited
> RK043FN48H 4.3" 480x272 LCD-TFT panel.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
