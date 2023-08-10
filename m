Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFCF776FBA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 07:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB31810E4B2;
	Thu, 10 Aug 2023 05:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA6110E4B2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 05:44:52 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-790b95beeedso18951339f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691646291; x=1692251091;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPy+GgB9Rn2CrQzZMkbpjUhP00w0ETOf0gW/R2Mixqg=;
 b=UpEmLjFDDfYYoBt8kR7pb3fR6r+T9htSqTAB/LcnYVCtCUx4UOtZebsISzSwd9514h
 R1VtadxEV1Xeh1kMh7LxzWMnJEfPbJn8pI77nVIsdx3DHo2o21ZXM2HWZALKs4InKuZu
 E5zw0N+dukxjsqc/qFfym3krRsicHrVwOQmPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691646291; x=1692251091;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPy+GgB9Rn2CrQzZMkbpjUhP00w0ETOf0gW/R2Mixqg=;
 b=XSKE+mRxXUiRxfXo0ovva7ogJrYTdPcg+OQHDHM2pl6+G1e1nmH5/cGXzk+WT5Xmit
 fSQt5/kiavMM/PF7wK91Ib1YmXsBPor0y3XQAol6dtHiNVIaV6S6RT7St4ZDZVrqAoJW
 tH9qgSWQSQw5SxZt46tGD7Oh6v7JNLrm6qcK/zavm4DlFK73USmeF3T/us+P/+Mld+RC
 9YphHv26lfaTKoZ67jdsb6+GHx1Ae2I6vfGkcqD/Fl1XHir5NzGlysUGNk5DPuvKDxIT
 SdG+FC3GL4w1nXfAdG4q6K1hJkGjabQ0QKWBq4FnbsMsCRMnZFc34579YniR3JFuppgb
 IGKA==
X-Gm-Message-State: AOJu0YwFqs3MVGYjeky5+I0inojOAGFJdl5ny8EQH0ZBAGkTGhhjP8ky
 zqo24xvY4ZDPSvwdPAmPjiH59YRCsj0mGg2GGlU=
X-Google-Smtp-Source: AGHT+IHIew07lzBo24E6rlEDDtHSeWoc2IScRMvl3B+kllgg2q9MFPNDJjdQbDTqOfrzetLjUS065g==
X-Received: by 2002:a05:6602:5:b0:787:34d:f1ea with SMTP id
 b5-20020a056602000500b00787034df1eamr2063761ioa.8.1691646291667; 
 Wed, 09 Aug 2023 22:44:51 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46]) by smtp.gmail.com with ESMTPSA id
 z13-20020a5ec90d000000b00790d81167a7sm253603iol.2.2023.08.09.22.44.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 22:44:50 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-77acb04309dso18234539f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:44:49 -0700 (PDT)
X-Received: by 2002:a6b:5c03:0:b0:790:ff32:eb3 with SMTP id
 z3-20020a6b5c03000000b00790ff320eb3mr1894689ioh.17.1691646288713; Wed, 09 Aug
 2023 22:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
 <20230809181525.7561-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-6-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:44:12 +0800
X-Gmail-Original-Message-ID: <CAC=S1njBP2uhAgz8MOm5jxHHPb5M8=UaH8powW2mCFjBWPp+FA@mail.gmail.com>
Message-ID: <CAC=S1njBP2uhAgz8MOm5jxHHPb5M8=UaH8powW2mCFjBWPp+FA@mail.gmail.com>
Subject: Re: [PATCH v9 5/7] drm/mediatek: Add connector dynamic selection
 capability for mt8188
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
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

On Thu, Aug 10, 2023 at 2:16=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add dynamic select available connector flow in mtk_drm_crtc_create()
> and mtk_drm_crtc_atomic_enable().
>
> In mtk_drm_crtc_create(), if there is a connector routes array in drm
> driver data, all components definded in the connector routes array will
> be checked and their encoder_index will be set.
>
> In mtk_drm_crtc_atomic_enable(), crtc will check its encoder_index to
> identify which componet in the connector routes array should append.
>
> Move DDP_COMPONENT_DP_INTF0 from mt8188_mtk_ddp_main array to a
> connector routes array called mt8188_mtk_ddp_main_routes to support
> dynamic selection capability for mt8188.
>
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Tested-by: Fei Shao <fshao@chromium.org>
