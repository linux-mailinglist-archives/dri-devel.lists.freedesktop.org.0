Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F23C46B3FD0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 13:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCB810E1CA;
	Fri, 10 Mar 2023 12:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11F610E1CA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 12:58:56 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id s13so3415673uac.8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 04:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1678453136;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/RIWO5C7AzU+h78A0ar/3/O1DQlkXqjFU+oB2xsWTyM=;
 b=ZBvKtE7XY6G9i9Tq8qOl8jis3VkQG1Q1hJDgBgS3Am3UdJyTmVU5YnPnaEdeBhbW+1
 YgJlniuj4ILWDjy+wHs7vArthjelwZXhvX1Ps+Itm3ttzmmSfN56BXr1P5ENsyqdgNkY
 T6tGsoPhdshdppRyR/czmbzA9nBJnqrVxz/alct7mfwQSiaxozfq1+B7PQpUhxuoMFCf
 4zCaDfjDpD177/AT0GjiVq1J4PciecmNmZsGecaE71aN0jg6R0svqBCBHq1Jq+aYK+6+
 vF7INeF3/yxsEt1mRG5V3wi+7T9Xiw35yW1IFsTjhYipdLYDhawbwhsGqKWCJ1jNR3RC
 4xkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678453136;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/RIWO5C7AzU+h78A0ar/3/O1DQlkXqjFU+oB2xsWTyM=;
 b=pMnL4QFou98f7eCpnBYYEztrNhw48/efwS4cAgUAd0qKi9re5ypckCCVc0AF8Gu3bk
 Qq3XFr1sAW9yjDKoPaxiZwiivyiObcoNL7qnYp+xGar64aY7nuJKLaRnuX9mrs9yUn/U
 HKTPyDPRt59AeOy7Ua/wgMIMt+zPesE21T3gaVY2jo9bP5AVDnltSM/BIezjaTdWpQ6Y
 sPfC5nU7W5hDdXVlMNgAxn0oJsZQIry8qQqHdrumVozYHQ3j+d/GJZyAFwF4iiO7SnKb
 GHorw5GwlXW9/cI7PwhmhrEPQiWylPobSUMcM4pb1rLSw6aZrrGSam1PKjag1//DopHz
 iMrQ==
X-Gm-Message-State: AO0yUKX2hkAP8e2PiVUGXeWfZ6lxLbu2Zb/4pzoOxBrvqnjGHdxFQXT1
 PD5FH0VHbnW3OYTBIcjhwaphlxdzJ4XW1j+rKApJIg==
X-Google-Smtp-Source: AK7set9GsKjOdBQ25EuuTV3JVLnncUT5if3cxkUVO5FN2QdCbyLYuRMO/XY+vz02R1RHsmnzMyp5RkNYQMown68jGTM=
X-Received: by 2002:ab0:4a12:0:b0:68d:6360:77b with SMTP id
 q18-20020ab04a12000000b0068d6360077bmr16663766uae.1.1678453135848; Fri, 10
 Mar 2023 04:58:55 -0800 (PST)
MIME-Version: 1.0
References: <7d216faea9647d328651460167bc27f6@rmail.be>
 <f9499ac65afe3d23079c5bca5e3c40bd@rmail.be>
 <CAPY8ntAGvQdSVt7meb2ddz+UejxpKPvmAcgYUyPWR2+R3e=wRg@mail.gmail.com>
 <20230308123540.zqqe4mnhzumvnjfk@houat>
 <004db85e5114674bfc432043376bcd00@rmail.be>
 <4862350fa507612e03bb6a73977db178@rmail.be>
 <CAPY8ntB6WaCF4H2Bk7Zq9cCE-iR8fMFq-vDULH_rp_+O4xp+EA@mail.gmail.com>
 <67bdf359746cfc732286ca4e139ed2b4@rmail.be>
In-Reply-To: <67bdf359746cfc732286ca4e139ed2b4@rmail.be>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 10 Mar 2023 12:58:39 +0000
Message-ID: <CAPY8ntAJDn32dNP=yXZ47zVyOpdCQ1UdOV51dfeYMGbuAaLmFA@mail.gmail.com>
Subject: Re: [regression] RPI4B drm vc4: no crtc or sizes since 5.17 (works in
 5.16; and still broken in at least 6.1)
To: AL13N <alien@rmail.be>
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Mar 2023 at 09:10, AL13N <alien@rmail.be> wrote:
>
> Dave Stevenson schreef op 2023-03-09 13:59:
> > On Wed, 8 Mar 2023 at 22:46, AL13N <alien@rmail.be> wrote:
> >>
> >> AL13N schreef op 2023-03-08 22:16:
> >> > Maxime Ripard schreef op 2023-03-08 13:35:
> >> >> Hi,
> >> >>
> >> >> On Tue, Mar 07, 2023 at 05:10:16PM +0000, Dave Stevenson wrote:
> >> >>> On Tue, 7 Mar 2023 at 16:25, AL13N <alien@rmail.be> wrote:
> >> >>> > AL13N schreef op 2023-03-06 17:34:
> >> >>> > > I have a RPI4B connected on 2nd HDMI port (furthest away from power)
> >> >>> > > to a 4K TV, which works until 5.16, from 5.17 there is no X (or
> >> >>> > > plymouth), the cause of no X is that EDID gives nothing, and in the
> >> >>> > > journal; there is "Cannot find any crct or sizes". Only the kernel is
> >> >>> > > changed for this.
> >> >>> > >
<snip>
> >>
> >> a bit puzzling why it does EDID block twice and it's twice checksum
> >> invalid?
> >> I also see forcing connector on.
> >>
> >> earlier, i did try to make an edid file from a modeline that worked on
> >> 5.16 and pass it using drm_kms_helper.edid_firmware= ; but that didn't
> >> work, there only was some kind of warning that i should use something
> >> else...
> >
> > It always helps to actually quote warnings or errors.
> > Almost certainly "drm_kms_helper.edid_firmware is deprecated, please
> > use drm.edid_firmware instead.", in which case do as it tells you and
> > use "drm.edid_firmware=<filename>".
>
> oh, i interpreted this as "it works for now, but will be removed later"
> ? are you saying it really doesn't work and i should retest with
> "drm.edid_firmware=" ?

Reporting that you got a warning or error message which you then
ignored doesn't help the debug process.
Seeing it's been deprecated since 5.4 in 2017, it would be a fair
candidate to disappear.

> >> reading through all your messages, does this mean, that i should be
> >> able
> >> to boot if we were to "fix" this edid file? and pass it? or is this
> >> something that needs change in kernel?
> >
> > At present you have 2 issues
> > - the monitor or cable doesn't handle the hotplug line correctly
> > - the monitor doesn't provide a valid EDID.
> >
> > The first you can workaround with "video=HDMI-A-2:D".
>
> I thought the video= had to be turned off for drm.edid_firmware= to work
> well?

No - they do 2 different jobs.
video=HDMI-A-2:D will force the connector to report connected, and
therefore trigger a read of the EDID.
drm.edid_firmware means that the EDID used will be read from that file
rather than over the DDC link.

> rpi4 config.txt has a disable_fw_kms_setup=1 that disables the video
> tags that are auto-added to cmdline (this option is commented atm)
> there is also a hdmi_force_hotplug=1 option that is turned on atm

hdmi_force_hotplug=1 only affects the firmware, not the vc4 kernel driver.

> > The second you can work around by capturing the EDID, fixing it, and
> > then using "drm.edid_firmware=<filename>".
> > The first fix is to just fixup the checksum (edid-decode even tells
> > you the correct value as 0xEB). That doesn't solve the fact that the
> > EDID contains other rubbish like being an analog display which may
> > cause further issues. The simplest fix for reporting as an analog
> > display is to change byte 20 from 0x00 to 0x80, and then correct the
> > checksum again.
> >
> > The EDID advertises 4k60, 1080p60, and GTF 2288x1432 @ 61Hz.
> > In order to support 4k60 it needs to support HDMI2.0 and enabling
> > scrambling via SCDC. That should also be signalled in the EDID Sink
> > Capability Data Structure block but isn't, so 4k60 support may be
> > compromised.
>
> the rpi4 also has in config.txt a hdmi_enable_4kp60=1, which i have not
> turned on atm; i don't know if that has any impact here...

Without that then any mode that requires a pixel clock above the
340MHz limit of HDMI 1.4 will be filtered out. 4k60 will therefore not
be available to you on your system.

> > Sorry, all of this comes back to the monitor vendor shipping rubbish.
> > None of this is the fault of the vc4 driver, and it only worked under
> > 5.16 by chance.
>
> do the config.txt directives on the rpi4 have any impact here? I always
> figured these options only changed the cmdline video= parameters, it
> can't really have any impact to the edid, no?

Most of them only affect the firmware. The firmware does try to pass
some information across to the kernel to set some defaults, but it
can't do everything.

> also, i assume there's lots of monitors/TVs that have rubbish EDID
> files, how is this generally handled: are you guys trying to cater to
> these weird EDID's or is it like: "nope, bad EDID, they should fix it,
> no screen for now"?

Actually reputable display manufacturers do a very good job on
providing good EDIDs. There is very little excuse to ship a product
with an invalid checksum in the EDID.

Behaviour depends how bad the EDID is, and note that bad hotplug
behaviour is a separate issue to the bad EDID.
vc4 is now using the same EDID parsing code as the majority of the DRM
drivers. Your EDID is bad enough that I suspect it will cause grief on
many Linux systems, not just vc4 (I was going to test that, but my
test rig appears to be playing up at present).

DRM relies on the EDID being reasonable. There may be some corner
cases that cause some grief (declaring a display as being analog for
one), but actually they seem to be relatively rare.

> >> >
> >> >>> > I also noticed that earlier in the logs there are more bound lines:
> >> >>> > (some are double)
> >> >>> >
> >> >>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> >>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> >>> >
> >> >>> > and then here for some reason systemd does modprobe@drm.service ? is
> >> >>> > this just a delayed starting log line, or does it actually try to unload
> >> >>> > drm and reload? i doubt it?
> >> >>> > in any case there is more that appears before:
> >> >>> >
> >> >>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> >>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> >>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> >>> > vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
> >> >>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> >>> > vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
> >> >>> >
> >> >>> >
> >> >>> > so, the error message is weird, as it implies 2 possibilities. however,
> >> >>> > i think it did find a crtc since all those pixelvalve things use crtc
> >> >>> > functions?
> >> >>> >
> >> >>> > So then why do i have this problem on my RPI4? do most people just use
> >> >>> > the raspberry pi kernels?
> >> >>>
> >> >>> Largely, yes, people use our vendor kernels.
> >> >>
> >> >> tbf, the downstream kernel has pretty much the same code here, so the
> >> >> issue is very likely to affect it too.
> >> >>
> >> >> I would just assume that your TV has some unusual behaviour that
> >> >> throws
> >> >> the driver off, and most people won't.
> >> >
> >> > IC, the TV also has an option somewhere to choose EDID 2.0, i thought
> >> > i chose that but if that decode says 1.3, maybe i didn't... Is it
> >> > worth it to retry this?
> >>
> >> actually, the TV was set to EDID 2.0 the other option was 1.4 (?)
> >
> > I would guess that the HDMI 1.4 setting drops the 4k60 mode as HDMI1.4
> > maxes out at 4k30. It's impossible for us to say if it fixes any of
> > the other issues with the EDID.
>
> So, the edid needs to be changed to:
>   - not be analog
>   - set to 2.0
>   - add scrambling capability on SCDC
>   - fix checksum
>
> I'm wondering if the config.txt actually changes these values without
> fixing checksum and that is the cause? but that seems very unlikely...
>
> thanks a lot for the responses, maybe I should just try to fix the EDID
> and then just supply it to the company in question, I was in contact
> with them asking for the EDID file earlier (to see if they have an
> updated file someplace).
