Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNnqLg2NoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF011AD5D1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE21A10E9F2;
	Thu, 26 Feb 2026 18:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZRahhQ0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F68510E10F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 13:01:21 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-5674d8be45eso2644482e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 05:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772024480; cv=none;
 d=google.com; s=arc-20240605;
 b=gTTiWgCehd3EjCYrgIC1V1PWyvpPI6yj2g6oSk09zBVOgNW6CXIuwdn37OIJYtA04P
 Fss7TIR67upp1uZ/0L8EK8l0jIoEyAh6fNQodBklWJ6q5p7f7QXWAkEpXlCtoF/ztfTS
 eyg3cnud5x0pymUtrO16Jp9I/w5V2PwA/DGPyYsFPitW8t3kaMjcDtJCQ9/ACNczDzAs
 2jAqUu1oLFurmFzYJQbgW93vgYDhmel134sFGIu6iNnOsRQ+/cVlWDwwx3Sb63JH2vBg
 gBoDvqUp50rRb3+3/JnQkVvy3wwTqBlNsitv8RnptEBDWm/optRJVvQxhshj/wKmquo+
 Bb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
 fh=G2txjr90VQWOak8GxUE95qrxxwPWJhkI/cIrYj7I82w=;
 b=T8B0zPTsJ0xzZ8JGTYGibUPrwptw4Dn2c40p9IyA0Sglf/Z0hWcj2u/6r6BSBbqY0W
 tATis42Mxf3LiFMUfyGyfPBmmThsXwmOVQYwJukDLd06Q+KIspQDjSCpJylwr5z24jkb
 pAkliYCASywoGSTwCJjs8XTKizaKUPDjLhe5hIGtrRyeLFPz36pc0y6XseUUySpr5/eZ
 6rBAxtW5ypFlTqJLw41lJEWfXFEtxXNi5xeR814o3CDrbtdpYDQNpNmHZmWX21uFUIlx
 NfgOUTL/8JoXB7kCKGwvu5mPXpJQ4oiy0qZ4yROBrYlkJHSAT8fJw47ROtIPSWIck6rG
 DUfw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772024480; x=1772629280; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
 b=ZRahhQ0+ACEgMCM+crn02npT1O+ESZYwQTlGuex3CaUjMQwoHpnUw76iKcfmHuHmwr
 eRA+9eZHIY6ry9v+vTT7GjqiJJEvznOunKw7Mzak6Omux69OAtRm+ZM9v1HBI5WIxPF/
 7DyJb/t2KHl1NHmHGozm1RDYhINkUQmaHWGQn2WQhtZGg7kUfwS/R1bLx8dRGkc8Cihi
 5OTpWxYBKRh2VeSo9xg01dUapYr8i1H+bRfmkDyFyCIiqI/zJe6dcWtqOysF150zfQXJ
 dRY/g/5hU5PxaGsSCOiR1nwdB2697jEzWzXcpPMYlpRSE9a5EqZY3kfhjkBgFsxdU+P2
 bnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772024480; x=1772629280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gdcuy9iaPpeMvNyOTp4uTsufvW1t3dj/0T0Nt9nk9jk=;
 b=bTSDAWPYV/EHBbQelCwz0+diGD70WkoJHpYEq6Fh7BQhgnGtG0tnXzzK8joASTi3KM
 M3TA3LBpSMaaXnvl1nV2gR5Jh9YOMyztU8LC1oDTsiLMQ6enRnxLcdQRcH0AfaA6/D5B
 UK8um9uxf2HY9mT6sH8Qcp/48muTpKcXJRNEOKk5QeMz4d3JMIoQR11Ju86ZACN//sDG
 0nFwjsLowHJhUMzYZSdtMpCAW6NtWtwM2kSaYRxhYU44VL+bWU5auyWCd9bEElqRQ9OV
 tvwgsf+sN3prf+ssylNBqP1HircfrmzpsX5cmPE7NPfUdninx4ozBwEECz9vYVbyLLdS
 BB0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKX/sUIXSNcdz7L6SONqd2wsHCUyZ9veqqjbxfQAk9X1XsHUPJJ+dxan3pcTmt6Uj+TgJIHUtzVvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys8sglkzC8hpeD45jPVy+9d3DzBKEOFbNVmbEqh2qasBzP4htc
 SnCRsRB8n/pxWUnZeLDqPvXBVfsMd/zdtNUWZALkEFi84Zni5dUDuKZZVBYwhfm/q40ZhnQNyAg
 3EG1+Xk/zykUwXU2N/3S1winV/Br+9Ow=
X-Gm-Gg: ATEYQzwHdY//q2OWr0ML8VBIpwGYXJb9o/ZptCinq6TTeX2HdPD/IN7zuZFJG7JA3vI
 UArMIVivxFA+SI/tgsU3iQw1JxCIqkPI3p9Imh2xI0y2B1ynT1Iv2/ZpcixUhRi8En0ANVw1kfu
 5FKF68la0KM7mAyUBH7cQNcHgLyNrmKLVB1xrUoM9tuE3vaZ+/mu+Szf89loQNN2kHKnl7Blucf
 gtbyzfPn6eEJC7k50BS7yoAZTik21HaGCSC+LTSZsJVHxdArBS1pX0Ktu3jlc7xqa1mCsF0CHwX
 4LI5zcEIANLtNjFkAKxR6SvwCMW/BqymCfjYOd2BmSoipHlzP1hb8D01lCEqDNME9VnAMvVD2bR
 tZ0q5ghDbkA==
X-Received: by 2002:a05:6102:c48:b0:5fe:13bc:f13a with SMTP id
 ada2fe7eead31-5feb30f2f8bmr6491053137.36.1772024478156; Wed, 25 Feb 2026
 05:01:18 -0800 (PST)
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
 <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
 <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
In-Reply-To: <068a5363-de97-4d67-94a9-c9a2baed68b0@leemhuis.info>
From: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
Date: Wed, 25 Feb 2026 13:00:55 +0000
X-Gm-Features: AaiRm53w9VqfdeuFM3tO4rVuI77Og9DiXXronH78foC19VF0BgkGYZqa119Jqws
Message-ID: <CAD0gVBvB6grt+Px_KV15eFFp8akuttEk6XY_r6L1yyuP75K+7A@mail.gmail.com>
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
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
X-Spamd-Result: default: False [-0.64 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DATE_IN_PAST(1.00)[29];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:ribalda@chromium.org,m:stable@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andresfperez@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andresfperez@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[chromium.org,vger.kernel.org,ideasonboard.com,kernel.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,leemhuis.info:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3FF011AD5D1
X-Rspamd-Action: no action

Thorsten,

So I built vanilla 7.0-rc1. I also added these kernel params:
    nvidia-drm.modeset=3D0
    modprobe.blacklist=3Dnvidia,nvidia_drm,nvidia_modeset,nvidia_uvm
    rd.driver.blacklist=3Dnvidia,nvidia_drm,nvidia_modeset,nvidia_uvm

then I booted into it. this is what my nvidia loadout looks like on my
usual 6.18.9:
    + uname -r
    6.18.9-arch1-2
    + lsmod
    + grep -E nvidia|nouveau
    nvidia_drm            147456  3
    nvidia_modeset       2121728  3 nvidia_drm
    nvidia_uvm           2568192  0
    nvidia              16306176  34 nvidia_uvm,nvidia_modeset
    drm_ttm_helper         16384  2 nvidia_drm,xe
    video                  81920  4 thinkpad_acpi,xe,i915,nvidia_modeset
    + lspci -nnk
    + grep -iA2 VGA\|3D\|Display
    00:02.0 VGA compatible controller [0300]: Intel Corporation
TigerLake-H GT1 [UHD Graphics] [8086:9a60] (rev 01)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: i915
    --
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation
TU117GLM [T1200 Laptop GPU] [10de:1fbc] (rev a1)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: nvidia

and this is what it looked like in vanilla 7.0-rc1 with blacklisted nvidia:
    + uname -r
    7.0.0-rc1-dirty
    + lsmod
    + grep -E nvidia|nouveau
    + lspci -nnk
    + grep -iA2 VGA\|3D\|Display
    00:02.0 VGA compatible controller [0300]: Intel Corporation
TigerLake-H GT1 [UHD Graphics] [8086:9a60] (rev 01)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel driver in use: i915
    --
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation
TU117GLM [T1200 Laptop GPU] [10de:1fbc] (rev a1)
        Subsystem: Lenovo Device [17aa:22d8]
        Kernel modules: nouveau

when I did a VT switch, it froze. my 90s failsafe triggered and rebooted me=
.
then I rebuilt 7.0-rc1 with my patch, rebooted with the same efi
loader, and was able to perform VT switching without any issues.

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
