Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EE16C62A7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 10:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D60310E45A;
	Thu, 23 Mar 2023 09:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1810E45A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 09:04:55 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id n17so14485769uaj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679562295;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ER5BSCr9JV00PaqEK5UpQdMYow41x054A0NzdPKRFxo=;
 b=cTjDYAWCMEbcsqF6rG9P/DV5MiBYk+2MTPuya2dk52/SvB4hjaQIL9hP5GxKBi3bxZ
 rbu9QMoZoFYtR54ZOowHAVGIN5y+DPM8Ii8TGsN6q82qqKpx9K/0HwH0BLiB7wZvSv6Z
 JOClzLV/+Zt8HBq0JiXVL450GKr5XKfuV0nX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679562295;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ER5BSCr9JV00PaqEK5UpQdMYow41x054A0NzdPKRFxo=;
 b=pdAdxFru0sNkAIip8WfqzaD5WtEbRuWPVKRZv1/lofU9KlGFIMIg0yip9baxo6tGn7
 p2UgptbWDGmiI9NZFkzEsyR2w8Rh7hS9jYgT8nXy+wgvlrUy9pFsAn9VDatQ0e12VMB4
 LOSGTNx5MtdPxhElZTn8kC6njUr3JTYLbIfgMIrJA0NgwgPFHYmoOevSwloHLSvC4W3w
 SVH6N51QIqumOZ7l9OR7zPx+6dka2K8uBa35jRCmuUIPlZ4uW8EwyX/S7O+0/MlSILKA
 INZ8pdYcxvP8L4Hve0D6kiy24b4M9k42M/cNSr2rNuW6q/8OAYl0RMy2qnJUP7Ru2u/L
 o2Mw==
X-Gm-Message-State: AAQBX9e23qpK9TkKTh09b0+ILY8yd6CH+fMbzhWzr1Z3CB6wRfkDjQcA
 5I74wjSl1hFKsQkN0io43JYlFwMvPtGReeYKXLUtHw==
X-Google-Smtp-Source: AKy350aBwAARZFXCKTypUlkAy7+CkD3eOoHJIRlhaqu5olHys60B5m/DMcr9xhAwDThW+C/Sce5ce0an2hZ4w2+3tgE=
X-Received: by 2002:a05:6130:913:b0:68e:33d7:7e6b with SMTP id
 bu19-20020a056130091300b0068e33d77e6bmr5361851uab.1.1679562294902; Thu, 23
 Mar 2023 02:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230321121859.2355-1-nancy.lin@mediatek.com>
 <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
In-Reply-To: <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 Mar 2023 17:04:43 +0800
Message-ID: <CAGXv+5F82Ctz0pit4LsR5mQizPq-v2k3OVfiRhsGnG0a2J=Dyg@mail.gmail.com>
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 singo.chang@mediatek.com, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 clang-built-linux@googlegroups.com, "Nancy.Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 4:58=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 21/03/23 13:18, Nancy.Lin ha scritto:
> > The hardware path of vdosys1 with DPTx output need to go through by sev=
eral modules, such as, OVL_ADAPTOR and MERGE.
> >
> > Add DRM and these modules support by the patches below:
> >
>
> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromebooks.
> Green light from me.
>
> Chun-Kuang, can you please pick it?

It was picked up a few hours ago.

ChenYu
