Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274D984256
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F384D10E696;
	Tue, 24 Sep 2024 09:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YZeLIozd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2BC10E692
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:38:31 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f752d9ab62so53695221fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727170710; x=1727775510; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/nisFp8RKAs/gX3FD0xOUvyQj0aIVN5DLGlMJinQ3Dk=;
 b=YZeLIozdEH/g5IqdaVgP4o8LuNjStVuG7CuG+//EfSEMcsWOzIzVvCgHZE1rEerzTj
 ZCKE0x2vsMxmUD1s2otDWqboQ980ulZRqBsensNfh5iFaE9TuWgpn7cJDjO2ht0zUDqH
 je+C57u5FO0gm0+j63pxtr+VgvJPQ8tMO8C3bAqAjWzcmMg4oo5i3NdBsIkk6YJv7dZB
 GrFtLqITkS+S65NZndlG8Uijlcw8Y06HcIDGEv3AE6QzrMJts+JxOHxv4vQ62VyL9I97
 hea/fddIO4w3w4o398i8uUtJccT74a4XY673BXZa/WUnCAAxouFq/Kh9t28hPN1S8Gcd
 M1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727170710; x=1727775510;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/nisFp8RKAs/gX3FD0xOUvyQj0aIVN5DLGlMJinQ3Dk=;
 b=ehVspDnCRys2j7zVNe93kLZ6QSM+E/yhyYGtASYPFarLBiZY4QTIsTMLrkqA4TQMwD
 NWxROmS2zQiuhV2eDNa2a5qBoHkiufwTQGAQK4KAYDG0jpRr6G1vEBUrwBQ7aTnqrr18
 JZmVDzGRGef6EcF8H8YYQp8SIrRo9MO303ymXhSNMM2/w/nk391HoNFTkTmuglv3sAfg
 xre0hke4nbavBvJI/J2O2GwSyNBOgeBoqJi8Q0COxlJUazwYsIY63AjpYBMjsH8211iy
 1tphfEtnpeSfIIOd7ndKgWAxxw6ClTs1+4idKee/Gr5GfToEfsUX7Y3TaQxe7IggMj3F
 OW2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWambgEnkCkzJ5r6yQoRSTLbXxjdpfrshwvK+wzr0scx4fJLbch/OT0QBQqhyhfDVjCvLEoJwvPaW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlQnWR1562xMRsnl3yliHxtOdvP9gJOeCp8328/wxwrHkUG6nM
 yCW6Flu4nUnPe4FvQOiBqPnuU5k3Qpgkv3/kC18HdnHzrfbniDRNrMBF4NqVDQY=
X-Google-Smtp-Source: AGHT+IEVkdo9IU3eIpJK0EZxoXqGXjm1n93E9m6udz7QEOiMd5oLT7l8JD5yFadH+lkhJgbpkNuuYA==
X-Received: by 2002:a2e:bea1:0:b0:2f7:4f58:4a9c with SMTP id
 38308e7fff4ca-2f7cb2eda53mr79119231fa.16.1727170709926; 
 Tue, 24 Sep 2024 02:38:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d28b5c15sm1627151fa.133.2024.09.24.02.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 02:38:29 -0700 (PDT)
Date: Tue, 24 Sep 2024 12:38:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <sandor.yu@nxp.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, 
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, 
 "vkoul@kernel.org" <vkoul@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, 
 dl-linux-imx <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>, 
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [EXT] Re: [PATCH v16 4/8] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Message-ID: <3z53w7kzwnsn3pg5elp5fbueid323t47yyhub67muidd6k47me@assca4bckdt5>
References: <cover.1719903904.git.Sandor.yu@nxp.com>
 <359914108b879e995d4a39de32a33310009f0fab.1719903904.git.Sandor.yu@nxp.com>
 <20240702-quartz-salamander-of-culture-eec264@houat>
 <PAXPR04MB94480AB0490BBF00D2BA17BBF4932@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <20240903-gay-capable-hound-3cbef2@houat>
 <PAXPR04MB9448EF507CB5C18A43239A80F49E2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <20240912-zippy-mongoose-of-domination-2ebc1d@houat>
 <PAXPR04MB94484D86A71A7527ADD42EA4F4652@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <CAA8EJpphegHmBFgH1-n9PEkrr-Ys+HCvekKGNYRp=xQxgmC0Cw@mail.gmail.com>
 <PAXPR04MB94481627922756E892C37B7DF4682@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB94481627922756E892C37B7DF4682@PAXPR04MB9448.eurprd04.prod.outlook.com>
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

On Tue, Sep 24, 2024 at 07:04:58AM GMT, Sandor Yu wrote:
>  
> > 
> > On Fri, 13 Sept 2024 at 11:46, Sandor Yu <sandor.yu@nxp.com> wrote:
> > >
> > >
> > > > Subject: Re: [EXT] Re: [PATCH v16 4/8] drm: bridge: Cadence: Add
> > > > MHDP8501 DP/HDMI driver
> > > >
> > > > On Fri, Sep 06, 2024 at 02:50:08AM GMT, Sandor Yu wrote:
> > > > > > On Tue, Sep 03, 2024 at 06:07:25AM GMT, Sandor Yu wrote:
> > > > > > > > -----Original Message-----
> > > > > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On
> > > > > > > > Behalf Of Maxime Ripard
> > > > > > > > Sent: 2024年7月2日 21:25
> > > > > > > > To: Sandor Yu <sandor.yu@nxp.com>
> > > > > > > > Cc: dmitry.baryshkov@linaro.org; andrzej.hajda@intel.com;
> > > > > > > > neil.armstrong@linaro.org; Laurent Pinchart
> > > > > > > > <laurent.pinchart@ideasonboard.com>; jonas@kwiboo.se;
> > > > > > > > jernej.skrabec@gmail.com; airlied@gmail.com;
> > > > > > > > daniel@ffwll.ch;
> > > > > > > > robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > > > > > > > shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > > festevam@gmail.com;
> > > > > > > > vkoul@kernel.org; dri-devel@lists.freedesktop.org;
> > > > > > > > devicetree@vger.kernel.org;
> > > > > > > > linux-arm-kernel@lists.infradead.org;
> > > > > > > > linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org;
> > > > > > > > kernel@pengutronix.de; dl-linux-imx <linux-imx@nxp.com>;
> > > > > > > > Oliver Brown <oliver.brown@nxp.com>;
> > > > > > > > alexander.stein@ew.tq-group.com; sam@ravnborg.org
> > > > > > > > Subject: [EXT] Re: [PATCH v16 4/8] drm: bridge: Cadence: Add
> > > > > > > > MHDP8501 DP/HDMI driver
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > There's still the scrambler issue we discussed on v15, but I
> > > > > > > > have some more comments.
> > > > > > > >
> > > > > > > > On Tue, Jul 02, 2024 at 08:22:36PM GMT, Sandor Yu wrote:
> > > > > > > > > +enum drm_connector_status cdns_mhdp8501_detect(struct
> > > > > > > > > +cdns_mhdp8501_device *mhdp) {
> > > > > > > > > +   u8 hpd = 0xf;
> > > > > > > > > +
> > > > > > > > > +   hpd = cdns_mhdp8501_read_hpd(mhdp);
> > > > > > > > > +   if (hpd == 1)
> > > > > > > > > +           return connector_status_connected;
> > > > > > > > > +   else if (hpd == 0)
> > > > > > > > > +           return connector_status_disconnected;
> > > > > > > > > +
> > > > > > > > > +   dev_warn(mhdp->dev, "Unknown cable status, hdp=%u\n",
> > > > hpd);
> > > > > > > > > +   return connector_status_unknown; }
> > > > > > > > > +
> > > > > > > > > +static void hotplug_work_func(struct work_struct *work) {
> > > > > > > > > +   struct cdns_mhdp8501_device *mhdp = container_of(work,
> > > > > > > > > +                                                struct
> > cdns_mhdp8501_device,
> > > > > > > > > +
> > hotplug_work.work);
> > > > > > > > > +   enum drm_connector_status status =
> > > > > > cdns_mhdp8501_detect(mhdp);
> > > > > > > > > +
> > > > > > > > > +   drm_bridge_hpd_notify(&mhdp->bridge, status);
> > > > > > > > > +
> > > > > > > > > +   if (status == connector_status_connected) {
> > > > > > > > > +           /* Cable connected  */
> > > > > > > > > +           DRM_INFO("HDMI/DP Cable Plug In\n");
> > > > > > > > > +           enable_irq(mhdp->irq[IRQ_OUT]);
> > > > > > > > > +   } else if (status == connector_status_disconnected) {
> > > > > > > > > +           /* Cable Disconnected  */
> > > > > > > > > +           DRM_INFO("HDMI/DP Cable Plug Out\n");
> > > > > > > > > +           enable_irq(mhdp->irq[IRQ_IN]);
> > > > > > > > > +   }
> > > > > > > > > +}
> > > > > > > >
> > > > > > > > You shouldn't play with the interrupt being enabled here:
> > > > > > > > hotplug interrupts should always enabled.
> > > > > > > >
> > > > > > > > If you can't for some reason, the reason should be
> > > > > > > > documented in your
> > > > > > driver.
> > > > > > >
> > > > > > > iMX8MQ have two HPD interrupters, one for plugout and the
> > > > > > > other for plugin, because they could not be masked, so we have
> > > > > > > to enable one and
> > > > > > disable the other.
> > > > > > > I will add more comments here.
> > > > > >
> > > > > > Right, but why do you need to enable and disable them? Do you
> > > > > > get spurious interrupts?
> > > > >
> > > > > They don't have status registers and cannot be masked. If they are
> > > > > not disabled, they will continuously generate interrupts.
> > > > > Therefore, I have to
> > > > disable one and enable the other.
> > > >
> > > > Sorry, I still don't get it. How can it be useful to detect hotplug
> > > > interrupts if it constantly sends spurious interrupts when it's enabled?
> > >
> > > Yes, this interrupt is different from a normal one; it's likely a design flaw.
> > > For instance, the plugin interrupt is continuously generated as long
> > > as the cable is plugged in, only stopping when the cable is unplugged.
> > > That's why two interrupts are used to detect cable plugout and plugin
> > separately.
> > > If interrupts aren't used, the only option is polling.
> > 
> > I think I've seen such strange design on other platforms, level interrupt for HPD,
> > which needs to be disabled via disable_irq().
> > 
> > >
> > > >
> > > > > > > > > +   /* Mailbox protect for HDMI PHY access */
> > > > > > > > > +   mutex_lock(&mhdp->mbox_mutex);
> > > > > > > > > +   ret = phy_init(mhdp->phy);
> > > > > > > > > +   mutex_unlock(&mhdp->mbox_mutex);
> > > > > > > > > +   if (ret) {
> > > > > > > > > +           dev_err(dev, "Failed to initialize PHY: %d\n", ret);
> > > > > > > > > +           goto clk_disable;
> > > > > > > > > +   }
> > > > > > > > > +
> > > > > > > > > +   /* Mailbox protect for HDMI PHY access */
> > > > > > > > > +   mutex_lock(&mhdp->mbox_mutex);
> > > > > > > > > +   ret = phy_set_mode(mhdp->phy, phy_mode);
> > > > > > > > > +   mutex_unlock(&mhdp->mbox_mutex);
> > > > > > > > > +   if (ret) {
> > > > > > > > > +           dev_err(dev, "Failed to configure PHY: %d\n", ret);
> > > > > > > > > +           goto clk_disable;
> > > > > > > > > +   }
> > > > > > > >
> > > > > > > > Why do you need a shared mutex between the phy and HDMI
> > > > controller?
> > > > > > >
> > > > > > > Both PHY and HDMI controller could access to the HDMI firmware
> > > > > > > by mailbox, So add mutex to avoid race condition.
> > > > > >
> > > > > > That should be handled at either the phy or mailbox level, not
> > > > > > in your hdmi driver.
> > > > >
> > > > > In both HDMI driver and PHY driver, every mailbox access had
> > > > > protected by its owns mutex. However, this mutex can only protect
> > > > > each mailbox access within their respective drivers, and it cannot
> > > > > provide protection for access between the HDMI and PHY drivers.
> > > > >
> > > > > The PHY driver only provides two API functions, and these
> > > > > functions are only called in the HDMI driver. Therefore, when
> > > > > accessing these functions, we use a mutex to protect them. This
> > > > > ensures that mailbox access is protected across different PHY and HDMI
> > drivers.
> > > >
> > > > It's really about abstraction. You're using a publicly defined API,
> > > > and change the semantics for your driver only, and that's not ok.
> > > >
> > > > Why can't the mailbox driver itself serialize the accesses from any
> > > > user, HDMI and PHY drivers included?
> > > >
> > >
> > > In the current code implementation, cdns-mhdp-helper.c isn't a standalone
> > driver but rather a library.
> > > It provides fundamental mailbox access functions and basic register
> > read/write operations that rely on the mailbox.
> > > These functions are highly reusable across MHDP8501 and MHDP8546 and
> > can be leveraged by future MHDP versions.
> > >
> > > However, most MHDP firmware interactions involve a sequence of mailbox
> > accesses, including sending commands and receiving firmware responses.
> > > These commands constitute a significant portion of all firmware interactions,
> > encompassing operations like EDID reading and DP link training.
> > > Unfortunately, these commands cannot be reused between MHDP8501 and
> > MHDP8546.
> > >
> > > Creating a dedicated mailbox driver with its own mutex would effectively
> > address race conditions.
> > > However, this would necessitate relocating all mailbox-related functions to
> > this driver.
> > > Including these non-reusable functions would defeat the purpose of code
> > reuse.
> > >
> > > To strike a balance between code reusability and race condition mitigation,
> > adding mutexes to PHY access functions seems like a reasonable solution.
> > 
> > You seem to have two kinds of scenarios when talking to MHDP: just
> > cdns_mhdp_mailbox_send(), no response needed and then the
> > cdns_mhdp_mailbox_send() /  cdns_mhdp_mailbox_recv_header() /
> > cdns_mhdp_mailbox_recv_data() sequence. Extract those + the mutex access
> > to separate functions, add a mutex to those sequences and use them as a
> > high-level API for your HDMI and PHY drivers.
> > 
> > Adding mutexes around phy_foo() calls doesn't look like a proper solution _at_
> > _all_.
> > 
> Because the sequence cdns_mhdp_mailbox_send() / cdns_mhdp_mailbox_recv_header() / cdns_mhdp_mailbox_recv_data() cannot be reused by different drivers, 
> it's not suitable to abstract them into a separate function.

Why is it so? In the end, even if one driver uses it and another driver
uses other functions (while holding the mutex), please move generic
versions of those functions to your helper code. It should abstract
_types_ of hardware access (and send/recv_header/recv_data is such an
abstraction).

> I've noticed some Linux kernel drivers use global mutexes, which can solve the current race conditions problem. 
> I'll implement this in the next version.

-- 
With best wishes
Dmitry
