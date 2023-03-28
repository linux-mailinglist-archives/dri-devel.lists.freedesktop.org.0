Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CC16CC9CC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 19:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1903F10E95F;
	Tue, 28 Mar 2023 17:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6904E10E95F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 17:57:39 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-54184571389so244976137b3.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680026258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/zyfhrzpJ8FVGDn0nkToOqRRxGr7JvskPxRAJdP0ZQ=;
 b=P9CqKo6uPkNWXhAWUEoQg+RZX5rj9LTR1k9IovpkIcV1Su9jdnYvfSFmWp9liCMBL9
 rAA9SnaN8FfuNHbFD7A7riq5ds8OUm1Q40VhuMz1cjYnj0/35CE8ZROgRBw89QE29qU+
 ix/fUE8SQbk0TWt+16mmg1blmF9MdLSsVc+pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680026258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M/zyfhrzpJ8FVGDn0nkToOqRRxGr7JvskPxRAJdP0ZQ=;
 b=5sZMC+66CioMf+K9etifURtGzVFk39oZZn0Nf5IcBKEXFfst1dvXY0zQkH4sYM3nUO
 sJaNg9cgFJvdRbqP2y/TAtC1cuIAMYCag7ewqi4Fuw1uqKDkC/ZvQXnrtbm53PILmqvT
 PkIqdgvbIjR1ZNboJtipg8yFvNMri/C3LSk3ef3e129Zrrpu8Gn4r/LaQX3HiKL6R5wZ
 tDdq3GalTsQM+tuyBvjYZcPZ0yLonkdx0Zbkx03qywmrXSoA+6nO0i6XVkROWkwwD+6A
 lYkET27bnGWc0uiPUc6AflyZkQtPLOPaJNTfROuK4mhBVUoZdqDzqkRKJBPfiKiNB5qy
 2fLw==
X-Gm-Message-State: AAQBX9d+QjbK7NGcWQBGPnUFe0Yj6mS8qddVkghU1YdDC9HAw79+9S0I
 LKwc1Z7+OcZi1/2d3zZcAs2xfjggBDZnfcAA9uBv0Q==
X-Google-Smtp-Source: AKy350Yku4oTglKVG+wlRh5yaGjA1O9kEXdbcbbYcByQcSsV3pIVqE85+HIV3u7JHgTOgf8+Vj+p17JSLWs+wk9l7q4=
X-Received: by 2002:a81:ae23:0:b0:52e:e095:d840 with SMTP id
 m35-20020a81ae23000000b0052ee095d840mr7886934ywh.0.1680026258625; Tue, 28 Mar
 2023 10:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
 <20230326204224.80181-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230326204224.80181-2-krzysztof.kozlowski@linaro.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 28 Mar 2023 23:27:27 +0530
Message-ID: <CAMty3ZCr9fH7_w2UMZ9mRw1hHfLn7vij+EpGGUJcTtsn_emJRQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: display: feiyang,fy07024di26a30d:
 document port
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 2:12=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Panels are supposed to have one port (defined in panel-common.yaml
> binding):
>
>   rk3399-rockpro64.dtb: panel@0: 'port' does not match any of the regexes=
: 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
