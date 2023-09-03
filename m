Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0038B790E11
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D0C10E127;
	Sun,  3 Sep 2023 21:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FA810E20D
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:02:31 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-d7830c5b20aso1139580276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693774950; x=1694379750; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wyrVivbOL8H2+2oy0DBeynxfE8rpivKsaojvi9l90MQ=;
 b=sYS08vOXtCEZzh9ct+27+u5tK0zTymhgvpFxl0XLQq79llmSQlna/4+DJEwnRMbbHA
 vlXk+1hZQEGSGDcQ+eTPiOFbNogH7x2Nsfbg+Ps5nYd3naWVHrk8rmcSzvUgwsAHnclk
 CCM6QkDxPLzBBe2jfU3SB4Utl8bwv5YWSKFZettnTTfLU6US09JWOdVci4QjjHQxvJj0
 6oc1qZ4Tr/97aMurS6P9ycLzQxyb6WHTtCTpyCeiO1gpg6T5Wf4bUyDkfHfV+e2S2C61
 uDUvYITeg7POCrvnLhUTS1Z+tG+pzRMwiJMhwR0LdlIDcIzA79nzpPWYR3FupBI0mMJe
 v8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774950; x=1694379750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wyrVivbOL8H2+2oy0DBeynxfE8rpivKsaojvi9l90MQ=;
 b=dqKRrX+JdbbTacPmAfj+rFc7GySKEpCcCoaZMi79ZK2EvPbOIL2mj4URlt3X1JuZAW
 JzEXiwUEIV2/aDDzEQlo4j3c2VkI68IXFF3LFv9DuCSVA2HsnTRteCMFWhdjhXjkc2MX
 FjLSTa9OacNU3yMWiT0hd3gdAFKVv9VvVjo6UqGL0R3I6yBzeDpTgk4hjNbvXPr88v3s
 GoW2Jp+UL8IXWvKWOsna4k55jKFUrUhBd3Wt06E2KCsknvDb2HZ9y4cXZQmyVq+LJRYU
 vjVdZrmojCFqwEqQyQ1gRUe5YjqWhydDgjrlkdJpMPfz8Na8dhHx3GpkK1LUDkUI63po
 eD1A==
X-Gm-Message-State: AOJu0YziXgOXTYgsShqzTouq2hUEBcgh674iUgucMTZznCfVc7rnl2Ag
 /uUf8cgEeS3NDLWIRsPfQl23dKVZfCoRlcxvF553Gg==
X-Google-Smtp-Source: AGHT+IEIksLV6i1JQnXxmFBaEbAx0vYPQzKu+YxnPk5mSfeHKOjrFxxCLATBwQ5f3mGZqO72LEeDFc4Kwock6sj7f10=
X-Received: by 2002:a25:d20e:0:b0:d74:6cb3:bb77 with SMTP id
 j14-20020a25d20e000000b00d746cb3bb77mr10416043ybg.28.1693774950042; Sun, 03
 Sep 2023 14:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230822141735.GA14396@pendragon.ideasonboard.com>
In-Reply-To: <20230822141735.GA14396@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Sep 2023 00:02:18 +0300
Message-ID: <CAA8EJpp_FYOKHziHOWF6E1RTkHEJ8oXXH90EDmJbLG1UDO1ofA@mail.gmail.com>
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

On Tue, 22 Aug 2023 at 17:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dmitry,
>
> Thank you for the patches.
>
> On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
> > Supporting DP/USB-C can result in a chain of several transparent
> > bridges (PHY, redrivers, mux, etc). This results in drivers having
> > similar boilerplate code for such bridges.
>
> What do you mean by transparent bridge here ? Bridges are a DRM concept,
> and as far as I can tell, a PHY isn't a bridge. Why does it need to be
> handled as one, especially if it's completely transparent ?
>
> > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > bridge can either be probed from the bridge->attach callback, when it is
> > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > next bridge might not yet be available, because it depends on the
> > resources provided by the probing device.
>
> Can't device links help avoiding defer probing in those cases ?

It looks like both Neil and I missed this question.

Two items wrt devlinks. First, I view them as a helper. So if one
disables the devlinks enforcement, he'd still get a deferral loop.

Second, in this case we can not enforce devlinks (or return
-EPROBE_DEFER from the probe() function) because the next bridge is
not yet available when the main driver probes. Unfortunately bridges
are allocated in the opposite order. So, using AUX devices helps us to
break it. Because first typec mux/retimer/switch/etc devices probe (in
the direction from the typec source to the typec port). Then DRM
bridge devices are probed starting from the end of the chain
(connector) to the DP source (root DP bridge/controller).

>
> > Last, but not least, this results in the the internal knowledge of DRM
> > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
>
> Why so ? The PHY subsystem should provide a PHY, without considering
> what subsystem it will be used by. This patch series seems to me to
> actually create this DRM dependency in other subsystems, which I don't
> think is a very good idea. Resources should be registered in their own
> subsystem with the appropriate API, not in a way that is tied to a
> particular consumer.
>
> > To solve all these issues, define a separate DRM helper, which creates
> > separate aux device just for the bridge. During probe such aux device
> > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > drivers to probe properly, according to the actual resource
> > dependencies. The bridge auxdevs are then probed when the next bridge
> > becomes available, sparing drivers from drm_bridge_attach() returning
> > -EPROBE_DEFER.
>
> I'm not thrilled :-( Let's discuss the questions above first.

Laurent, please excuse me for the ping. Any further response from your side?
I'd like to send the next iteration of this patchset.

> > Proposed merge strategy: immutable branch with the drm commit, which is
> > then merged into PHY and USB subsystems together with the corresponding
> > patch.


-- 
With best wishes
Dmitry
