Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859966ADB15
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 10:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80A910E3C5;
	Tue,  7 Mar 2023 09:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FCB10E3C5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 09:54:11 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id by13so11798232vsb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 01:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678182850;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVaK5fa/4HYATIX0W7bJf4mZCzOtRFjIhnuFvVhvfeU=;
 b=Dl6wcGCiDkifqDwLsKfdUBlG3DuYQB56oycul9KEjs6Iszio/Yz5p1mDGhWQLucvtU
 h6fVddwe5sMWsgC/St49FnnZmOYUMLgFX+Yi2T/+TI4/xtlfn41+d2Lge3uOZqT6EMqs
 aH6wpLE2W9Hw7LTc82Zv3/s+vGzj3ipPp0I9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678182850;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vVaK5fa/4HYATIX0W7bJf4mZCzOtRFjIhnuFvVhvfeU=;
 b=qGt/p13XKxup3QD6eFqPD52AD9JfGXawoW4kt6IDinSGFrzSUmv8w12Cpp/rZlHOAM
 NqWeiG3OLa3t0xtgalQjd8Z1naY00Khm2xrjO/SzAMOdiOgBgZNPYqup4LTp99f4E2Dx
 10oUY7hUFvbQMKgng6Woi/n5SqkBWmR02uf3vxIbFeNYD+i7nGWYqR2jPw6nfku28nI9
 0jHLVhi9gZIdMZ4lgniT/x8ORGx3TCeJB1Zk3gPJCa6ndOErSwYl+ikmVywyVUAZaQkI
 ATDRyqv4Y4ccqVOOHAjMz1PUYNsyAAsUBedn1EW+s1V6k+YoT7dqrcNNvHg51kyymxjH
 RmMA==
X-Gm-Message-State: AO0yUKUizMvQZwAW8ulJHbHdh67w68Oiw0Xn9MTeJK308ExCViMnOj2y
 g/JdbOSTLBk0SL0kF3OgOMSm4vYymZvCOt+L9FdmKQ==
X-Google-Smtp-Source: AK7set+M+YbqM/phaVs9YXbp6uwuxjHLfZOSgI3fcVyoRwVBzUTftmT1tmU6GP/gFzeZL546fwapyRfVwBFvBG+dKU0=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr9257239vsk.3.1678182850374; Tue, 07 Mar
 2023 01:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:53:59 +0800
Message-ID: <CAGXv+5GfT92mGRetF_m2BSyCbx6zArrhwBYV3U=JcMDEN0P9cw@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] drm/panfrost: Increase MAX_PM_DOMAINS to 5
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
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Increase the MAX_PM_DOMAINS constant from 3 to 5, to support the
> extra power domains required by the Mali-G57 on the MT8192.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
