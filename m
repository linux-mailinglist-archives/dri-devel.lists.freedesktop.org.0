Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268136ADBD4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D435610E3D7;
	Tue,  7 Mar 2023 10:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1C710E3D7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 10:26:46 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id d7so11881843vsj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 02:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678184806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAifdSfv0qu9/9RmW88ObONMsIk5lXQf5X6sr56a9BE=;
 b=HJP2dq5eXMi9C5VywdM47zJbV2wVa0N9nsZp/eflBdCu8ikIWZJM5r3y3UGBH1Dlgg
 ovaGRHIAavdwMr2Qq7xZieDNL2aXPJBNp1mqtE5DwSN4Gt7Tu1IBjw7nTVEj8ylkFhJI
 G3qzV/86brm1FEBBhZbPlFtVo43BQKrW+Gx+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAifdSfv0qu9/9RmW88ObONMsIk5lXQf5X6sr56a9BE=;
 b=NE3ykHbK5RwaR4KLQPcvD89lgDpOueV2SRICtUBpnKaVsFk8XNTFUzjH0pdqdPuVnR
 BfEeCFZfN3itcVYJ9LiAYoa/bgAU+AR1yHJi2kMn9Ahn8ewUmtQllKAaPoszEKySms+h
 +7T6FJbrSz82T0bLdgf7Je3oGe3H+z6/v/uhQrJ+Nx1KTnAc40s9DetMQqw4Py/I3agD
 NdGvcAlAwdtTPfGnhfY+VWPgpU8ELzEG+OWH9MSYSp7h5ABdOJQByWzoL41l7reYTxPR
 KVq9s96jqpONoThhkWONlrUu8Q1WUlMXmyPFaRIPotmyjtW//H2sj+DuoKykIq7dFV7D
 U1OA==
X-Gm-Message-State: AO0yUKUEa95thz1a/mypFAOQXEWK8Wtb7Q9xDQvkbwXzjFdAQDA5VrH6
 L52PjY87SoUMmJECDTxZzs74BxxWvzlHscZmL6VQESuctLSmOTH3ivQ=
X-Google-Smtp-Source: AK7set+cFs1AwNyjrHfT4eFsJP6dSFO3pQ1xfcD0fVPi5XjmERq9rViR6hefLiK6x6lPDIOISJKm9Sftmn5yEh7+j64=
X-Received: by 2002:a67:e2c7:0:b0:412:2f46:4073 with SMTP id
 i7-20020a67e2c7000000b004122f464073mr8848432vsm.3.1678184806025; Tue, 07 Mar
 2023 02:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 18:26:35 +0800
Message-ID: <CAGXv+5FcnLYZnWGtngkj2y0mozPopT=16X2rApFqNhRYxfMjPw@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] dt-bindings: gpu: mali-bifrost: Add new MT8183
 compatible
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
> Since new platform data was required in Panfrost for getting GPU DVFS
> finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
> compatible.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`
