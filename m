Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 189BF69EFCC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 09:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5185610E425;
	Wed, 22 Feb 2023 08:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A63410E425
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 08:01:38 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id b20so7439907vsu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 00:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1Y/laJfFqV4xwHyPJ7m5mnZnkPz7sXnRa7yaLqyRbq4=;
 b=fwgJZ1kd/b7yZ8TdPMq+tKUzKjEZD5tLpT9fCYC0eKvSX7BY8L4D6l5i5Fs5mQ0VhA
 s1lH2IXxMhWLSNQcMkwL4NsJ6NPlpWG1Hs8qbltFRcnuRTTjJ9K1F6Aq28JktV0upaTi
 lDlbusLsU4bSpWk9IP9DxyyIZVinrYwz8sqm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Y/laJfFqV4xwHyPJ7m5mnZnkPz7sXnRa7yaLqyRbq4=;
 b=pH0alrUWBVwL3FAYbWPAsum/B3DYSKH7DXU+fy4OzkeFwSbeHVJEIEnyorFF9UC+7n
 ppOwS/l19ubg2ZjNXf/yFODfsKhcW8FU1Z3twCqpkRTx3lzo3WQ51OHcCodDeMS3YNLS
 uAGK20xcPw0RX1e7SQwNxmiOQYenXwuBB48F1lo7qLqFAWT7Hg696Yu4p7nVm9ekMXtC
 O5sdwx9VOII+30m3OGyNkG6Nvb9+Nt+6SNrUeujEQaqEueSCqmHI0WOXpSYUc1h3mXir
 zleCD/L6jsJLXD2u6KF0iAd4fDHMZLTXJ4SudP6zDAz1wCzte0uM1EXmiOqIR/ynH69M
 mpGA==
X-Gm-Message-State: AO0yUKXsIKo9ph2LmZLj2ZScci5a5FP1a1BVRL6pyqZXkRrnW3Jm/yw/
 w0oaBUK1PhOBGPRseByljARoAKU1Tp6TuTUD0wUaPw==
X-Google-Smtp-Source: AK7set8jBcPu1FfniwnfmSpRHGWbhReDFVjElASgEIaz7mr0mpSwwLePzizwdVl4B4a62CrhB/XmVCgC0WHUB1uKmLg=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr1556195vsb.60.1677052897191; Wed, 22
 Feb 2023 00:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 16:01:26 +0800
Message-ID: <CAGXv+5GKTdGoX61OBb84VeH3nKH2DhN=6h9KEyMuKa2phgcUpw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8195 SoC
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
> The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
> same number of power domains and requirements as MT8192 in terms of
> bindings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

For future reference, the Mali G57 in the MT8195 has a minor revision of 1,
while in the MT8192 the minor revision number is 0.
