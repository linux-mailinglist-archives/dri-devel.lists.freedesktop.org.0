Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38510791D81
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 21:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC2610E3DC;
	Mon,  4 Sep 2023 19:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 417 seconds by postgrey-1.36 at gabe;
 Mon, 04 Sep 2023 19:10:14 UTC
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [194.59.206.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B336710E3DC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 19:10:14 +0000 (UTC)
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4RfdM63RVMz42k1;
 Mon,  4 Sep 2023 21:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zint.sh; s=key2;
 t=1693854194; bh=BbASmV7iHDzDwWM4ZCX9A6TApXnhwrnZfdldZ29Hg9I=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=NPTaBg11cl0BMV7WefbxHIDN5LodwCO5W8ZVs1iUHUL1usi/Kqv466Mlbdi3qklIr
 nVUsw06OMOS/90qztFLh6tI8CZ/1Rm2dA87sngYGAvhd8L31Jl6nAfhJQQYJpNZAVE
 E0uuUepiGuhmOKjwZ1NV9ilvq/M0llarSTXk/RnJMMovEvgLr/Ho2T/4R0MGLC81T7
 SAzOz5qqcJ/mZNtHCIl4X1qIl/IZ3w9JS0jlsdprylqLJzUYaDyqnSoB1xzaJLvWlR
 WpF7XTu7h47VMvenlRJNs4lpiAticym5nLKHr9pxas9iqvOJS+KHn3eKxcBlPnoAye
 xb7G3kilLLzXw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4RfdM631P9z7vrQ;
 Mon,  4 Sep 2023 21:03:14 +0200 (CEST)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4RfdM55j20z8scg;
 Mon,  4 Sep 2023 21:03:13 +0200 (CEST)
Received: from thinkpad (p5dcce04c.dip0.t-ipconnect.de [93.204.224.76])
 by mxe217.netcup.net (Postfix) with ESMTPSA id 4B8C981B5D;
 Mon,  4 Sep 2023 21:02:58 +0200 (CEST)
Date: Mon, 4 Sep 2023 21:02:48 +0200 (CEST)
From: Julius Zint <julius@zint.sh>
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
Subject: Re: [PATCH v3 1/1] backlight: hid_bl: Add VESA VCP HID backlight
 driver
In-Reply-To: <f2e1ab9e-e691-42e1-a600-42744f692922@t-8ch.de>
Message-ID: <9a5364de-28e1-1d4a-1d3a-d6dcedb7e659@zint.sh>
References: <20230820094118.20521-1-julius@zint.sh>
 <20230820094118.20521-2-julius@zint.sh>
 <f2e1ab9e-e691-42e1-a600-42744f692922@t-8ch.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463804383-9626853-1693854189=:10594"
X-Rspamd-Queue-Id: 4B8C981B5D
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: prvbUe2NsAhsD+ReD9rNjQ8eYmwNmXCCvvNJk7i7
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
 Hans de Goede <hdegoede@redhat.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463804383-9626853-1693854189=:10594
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT



On Mon, 4 Sep 2023, Thomas Weißschuh wrote:

> +Cc Hans who ins involved with the backlight subsystem
>
> Hi Julius,
>
> today I stumbled upon a mail from Hans [0], which explains that the
> backlight subsystem is not actually a good fit (yet?) for external
> displays.
>
> It seems a new API is in the works that would better fit, but I'm not
> sure about the state of this API. Maybe Hans can clarify.
>
> This also ties back to my review question how userspace can figure out
> to which display a backlight devices applies. So far it can not.
>
> [0] https://lore.kernel.org/lkml/7f2d88de-60c5-e2ff-9b22-acba35cfdfb6@redhat.com/
>

Hi Thomas,

thanks for the hint. I will make sure to give this a proper read and
see, if it fits my use case better then the current backlight subsystem.

Especially since I wasnt able to properly address your other review
comments for now. You are right that the name should align better with
the kernel module and also, that it is possible for multiple displays to
be attached.

In its current state, this would mean that you could only control the
backlight for the first HID device (enough for me :-).

The systemd-backlight@.service uses not only the file name, but also the
full bus path for storing/restoring backlights. I did not yet get around
to see how the desktops handle brightness control, but since the
systemd-backlight@.service already uses the name, its important to stay
the same over multiple boots.

I would be able to get a handle on the underlying USB device and use the
serial to uniquely (and persistently) name the backlight. But it does
feel hacky doing it this way.

Anyways, this is where am at. Thanks again for the support and I will
try my best to come up with something better.

Julius
---1463804383-9626853-1693854189=:10594--
