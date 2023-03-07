Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B1C6ADC64
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8DC10E433;
	Tue,  7 Mar 2023 10:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C65210E40A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 10:50:49 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id n18so10912377ybm.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 02:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678186248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KK6+pmxlkkVYq1/dWLbdAI6eiiQIn+ylv2hMdBqK3+E=;
 b=ZV8QkZxiPpht74gPwYBgIZqWLanOR7Hh9l9ufs6DkGmYq/8/bJXfM6oqkXXEdVwcWv
 X5NPGxA1kIUpnj/Bfp6BKBMPHFt+GLkWuMR4fT3P7+PTUZpMkOhY86v5QSk97k8TxFSW
 HVEjQ0Xf5gfKAJyeSrVqo7SSJyew70fyAS7PMjw8//51x0J5EkHaKOA4C8qchRNzkSuc
 QUs0sscP0NJyXwCm4jiTqyde1HJPr69AOmybk6EQ0jwwbdnhT08eDXV+EMgwtMAi3P3N
 vQdM1KeeF21KslFm19BYz8ep+peLxy0jzQf3ewCfoHeXbcAiAQV3R1NY6tGGHjbaZ8N4
 IK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678186248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KK6+pmxlkkVYq1/dWLbdAI6eiiQIn+ylv2hMdBqK3+E=;
 b=bdvbSRVIMVp9MqEPqy89+PS1c3uFvRUYNbXUnnCz0Zqm+w12UPpBSgmCgOevNrd95t
 WLwfoyGYgV30dCZmGOQmYdA1JbqyeKw+D5213UQi4uBpHd5k8Akr4skOVhE3GdZlR+0p
 RDjVMD+d0E9uW7dc86ZC2fASgZkFufKbD1PQ3VKtigExXj+3Hlv+NOo90vPtjWsUuMBx
 0xvMpTLJlG1mqNwzqvu50qs3+MowzjZeVFIEc3ulqSJh1oiJvXRNuJukFck7QeK0yb8k
 woyEWVmPk/yG7HLOCACboD3yFYxIFCtyGINBCb5d9tQW4MTjj+gN5Hh3aoPoEiqDKVp3
 UiDw==
X-Gm-Message-State: AO0yUKVDXtCJ5hk2+Z+qIEBZrRnb0d3xpv5GODMDsA4b+sbySPEsIhqZ
 Ha2IUcJIpD+8f/RE7NBE2Ct7bZRVg6qrPwkuuWVu5w==
X-Google-Smtp-Source: AK7set9JDVjFHts0EtGNNbzx363IolKWS/zKlAGLFGrtJWNK3ZkAp65ZtKiRq0kW2AbaXZQtaHuWGwc6Ba8iPUzjwqY=
X-Received: by 2002:a5b:c51:0:b0:91d:98cd:bfe4 with SMTP id
 d17-20020a5b0c51000000b0091d98cdbfe4mr8506651ybr.10.1678186248559; Tue, 07
 Mar 2023 02:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com>
 <25019fb1-87f7-b863-48e8-a164d0e08265@collabora.com>
In-Reply-To: <25019fb1-87f7-b863-48e8-a164d0e08265@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 7 Mar 2023 11:50:37 +0100
Message-ID: <CAFGrd9qV40Re=bJY-kToAcYcv+d3nBje-zxxKcsvwfiE1a9OjQ@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: display: mediatek: clean unnecessary item
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo

Le mar. 7 mars 2023 =C3=A0 11:17, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 07/03/23 11:07, Alexandre Mergnat ha scritto:
> > The item which have the mediatek,mt8192-disp-ccorr as const compatible
> > already exist above. Merge all compatibles which have the same fallback
> > under the same item.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>
> Alexandre, the Acked-by tag from Krzysztof goes *after* your S-o-b :-)

This is managed by the B4 tools.
Also, I know this is an unsolved topic in the community, but I agree
with people thinking the last trailer must be the guy in charge of the
commit.
