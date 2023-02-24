Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC56A198B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A73A10E891;
	Fri, 24 Feb 2023 10:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAD410E84F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:07:24 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id o2so7257412vss.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fZDoDp9QuC05HnCUGFroZeageBxmT4lsXtF5GYcG4lI=;
 b=g7Tk0DyxLJiSdwQj9+fZ+JDu7VS9asBGyeJ8BDtDB6ezGb4c39EJwsNf12hbtzBpcW
 kQCKesuzq7DS6DYWn/T2ENJR5+RCWGak07fn29bUyWLKH3wxR3hsMK4tD1qMkNpoKvw4
 DaNPCEtiA7Weekw+ykdFFO3u6wj7BGzB52Xuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fZDoDp9QuC05HnCUGFroZeageBxmT4lsXtF5GYcG4lI=;
 b=gaJAiVHYZy+C5CUEdYbDrFOktRncQriB5aAu5UDQoSA7ntxeAJxkw+nUUjzcJZr7n0
 3BmSg2x9qhdoszqpyO/webpmOor7ITFB4k2UYDTc+NXqmkyvqnDl26o6kNLbtImkWX7x
 o4lI64NP7tAT7z4oasYDjPpF90PLMBgkOoEUCPwwycW0+33db1h6RQa8TLpIgRSUYDaF
 E4+jK7qOvN7j07uWqcxS/wQvb1Qd1q+0rER0SlV+8zXcRb6izh1sTI1mK2SmYigAoKkM
 JNVO06mBctioxzQIDDkjwXh5CjP6wrNRGjU7B2ShTXYBM8dxXxOSWnqWGo3+he90SLIN
 Sskg==
X-Gm-Message-State: AO0yUKXJR7DxckXrbWQfQgtSxd7jBlsd4TCuxjuI3ltuF27FPAFXoyjL
 JTDDSa6zu37L1/WGgDpDr9gaDwkRj0ENjPsWf0T/gw==
X-Google-Smtp-Source: AK7set9Z3KDRrAXUtzA44i2qVbV1BjyBQ9KHn9SH29kzn0sht9SZ+2jQRb5fBw8cvC/jRXKdcl1bHuaPLYsSWxZmYqM=
X-Received: by 2002:a05:6102:3a61:b0:412:2ed6:d79b with SMTP id
 bf1-20020a0561023a6100b004122ed6d79bmr2036420vsb.3.1677233243900; Fri, 24 Feb
 2023 02:07:23 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:07:12 +0800
Message-ID: <CAGXv+5EftwRaS7EKEPRFimVminA3Je5Ot_QHBk-yqxzHcJkUSQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] dt-bindings: gpu: mali-bifrost: Add new MT8183
 compatible
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

On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Since new platform data was required in Panfrost for getting GPU DVFS
> finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
> compatible.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
