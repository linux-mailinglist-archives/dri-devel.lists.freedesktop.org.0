Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB3754786E
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 06:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC5B10F15C;
	Sun, 12 Jun 2022 04:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39CF10F15C;
 Sun, 12 Jun 2022 04:03:13 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m20so5064807ejj.10;
 Sat, 11 Jun 2022 21:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pbFRE+VCdz/Mvat4l03Ru/M9ljAjH7/8wgRe5uPLKmA=;
 b=JylIYtTShS/QVxxbVK6KZgGdN2BZID9npboqy/8nxih8wIBzeXClsDxln2BxALdDKo
 s/rdJm9lAJOmYNN48gAD4YprUguICzlGaD2n5L+7N8UDtwFkb10xOgcJROs17fds/p0C
 djKJtLrvwes1nNTxMct5KgVOoJHnvlGqfRffcNGB3xI2tq12ydBIJQHokfeodlOA/OOS
 dYL3kFDEUOlRW3hG09rOFTU1ut9Ig2Vy409NhFVaCYhKZGXtR2Br5lyBBBhkA4Dy49q6
 TzI1y3h5cFKs45EFz7cIirMCXSqmb9Tt9rLTkz+gaZA4p2T4AjtpmqQTeePPu2QxhL0S
 e16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pbFRE+VCdz/Mvat4l03Ru/M9ljAjH7/8wgRe5uPLKmA=;
 b=v6DNPkF5Z5Qvj1Ah0qsqTkOYp3tGCDndZ2q0tzc/ZGPY53TGNWXBeEsutLFHiQrE64
 Cl34CRdq+bOdWE/o0iIhACXK7l2FcLyLr6xR2zXgrRWTlhLeKrBVOk6DRodjGgjo0F5W
 KN9MasApX6s2K/wWNyZWNYPZs4w1Goiu5VEpPEmnSryaRPpG0na0hzdDJYWVfdUHT+4/
 6+gi9gAysyoeufKrnImrjkaA/Wc5fz2Qi7r6hixLXSa8NyCJqJnL8wvDw4Gm9x5e2FU/
 +mgXB5Frq8EoBiHKiti/4Z8mHz8yGncWvwhGwdCqmgmATJqws44dDC1lQTk/Uv8IJoeU
 txUw==
X-Gm-Message-State: AOAM533UrILOQjCHfG2aEfMNVQ311JSqc6v1jPiqCm55szctDpnLFJVL
 rRSp6k6LfaHZR0gL6yAGtUsKpx4Wy0nIGtBWavc=
X-Google-Smtp-Source: ABdhPJy9n/qDVUSTdlF1vXGTql2S/bTRtKA5PHOMP6KIlAgDuGmiLNoP/0JDATNBnLXZHa3pJmlXULj0phEuLoDftkE=
X-Received: by 2002:a17:907:1c19:b0:711:e5f9:2ec7 with SMTP id
 nc25-20020a1709071c1900b00711e5f92ec7mr23267565ejc.518.1655006591088; Sat, 11
 Jun 2022 21:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220529180428.2577832-1-robdclark@gmail.com>
In-Reply-To: <20220529180428.2577832-1-robdclark@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sat, 11 Jun 2022 21:02:59 -0700
Message-ID: <CAPaKu7QDoZiPRDAptk7+cfv3Da+oXU7f0f4m6LQiwfzd=x=TuA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: Allow larger address space size
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Connor Abbott <cwabbott0@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 29, 2022 at 11:04 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The restriction to 4G was strictly to work around 64b math bug in some
> versions of SQE firmware.  This appears to be fixed in a650+ SQE fw, so
> allow a larger address space size on these devices.
>
> Also, add a modparam override for debugging and igt.
>
> v2: Send the right version of the patch (ie. the one that actually
>     compiles)
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
