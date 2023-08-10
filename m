Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD44776FA9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 07:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A889410E4AF;
	Thu, 10 Aug 2023 05:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A144910E15A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 05:37:33 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7914633a110so18630339f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691645853; x=1692250653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9UFdkTxk/r2phv46cParOTF4SmxA+o425ukdUTiBx2M=;
 b=BL0YzU8JI+Abza13lNAh9w+QjQ8ZPdAHv96ttqlT6W4Vdm5nKzIifeppJuS1Eu73/2
 n3T9bj9w/exikseTjCSKMbK+eCG/nyPyj8QnPa0CfnER9/mhO3slPojSpNIOl+wJiBGt
 kc5uXMvCk0RUN9sxR7O/uh3clGQZoWqWpQo/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691645853; x=1692250653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9UFdkTxk/r2phv46cParOTF4SmxA+o425ukdUTiBx2M=;
 b=f97brswfw5YRU+E7F/3UO06CCcGafCJbwnDrX5+YqIpKRJ4DZ9gwvuOIxhGlgvkfyC
 EH2KjRLv7arjfl6P8XTojUJ05fY4Nt16T0I69StZg3YtusgBf+rCM9Yh6O+pKAz/DmPA
 /hmTVj9ZNy3Yj/BKkGWnJc7ZsP6yOwnEg1X3W6habE2EbiKPpRlrgUIG7LfpZTqFkiEU
 aErZoD7KeoEm9Cj726pvWZZt9+EzphU1hYsgPDnk07HQIavzWhr3vOKAbnQwGQGeuzDu
 xcU1xMIPpPKu9KxXLNUZ4xwAJSj/Zts+NLWoMRJ9ilf0ZYK+KeMmLHr/Kv3sI3YM8WTX
 DYuw==
X-Gm-Message-State: AOJu0YyG6QwGkJ2pxoJdmZYOrzPDAVmjkJve3xwad1g1g2AxuApw1qds
 pzyfGL2tX5mhtQlnAYvPAH0kTTtAyn3gBTEwiY0=
X-Google-Smtp-Source: AGHT+IE1OakjkJClC6JFivFnqjrd4yiGG6IWpGvQOgv+0+eFYSeJcktO5WQnvckYOpdO2kpMXH0tKA==
X-Received: by 2002:a5e:890b:0:b0:790:fa58:69d2 with SMTP id
 k11-20020a5e890b000000b00790fa5869d2mr1857646ioj.20.1691645852860; 
 Wed, 09 Aug 2023 22:37:32 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51]) by smtp.gmail.com with ESMTPSA id
 s5-20020a6bdc05000000b0076ffebfc9fasm240491ioc.47.2023.08.09.22.37.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 22:37:31 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7914633a110so18629739f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:37:31 -0700 (PDT)
X-Received: by 2002:a6b:f00a:0:b0:780:ce72:ac55 with SMTP id
 w10-20020a6bf00a000000b00780ce72ac55mr2466455ioc.10.1691645851246; Wed, 09
 Aug 2023 22:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
 <20230809181525.7561-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-4-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:36:55 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhi6Tk31a2wayVybcBdmE=wngawzoaz8B-4L9UXpqzD3Q@mail.gmail.com>
Message-ID: <CAC=S1nhi6Tk31a2wayVybcBdmE=wngawzoaz8B-4L9UXpqzD3Q@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] drm/mediatek: Fix using wrong drm private data to
 bind mediatek-drm
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
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
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, dri-devel@lists.freedesktop.org,
 Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 2:15=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> According to mtk_drm_kms_init(), the all_drm_private array in each
> drm private data stores all drm private data in display path order.
>
> In mtk_drm_get_all_drm_priv(), each element in all_drm_priv should have o=
ne
> display path private data, such as:
> all_drm_priv[CRTC_MAIN] should only have main_path data
> all_drm_priv[CRTC_EXT] should only have ext_path data
> all_drm_priv[CRTC_THIRD] should only have third_path data
>
> So we need to add the length checking for each display path before
> assigning their drm private data into all_drm_priv array.
>
> Then the all_drm_private array in each drm private data needs to be
> assigned in their display path order.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Tested-by: Fei Shao <fshao@chromium.org>
