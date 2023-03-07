Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D16ADB24
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 10:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C455B10E3C3;
	Tue,  7 Mar 2023 09:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45EC10E3C3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 09:55:53 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id by13so11801538vsb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 01:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678182953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+RP4oTBHTQfU+cSOnEmCaBzJhcvOEi+tlYyv1N22EK0=;
 b=NHiNggQW7NfCAAvBD5ei7LCdwF00j9A7BOiqv3LttCcsdwo/weQ9LhfU9Nz3t9K0Fi
 e8StI7dy46pVfR2lKDF71AlvtMc8TJEB65CXOk8EKH/8P6OLO2iqz7I0gly94Gqxs964
 0aI9kk4tURcrj9YAdXnCi7av7TMDe/aaony7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678182953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+RP4oTBHTQfU+cSOnEmCaBzJhcvOEi+tlYyv1N22EK0=;
 b=sDV2sW39opAh9Ihv5IBiPdhmnRtmFljZ79Qop+Vu+5i3Jm0fW0Fc9FTr042ynnig2s
 MZ6YjnPDuWH9wa+hf8rRLqmAJNgD0t0SfcLIw/TrjFBPOo6PJTBOAwAbLcM9bq75MLw2
 BUgegmI3smO2rxsreb/s0JK3US6ToA9uOoeJZTzCQISogbfgqF4IvF/mS+S/Ws6/Hl3B
 I+VHgZoWGtUWzXhBh4QbLDdCql84vr8wQ5jp14vUG0RNYQ6f36g6/Wzj2TCTVvYlDBOZ
 UBR+S4Fjb2coeXborf++far/sVUjJka918YV+/AJR2lJlbvgFxdv9vhN8hK2Qk7a4Zad
 z3uQ==
X-Gm-Message-State: AO0yUKXHll8qrztEMN+RXTayFj5HY7Q8VOfOA2byq+f2P4FhXTGIFTSa
 4v/nzHVNF2eWqn3K/ZDiOMmZFbZ6adrrp5VOfXCI6w==
X-Google-Smtp-Source: AK7set8nGUBgc2L2PJPdJBoEOnCnChdp+HTmYAB9+1VzdkOjzou3mYdfP4Z3384VdFLyRn6Da7w1948dOB0dW551ajc=
X-Received: by 2002:a67:f349:0:b0:41f:641c:f775 with SMTP id
 p9-20020a67f349000000b0041f641cf775mr9639372vsm.3.1678182952854; Tue, 07 Mar
 2023 01:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:55:41 +0800
Message-ID: <CAGXv+5F_YQLPqJYUoLA=zSeJyPzPxBESt4GyjYE=fEFt-xxfRQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8195 SoC
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
> The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
> same number of power domains and requirements as MT8192 in terms of
> bindings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`
