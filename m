Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A51B1AEB45
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C2E6EC83;
	Sat, 18 Apr 2020 09:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8676EBFE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587131634;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=X+miR8R8fyz7mYCdQoU4qb119uC9KuI5sxxMzCuMnyo=;
 b=swqrb/qcKG/+LZHLQYKEA43ktaXcBvC85XbkSjle2VnarahFL7LoY6cmSQ/iS3avWe
 UXPoaWZvV8SByHvSsM5npsYHS43TICnoNlOVu6wWWzjfwiFCsyMzRejpmTFJQ8Fq2Cx3
 g/P9BjYwB1j8VlcReqVlxlkva8zD3XIO+v6cqe+eaw0mA1O0XJuZPxVJURWFGLB05XEq
 yIQAH8WO2iGLirFuTQpRdOiSxZ5QIiKqqqptGZBpNoXP7MkA1LWgxVDynUD1lZ9Ncs87
 G+oQwuvQPDmWO+KuWd8SdCO953MdSMIT7WKSr/RH4baLe62MWxv9FVnJ5016F58TGIaR
 aLFQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDWjbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
 with ESMTPSA id g06d2dw3HDrk22z
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 17 Apr 2020 15:53:46 +0200 (CEST)
Subject: Re: [drm:simple_bridge_attach [simple_bridge]] *ERROR* Fix bridge
 driver to make connector optional!
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200417125840.GB4748@pendragon.ideasonboard.com>
Date: Fri, 17 Apr 2020 15:53:46 +0200
Message-Id: <401F61D0-B88C-4BF7-8CB1-907B0C5F7223@goldelico.com>
References: <CB5A5B81-F06C-4CBE-95DE-96C8723D2AC5@goldelico.com>
 <20200417124422.fl35igitvd7thpr5@gilmour.lan>
 <20200417125840.GB4748@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: linux-omap <linux-omap@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Maxime Ripard <maxime@cerno.tech>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

> Am 17.04.2020 um 14:58 schrieb Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
> 
> Hello,
> 
> On Fri, Apr 17, 2020 at 02:44:22PM +0200, Maxime Ripard wrote:
>> On Fri, Apr 17, 2020 at 02:18:11PM +0200, H. Nikolaus Schaller wrote:
>>> Hi Maxime,
>>> I have started to test v5.7-rc1 and can't fully boot the GTA04
>>> device any more.
>>> 
>>> What I see in the log is:
>>> 
>>> [   28.567840] [drm:simple_bridge_attach [simple_bridge]] *ERROR* Fix bridge driver to make connector optional!
>>> [   28.567871] omapdrm omapdrm.0: unable to attach bridge /ocp@68000000/dss@48050000/encoder@48050c00
>>> [   28.786529] omapdrm omapdrm.0: omap_modeset_init failed: ret=-22
>>> [   28.841552] omapdrm: probe of omapdrm.0 failed with error -22
>>> 
>>> This device uses the ti,opa362 chip which did have a dedicated
>>> omapdss driver before (which is removed now) and which seems to
>>> be supported by the simple_bridge now.
>>> 
>>> The opa362 is sitting in the video out path from
>>> 
>>> 	omapdrm -> venc -> opa362 -> video-out-connector.
>>> 
>>> What does this error mean? How can it be fixed?
>> 
>> -22 is usually EINVAL, which can be pretty much anything. A good thing to do
>> would be to bisect to see which actual commit broke it, but if I was to bet on
>> something I guess it would be
>> 
>> https://lore.kernel.org/dri-devel/20200226112514.12455-1-laurent.pinchart@ideasonboard.com/
> 
> Would "[PATCH 0/2] drm: bridge: simple-bridge: Enable usage with DRM
> bridge connector helper" solve it ?

Yes, seems to magically solve the boot issue!

I'll confirm later if the opa362 is still (or again) working.

BR and thanks,
Nikolaus Schaller

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
