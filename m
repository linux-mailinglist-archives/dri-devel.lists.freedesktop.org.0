Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AC2690275
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D687410E95A;
	Thu,  9 Feb 2023 08:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5C310E95A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 08:49:26 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id p10so1378335vsu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 00:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=22xHVaizGQeKTJvsqtfI5zTT40uK/PwvcQY9ndeXRhM=;
 b=nEEpvk7/fdi+G4pqGRp67+yXUNRS9lFzkJh9kf6sbHjy8/UxKIbI0VqqffhzwZS2pa
 oiBb8fdNaKoWz+iGdBMH7HIDvnywsSa/qktrKHgqmY6E0Xd35NbFH0LC0Se2ufdapwWL
 M/666v2WvN1+4gAnk0Hk1aS0jGVqHGi3Qaxec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=22xHVaizGQeKTJvsqtfI5zTT40uK/PwvcQY9ndeXRhM=;
 b=mJcndTkPmrkIlp4xG5fSIQsXqfB4pZUEjMjbtvKVZAcOyou9ZrVt6EgtQ7apsyljTK
 6rMF5csaADB0spzR/gwOvLlW5bRDuj2WqTdKyRXXTH8EmSoCz61eFWqDNp3dailwV8H/
 TipqmrSV6eB6YHlMMiLesDIpbjA9VPNJkmYipLgTwioqCJtyD8BKXI4VgXmx05JxVgAV
 RUaOK2H9OiYM8hMGE89WaOaZI0L66+TY6AKU8QznkXK9NJozCKa/ufrFzhGNDvkr+oaP
 csTMMTkLbtIgcFwbIEEa9XuUiMOwjSAoMQhda74ca+14AGupFN8Xcgw99J9XOXJYIjHj
 JGcA==
X-Gm-Message-State: AO0yUKVrsbp+U6M3wtmmwd9v/6DQwDcUeYlySeJFGiDHDoE3qJ6rSdnm
 lgK2F+GkUc82eCZNIST/KLIbMD5zNoh3YjvHx6T7dQ==
X-Google-Smtp-Source: AK7set+QkzxKXW4pEMAPFic1Jd0HAeOizDIe+SLOSX/iixyH3n7tgpUonX30kC85rHKw9l8o8gB7revPyLNojTYB0e4=
X-Received: by 2002:a05:6102:3d18:b0:3f7:93c4:9e56 with SMTP id
 i24-20020a0561023d1800b003f793c49e56mr3105328vsv.85.1675932566080; Thu, 09
 Feb 2023 00:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230208103709.116896-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 16:49:15 +0800
Message-ID: <CAGXv+5FZqrGzzG8FrmLVzMd7=a23ZJPYGSy5yhYWgH+BFHNmxw@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: gpu: mali-bifrost: Add a compatible for
 MediaTek MT8186
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com,
 Fei Shao <fshao@chromium.org>, Nick Fan <Nick.Fan@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Get GPU support on MT8186 by adding its compatible.

I'd skip MT8186 for now. We have to work out some binning details for the
OPP, in particular how to deal with both Panfrost (or Mali) and SVS adding
the OPP table. We were just looking at the Mali driver today.

ChenYu
