Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DBE4CFFA8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 14:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D6110F859;
	Mon,  7 Mar 2022 13:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB15410F859
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 13:09:45 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id l2so11299334ybe.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 05:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yepItlJ9qbYQk7lxa3ZiJXu15xaq36AuyzFPOK3vAVY=;
 b=AeUDdq/AWNd2nmTFTAWaAJ2SF2Vbyvv/+rKo46RmbS5jRVcFwjQ6vFH+O7bo/bjKe5
 pC6cp64tslJfdYfAUTd11w9i4XiJTUMRq97HJvLdXTY+EPvG9SEdthY6UZ2xKsBUEMBB
 gyDKihc4SgMxyZHwQVVs8qsMRewQwhiE6ZvjNB1ekCxcMCzJ2BIcUIdNfzfeE+lb7kFJ
 7ZUE5uusKonMkMdus5SXpoMl2koYoSUEDiw3fbc1rXKNqqovWetKdQgEd5N7dPiGaYCd
 MF9d+0HNsWyxtEfnEk7KS522ZgZ7dXgWSneMYVdPVApAweOFpWo6iEr4DXEsLnVTZrg7
 R7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yepItlJ9qbYQk7lxa3ZiJXu15xaq36AuyzFPOK3vAVY=;
 b=bx4bn/Q/NJMcWJIlXVwVdeRYONczcwbrVmUz+aBRz1TZdIO/fT8qUVeWF0ZeQqUsTW
 Ye22k8VSdqfJl9bth3Zq1aRoax0a+C2XKiuA73MDutq+DZb7R0azWfFyiiZ3Y+xNR5ez
 tDP5RCNpRtcQJbpD3Gf9o6e0wzY/vwCD01cLqpED7YWI7X+xQhwdKblJHAC2G6Jzz92X
 OSpz+uzsW9di2DxndFjc6RFFlS0fe4A5HiK/l8zAkq+rZk9s0bBaPUylN/sYTZQIIl2H
 DEtXGAaYzIwyoIspXn5pWYXDaYTSZP+zWrtfouseK7FCrdBhrMfjfCwacAEpIQtFN7Wj
 6PAA==
X-Gm-Message-State: AOAM530aag6oME+6KySiDoDWmYx48eQIo6VZj15+l/YKWU4pHz7ZFAS+
 g9xQXcRqiaUnUgpYpYe/01ozXbDWcwWWZybtQ5w4yg==
X-Google-Smtp-Source: ABdhPJy19ZfRbc1jCqoWnTYWtbGO16Ywu+DUbMK4m78jIaXZssJbqdhjy3kb9cJjfLA+Obyy/2vWB4gu/RRxGIBBSts=
X-Received: by 2002:a25:2bc5:0:b0:628:71cf:99c with SMTP id
 r188-20020a252bc5000000b0062871cf099cmr7771635ybr.553.1646658584984; Mon, 07
 Mar 2022 05:09:44 -0800 (PST)
MIME-Version: 1.0
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-23-s.hauer@pengutronix.de>
 <bb077f34-333e-a07a-1fcb-702a6807f941@rock-chips.com>
In-Reply-To: <bb077f34-333e-a07a-1fcb-702a6807f941@rock-chips.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 7 Mar 2022 13:09:33 +0000
Message-ID: <CAPj87rO2sztocJrE-CeSQWry9j_cSe2uv9F1Yf81pGnBXdu2Ag@mail.gmail.com>
Subject: Re: [PATCH v7 22/24] drm: rockchip: Add VOP2 driver
To: Andy Yan <andy.yan@rock-chips.com>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Mon, 7 Mar 2022 at 12:18, Andy Yan <andy.yan@rock-chips.com> wrote:
> On 2/25/22 15:51, Sascha Hauer wrote:
> > The VOP2 unit is found on Rockchip SoCs beginning with rk3566/rk3568.
> > It replaces the VOP unit found in the older Rockchip SoCs.
> >
> > This driver has been derived from the downstream Rockchip Kernel and
> > heavily modified:
> >
> > - All nonstandard DRM properties have been removed
> > - dropped struct vop2_plane_state and pass around less data between
> >    functions
> > - Dropped all DRM_FORMAT_* not known on upstream
> > - rework register access to get rid of excessively used macros
> > - Drop all waiting for framesyncs
> >
> > The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
> > board. Overlay support is tested with the modetest utility. AFBC support
> > on the cluster windows is tested with weston-simple-dmabuf-egl on
> > weston using the (yet to be upstreamed) panfrost driver support.
>
> When run a weston 10.0.0:
>
>   # export XDG_RUNTIME_DIR=/tmp
>   # weston --backend=drm-backend.so --use-pixma --tty=2
> --continue=without-input
>
> I got the following error:
>
> drm_atomic_check_only [PLANE:31:Smart0-win0] CRTC set but no FB

Can you please start Weston with --logger-scopes=log,drm-backend and
attach the output?

Cheers,
Daniel
