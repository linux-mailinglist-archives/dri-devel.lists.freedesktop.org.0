Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4151830F6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 14:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92756E22A;
	Thu, 12 Mar 2020 13:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38836E22A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 13:13:41 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9002320724
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 13:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584018821;
 bh=OLCs9wDW5DLwK6glkoG1xXvwb8u+w1JpNNt/MSUzvEw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ESG9DyqOBtb3RY9JZ8+KWe4xtjArS1LrAi62Ut7Q9YGKrM49cnixegAQl2+B//l1p
 5vF1N7TMBktea7/YfUwAOe6WZZSUS9hFlfar8X+r16vp9X58Fve69WgAVHhGpGeQ/C
 F3Awe52tsGjZQOvFr+uhrxusXABsT1jl1XnEamKM=
Received: by mail-qk1-f173.google.com with SMTP id e11so5991949qkg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 06:13:41 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2hEy3pAwh1bC5ShdB4AjFbRxI4v5Mv5eWBDTuQtwr9RMb8osuP
 pfniOswmd5yd0XvEJPbxcNDuQkYYroWynMQtAA==
X-Google-Smtp-Source: ADFU+vsl+NWGl4RtiFZjKswLmhm4fAbnZDjrreYI1ja6LxDiRHZLHZlRiEDnADMNoidWwaIebO8AI/TFTKYi20bRWw0=
X-Received: by 2002:a37:aa92:: with SMTP id t140mr6922921qke.119.1584018820626; 
 Thu, 12 Mar 2020 06:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200308115017.18563-1-sam@ravnborg.org>
 <20200308115017.18563-2-sam@ravnborg.org>
 <e584e779-aab3-1a41-f198-a5585d9be2e8@st.com>
In-Reply-To: <e584e779-aab3-1a41-f198-a5585d9be2e8@st.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 12 Mar 2020 08:13:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK4Wa-Z+2EOOTsUqfcXwV33o18eaUzq5-cYE5Zpirtyzw@mail.gmail.com>
Message-ID: <CAL_JsqK4Wa-Z+2EOOTsUqfcXwV33o18eaUzq5-cYE5Zpirtyzw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 5:21 AM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
>
> On 3/8/20 12:50 PM, Sam Ravnborg wrote:
> > Fix following type af warnings in the panel bindings:
> >
> > Warning (unit_address_vs_reg): /example-0/dsi/panel: node has a reg or ranges property, but no unit name
> > Warning (unit_address_vs_reg): /example-0/dsi@ff450000: node has a unit name, but no reg property
> >
> > Removing the "@xxx" from the node name fixed first warning.
> > Adding a missing reg property fixed the second warning
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I will add W=1 in my command line when check the yaml files to not
> reproduce this later.

No need to starting in 5.7.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
