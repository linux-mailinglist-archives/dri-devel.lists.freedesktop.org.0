Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205339EF3D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993316E0A8;
	Tue,  8 Jun 2021 07:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C937C6E0A8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 07:10:38 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 k21-20020a4a2a150000b029024955603642so2619284oof.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kONHKi0GPabu6CT/pGcqenb1d6sDVo68rdZqlXBKC84=;
 b=Z7gWEu93hpHjnALyw0+bPZNfHiRjpO0tYqiH12fqqQQP7elRX7LVePVQUknZahFnrS
 IaCo6irBiVphU7ZMrfDz+rdtZ98ojpd/6wsr6P+76DMDFlgzonzuWWxPyrF6Wq5+LrVq
 /czlIQvHLQ+CzqV648IIJYzN3rvgZuxbT4AgzImE4nDNWFg7D048A+eCAwEE8+ceyKNj
 zIqB+0iZwEiwxqaru6kwTl5IbIKdXDBsd9IlML1snDsLvousIptDqwrAJsNOdmKK9xxJ
 f/5I/9wg4P8+lMJhR/xLCYlEPN9cOj86z+c895GNKalKkJui3D14FPJBm62wogBnewCG
 0ZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kONHKi0GPabu6CT/pGcqenb1d6sDVo68rdZqlXBKC84=;
 b=pLedcsa2IZIXmy3k60kGtYVbAOh42xDNuryx2OnI0Cvg6Hh3HlrdCKbTZiwMPP1rAa
 goT6cJVunJWXQ60XRprEnzk7MceF50qBe0Qb+ZhQwJWhxAq/z/MnJOHgRBj1eTxpeMuz
 PmvSv2v5PYd8hGpJfQdutIMfgNI9Og/PBW2uKdhU6qHmIwzHnAD3QaA1pUrar0gjcRJI
 IOGkB4/Q5NqOKm8IE0FKFj6foy5ljC1U9o9s0MAzLazeJ4Cbr0rt2FeDISZ1q3CqEXQm
 llzDURQIUH74KxImc0fKEIkK0rRwO5hEm0TPDpkLbXTXB1AKF1ofMVwSG/L3aF3lp4Gy
 PPUQ==
X-Gm-Message-State: AOAM533Mm57bj4Od8AbaT40ha8or0Cf8Yf7pgCB7yO9rQCCbfkyjnSIJ
 6qlOBe5iuuD+I9U/Y24GdjzdebYMx1MFi+KLsxTB4KM9HiE=
X-Google-Smtp-Source: ABdhPJwOx8eVT1oB03jP8PtvxJgOhfkCiXwuQB0FadywYks8OC5l7DyYF3rxl/RTJHu5FT1ABTFHjatyWkMIuMUVA5M=
X-Received: by 2002:a4a:315a:: with SMTP id v26mr16258531oog.75.1623136237983; 
 Tue, 08 Jun 2021 00:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAJeZQfg5fq8B7iVu6Wga+aM015o_ViiSUcJxAEtDE9-GXxgSOw@mail.gmail.com>
 <820078f3-1adf-d561-1772-f63de6d46ed6@daenzer.net>
In-Reply-To: <820078f3-1adf-d561-1772-f63de6d46ed6@daenzer.net>
From: Sichem Zhou <sichem.zh@gmail.com>
Date: Tue, 8 Jun 2021 15:10:26 +0800
Message-ID: <CAJeZQfhbYR8YdPvdznTL+nK6Gy+=0Bp42-h+5SqXVnrWP17sVg@mail.gmail.com>
Subject: Re: [QUESTION] drmModeAtomicCommit returns -EINVAL on return
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michel,

Thanks for your answer, I just enabled the debug and captured a drm debug l=
og
from dmesg, but I don't seem to find anything that looks like an
error, Is there anything specific I should be looking for?

Sorry for attaching my log here, here is the last drmModeAtomicCommit
where I had -einval.

[   56.005133] [drm:drm_atomic_state_init [drm]] Allocated atomic
state 00000000c20a40d6
[   56.005218] [drm:drm_mode_object_get [drm]] OBJ ID: 97 (3)
[   56.005297] [drm:drm_mode_object_get [drm]] OBJ ID: 97 (4)
[   56.005373] [drm:drm_atomic_get_plane_state [drm]] Added
[PLANE:31:plane 1A] 0000000040b2d9eb state to 00000000c20a40d6
[   56.005457] [drm:drm_mode_object_get [drm]] OBJ ID: 122 (1)
[   56.005534] [drm:drm_atomic_get_crtc_state [drm]] Added
[CRTC:51:pipe A] 0000000073659c18 state to 00000000c20a40d6
[   56.005611] [drm:drm_atomic_get_plane_state [drm]] Added
[PLANE:39:plane 2A] 0000000071f640c7 state to 00000000c20a40d6
[   56.005687] i915 0000:00:02.0: [drm:drm_atomic_set_fb_for_plane
[drm]] Set [NOFB] for [PLANE:39:plane 2A] state 0000000071f640c7
[   56.005765] [drm:drm_atomic_get_plane_state [drm]] Added
[PLANE:47:cursor A] 000000000ebe824b state to 00000000c20a40d6
[   56.005839] i915 0000:00:02.0: [drm:drm_atomic_set_fb_for_plane
[drm]] Set [NOFB] for [PLANE:47:cursor A] state 000000000ebe824b
[   56.005911] [drm:drm_atomic_get_plane_state [drm]] Added
[PLANE:52:plane 1B] 00000000b6f083af state to 00000000c20a40d6
[   56.005983] [drm:drm_atomic_get_plane_state [drm]] Added
[PLANE:60:plane 2B] 00000000243f0105 state to 00000000c20a40d6
[   56.006055] i915 0000:00:02.0: [drm:drm_atomic_set_fb_for_plane
[drm]] Set [NOFB] for [PLANE:60:plane 2B] state 00000000243f0105
[   56.006124] [drm:drm_atomic_get_plane_state [drm]] Added
[PLANE:68:cursor B] 00000000c385344b state to 00000000c20a40d6
[   56.006196] i915 0000:00:02.0: [drm:drm_atomic_set_fb_for_plane
[drm]] Set [NOFB] for [PLANE:68:cursor B] state 00000000c385344b
[   56.006264] [drm:drm_atomic_get_plane_state [drm]] Added
[PLANE:73:plane 1C] 000000006229658a state to 00000000c20a40d6
[   56.006336] [drm:drm_atomic_get_plane_state [drm]] Added
[PLANE:81:plane 2C] 0000000065fc3015 state to 00000000c20a40d6
[   56.006407] i915 0000:00:02.0: [drm:drm_atomic_set_fb_for_plane
[drm]] Set [NOFB] for [PLANE:81:plane 2C] state 0000000065fc3015
[   56.006475] [drm:drm_atomic_get_plane_state [drm]] Added
[PLANE:89:cursor C] 00000000c5c2644d state to 00000000c20a40d6
[   56.006546] i915 0000:00:02.0: [drm:drm_atomic_set_fb_for_plane
[drm]] Set [NOFB] for [PLANE:89:cursor C] state 00000000c5c2644d
[   56.006618] i915 0000:00:02.0: [drm:drm_atomic_set_fb_for_plane
[drm]] Set [FB:97] for [PLANE:31:plane 1A] state 0000000040b2d9eb
[   56.006686] [drm:drm_mode_object_get [drm]] OBJ ID: 97 (5)
[   56.006763] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 97 (6)
[   56.006858] [drm:drm_atomic_add_affected_connectors [drm]] Adding
all current connectors for [CRTC:51:pipe A] to 00000000c20a40d6
[   56.006942] [drm:drm_mode_object_get [drm]] OBJ ID: 95 (4)
[   56.007019] [drm:drm_mode_object_get [drm]] OBJ ID: 95 (5)
[   56.007094] [drm:drm_atomic_get_connector_state [drm]] Added
[CONNECTOR:95:eDP-1] 0000000066710aab state to 00000000c20a40d6
[   56.007172] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 95 (5)
[   56.007250] i915 0000:00:02.0:
[drm:drm_atomic_set_crtc_for_connector [drm]] Link
[CONNECTOR:95:eDP-1] state 0000000066710aab to [NOCRTC]
[   56.007321] [drm:drm_mode_object_get [drm]] OBJ ID: 95 (4)
[   56.007397] i915 0000:00:02.0:
[drm:drm_atomic_set_crtc_for_connector [drm]] Link
[CONNECTOR:95:eDP-1] state 0000000066710aab to [CRTC:51:pipe A]
[   56.007471] [drm:drm_atomic_get_crtc_state [drm]] Added
[CRTC:72:pipe B] 0000000065ce9351 state to 00000000c20a40d6
[   56.007548] i915 0000:00:02.0: [drm:drm_atomic_set_mode_for_crtc
[drm]] Set [NOMODE] for [CRTC:72:pipe B] state 0000000065ce9351
[   56.007618] i915 0000:00:02.0: [drm:drm_atomic_set_fb_for_plane
[drm]] Set [NOFB] for [PLANE:52:plane 1B] state 00000000b6f083af
[   56.007684] [drm:drm_atomic_add_affected_connectors [drm]] Adding
all current connectors for [CRTC:72:pipe B] to 00000000c20a40d6
[   56.007765] [drm:drm_atomic_get_crtc_state [drm]] Added
[CRTC:93:pipe C] 0000000067f37a81 state to 00000000c20a40d6
[   56.007838] i915 0000:00:02.0: [drm:drm_atomic_set_mode_for_crtc
[drm]] Set [NOMODE] for [CRTC:93:pipe C] state 0000000067f37a81
[   56.007907] i915 0000:00:02.0: [drm:drm_atomic_set_fb_for_plane
[drm]] Set [NOFB] for [PLANE:73:plane 1C] state 000000006229658a
[   56.007975] [drm:drm_atomic_add_affected_connectors [drm]] Adding
all current connectors for [CRTC:93:pipe C] to 00000000c20a40d6
[   56.008051] [drm:drm_atomic_check_only [drm]] checking 00000000c20a40d6
[   56.008133] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]]
Updating routing for [CONNECTOR:95:eDP-1]
[   56.008184] [drm:drm_atomic_helper_check_modeset [drm_kms_helper]]
[CONNECTOR:95:eDP-1] keeps [ENCODER:94:DDI A/PHY A], now on
[CRTC:51:pipe A]
[   56.008232] [drm:drm_atomic_add_encoder_bridges [drm]] Adding all
bridges for [encoder:94:DDI A/PHY A] to 00000000c20a40d6
[   56.008311] [drm:drm_atomic_add_encoder_bridges [drm]] Adding all
bridges for [encoder:94:DDI A/PHY A] to 00000000c20a40d6
[   56.008390] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 97 (5)
[   56.008469] [drm:drm_mode_object_get [drm]] OBJ ID: 97 (4)
[   56.008554] i915 0000:00:02.0: [drm:intel_plane_atomic_calc_changes
[i915]] [CRTC:51:pipe A] with [PLANE:31:plane 1A] visible 1 -> 1, off
0, on 0, ms 0
[   56.008824] i915 0000:00:02.0:
[drm:intel_atomic_get_global_obj_state [i915]] Added new global object
000000008a949845 state 00000000a680ff36 to 00000000c20a40d6
[   56.009059] i915 0000:00:02.0:
[drm:intel_atomic_get_global_obj_state [i915]] Added new global object
00000000db701695 state 0000000099e760e4 to 00000000c20a40d6
[   56.009292] [drm:drm_atomic_commit [drm]] committing
00000000c20a40d6
[   56.009430] i915 0000:00:02.0:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal [drm]] crtc
0 : v p(0,1029)@ 55.633486 -> 55.627611 [e 0 us, 0 rep]
[   56.009519] i915 0000:00:02.0: [drm:drm_vblank_restore [drm]]
missed 38 vblanks in 263172022 ns, frame duration=3D6943097 ns,
hw_diff=3D38
[   56.009599] i915 0000:00:02.0: [drm:drm_vblank_enable [drm]]
enabling vblank on crtc 0, ret: 0
[   56.009675] i915 0000:00:02.0:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal [drm]] crtc
0 : v p(0,1071)@ 55.633731 -> 55.627616 [e 0 us, 0 rep]
[   56.009755] i915 0000:00:02.0:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal [drm]] crtc
0 : v p(0,-131)@ 55.633811 -> 55.634559 [e 0 us, 0 rep]
[   56.009831] i915 0000:00:02.0: [drm:drm_update_vblank_count [drm]]
updating vblank count on crtc 0: current=3D7575, diff=3D1, hw=3D8436
hw_last=3D8435
[   56.009917] i915 0000:00:02.0:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal [drm]] crtc
0 : v p(0,-103)@ 55.633970 -> 55.634558 [e 0 us, 0 rep]
[   56.010025] i915 0000:00:02.0: [drm:drm_update_vblank_count [drm]]
updating vblank count on crtc 0: current=3D7576, diff=3D0, hw=3D8436
hw_last=3D8436
[   56.010112] i915 0000:00:02.0:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal [drm]] crtc
0 : v p(0,-68)@ 55.634168 -> 55.634556 [e 0 us, 0 rep]
[   56.010191] i915 0000:00:02.0: [drm:drm_update_vblank_count [drm]]
updating vblank count on crtc 0: current=3D7576, diff=3D0, hw=3D8436
hw_last=3D8436
[   56.016771] i915 0000:00:02.0:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal [drm]] crtc
0 : v p(0,-118)@ 55.640809 -> 55.641483 [e 0 us, 0 rep]
[   56.016798] i915 0000:00:02.0: [drm:drm_update_vblank_count [drm]]
updating vblank count on crtc 0: current=3D7576, diff=3D1, hw=3D8437
hw_last=3D8436
[   56.016814] i915 0000:00:02.0: [drm:drm_handle_vblank [drm]] vblank
event on 7577, current 7577
[   56.016907] [drm:drm_atomic_state_default_clear [drm]] Clearing
atomic state 00000000c20a40d6
[   56.016927] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 95 (5)
[   56.016945] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 95 (4)
[   56.016964] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 122 (2)
[   56.016981] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 97 (5)
[   56.016997] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 97 (4)
[   56.017015] [drm:__drm_atomic_state_free [drm]] Freeing atomic
state 00000000c20a40d6
[   56.017034] [drm:drm_release_noglobal [drm]] driver lastclose
completed
[   56.023639] i915 0000:00:02.0:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal [drm]] crtc
0 : v p(0,-131)@ 55.647660 -> 55.648408 [e 0 us, 0 rep]
[   56.023668] i915 0000:00:02.0: [drm:drm_update_vblank_count [drm]]
updating vblank count on crtc 0: current=3D7577, diff=3D1, hw=3D8438
hw_last=3D8437
[   56.023688] i915 0000:00:02.0: [drm:vblank_disable_fn [drm]]
disabling vblank on crtc 0
[   56.023706] i915 0000:00:02.0:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal [drm]] crtc
0 : v p(0,-119)@ 55.647729 -> 55.648408 [e 0 us, 0 rep]
[   56.023725] i915 0000:00:02.0: [drm:drm_update_vblank_count [drm]]
updating vblank count on crtc 0: current=3D7578, diff=3D0, hw=3D8438
hw_last=3D8438
[   57.924428] i915 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked
[i915]] Turning [ENCODER:94:DDI A/PHY A] VDD off
[   57.924748] i915 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked
[i915]] PP_STATUS: 0x80000008 PP_CONTROL: 0x00000067
[   57.924956] i915 0000:00:02.0:
[drm:__intel_display_power_put_domain [i915]] disabling DC off
[   57.925163] i915 0000:00:02.0: [drm:skl_enable_dc6 [i915]] Enabling DC6
[   57.925361] i915 0000:00:02.0: [drm:gen9_set_dc_state [i915]]
Setting DC state from 00 to 02

Best regards,
Sichem

On Mon, Jun 7, 2021 at 4:32 PM Michel D=C3=A4nzer <michel@daenzer.net> wrot=
e:
>
> On 2021-06-05 6:06 a.m., Sichem Zhou wrote:
> >
> > 1. Is there any way to debug when the functions like drmModeSetCrtc,
> > drmModePageFlip and drmModeAtomicCommit returns non zero, besides
> > getting the errno?
>
> Enable appropriate debugging bits in /sys/module/drm/parameters/debug, re=
produce problem, (disable debugging bits again), check dmesg.
>
>
> > 4. Do I need to wait for vblank for modesetting? I know it will be an
> > error if I tried to do drmModePageFlip before the last one is handled
> > but what about drmModeSetCrtc? Do I need to wait for a vblank for the
> > last pageflip?
>
> Right now, if you don't wait for any pending page flip to complete before
> drmModeSetCrtc, the two may race, and the CRTC may end up scanning out fr=
om the FB set by the page flip.
>
> Maybe this race should be prevented in the kernel though.
>
> There's no need to wait for vblank.
>
>
> I have to defer to others for your other questions.
>
>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
