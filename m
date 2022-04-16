Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B7503716
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 16:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A0B10E5DA;
	Sat, 16 Apr 2022 14:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBACC10E5DA
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 14:22:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A2F460F4F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 14:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD1CC385A8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 14:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650118920;
 bh=AQEu64jaXboAv+zoYsgsiYMWLuLEVN/IlKXUW/p/mps=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E0cUbtpNFUtMtgLzUGDRPk1ps4WTOQ6oEsPx+kxBcp6AtkAxIZMJNc61Bmwu5BN9d
 7d9m/UE8LMvVLGmH3uqoqkkeTg1mUnbTzWuVHrDUFGINZetndpzYrFJSKtJRlTgZZY
 W20TnC595lz8I6gO6/TT14wcxLKlImcvaZhmligz/9dhvCVSgjM+6TNDLOWec1dQNv
 VjcUiv2gT2yv2EdPYRHdjkAdjnlQXYSg2ksm32u6ZjQR7t0SJO2IX9sLiN2z6SiKac
 /SWGtK25uh/IrA6XiGTY5BzUWNSixeZhMySR6VeNbsOygmK2eQVLxdA2hbAQW/+9i1
 RwduB5sdJ5rIw==
Received: by mail-ed1-f49.google.com with SMTP id g20so12870359edw.6
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 07:22:00 -0700 (PDT)
X-Gm-Message-State: AOAM5329T/Een1GAu66nsifsBOMbce7tuyW3fwlTyEjb1uHLc9QqJNM+
 EPa82LIHPwnX7U4moolJxSk58DAyeIdlGBCmKQ==
X-Google-Smtp-Source: ABdhPJxbmEV+hwk4GL9LWk4P/pzE9nAuwmYPGG4NNYd79+xQNfoh8INhSk/eBBi9Q4r3fxMonmeqRsOfHI+xYyVF7gw=
X-Received: by 2002:aa7:c38f:0:b0:41d:82c7:7751 with SMTP id
 k15-20020aa7c38f000000b0041d82c77751mr3960939edq.215.1650118919152; Sat, 16
 Apr 2022 07:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
 <20220411035843.19847-4-rex-bc.chen@mediatek.com>
 <YldWk9eTLbXBcbX+@robh.at.kernel.org>
In-Reply-To: <YldWk9eTLbXBcbX+@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 Apr 2022 22:21:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8j407wX8SEmK4rSfLheb4GQjQBJPyfXgy=5m+dLw7XPw@mail.gmail.com>
Message-ID: <CAAOTY_8j407wX8SEmK4rSfLheb4GQjQBJPyfXgy=5m+dLw7XPw@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] dt-bindings: display: mediatek: Update disp_aal
 binding for MT8192 and MT8195
To: Rob Herring <robh@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, krzk+dt@kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B44=E6=9C=8814=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=887:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, 11 Apr 2022 11:58:43 +0800, Rex-BC Chen wrote:
> > Disp_aal of MT8192 and MT8195 are fully compatible with disp_aal of
> > MT8183. Therefore, we move the them to item "mediatek,mt8183-disp-aal".
> >
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.
