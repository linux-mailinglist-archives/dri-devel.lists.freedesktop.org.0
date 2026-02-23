Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB6EI1ZinWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A1183BC7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4165610E4EB;
	Tue, 24 Feb 2026 08:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jnpVqdle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D6610E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:51:36 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-948bf40406bso1296063241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 03:51:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771847495; cv=none;
 d=google.com; s=arc-20240605;
 b=cczhmlCkuFqiqR9VH1dapbTIB1pii40wPmamWhtJGqLA/5+nBKU0gDG4CV/W7StugC
 kVye4ZNdy4T7LSlP4TmeIS4hCsCKp/C2R3mhIebvuoeJA3X6wlNYhTs8SZFXh1861Ixf
 baccQNdt2D/YyHmIoqzM6OBvmpxOFcZefIleZ1k+04Dqf8xJKuTkf6BcWQel7c0R0KKh
 UtXIvxJmKSPr6QAimTXAVgnuLpYzh8PmrdYBBxKDsM1kvAY7hO+3/kQbcocYMM3cacBW
 KPWvD9trGKXrY3z91/CPKl5qyTpam5rFzDXTzm+wit5Sjtz+bGZphWbXqfVAHSKNJmS3
 fFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
 fh=yzyHhGXg32TUvx5QXmX3GxxIA3o+++ApHraJdfpXU/A=;
 b=WPeJfEYWgRmrD0ad9c5pu23qyo/FihNupec7m5QOIRZwW4NKGKzndBbwNMEIL1bJHw
 OLkJQbvTEpL8HcmPm/K6jI4GhUCUnMm5w+7KvYrIQqtvHd18oDZj16a+KodnnLYW0bTl
 Z1ayXLLGrVlVssnJ7IAi0NsNVHV/or6uh2kyUiioXbF2Vvkn2aBEQtHa2OuK0A+fTXhS
 BqzwoD5UWc1PcDjSyNAuUfbQkWtqp1IoTWn1T/t3FYIWlNuKdfcD3vy1C+F3Ham9gvfo
 qpz9LZVs2fdyjARd8Aug/IV6d/rG4VtVA9iqds0jGbvVTNBRE2QUaA4Gl1pXyF26YsGS
 bwUg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771847495; x=1772452295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
 b=jnpVqdleYVxBNdCbEC4hT4mE+O9ZFIb1ZFndg8Gn6IX8R6d0OqUZWYmUMQamXtjiNM
 OcVicQsqQUXeksAJms9WGZU7mJZd6mIRVV+il8/7kcbOVqp4ISr9xxYY5JIyjoKf02uK
 GNPBPGFaRtftJPHYlblkd2PfaFHD5gh1F+CW2/EN/EYGyfTj9x/7Fgb1Vdn3hjzmLZSo
 1+7Cps4jedheKlbbfU1LffYZjT4RqvkCjBoKGyQ9AzoBEqKCPPL2B7V4Sv/qeA7xboZg
 SVPQkIO3uDM0v8uvEK3zmsaLB8OakdiobxWtMWGJ08qGvnkWXkGMiDM0CWoIYULl7pW5
 1TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771847495; x=1772452295;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rMp9NyS10Y7o5BbV0/n1cd3o9I8LFMg8n5wPuOM1jvE=;
 b=qOtSZQTpDnzjGKMt//7QrLv8jPnqsQu7tpIqDgc17q+uJbS+gcZmZGJp2dyOTgd98t
 zYYWbyAdiwVTNpHxXdX0QDs+QgXe2J3GDi/eeO2j26Z4wy7deTvsJOA60+UMtbrebvtP
 BQV1CTPAVcFWs37b0TpluGyDyQoBrpizNI2Ncgi3XfKQBzTIRtzSaaQvXdQ+iSvo5/In
 b0oYwEaMkej9FzvYF5/5T0M/bHaMI/lz3Z2ystM26G8sZ84EweZCWebXj17V5dHvVNEh
 wW0BD754m0JkMNgvyEz/KtyNdyCXscD69GxJxVQ1QAL8lyqpVJASqS0XD6rsRl/V56EZ
 ErTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvbLp5nW/2kvZVagZP4aNKZWX8MJpjANjLe1vuZQy+E9fT1ZWJfPJtpf1DlJKSwI3ZYwYvVVhXIXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykkqGMhAwBQrzkr0E4BCw8Nz8zPJwYw6Vr8UDVAKBfW1+LX8iy
 33hiZd92SiPUoTYoEhKbCny2iAha7lr1jTYoX/3yfO5uNXru+PbH7i8RxZHzuZJtqat/MGuE1tL
 1XbOZbXyNMUQrrnI924Vv1srwMfvw7dQ=
X-Gm-Gg: AZuq6aL6Shy42t801ofc6q8FEfeV5tb512ongeMtZBuSLJnCIuraQ66AVrQowF8mLX1
 Mq1n8JujXW/m6X/BUNHOHsaJDRPYEKydKzH7E2I//7psSwbr5wpOJmjFCekUUikz8DTxD16loou
 ljzLSrYZHzIAxxcI6Eg66g9f/ZVphjkb2srraME8OGDoXCISYmrzLjmF5F4A0f7aIQNTwuLLmZD
 mHGoXrEMAooCNPrUSTUkNb2nqhW0TpfZUAjY0zf/21lw3LTsvolBLz1xOeMQTM45f1Xlt7ET3c+
 xlk0V2srIq2LVHpkB7xEVkDZ6wFKbiudEy1x2c5NpwPMjPUwcjIc8tDOlcyJqLA09jWvOQI6m6H
 iX/embVomxA==
X-Received: by 2002:a05:6102:e0e:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-5feb310b93bmr3236127137.32.1771847494951; Mon, 23 Feb 2026
 03:51:34 -0800 (PST)
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
In-Reply-To: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Mon, 23 Feb 2026 11:51:14 +0000
X-Gm-Features: AaiRm52aszgholXfDNGG6k-0d1fHGX88p3iT8Mn4sxSWllcwfxYwH-T9tRbXK5Q
Message-ID: <CAD0gVBtWhQqnxVt7kvQoQcbazGiLH-rUNrTfnZZpm40-jKvTUA@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: stable@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:17 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.64 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:stable@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andresfperez@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andresfperez@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,kernel.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 240A1183BC7
X-Rspamd-Action: no action

Ricardo,

Listen, I'm right there with you, scratching my head. First thing I
did when I bisected to that commit was modprobe -r that module. Easy
sacrifice; I don't use my camera that often. When it still froze, I
assumed that maybe something related to module init was still
lingering, so I disabled it by kernel boot param. When that didn't
work, I just didn't build it in at all. Then I ignored it and tried a
few other things. Eventually I came back to that commit. Instead of
patching any code, I just added a comment to the file, thinking maybe
this is just some build artifact that's causing a false positive. No
dice. So far, the only thing that has allowed VT switching to work is
restoring those PM calls around the video_ioctl2 call. I am not
presenting it as a solution (quite the contrary!), I am presenting it
solely because it's all I've got to go on.

Andr=C3=A9s

On Mon, Feb 23, 2026 at 8:18=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi Andr=C3=A9s
>
> Thanks for doing the bisecting
>
> On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gmai=
l.com> wrote:
> >
> > # OVERVIEW
> >
> > Since kernel v6.16.1, switching from an X11 session to a text VT and ba=
ck
> > freezes the display on a ThinkPad P15 Gen 2. The system remains respons=
ive
> > over SSH; only the display is frozen. Bisecting identified commit
> > d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> > ioctls") as the trigger. Reverting the logic change in that commit
> > fixes VT switching
> > on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. W=
ayland
> > compositors (e.g., river and sway) are not affected.
> >
> > Last good:  v6.15.9
> > First bad:  v6.16.1
> > Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> > camera for some ioctls
> >
> > ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> > CPU:        Intel Core i7-11800H (Tiger Lake-H)
> > iGPU:        Intel UHD Graphics (TGL GT1)
> > dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-op=
en)
> > Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> > Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> > Firmware:   LENOVO N37ET61W (1.97)
> > OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display mana=
ger
> >
> > ## Symptoms and reproduction steps:
> > 1. Boot, start X11 on tty1 (startx).
> > 2. Switch to tty2 (Ctrl+Alt+F2): works.
> > 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
> >    - Frozen on the last frame shown before switching away.
> >    - System is fully responsive over SSH.
> >    - Other VTs switch normally between each other as long as X11 is
> > not active on them.
> >    - Killing X does not recover the display. A reboot is required.
> >
> > # DEBUG ANALYSIS
> >
> > On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
> > configuration mismatches detected by intel_pipe_config_compare:
> >
> > [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
> >   (expected 30, found 24)
> > [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
> >   (expected link 269484/524288, found link 336855/524288)
> > [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_=
state
> >   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> > [drm:intel_pipe_config_compare] fastset requirement not met in port_clo=
ck
> >   (expected 270000, found 216000)
> > [drm:intel_atomic_check] forcing full modeset
> >
> > On v6.15.9, the same VT switch shows no such messages.
> > no pipe_config_compare runs, no modeset, no freeze.
> >
> > # BISECT AND VERIFICATION
> >
> > The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> > commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> > certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
> > uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_g=
et
> > before video_ioctl2.
> >
> > ## VT switching verification across kernel versions:
> >
> >   v6.12.74 arch pkg:   WORKS
> >   v6.15.9 arch pkg:    WORKS
> >   v6.15.9 from source: WORKS
> >   v6.16.1 with d1b618e reverted:     WORKS
> >   v6.17.9 with PM wrapping restored: WORKS
> >   v6.18.9 with PM wrapping restored: WORKS
> >
> >   v6.16.1 from source:  FREEZES
> >   v6.16.1 arch pkg:     FREEZES
> >   v6.17.9 arch pkg:     FREEZES
> >   v6.18.9 from source:  FREEZES
> >   v6.18.9 arch pkg:     FREEZES
> >
> > ## Things that do not eliminate the freeze
> >
> >   - module_blacklist=3Duvcvideo on boot
> >   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
>
> This is puzzling me a bit... You are saying that if you do not build
> the uvc driver, the freeze is still happening?
>
> Am I understanding this correctly?
>
> >   - i915.enable_psr=3D0
> >   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
> >   - xrandr --output eDP-1 --set "max bpc" 10
> >   - Xorg config FBDepth 30 (No effect on pipe_bpp)
> >
> > ## Workaround patch
> >
> > Reverting the optimization from d1b618e to restore the unconditional
> > uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/u=
vc_v4l2.c
> > index 9e4a251eca88..15057b47ec4f 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file=
 *file,
> >   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
> >   int ret;
> >
> > - /* The following IOCTLs need to turn on the camera. */
> > - switch (converted_cmd) {
> > - case UVCIOC_CTRL_MAP:
> > - case UVCIOC_CTRL_QUERY:
> > - case VIDIOC_G_CTRL:
> > - case VIDIOC_G_EXT_CTRLS:
> > - case VIDIOC_G_INPUT:
> > - case VIDIOC_QUERYCTRL:
> > - case VIDIOC_QUERYMENU:
> > - case VIDIOC_QUERY_EXT_CTRL:
> > - case VIDIOC_S_CTRL:
> > - case VIDIOC_S_EXT_CTRLS:
> > - case VIDIOC_S_FMT:
> > - case VIDIOC_S_INPUT:
> > - case VIDIOC_S_PARM:
> > - case VIDIOC_TRY_EXT_CTRLS:
> > - case VIDIOC_TRY_FMT:
> > - ret =3D uvc_pm_get(handle->stream->dev);
> > - if (ret)
> > - return ret;
> > - ret =3D video_ioctl2(file, cmd, arg);
> > - uvc_pm_put(handle->stream->dev);
> > + ret =3D uvc_pm_get(handle->stream->dev);
> > + if (ret)
> >   return ret;
> > - }
> > -
> > - /* The other IOCTLs can run with the camera off. */
> > - return video_ioctl2(file, cmd, arg);
> > + ret =3D video_ioctl2(file, cmd, arg);
> > + uvc_pm_put(handle->stream->dev);
> > + return ret;
> >  }
> >
> >  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
> >
> > Andr=C3=A9s
> >
>
>
> --
> Ricardo Ribalda
