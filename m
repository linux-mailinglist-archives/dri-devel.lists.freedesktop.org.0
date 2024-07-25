Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CBF93BFE5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 12:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F6D10E5B7;
	Thu, 25 Jul 2024 10:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="op7IsPBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9551F10E5B7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 10:29:11 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6b7af49e815so5091936d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 03:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721903350; x=1722508150;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lqNON2XzzicgPcrb/MJYjLlf4KFN0gRBiFSG0lWMClg=;
 b=op7IsPBOi4Okbq7VrYrwcbc+tjusM2qCbJI5/m6bDheRIEXrm0lIEX9LlLIJ8WNkO/
 lEkDumvg9VGeWksoBt21/cv1DJDP1ejyQml+UoeXsvJLP2/amllB5unpLP2Izn0Y3Ef2
 oROq/qXta4I+WBkzbMTIKAO8+hhBWYVS78i3ZqGvmolcXIgE82idnkinplfIIndsyO6I
 Vi/YSwmWV+od0ZXhN/DeZ+fDD85Gblrp1tDFIsdqvKwHnLRjQKx90JOp/KiA8c5aPMhP
 U7fyDdla1EKwAx66fddpYzodK/mNSuuDKNX40/awSk4gehGlwILM11/jnieJjjLkRfQB
 xnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721903350; x=1722508150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lqNON2XzzicgPcrb/MJYjLlf4KFN0gRBiFSG0lWMClg=;
 b=eoBCMLutAY62tvNk4ilPLr1FpAyID5LJJukbazFkgoAPzMmRNXdgrvhAQ+KvFekII0
 XF+f2MkTr23ZAQPodIQetXWvuBqMXUuQdWHWKE9EdZ5Xzwe1uaeeWZT18PCkBHJtKwTt
 7p1bSkjpp3MRvTWfboaD88ijHYnaJttIk9ryEc2WOXfvvUsMLpc5gRrcUkbrYc1Oyo4n
 F0kOymyIodl/Z+Vv44yoYmNh5DAFTtytw42L909Ig6rUnuitORBjznp2BcuO9Wif5GyO
 fUh3uIly9NBL+bRx95Z7XSU9hpNTa1Lm2xITp6mVH9a4dNSWk6kZZ1WnxEaWJesqshiU
 lytw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMXNHcmpOvijYWmIoHX8LKSwzVzjSes3E/llrV+RSktQcfp3kv/b46patuQOyiAisVb4bgW/w83nPsOsv3Tiidq0mQxlqsSvCQubaJlhh8
X-Gm-Message-State: AOJu0Yzbp3Jo8yG6Wvlzp8a6Qjf5SySvyOLxsWjvr7NRsRJyuMMq8Xig
 12DPVHrmzDfVY1e3LfeL14f23IHbIGe/wK+VKvcpxM8elnniu7mVVpsCocCW29XGrk/fadMHLak
 xxQ+VRhMtIhHDS60oTzfulv6SGdbJ3BQWBqTyfg==
X-Google-Smtp-Source: AGHT+IH58fYzPz2za1A4wbM/RxniQBXqyWW1aq5VxWvoCjFUwdMxzQTEFxAC6/D8edl0M5w58o3zWa9AamOI0NUg0xw=
X-Received: by 2002:a05:6214:230c:b0:6b5:a4f6:daa2 with SMTP id
 6a1803df08f44-6bb406fcd47mr14595366d6.17.1721903350287; Thu, 25 Jul 2024
 03:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <TkgKVivuaLFLILPY-n3iZo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=@proton.me>
In-Reply-To: <TkgKVivuaLFLILPY-n3iZo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=@proton.me>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 25 Jul 2024 11:28:58 +0100
Message-ID: <CAPj87rPwJ-vRTsjM1rWRj1gyjbJM_ryrkTiPRBF3ZF1D7TVDYw@mail.gmail.com>
Subject: Re: [PATCH v3] rockchip/drm: vop2: add support for gamma LUT
To: Piotr Zalewski <pZ010001011111@proton.me>
Cc: "airlied@gmail.com" <airlied@gmail.com>,
 "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "heiko@sntech.de" <heiko@sntech.de>, 
 "hjc@rock-chips.com" <hjc@rock-chips.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Piotr,

On Wed, 24 Jul 2024 at 23:06, Piotr Zalewski <pZ010001011111@proton.me> wrote:
> Add support for gamma LUT in VOP2 driver. The implementation is based on
> the one found in VOP driver and modified to be compatible with VOP2. Blue
> and red channels in gamma LUT register write were swapped with respect to
> how gamma LUT values are written in VOP. Write of the current video port id
> to VOP2_SYS_LUT_PORT_SEL register was added before the write of DSP_LUT_EN
> bit. Gamma size is set and drm color management is enabled for each video
> port's CRTC except ones which have no associated device. Tested on RK3566
> (Pinetab2).

Thanks a lot for doing this!

> +static void vop2_crtc_gamma_set(struct vop2 *vop2, struct drm_crtc *crtc,
> +                               struct drm_crtc_state *old_state)
> +{
> +       [...]
> +
> +       vop2_lock(vop2);
> +       vop2_crtc_write_gamma_lut(vop2, crtc);
> +       vop2_writel(vp->vop2, RK3568_LUT_PORT_SEL, vp->id);
> +
> +       vop2_vp_dsp_lut_enable(vp);
> +
> +       vop2_cfg_done(vp);
> +       vop2_unlock(vop2);
> +}
>
> @@ -2060,6 +2159,9 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>         drm_crtc_vblank_on(crtc);
>
>         vop2_unlock(vop2);
> +
> +       if (crtc->state->gamma_lut)
> +               vop2_crtc_gamma_set(vop2, crtc, old_state);
>  }

In the atomic_enable callback, we are already holding the VOP lock,
and waiting to set cfg_done etc - we then do it all over again here.
This should all be atomic, so that we configure the LUT whilst doing
the setup, and then only call cfg_done once, to avoid showing the user
intermediate states which only later converge on the desired final
state.

Cheers,
Daniel
