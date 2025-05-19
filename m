Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02664ABBA9E
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E35610E1B2;
	Mon, 19 May 2025 10:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="xDDOOvvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA11010E1B2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:06:31 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-702628e34f2so36658227b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747649191;
 x=1748253991; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXJkgQZKayvXnZ1xyIN8JI1rxZodq0P8Qo6H5Ts8U1A=;
 b=xDDOOvvBe7b3TdwsL6SoF5mAD4UBeOeHl1O832TSG44oHM8YS0Ncj8t9AziCIKiB5C
 oa1q2XkahPsqMupT/5d7m8U4ZP1mwPdF2FTWlcystocoKuk1Qi272JTmU68GxBqkxiEH
 tyrROrsywRCOBWMoAd5tTzgF2vcyIArEUYIgJgFBGKGoFgzDZAUyOUns8c/wl/GDrrBE
 bhr63E18vUJZ6whJdGtRAXMegnyrqd1ZXRwrZiz7YyRb8hXbsLJTxosJ7NtFeGjKWVzl
 lYd1QkgaBNYZ3/qQSLym3OXS8P1XYDYI2VWkLCW8PtPmKSpm7m2UvXO9cfqU4FxlVh1i
 AoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747649191; x=1748253991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXJkgQZKayvXnZ1xyIN8JI1rxZodq0P8Qo6H5Ts8U1A=;
 b=pJCLCXDn0wfWgMg6P8A0UsKHpbAmvBeyqs/tIIB49F5FehpKtAn66JgVS3vUpj2Ob7
 RUax1Afl2J2UNVSmoQFgJTHOj05C3dp/GBytK69OCFzkusF9xGrluMN9HuYi8qzyQ9Ql
 TEFOYBsDB88d1lSOIuQ5A6mT6OBDG13PY8VPMxOvnUuAy64qO2LiUSXHkCQLeF8GkfNe
 q6g2IPvyp1j3ldJfBN8JgF4B9PCRI5I9XHhdLXOvSNB8rxPeAb8qznhkO6VnlBeBYx+P
 Kg7gAO1xf/gdTDb5ZgvX0HiIOnzQHVyRV+gOiDaiZj/ijQpqxmw9wvKXD/LSJwNv3XCR
 auVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVe7YrwvYfVU3COmWSCEKLf8fPaOv266Lx5uPrTB+NRKJRzAxMFsIhyiHdRCzkrn3b4AJhLs92JZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgGENMJ3OdZwK4bzsswdDOhEEm+y3nh03XKaFgv81hK38MJiAC
 nnN2Vbhf3l85KsBfsq+h8jHpqHpQQxA9/dBjuBc511E7YguW4FdBYt85TXrOBCcmU3SMNWamU5I
 vEfecm0HFwg==
X-Gm-Gg: ASbGncsrMD+Glq5R4SwoxprFTt1hnnvsW1n8Z1gv67rAfh2n00atyWPudqleo0QVK7f
 2hrmEBxISGIziGwEaPrwhBzadhJcn7z3KYWN8k6VlWhYr5RcG7jf996v62aw4WApIl78nDTsPrv
 kUAmoVY+7h6kfqXx7WTk5abBARhdwBrPxo7I3Ge8VxbbgvmgWZQFJ3EKTPsG1mkZ0itZLP57hs+
 GD4bVXKwCb8lDEplfE0nzxHa9exiT3rCzEVmjIjdAgted1zVQh/0hNhAE54XyPZgCLELpHANyAj
 BBMxDB+2PXMwLDWrZgVv0ckAXUKg+h9UldYHNEjtgF5ISgsrT6FCpc/aRhztn9Gs1vEkQ7kycaA
 nlC617rtQz5tbkQHqk50=
X-Google-Smtp-Source: AGHT+IEVMxG9TzqjFlFTtMMpgzaFV/AaXtzinfNBOK58LyVOAwkfeh/TfrjE126MuuHVQLz+vzjfXQ==
X-Received: by 2002:a05:690c:7489:b0:70c:ceba:16 with SMTP id
 00721157ae682-70cceba054emr53526017b3.17.1747649190661; 
 Mon, 19 May 2025 03:06:30 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e7b7b083448sm2329072276.29.2025.05.19.03.06.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 03:06:29 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e7b9346e748so953608276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:06:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUn5AI7DnSyIrEBO+v778K95u/QtTVaCx/+mQj+RBJxRHude/vQGkU7bWc9gaFdZh5jIqAsA52aB2Q=@lists.freedesktop.org
X-Received: by 2002:a05:6902:e12:b0:e78:f538:1c54 with SMTP id
 3f1490d57ef6-e7b4f7de9a7mr24227419276.4.1747649189461; Mon, 19 May 2025
 03:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
 <20250516-6-10-rocket-v3-2-7051ac9225db@tomeuvizoso.net>
 <4bd79c88-7da5-4bf0-9300-cfdb296c8919@kernel.org>
 <CAAObsKDsO=5uK3BEn6BOgatb+y73jc-Se6mmSbhwG9P_1nVtwg@mail.gmail.com>
 <f8cf2c4e-0ae2-4799-bda8-654b4f515846@kernel.org>
In-Reply-To: <f8cf2c4e-0ae2-4799-bda8-654b4f515846@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 12:06:18 +0200
X-Gmail-Original-Message-ID: <CAAObsKD_KUA29-FFGkCDifYJjaNnAbh9uZn25pWmVETSm10CTQ@mail.gmail.com>
X-Gm-Features: AX0GCFuVYFfDeK4R2yep7GIQJ3UmyiYoSLOyKg2oKJC5rUcszB1QB3rVi5LfFuQ
Message-ID: <CAAObsKD_KUA29-FFGkCDifYJjaNnAbh9uZn25pWmVETSm10CTQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588s
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

On Mon, May 19, 2025 at 10:47=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 19/05/2025 10:27, Tomeu Vizoso wrote:
> > On Mon, May 19, 2025 at 8:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 16/05/2025 18:53, Tomeu Vizoso wrote:
> >>> See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).
> >>>
> >>> This is a derivative of NVIDIA's NVDLA, but with its own front-end
> >>> processor.
> >>>
> >>> The IP is divided in three cores, programmed independently. The first
> >>> core though is special, requiring to be powered on before any of the
> >>> others can be used.
> >>>
> >>> The IOMMU of the first core is also special in that it has two subuni=
ts
> >>> (read/write?) that need to be programmed in sync.
> >>>
> >>> v2:
> >>> - Have one device for each NPU core (Sebastian Reichel)
> >>> - Have one device for each IOMMU (Sebastian Reichel)
> >>> - Correctly sort nodes (Diederik de Haas)
> >>> - Add rockchip,iommu compatible to IOMMU nodes (Sebastian Reichel)
> >>>
> >>> v3:
> >>> - Adapt to a split of the register block in the DT bindings (Nicolas
> >>>   Frattaroli)
> >>>
> >>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> >>> ---
> >>>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 85 +++++++++++++++++=
++++++++++
> >>>  1 file changed, 85 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm=
64/boot/dts/rockchip/rk3588-base.dtsi
> >>> index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..7b961ab838212fad8e4a7=
0390fdc917a828433a9 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> >>> @@ -1136,6 +1136,91 @@ power-domain@RK3588_PD_SDMMC {
> >>>               };
> >>>       };
> >>>
> >>> +     rknn_core_top: npu-core@fdab0000 {
> >>
> >> npu@
> >>
> >>> +             compatible =3D "rockchip,rk3588-rknn-core-top", "rockch=
ip,rknn-core-top";
> >>
> >> You never tested this. Test before sending instead of relying on us or
> >> after merging.
> >
> > Can you please extend on this? I have tested this series before
> > sending and I don't understand what you mean here.
>
> I mean exactly that: it was not tested, because warnings are clearly
> visible/expected. I also found now Rob's report which even shows you the
> warnings, so how come you still claim this was tested?

Ah yes, I'm working on those warnings. I understood you as saying that
the code hadn't been run and tested that it works correctly (I do have
a test suite that I run as part of my testing).

Regards,

Tomeu
