Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F31677A0804
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 16:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0885E10E584;
	Thu, 14 Sep 2023 14:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EC810E298;
 Thu, 14 Sep 2023 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694703319; x=1726239319;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IX8csOUZtZhVCvFkzraGMVULgq4/R0ymMMJl+NKS5Ss=;
 b=bbVJkM4jiO0kDulNJZ9lImGypl7R8sq05GRZO7U1D+6LDqMqiiOSLiHY
 IyDwjL1UBLaZu0f46BWydVAHxtIJe0gBKLrviyCOIOEBQKUSEC0xWOOTP
 hmNT9CRzSjr724PvUrxTRjnTF+GWLpOFGdLewXQKahuWwZPjwYZ9mX4Wx
 jxAHCxNBZK6aJanAv2RBSpYsgIaZ+o4e4EngTeu6uqH3CVZ5tzPVOlh+f
 qLH5HqavtqBzMZpsO1o3cyHtef7ywk2flDbfT0qKwSSrCct4tibOqrhJ6
 4V826mAlJ3RawcbG4xQLfSq29Wc1ykZFrHfljb93PA1P3DtJt5r4rIDXb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359231113"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="359231113"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 07:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779640342"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="779640342"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by orsmga001.jf.intel.com with SMTP; 14 Sep 2023 07:55:10 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 14 Sep 2023 17:55:09 +0300
Date: Thu, 14 Sep 2023 17:55:09 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM connectors to
 corresponding Type-C connectors"
Message-ID: <ZQMezTQItvG5bsRl@kuha.fi.intel.com>
References: <ZPiAwOf00RREiYPr@kuha.fi.intel.com>
 <6b6bacee-f7b6-4cfe-be3d-24bda44bfbcf@linaro.org>
 <ZQBGD8CY5OVKYX63@kuha.fi.intel.com>
 <a97a33f4-71f3-4610-a59e-0c2d5ae86670@linaro.org>
 <ZQGAfnKt9HMB7j6H@kuha.fi.intel.com>
 <CAA8EJpqaipCT66x698R6dKDTSMk-D2iNHv8NSnMzPy-X_jFJ1Q@mail.gmail.com>
 <ZQG1zMbjWNLtx8lk@kuha.fi.intel.com>
 <CAA8EJprSH1jTa74c2P91SEC84eM8w=ACC4o2xM8t9eShvC9UeQ@mail.gmail.com>
 <ZQLRuNkNBghjKRca@kuha.fi.intel.com>
 <CAA8EJpoTpyPeyo07dRTY-+MxwE7RCdBb0nmbbRO8QEskBihVGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoTpyPeyo07dRTY-+MxwE7RCdBb0nmbbRO8QEskBihVGA@mail.gmail.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Janne Grunau <j@jannau.net>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Won Chung <wonchung@google.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

On Thu, Sep 14, 2023 at 01:40:49PM +0300, Dmitry Baryshkov wrote:
> On Thu, 14 Sept 2023 at 12:26, Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Hi Dmitry,
> >
> > On Wed, Sep 13, 2023 at 04:47:12PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, 13 Sept 2023 at 16:15, Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com> wrote:
> > > >
> > > > On Wed, Sep 13, 2023 at 01:26:14PM +0300, Dmitry Baryshkov wrote:
> > > > > Hi Heikki,
> > > > >
> > > > > On Wed, 13 Sept 2023 at 12:27, Heikki Krogerus
> > > > > <heikki.krogerus@linux.intel.com> wrote:
> > > > > > On Tue, Sep 12, 2023 at 08:39:45PM +0300, Dmitry Baryshkov wrote:
> > > > > > > On 12/09/2023 14:05, Heikki Krogerus wrote:
> > > > > > > > On Tue, Sep 12, 2023 at 12:15:10AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > On 06/09/2023 16:38, Heikki Krogerus wrote:
> > > > > > > > > > On Wed, Sep 06, 2023 at 03:48:35PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > > On Wed, 6 Sept 2023 at 15:44, Heikki Krogerus
> > > > > > > > > > > <heikki.krogerus@linux.intel.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Tue, Sep 05, 2023 at 01:56:59PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > Hi Heikki,
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus
> > > > > > > > > > > > > <heikki.krogerus@linux.intel.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Hi Dmitry,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > > > The kdev->fwnode pointer is never set in drm_sysfs_connector_add(), so
> > > > > > > > > > > > > > > dev_fwnode() checks never succeed, making the respective commit NOP.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > That's not true. The dev->fwnode is assigned when the device is
> > > > > > > > > > > > > > created on ACPI platforms automatically. If the drm_connector fwnode
> > > > > > > > > > > > > > member is assigned before the device is registered, then that fwnode
> > > > > > > > > > > > > > is assigned also to the device - see drm_connector_acpi_find_companion().
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > But please note that even if drm_connector does not have anything in
> > > > > > > > > > > > > > its fwnode member, the device may still be assigned fwnode, just based
> > > > > > > > > > > > > > on some other logic (maybe in drivers/acpi/acpi_video.c?).
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > And if drm_sysfs_connector_add() is modified to set kdev->fwnode, it
> > > > > > > > > > > > > > > breaks drivers already using components (as it was pointed at [1]),
> > > > > > > > > > > > > > > resulting in a deadlock. Lockdep trace is provided below.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Granted these two issues, it seems impractical to fix this commit in any
> > > > > > > > > > > > > > > sane way. Revert it instead.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I think there is already user space stuff that relies on these links,
> > > > > > > > > > > > > > so I'm not sure you can just remove them like that. If the component
> > > > > > > > > > > > > > framework is not the correct tool here, then I think you need to
> > > > > > > > > > > > > > suggest some other way of creating them.
> > > > > > > > > > > > >
> > > > > > > > > > > > > The issue (that was pointed out during review) is that having a
> > > > > > > > > > > > > component code in the framework code can lead to lockups. With the
> > > > > > > > > > > > > patch #2 in place (which is the only logical way to set kdev->fwnode
> > > > > > > > > > > > > for non-ACPI systems) probing of drivers which use components and set
> > > > > > > > > > > > > drm_connector::fwnode breaks immediately.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Can we move the component part to the respective drivers? With the
> > > > > > > > > > > > > patch 2 in place, connector->fwnode will be copied to the created
> > > > > > > > > > > > > kdev's fwnode pointer.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Another option might be to make this drm_sysfs component registration optional.
> > > > > > > > > > > >
> > > > > > > > > > > > You don't need to use the component framework at all if there is
> > > > > > > > > > > > a better way of determining the connection between the DP and its
> > > > > > > > > > > > Type-C connector (I'm assuming that that's what this series is about).
> > > > > > > > > > > > You just need the symlinks, not the component.
> > > > > > > > > > >
> > > > > > > > > > > The problem is that right now this component registration has become
> > > > > > > > > > > mandatory. And if I set the kdev->fwnode manually (like in the patch
> > > > > > > > > > > 2), the kernel hangs inside the component code.
> > > > > > > > > > > That's why I proposed to move the components to the place where they
> > > > > > > > > > > are really necessary, e.g. i915 and amd drivers.
> > > > > > > > > >
> > > > > > > > > > So why can't we replace the component with the method you are
> > > > > > > > > > proposing in this series of finding out the Type-C port also with
> > > > > > > > > > i915, AMD, or whatever driver and platform (that's the only thing that
> > > > > > > > > > component is used for)?
> > > > > > > > >
> > > > > > > > > The drm/msm driver uses drm_bridge for the pipeline (including the last DP
> > > > > > > > > entry) and the drm_bridge_connector to create the connector. I think that
> > > > > > > > > enabling i915 and AMD drivers to use drm_bridge fells out of scope for this
> > > > > > > > > series.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > Determining the connection between a DP and its Type-C connector is
> > > > > > > > > > starting to get really important, so ideally we have a common solution
> > > > > > > > > > for that.
> > > > > > > > >
> > > > > > > > > Yes. This is what we have been discussing with Simon for quite some time on
> > > > > > > > > #dri-devel.
> > > > > > > > >
> > > > > > > > > Unfortunately I think the solution that got merged was pretty much hastened
> > > > > > > > > in instead of being well-thought. For example, it is also not always
> > > > > > > > > possible to provide the drm_connector / typec_connector links (as you can
> > > > > > > > > see from the patch7. Sometimes we can only express that this is a Type-C DP
> > > > > > > > > connector, but we can not easily point it to the particular USB-C port.
> > > > > > > > >
> > > > > > > > > So, I'm not sure, how can we proceed here. Currently merged patch breaks
> > > > > > > > > drm/msm if we even try to use it by setting kdef->fwnode to
> > > > > > > > > drm_connector->fwnode. The pointed out `drivers/usb/typec/port-mapper.c` is
> > > > > > > > > an ACPI-only thing, which is not expected to work in a non-ACPI cases.
> > > > > > > >
> > > > > > > > You really have to always supply not only the Type-C ports and partners,
> > > > > > > > but also the alt modes. You need them, firstly to keep things sane
> > > > > > > > inside kernel, but more importantly, so they are always exposed to the
> > > > > > > > user space, AND, always the same way. We have ABIs for all this stuff,
> > > > > > > > including the DP alt mode. Use them. No shortcuts.
> > > > > > > >
> > > > > > > > So here's what you need to do. UCSI does not seem to bring you
> > > > > > > > anything useful, so just disable it for now. You don't need it. Your
> > > > > > > > port driver is clearly drivers/soc/qcom/pmic_glink_altmode.c, so
> > > > > > > > that's where you need to register all these components - the ports,
> > > > > > > > partners and alt modes. You have all the needed information there.
> > > > > > >
> > > > > > > To make things even more complicate, UCSI is necessary for the USB part of
> > > > > > > the story. It handles vbus and direction.
> > > > > > >
> > > > > > > > Only after you've done that we can start to look at how should the
> > > > > > > > connection between the DPs and their USB Type-C connectors be handled.
> > > > > > >
> > > > > > > But sure enough, I can add typec port registration to the altmode driver.
> > > > > > > This will solve the 'port not existing' part of the story.
> > > > > > >
> > > > > > > I'd like to hear your opinion on:
> > > > > > >
> > > > > > > - components. Using them breaks drm/msm. How can we proceed?
> > > > > >
> > > > > > I don't think replacing the components is going to be a problem once
> > > > > > you have described everything properly in you DT. I'm fairly certain now
> > > > > > that that is the main problem here. You don't have this connection
> > > > > > described in your DT as it should.
> > > > >
> > > > > We have. See https://lore.kernel.org/linux-arm-msm/20230817145940.9887-1-dmitry.baryshkov@linaro.org/
> > > > > (for non-PMIC-GLINK platform)
> > > > > Or arch/arm64/boot/dts/qcom/sm8350-hdk.dts, which already has a full
> > > > > description of USB-C connector and signal flow.
> > > > >
> > > > > In fact, thanks to this representation I can properly set
> > > > > 'connector->fwnode' to point to the OF node corresponding to the
> > > > > connector's drm_bridge. I can even propagate it to the kdef->fwnode /
> > > > > kdev->of_node in drm_sysfs_connector_add(). But then a component_add()
> > > > > call looks the kernel up.
> > > > >
> > > > > And to add on top of that, here is another reason why I think that
> > > > > this sysfs links ABI/implementation was not well thought. The
> > > > > typec_connector_ops are added to all fwnode-enabled connector devices.
> > > > > It doesn't even bother checking that the device is really the DP
> > > > > connector and that the device on the other side of fwnode link is a
> > > > > typec port device. The symlink is named 'typec_connector', so one can
> > > > > not easily extend this ABI to support SlimPort aka MyDP (which uses
> > > > > micro-USB-B connectors instead of USB-C). Neither can we extend it to
> > > > > represent MHL connections (again, micro-USB-B).
> > > > >
> > > > > > > - PATH property usage. This way we make USB-C DisplayPort behave like the
> > > > > > > MST ports.
> > > > > >
> > > > > > That looks to me like an attempt to exploit a feature that is not
> > > > > > designed for this purposes at all. Just drop all that.
> > > > >
> > > > > But why? From the docs: 'Connector path property to identify how this
> > > > > sink is physically connected.'
> > > > >
> > > > > So far we have been using it for MST only. But the description above
> > > > > also suits properly for the 'connected to the Type-C port0 device'
> > > > > kind of data. Then the userspace can use this property to change the
> > > > > representation of the controller. Or to rename it as it does for
> > > > > DP-MST connectors. Or just add the USB-C icon in the UI.
> > > > >
> > > > > Having this data in sysfs only requires userspace first to map the
> > > > > connector to the device under sysfs (which is not trivial since Xorg
> > > > > renames DP-MST connectors), then to look for the symlink value. Quite
> > > > > complicated compared to checking the DRM property.
> > > > >
> > > > > Moreover, once we get to the SlimPort / MyDP / MHL, we can extend the
> > > > > schema to support 'microusb:something' values for this property.
> > > > >
> > > > > > The connection has to be first described in your DT, and the way you
> > > > > > usually describe connections in DT is by using the device graph (OF
> > > > > > graph). It seems that you have everything needed for that - the USB
> > > > > > Type-C connectors have their own OF nodes (what you register as
> > > > > > drm_bridges are in fact USB Type-C connectors), and presumable you
> > > > > > also have OF nodes for all your video ports (DisplayPorts) - so
> > > > > > applying the graph between the two really should not be a problem. The
> > > > > > DP is endpoint for the USB Type-C connector, and vice versa.
> > > > >
> > > > > Not quite. There is no direct connection between the USB Type-C
> > > > > connector and DP controller. The USB-C connector has three ports.
> > > > >
> > > > > port@0 goes to theHS-USB controller. This is simple.
> > > > >
> > > > > port@1 goes to the USB+DP PHY. All retimers and SS line muxes are
> > > > > included in between. And it is the USB+DP PHY that is connected to the
> > > > > DP and USB-SS controllers.
> > > > >
> > > > > port@2 goes to SBU lines mux (e.g. fsa4480).
> > > > >
> > > > > > After you have everything needed in your DT, the problem here isn't
> > > > > > actually much of a problem at all. We will have options how to move
> > > > > > forward after that.
> > > > >
> > > > > Could you please describe what is missing there?
> > > >
> > > > We are not after the direct connections here, we are after the final
> > > > endpoints. So you are missing description of the logical connection
> > > > between your DP and Type-C connector.
> > >
> > > Adding Krzysztof, as one of DT maintainers, to the CC list.
> > >
> > > >From what I understand, DT describes hardware. There is no description
> > > for the 'logical' connections.
> > >
> > > >
> > > > I understand that the idea is to build the graph to describe only the
> > > > physical connections, but with just the physical connections you are
> > > > doomed to write separate software solution for almost every single
> > > > platform, even though the final endpoints are always the same (DP to
> > > > Type-C). You just can not generalise the components (muxes, phys,
> > > > retimers, etc.) behind USB Type-C connectors (or anything else for
> > > > that matter), it's not possible. The components and their order vary
> > > > on almost every single platform. On some platforms the stack of parts
> > > > after the connector is also incredibly complex.
> > >
> > > Yes. And this is why we have a chain of DRM bridges, going from the DP
> > > controller to the final drm_bridge at the Type-C port manager. When
> > > there is the altmode event, it gets sent via this chain using the
> > > normal DRM HPD event.
> >
> > We will not have drm bridges between the thunderbolt controller and
> > the connector, but you still need to be able to show the connector to
> > the user when DisplayPort is tunneled over thunderbolt. DP alt mode is
> > only one way of getting DisplayPort through USB Type-C. You just can't
> > make any assumptions with USB Type-C.
> 
> In the end the drm bridge chain is just a funny way to create a
> drm_connector. The rest of the system sees just drm_connector, no
> matter if internally it is intel_drm_connecttor or
> drm_bridge_connector.
> 
> >
> > The drm bridge chain could only solve the port/connector relationship
> > problem from a single angle, but we need a common solution. The
> > problem is after all completely generic. It is not DisplayPort
> > specific or even USB Type-C specific problem. Those are just two of
> > the many possible last endpoints for these connections that need to be
> > aware of each other.
> >
> > So we really have to have a common way of getting this straight from
> > the hardware description somehow.
> 
> I'd quite disagree with you here. This works in the x86 world, where
> the hardware is more or less standard. In the embedded world it is not
> that easy. This is why we opted for the software transcribing the
> hardware description. In case of ACPI the software part can be common
> to all the drivers. But in the embedded systems... I fear is is just
> not possible.
> 
> > To me the obvious solution would be to just have a port in the graph
> > that points directly the last endpoint regardless of what you have in
> > between. But if that's not an option, then so be it. Then there just
> > needs to be some other way of getting that information from DT.
> 
> Could you please point out what is wrong with generating this
> information on the fly? We are going to work on fixing the
> pmic_glink_altmode in the next couple of weeks, so that the typec port
> device will be always present, as you suggested.
> Are there any other obstacles?
> 
> > Maybe DT could use similar physical location object/attribute like
> > ACPI - the DP would have matching physical location with its connector?
> >
> > > > Having the logical final endpoint connection described in your DT/ACPI
> > > > on top of the physical connections costs very little, but at the same
> > > > time it's usually the only thing that the software needs (like in this
> > > > case).
> > >
> > > Maybe there is some misunderstanding here. We have this connection. We
> > > have connector->fwnode and connector->of_node pointing to the correct
> > > device - the last bridge in the chain. Each TCPM driver knows the
> > > relationship between the in-built drm_bridge and the Type-C port. The
> > > DP host controller port can be terminated with other endpoints, e.g.
> > > eDP panel. Or there can be a non-DP host, which is then connected
> > > through a series of bridges to the eDP or external DP port. This is
> > > what anx78xx bridge does: it converts the HDMI link into an external
> > > DP (SlimPort) connection. Bridge chains permit this to be handled in a
> > > seamless way.

I'm sorry, I did not read this comment carefully enough earlier. I
probable have misunderstood something related to the drm bridges.

I'm still not sure why would it be a problem to try to hook up the
port and connector device nodes - you seem to have them ready in any
case, no?
But maybe it's best that you guys just prepare the next version at
this point. Let's continue then.

> > > What you are asking for looks like a step backwards to me: it requires
> > > the host to know that there is a USB-C connector.
> > >
> > > > So, either you add one more port to your graph for the DP to Type-C
> > > > connection, or, if that's not an option, then you need to describe
> > > > that connection in some other way. Named references work also quite
> > > > well in my experience.
> > >
> > > Named references were considered and frowned upon by DT maintainers.

thanks,

-- 
heikki
