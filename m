Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593389A18E9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 04:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EFF10E2F4;
	Thu, 17 Oct 2024 02:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aVvbex39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428A510E789
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 02:44:38 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-71811c7eb8dso30057a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 19:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729133077; x=1729737877;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RwYwae4eVmxbO+jRttifpBwyvivJOJJxb/xLoxHTZfo=;
 b=aVvbex39iY+wJsTyxU4IxeQ8DYHqUbPyPGS/+vI9q7R599BJD1Gp8+i+UBkc2uNdhf
 tW5dkNI48S754ZjJ1WADWqK+h52GYsLKCkT8tmwIRR8noQQV6eCYoUOceNzk06lLjr1u
 9bVZyyKj20Bw42/e2StTtZSdIaYiNwZHiIZNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729133077; x=1729737877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RwYwae4eVmxbO+jRttifpBwyvivJOJJxb/xLoxHTZfo=;
 b=uaN2cNQp+/876SjAQN4j/jlOTlTPkXatjJsBBCj3MSN9pHhohYjvdveMymeVJ47pEQ
 yhpQUVHp42g0HVfXT8Wh65jiwMSdjmXSaWxHDMBMG8Qwo3Py7LUie9baDEsTGYIvbs0T
 ABI4OiIAgy9RcGIMg+nuzwTlB/cCB3nWd9wi//K4B5o1tsT2INbWzvRLV6VEFW/ZY/9b
 u6bjOWFnSmzp7jppN6+o3RQTFC6IDmgNfEfOURR01lMTmqBcEZiWFYFtQWA2cDhdmQFO
 rWRz2eaTibPAkn0sokikkDY50DtJjku2kUKyYIozv2eF1rfLrnov6UbJjWwMyDiq84Iy
 3uLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULCgMdKYolCYZMLNrOuJiN5e1CswoKhZJvVRKFduNMhfGjIeCG1Rd9jn3ysx3zN/KkFb/G5wZjEIo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBPqLX7iSPkrJS9Fv0cVYVWN56eyBrchSN6QDi1Vi5kPre6/2o
 QyqmVkMEyzoooWaI92icTGOl38EmJXaTaOKP1QijjY2Eas+l6sIoqNwMBfH9yjCD7EGI1dEJOGF
 d86sM2kYdvS8pwIAzJ9INZCqPBfsS0JELun13
X-Google-Smtp-Source: AGHT+IGjczde+ebuHiDXzv6UCnqtFQA/Z8nWKnV/BFtbt9cOdjCEKrw1EBoPGYwzd69OlvZC94Ly2WvETikDL9e3/rI=
X-Received: by 2002:a05:6830:8008:b0:717:f707:cb92 with SMTP id
 46e09a7af769-717f707ccf7mr6937439a34.28.1729133077325; Wed, 16 Oct 2024
 19:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
 <CAEXTbpfSJJF7W6ga9R5ns5naHgK0r=smCierau5fbLAztkjVwA@mail.gmail.com>
 <7713a68327a849a5b83f6acd0661bfff@ite.com.tw>
In-Reply-To: <7713a68327a849a5b83f6acd0661bfff@ite.com.tw>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 16 Oct 2024 22:44:26 -0400
Message-ID: <CAEXTbpf-oyc2UYHmnHp4qLPm7r2D5O0R4Ya4mAnDRSoOt5KGrA@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] drm/bridge: it6505: fix HDCP CTS fail items and
 add MCCS support
To: Hermes.Wu@ite.com.tw
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, angelogioacchino.delregno@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kenneth.Hung@ite.com.tw, Pet.Weng@ite.com.tw
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

Hi,

On Wed, Oct 16, 2024 at 10:10=E2=80=AFPM <Hermes.Wu@ite.com.tw> wrote:
>
> >
> >
> >-----Original Message-----
> >From: Pin-yen Lin <treapking@chromium.org>
> >Sent: Thursday, October 17, 2024 5:52 AM
> >To: Hermes Wu (=E5=90=B3=E4=BD=B3=E5=AE=8F) <Hermes.Wu@ite.com.tw>
> >Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstr=
ong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart <Laurent.=
pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec=
 <jernej.skrabec@gmail.com>; Maarten Lankhorst <maarten.lankhorst@linux.int=
el.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann=
@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch=
>; AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>; dr=
i-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Kenneth Hung (=
=E6=B4=AA=E5=AE=B6=E5=80=AB) <Kenneth.Hung@ite.com.tw>; Pet Weng (=E7=BF=81=
=E7=8E=89=E8=8A=AC) <Pet.Weng@ite.com.tw>
> >Subject: Re: [PATCH v6 00/10] drm/bridge: it6505: fix HDCP CTS fail item=
s and add MCCS support
> >
> >Hi Hermes,
> >
> >On Wed, Oct 16, 2024 at 3:54=E2=80=AFAM Hermes Wu via B4 Relay <devnull+=
Hermes.wu.ite.com.tw@kernel.org> wrote:
> >>
> >> This is a v6 patch-set.
> >>
> >> There are lots of failure items while running HDCP CTS using UNIGRAF D=
PR-100.
> >> In Order to fix those failures, HDCP flow needs to be changed.
> >>
> >> The DisplayPort AUX protocol supports I2C transport.
> >> In Order to support MCCS via the aux channel, the aux-i2c operation is=
 added.
> >>
> >> v5->v6:
> >>         -keep the commit message wrapped at 72-75 chars.
> >>         -[10/10] fix return variable being used without being
> >> initialized
> >>
> >> v4->v5:
> >>         -add more messages for changes.
> >>         -[2/10] modified AUX transfer data size judgment.
> >>                 change for-loop to do-while.
> >>         -[7/10] change for-loop to do-while.
> >>         -[9/10] change wait timer with timer_after()
> >>
> >>         links:
> >>         https://urldefense.com/v3/__https://lore.kernel.org/all/202409=
26074755.22176-4-Hermes.Wu@ite.com.tw/__;!!HtnLE8A!H06km5WNa8VgoR25MvWuNAGY=
uJGScCXQx0tQwni_NPHKwOqT4hNpaCrFZPPMVKeqBXXHTRoGj1C2pZazumE8vA$
> >>
> >> https://urldefense.com/v3/__https://lore.kernel.org/all/20240926075134
> >> .22394-1-Hermes.Wu@ite.com.tw/__;!!HtnLE8A!H06km5WNa8VgoR25MvWuNAGYuJG
> >> ScCXQx0tQwni_NPHKwOqT4hNpaCrFZPPMVKeqBXXHTRoGj1C2pZb7YFr4mw$
> >>
> >> v3->v4:
> >>         -split changes  into patches.
> >>
> >> v2->v3:
> >>         -split aux read  KSV function to a patch.
> >>         -[1/3] new in v3
> >>         -[2/3] add description of patch
> >>
> >> v1->v2:
> >>         - ignored.
> >>
> >> Hermes Wu (10):
> >>   drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
> >>   drm/bridge: it6505: improve AUX operation for edid read
> >>   drm/bridge: it6505: add AUX operation for HDCP KSV list read
> >>   drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
> >>   drm/bridge: it6505: fix HDCP Bstatus check
> >>   drm/bridge: it6505: fix HDCP encryption when R0 ready
> >>   drm/bridge: it6505: fix HDCP CTS KSV list read with UNIGRAF DPR-100.
> >>   drm/bridge: it6505: fix HDCP CTS compare V matching
> >>   drm/bridge: it6505: fix HDCP CTS KSV list wait timer
> >>   drm/bridge: it6505: add I2C functionality on AUX
> >>
> >> Change-Id: Iad0c056d72abf2655081357cf40c3b0d3df916b5
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >> Hermes Wu (10):
> >>       drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
> >>       drm/bridge: it6505: improve AUX operation for edid read
> >>       drm/bridge: it6505: add AUX operation for HDCP KSV list read
> >>       drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
> >>       drm/bridge: it6505: fix HDCP Bstatus check
> >>       drm/bridge: it6505: fix HDCP encryption when R0 ready
> >>       drm/bridge: it6505: fix HDCP CTS KSV list read with UNIGRAF DPR-=
100.
> >>       drm/bridge: it6505: fix HDCP CTS compare V matching
> >>       drm/bridge: it6505: fix HDCP CTS KSV list wait timer
> >>       drm/bridge: it6505: add I2C functionality on AUX
> >>
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 334
> >> ++++++++++++++++++++++++++++++------
> >>  1 file changed, 277 insertions(+), 57 deletions(-)
> >> ---
> >> base-commit: b8128f7815ff135f0333c1b46dcdf1543c41b860
> >> change-id: 20241015-upstream-v6-9f4b015fecf7
> >>
> >> Best regards,
> >> --
> >> Hermes Wu <Hermes.wu@ite.com.tw>
> >>
> >>
> >
> >I'm not sure if this requires a re-spin, but you are supposed to collect=
 the reviewed-by tags you received when you send out a new version. i.e., p=
ut the "Reviewed-by:" lines you received before your "Signed-off-by:" line.
>
> only cover-letter or all patches? need "RESEND" for same v6 patch header?

You should add the review tags to the individual patches that have not
changed since the previous review. For this series, I think you can
wait a few days and collect feedbacks from the community first.
>
> >Regards,
> >Pin-yen
>
>
>
> BR,
> Hermes

Pin-yen
