Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3246ADB0F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 10:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBD410E3DD;
	Tue,  7 Mar 2023 09:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2149310E3C3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 09:53:53 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id m10so11801198vso.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 01:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678182832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZiJUwfXXWKebxDkpzA7S70ZvbXc9ROq8nFsaPfKDwtA=;
 b=LCnLo+1Lt8yESm8HOaYnZDce+UzPbTLSyBa9jOeFGnomDhvHHP3JVwfDhwEYufqpRL
 mvx/zBNfZq1ThX2nv1i8W+7g4cppdPw6UB7tyvfCR5g+2h3CEE/U6RnJsH2KkZGbRF80
 PBe1EBCPuFy0zFp5oi7VY95HQZSdqmMN0VrFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678182832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZiJUwfXXWKebxDkpzA7S70ZvbXc9ROq8nFsaPfKDwtA=;
 b=dOpGtUa1MzeJgmvF5eNgFYSZP93dkeOvSdR0aHRlhXwL50czjySMAjjRhshc+SIBSG
 kX/RITiGrr2T4WAXP+XC34ABXL6ud60vHti8/ysSEN3eNSRfToJU4ZMqN9PiUV3zUav3
 fSmtzjoBn933wGk5NkCzj0TEuc7hn2dAB6qstEUOfESZ0Whx1h724+A4n1VW9FR6hH0f
 bpW+pedF1rGlDDjqVbrCpxzmyLBnlwvqFBkGhxuOEf4uv3xlG4s2ePpCgo+qq4Ocl27f
 pKjIqJ1oSpn/2IF7mrNvNMhZuvTuSRJLej0WpNz9DUjtDHb464CUciOH6NRpHiRQCk2V
 tEQA==
X-Gm-Message-State: AO0yUKUX56Q8qJpJ+xkMS5phRnoe4QJzCGr7MZbJqCzs9N89Ur+G3xFB
 vm28TyUw3Sjkz1QN5DNihLmhO9U0UlQSGVwu97ZnjA==
X-Google-Smtp-Source: AK7set+6irPSk3s8bwrc7X4UKLc0k0PJT/LZgEKEVJOKB17JmYB6LU5bRJAQFAFODuPu7JFfjvtfu1Vqd9CK04niu14=
X-Received: by 2002:a67:d583:0:b0:411:fff6:3cc4 with SMTP id
 m3-20020a67d583000000b00411fff63cc4mr9654426vsj.3.1678182832240; Tue, 07 Mar
 2023 01:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:53:41 +0800
Message-ID: <CAGXv+5HSAM46wzQ4ef+S3SPg3yhFVS9nar8wRmtzFc_hzsyn3g@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] drm/panfrost: Add the MT8192 GPU ID
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
> MediaTek MT8192 has a Mali-G57 with a special GPU ID. Add its GPU ID,
> but treat it as otherwise identical to a standard Mali-G57.
>
> We do _not_ fix up the GPU ID here -- userspace needs to be aware of the
> special GPU ID, in case we find functional differences between
> MediaTek's implementation and the standard Mali-G57 down the line.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
