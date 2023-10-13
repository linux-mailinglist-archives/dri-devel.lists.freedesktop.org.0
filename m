Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 916597C8DEF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 21:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537F010E027;
	Fri, 13 Oct 2023 19:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FD310E027
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 19:50:40 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32caaa1c493so1976016f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 12:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697226638; x=1697831438; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qx1cUFmw1hK7yZ7GcQrEKkBst8WaqJrLkeTkGMOaiTk=;
 b=O3IOqChVpHO7u+DWvAru+hoK12DgVqtzbQfJpp8mXxO0ajuMIqfDG+Y2kZLhhB5Fmw
 G+pFXVknvUwDeV1B9uPbn7W7z4mxF0O6Q2ukZsT10YJv1MSkYHd/m3Ag2gPo0Gj9ujVT
 7pZzigh6C5rJGlBSyFDVN37ao6ddlyt741R7xzp8/n+CqPlZlACm2VNx7t45O4qCp2yf
 ttd9PJ7WY2MAA+RbrpBVwCfROu34Khbqno/QDojpttqxrs5lCsAA1LJWGf9pPAKu6zKC
 9LHtDIYbtThQKD/2HFUg52KOTVciQNTtitq2MR2PQ/INtZtmy2fmriFmmKj11nY2XVSx
 Y/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697226638; x=1697831438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qx1cUFmw1hK7yZ7GcQrEKkBst8WaqJrLkeTkGMOaiTk=;
 b=EuTpfEWHOM5UH1jKH+8yQsE8FEvbo8sn7sPIzqlO7Ho2PhYPVp4456o9ZsLJmTVChi
 iQIInbgwYN3qhdVnGwCmNEcIQhD4e8ZfsksZh72SilUZOIGNaz3honUxehaV4QDsw8eb
 LVNHSHGmbtledweR84einPXGJ7F3KCssPnoO/TAOOYeoHnWcXvu9S5O8rpznPSFr7kJk
 nxd+e9khgV8j6XqV0aGn13TMdnDMT4Bi+qWM4LEDY4ZjCnvYUcTrESdRTMUCBAZFQoG2
 HoA5VyjqS88jfsrd+vLq41nkaQe0s5574tlw9cyZFfh15swSXTJCIqCMMBDKM3Q+5ilK
 stzQ==
X-Gm-Message-State: AOJu0YwLSoqUQF+KPVLLpCh+DLebzLlufacNh5lzOdTDGG3dJBpbq2Tu
 4xF6IFp1diJG3Io+p8wn/nU=
X-Google-Smtp-Source: AGHT+IEDQAlSWc+A/u62V+MvHuimTiaN8lp/uhK9NO20sm2kLcoQiI7ALC/bz4SdK9FhClHxBkqvfQ==
X-Received: by 2002:a05:6000:128b:b0:32d:9d92:481a with SMTP id
 f11-20020a056000128b00b0032d9d92481amr2005733wrx.39.1697226638285; 
 Fri, 13 Oct 2023 12:50:38 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
 by smtp.gmail.com with ESMTPSA id
 w16-20020adf8bd0000000b0032d81837433sm8698668wra.30.2023.10.13.12.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 12:50:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Date: Fri, 13 Oct 2023 21:50:36 +0200
Message-ID: <1773349.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <3cwcfx7fvtr75j6musdqttn6oto4wemsx7lh664gu3run6wxnz@5o5vao4wibm5>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
 <3441738.QJadu78ljV@jernej-laptop>
 <3cwcfx7fvtr75j6musdqttn6oto4wemsx7lh664gu3run6wxnz@5o5vao4wibm5>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne =C4=8Detrtek, 05. oktober 2023 ob 10:43:14 CEST je Maxime Ripard napisa=
l(a):
> On Mon, Sep 25, 2023 at 05:07:45PM +0200, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 25. september 2023 ob 09:47:15 CEST je Maxime Ripard na=
pisal(a):
> > > On Sun, Sep 24, 2023 at 09:26:02PM +0200, Jernej Skrabec wrote:
> > > > There is no reason to register two drivers in same place. Using mac=
ro
> > > > lowers amount of boilerplate code.
> > >=20
> > > There's one actually: you can't have several module_init functions in
> > > the some module, and both files are compiled into the same module.
> >=20
> > Yeah, I figured as much. However, I think code clean up is good enough =
reason
> > to add hidden option in Kconfig and extra entry in Makefile (in v2).
> >=20
> > Do you agree?
>=20
> Yeah, I don't know. Adding more modules makes it more difficult to
> handle (especially autoloading) without a clear argument why.
> Module_init is simple enough as it is currently, maybe we should just
> add a comment to make it clearer?

I'll just drop this patch then. While I think autoloading works pretty good
these days and cleaner code is nice, it can certainly cause some issues whi=
le
packaging.

Best regards,
Jernej



