Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D487B26992
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 16:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D10110E897;
	Thu, 14 Aug 2025 14:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dYEHhZwa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EF010E897
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:37:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5963245848
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002DFC4CEFB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755182260;
 bh=6LgA7GylOuPlAE7lu79YVHTi8yuQPdLDmvIbvtSdQ2U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dYEHhZwaqTvn+JVB6mm4v9XaReY5rHpHmGQOFf8SYbT89bKc7TEtkfLobwZgPwsTh
 Q8mqteXVXaJIxHbtt3D7w6SLYe2AtH57BH7/ZTAChtlHIaZ5ZBeR1674ZeuNCmKJom
 Y+mUmJ+7IfSe9+4ltrzqRmXIzvBZ5G1tk5L6osSysjTx2BiTfahYO3OjaiEzLmaXWO
 TfBMWsMCKqATB3RMznmnAFbtMkM6ABopqhFGae7zzeXfHKYdAi5yA3NpykFWbOcfkH
 hGesiqofVm88KmuqipturUX6w3ZOPTZNaWGeSkpnk3DfDuK1kvI6KVx3e2DCNMMXbP
 QCrDE8Tz1qIuA==
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2445805aa2eso9109295ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:37:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWnEnHVLurTU31rTuzjnWLdZ3ro4sykYS10LLbHJbPwj83jtqcBUhGNQeF39pOHldKYEtDrKu0aMn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsMhchfd/G8uA6Ohq+mOwdofiqQm9pHlvuOp5owrXFqUhFuDrR
 8bCvp+ma7DD43gthcxdg+mtx6cNclPOhOCoD3PVUBh9kNbI/cmmrRQ4Vb99O9geu2KJp9O7sjRi
 JX9/4pYbnbNK1fYeEvbOlRcszEY0uFQ==
X-Google-Smtp-Source: AGHT+IHS0uaP7CItqCto1gKq+ALdXQ8qoYfqn/fWbxiMih47HHTXn0CntaSCOaendxQ0HffHBSsodaKc4ysKqNiLXYU=
X-Received: by 2002:a17:903:2ace:b0:235:7c6:ebdb with SMTP id
 d9443c01a7336-244584afbb6mr45180395ad.10.1755182259487; Thu, 14 Aug 2025
 07:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHjEvi5mb+1-zD+x1_Bp_0Z2Aov7KDyFksbU4PZKFxmrPa77VQ@mail.gmail.com>
In-Reply-To: <CAHjEvi5mb+1-zD+x1_Bp_0Z2Aov7KDyFksbU4PZKFxmrPa77VQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 Aug 2025 22:38:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8L_tJwL77wqBVxrmoMLEGgXue8wW5dz8TLfUg4Ehn4dw@mail.gmail.com>
X-Gm-Features: Ac12FXzl572Bk8E1YjFThAkpLtwFo2QIH4KQyj4nJ4VDeDrZEEqFg_h6oT4-G7M
Message-ID: <CAAOTY_8L_tJwL77wqBVxrmoMLEGgXue8wW5dz8TLfUg4Ehn4dw@mail.gmail.com>
Subject: Re: Commit d6e25b3590 breaks external video (HDMI) on mt8173
 (chromebook oak)
To: andy@chernyak.nl, DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Cc: bugs@lists.linux.dev, granquet@baylibre.com, 
 angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Forward to dri-devel and linux-mediatek.

Andy Chernyak <andy.chernyak@gmail.com> =E6=96=BC 2025=E5=B9=B47=E6=9C=882=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:12=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Kernel 6.16 has external video (both hdmi and displayport-over-usbc) brok=
en (black screen) on mt8173-based chromebooks (platform codename "oak", dev=
ice codename "hana"). Bisect points finger to following commit:
>
> From d6e25b3590a0679bca1a1becc04e3999f1dfd461
> From: Guillaume Ranquet <granquet@baylibre.com>
> Date: Tue, 15 Apr 2025 12:43:05 +0200
> Subject: drm/mediatek: hdmi: Use regmap instead of iomem for main registe=
rs
> In preparation for the addition of a new version of the HDMI IP
> which will need to share its iospace between multiple subdrivers,
> and in preparation for moving out the common bits between the two,
> migrate this driver to fully use regmap.
>
> Reverting d6e25b3590 with "patch -R" on top of 6.16-rc4 fixes this.
