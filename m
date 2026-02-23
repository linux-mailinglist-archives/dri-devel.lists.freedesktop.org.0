Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HEqLHZ4LnGlL/QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 09:11:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B746C172F32
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 09:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5F310E267;
	Mon, 23 Feb 2026 08:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jQpj9sYY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B65510E267
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 08:11:05 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b8876d1a39bso551496066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 00:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1771834263; x=1772439063;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fPcLFGqvXQ/TrcZMbc9zEuLscnPpwUEKK1FNGlp3euE=;
 b=jQpj9sYY2rNOo+nsBO64e6czVuOrI7kXcg1HwdciJPwvyCudspP2Pr4AVb7yALCCC5
 ybIFb8DhmaVDNCDIvAj5/YP7AvfpydXD3hDvcL53moXHR9PhcwoGh+gQ2kzFRZ+FtDkc
 yh1nCH9ACeJracyLnrId8XKVopFRe2xe+RY0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771834263; x=1772439063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fPcLFGqvXQ/TrcZMbc9zEuLscnPpwUEKK1FNGlp3euE=;
 b=hxoi8hXy36JR0SVLVO0cudRuTHLecXwXpIlubTdexZ72fHGvTQExaioxS4vpneDRoz
 tvOu+Xl2BWOeDSu9BTjRsuiQTaVwnvftBs0AGP+gIAU5InSyLefMc8D63znNprHx3rPq
 Ur3k472vN83xVeHnuXRjqvhZElJk+IleKHe4fDW6bdpJIKhEcDzDED6BcUXPMLz51fCq
 Bt10bg740350609BpoVGupA7rpfyeriaEMqxGoXFuOaDgKAoFUfLFnfiuPtZ3gIo+hJ6
 QbLmMAGDJoU923vEaOYsuzXPOyKIaUDRcA8RNgekyi7H7yyWgp1eUUS5dIss7uBzDfNi
 OGLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNXEFIyooDPAJ5AAdknZH4kQ24THtTRr+t9zCRNFdmydjRs+AlMnQJ/PVq+V8jK/7/oq+tT+797Bo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVHbljMrOatMQDO4w0qPEIU/geN24jZukbg7lrDsY3rg9hVWGr
 THP/mmW5Ke5qdDehPiNsMzxDAjNIWO41nYaMxfKsoVoWVtCwjMfTPYKt63a/86ohgcyp8ccGE1C
 MDEM=
X-Gm-Gg: AZuq6aKeBI1pVcszjPSyGUbLu0aA2VXQ7iisGSWbRIYCglAeruAGFcHyVKGV6NWrL+h
 a7V9Ky97csLwLxNuBVtIWi8+Mt8HEobMLDwCckPftvQvZKBt4ZkgFG0knCrSrvoE41upB7tdqnH
 XOTjc8BrR6fsm4eSkH7bGgqayYJ8BkB0cbLr6A8WrCFrE63s06aGu+zZsHajHwEB6nzFx4kS61Z
 VPAoDKcaezrDT3zR0GOXSFWPSaWWXDDbluQqD+NGs02KjJJ6ZvZRpWY8JymQW2nsCc3ePwLRV1u
 q0xT6jxwQO8W0YoUILu1vJtXBMk3ZlWn8CceX63nEerfeweE4YrsHKJpgMAbhiXNmL4G5BufoPH
 Zy36eHKBf5WAtxq+nqxcZgAL7m2x8/zQo7FFMRpAgGkMZ67UzpO+S+jo5ypoYjTURwyFSOnYejY
 S4qFtAGqbx9tL8+QXiUS/S4flkwkn+I+Fgzw/cm3Hqp4NH/aV1wr/01zHoTvl4
X-Received: by 2002:a17:907:9628:b0:b88:227e:3870 with SMTP id
 a640c23a62f3a-b908191f301mr435648466b.11.1771834263424; 
 Mon, 23 Feb 2026 00:11:03 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084c5d474sm303113666b.13.2026.02.23.00.11.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 00:11:03 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-65b9608a9adso6838958a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 00:11:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVkGdPFf74d9VQEjTQPKeWitxBafZkAhhwKCTLHEodFpfhtKMMXBZuSdAXumPfluCsj2miEAkSQ18k=@lists.freedesktop.org
X-Received: by 2002:a17:907:94cc:b0:b87:12d2:fa1a with SMTP id
 a640c23a62f3a-b908191f1d6mr445251466b.12.1771834262096; Mon, 23 Feb 2026
 00:11:02 -0800 (PST)
MIME-Version: 1.0
References: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
In-Reply-To: <CAD0gVBsyzYNA6ydPwg9mJ9VQzYg4zPAi24JQ13-=0KtdbQ039A@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Feb 2026 09:10:49 +0100
X-Gmail-Original-Message-ID: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
X-Gm-Features: AaiRm53F0LIMOe6xezXE30KkDM_p2uBY1AB8eOErFcvfTTb2PhOgsWveImx1C0M
Message-ID: <CANiDSCsMVE7qAcjcjbjhYSMoyypkR5Nq-ZA-e=CJVY5CUGAG7Q@mail.gmail.com>
Subject: Re: [REGRESSION] Display freeze on VT switch back to X11 since v6.16
To: =?UTF-8?B?QW5kcsOpcyBQw6lyZXo=?= <andres.f.perez@gmail.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andres.f.perez@gmail.com,m:stable@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,m:andresfperez@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ribalda@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,kernel.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B746C172F32
X-Rspamd-Action: no action

Hi Andr=C3=A9s

Thanks for doing the bisecting

On Sun, 22 Feb 2026 at 22:56, Andr=C3=A9s P=C3=A9rez <andres.f.perez@gmail.=
com> wrote:
>
> # OVERVIEW
>
> Since kernel v6.16.1, switching from an X11 session to a text VT and back
> freezes the display on a ThinkPad P15 Gen 2. The system remains responsiv=
e
> over SSH; only the display is frozen. Bisecting identified commit
> d1b618e7954802fe ("media: uvcvideo: Do not turn on the camera for some
> ioctls") as the trigger. Reverting the logic change in that commit
> fixes VT switching
> on v6.16.1, v6.17.9, and v6.18.9, but that is not an actual solution. Way=
land
> compositors (e.g., river and sway) are not affected.
>
> Last good:  v6.15.9
> First bad:  v6.16.1
> Bisect result: d1b618e7954802fe media: uvcvideo: Do not turn on the
> camera for some ioctls
>
> ## Hardware:   Lenovo ThinkPad P15 Gen 2i (20YQ0031US)
> CPU:        Intel Core i7-11800H (Tiger Lake-H)
> iGPU:        Intel UHD Graphics (TGL GT1)
> dGPU:       NVIDIA T1200 (not involved in eDP output; driver: nvidia-open=
)
> Display:    15.6" 1920x1080 eDP, 10 bpc capable (EDID 1.4)
> Webcam:     Integrated Camera on PCH xHCI (Bus 003 Port 004)
> Firmware:   LENOVO N37ET61W (1.97)
> OS:         Arch Linux, Nix home-manager, X11 + xmonad, no display manage=
r
>
> ## Symptoms and reproduction steps:
> 1. Boot, start X11 on tty1 (startx).
> 2. Switch to tty2 (Ctrl+Alt+F2): works.
> 3. Switch back to tty1 (Ctrl+Alt+F1): display freezes.
>    - Frozen on the last frame shown before switching away.
>    - System is fully responsive over SSH.
>    - Other VTs switch normally between each other as long as X11 is
> not active on them.
>    - Killing X does not recover the display. A reboot is required.
>
> # DEBUG ANALYSIS
>
> On v6.16.1, the VT switch back to X triggers a full modeset due to pipe
> configuration mismatches detected by intel_pipe_config_compare:
>
> [drm:intel_pipe_config_compare] fastset requirement not met in pipe_bpp
>   (expected 30, found 24)
> [drm:intel_pipe_config_compare] fastset requirement not met in dp_m_n
>   (expected link 269484/524288, found link 336855/524288)
> [drm:intel_pipe_config_compare] fastset requirement not met in dpll_hw_st=
ate
>   (expected cfgcr0: 0xe001a5, found cfgcr0: 0x1c2)
> [drm:intel_pipe_config_compare] fastset requirement not met in port_clock
>   (expected 270000, found 216000)
> [drm:intel_atomic_check] forcing full modeset
>
> On v6.15.9, the same VT switch shows no such messages.
> no pipe_config_compare runs, no modeset, no freeze.
>
> # BISECT AND VERIFICATION
>
> The bisect converged on d1b618e7954802fe in the uvcvideo driver. This
> commit adds a switch statement to uvc_v4l2_unlocked_ioctl that allows
> certain V4L2 IOCTLS to call video_ioctl2 directly without first calling
> uvc_pm_get/uvc_pm_put. Prior to this commit, all ioctls called uvc_pm_get
> before video_ioctl2.
>
> ## VT switching verification across kernel versions:
>
>   v6.12.74 arch pkg:   WORKS
>   v6.15.9 arch pkg:    WORKS
>   v6.15.9 from source: WORKS
>   v6.16.1 with d1b618e reverted:     WORKS
>   v6.17.9 with PM wrapping restored: WORKS
>   v6.18.9 with PM wrapping restored: WORKS
>
>   v6.16.1 from source:  FREEZES
>   v6.16.1 arch pkg:     FREEZES
>   v6.17.9 arch pkg:     FREEZES
>   v6.18.9 from source:  FREEZES
>   v6.18.9 arch pkg:     FREEZES
>
> ## Things that do not eliminate the freeze
>
>   - module_blacklist=3Duvcvideo on boot
>   - CONFIG_USB_VIDEO_CLASS=3Dn (compiled out)

This is puzzling me a bit... You are saying that if you do not build
the uvc driver, the freeze is still happening?

Am I understanding this correctly?

>   - i915.enable_psr=3D0
>   - Bypassing intel_vrr_transcoder_enable/disable (no-op)
>   - xrandr --output eDP-1 --set "max bpc" 10
>   - Xorg config FBDepth 30 (No effect on pipe_bpp)
>
> ## Workaround patch
>
> Reverting the optimization from d1b618e to restore the unconditional
> uvc_pm_get/put wrapping for all ioctls. This is not a proper fix.
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc=
_v4l2.c
> index 9e4a251eca88..15057b47ec4f 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1199,33 +1199,12 @@ static long uvc_v4l2_unlocked_ioctl(struct file *=
file,
>   unsigned int converted_cmd =3D v4l2_translate_cmd(cmd);
>   int ret;
>
> - /* The following IOCTLs need to turn on the camera. */
> - switch (converted_cmd) {
> - case UVCIOC_CTRL_MAP:
> - case UVCIOC_CTRL_QUERY:
> - case VIDIOC_G_CTRL:
> - case VIDIOC_G_EXT_CTRLS:
> - case VIDIOC_G_INPUT:
> - case VIDIOC_QUERYCTRL:
> - case VIDIOC_QUERYMENU:
> - case VIDIOC_QUERY_EXT_CTRL:
> - case VIDIOC_S_CTRL:
> - case VIDIOC_S_EXT_CTRLS:
> - case VIDIOC_S_FMT:
> - case VIDIOC_S_INPUT:
> - case VIDIOC_S_PARM:
> - case VIDIOC_TRY_EXT_CTRLS:
> - case VIDIOC_TRY_FMT:
> - ret =3D uvc_pm_get(handle->stream->dev);
> - if (ret)
> - return ret;
> - ret =3D video_ioctl2(file, cmd, arg);
> - uvc_pm_put(handle->stream->dev);
> + ret =3D uvc_pm_get(handle->stream->dev);
> + if (ret)
>   return ret;
> - }
> -
> - /* The other IOCTLs can run with the camera off. */
> - return video_ioctl2(file, cmd, arg);
> + ret =3D video_ioctl2(file, cmd, arg);
> + uvc_pm_put(handle->stream->dev);
> + return ret;
>  }
>
>  const struct v4l2_ioctl_ops uvc_ioctl_ops =3D {
>
> Andr=C3=A9s
>


--=20
Ricardo Ribalda
