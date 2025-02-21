Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D072A3FCE0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 18:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3091310EAFF;
	Fri, 21 Feb 2025 17:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GzjWBLIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445BE10EAFF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 17:08:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CCB9061574
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 17:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF52AC4CEE8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740157718;
 bh=s5eo+jWFRpAipFm09lCIDLtuXzM+294r4TRujXXE5u0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GzjWBLIbRxpFtvcpYed3KJH5oTstoyhONMh/76infiaUq8+BKchsHfECQe7rxsIqF
 qFcpc8lIOphgU56JOdmPiHKujaATg0VW9uoRwxwBPQfyI3sPAXrly4pFA18F7KGWNL
 NwoG9XpzqWnq+f+a0L78ehWlYynKd4CiEsPHyaZrD4oAmPCR9IYJYgqMx1K2vds61F
 FEmTYM4LhyFNfXyTfRI0N1ACovuQO4ZA4AeXRs5g0uVERIQI+fDEDiDFZmPsvnKVm8
 pj9479jGjo1KY/PzySQYuxqdo61I+bvpRxMZCkBO3lFaJX9yUMRAOjxaBY5wzIgPsG
 yBAgKohor6mFA==
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5e0452f859cso3679378a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 09:08:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWwDoJ5Flsz6ZMNtnRhI1xQjt9Fg32e1RdYT7vBI9rvR3pT58gVkaq9fihJnGIVXTBwWRJrlSZX1v0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7mkezLrDgEk59wMYAXDiO3G5dkPNXAIl71AQ7D/uP1Lprie/6
 +ELhVTta3wWherIssoHjGZE0GsmhvhmSbqrsQATQnkBKpGbd9Vtj1FefLtawiaNkZgAixmL9yiN
 4o+WAOcryBkP6hRTtg1cyc+HrtQ==
X-Google-Smtp-Source: AGHT+IF3O3vdI8KmOvbFRUGPLCBofMuxQiMkHrsWb3wzJcHfb8wAPbp8iF9eEU1cB0o4czpk21gl9NW97USVLhVQ01s=
X-Received: by 2002:a05:6402:e02:b0:5e0:9ec6:12d1 with SMTP id
 4fb4d7f45d1cf-5e0b70f0800mr4060556a12.18.1740157716547; Fri, 21 Feb 2025
 09:08:36 -0800 (PST)
MIME-Version: 1.0
References: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 21 Feb 2025 11:08:25 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+4+=3ccuwa1whv+UQ56H6ueia4Mqy2z73M-5D15zZw=Q@mail.gmail.com>
X-Gm-Features: AWEUYZmwuM1JP26BKUCaWcwByGaIWjPB3I55aqksnOcD6mvIR49_PbC1vcSeCe8
Message-ID: <CAL_Jsq+4+=3ccuwa1whv+UQ56H6ueia4Mqy2z73M-5D15zZw=Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsc: Add MT8188 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, pablo.sun@mediatek.com
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

On Tue, Feb 18, 2025 at 3:04=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add compatible for Display Stream Compression (DSC) IP found in
> the display controller of the MT8188 SoC.
>
> This IP is fully compatible with the one found on MT8195.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml     | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
