Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D4kDF1inWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79FF183C16
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA4C10E4F2;
	Tue, 24 Feb 2026 08:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EtKIjjQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EE410E36A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:52:26 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-567530bc03fso3600317e0c.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 03:52:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771847546; cv=none;
 d=google.com; s=arc-20240605;
 b=HtOebYvGrqElS52rB4dkXIaJ/vXrW8BFtsPL4lBNNyX8CCQ7szBc+X/9vzfB9+G/jI
 34Of4+DS2MtsTEMM0XABYhwgVfJ3PfV6UgJkQogWS452HtCZXBMaX48TQPQajoG0/9JU
 X3gmGwTYoQtp9BDv8Pv2WS77wwKnHbobn18XPlRvB5Oz57a4JlgdJA4NC9LPd1aiJNu5
 p2iXI7D0/n8slmFvR9pr1MgucEQzFN6j77L3eT6bn+oXGtaNu7Q/QXb5Ekh9d3pBzv3g
 GnoOCDBoUP5jnSHkJ/NB4OlHO3+Oq07AaMtkhrQrGjVaUrm5kd1vHwtqZa9w9QhMkMW1
 cdrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
 fh=W1lbxg7zzuuq7uddwwefeBm8ia4M/V20alnSTF1gr7k=;
 b=KO4h74JHllbnGwYMj/B6d0XbeBzFVZ18GjSNCb8/6g5ladEAgIrdl+6ZGs64X8D0RT
 GpUIBUDMHZfKvACeGmKG43Ytt/oWawo0CttEamrs0VIUdSJylU5UCQ68kJGi6CrAtQt6
 XcLMRkEoF9gb/ZPVWfpjZ5G2+s4NEAIgCqOqPHRD1FJHbAJRllWEHEeK5EzB/aJpEuF+
 8NSQxyE2KLE8yssocnNUh+xn7hzq7hGKvYXL3Pl8k2INOy2Ul/RvmdyuZWNCbWDtdHmm
 hZPHLFXfEp8lJFLWtDca6YrgsSBjRIrU27BYlCXP7N4nJqPSyWli7uxyAcuaCcoW1AMU
 LKpg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771847546; x=1772452346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
 b=EtKIjjQ1m+oI+hFFFfqkAidf12L2X5DkoKjFbKQ8IJZGWd78YihoHhfBAcvye7TO0Q
 fPuT6vFgq+iIaprjMF5ogwBakA6ZnJZGGa3FkLQNkU3uGovpcoNYjw1GvIkTnQUvXIZs
 LUsYc1YbW3cKeEAqro4980J9BhawrGBfGdPhU5bGkLeu7W1YacUd/SlE17QR0XrMQtVq
 i/45UmYbL4y78t0lYwnPytDRdSpPJLJjqPhQSoWYeS9ahnL86svdEmvLDGQAcZs48YxQ
 iLPlFgSmi/t8jiaVKpMO4ZULBiGhBdT3kO0f97GGaromqJ+lctE0VAD4RcX21CdCt3Zr
 DPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771847546; x=1772452346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VGP11KQ2dHKSZizL7MNew2Tz13D8uXvvu4p+lY24KEM=;
 b=Tz5SPaNfCUZRu+ynQ5IMdRqEVwC0t3mbgvLaPdhdg1Mk2kX08bqfGFhy/a134EBR0w
 hhY6Dj+i1JzsSb1Q7EnDUVsPYSsF32gmuEc3S8cu0tn/d+VM8srM23GCBuFn+Nqe0zaf
 2FdPRCY4fiVfnCLXEsgGBvrOZD8dw4QkGQoORoBHZCLQuJwqVWA5SZlewSE8SjP+5TPw
 i5YhJ/0j5goQ/d8Ghf9oIRZHTeniJss1YS/TAcdHMYsBzrfOOvDmo2LZeVV/tl+1rfUr
 /F8lmgyOV4aAt14WkRkvkXvX3VSaOajop95t/kkuwQv81SelNocdU/vVcwuyjHBWjyLV
 CC7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzYg/kOiunK7wtrJqhF/TuxZ+FOAFVVjLnZcC93A6OfGlfwu31H9uyhh6Qir8Nc2MZqlfN5sFnl2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf+FFLLa2SIGP8JdOqIQdDtDLScIFw4jFuUaGQWVGh3dh6tL+h
 owbU/793SskwWxKdFVfMVsWGfqkky8Ay++5MCCPT1/OOXZnCYO1cXJUDGgUtKJO0HXdTng7Lryg
 M7JDc5wkd4dIIKGezwtqKko8nrNijMg0=
X-Gm-Gg: AZuq6aJu3QayO9yY/M2oIWsAq3p5QATojBxlHOUQvVY5o1u1mdX56HxcFRlYMm7Urg0
 suEf13PGsRwLDbrKarv4vsHSYCNReruQjlbkNcsboDiDNBt39w4XGHrikn+Z+6b2jqRn99I4Xma
 DDyTe+ddlWed9dHneH1PAd/7I07AKz7O9OSyzutwt9VFiG89wChooskg/8PUnVJQsUpQIzonJ0m
 4QprjgS3ra6HtfKI7ubcpp9UsdMonmfH6OWUm/CcvEVpYkFhxj0RmKO15HDY9hKMEbp3wThhNYd
 9M5GE7uohn70TiPgJ12FnsrFY+cauV55NfsQoKhubjNJBfL0Ok+cI+E+JuGqRxyV7Qx5H85/BvR
 xr0g6n3RpFw==
X-Received: by 2002:a05:6102:4194:b0:5eb:fc32:935c with SMTP id
 ada2fe7eead31-5feb2ea40afmr3964742137.3.1771847545558; Mon, 23 Feb 2026
 03:52:25 -0800 (PST)
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
 <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
In-Reply-To: <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Mon, 23 Feb 2026 11:52:04 +0000
X-Gm-Features: AaiRm53kqVqwYlk73dxvSEeN9WnimirsmxYiC5QcBDjE53JtGAA8jfNwC48NL8s
Message-ID: <CAD0gVBs4m9FpBZ9eVcxRK5y601WPkatGE6e9fi1iK0YA=CiMHw@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
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
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:ribalda@chromium.org,m:stable@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andresfperez@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andresfperez@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[chromium.org,vger.kernel.org,ideasonboard.com,kernel.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,leemhuis.info:email]
X-Rspamd-Queue-Id: A79FF183C16
X-Rspamd-Action: no action

Thorsten,

It's worth a shot. I'll give it a try and report back.

Andr=C3=A9s

On Mon, Feb 23, 2026 at 8:26=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
>
>
> On 2/23/26 09:10, Ricardo Ribalda wrote:
> > Hi Andr=C3=A9s
> >
> > Thanks for doing the bisecting
> >
> > On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gm=
ail.com> wrote:
> >>
> >> # OVERVIEW
> >>
> >> Since kernel v6.16.1, switching from an X11 session to a text VT and b=
ack
> >> freezes the display on a ThinkPad P15 Gen 2. The system remains respon=
sive
> >> over SSH; only the display is frozen. Bisecting identified commit
> >> d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> >> ioctls") as the trigger. Reverting the logic change in that commit
> >> fixes VT switching
> >> on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. =
Wayland
> >> compositors (e.g., river and sway) are not affected.
> >>
> >> Last good:  v6.15.9
> >> First bad:  v6.16.1
> >> Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> >> camera for some ioctls
> >>
> >> ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> >> CPU:        Intel Core i7-11800H (Tiger Lake-H)
> >> iGPU:        Intel UHD Graphics (TGL GT1)
> >> dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-o=
pen)
>
> Could this be caused by nvidia's own driver, even if it is not supposed
> to be involved? Might be worth ruling out with a proper vanilla kernel,
> ideally really fresh, so 7.0-rc1.
>
> Ciao, Thorsten
>
> >> Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> >> Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> >> Firmware:   LENOVO N37ET61W (1.97)
> >> OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display man=
ager
> >>
> >> ## Symptoms and reproduction steps:
> >> 1. Boot, start X11 on tty1 (startx).
> >> 2. Switch to tty2 (Ctrl+Alt+F2): works.
> >> 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
> >>    - Frozen on the last frame shown before switching away.
> >>    - System is fully responsive over SSH.
> >>    - Other VTs switch normally between each other as long as X11 is
> >> not active on them.
> >>    - Killing X does not recover the display. A reboot is required.
> >>
> >> # DEBUG ANALYSIS
> >>
> >> On v6.16.1, the VT switch back to X triggers a full modeset due to pip=
e
> >> configuration mismatches detected by intel_pipe_config_compare:
> >>
> >> [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bp=
p
> >>   (expected 30, found 24)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
> >>   (expected link 269484/524288, found link 336855/524288)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw=
_state
> >>   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> >> [drm:intel_pipe_config_compare] fastset requirement not met in port_cl=
ock
> >>   (expected 270000, found 216000)
> >> [drm:intel_atomic_check] forcing full modeset
> >>
> >> On v6.15.9, the same VT switch shows no such messages.
> >> no pipe_config_compare runs, no modeset, no freeze.
> >>
> >> # BISECT AND VERIFICATION
> >>
> >> The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> >> commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> >> certain V4L2 IOCTLS to call video_ioctl2 directly without first callin=
g
> >> uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_=
get
> >> before video_ioctl2.
> >>
> >> ## VT switching verification across kernel versions:
> >>
> >>   v6.12.74 arch pkg:   WORKS
> >>   v6.15.9 arch pkg:    WORKS
> >>   v6.15.9 from source: WORKS
> >>   v6.16.1 with d1b618e reverted:     WORKS
> >>   v6.17.9 with PM wrapping restored: WORKS
> >>   v6.18.9 with PM wrapping restored: WORKS
> >>
> >>   v6.16.1 from source:  FREEZES
> >>   v6.16.1 arch pkg:     FREEZES
> >>   v6.17.9 arch pkg:     FREEZES
> >>   v6.18.9 from source:  FREEZES
> >>   v6.18.9 arch pkg:     FREEZES
> >>
> >> ## Things that do not eliminate the freeze
> >>
> >>   - module_blacklist=3Duvcvideo on boot
> >>   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)
> >
> > This is puzzling me a bit... You are saying that if you do not build
> > the uvc driver, the freeze is still happening?
> >
> > Am I understanding this correctly?
> >
> >>   - i915.enable_psr=3D0
> >>   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
> >>   - xrandr --output eDP-1 --set "max bpc" 10
> >>   - Xorg config FBDepth 30 (No effect on pipe_bpp)
> >>
> >> ## Workaround patch
> >>
> >> Reverting the optimization from d1b618e to restore the unconditional
> >> uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/=
uvc_v4l2.c
> >> index 9e4a251eca88..15057b47ec4f 100644
> >> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >> @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct fil=
e *file,
> >>   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
> >>   int ret;
> >>
> >> - /* The following IOCTLs need to turn on the camera. */
> >> - switch (converted_cmd) {
> >> - case UVCIOC_CTRL_MAP:
> >> - case UVCIOC_CTRL_QUERY:
> >> - case VIDIOC_G_CTRL:
> >> - case VIDIOC_G_EXT_CTRLS:
> >> - case VIDIOC_G_INPUT:
> >> - case VIDIOC_QUERYCTRL:
> >> - case VIDIOC_QUERYMENU:
> >> - case VIDIOC_QUERY_EXT_CTRL:
> >> - case VIDIOC_S_CTRL:
> >> - case VIDIOC_S_EXT_CTRLS:
> >> - case VIDIOC_S_FMT:
> >> - case VIDIOC_S_INPUT:
> >> - case VIDIOC_S_PARM:
> >> - case VIDIOC_TRY_EXT_CTRLS:
> >> - case VIDIOC_TRY_FMT:
> >> - ret =3D uvc_pm_get(handle->stream->dev);
> >> - if (ret)
> >> - return ret;
> >> - ret =3D video_ioctl2(file, cmd, arg);
> >> - uvc_pm_put(handle->stream->dev);
> >> + ret =3D uvc_pm_get(handle->stream->dev);
> >> + if (ret)
> >>   return ret;
> >> - }
> >> -
> >> - /* The other IOCTLs can run with the camera off. */
> >> - return video_ioctl2(file, cmd, arg);
> >> + ret =3D video_ioctl2(file, cmd, arg);
> >> + uvc_pm_put(handle->stream->dev);
> >> + return ret;
> >>  }
> >>
> >>  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
> >>
> >> Andr=C3=A9s
> >>
> >
> >
>
