Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674EE9FBCEC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 12:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9437610E06A;
	Tue, 24 Dec 2024 11:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VhSxux5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BDE10E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 11:31:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CAB895C5CA2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 11:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC80C4CED7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 11:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735039904;
 bh=03ARuXNN1LYC6Y56lO4Z0KutZ2KDzQyEBAbl6atBMq4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VhSxux5OjALWeX9mJiVMA1KmH3gKWvY+37UDf0WLo2/An4aMSHs12zWW9u5uYHdtC
 xsOMmh3QAC8HKxB0/zvHtlZILXhAhsEmzJGJceH9eczG1gLGXemamg6GBdW2OyrXcb
 P4JhHTHiuOcsma/8QJXTgqdMPbt3qeQYlwFD/WNt/MMUiNio4iYcVOUX9KhW5CN7wf
 AY8SyTfbZw35bw6LkY07y0CGwVaHljO9XtZwYjtbzqwckaG+cx3OXSWAVma3yXNV5p
 jvg9dPkTLOtjHIXpAoTNO4sLNJSKupH/um9bt7bQxbmG+NqCnZU7+LwB1+JoIevYhj
 HYtzM5wwESR/w==
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2166651f752so55983365ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 03:31:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVaVbPmZRwPcDfqEL8kaLUcWNOdbdpkC6zC9tzA3aCWBEk9fBvRGcIevh9Cg0w3CyuqBKKHcUV8x4Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKNJEU5N38hs7jEeVmt5NwV8g+Gdb+YZZjHpmxsqZP/PgJzW9t
 I2VyvyvEsQw6eVNsfMwPoqPAAO+2lwsOo2PwaG3hr+d5hEZXmdhAmq2Yi+dvuNqG+XKV9Qn4dQ6
 M2EENhGVSgWmtdTF/FfdHKbUGuA==
X-Google-Smtp-Source: AGHT+IF0Z2A1ZpCpDpYV0wej1AcD2Tjd35Ya5woNBEnskBD/S7v7TPAd15rnS+ywO0yVT1bM1GTtN5IF4uyo/ZC9CPI=
X-Received: by 2002:a17:903:234e:b0:216:46f4:7e3d with SMTP id
 d9443c01a7336-219e6e9fa68mr217969135ad.15.1735039903928; Tue, 24 Dec 2024
 03:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
 <20241219181531.4282-2-jason-jh.lin@mediatek.com>
 <6cbe2f57-a63e-4993-938c-7696a869dc2f@collabora.com>
In-Reply-To: <6cbe2f57-a63e-4993-938c-7696a869dc2f@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 24 Dec 2024 19:32:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8mUutkz+q4-JggbmQRpNn6tukM_GuQ-0rwVRCoOd0mGw@mail.gmail.com>
Message-ID: <CAAOTY_8mUutkz+q4-JggbmQRpNn6tukM_GuQ-0rwVRCoOd0mGw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: mediatek: ovl: Add
 compatible strings for MT8188 MDP3
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Singo Chang <singo.chang@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
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

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2024=E5=B9=B412=E6=9C=8823=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:=
12=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 19/12/24 19:15, Jason-JH.Lin ha scritto:
> > Add compatible strings for the MDP3 OVL hardware components in
> > MediaTek's MT8188 SoC and it is compatible with the existing
> > MT8195 MDP OVL components.
> >
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@col=
labora.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> Waiting for an ack to take everything through the mediatek tree :-)

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Cheers,
> Angelo
>
