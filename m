Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5598556E2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 00:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965CF10E04D;
	Wed, 14 Feb 2024 23:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NfoHoEng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088E410E04D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 23:08:05 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-42c754ddbdbso1580321cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 15:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1707952083; x=1708556883;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=po6FB+Baujb9bEueLyWoU1S6jvmJIc+PouEW/zdHIJk=;
 b=NfoHoEngU8n4uEmR9DTIiZPkPj69FmCK779KkeUQuAd2OuClUXRJ6P/c3Zdz7Egc77
 BDQOsxrHQMCKfN+al0KMB49LQxNdPElZpsZptmRQCqM/bAcVyYIGnmVV6Zm9ZHjGoUrF
 fiqReXbIHI3L3/eifk6sSVaUR/VypNTYUZcyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707952083; x=1708556883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=po6FB+Baujb9bEueLyWoU1S6jvmJIc+PouEW/zdHIJk=;
 b=vEKWTBjDJteaYIUc8FMZcsc+zvnxQ8DLn+jH3+atafBLmkxFnNKdRnI3t7AQRC0S+K
 pGS3rx34xuhi2Ff8CQSxt5V6SOL4avC/2j4aKbCmfgsudQ2zc1AfG9oUrHs/K74pstGM
 foBBXJik1SCLBKBz7yg2vtP0hgrhJzVIhJHP/YrIDhV6wnDB2cub/G3pbey9msYhZvJ0
 hmwD7M8s3wYddB8/AIYaacX9dZwgWjZ0DDcCvP2BBIM27Zp6iHF3A2f7PwCpcyVYNJJH
 VRiwUz7absxWH4jknEBc8Q6VDJ9TC6h0aMH4ed0YowmGkbXMWKG+inSeOQOR57RuAZWY
 T6lw==
X-Gm-Message-State: AOJu0YwWb0zOxOQ4CnpB+aUrSHvvRPVNUvUyYszaMphmiMSuBjpAUUJf
 XjMia9NoJqxmCzD4XzdQgxKlLtotXeeZ8mszA+RB9ObwSfY0VvbAaCOF/zkwU6C5/FbUUqep+w2
 h8Igc
X-Google-Smtp-Source: AGHT+IHLFZVFL+Q7jxRC8r+PUYZq5XE6ZTTTU0uF/HIGNI0PlMBOphJrD76/WITP08Z54MSKKg+tGA==
X-Received: by 2002:ac8:7f94:0:b0:42c:14b7:b617 with SMTP id
 z20-20020ac87f94000000b0042c14b7b617mr308245qtj.3.1707952083599; 
 Wed, 14 Feb 2024 15:08:03 -0800 (PST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181]) by smtp.gmail.com with ESMTPSA id
 ic14-20020a05622a68ce00b0042c5a47df18sm11751qtb.55.2024.02.14.15.08.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 15:08:02 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-42c70247923so36141cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 15:08:02 -0800 (PST)
X-Received: by 2002:ac8:6207:0:b0:42d:c8b2:8dca with SMTP id
 ks7-20020ac86207000000b0042dc8b28dcamr118141qtb.4.1707952082055; Wed, 14 Feb
 2024 15:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
In-Reply-To: <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Feb 2024 15:07:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
Message-ID: <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
To: Hsin-Yi Wang <hsinyi@chromium.org>, Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, eizan@chromium.org, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Imre Deak <imre.deak@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Tue, Feb 13, 2024 at 10:25=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org>=
 wrote:
>
> On Wed, Feb 14, 2024 at 2:23=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > If an eDP panel is not powered on then any attempts to talk to it over
> > the DP AUX channel will timeout. Unfortunately these attempts may be
> > quite slow. Userspace can initiate these attempts either via a
> > /dev/drm_dp_auxN device or via the created i2c device.
> >
> > Making the DP AUX drivers timeout faster is a difficult proposition.
> > In theory we could just poll the panel's HPD line in the AUX transfer
> > function and immediately return an error there. However, this is
> > easier said than done. For one thing, there's no hard requirement to
> > hook the HPD line up for eDP panels and it's OK to just delay a fixed
> > amount. For another thing, the HPD line may not be fast to probe. On
> > parade-ps8640 we need to wait for the bridge chip's firmware to boot
> > before we can get the HPD line and this is a slow process.
> >
> > The fact that the transfers are taking so long to timeout is causing
> > real problems. The open source fwupd daemon sometimes scans DP busses
> > looking for devices whose firmware need updating. If it happens to
> > scan while a panel is turned off this scan can take a long time. The
> > fwupd daemon could try to be smarter and only scan when eDP panels are
> > turned on, but we can also improve the behavior in the kernel.
> >
> > Let's let eDP panels drivers specify that a panel is turned off and
> > then modify the common AUX transfer code not to attempt a transfer in
> > this case.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

Thanks for the review!

Given that this touches core DRM code and that I never got
confirmation that Jani's concerns were addressed with my previous
response, I'm still going to wait a little while before applying. I'm
on vacation for most of next week, but if there are no further replies
between now and then I'll plan to apply this to "drm-misc-next" the
week of Feb 26th. If someone else wants to apply this before I do then
I certainly won't object. Jani: if you feel this needs more discussion
or otherwise object to this patch landing then please yell. Likewise
if anyone else in the community wants to throw in their opinion, feel
free.

-Doug
