Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2DF182CA9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 10:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453A76E0DC;
	Thu, 12 Mar 2020 09:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2543F6E0DC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 09:45:17 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id g12so5650671ljj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pODGPcrOCo99BFK0Xjb4rhW9q/kdwVYGIJ2RjyD6fxs=;
 b=mT9aYb42BoD8Blfh/Y8c4VPMYR6LI1miBJ07ovTPv3ci4OfSA2Dj6/vckh9GL3HnyE
 yQ/5equoB5oGfS2ZL3RCijubgZtR0uVQNXxSNKZ+LsI2aihc2rQ/U39N2Fz3y5CalgbC
 42NxHFjXctecJAI12xhPWsg9Ti5dOxMm/F60YF2DAYbAJpCP+vhKYiDVCchp4z396f8Q
 qCNAIbtPV8v6cUhiYdm3s4iM0tWI8GqTHE+f57xwEkLT1jYLfdJJvlhcPnGxvsZMx0hc
 g9qiPkvFKD3fL0BJj5BT5G9qHu2wyxMJcxvn2FD5DF2A8sahkkICe2gqFLIK72lwZeC9
 jVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pODGPcrOCo99BFK0Xjb4rhW9q/kdwVYGIJ2RjyD6fxs=;
 b=VBZwl3ZjiNsYbURS+x7bqNm1uIRwqtxzWjwk3HPBRc0WoHK1T8C/4kk9URco/vuY70
 s8QhlrmHMP0q7LJOEJlhHU84ErQ1GFYA3GBbFWAAxAe43wjEGPc3opA86AtBZAZfn1xG
 MSQGn1PRqFSDlQrzBIEGhD4qw/y/sgqvYRlGNPBkNdtp1aV5JW+eo25GWuv/tc+wKbHc
 UrSIlzu7AtU6XxYNmVEEbn5p7anEdCA4pDn+9lTFk62zpVCSEUViT1uMhOwUqbSLs4Yc
 advG4oUNkwLjprjeEPDikcG4vPudvpWgs2YjRPCSz9X585uDtYz5igexNk6TMaHeEpHk
 hvkg==
X-Gm-Message-State: ANhLgQ2O2QhEPY0ZNtGmh8PHwoZ4vd1mh1UlfAWoZlsjHNW2rXbxEcNf
 fRt/kZTwv3hX0Oq21O/H7a7Q1EwMSHYWMpxy0bRjPg==
X-Google-Smtp-Source: ADFU+vtCa8+SAjbo+XfDHquYUdyP/1RvO9lPi7QEw1xwTxgVgOSXWqDiS5mP6Y7qbippLNSQT46Y+Db+ZJCx+QAfgyU=
X-Received: by 2002:a2e:9a90:: with SMTP id p16mr4719590lji.277.1584006315513; 
 Thu, 12 Mar 2020 02:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200308115017.18563-1-sam@ravnborg.org>
 <20200308115017.18563-2-sam@ravnborg.org>
In-Reply-To: <20200308115017.18563-2-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Mar 2020 10:45:03 +0100
Message-ID: <CACRpkdaFWp2DbKf+tm9VqeOzdshMypwN_mBbEgihw5COPeaUFQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 8, 2020 at 12:50 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Fix following type af warnings in the panel bindings:
>
> Warning (unit_address_vs_reg): /example-0/dsi/panel: node has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): /example-0/dsi@ff450000: node has a unit name, but no reg property
>
> Removing the "@xxx" from the node name fixed first warning.
> Adding a missing reg property fixed the second warning
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
