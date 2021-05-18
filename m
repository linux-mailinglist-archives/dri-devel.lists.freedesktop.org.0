Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9676E387912
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E706EB57;
	Tue, 18 May 2021 12:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C3A6E87A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 12:42:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B74A161396
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 12:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621341722;
 bh=Kq9PPSOj69H9CJtjL589JZsUAf2E9fTSyIGGIo8pLqA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NlrKy1ZOxb1/CwXwGdvedqToS11Q9qYLrtEKnjaIOloL5ZOs48bFfAJnpb1Nz+uPn
 /fNWRrVIHhs8BYJURBfj4zR2ubWujnFvIdUXaRud0OejZivFP38BPF7ZHY+c66y6SC
 i1syIbA75NV5UfnMx5GODI6Gu3KItJCwskrY1N5ein7oR4g2sHjv59Na8aw96mQzHs
 86AyjzfoT2cPZIxC9oTE82aO98NN5hmAfzjk9M4XZiDPivxXbSbTAhMPEzWuZL5PVU
 CG6OXaSfs27w7BHeKYBLX6/z++qJUvP6tgV+xJSZmz/oEGjv+BqZRuC2Q+EDoy5Itp
 IwPJRRta5UTpw==
Received: by mail-ej1-f54.google.com with SMTP id z12so12889754ejw.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 05:42:02 -0700 (PDT)
X-Gm-Message-State: AOAM531q7n1QeT+EfmQj2rVnDjZwzVUK/e/DWLIqeMISKgZKPTOqomLB
 36+O+AC9qub45BYdpVPdYprP/0uzOd0U44Eopg==
X-Google-Smtp-Source: ABdhPJzMG+XGPvZbk0Iau8OvJwjoVTbmUys2mLehU60lUDIjVY+xUQXZC2//c41WPPciXZ404z8EPYbgJKmoIyXac5A=
X-Received: by 2002:a17:907:161e:: with SMTP id
 hb30mr5851896ejc.360.1621341721096; 
 Tue, 18 May 2021 05:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.2.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
In-Reply-To: <20210517130450.v7.2.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 18 May 2021 07:41:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLMs10Luj7fKkNVu-BUZhpqAGJMZyUxz76N3b9Xa7EByg@mail.gmail.com>
Message-ID: <CAL_JsqLMs10Luj7fKkNVu-BUZhpqAGJMZyUxz76N3b9Xa7EByg@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: display: simple: List hpd
 properties in panel-simple
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Clark <robdclark@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 3:09 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> These are described in panel-common.yaml but if I don't list them in
> panel-simple then I get yells when running 'dt_binding_check' in a
> future patch. List them along with other properties that seem to be
> listed in panel-simple for similar reasons.

If you have HPD, is it still a simple panel? I don't see this as an
omission because the use of these properties for simple panels was
never documented IIRC.

Not saying we can't add them, but justify it as an addition, not just
fixing a warning.

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I didn't spend tons of time digging to see if there was supposed to be
> a better way of doing this. If there is, feel free to yell.

That's the right way to do it unless you want to allow all common
properties, then we'd use unevaluatedProperties instead of
additionalProperties.


>
> Changes in v7:
> - List hpd properties bindings patch new for v7.
>
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index b3797ba2698b..4a0a5e1ee252 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -298,6 +298,8 @@ properties:
>    enable-gpios: true
>    port: true
>    power-supply: true
> +  no-hpd: true
> +  hpd-gpios: true
>
>  additionalProperties: false
>
> --
> 2.31.1.751.gd2f1c929bd-goog
>
