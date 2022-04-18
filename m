Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB3D504C81
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 08:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A6C10EDBE;
	Mon, 18 Apr 2022 06:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB7F10EDB9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 06:16:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z12so16484381edl.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 23:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R0p9SyM2Gw6ezgsQBgHwJlt6cnUQdSZIr2Akmm0cjIc=;
 b=Bur8D9FzAagdjm0aTmG8lxdbZQSBX+S1iB2gHK6R/tkzttSR9FtCfwBNjrIvsxJkS5
 bZdSK7WCvDEnspxJx4B0zK+YQidIQh0FdRHVycq3xBIYuelw2lrcYBA9pVFOclpqNA7Q
 o6rr6cGN0F8093vbW3/OHtdLHM81o5SRn4cKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R0p9SyM2Gw6ezgsQBgHwJlt6cnUQdSZIr2Akmm0cjIc=;
 b=273umrYwXiXrBtqXvtemYF98+uqaNhKsAjyDqSN72jANcWEiJEzXIX5rhYOdohBQ4r
 FrrkyXvhWpseE8uh3YZVTb3a3u/XeSr4Exp922woe2z7Q4aDKjaAvGG/5CZn3R6ojvWX
 6HSlxz+ECbuvw4faSPFHSsfVS5dh8rBuGzx0ZvIaW1h0ugwywDxCHBXhgcmhYhZn90kD
 5CEqxfMpRJteYA1kV1tpsJxP+64sgnYTcJJM2CS5dfYxfWs0Q4vUUZ201MDxA+8K4c6F
 vKhZ5Llc1rCPZs+6aPw9LgplPvF+YhJ7mLARA0pJA279q2fCN2StmaDnIFWmL++p5m5N
 Tddg==
X-Gm-Message-State: AOAM533N2AcoF0YgdOJY9Jpv0/hCMcIYkgij/4iso1uyfjd0MGESsNpz
 pKyc0lM4i11KqHtGNxOuTTyHqawp76pRAA==
X-Google-Smtp-Source: ABdhPJwEyDdl4rhGRZsMGcuQtjugnrHQFl2KKjldXRcVW3S32y4I5QEoW/MmRoHHEHU5KPoN3ccdog==
X-Received: by 2002:a05:6402:35ca:b0:419:5a2d:9b87 with SMTP id
 z10-20020a05640235ca00b004195a2d9b87mr10482148edc.174.1650262608945; 
 Sun, 17 Apr 2022 23:16:48 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 s3-20020a1709067b8300b006e4a6dee49dsm4287911ejo.184.2022.04.17.23.16.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 23:16:47 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so548521wma.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 23:16:47 -0700 (PDT)
X-Received: by 2002:a7b:cbc1:0:b0:38e:7c42:fe38 with SMTP id
 n1-20020a7bcbc1000000b0038e7c42fe38mr14247667wmi.51.1650262606781; Sun, 17
 Apr 2022 23:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220414025023.11516-1-Nick.Fan@mediatek.com>
 <20220414025023.11516-2-Nick.Fan@mediatek.com>
In-Reply-To: <20220414025023.11516-2-Nick.Fan@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 18 Apr 2022 14:16:10 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni=pHPDAJUV2b=qWm-O26fS37wQjuL014eKoE491K6wGQ@mail.gmail.com>
Message-ID: <CAC=S1ni=pHPDAJUV2b=qWm-O26fS37wQjuL014eKoE491K6wGQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: mt8192: Add node for the Mali GPU
To: Nick Fan <Nick.Fan@mediatek.com>
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 alyssa.rosenzweig@collabora.com, wenst@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 10:53 AM Nick Fan <Nick.Fan@mediatek.com> wrote:
>
> Add a basic GPU node for mt8192.
>
> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
