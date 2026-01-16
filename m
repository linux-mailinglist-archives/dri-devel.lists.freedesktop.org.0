Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB2ED2AB7C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 04:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E37610E056;
	Fri, 16 Jan 2026 03:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IMN+Vh2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2326710E056
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 03:26:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 98D9543F81
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 03:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B91AC19422
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 03:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768534015;
 bh=fL5JEUdugUywOgfF3xS/1Yv5nBNWIwQ+xgwU4aZe6jw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IMN+Vh2rcuaRuzVSTA/fpzdCaDamxcHLJsq2vUF1GBizZflEBpSxLusCzExokoxLB
 N3uGszAg1JvlIQPhxmv5aKNlx7FPly+tGJleQjRABIu+1TETR5otFEugenRNkQ5K3Q
 sxcwh4HlomHuV85WZaBREVI2JtT/29DBrc6lM++RdyOJIwoVG0D/S2ANGPR2x/AdL+
 8P6Ij27fveW2b2NRpDVUjRq7u1nb9Y71V1YoSB6KtsAV2Y22nmo57mBPlwOOwdwIxM
 /jiH+9a3OjtuQIpWK8wBPPlSZ8mE0gpjv9u6SCEV5lDpSaIoI/XCGLDhonIVnEYquy
 TRayhdVDfrxNg==
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-64d30dc4ed7so3196736a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:26:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUH+Gzv4pSZb5YOuvCn8sUyl89HK6LeEtQx5PJIGX6cflcfV4EUnHrtUS2cY7wr0AZNrPq2tiNQr6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs/Mf3QN3Qpnswybhuy8bHHGC1icpJ2CDt+yTXP9ylDjJtIbPn
 HKcVciVATFr/vJtdrAhIqIFqCe8+y8E7gReKQsRyEWlhO2nOS1ux4u4ZUSTaPfNObe1mleDnyjz
 /4y0XaebZpd+HsPHMAA7qdDwcuAMCAA==
X-Received: by 2002:a05:6402:358b:b0:64d:1762:9ba2 with SMTP id
 4fb4d7f45d1cf-654526c8fdemr1205981a12.13.1768534014112; Thu, 15 Jan 2026
 19:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
 <20260115174047.GA930768-robh@kernel.org>
 <85ff0eb2-d942-4f85-8f1d-c5982bd31bec@mailbox.org>
In-Reply-To: <85ff0eb2-d942-4f85-8f1d-c5982bd31bec@mailbox.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Jan 2026 21:26:42 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+ELqDhPHeSL=Hybaihmj3QbXt3VmrJ2tC8iXvdoVFNfQ@mail.gmail.com>
X-Gm-Features: AZwV_QgG6kq5B06g-etlYhXpjQuBrn8cB9pNEEXLMMNB0ZA-HxranZ5k8pyuI0Y
Message-ID: <CAL_Jsq+ELqDhPHeSL=Hybaihmj3QbXt3VmrJ2tC8iXvdoVFNfQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Thu, Jan 15, 2026 at 1:20=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
>
> On 1/15/26 6:40 PM, Rob Herring wrote:
> > On Tue, Jan 13, 2026 at 01:05:30AM +0100, Marek Vasut wrote:
> >> Move the Waveshare panels description into separate document, so they
> >> can be properly described with compatible =3D "waveshare,...", "panel-=
dpi"
> >> and attached to "waveshare,dsi2dpi" bridge.
> >
> > But why do we need "panel-dpi"? Adding that requires changing a DT.
> > Can't you make the kernel handle these compatible strings as a
> > "panel-dpi" without the compatible?
> I can, but wouldn't we then miss the more specific compatible strings in
> the DT ?
>
> compatible =3D "waveshare,13.3inch-panel", "panel-dpi";
>               ^^^^^^^^^^^^^^^^^^^^^^^^^^
>               this ... would be removed. Do we want that ?

No, drop "panel-dpi". Or really, don't add it.

>
> The other option would be to add the timings into panel-simple driver,
> then we wouldn't have to change the bindings at all. Maybe that would be
> preferable ?

Why can't the "panel-dpi" driver match to"waveshare,13.3inch-panel"?

Rob
