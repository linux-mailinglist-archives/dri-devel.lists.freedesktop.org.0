Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77683686B79
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 17:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD4710E17E;
	Wed,  1 Feb 2023 16:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EBF10E17E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 16:24:54 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id pj3so4966579pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 08:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+bVGPVtRtaa5cQIg+lKFGD+Z/X5+QbVI5uJEe3eujP4=;
 b=krXuztVlIXt0OtPPMJZmLCA41bXjfJzXjRxvBo+64BCeUf+ehCEpaXLdLtkLiU9PSJ
 G5HCIuqSo69kvHGqI/YYsP1Oqxl5HWlOWt9Bzj0BEP1WibSipHhMSnxDEphW57Siu/FM
 H8esrioBBC3DYqxI1c1/2FrjXHXK7TaucvGRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+bVGPVtRtaa5cQIg+lKFGD+Z/X5+QbVI5uJEe3eujP4=;
 b=LSS4mJ5VFc7xuwHb0qielcXJ2DmVNPYGkLfyoBBb0CoT+65KUzvzoXH2eFgjGJtgBY
 0D3G1WINEdGizIM5Bo6iYtNT8tnoQbHl/RrBxot1bT9PbbShjRk5Szpu+3/B1EvKSfUH
 AnMEpyAlyDITM2bTCzxQ0WwwRhw1iS6tuuLsnF2WxdiynNSRq5AZUdLXEuZp1/lh0FTS
 0sU0YhQyFSBnqCh81Vz77Em3j2Tj7Z6PHwkJE3fwecO+OnYYrVCRoOJqCxSVag0+IluB
 0liHQJbiMOw4i/pe8jGaP1XLaOKKFR+6vNSAGDs+91EWKIfiDhYm1+R2TbKjUBbwDa8N
 feQw==
X-Gm-Message-State: AO0yUKU5dJ/UmKXasMNKW5F+l5UcilPzmG69r00J6K9VC01FsO1fVh8p
 r9X8NIEbOZBqUTDUhPH3LV2dnK1SO9ic96mL2iyU/HBQx283/g==
X-Google-Smtp-Source: AK7set8Wwhu1xOqCRb/mbilJpN+pQMhbG++yae2UbeAtfZZwk3eBGl96jZkbdqjWlLzGiKgpC2KGq6qTNYPjEYPbhuw=
X-Received: by 2002:a17:90a:db08:b0:22c:a57f:a90f with SMTP id
 g8-20020a17090adb0800b0022ca57fa90fmr573274pjv.103.1675268694462; Wed, 01 Feb
 2023 08:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20230131200842.341272-1-greenjustin@chromium.org>
 <20230131200842.341272-3-greenjustin@chromium.org>
 <CAAOTY__7o5SMyc8jXSkO27Kc8r5TXaFBnMApSiOG3Cjm5+hZaQ@mail.gmail.com>
In-Reply-To: <CAAOTY__7o5SMyc8jXSkO27Kc8r5TXaFBnMApSiOG3Cjm5+hZaQ@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Wed, 1 Feb 2023 11:24:43 -0500
Message-ID: <CAHC42ReQbOdyx9buUK4jCbobUhp86Jyu9onYRxUGHE35=H9TwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: Add support for AR30 and BA30 overlays
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: airlied@linux.ie, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

> Does all SoC have this register? If no, you should write this register
> for the SoC have this register.

I can't confirm this from the documentation that I have, I can only
confirm this register exists on MT8195 and MT8186. I will send out
another patch.

Thanks,
Justin
