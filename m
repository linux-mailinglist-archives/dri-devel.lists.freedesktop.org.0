Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F344839920E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BA66E527;
	Wed,  2 Jun 2021 18:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8706E527
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:00:20 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so3253122otg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=STNHXHQ+81oeK1CksPWVyFVkZuPW4pW3ZP19XpEkSjY=;
 b=MFa+sJBhB99S1SY1EvpNTP7q/MrXFc0OylugKZBojToLA4JjCAYfndtdAsRWYIY69D
 ZdWLDikV78BRlh40fkS5o7xOellvdxHmElE79Ct9HT2tdUMZakvgQduAQRswyyYHYGeV
 o6ilQSVs3mFfFtyRK6McKWT2hvX/pRt1tINcKa7pvbRvOOhd/ggjxYzXk0e9clEc2I1E
 XvTFoypy+Ow59iSb0+JseKQPYser6zy2ZL5InC1yYs750CHsRV3emysjK2uy70cv9FBl
 yyMdtxMQGWpW7owyVUMGoxzmigLEvTMBURlDIq5lh6xxoRn4feG8iEf65GwyG/yYIZaF
 k4sg==
X-Gm-Message-State: AOAM531qlxoqIAm88LIwGuwYr39t2Dwzl3jMY0u+NFv34fLbGcwbmGzL
 IkyHIauyh0Gt/i0LD2F7nw==
X-Google-Smtp-Source: ABdhPJw4Wnkkr1ZWBQNe8mwdd924fhfJkTTmphYm16a4o7+93YyM7ubX4h1P3RCN0vdbqFgl/6IyTw==
X-Received: by 2002:a9d:6f15:: with SMTP id n21mr12298359otq.154.1622656819618; 
 Wed, 02 Jun 2021 11:00:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q63sm128029oic.15.2021.06.02.11.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:00:18 -0700 (PDT)
Received: (nullmailer pid 3674811 invoked by uid 1000);
 Wed, 02 Jun 2021 18:00:17 -0000
Date: Wed, 2 Jun 2021 13:00:17 -0500
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v8 01/11] dt-bindings: display: simple: List hpd
 properties in panel-simple
Message-ID: <20210602180017.GA3674744@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.1.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524165920.v8.1.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, robdclark@chromium.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 May 2021 17:01:49 -0700, Douglas Anderson wrote:
> The HPD (Hot Plug Detect) signal is present in many (probably even
> "most") eDP panels. For eDP, this signal isn't actually used for
> detecting hot-plugs of the panel but is more akin to a "panel ready"
> signal. After you provide power to the panel, panel timing diagrams
> typically say that you should wait for HPD to be asserted (or wait a
> fixed amount of time) before talking to the panel.
> 
> The panel-simple bindings describes many eDP panels and many of these
> panels provide the HPD signal. We should add the HPD-related
> properties to the panel-simple bindings. The HPD properties are
> actually defined in panel-common.yaml, so adding them here just
> documents that they are OK for panels handled by the panel-simple
> bindings.
> 
> NOTE: whether or not we'd include HPD properties in the panel node is
> more a property of the board design than the panel itself. For most
> boards using these eDP panels everything "magically" works without
> specifying any HPD properties and that's been why we haven't needed to
> allow the HPD properties earlier. On these boards the HPD signal goes
> directly to a dedicated "HPD" input to the eDP controller and this
> connection doesn't need to be described in the device tree. The only
> time the HPD properties are needed in the device tree are if HPD is
> hooked up to a GPIO or if HPD is normally on the panel but isn't used
> on a given board. That means that if we don't allow the HPD properties
> in panel-simple then one could argue that we've got to boot all eDP
> panels (or at least all those that someone could conceivably put on a
> system where HPD goes to a GPIO or isn't hooked up) from panel-simple.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v8:
> - Explain better why HPD needs to be in panel-simple in commit msg.
> 
> Changes in v7:
> - List hpd properties bindings patch new for v7.
> 
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
