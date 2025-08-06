Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5CFB1D30E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF0C10E7E6;
	Thu,  7 Aug 2025 07:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EqsCicAN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6178610E131
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 08:01:54 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-61589705b08so13786743a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 01:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754467313; x=1755072113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6iCzFRU8kKIqKUJirQf+HWWFYyGorAzIYLXfyzdGgPQ=;
 b=EqsCicANTiE4UL6jcWWOS0YyrCuEHRUbvSKUKiyPB+ZEFih6Qw7+DCZVXmugZMfvK4
 RXgbhCsPSl7bSLWUhhNle5GcLKLuuPa1+i0JgRJBQaqhlTPqIFer0x6uv/Od4DUJJGsP
 35BaB5mX7NVC+6qK581cRSBIXDgCFFZBl3iDbBpjNindivYt0SxdFdXYh9VqNLG2rYfD
 ysx3RZRMaChzInUvoiBgetk3EUtN7NoPGO8OVIbbilJPzPiFHe6WmCiFHbosQ0zmPA6Z
 Ys1uQwhdSARrrI5GLtS7vkcJ88YJes7RkDB7JhdrrS+mKYJQsDJWKwQYaXIX+NztSCXZ
 xmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754467313; x=1755072113;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6iCzFRU8kKIqKUJirQf+HWWFYyGorAzIYLXfyzdGgPQ=;
 b=fI9cJg9ih5agvEArgNsuQ5qk6fvFVtibYVtmEEppNPcfSsfSknwHC074NLb5uzERUg
 VRNdtYEE3Fk+U4X545K3tYAYrLzzvgOZNYzt0KRMjyVoaCIX2utxspfUGuWn9VO2jxeW
 yloBQYxj5iFUfdHIhCmSO/bOXV+OU3WmnR8gPVwcZRTPU4b0h/gckGMZLGggM/TgXE+e
 l4SRAeW4odcQ97mEg32MblEVBYh/WLSV56p+U+2n0MKI/VkA8EAsdW+PH9Y7F5woVvw6
 v/SX46vC+6uLisjSiqQF8T/oBY1ULpu6oowhIQK0wecW23GrE1Y/eth9JjRWFKDNdh1Q
 ydPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAmU6EIgVHoa9kMZGTdaSnclQHA6xV9QNf1daEsxE3jMERVfszoFW1dUuVUFOwC5VytowNd+2kQtk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC+VUoBY+qfxAOywqKaI55jIh7jx1AW5gcW7qu8QwONhE+tsug
 FjhacA08wYZJFNbTBU5Avj59OaPt/fI47CGHTQR1h2P/nyenVceMo7sVCpDPIAabx2SU64eWU8+
 akAfv4inDbgy5lBjHm9ngvR1dBEHkr+o=
X-Gm-Gg: ASbGncs8PYRGJ+TNOY9hYiNSXta/laL6q4NAWHCQxf+HQlPAPAnjKAFaC/V1PWOMIuq
 AnbsJVk+fx8QWMq4ajOYeetD5N2i6sB5S29MNhbrkjsR+O24VlrOqQEfWjrPQRVYIOrUGHd+b+H
 6176SpHAAV8CXAixwBcAqmIWYORqR/8QAf9uNt2LwA65+yP41xn/rp+t6ChsTnl/56lGaq+wEfO
 hDOr6m+0fW0uwL6QqlH5pPL637Nag==
X-Google-Smtp-Source: AGHT+IFLnS66PAFjbYXbRkE65+dBg7IT74rclUu90hts6vAYoZ9fqvLM2kqGkYBQPfmT60uh5xRuPSJY4tL4HkJ4oXs=
X-Received: by 2002:a50:baa6:0:b0:612:bfb2:386 with SMTP id
 4fb4d7f45d1cf-6179617bfefmr1195837a12.28.1754467312584; Wed, 06 Aug 2025
 01:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
 <20250731-ums9230-drm-v3-1-06d4f57c4b08@abscue.de>
 <175424000200.522677.10470224183997281701.robh@kernel.org>
In-Reply-To: <175424000200.522677.10470224183997281701.robh@kernel.org>
From: Cixi Geng <gengcixi@gmail.com>
Date: Wed, 6 Aug 2025 16:01:15 +0800
X-Gm-Features: Ac12FXwuP9GqGL7vRUeucDLGxlVViCM53h0qDTc6CYWtwi-PmaWkTPBHQBO-hmA
Message-ID: <CAF12kFsczEgNWY09A8PCSyVqSGwQ0xHqxthrqoHfX20q8x3HFg@mail.gmail.com>
Subject: Re: [PATCH v3 01/16] dt-bindings: display: sprd: adapt for UMS9230
 support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Kevin Tang <kevin3.tang@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Kevin Tang <kevin.tang@unisoc.com>, Liviu Dudau <Liviu.Dudau@arm.com>, 
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 07 Aug 2025 07:13:37 +0000
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

Rob Herring (Arm) <robh@kernel.org> =E4=BA=8E2025=E5=B9=B48=E6=9C=884=E6=97=
=A5=E5=91=A8=E4=B8=80 00:53=E5=86=99=E9=81=93=EF=BC=9A
>
>
> On Thu, 31 Jul 2025 17:51:14 +0200, Otto Pfl=C3=BCger wrote:
> > Add new compatible strings for the DPU and DSI controller found in the
> > UMS9230 SoC.
> >
> > Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> > ---
> >  .../devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml         | 7=
 ++++++-
> >  .../devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml    | 4=
 +++-
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> >
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
>
Reviewed-by: Cixi Geng <cixi.geng@linux.dev>
