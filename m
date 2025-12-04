Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B73CA3E43
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAF010E8F0;
	Thu,  4 Dec 2025 13:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NWPyuAOk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF92410E8F0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:49:49 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-297f5278e5cso2112885ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764856189; x=1765460989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wdWV4Re1SY9QcxnXCLkZ7LWipPGMDurlrb8DG6EXDxY=;
 b=NWPyuAOkp5XPlkaCDozQEPYe0cDAObqvbiGPN7bYIUUMlgVfaAI5QmzxuD9mWgvbcH
 Lst77eXipxlhTd6LrRxGxo8ipNNPgpSsCh144IoGSipngrwlvVTonCp2toh9avLbcwTh
 sz4Hl+Vu6uR7J7a7xjc1qoQBRWU1ssgHQPvEJ+/7suz1ARfB3x2mZYv/HNlYJVUBdxAc
 tL4oi38bEWhKYfjubIeAs/26mXAlPRz98cPLC9dS/MRYJzrMk3LyhrHX/MC6nFgJLBHA
 4FQjKuh0ZcHbGYBAddqrqz+ntSFV57HEsPxhXP5D26H5z5MmkmISJaTVkBuBbX/LKDlS
 FUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764856189; x=1765460989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wdWV4Re1SY9QcxnXCLkZ7LWipPGMDurlrb8DG6EXDxY=;
 b=NNvQkcuv+J1CKsmSfcUwEP52Sb87tilRvQai/sOfx/rfJgBhKUOWgj2y3TjmgBVDbp
 Aj8Ujpdgu7UhOnr1KrcmT1FppKA63tjwCveK31YiD4ri6ITxSWpaJ8+kYymRkGA1WbOn
 3TubMxZAwOHyYhtipK2oGMybcYDd239g06HDI06CURkSnXUoGKbRWyLtYLfHDPV8aZrf
 4JyIqiO04ipWGcocGpbh79yqqry1QlNCxKpth5ArZC10iHf/Urq6cLkMbsfqomRZXbvC
 UIWefs4GvmzdWHC1MkRqdvoU/xuzk4L0mYdTN3Ai/PDemfdaT2/5WZfBVFQ6M/5rWlcE
 +M/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUZV05nKu71plFUbpNPc7NBmeTpSIe+1Sh47QaJGaPaVB9y61IsQ/LHeTHJX5RUOPQd400xdZ7oUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKZ5Ex8Pt7doCjqI0F4TTRabF6GMHbRDlwXK7xa4Ba+En9cyjO
 6/+iQFc9pVhZK203RSO7OF4nQisp88O3PWhw4cUCoUVKnE83swN0ra7ycwmnGHqmqnXrqyi8hQO
 eM8AL7i/lPs6wo0bmuWnt3BwCJI1b6vXKPw==
X-Gm-Gg: ASbGncs2cmUaoLYM4uZCzR+88EauUxLcUNev7XGQRTyEG//x2Y8qlQ6m4uIYJFQG0m2
 2xuMFjh3/4qnxwDcl3lBvDVyBegrm4nOIn4zxZ2Rmwy3VajimzwXqZFNGhhNocgat6HJWdsIOhM
 8eY5KLNl/YDzK84X7yCLgKIj6Tg6AWObqckcBnDv0UnR/g1gYb8QnLOKJz9iN1N28p+wuxFXbCJ
 r+AoFgeRvTGaR1rkuIV4ETRoH4DQvGr16rZ0qJgNwGDRNiDcjU5uU6oUFsFyiMsQPq+ZIM=
X-Google-Smtp-Source: AGHT+IFxdki9GbCTOvuoSunYUO0o90gpKWKnFKiWPWhGOxLM/khL1a9ZDNJDAF4SDYPXDIwNrLL/4dLfW9fn272wzRU=
X-Received: by 2002:a05:7022:529:b0:11a:2020:ac85 with SMTP id
 a92af1059eb24-11df259c23bmr3838910c88.4.1764856189004; Thu, 04 Dec 2025
 05:49:49 -0800 (PST)
MIME-Version: 1.0
References: <20251204152403.256c135a@canb.auug.org.au>
In-Reply-To: <20251204152403.256c135a@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Dec 2025 08:49:36 -0500
X-Gm-Features: AWmQ_bn22CF2LvWBRjyDSbLcam9oWzWu7D1le52QCfU-h_TplQ3U2tgHYs2p0qM
Message-ID: <CADnq5_NfkTC0tST=VorQLM0RysNuaW9Hyb8EQS7gYUUecYXvVw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Wed, Dec 3, 2025 at 11:24=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig=
)
> failed like this:
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4026:13: erro=
r: redefinition of 'are_sinks_equal'
>  4026 | static bool are_sinks_equal(const struct dc_sink *sink1, const st=
ruct dc_sink *sink2)
>       |             ^~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3935:13: note=
: previous definition of 'are_sinks_equal' with type 'bool(const struct dc_=
sink *, const struct dc_sink *)' {aka '_Bool(const struct dc_sink *, const =
struct dc_sink *)'}
>  3935 | static bool are_sinks_equal(const struct dc_sink *sink1, const st=
ruct dc_sink *sink2)
>       |             ^~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4058:13: erro=
r: redefinition of 'hdmi_hpd_debounce_work'
>  4058 | static void hdmi_hpd_debounce_work(struct work_struct *work)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3967:13: note=
: previous definition of 'hdmi_hpd_debounce_work' with type 'void(struct wo=
rk_struct *)'
>  3967 | static void hdmi_hpd_debounce_work(struct work_struct *work)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3967:13: erro=
r: 'hdmi_hpd_debounce_work' defined but not used [-Werror=3Dunused-function=
]
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   c918e75e1ed9 ("drm/amd/display: Add an HPD filter for HDMI")
>
> merging badly with commit
>
>   c97da4785b3b ("drm/amd/display: Add an HPD filter for HDMI")
>
> from Linus' tree :-(
>
> I have applied the following merge fix patch for tosay.

The resolution is correct.

Thanks,

Alex

>
> From 1be223e7e9978a416cbdb835ea283da95abf7b58 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 4 Dec 2025 14:43:35 +1100
> Subject: [PATCH] fix up for duplicate commit "drm/amd/display: Add an HPD
>  filter for HDMI"
>
> merging badly
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 91 -------------------
>  1 file changed, 91 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 8b43d49dffcd..740711ac1037 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3949,97 +3949,6 @@ static bool are_sinks_equal(const struct dc_sink *=
sink1, const struct dc_sink *s
>  }
>
>
> -/**
> - * DOC: hdmi_hpd_debounce_work
> - *
> - * HDMI HPD debounce delay in milliseconds. When an HDMI display toggles=
 HPD
> - * (such as during power save transitions), this delay determines how lo=
ng to
> - * wait before processing the HPD event. This allows distinguishing betw=
een a
> - * physical unplug (>hdmi_hpd_debounce_delay)
> - * and a spontaneous RX HPD toggle (<hdmi_hpd_debounce_delay).
> - *
> - * If the toggle is less than this delay, the driver compares sink capab=
ilities
> - * and permits a hotplug event if they changed.
> - *
> - * The default value of 1500ms was chosen based on experimental testing =
with
> - * various monitors that exhibit spontaneous HPD toggling behavior.
> - */
> -static void hdmi_hpd_debounce_work(struct work_struct *work)
> -{
> -       struct amdgpu_dm_connector *aconnector =3D
> -               container_of(to_delayed_work(work), struct amdgpu_dm_conn=
ector,
> -                            hdmi_hpd_debounce_work);
> -       struct drm_connector *connector =3D &aconnector->base;
> -       struct drm_device *dev =3D connector->dev;
> -       struct amdgpu_device *adev =3D drm_to_adev(dev);
> -       struct dc *dc =3D aconnector->dc_link->ctx->dc;
> -       bool fake_reconnect =3D false;
> -       bool reallow_idle =3D false;
> -       bool ret =3D false;
> -       guard(mutex)(&aconnector->hpd_lock);
> -
> -       /* Re-detect the display */
> -       scoped_guard(mutex, &adev->dm.dc_lock) {
> -               if (dc->caps.ips_support && dc->ctx->dmub_srv->idle_allow=
ed) {
> -                       dc_allow_idle_optimizations(dc, false);
> -                       reallow_idle =3D true;
> -               }
> -               ret =3D dc_link_detect(aconnector->dc_link, DETECT_REASON=
_HPD);
> -       }
> -
> -       if (ret) {
> -               /* Apply workaround delay for certain panels */
> -               apply_delay_after_dpcd_poweroff(adev, aconnector->dc_sink=
);
> -               /* Compare sinks to determine if this was a spontaneous H=
PD toggle */
> -               if (are_sinks_equal(aconnector->dc_link->local_sink, acon=
nector->hdmi_prev_sink)) {
> -                       /*
> -                       * Sinks match - this was a spontaneous HDMI HPD t=
oggle.
> -                       */
> -                       drm_dbg_kms(dev, "HDMI HPD: Sink unchanged after =
debounce, internal re-enable\n");
> -                       fake_reconnect =3D true;
> -               }
> -
> -               /* Update connector state */
> -               amdgpu_dm_update_connector_after_detect(aconnector);
> -
> -               drm_modeset_lock_all(dev);
> -               dm_restore_drm_connector_state(dev, connector);
> -               drm_modeset_unlock_all(dev);
> -
> -               /* Only notify OS if sink actually changed */
> -               if (!fake_reconnect && aconnector->base.force =3D=3D DRM_=
FORCE_UNSPECIFIED)
> -                       drm_kms_helper_hotplug_event(dev);
> -       }
> -
> -       /* Release the cached sink reference */
> -       if (aconnector->hdmi_prev_sink) {
> -               dc_sink_release(aconnector->hdmi_prev_sink);
> -               aconnector->hdmi_prev_sink =3D NULL;
> -       }
> -
> -       scoped_guard(mutex, &adev->dm.dc_lock) {
> -               if (reallow_idle && dc->caps.ips_support)
> -                       dc_allow_idle_optimizations(dc, true);
> -       }
> -}
> -
> -static bool are_sinks_equal(const struct dc_sink *sink1, const struct dc=
_sink *sink2)
> -{
> -       if (!sink1 || !sink2)
> -               return false;
> -       if (sink1->sink_signal !=3D sink2->sink_signal)
> -               return false;
> -
> -       if (sink1->dc_edid.length !=3D sink2->dc_edid.length)
> -               return false;
> -
> -       if (memcmp(sink1->dc_edid.raw_edid, sink2->dc_edid.raw_edid,
> -                  sink1->dc_edid.length) !=3D 0)
> -               return false;
> -       return true;
> -}
> -
> -
>  /**
>   * DOC: hdmi_hpd_debounce_work
>   *
> --
> 2.52.0
>
> --
> Cheers,
> Stephen Rothwell
