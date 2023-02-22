Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D1E69EE01
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 05:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C2B10E1AE;
	Wed, 22 Feb 2023 04:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAB510E1AE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 04:39:14 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id f23so6908377vsa.13
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 20:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GVoxvyPN1nhO1N4WDOubFYF2WsT9Vx0F6vnuM2++yDk=;
 b=aL/X1/QSvGLZUB2gQzJlQGgNBI0utUwoe+QVxxv47ccsL91gPFsZ8EhrIKAcwkTtl5
 ydBjo6D40FwxudR7M8CIsAgSmn4szkb4iSQsSHKOznqjBjEFAFopUM8ubJQuGalc73Zb
 9O0Cr60WrMikcg0bCxsbDMDeXgTY4ejDaw4gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GVoxvyPN1nhO1N4WDOubFYF2WsT9Vx0F6vnuM2++yDk=;
 b=2h7DQZ7WJzaW1GzC+NlS6deHZOPb6A7ZeRGPfdyqYjw/N8+72p7DhbuCXGRyTiK+Gi
 vzu6Yhd9upUyKuJFbGedF0Oc1uR/Z6kc18MtaWNDDK5P3Gg+cFCJ7lnkH4gK1HpJDh1q
 I3e+yjyXeF209qnUV38iPiuiRqtxhzzxdyKhZ/4OE7ho1lYGc3nFSUNt6oKHkvRgjRdX
 n0Y705gFoS9X9kRehBeoC7XI7YKf1jNgWVCNfDAD+UexjSg4eKZv+hbG/iVmDsS3XyUp
 udXyMqFsMxmkPF4rQprrrocoxXHI5+9SaT9RfAsDMVeHzsi4tpviQ0YJ0jpKp5XryLVg
 ov4w==
X-Gm-Message-State: AO0yUKWogcysRxpicMSYho0GfPkHTJdEf14F0vbsX9LZqbw39qyGxZ1c
 Bu21XudhcCAFlZRLL/N+wyX/Qen8TeQjNMHAPjXeEg==
X-Google-Smtp-Source: AK7set8Svy6X2qVPrDh0/xqnxlJyxoyam0jIuQ00GgQwGtx0+ljaNuLzHxrSOvTRQu+v7FfJ8TiLYQfAUv4WRifKOu0=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr1475672vsb.60.1677040753210; Tue, 21
 Feb 2023 20:39:13 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 12:39:02 +0800
Message-ID: <CAGXv+5EJpkzKFJFzuz8d5xNzxwnJ=X+MpvXspUHYCNKB8YRNaQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/panfrost: Add mediatek,
 mt8192-mali compatible
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
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Required for Mali-G57 on the Mediatek MT8192 and MT8195, which
> uses even more power domains than the MT8183 before it.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> [Angelo: Removed unneeded "sram" supply, added mt8195 to commit description]
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
