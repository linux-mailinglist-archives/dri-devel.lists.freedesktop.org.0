Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547AB43FA6D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 12:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4409D6EA38;
	Fri, 29 Oct 2021 10:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575526EA38
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 10:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7buZtiLc/ouuXxjLHbN2EnvR8r028Iyhe9uJXHmOVko=; b=1Vfjr47/HgOcxMDeXVf0ljPiRC
 5jQx6W6+7+KXiL4bf8qA0+eRURpDuwbDcvZH0t0X/rn5D2K6BHzqlSxkTkWJk398cFDpt2Af7SBHo
 4l2TuWDsKyYYMnxmgwLEkeLlgxIRwumKsMr/Qyr1Z+5ZOInfPjUT3H16Nvdmz3ChQKF0DKIkKpAF3
 avQZCxUblXjviaQI9hZKhX6P2Rbs1hfa8IA5VaG/1HaZgho0RfWKRhWGcgSp0aGvayKnAcU7xR93l
 Mmehd8N+kRdfdZl9Xl3UEUNB47ZGQ5JVytLyHi6+oKv1galh7wZU39uoydqI5XvVnngWqeUH3CEA4
 D/otjkQA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55378)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mgOiy-0008Tt-1X; Fri, 29 Oct 2021 11:03:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mgOiv-0001Vw-Ru; Fri, 29 Oct 2021 11:02:57 +0100
Date: Fri, 29 Oct 2021 11:02:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/3] [RFC] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <YXvG0Xz6XgiS6jwD@shell.armlinux.org.uk>
References: <cover.1634822085.git.geert+renesas@glider.be>
 <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
 <YXtIsCnJ+L5zqCVk@robh.at.kernel.org>
 <YXusEUpTBUdvS7LY@shell.armlinux.org.uk>
 <CAMuHMdX+Ke54zyi2Z2ROk-2xpbcXU6+FFH71gEz0vEBXCAgVXw@mail.gmail.com>
 <YXu/zwjYqoqYgfLx@shell.armlinux.org.uk>
 <CAMuHMdUFp_GN-GLtrXVDQP5A8iM-jLWTQbM0p4g1bdVokxhOaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUFp_GN-GLtrXVDQP5A8iM-jLWTQbM0p4g1bdVokxhOaw@mail.gmail.com>
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

On Fri, Oct 29, 2021 at 11:40:26AM +0200, Geert Uytterhoeven wrote:
> Hi Russell,
> 
> On Fri, Oct 29, 2021 at 11:33 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Fri, Oct 29, 2021 at 10:28:22AM +0200, Geert Uytterhoeven wrote:
> > > No, you can still use port:
> > >
> > > +oneOf:
> > > +  - required:
> > > +      - port
> > > +  - required:
> > > +      - ports
> > >
> > > When using ports, no further requirements are set, but perhaps port@0
> > > should be made required in that case?
> >
> > Maybe I don't understand the binding description then, but to me it
> > looks like you require both port@0 and port@1.
> 
> "make dtbs_check" disagrees.
> 
> > The reality of the driver is that it makes almost no use of the graph
> > itself, except via drm_of_find_possible_crtcs() to find the connected
> > CRTCs. If it is connected to an I2S source, then it probably needs a
> > port specification for that. If someone wants to describe the HDMI
> > connector (which I don't see any point in) then they likely need a
> 
> I can't comment on the point of describing the HDMI connector.
> 
> > port specification for that too. However, the driver itself doesn't
> > care about any of those.
> 
> DT describes hardware, not software limitations.

Sigh. There's no point discussing this further, my replies seem to be
interpreted out of context.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
