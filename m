Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325BB6CC9CF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 19:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A83710E486;
	Tue, 28 Mar 2023 17:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04CC10E486
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 17:58:01 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id b18so16210350ybp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680026281;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LBIZOLCnuyFDnYVdehzBMZi5Ft2DJgOUzv5Wl1H9Km8=;
 b=Mb1Dh1g4NbOY4FAAWP7WPIZL48Hziw/rX7aDJpJXu/8SqQRUhmRH41mxRFJMsyZm3T
 RtIWyVGz8Vm2ANtYysKVQXs9pa0DheT/UOjmrksb0BjYR/I7nixBS5VPHfUi9019F8cQ
 Pc+lk+rvofCla7ffXPCd3BPuG76cIQZhQXBiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680026281;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LBIZOLCnuyFDnYVdehzBMZi5Ft2DJgOUzv5Wl1H9Km8=;
 b=edfthensbGZrCVE1bgz6he9+jZj4r7QTuFxyRO2sF+AZTHYDowOWiOafocSY44dv9a
 d++PwTQcxFa08eCGIK27KtEioUFaSP3DKp1gqRRDlHt/+E6NQ4SvKh9xHH0Bcs9S6qFx
 3LuUFis1I6GsYS5+gWgCU+1R3QG69dahIFju2Mz3eZdCTwSYIoXfZnoKb28hkBrxkHkk
 U7UoAjqgYNcU5idq5q86THfRLs4uZUU4mkgaonRVhlG9Zf2GxTYc6dSopFAdAk4ShcVQ
 +SumvJJ+VR7fHmWQIBwZ00KVf6N73NnXYCQhrdZYeM5X1rLtyjh6ftxqwyrMMk2P5Nwi
 mSNQ==
X-Gm-Message-State: AAQBX9f+g8yEr0ghEQA6vOomv9niFuUgtYkQvI6qNFUDOMVh6YGLN6Qi
 MWMCq/anIvQx4lBx3tHiVQ5/v3jfqVNqxVBGa7rJUg==
X-Google-Smtp-Source: AKy350YZnVf6f58xk7w48QP4ob6S+rgyFRsoJsdBTz4gvcHKnfayCAVmmHjyD+8GX1vUTngInwQkDMvOZEiLekqSVCw=
X-Received: by 2002:a05:6902:154a:b0:b3c:637f:ad00 with SMTP id
 r10-20020a056902154a00b00b3c637fad00mr11078963ybu.5.1680026280970; Tue, 28
 Mar 2023 10:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 28 Mar 2023 23:27:49 +0530
Message-ID: <CAMty3ZDFo9JU2DOqwTN1kj=hKxomvi7tz5guvWG5P=npAg6RNg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: xinpeng,
 xpp055c272: document port
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
>   px30-evb.dtb: panel@0: 'port' does not match any of the regexes: 'pinct=
rl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
