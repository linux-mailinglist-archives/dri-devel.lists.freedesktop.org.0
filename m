Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7557ADD8C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 19:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE0D10E169;
	Mon, 25 Sep 2023 17:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF2A10E169
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 17:04:46 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5333fb34be3so7916549a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695661484; x=1696266284;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kX39Ca8A6vbWsrSc61cEoyakqRV/gh0/WoLN88Nm/E=;
 b=To/MYjlXTptI2ndQseybWL9Db/MtaZDpwSsMrNbMuN1aQxV8kbyIhdQ+RRGObBSXX+
 9JZw07KJdNyMRc/gWg3Fd9siPQSKaIBo+cHAb0frU5DUWbrLoi+Q8pi4vYTnnQ4xOvjv
 uLsrJ1s3dBI33sXwegCQ2ymUOYYitqVN43aN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695661484; x=1696266284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kX39Ca8A6vbWsrSc61cEoyakqRV/gh0/WoLN88Nm/E=;
 b=bzoQlcVoS1FQz1gI00E5r/vRg8YHZU3ZkmxDY8TRcSoe96qGtwUkZp2D/3MnYdkdZ5
 BEvlBAF+WxXhUTpyeEFbQfpyoslcLgQx2TTti/ZJjteIbdQbMM89JIyyuO+dqgUJEAbc
 tKzw020ZYn7HEnWt2wO1p7Ewl489Ld7Qutom8BZn+6z+/VdeVhzX/JmHXlqjBPynvzVs
 Ju6aEZd3/6RE6fy+9IDq5ekpO6iabkutaIdUqTQtwTg4H725R3P5HkjiyvEWd8LsBmji
 4/qjOY3mnN1jB+8ujoSbA7TFxHj75OGy0T+Wf2S+RkX/3AMpShLAoAD5uVTMwLEuBsbD
 UTLg==
X-Gm-Message-State: AOJu0Yx6tUH4w6yMeZ7/qyL5l8xPUU1Ao9WkdjopmhGUv3K7YrUXREaY
 7XMkOoOcqopkeN35JhKKz8NQ0dKlPD+v9ELW7I5pXAeq
X-Google-Smtp-Source: AGHT+IGYHmXIcctvf/PqdVlbhE7aa0asrlg5ce8sURxfk3IJNxZ5eiErhdljpV5I0u+iIX5ti9DcVQ==
X-Received: by 2002:a17:907:7759:b0:9a5:d16b:6631 with SMTP id
 kx25-20020a170907775900b009a5d16b6631mr6233338ejc.70.1695661484169; 
 Mon, 25 Sep 2023 10:04:44 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 zg22-20020a170907249600b009a5f1d15642sm6546229ejb.158.2023.09.25.10.04.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 10:04:43 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so879a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:04:43 -0700 (PDT)
X-Received: by 2002:a50:a699:0:b0:525:573c:6444 with SMTP id
 e25-20020a50a699000000b00525573c6444mr6897edc.1.1695661483259; Mon, 25 Sep
 2023 10:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.7.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
 <BL1PR12MB514407EE7F9B23BC58E40A6CF7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB514407EE7F9B23BC58E40A6CF7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Sep 2023 10:04:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UK_tWO7Vr2FJiaVX11DwfS7+VhrUoGZa989U7y_vtKOg@mail.gmail.com>
Message-ID: <CAD=FV=UK_tWO7Vr2FJiaVX11DwfS7+VhrUoGZa989U7y_vtKOg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 07/12] drm/amdgpu: Call drm_atomic_helper_shutdown()
 at shutdown time
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
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
Cc: "Zhao, Victor" <Victor.Zhao@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "SHANMUGAM,
 SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>, "Zhang,
 Bokun" <Bokun.Zhang@amd.com>, Maxime Ripard <mripard@kernel.org>, "Ma,
 Le" <Le.Ma@amd.com>, "Zhang, Morris" <Shiwu.Zhang@amd.com>, "Zhu,
 James" <James.Zhu@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 25, 2023 at 8:57=E2=80=AFAM Deucher, Alexander
<Alexander.Deucher@amd.com> wrote:
>
> [Public]
>
> > -----Original Message-----
> > From: Douglas Anderson <dianders@chromium.org>
> > Sent: Thursday, September 21, 2023 3:27 PM
> > To: dri-devel@lists.freedesktop.org; Maxime Ripard <mripard@kernel.org>
> > Cc: Douglas Anderson <dianders@chromium.org>; Zhang, Bokun
> > <Bokun.Zhang@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>;
> > Zhu, James <James.Zhu@amd.com>; Zhao, Victor <Victor.Zhao@amd.com>;
> > Pan, Xinhui <Xinhui.Pan@amd.com>; airlied@gmail.com; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; amd-gfx@lists.freedesktop.org; Koenig,
> > Christian <Christian.Koenig@amd.com>; daniel@ffwll.ch; Kuehling, Felix
> > <Felix.Kuehling@amd.com>; jim.cromie@gmail.com; Ma, Le
> > <Le.Ma@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>; linux-
> > kernel@vger.kernel.org; maarten.lankhorst@linux.intel.com; Limonciello,
> > Mario <Mario.Limonciello@amd.com>; mdaenzer@redhat.com; Zhang,
> > Morris <Shiwu.Zhang@amd.com>; SHANMUGAM, SRINIVASAN
> > <SRINIVASAN.SHANMUGAM@amd.com>; tzimmermann@suse.de
> > Subject: [RFT PATCH v2 07/12] drm/amdgpu: Call
> > drm_atomic_helper_shutdown() at shutdown time
> >
> > Based on grepping through the source code this driver appears to be mis=
sing a
> > call to drm_atomic_helper_shutdown() at system shutdown time. Among
> > other things, this means that if a panel is in use that it won't be cle=
anly
> > powered off at system shutdown time.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case o=
f OS
> > shutdown/restart comes straight out of the kernel doc "driver instance
> > overview" in drm_drv.c.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This commit is only compile-time tested.
> >
> > ...and further, I'd say that this patch is more of a plea for help than=
 a patch I
> > think is actually right. I'm _fairly_ certain that drm/amdgpu needs thi=
s call at
> > shutdown time but the logic is a bit hard for me to follow. I'd appreci=
ate if
> > anyone who actually knows what this should look like could illuminate m=
e, or
> > perhaps even just post a patch themselves!
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  2 ++
> >  3 files changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > index 8f2255b3a38a..cfcff0b37466 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -1104,6 +1104,7 @@ static inline struct amdgpu_device
> > *amdgpu_ttm_adev(struct ttm_device *bdev)  int amdgpu_device_init(struc=
t
> > amdgpu_device *adev,
> >                      uint32_t flags);
> >  void amdgpu_device_fini_hw(struct amdgpu_device *adev);
> > +void amdgpu_device_shutdown_hw(struct amdgpu_device *adev);
> >  void amdgpu_device_fini_sw(struct amdgpu_device *adev);
> >
> >  int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev); diff --git
> > a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index a2cdde0ca0a7..fa5925c2092d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -4247,6 +4247,16 @@ void amdgpu_device_fini_hw(struct
> > amdgpu_device *adev)
> >
> >  }
> >
> > +void amdgpu_device_shutdown_hw(struct amdgpu_device *adev) {
>
> This needs a better name since its only for displays.  Also maybe move it=
 into amdgpu_display.c since it's really about turning off the displays.  T=
hat said is this really even needed?  The driver already calls its suspend =
functionality to turn off all of the hardware and put it into a quiescent s=
tate before shutdown.  Basically shares the same code we use for suspend.

As per my comment above, for this driver, my patch was a "plea for
help". I have no idea if it's really needed or if suspend handles it.

My main concerns are:

a) If it's possible that someone out there is using this DRM driver
with a "drm_panel" then we need to make sure the panel gets disabled /
unprepared properly at shutdown time. The goal is to remove the
special logic in some panel drivers that disables the panel at
shutdown time. The guidance I got from Maxime is that we should be
relying on the DRM driver to disable panels at shutdown time and not
have extra per-panel code for it.

b) It is documented that DRM driers call drm_atomic_helper_shutdown()
at shutdown time. Even if things are working today, it's always
possible that something will change later and break for drivers that
aren't doing this.


If you're confident that everything is great for the "amdgpu" driver
then I'm happy to drop this patch and not consider it a blocker for
the eventual removal of the code in the individual panels drivers.

If, after reading this, you conclude that some sort of patch is
needed, I'd love it if you could test/post a patch yourself and then
I'll drop this patch from my series.


-Doug
