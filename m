Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B3B551116
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 09:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5759A10F1AE;
	Mon, 20 Jun 2022 07:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1893810F1AE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 07:13:21 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id ej4so9817368edb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 00:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eZxNhueMBF9WoNcsQRrgiB02jKYBhNhqYGBvBdIMT/o=;
 b=fy3dwtBDvc791ioyRN1572SmjL/QCaIVbg2+MyM1rCFfoafQv0OE0oBW1d4YrWIIi3
 DIrhnywVf88jJaKxiRQGAN/hGXKMSYTj4hhcL6B1cMYP7QofkT5dyPwudtEpoWiedZkf
 vKInpa/OhzZib4wmyfrDVCwTf9f6YX67mE25E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZxNhueMBF9WoNcsQRrgiB02jKYBhNhqYGBvBdIMT/o=;
 b=npn3LGeT5lnmEnnUi3LFCwC+nPkkpmA1QH+FHKEGicGAGSXPPlZSmKAC8hKX4yBAxu
 PxJu4t8bXTM3fs37l8nRu0aKWWy7nHpWE54/C1rKEAQSy04KLlu7l5s3T/R/cb9eT5+1
 oe9aeS90CJo67bluyMoEDpnQa9XOrOGUuATzz5RUfxnbahhMIK4geP170/hdhjiJMI7/
 04tC0PD7UhBX6su0WPrd7dQ3Vw40RLwzcO1wLrrMfFtrQVikLzfwFUCrMhgGtEMsmX0c
 CEDND5tgmtFTbk7sShuHsGwa/68B59zx6V+f0U8t5uhV6LptUEYMsLYXS2U2Z0cCWLg9
 IsxQ==
X-Gm-Message-State: AJIora8bVpvgh4tfNob6sPQ91j1DPJhmZlNManBarp+zSQUUl9H663/Z
 tUxRHhmwjfNRWmrpmdrmWE76VDDWhSI+Yj33e13szg==
X-Google-Smtp-Source: AGRyM1sL5dIl8AH46jNJrBl/TTzwbPT5YrA248QQiwP24rFmBUawcT2ZGIJ6uCWt77gKUpazkmOZ3P3/igx2WCEym9c=
X-Received: by 2002:aa7:d6c9:0:b0:435:6698:589a with SMTP id
 x9-20020aa7d6c9000000b004356698589amr17234634edr.59.1655709199702; Mon, 20
 Jun 2022 00:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220617072521.21551-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220617072521.21551-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jun 2022 15:13:08 +0800
Message-ID: <CAGXv+5GG1rKsECDotA_RpXay1i7ido+te1=CbX0d21638=+Z2A@mail.gmail.com>
Subject: Re: [PATCH, v2] media: mediatek: vcodec: Fix non subdev architecture
 open power fail
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 George Sun <george.sun@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 3:25 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> According to subdev_bitmap bit value to open hardware power, need to
> set subdev_bitmap value for non subdev architecture.
>
> Fixes: c05bada35f01 ("media: mtk-vcodec: Add to support multi hardware decode")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8183 on next-20220617. This makes the hardware operate correctly.
Previously it kept timing out, presumably because the hardware wasn't
properly enabled.
