Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5F0183112
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 14:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDAF16EAB5;
	Thu, 12 Mar 2020 13:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905236EAB5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 13:18:04 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 533DF206B1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584019084;
 bh=9LvTzccs20EfwHRZkugVuiWmgd25bpPrRl6L8w4/Oz4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zY0iaiEuq+94HEJNC+M3uNNqqWvIuL8LmuYCbrWbvB2ja1QjHiApBUHK6+3t2w3V3
 r2wjvYgMkprtz2WwMP/UCxCpanZ2I1A9xlCbVCUQS7wjr8zptKjLXjrHXhOmEI72K1
 j4fWFVMRwBFcA8StaO/AmvEoxFfHjdqyIJEyK6pk=
Received: by mail-qt1-f182.google.com with SMTP id n5so4256245qtv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 06:18:04 -0700 (PDT)
X-Gm-Message-State: ANhLgQ052HIExcqkF2dUgqJkAbcnHbxrpo0i332iO0x2CJA2J1/L3NjM
 uq5u1WvOXv9/UFCTExAlwWI1/dyQnifZOu3npg==
X-Google-Smtp-Source: ADFU+vuLXMJHQEOc9yZQJjg2VBWDBilY6CR5xhZf9pkeq5kaczXg78bABk9trxq/40GZUQEb4VvUo1jtlgxUuKyHUpc=
X-Received: by 2002:ac8:59:: with SMTP id i25mr7306219qtg.110.1584019083428;
 Thu, 12 Mar 2020 06:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200311210001.5102-1-robh@kernel.org>
 <20200311214028.GA21800@ravnborg.org>
In-Reply-To: <20200311214028.GA21800@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 12 Mar 2020 08:17:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK8n-YTsROL+XhjJVtFJzV-aGPxhLOxs1axHq5+TvE-Lg@mail.gmail.com>
Message-ID: <CAL_JsqK8n-YTsROL+XhjJVtFJzV-aGPxhLOxs1axHq5+TvE-Lg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Fix dtc unit-address warnings in
 examples
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 4:40 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Wed, Mar 11, 2020 at 04:00:01PM -0500, Rob Herring wrote:
> > Extra dtc warnings (roughly what W=1 enables) are now enabled by default
> > when building the binding examples. These were fixed treewide in
> > 5.6-rc5, but some new display bindings have been added with new
> > warnings:
> >
> > Documentation/devicetree/bindings/display/panel/raydium,rm68200.example.dts:17.7-27.11: Warning (unit_address_vs_reg): /example-0/dsi@0: node has a unit name, but no reg property
> > Documentation/devicetree/bindings/display/panel/panel-simple-dsi.example.dts:17.19-31.11: Warning (unit_address_vs_reg): /example-0/mdss_dsi@fd922800: node has a unit name, but no reg property
> > Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.example.dts:17.7-26.11: Warning (unit_address_vs_reg): /example-0/dsi@0: node has a unit name, but no reg property
> > Documentation/devicetree/bindings/display/ti/ti,am65x-dss.example.dts:21.27-49.11: Warning (unit_address_format): /example-0/dss@04a00000: unit name should not have leading 0s
> > Documentation/devicetree/bindings/display/ti/ti,j721e-dss.example.dts:21.27-72.11: Warning (unit_address_format): /example-0/dss@04a00000: unit name should not have leading 0s
> > Documentation/devicetree/bindings/display/ti/ti,k2g-dss.example.dts:20.27-42.11: Warning (unit_address_format): /example-0/dss@02540000: unit name should not have leading 0s
> >
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Jyri Sarha <jsarha@ti.com>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> And I can drop my patch that only fixed the panel/ parts - good.

It seems I missed some panels. Perhaps ones that are in drm-misc, but
not in linux-next yet? Keep yours and I'll respin with just the TI
part.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
