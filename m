Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2787A69D6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 19:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4D710E13A;
	Tue, 19 Sep 2023 17:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [185.244.194.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD1310E13A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 17:46:29 +0000 (UTC)
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
 by relay01-mors.netcup.net (Postfix) with ESMTPS id 4RqpxY6gJLz8vYk;
 Tue, 19 Sep 2023 19:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zint.sh; s=key2;
 t=1695145585; bh=IoDopC/FI0Xw8EhjdeXx3lkqipHTvqW2eqTVLHiaOTs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=MzHvvI9eBXMIZWmg+tCAcbxZuAVznBOkFqzsgyH1TSCU61HOHyOF/mU7ZlFoCsvWM
 0pCLXW2q3yVxuDqwAGg8nG0gYkuONS69gv0POr+FXcz89WB1hb7ng6tlTH6hiV3LY1
 p+F7mozEWXcCCN0Ov3/vzHe0el0cC6QZ5jYZjSXhI3PTZVhVTaR/kki2JBznBE05E/
 dvUTVSJltCM4JA7DIIIit75UMJf1/i2jyobPqEbQqbypgWhaNxUB2C8aqniyM+MfJ3
 LaU0Y3ULdZRoA7CAuV5Na7XdNPUbsZZNTJMUkXBqhfpN7JFFVUQBq+Sgo07zw3qXYW
 3ohMQRYj96vVQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by relay01-mors.netcup.net (Postfix) with ESMTPS id 4RqpxY5yk3z7wXm;
 Tue, 19 Sep 2023 19:46:25 +0200 (CEST)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4RqpxY1Qx7z8sZR;
 Tue, 19 Sep 2023 19:46:25 +0200 (CEST)
Received: from thinkpad (p5795fada.dip0.t-ipconnect.de [87.149.250.218])
 by mxe217.netcup.net (Postfix) with ESMTPSA id 9D3D481CC0;
 Tue, 19 Sep 2023 19:46:09 +0200 (CEST)
Date: Tue, 19 Sep 2023 19:46:09 +0200 (CEST)
From: Julius Zint <julius@zint.sh>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 1/1] backlight: hid_bl: Add VESA VCP HID backlight
 driver
In-Reply-To: <f95da7ff-06dd-2c0e-d563-7e5ad61c3bcc@redhat.com>
Message-ID: <afed6395-8680-7e2c-d88c-8bb5f3c39346@zint.sh>
References: <20230820094118.20521-1-julius@zint.sh>
 <20230820094118.20521-2-julius@zint.sh>
 <f2e1ab9e-e691-42e1-a600-42744f692922@t-8ch.de>
 <9a5364de-28e1-1d4a-1d3a-d6dcedb7e659@zint.sh>
 <f95da7ff-06dd-2c0e-d563-7e5ad61c3bcc@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463806431-1318981254-1695145580=:112385"
X-Rspamd-Queue-Id: 9D3D481CC0
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: rOoqEf3663s8YZEX+EphuZt68xJXACRwen9fb7xg
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jiri Kosina <jikos@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
 =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463806431-1318981254-1695145580=:112385
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 6 Sep 2023, Hans de Goede wrote:

> Hi Julius,
> 
> On 9/4/23 21:02, Julius Zint wrote:
> > 
> > 
> > On Mon, 4 Sep 2023, Thomas Weißschuh wrote:
> > 
> >> +Cc Hans who ins involved with the backlight subsystem
> >>
> >> Hi Julius,
> >>
> >> today I stumbled upon a mail from Hans [0], which explains that the
> >> backlight subsystem is not actually a good fit (yet?) for external
> >> displays.
> >>
> >> It seems a new API is in the works that would better fit, but I'm not
> >> sure about the state of this API. Maybe Hans can clarify.
> >>
> >> This also ties back to my review question how userspace can figure out
> >> to which display a backlight devices applies. So far it can not.
> >>
> >> [0] https://lore.kernel.org/lkml/7f2d88de-60c5-e2ff-9b22-acba35cfdfb6@redhat.com/
> >>
> > 
> > Hi Thomas,
> > 
> > thanks for the hint. I will make sure to give this a proper read and
> > see, if it fits my use case better then the current backlight subsystem.
> 
> Note the actual proposal for the new usespace API for display brightness
> control is here:
> 
> https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/
> 
> I have finished / stabilized the backlight code refactor which I landed
> in 6.1, which is a prerequisite for the above proposal. But I have not
> been able to make time to actually implement the above proposal; and
> I don't know when I will be able to make time for this.
> 
> > Especially since I wasnt able to properly address your other review
> > comments for now. You are right that the name should align better with
> > the kernel module and also, that it is possible for multiple displays to
> > be attached.
> > 
> > In its current state, this would mean that you could only control the
> > backlight for the first HID device (enough for me :-).
> > 
> > The systemd-backlight@.service uses not only the file name, but also the
> > full bus path for storing/restoring backlights. I did not yet get around
> > to see how the desktops handle brightness control, but since the
> > systemd-backlight@.service already uses the name, its important to stay
> > the same over multiple boots.
> > 
> > I would be able to get a handle on the underlying USB device and use the
> > serial to uniquely (and persistently) name the backlight. But it does
> > feel hacky doing it this way.
> 
> So mutter (gnome-shell compositor library) has a similar issue when saving
> monitor layouts and I can tell you beforehand that monitor serial numbers
> by themselves are not unique enough. Some models just report 123456789
> as serial and if you have a dual-monitor setup with 2 such monitors
> and name the backlight class device <serial>-vcp-hid or something like that
> you will still end up with 2 identical names.
> 
> To avoid this when saving monitor layouts mutter saves both the port
> to which the monitor is attached (e.g. DP-1 DP-2) and the serialnumber
> and on startup / monitor hotplug when it checks to see if it has saved
> layout info for the monitor it checks the port+serialnr combination.
> 
> So what I think you should do is figure out a way to map which
> VCP HID device maps to which drm-connector and then use
> the connector-name + serial-nr to generate the backlight device name.
> 
> We will need the mapping the a drm-connector object anyway for
> the new brightness API proposal from above.
> 
> Note this does NOT solve the fact that registering a new backlight
> class device for an external monitor on a laptop will hopelessly
> confuse userspace, see:
> 
> https://lore.kernel.org/lkml/7f2d88de-60c5-e2ff-9b22-acba35cfdfb6@redhat.com/
> 
> Regards,
> 
> Hans
> 

Thank you for all this additional information. I have watched the talks
and read up upon the mail threads you`ve linked.

I will see if I can make the mapping to the DRM connector and plan to
update this patchset.

Thanks,

Julius
---1463806431-1318981254-1695145580=:112385--
