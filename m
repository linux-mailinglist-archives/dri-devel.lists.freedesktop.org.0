Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17083776F9F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 07:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEB910E0C6;
	Thu, 10 Aug 2023 05:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA2A10E0C6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 05:36:14 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-790930d78e8so16259439f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691645773; x=1692250573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EslHdHq3bNylyhIFtlknMEJBi77orec+gHJpWqTOmeI=;
 b=TL5ohFInAUZ6krJYlz2rRmfnYdXbdy51lzxuVCGfxZwSVqxaXAq7X85mBL/klnUzg5
 CQz+OXb/ApStaQeQXs00FQX7oZSNQa+hmIC+eJnIWlc8OJakMLk4wNdduO84wB8P03l4
 I89qjPyz579k8qzpFjRtz3gtn7qCfw568rFhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691645773; x=1692250573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EslHdHq3bNylyhIFtlknMEJBi77orec+gHJpWqTOmeI=;
 b=islFtggowpf10nivoYvruqturgh1Dhr/KL59qH1SJaO2Vl0TFZNnZ18uS/mWNvVlcD
 FqAMxWUE3RXpqJLj6i1J3Uopx2ALltJpEJfaO7nX7o+OIxo66nAjnnENVHOSyZnxhKPt
 pEMeCrjtp7AXpY8yQ8i8luVPaar+jV2AQVvAsV11mt6bzSkPNzSMz4oqr0YmB7mI9MZd
 Zg/5dK2/kcn6SAgnR6fXyQd81vssrabWFZuZrA0uPwIV3iidMYK04cHMC8eIqrq6IX3e
 1D5DKtGPttfwucxmE30KAO8A87Ole4/lZiVF4NTEP9Kq8Tdp6zLri88OfZn42vJt5WDB
 366A==
X-Gm-Message-State: AOJu0YzLxf2UswH2MrR3D9gFLdXkb3Iw/FoAg2Ql1U3tyQ0U5xvFzVGh
 NOQmCFhF/zP3iIcn5lKe350pKWy9em1xUYhoPwk=
X-Google-Smtp-Source: AGHT+IFPz2kIkOn+07L31E9HRYGi4z7FqVofCpX+w3e3Q4RTFauV6rp/w9LfEdxOUBnzQe44so9kxA==
X-Received: by 2002:a5e:aa05:0:b0:783:4e11:76d7 with SMTP id
 s5-20020a5eaa05000000b007834e1176d7mr1961162ioe.21.1691645773614; 
 Wed, 09 Aug 2023 22:36:13 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48]) by smtp.gmail.com with ESMTPSA id
 o12-20020a056638124c00b0042b09036e5fsm191792jas.175.2023.08.09.22.36.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 22:36:13 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-790ca0ed6d3so16023739f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:36:13 -0700 (PDT)
X-Received: by 2002:a6b:db15:0:b0:786:71d0:ff9b with SMTP id
 t21-20020a6bdb15000000b0078671d0ff9bmr2208984ioc.10.1691645773129; Wed, 09
 Aug 2023 22:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
 <20230809181525.7561-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-3-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:35:37 +0800
X-Gmail-Original-Message-ID: <CAC=S1njMfS4LBxXg85b4oiwfhXNv5-Bm9+S-ZqupfiWUTs0ssA@mail.gmail.com>
Message-ID: <CAC=S1njMfS4LBxXg85b4oiwfhXNv5-Bm9+S-ZqupfiWUTs0ssA@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] drm/mediatek: Add crtc path enum for all_drm_priv
 array
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
> Add mtk_drm_crtc_path enum for each display path.
>
> Instead of using array index of all_drm_priv in mtk_drm_kms_init(),
> mtk_drm_crtc_path enum can make code more readable.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Tested with MT8188 and the internal display is up and functioning.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
