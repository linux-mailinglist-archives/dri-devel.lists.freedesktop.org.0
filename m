Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7BB7F4F9F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 19:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7374210E0BD;
	Wed, 22 Nov 2023 18:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8964810E0BD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 18:32:55 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5cc60973b4aso487677b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 10:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700677974; x=1701282774; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9evLgerhPexVHQkBogiwmvf7m2BOF4vHI4aXwGPPVJ4=;
 b=cZXdJZ3MSofFFzb2xXtUvETvnzpMqH7GEhLZb3SE0duMOsxxBYox6GU4SFjQaKrY7j
 jbT5NPIe/+XXZwFYlmYWvbHsnEDAGuL3uBLc0o/vxMyIFclHHKiiBRCw3dMm5PxdLJmZ
 1xV2XlvhSwozVQexifxBF2liA+IyNh06hYmWNLYFGr5lQGCLzoE4JJoO9CLO6YFlJiMA
 2TzEm0+lNcev+SVSi+0zMdA5qIWx0iHLzrvOj87hGfzrBT2jKEuholVXUQthmY+WgTCO
 9QOqca44RnOnCrbddrDhbD09x3EiyAXqiBzlqiN7FvmJncWdzbKHB+Gk7Ep1iX7hbNM0
 v7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700677974; x=1701282774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9evLgerhPexVHQkBogiwmvf7m2BOF4vHI4aXwGPPVJ4=;
 b=KeJY7/Yxfb0M+H6KiAM+rIB0E8Hr3c17a2I74YQj2WrS1U08vkJISm3U20sHJp96Ws
 AIzGofKoyHGfR2exAjBR+tsEkJO3BP1VB1q60qxZLeZMOqI1RGbGNDzEPAEt3YxSlqJ+
 Us/p6Qy6BJRIymWOg7Z3xnmC1qCdvC1WpZE+0G0YRvOJBOlgyj743i6y5T/54AWKCJtl
 5OUfMMavIQgc+e8csI4SSkUBvhuGPmJGL3S8IMM7WGtN+HYaNNtyo0MhNUlz16E+Nqww
 xtpkUY1oDNTSgnpV26iduCh5kPSyzFoHXV9dtp672oWGDlnFbJipGgXlXr+k5vI4K83M
 EkBA==
X-Gm-Message-State: AOJu0Yx4SzCe4Gy+fBrj+eewr6O2rgkTX0m3s5uSHSPBxPZDHJ1qIL1+
 0O5S40Cz0BFJqGdWQvOp6wtuFQC+tZYviqRK25quiQ==
X-Google-Smtp-Source: AGHT+IHyhJSWiia3K3sWSqzs9R4jjq04Y+WIUYIc2Ttxdvr+Ys8bPby4u0SJWAcMZONs2xz0YHXI4buzX0cWSLoaSkQ=
X-Received: by 2002:a0d:f245:0:b0:5c9:d64e:68c7 with SMTP id
 b66-20020a0df245000000b005c9d64e68c7mr3050822ywf.35.1700677974461; Wed, 22
 Nov 2023 10:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
 <7a4a6698-0954-4225-82ff-02dd13bd64bb@linux.dev>
In-Reply-To: <7a4a6698-0954-4225-82ff-02dd13bd64bb@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 20:32:45 +0200
Message-ID: <CAA8EJpoqfwyVYQy17QAOtrGr1AGzFkpKrOM5_F58=A95PoYncQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] drm: simplify support for transparent DRM bridges
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Nov 2023 at 18:03, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2023/11/4 07:03, Dmitry Baryshkov wrote:
> > Supporting DP/USB-C can result in a chain of several transparent
> > bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
> > in a different way resulted either in series of hacks or in device tree
> > not reflecting the actual hardware design. This results in drivers
> > having similar boilerplate code for such bridges.
>
> Please improve the written,  "resulted" -> "yield" ?
>
> > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > bridge can either be probed from the bridge->attach callback, when it is
> > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > next bridge might not yet be available, because it depends on the
> > resources provided by the probing device. Device links can not fully
> > solve this problem since there are mutual dependencies between adjancent
> > devices.
> >
> > Last, but not least, this results in the the internal knowledge of DRM
>
> There is a duplicated "the" word in this sentence.
>
> As far as I can understand, nearly all of those troubles are because the display bridges
> drivers are designed as a kernel module(.ko) instead of making them as static link-able
> helpers. I means that a display bridge device can not work standalone, as it have to be
> used with a display controller. So a display bridge is just a slave device or a auxiliary
> device. My question is: if it can't works by itself, we probably shouldn't design them as
> kernel modules style. Am I correct?

No. This has nothing to do with the driver being a kernel module or built-in.

>
> > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
>
> Yeah, this indeed a problem.
>
> > To solve all these issues, define a separate DRM helper, which creates
> > separate aux device just for the bridge.
>
> I'm supporting you if want to solve all these problems, this is fine and thanks a lot.
> But I want to ask a question, now that you are solving these problems by creating separate
> devices, does this manner match the hardware design perfectly? which is the hardware units
> you newly created device is corresponding to?

Aux devices do not always follow the actual hardware internals. For
example, see the TI sn65dsi86 driver, which also uses aux devices to
split dependency and probing chains.

> > During probe such aux device
> > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > drivers to probe properly, according to the actual resource
> > dependencies. The bridge auxdevs are then probed when the next bridge
> > becomes available, sparing drivers from drm_bridge_attach() returning
> > -EPROBE_DEFER.
>
> OK, as far as I can understand,  in order to solve the mentioned problem
> you are also retire the defer probe mechanism.

No, I'm not retiring the probe deferral mechanism. Instead I'm
splitting it into two chains. One going from the controller to the
usb-c connector for the signal flow, another going from the connector
back to the drm_encoder for the drm_bridge dependencies.

>
>
> > Changes since v5:
> >   - Removed extra semicolon in !DRM_AUX_HPD_BRIDGE stubs definition.
> >
> > Changes since v4:
> >   - Added documentation for new API (Sima)
> >   - Added generic code to handle "last mile" DP bridges implementing just
> >     the HPD functionality.
> >   - Rebased on top of linux-next to be able to drop #ifdef's around
> >     drm_bridge->of_node
> >
> > Changes since v3:
> >   - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
> >   - Renamed it to aux-bridge (since there is already a simple_bridge driver)
> >   - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
> >   - Added missing kfree and ida_free (Dan Carpenter)
> >
> > Changes since v2:
> >   - ifdef'ed bridge->of_node access (LKP)
> >
> > Changes since v1:
> >   - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge
> >
> > Dmitry Baryshkov (6):
> >    drm/bridge: add transparent bridge helper
> >    phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
> >    usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
> >    drm/bridge: implement generic DP HPD bridge
> >    soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
> >    usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
> >
> >   drivers/gpu/drm/bridge/Kconfig                |  17 ++
> >   drivers/gpu/drm/bridge/Makefile               |   2 +
> >   drivers/gpu/drm/bridge/aux-bridge.c           | 140 +++++++++++++++
> >   drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 164 ++++++++++++++++++
> >   drivers/phy/qualcomm/Kconfig                  |   2 +-
> >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  44 +----
> >   drivers/soc/qcom/Kconfig                      |   1 +
> >   drivers/soc/qcom/pmic_glink_altmode.c         |  33 +---
> >   drivers/usb/typec/mux/Kconfig                 |   2 +-
> >   drivers/usb/typec/mux/nb7vpq904m.c            |  44 +----
> >   drivers/usb/typec/tcpm/Kconfig                |   1 +
> >   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c |  41 +----
> >   include/drm/bridge/aux-bridge.h               |  37 ++++
> >   13 files changed, 383 insertions(+), 145 deletions(-)
> >   create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
> >   create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
> >   create mode 100644 include/drm/bridge/aux-bridge.h
> >



-- 
With best wishes
Dmitry
