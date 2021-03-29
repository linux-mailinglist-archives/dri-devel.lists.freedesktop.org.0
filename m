Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66A34D685
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 20:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8AC89CDF;
	Mon, 29 Mar 2021 18:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9328789CDF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 18:02:45 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id e8so13691285iok.5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 11:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Au5y7OoRawkUEJFPbHpW7802nDwRo0nj5nxIyw0Dfa8=;
 b=Zyv3esmbX3USPfY9NAG7q5qJ25C5cUmKUK84xtlRwZWvmEl9I9Vqc5cxJLsk1TUGi2
 MHGmzk+I9z1q7ecO1VPAa36DUoII1M34Y5/YSt73CTOgG2rthe8T+jq+pM+TT+wZ/ouH
 wMDgcJ7f8eOshtxjUXzmZ8WIqfIJyGirgIKQ66p9iWswBXj2B+Cdaff6XyJ3OyCeiqR/
 R1CRqn/hHZAOAEOFQoDV936hEf9CcA2fqSS7viWb85sEjL1LveJTJQkbxoO10OIgo98T
 oJOqBG0G/D261zEsXroGXVguWv00cRCPbeGpnOpJtvg4yLd69XejIXoU5GJNJxjD64P/
 VA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Au5y7OoRawkUEJFPbHpW7802nDwRo0nj5nxIyw0Dfa8=;
 b=BxZUf9XU0bSJ48aSVDzJNUdrZx1jKeAozH1Rcj2ngCdvowStWYs8VEWk5T84WOf0Xb
 kEWhPfbGWMy86G7N5qvOp60HDw40xvnfyX+ghqyEIl4jzliNdCk9nQXi1VYNPmERR+Rs
 xGT/rbrNd0Nqxascv76z1vUiYzJvmPNayx9IOXcreSkcH1+V1wMbrxkmyWDeI0w0LB0S
 WeAaP19si5/0LssEDvYA0tE5RZT+28ShGBRLY3XxBEcyDLXk4s1UMDW8tkEu81tFRALF
 yoH4qONM5iIKPbs+DeDerXnHbhneo+vT40d9F/yVl1YqUTdIZasVNE8FyzEhVWW7/3ZA
 k8Dg==
X-Gm-Message-State: AOAM530AugmwYVf7Gv1CA0DemslyFEFsD2o3OPW2c4UORaL9rjP3trup
 gj90vV0z4sLsRZNV+FZbz1J5UDKYzFMhpZ2z4t+WHg==
X-Google-Smtp-Source: ABdhPJxZkJRqw/QeGv+RrSKRBGLc4oFkV6J1+/TGuuqVGXQHnaoEB7kMLbeNK26s3AKHKzDMmyeObLY3VW0lugoGEc8=
X-Received: by 2002:a05:6602:1c9:: with SMTP id
 w9mr20873871iot.201.1617040964939; 
 Mon, 29 Mar 2021 11:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616135353.git.xji@analogixsemi.com>
 <189a637c87827f78c433a053e3c2129ebec73188.1616135353.git.xji@analogixsemi.com>
 <CAMavQKLN04F2rzu7J121N4GvQKh7kq9yXGk+fBSUjsC2nbiSiA@mail.gmail.com>
 <20210329102710.GA1930154@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20210329102710.GA1930154@anxtwsw-Precision-3640-Tower>
From: Sean Paul <sean@poorly.run>
Date: Mon, 29 Mar 2021 14:02:08 -0400
Message-ID: <CAMavQKJHakp0ZfHFEy77r8wHY+3uaP-6Ab2ren6vA46njpjx3g@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] drm/bridge: anx7625: add HDCP support
To: Xin Ji <xji@analogixsemi.com>
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Zhen Li <zhenli@analogixsemi.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Foss <robert.foss@linaro.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bernie Liang <bliang@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 6:27 AM Xin Ji <xji@analogixsemi.com> wrote:
>
> On Thu, Mar 25, 2021 at 02:19:23PM -0400, Sean Paul wrote:
> > On Fri, Mar 19, 2021 at 2:35 AM Xin Ji <xji@analogixsemi.com> wrote:
> > >
> > > Add HDCP feature, enable HDCP function through chip internal key
> > > and downstream's capability.
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---

/snip

> > >  static void anx7625_dp_start(struct anx7625_data *ctx)
> > >  {
> > >         int ret;
> > > @@ -643,6 +787,9 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > >                 return;
> > >         }
> > >
> > > +       /* HDCP config */
> > > +       anx7625_hdcp_setting(ctx);
> >
> > You should really use the "Content Protection" property to
> > enable/disable HDCP instead of force-enabling it at all times.
> >
> > Sean
> Hi Sean, it's hard to implement "Content Protection" property, we have
> implemented HDCP in firmware, it is not compatible with it. We don't
> have interface to get Downstream Cert.
> Thanks,
> Xin

Hi Xin,
I'm sorry, I don't understand what you mean when you say you don't
have an interface to get Downstream Cert.

The Content Protection property is just a means through which
userspace can turn on and turn off HDCP when it needs. As far as I can
tell, your patch turns on HDCP when the display is enabled and leaves
it on until it is disabled. This is undesirable since it forces HDCP
on the user.

Is it impossible to enable/disable HDCP outside of display
enable/disable on your hardware?

Thanks,

Sean

> >
> > > +
> > >         if (ctx->pdata.is_dpi)
> > >                 ret = anx7625_dpi_config(ctx);
> > >         else

/snip
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
