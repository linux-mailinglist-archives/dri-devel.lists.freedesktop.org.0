Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F2776FC1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 07:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176CC10E4B3;
	Thu, 10 Aug 2023 05:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E969B10E4B3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 05:46:34 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-403a85eb723so3552031cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691646394; x=1692251194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ixxcqOL2uF7LCUOvdRaIHgyC4OBsJP5mDbm84ewIiXU=;
 b=FF0RRhsaNB7/RzrIYnV/Z2NT6Iq8Syvm5eYE4UuU4Hrn2LRM08OMlgmDco3xoqt+4Z
 qJ2b0SIQjnNYRndeBAeQ3oZag/rMI280pTcMhRkVcRsZvPt9FA3YZpTWkL27KwATEWnE
 V/NlUwcAnxBh1nW8i61lggEUp6U8dRvQVxMHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691646394; x=1692251194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ixxcqOL2uF7LCUOvdRaIHgyC4OBsJP5mDbm84ewIiXU=;
 b=XIwnNXCrCPiE5HalL7z9PwV2WHJe6HHuK0kTAOBRetDXgc6SGAzb4m05I8m2O2UThs
 sSLHsGdQewP2sveiB+OzA4/+i3NHTngookC6zRV8d/1weq/PXgr+uU+DTqTbaahbN/6Z
 dn+OqglnqzbVxLtMGF6ZcYfOJXBOf6HLBJT38zZYCCAC40ePY3jEltCnzTHTxOKBRe/0
 XLClhjJXLf2A7Al9alSn3qXQJhbPPsR5ycsqkLpON4jLn7LljGw1xH4Vz8+g4wpDk7dR
 OpJ6iT56NX3dtTohUFweLUM8VapQywc9qnQ/fnGzrb7Bx9VmzQ75WG3V5WDGrScGGCLI
 LAyQ==
X-Gm-Message-State: AOJu0YyVaMm8bsGjbRgCepHNILiL4cF9KJQ1+k0ujm3IDKL6VnMo6TDa
 84jc3yd3BIjuKCcNyhQdmRFT0KnVC/HkG4Lgv5Q=
X-Google-Smtp-Source: AGHT+IFtCSCDl2ke2MyMUUHTMMf43Sww/K3Uybao4YOsU5aWrDuYJaCyQTG146cPcfM51WYT65+mBg==
X-Received: by 2002:ac8:584c:0:b0:40f:e7e0:95ab with SMTP id
 h12-20020ac8584c000000b0040fe7e095abmr2325476qth.23.1691646394014; 
 Wed, 09 Aug 2023 22:46:34 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47]) by smtp.gmail.com with ESMTPSA id
 v3-20020a02cba3000000b0042b14d9be7bsm215295jap.22.2023.08.09.22.46.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 22:46:33 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-790976d86a1so16863539f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:46:32 -0700 (PDT)
X-Received: by 2002:a6b:7301:0:b0:791:60c:4b4f with SMTP id
 e1-20020a6b7301000000b00791060c4b4fmr1873165ioh.17.1691646392647; Wed, 09 Aug
 2023 22:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
 <20230809181525.7561-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-7-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:45:56 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj2Z2Lqf9se1EJZx6P3LvyMamb_iCjeRokL2qD7ij-fsw@mail.gmail.com>
Message-ID: <CAC=S1nj2Z2Lqf9se1EJZx6P3LvyMamb_iCjeRokL2qD7ij-fsw@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] drm/mediatek: dsi: Support dynamic connector
 selection
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

On Thu, Aug 10, 2023 at 2:16=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add implementation of mtk_dsi_encoder_index to mtk_ddp_comp_func
> to make mtk_dsi support dynamic connector selection.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
