Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF777421B47
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 02:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED246E2B4;
	Tue,  5 Oct 2021 00:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468A26E2B4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 00:42:05 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id d20so4048727qvm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 17:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIEfmhHMWRR+UfbfarKixY0VfYOQ7qrc2Yu2ffv5Aws=;
 b=HVKYKpLYZsQ9UTyyVy1Vf68F9k+FOnBn7+9LJBhoCIDGj4DtpqnbiLLEuHoP7URbRu
 yWbC7e48enorTEgwAc9q+sBTCplD/Nk3G42Ixoy6VrM2x9T1VsqUikRntsEX0fSkrzfT
 mapzJmRojmYesEyumCJd5at2lucUUJNvK2HSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIEfmhHMWRR+UfbfarKixY0VfYOQ7qrc2Yu2ffv5Aws=;
 b=RXhoVm5AmRWlMm+LgCGAKui6VsCsQ7a21ozRXE1+x6Ny7Q+41zACS7LqjgsAJen/M/
 gSlclbZutlzRfo/l9XrIE9RASv9I2PGCOkkEjnUE7d0ReVbsXZ2PYnzStoAVqcDgW8B/
 JNGGUoa6EMnN/cmpupfBNxtwxZawOZEQk96CrYETu0IpPbQokzbx5STvUevb244Hl4qs
 rlyOk7CAXYC67GyxDiwziPrKAoV47RFsLkrwBZNhSYpKyhd5eZh1qu4aGohcp/Gx9KR+
 Ost5bMcEVqwnZmXHMqG8ItKNNDDu0KaOLs3ULlO1aZs7D8WCPQBvKOvZ+o6mtL0eheav
 lJPQ==
X-Gm-Message-State: AOAM530I/TtS66XxjTmPpZ850/CFfL92DQqEsy1iBB42+tGuzM8IYd6P
 fFJtrzXu8o4GaLOfv/5i1lDFWxNgi7VrwA==
X-Google-Smtp-Source: ABdhPJxLDRkoCzvpOnmaOyDnp7bnnHXCz5gqcq5nx6QapxBX5AuOsJmFIdXSEchQolhFkYd7DAlTRw==
X-Received: by 2002:ad4:57ac:: with SMTP id g12mr25138390qvx.49.1633394524210; 
 Mon, 04 Oct 2021 17:42:04 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com.
 [209.85.222.182])
 by smtp.gmail.com with ESMTPSA id d17sm11171935qte.0.2021.10.04.17.42.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 17:42:03 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id 194so18273747qkj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 17:42:03 -0700 (PDT)
X-Received: by 2002:a02:c7d2:: with SMTP id s18mr175853jao.68.1633394182579;
 Mon, 04 Oct 2021 17:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
 <YVd3YdfgFVc0Br5T@ripper>
In-Reply-To: <YVd3YdfgFVc0Br5T@ripper>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Oct 2021 17:36:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
Message-ID: <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
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

On Fri, Oct 1, 2021 at 2:00 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:
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
> Finally got back to this, changed it to 1 and figured out why I left it
> at 2.
>
> drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
> reference to the USB-C controller, scan through the registered panels
> and conclude that the of_node of the USB-C controller isn't a registered
> panel and return -EPROBE_DEFER.

I'm confused, but maybe it would help if I could see something
concrete. Is there a specific board this was happening on?

Under the DP node in the device tree I expect:

ports {
  port@1 {
    reg = <1>;
    edp_out: endpoint {
      remote-endpoint = <&edp_panel_in>;
    };
  };
};

If you have "port@1" pointing to a USB-C controller but this instance
of the DP controller is actually hooked up straight to a panel then
you should simply delete the "port@1" that points to the typeC and
replace it with one that points to a panel, right?

-Doug
