Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837E077B53A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 11:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE24610E16C;
	Mon, 14 Aug 2023 09:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331DC10E169
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 09:15:07 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7911dfc9824so161316639f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692004506; x=1692609306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=symJGMsghCtGvBGMFumnnn8XSl8s5K5BSajbCGhbLM0=;
 b=W8L6qECFUQs1Myvfv9v5ek+Xg8PYEt9zYX0c8mN9P/yrTQx0r+6Mh94HbVbrWQbJjt
 qQDJGyit9JqUJWnFYC6jPsWVJEm4pbtEpnLNV7O8Lt2zqmnX85TKCGu5P+PfLtXkgnay
 gIz4kK8PC4yfopDc9OMtzj46242EyoiF0D5IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692004506; x=1692609306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=symJGMsghCtGvBGMFumnnn8XSl8s5K5BSajbCGhbLM0=;
 b=K1AiDC4BiYUTrkRdCQT3/fCTx4fqMW9RcsODr+8LIVXUJ09CL7kcjVYd/LQwEBtpnF
 euBjOhpcvsFeb7N2kYO6Uar3wF3kpl1UAQq82M1PCUsO6H1iQ91MRQpLNVKePf2Yd3MB
 LLVmvKrvwlTMVhWI8VQ/MSZZ03dDlsjrDjjnvAQy2nbHPheB7KHZSRRwaZlKM5MIfw9f
 kzV2DQKkosCav671rlJbXTexORAHgwwQa3uLnIYkFN9SS6Pm814Y9ZDgWmbTLHfK6byz
 hvSlTvzV9Gg3ozMAGz4WtleRDJOBS4UzPJmmM6L/Uc2Fdj/cChdtdoI8SoA1Izn8ptRI
 rqcg==
X-Gm-Message-State: AOJu0YyjJRNLP1mB8F9ikIa325C+GPbdl98Eb9n7Hi97S9RsIcimLX0a
 +tiv48wM+PlBTpsacAYoVKziUDHEyxDvuvMh+0I=
X-Google-Smtp-Source: AGHT+IGpeIXJUWeXrVsJRswJB3wKK9i1DH9sBcjq3V8cd2augaPjykDzoTqG1cm4Cc6HXPzJsMzrzw==
X-Received: by 2002:a6b:4908:0:b0:791:280:839e with SMTP id
 u8-20020a6b4908000000b007910280839emr11247186iob.16.1692004506311; 
 Mon, 14 Aug 2023 02:15:06 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46]) by smtp.gmail.com with ESMTPSA id
 q8-20020a6bf208000000b007836252a084sm3121285ioh.48.2023.08.14.02.15.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 02:15:05 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7910620f45dso161677039f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 02:15:05 -0700 (PDT)
X-Received: by 2002:a5d:9ada:0:b0:787:4b5f:b6cf with SMTP id
 x26-20020a5d9ada000000b007874b5fb6cfmr11533549ion.5.1692004505047; Mon, 14
 Aug 2023 02:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230814072842.28597-1-shuijing.li@mediatek.com>
 <20230814072842.28597-3-shuijing.li@mediatek.com>
In-Reply-To: <20230814072842.28597-3-shuijing.li@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 14 Aug 2023 17:14:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh9QtE7CNpsUujqSAM-Q10Mb8dOfXYtJQebvw4RifqOBA@mail.gmail.com>
Message-ID: <CAC=S1nh9QtE7CNpsUujqSAM-Q10Mb8dOfXYtJQebvw4RifqOBA@mail.gmail.com>
Subject: Re: [PATCH v4,2/3] drm/mediatek: dp: Add the audio packet flag to
 mtk_dp_data struct
To: Shuijing Li <shuijing.li@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 3:29=E2=80=AFPM Shuijing Li <shuijing.li@mediatek.c=
om> wrote:
>
> The audio packet arrangement function is to only arrange audio.
> packets into the Hblanking area. In order to align with the HW
> default setting of mt8195, this function needs to be turned off.
>
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
