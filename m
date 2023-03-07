Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C1E6ADB00
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 10:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BE110E27A;
	Tue,  7 Mar 2023 09:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93DA10E3C3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 09:53:07 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id s13so8423512uac.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 01:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678182787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3KQIAhdlXww65eUhy0j2w15z+KgD81bSw/EYAnBg8cI=;
 b=GqIUUxkGszWnMyOJ9v/BsV0SLfdciSErtv2GTbk1+4kZkly8MVF9kX6UN6NjIVjb32
 HKoSqSqoaG/6JON51LwZn+0Q0RhUULLXfVGKSoXK7kbasF/aigKMDSoXh/l9ADVNG9g3
 Vv3UPAnqRbJrkXBZry3fPmnF+a0p7piAnFTnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678182787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3KQIAhdlXww65eUhy0j2w15z+KgD81bSw/EYAnBg8cI=;
 b=UxXL6XBN4x3JlLiinJFsUyNls6dS5I4g2JC/78zIuVOrsU+79d5t1GTaKzFBsS7Sru
 Cxb7yZBr1t3cbd2KBbYONk5l3HORFpE/X9Le6QrDpp2btxR3X7OINE0Wh/PxWaGHeKIp
 AA6kbY9S0EGe167zo9VHE9WX7z/VaQr8EcZxz8jhnuo+R0Fg8CQxnG0U0qaBJ0ep6m7W
 W9yGr9VaqrplUbObnB1BTnEkC9DF+qODhZkmer/ubPk+j8Y8xVLd33B3uiyywG3fNsQ5
 PUVex6wbBKeZhIhqj0uh2rmTizNW6q6zu5/sP1KCEhu0HDZoVcoAZS1iRAfUSu0YBDWv
 dEqw==
X-Gm-Message-State: AO0yUKVCkAGb50LnB6z8qu0i5yZ9tnBkmVMAErVNnQyMYO5EdDnYwH6k
 3/q0I3cBC2JA0kocqnzk3HuZfUQK97BLK5w3KGvPrA==
X-Google-Smtp-Source: AK7set/+w8N6bIxRsr/VdjA+rzkO3mjOWFu0972MmNK+MtYl7ZKujQy20Hpt6L+Qt7IMdIula/6V0iHxgFoTKB6NZYQ=
X-Received: by 2002:ab0:544e:0:b0:68a:5c52:7f2b with SMTP id
 o14-20020ab0544e000000b0068a5c527f2bmr8829170uaa.1.1678182786803; Tue, 07 Mar
 2023 01:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-11-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:52:55 +0800
Message-ID: <CAGXv+5G=fm_R8yqkFGXN0999uZVTjSRW-gyM+1FCA+=TmZFt7w@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] drm/panfrost: Add new compatible for Mali on the
 MT8183 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The "mediatek,mt8183-mali" compatible uses platform data that calls for
> getting (and managing) two regulators ("mali" and "sram") but devfreq
> does not support this usecase, resulting in DVFS not working.
>
> Since a lot of MediaTek SoCs need to set the voltages for the GPU SRAM
> regulator in a specific relation to the GPU VCORE regulator, a MediaTek
> SoC specific driver was introduced to automatically satisfy, through
> coupling, these constraints: this means that there is at all no need to
> manage both regulators in panfrost but to otherwise just manage the main
> "mali" (-> gpu vcore) regulator instead.
>
> Keeping in mind that we cannot break the ABI, the most sensible route
> (avoiding hacks and uselessly overcomplicated code) to get a MT8183
> node with one power supply was to add a new "mediatek,mt8183b-mali"
> compatible, which effectively deprecates the former.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
