Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550425512AA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 10:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2E010E00A;
	Mon, 20 Jun 2022 08:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEA310E00A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 08:26:13 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id es26so12321238edb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ytMUXjmaN8uHSvhOnNn2seCP4qJ7rfDpUHNy7RTqCxM=;
 b=hd1CcsMoEubcv6jr6mmIlVzkPnefJUP8r20R0zYK/c+jUCgKI8Q3JnLWgClt35Uisy
 4KbHXd9q38JNpI5fY6UQgh6EaWIHQxw+4tio8Di8lZre94OlHMYRIdM/jJdTFqHVz7B3
 bSbk0rAc/JmUZdW8yMVeBf8pChYxs09lHNpEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ytMUXjmaN8uHSvhOnNn2seCP4qJ7rfDpUHNy7RTqCxM=;
 b=UKGeH17MKlmdhMWA3rxYK05n3H05URfCGLeRSj3V0jv2Ugiqs60OlGkIGNJS1UyJ9I
 DLy7zkYf4rw8iA0KRAnF/6NTLsafM8RuFiDWt9w9AIEL72/3RD4Ds9rExUGIjDslHtDy
 KGMiIQ1h/2guQXOK6NJX/UA87FMh5E37c8gdNm6vc1ObJpJctxDoxIWZX2PLS5Ln6v0z
 y0fwZ1BEyfQ4DAcDouzD3GmtDSsZ8/jKG+dItsOdtBjnlcPFmc0vOOSXJcG6K0OXl8Yk
 kIEh3iHB2FTtqvYxV/LWfeKekOGAXk7Wr2QI2HwI8ZtvEqdD6gdw3O3qVYpMZ/NL4nTJ
 ieiA==
X-Gm-Message-State: AJIora9rbb0liXi09hgMc9lzfUM2hMQYynNP2OGi0M60faCVTd6Yxmed
 ThFojI7NjK4lf1GeTC/hapnWWcqe7uUFsvI3AX7kqA==
X-Google-Smtp-Source: AGRyM1sW1N2WJNAFBze0aVQVaROgZ8Ht/RO6hxNo4xmROEhN05naPzIBxPQWeqLSKYLqFDl/OC2uAiiLvkZXDWbHcKQ=
X-Received: by 2002:aa7:c84d:0:b0:431:4226:70c9 with SMTP id
 g13-20020aa7c84d000000b00431422670c9mr27849166edt.51.1655713572457; Mon, 20
 Jun 2022 01:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220620063217.9867-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220620063217.9867-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jun 2022 16:26:01 +0800
Message-ID: <CAGXv+5F8jvzz9DkM4x0MKQ_hZGpYXwQNfOEp_Gvqr__t-WDW+w@mail.gmail.com>
Subject: Re: [PATCH, v2] media: mediatek: vcodec: Initialize decoder
 parameters after getting dec_capability
To: Yunfei Dong <yunfei.dong@mediatek.com>
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
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 2:32 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Need to get dec_capability from scp first, then initialize decoder
> supported format and other parameters according to dec_capability value.
>
> Fixes: fd00d90330d1 ("media: mtk-vcodec: vdec: move stateful ops into their own file")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
