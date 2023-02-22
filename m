Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D264C69EDFE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 05:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5443F10E1A9;
	Wed, 22 Feb 2023 04:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9343810E1A9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 04:38:48 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id f17so2087222uax.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 20:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SjnhtH64eML55ISxgIP0mbjGK87d9wufZ0dMxupwBB8=;
 b=lqrWBFFqj06m2wFc1tGmWC/sZDK+C19hDP4UIu5cVpbUtFfwJOsq8t6KqUwp+puZTM
 xlxcOhBFLwnQEXS/+AJA6bzHgUSP7bhC3Epgdd6YRaOAUCpXfcYDN21kgpjtnuydVfTS
 xmjsDddgoEcBvU3bv1C7mLsikIeNWew45cDD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SjnhtH64eML55ISxgIP0mbjGK87d9wufZ0dMxupwBB8=;
 b=rDI+XzaFSYEtCBOV5POPp8uStfWvSBZlX8qpGpAsZuWdzmuReagdbYLGguKmG9zRtH
 6/Euqkqn4Qj8K8ByWWzXTxC8OT5gLplEj8xNyU2PV3/zRdCBhMcSE3vmCAJNcUe92HLG
 FsQ8RNqds7E2fskS5BUVoRSVrT1e0dGblnjhjqRTk99OkOu22Z0uruLXqRP14p5pa099
 6vC10hNVZEog0i2FyZbJBSD7fAZelGHoSaZxnlRMGZmEy/2ASBjButoWJzPLKnOu4g+C
 cTpu6BNmJllsC12TIH/u+Taa8a2VSwlSAbygfG8kgPjV6QCqif3Q3OVeaxa74lQ5+8yw
 U/lQ==
X-Gm-Message-State: AO0yUKWZSRCTOt5KMF+4WAmk4IWT0CXE8nbTJxwvc+mWoswgeOHFS0f1
 T3pgdqkY1sJCyuVrKASVqkx8rKKfmQDrgOXUsxYO2A==
X-Google-Smtp-Source: AK7set83ZvblSYZh7JNvc7QCFEKUZbLt9LcnNtZrdB1tyX1tEXVX1rHD9xKFOJ5X0MZjFwaqGFlydH4WbQIiF5KY8zE=
X-Received: by 2002:a1f:208d:0:b0:3e8:66ce:a639 with SMTP id
 g135-20020a1f208d000000b003e866cea639mr1238225vkg.2.1677040727547; Tue, 21
 Feb 2023 20:38:47 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 12:38:36 +0800
Message-ID: <CAGXv+5FuKJ7ce_tPeOt_+yPw+hZwiiePRHp+QsWBm-sf7UD4Dw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] drm/panfrost: Increase MAX_PM_DOMAINS to 5
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Increase the MAX_PM_DOMAINS constant from 3 to 5, to support the
> extra power domains required by the Mali-G57 on the MT8192.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
