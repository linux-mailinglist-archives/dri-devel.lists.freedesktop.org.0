Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EC1667133
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 12:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C9B10E03E;
	Thu, 12 Jan 2023 11:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB7110E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 11:47:23 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id k4so18744599vsc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 03:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j/p/iE9FkOKMo7gwBFTP4+PfxlZi9hnBSH41zreYTFY=;
 b=SLS2iJF8Cp/L8Htgd1U5Rj5zBINtlHnlv6QMAZ0oGzQW9CY7NA3jttx7MGhbzxOuoM
 IoDMhbuJ4VFqIHMntVaKdORn/KMGHZsZAhARzCWqUEChLZRD8NACJDnl/LWfmVfSq07x
 yAW9nCNVlzAd4MUTuqEUv89eJ+kgDblaTDDRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j/p/iE9FkOKMo7gwBFTP4+PfxlZi9hnBSH41zreYTFY=;
 b=I9DcNFEHNxn0ZBC7A4wsvTNT/3wOvSBqXQzV/EJ7p5oTl8uNdWvRrvoDCZs2cgUPup
 bu6xhKGkCDESTlTvTlrAFsF1kOupxCu7NBNjWNMoFo6/aYSmz9BbvqzfqfDK1CLQhY4A
 ee7QClZpQllLeEYdVxDv2tOxcY1BVicJPvICGuqa3tJn1gqX+m2ffBiQ0e3MsgeWnLJn
 fpt2kYSHNjKJMWXgyniTPciGk/eIuzmTi2/3eRiHGObePeT51yhaxbXm83B86z/QtHdT
 G0WSygO9hMvepUh5heI2XQSH9AdZFZ8GVy2aNnIqmpWjTUS/IkHyBvpMSPZj5feq0lsk
 q4AA==
X-Gm-Message-State: AFqh2koON0Qz1WvY/PlUEfeJFUGsBEl05Ur4s0kLnWMOMScngOB/UVsF
 w4NpmakDfPtz/DsYACyA+4zTPPITvPug85Pkv1JWXQ==
X-Google-Smtp-Source: AMrXdXvSajYR9jV6VGsPH7TwZTubfkHmhhX+kXom5wSr5YNKiTnawmEt7PjpbDQCDMbfYdgjqI/uCAYVJWaS0J83yRk=
X-Received: by 2002:a05:6102:374d:b0:3d0:af13:3b6 with SMTP id
 u13-20020a056102374d00b003d0af1303b6mr1897629vst.65.1673524042864; Thu, 12
 Jan 2023 03:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
 <20230111123711.32020-2-allen-kh.cheng@mediatek.com>
In-Reply-To: <20230111123711.32020-2-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 12 Jan 2023 19:47:11 +0800
Message-ID: <CAGXv+5Gpzz-pp+YSQhFkH1cejGB5csNnz_Qwop_7Fkbxm6SHxA@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: mediatek: mt8186: Add MTU3 nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 8:37 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add MTU3 nodes for MT8186 SoC.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
