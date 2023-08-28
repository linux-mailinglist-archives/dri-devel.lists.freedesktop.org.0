Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B29078BB03
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 00:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA45010E0E1;
	Mon, 28 Aug 2023 22:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B68010E0E1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:28:40 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-d776e1f181bso3673691276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693261719; x=1693866519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xKUwU2oEeYyr/7CXpC4DFOlZ+UQetO3s7tPsVqBorGM=;
 b=lm1mc2LEXeE87zKgBNR7vU8dr9YWEbNheNquI057YL9JaTTE6USc+e203lJ8uPxiTB
 9MjI0fKa7jTI0b0Y6Oxh1XWfIxIQL8gPtHZECfFu7HYQttiDXPOpnii3QQiU3mBl9FAr
 Rs/CNMus90mkQ3tqVC4KjkruJ+IpB+BG0IH8OHNOUDb/rMRiaMKERKXpsJ94JhDhsjMl
 IdkJN19p3C+qKsCnHR57b3SILv1BRPy4AOvoND5xwms2T4hWncddRjIBk55pjxXJvo2Z
 w2KS35RYOO9q4ra6snWTjw9yd4bxp63vQWvWPQNwn4Qz/KyY3p/QxceUgCaSIqa4Sl/M
 laeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693261719; x=1693866519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xKUwU2oEeYyr/7CXpC4DFOlZ+UQetO3s7tPsVqBorGM=;
 b=crjx6dDfxKAeFh9ayC6hIn6/wT2XtFL/WrxmHWRISpCO9D1YMhBc0DjmsdaVQAdyu/
 3Iasd5wtuEV5bf8Y1Pt3pozZ2aVig2+eHvqmtwSykNDyCLPpQ2mu7JIdbGgEEATRpawq
 3QAsuxDaSk4dvS18MVvlUhXluh7VZA7cjNYC8XHkqwxs5V1kdfBtXHzhxvxXPLrujxr9
 o/4WMns6WOnwT9oo5HD1thEOM+b+ZnC5or8AGaKaKO5Ahyf7FjcjFlRB4uYmqtZwqWUJ
 /NxNWcsJbM0nIXBgyWATSk6qcnUWheZ/HNBaaXcT2/84637gv/ZEWlSjNdhDzehaKmAG
 aGAA==
X-Gm-Message-State: AOJu0YwE/53BZTjQoNHyLH++8fVzLHsZppXa+uFF9ToPgzC0FjlUfC4p
 btNM9xvai4ryJpGlqyy2YKPu6YzblgqulOnpKcy5lA==
X-Google-Smtp-Source: AGHT+IFJ9fvM0Zh6eTI95J9VlO3o1j21u36vUyYW5XG2cUNLfH+h3qmRhBVe/6MmbjJIHkuNkeDNLCQRQWaZNqI8OJA=
X-Received: by 2002:a25:d2c1:0:b0:d74:6681:5c26 with SMTP id
 j184-20020a25d2c1000000b00d7466815c26mr27113880ybg.16.1693261719097; Mon, 28
 Aug 2023 15:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230822141735.GA14396@pendragon.ideasonboard.com>
 <20230822141918.GB14396@pendragon.ideasonboard.com>
In-Reply-To: <20230822141918.GB14396@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Aug 2023 01:28:28 +0300
Message-ID: <CAA8EJpoAEyL3G41JPEV28siL=rVE+N5G7EedG4_up_oT0KKTPA@mail.gmail.com>
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

On Tue, 22 Aug 2023 at 17:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Aug 22, 2023 at 05:17:37PM +0300, Laurent Pinchart wrote:
> > Hi Dmitry,
> >
> > Thank you for the patches.
> >
> > On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
> > > Supporting DP/USB-C can result in a chain of several transparent
> > > bridges (PHY, redrivers, mux, etc). This results in drivers having
> > > similar boilerplate code for such bridges.
> >
> > What do you mean by transparent bridge here ? Bridges are a DRM concept,
> > and as far as I can tell, a PHY isn't a bridge. Why does it need to be
> > handled as one, especially if it's completely transparent ?
> >
> > > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > > bridge can either be probed from the bridge->attach callback, when it is
> > > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > > next bridge might not yet be available, because it depends on the
> > > resources provided by the probing device.
> >
> > Can't device links help avoiding defer probing in those cases ?
> >
> > > Last, but not least, this results in the the internal knowledge of DRM
> > > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
> >
> > Why so ? The PHY subsystem should provide a PHY, without considering
> > what subsystem it will be used by. This patch series seems to me to
> > actually create this DRM dependency in other subsystems,
>
> I was wrong on this one, there are indeed existing drm_bridge instances
> in drivers/usb/ and drivers/phy/. That's certainly not nice. Why do we
> even need drm_bridge there, why can't the PHYs be acquired by their
> consumers in DRM (and anywhere else) using the PHY API ?

During the design of the DT bindings for DisplayPort on these
platforms we have evaluated different approaches. First approach was
to add a special 'displayport' property to the USB-C connector,
pointing to DP. This approach was declined by DT maintainers. Then we
tried different approaches towards building connection graphs between
different parties. Finally it was determined that the easiest way is
to describe all USB-C signal paths properly. SS lines start at the
PHY, then they pass through different muxes and retimers and then end
up at the usb-c-connector. SS lines are muxed by the USB+DP PHY and
switched between USB-3 (SuperSpeed) and DP.

Then comes the question of binding everything together from the DRM
point of view. The usb-c-connector is the logical place for the last
drm_bridge, unfortunately. We need to send HPD events from the TypeC
port driver (either directly or from the altmode driver). Then either
we have to point the connector->fwnode to the DP port or build the
full drm_bridge chain. Second path was selected, as it fits better
into the overall framework.

>
> > which I don't
> > think is a very good idea. Resources should be registered in their own
> > subsystem with the appropriate API, not in a way that is tied to a
> > particular consumer.
> >
> > > To solve all these issues, define a separate DRM helper, which creates
> > > separate aux device just for the bridge. During probe such aux device
> > > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > > drivers to probe properly, according to the actual resource
> > > dependencies. The bridge auxdevs are then probed when the next bridge
> > > becomes available, sparing drivers from drm_bridge_attach() returning
> > > -EPROBE_DEFER.
> >
> > I'm not thrilled :-( Let's discuss the questions above first.
> >
> > > Proposed merge strategy: immutable branch with the drm commit, which is
> > > then merged into PHY and USB subsystems together with the corresponding
> > > patch.
> > >
> > > Changes since v3:
> > >  - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
> > >  - Renamed it to aux-bridge (since there is already a simple_bridge driver)
> > >  - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
> > >  - Added missing kfree and ida_free (Dan Carpenter)
> > >
> > > Changes since v2:
> > >  - ifdef'ed bridge->of_node access (LKP)
> > >
> > > Changes since v1:
> > >  - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge
> > >
> > > Dmitry Baryshkov (3):
> > >   drm/bridge: add transparent bridge helper
> > >   phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
> > >   usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
> > >
> > >  drivers/gpu/drm/bridge/Kconfig            |   9 ++
> > >  drivers/gpu/drm/bridge/Makefile           |   1 +
> > >  drivers/gpu/drm/bridge/aux-bridge.c       | 132 ++++++++++++++++++++++
> > >  drivers/phy/qualcomm/Kconfig              |   2 +-
> > >  drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  44 +-------
> > >  drivers/usb/typec/mux/Kconfig             |   2 +-
> > >  drivers/usb/typec/mux/nb7vpq904m.c        |  44 +-------
> > >  include/drm/bridge/aux-bridge.h           |  19 ++++
> > >  8 files changed, 167 insertions(+), 86 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
> > >  create mode 100644 include/drm/bridge/aux-bridge.h
>
> --
> Regards,
>
> Laurent Pinchart



-- 
With best wishes
Dmitry
