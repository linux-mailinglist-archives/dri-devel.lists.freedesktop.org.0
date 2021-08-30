Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA9C3FB99A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 18:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE2D89B29;
	Mon, 30 Aug 2021 16:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C5689AEE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 16:02:14 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id b10so20580835ioq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G49FQ0uWZW6i9vFSjQGplZyOwvgazjM4XABr+KXbVDU=;
 b=FgHn+o867IORlJciLs9Bi5TiNrh3rHwcUaE5v5BWRE+D8Ogj7RMwzmHDca7m5f8xyj
 9k6vgOSezNdEwZZ1S0k2a3NC7CqeBjcGdzWdN8NEYaWiFGWtWUCGltPFnCPFQ9udKeno
 Z4/rimxn50hBdSQnCkBaIIuQD78qeLnmmelk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G49FQ0uWZW6i9vFSjQGplZyOwvgazjM4XABr+KXbVDU=;
 b=ghX8DcJW/wrvlIRAw/HEK2Qan5ZC790N4HnzPTcYH3fJK5GVFO0fLy4VG7R/JaCJal
 mUO9Jnyf0RcJzDAdOCMBSpj7AZRciBhodvxtVSimhewaNrsDKk56PpjTyEh5HRY8Nejn
 SmJAYCGA2oh/k9UoTw2i0xUtrCXLe+ONs99fWStKn03THVyRG2BOhWkUfSVmym2UM8/Q
 nw6XNRMjFzZxVJu2hoT3tsV7IS0KCKpe+jObaZB7nicnTlwYhK0XegfCSuVeh4FnyMV7
 cFVgyEiS8f7LUjn+BGNri884/xTKtUZC2bOUInqSX9AsPOCt1x5RM4nju/ptetzpYHx9
 +jfg==
X-Gm-Message-State: AOAM531iMnyXlhTDlO+0BvT68lMaZJdYUxnxlbHSGhSYLSz0ItpK120G
 UZ7LNKgmsEYQChF2x7EDrNtXiYkQSTvnvA==
X-Google-Smtp-Source: ABdhPJydq1m57InBplhAN/L1SxLacaQGk5GzsBRFNvuJUs0/QMf2SnE++iZnbw1qUZoZmEpygwsSSA==
X-Received: by 2002:a5e:d80a:: with SMTP id l10mr4419571iok.36.1630339333263; 
 Mon, 30 Aug 2021 09:02:13 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id e22sm5262089iob.52.2021.08.30.09.02.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 09:02:12 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id e186so20559290iof.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 09:02:11 -0700 (PDT)
X-Received: by 2002:a02:c7d2:: with SMTP id s18mr17206234jao.22.1630339331487; 
 Mon, 30 Aug 2021 09:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
 <YSpK3wTUdqlUyJxb@yoga>
In-Reply-To: <YSpK3wTUdqlUyJxb@yoga>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Aug 2021 09:01:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URLJHujmu36sNMfPVMYtDZUirJq5T-PLbeMGqjLuMtNQ@mail.gmail.com>
Message-ID: <CAD=FV=URLJHujmu36sNMfPVMYtDZUirJq5T-PLbeMGqjLuMtNQ@mail.gmail.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Vara Reddy <varar@codeaurora.org>, freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Aug 28, 2021 at 7:40 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 27 Aug 15:52 CDT 2021, Doug Anderson wrote:
>
> > Hi,
> >
> > On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > +static int dp_parser_find_panel(struct dp_parser *parser)
> > > +{
> > > +       struct device_node *np = parser->pdev->dev.of_node;
> > > +       int rc;
> > > +
> > > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> >
> > Why port 2? Shouldn't this just be port 1 always? The yaml says that
> > port 1 is "Output endpoint of the controller". We should just use port
> > 1 here, right?
> >
>
> I thought port 1 was the link to the Type-C controller, didn't give it a
> second thought and took the next available.
>
> But per the binding it makes sense that the panel is the "Output
> endpoint of the controller" and I guess one will have either a Type-C
> controller or a panel - even after the DP rework?

Right, my understanding is that "port 1" is the output port
irregardless of whether you're outputting to a panel or a DP
connector. I think the only case it would make sense to add a new port
is if it was possible for the output to be connected to both a panel
and a DP port simultaneously. ...but that doesn't make sense.

-Doug
