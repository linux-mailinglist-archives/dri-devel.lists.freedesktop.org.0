Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12D265B035
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4DE10E304;
	Mon,  2 Jan 2023 10:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAFC10E304
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1672657155; bh=QXfPTXA8nXZzmzygkWncKX/Z5d6842FAife/WSilhWU=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=TV7R2AP5aGmGLW9LhEZ2syT9g5eGvwX9cTfk750JrK1ufMfIcjBSm50HsIO+zdvXS
 oiwFxIq6QLeBzPzlo6bdGy3APWGEYKz9VFFU6vjlLcC9P2WUGWNfa3zCs3kcwZfrxN
 SoG6/GOzyTbbTCS7NImuIRnslgw8arRJnOoYfcTo=
Date: Mon, 2 Jan 2023 11:59:15 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 2/4] drm: panel: Add Himax HX8394 panel controller
 driver
Message-ID: <20230102105915.gbfhletcm4dunrlf@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Martijn Braam <martijn@brixit.nl>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Mader <robert.mader@posteo.de>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Peter Robinson <pbrobinson@gmail.com>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 dri-devel@lists.freedesktop.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20221230113155.3430142-1-javierm@redhat.com>
 <20221230113155.3430142-3-javierm@redhat.com>
 <20221230154043.7v3zmzqdrnouqzd2@core>
 <7120dfd4-305f-69ac-fee8-123196ed06a9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7120dfd4-305f-69ac-fee8-123196ed06a9@redhat.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Javier,

On Sat, Dec 31, 2022 at 04:15:24PM +0100, Javier Martinez Canillas wrote:
> Hello Ondřej,
> 
> Thanks a lot for your comments.
> 
> On 12/30/22 16:40, Ondřej Jirman wrote:
> > Hi Javier,
> > 
> > On Fri, Dec 30, 2022 at 12:31:52PM +0100, Javier Martinez Canillas wrote:
> >> From: Kamil Trzciński <ayufan@ayufan.eu>
> >>
> >> The driver is for panels based on the Himax HX8394 controller, such as the
> >> HannStar HSD060BHW4 720x1440 TFT LCD panel that uses a MIPI-DSI interface.
> > 
> > I see you've removed debug printks from enable/disable/prepare/unprepare
> 
> Yes, because as you said were debug printks. Feel free to propose adding the
> debug printks if you consider useful for normal usage and not just for devel
> purposes.

I already did, and used them do debug and fix the issues. This submission just
doesn't include the fixes.

> > hooks. Have you tested the driver thoroughly with various DRM apps,
> > with DPM/suspend/resume, etc.?
> >
> 
> I did not. I wasn't expecting suspend and resume to work on the PPP given its
> support is quite minimal currently.

System suspend/resume works and is used by distributions. Display blanking is
also used by normal distros, even if you don't use system suspend/resume.

> > The dw-mipi-dsi driver does some unorthodox things[1], that can lead to unbalanced
> > calls to these functions in some situations, and that's why all these printks
> > were there. To ensure the driver hooks are called correctly, while preparing
> > the code for upstreaming. This lead to broken display in some situations during
> > suspend/resume.
> > 
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L868
> >
> 
> This needs to be fixed in the dw-mipi-dsi driver then. But at least we will get
> a panel-himax-hx8394 driver in mainline to avoid having to use downstream trees
> for development and testing.

The only thing this driver is supposed to do is to power up (+configure) and power
down the display, the rest is boilerplate. Powercycling via suspend/resume
and/or other means (like disabling the crtc via DRM API), has to be tested,
to verify the driver can at least do a power down/up cycle and not just initial
powerup.

> > Also, have you checked the clocks are actually configured correctly by the
> > rk3399 cru driver? I have a lot of trouble with that, too. clk driver sometimes
> > selects the fractional clock, but does not give it the necessary >20x difference
> > between input/output clock rates. You'll only notice if you measure clock rates
> > directly, by looking at actual refresh rate, by using some testing DRM app.
> > Clock subsystem sometimes shuffles things around if you switch VOPs and use big
> > VOP for mipi-dsi display, instead of the default small VOP.
> >
> 
> I have not. Just verified that the display was working on my PPP and could start
> a mutter wayland session. We could fix the clock configuration as follow-up IMO.

The display output will be broken after you fix the assigned-clocks in DT to
expected values (use GPLL parent, to make the HW generate the exact pixel clock
defined in the display mode). So this needs to be dealt with now, not later.


The driver issues are all known at this time and have fixes available, unlike
a year ago:

- panel mode not working with actual clock rate it requests (severe image
  corruption on some pinephone pro's)
- no display output after suspend/resume cycle or a blanking/unblanking cycle

So if you're submitting a known broken code, at least mention the issues in code
comments, so that people that will inevitably hit the bugs will not spend large
amount of time hunting for the cause again, when the issue and causes are known
already.

Just figuring out the image corruption took more than a year since it was
discovered. Better not inflict that on others.

regards,
	o.

> > I'll test this patchset in a few days against purely mainline code, but I'm
> > pretty sure looking at the modes you use, that this will not work on some
> > Pinephone Pro's, and will cause display corruption when you fix your clock
> > setup, so that CRU actually outputs 74.25MHz as requested by the mode. (Which
> > can be fixed by this patch https://github.com/megous/linux/commit/f7ee16f12ee8a44ee2472f2967ca27768106e00f)
> > 
> 
> As mentioned, I prefer to make the support incremental. First having the panel
> driver and then we can fix any remaining issue as follow-up patch series.
> 
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Core Platforms
> Red Hat
> 
