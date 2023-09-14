Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A27A1074
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 00:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D94C10E59D;
	Thu, 14 Sep 2023 22:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDB210E594
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 22:01:13 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1d643db2c98so447783fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 15:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694728872; x=1695333672; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iJltS85I38KEiAoHx6Tz1cZkHVUVHwMiAdBjIEVuJGs=;
 b=agQMO8Tz13WQv45bNyaExBnTtY2Gjhh9AysQ7S8K7/720qTbO0sPuQSwqBEndyCj5d
 bSwdslp2HhrdSCEYaQSgtbKmRL7wRAwenAPWnxElGnPWMbQkqetWm4Kcd9vrPUeJ0VCQ
 8TfrVqqldPoklaFF48RPC85dxJdJEgrutrd7XZEPCO1r+xneDMgxoLEHOmRCP2D6WL/+
 m4z+2MNBJpk2xYFouLO+GHVYn72zEaB/YDjicrtYLnK+gTjNoDC3lnTx57ei9LQCw1vP
 72HwHvJAY0n9TCpmCfODJ/nbvTranjNPd9+EcXJRSqOGiG7J9f9hwxSKk48fBOvvQVFc
 z7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694728872; x=1695333672;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iJltS85I38KEiAoHx6Tz1cZkHVUVHwMiAdBjIEVuJGs=;
 b=FfZnj+/kWrAEjIMtcepUt1KEnaVmQg27EVON8qiS927PDpK6aR/wDPxHw3QDISnDre
 8oU8cLuEHDfZMPmXrbV8S9Ga9T+EkGus/ZzaKo3UUx9bVFIODGYh+iVlFz7XpeCxGJpN
 /MmpxSSk8FfNre8Ef8OuLdPZS5lCJoQH050t+6ZaN99qxOs4YwzC4DVC+06DHCFji+9w
 wKNLFpEzcJ7zf0P1G00eZ/L+2nROq+uCBtHl09zEYyB/O+F2w5EdC2l06X0ELd0DBrMF
 lMlnGUJnpJSTN4diTq7DgEA979MdgW3AgzECWRAbx4C2tePlLLxCRNQoF+4jihqqEmSO
 4NLg==
X-Gm-Message-State: AOJu0Yy8Bsp3K7cqa3kLs1DvYzISsne9I6+PMNSo0K3E2afQe959G1CP
 lTshmDHe7DcxxyTda7d9Q/eSfhlricYiroDkWYy+Pw==
X-Google-Smtp-Source: AGHT+IFX7NWOtRIfFrp1fdFuHGHm16plxoB4/Psy2d9IOFYk6s9puCcLtsP+cJFV81IYzSziBe2I/frWdyl2sihUWsI=
X-Received: by 2002:a05:6870:e98b:b0:1d5:8f05:39c1 with SMTP id
 r11-20020a056870e98b00b001d58f0539c1mr7574635oao.15.1694728872154; Thu, 14
 Sep 2023 15:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230822141735.GA14396@pendragon.ideasonboard.com>
 <CAA8EJpp_FYOKHziHOWF6E1RTkHEJ8oXXH90EDmJbLG1UDO1ofA@mail.gmail.com>
 <20230914214416.GB11890@pendragon.ideasonboard.com>
In-Reply-To: <20230914214416.GB11890@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Sep 2023 01:01:00 +0300
Message-ID: <CAA8EJprBGrG0qMO3yrPxcPZu8kqcOZNw6htZZSKutYfFcZxBfQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm: simplify support for transparent DRM bridges
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Sept 2023 at 00:44, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Sep 04, 2023 at 12:02:18AM +0300, Dmitry Baryshkov wrote:
> > On Tue, 22 Aug 2023 at 17:17, Laurent Pinchart wrote:
> > > On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
> > > > Supporting DP/USB-C can result in a chain of several transparent
> > > > bridges (PHY, redrivers, mux, etc). This results in drivers having
> > > > similar boilerplate code for such bridges.
> > >
> > > What do you mean by transparent bridge here ? Bridges are a DRM concept,
> > > and as far as I can tell, a PHY isn't a bridge. Why does it need to be
> > > handled as one, especially if it's completely transparent ?
> > >
> > > > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > > > bridge can either be probed from the bridge->attach callback, when it is
> > > > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > > > next bridge might not yet be available, because it depends on the
> > > > resources provided by the probing device.
> > >
> > > Can't device links help avoiding defer probing in those cases ?
> >
> > It looks like both Neil and I missed this question.
>
> And I missed this reply before replying to Neil and pointing to device
> links again :-)
>
> > Two items wrt devlinks. First, I view them as a helper. So if one
> > disables the devlinks enforcement, he'd still get a deferral loop.
>
> That may be true, but I don't think that's a compelling argument. If one
> disables components meant to avoid probe deferral, they should expect
> probe deferral :-)

There is a difference between bare probe deferral and deferral boot
loop. In this case this causes a loop, since deferred devices get
reprobed after devices being created/removed (which happens during DP
controller deferral).
I'm fine with the occasional probe deferrals, especially if they are a
result of the user's misdeed. But the deferral cycle shows that there
is an issue in the device / driver structure.

>
> > Second, in this case we can not enforce devlinks (or return
> > -EPROBE_DEFER from the probe() function) because the next bridge is
> > not yet available when the main driver probes. Unfortunately bridges
> > are allocated in the opposite order. So, using AUX devices helps us to
> > break it. Because first typec mux/retimer/switch/etc devices probe (in
> > the direction from the typec source to the typec port). Then DRM
> > bridge devices are probed starting from the end of the chain
> > (connector) to the DP source (root DP bridge/controller).
>
> I'm not too familiar with the drivers involved in the typec chain. Do
> you mean that the sink driver needs to get hold of the source device at
> probe time, deferring probe if the source is not available ? Does the
> driver handler the USB connector need to do the same ? I'm looking at
> the qcom_pmic_typec driver and I don't immediately see where it would
> defer probing if its source isn't available, but I may well be missing
> something.

This is well hidden via the tcpm_register_port() ->
typec_register_port() callchain. It checks (among other things) for
the mux and retimer being present and probed.
Same story applies to the retimers, which require 'previous' USB-C
switch to be probed.

So there is a dependency chain of qcom_pmic_typec -> nb7vpq904m ->
qmp_combo_phy.

For DRM bridge drivers I'd like to have the opposite dependency chain
(so that the bridge knows that it can attach the next bridge):
qmp_combo_phy -> nb7vpq904m -> qcom_pmic_typec.

This patchset solves this by splitting drm bridges to separate aux
drivers. So the resulting chain is:

qmp_combo_phy.bridge -> nb7vpq904m.bridge. -> qcom_pmic_typec ->
nb7vpq904m (main) -> qmp_combo_phy (main)

>
> > > > Last, but not least, this results in the the internal knowledge of DRM
> > > > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
> > >
> > > Why so ? The PHY subsystem should provide a PHY, without considering
> > > what subsystem it will be used by. This patch series seems to me to
> > > actually create this DRM dependency in other subsystems, which I don't
> > > think is a very good idea. Resources should be registered in their own
> > > subsystem with the appropriate API, not in a way that is tied to a
> > > particular consumer.
> > >
> > > > To solve all these issues, define a separate DRM helper, which creates
> > > > separate aux device just for the bridge. During probe such aux device
> > > > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > > > drivers to probe properly, according to the actual resource
> > > > dependencies. The bridge auxdevs are then probed when the next bridge
> > > > becomes available, sparing drivers from drm_bridge_attach() returning
> > > > -EPROBE_DEFER.
> > >
> > > I'm not thrilled :-( Let's discuss the questions above first.
> >
> > Laurent, please excuse me for the ping. Any further response from your side?
> > I'd like to send the next iteration of this patchset.
> >
> > > > Proposed merge strategy: immutable branch with the drm commit, which is
> > > > then merged into PHY and USB subsystems together with the corresponding
> > > > patch.


-- 
With best wishes
Dmitry
