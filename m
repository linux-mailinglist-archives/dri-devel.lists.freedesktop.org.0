Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26844326621
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 18:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BF46EE22;
	Fri, 26 Feb 2021 17:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00ECC6EE22
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 17:10:36 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id do6so16061779ejc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 09:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8cbXSutADW2HnccBzsx17kylWCaUrrRJFrKcsn0yvik=;
 b=JfbszjOmCX+PVGFopEGBxjB1Jak26rT0UOItBmRUGXhJTtXcJonq69NSSbUk1sIOW3
 LW0urpPkZpl7FR1LLt/bgc6TQZ68AQTowHwzxTxI6wSTZBaSN7knNI7GcIWPf0DR2u9Y
 iD8feA+xWmrW5CGxpGtSI2yDDu4vthuo+eaf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8cbXSutADW2HnccBzsx17kylWCaUrrRJFrKcsn0yvik=;
 b=ah1Nv3ZsSSyOUnut/IlUX6gPxsr7K+dw/YtIF5uV763A3Brfl0CKHsvK0witK6GtcC
 B5/sYSOoP/B/IGMNm3ZtAvZ94Gp9kW1jfTI4l7ZkOn/B7TEclG+yn3aEmHYpdFnka1vl
 QTuDkZnw0/rwDL4zwJlZPDJPJ9w/bOaPrpnBR6+HrBlCbvcLyh7BV9jiv5q26nBRJsUO
 tbc2qjQ9TB5xarl6J82t69lnWnr17t5mdJeHQSCegQz9gggwr7IqLCcy84hqHBT+O8D0
 O2ciC1HF+R1uLPtcrqEJzDF6MoKseZDjSVSmTK/Meb5xEzu/SDs0sFrf+fqY+ZY6GsjD
 M2jg==
X-Gm-Message-State: AOAM531tUvQPoF8gbBcgxnHHe+WQM0HqNSsHdaBAlPKiHrHiGkAM5Vzz
 d+NDdX9bA33Y1TNZAaq6RzVSjav86BL5yKAN5sC9zeJ3fj0=
X-Google-Smtp-Source: ABdhPJyoRe19nZ9z4W4jlGo1Iv1K22wYujENsfoQaGitC+8/Bf6NlCl1UQGu+3U13HjQEIT69OXRAFMFqUHPeiblH/o=
X-Received: by 2002:a17:906:3fc3:: with SMTP id
 k3mr4479825ejj.522.1614359435652; 
 Fri, 26 Feb 2021 09:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
 <20210214194102.126146-7-jagan@amarulasolutions.com>
 <20210226165723.szblbiswz5vgapq2@hendrix>
In-Reply-To: <20210226165723.szblbiswz5vgapq2@hendrix>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 26 Feb 2021 22:40:24 +0530
Message-ID: <CAMty3ZC0ynvk3qnWDSnpMD-_hJiP-edga6+HfqhRH_g0BkAqgg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm: sun4i: dsi: Use drm_panel_bridge,
 connector API
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 26, 2021 at 10:27 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Mon, Feb 15, 2021 at 01:11:01AM +0530, Jagan Teki wrote:
> > Use drm_panel_bridge to replace manual panel handling code.
> >
> > This simplifies the driver to allows all components in the
> > display pipeline to be treated as bridges, paving the way
> > to generic connector handling.
> >
> > Use drm_bridge_connector_init to create a connector for display
> > pipelines that use drm_bridge.
> >
> > This allows splitting connector operations across multiple bridges
> > when necessary, instead of having the last bridge in the chain
> > creating the connector and handling all connector operations
> > internally.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Most of the code removed in that patch was actually introduced earlier
> which feels a bit weird. Is there a reason we can't do that one first,
> and then introduce the bridge support?

This patch adds new bridge API's which requires the driver has to
support the bridge first.

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
