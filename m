Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD959D6B15
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 20:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EA110E25F;
	Sat, 23 Nov 2024 19:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eKb4+iX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF1910E25F
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 19:26:46 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-723f37dd76cso3159052b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 11:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732390006; x=1732994806; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKFqWwSN5qTyHdwloGljW7z+Rtw5u2QrsWqXju4EFjo=;
 b=eKb4+iX0fmrjNfAsiH6Qiv/OJVisbJOHRboQn0NZzzoAHIDmIEDfMKGMw373QpSjrF
 jGUV70BVNkz1G9RlGN0IXowujelENd44+CFld3VSE0zh2wBRjMxiRoRPVr4he3XAYC4T
 4sqh/Juc7S0ncFd2jwyqBMiMt8PsP2J3eMytW/uT62zYj6Eydx7LeOAKI6v5jYNm1rYH
 xwe1N91HFozv5N5FdeCTJRM/Fy4VGhwfXCihGOHHtnPpBPbDH2J9pufBYlRXaOvVWzb4
 Oy+tQKrDzkc+bNvgQYtvUjB7qmgbgXzu2dhz2NNLmwQXwEkC5NVBcodgsWMXCwxR7YdK
 HAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732390006; x=1732994806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EKFqWwSN5qTyHdwloGljW7z+Rtw5u2QrsWqXju4EFjo=;
 b=Q3F5csueYbsv2uDWXTlS8nJBK4rz9coSdbCXLo+f6+vmk1gcs/9MRtDxqeZjCxJaAf
 Afpf5XycjMDigRiZc95Usfmpm9HWQjSVG2BGsSUBfLMMm9TT2eW4y13AgIB1G5Rd7QXw
 cqCr+2OdaFvVdCmeZy+ISsax5l/z37UkOVEE4h65NIETJeRvKTlWE+zGP/741axgsc3e
 uPZ7m7erNhdda9G41pg5LNeEoudG0qcPGoDj5FtTCnyQ1bs5n91/CK+wALJejz50CZda
 n4P5v/2pbjFLSPdsxQlk7AOWqjhY8YWhHngMjGoSck1oM3lS4T8edCDgPxOP9JYsqShb
 18lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU2zWQgdhKkONBdCf3M8XO9pSY2wEy4b4zMtOZfF81iEvvyKIgrdxBZUbANU2x3yBPwuPBaKJS/6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl6UhaVSf6ErILgZUNLDYVxDqJNmGSH+Yfqj8+yngCVlfH44PG
 IUaDJYeRDeCMXy715gUCte0Bnier+vhQM45U6qsXIxXLG75mxaZf
X-Gm-Gg: ASbGnct0l3317vam8xuWRSWH9QUpprC3V/F0tv9gp/x6vkqSOv1LRJ4r8E0a+03hKTg
 5xmxxgMYcedGi2QquS9KmOGiVDLedeawAFmVhdopw5CMUDNLDd8KIRmyaoOAl6BsUkDLfsqCNUP
 pbofZHXzXZAWR4n/54Y0PDRX6CZLGYo+OJq4z8K4Z0IbblJi0C3uaZau6wIEr/e8UBqCqA2hTPw
 /skCwLKfdxVfhzRG5Edomj6YPO3Dgk8vJFBUjRMfFXwGrHwLwwtG9iauf3GTy62NTf22aUA29c=
X-Google-Smtp-Source: AGHT+IHqe/epLud/t0Z0A5XPkXsAE+8YfobMQ1Kd10MhS+puwhDCWnm4VHQZFS7J5N/OC/pbwoUcwA==
X-Received: by 2002:a05:6a21:33a2:b0:1db:de9a:bb01 with SMTP id
 adf61e73a8af0-1e09e5d90femr12799969637.40.1732390006051; 
 Sat, 23 Nov 2024 11:26:46 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.174])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fbcc225e45sm3689734a12.42.2024.11.23.11.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 11:26:45 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: andreas@kemnade.info
Cc: Laurent.pinchart@ideasonboard.com, aaro.koskinen@iki.fi, airlied@gmail.com,
 bavishimithil@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 quic_jesszhan@quicinc.com, rfoss@kernel.org, robh@kernel.org,
 rogerq@kernel.org, simona@ffwll.ch, thierry.reding@gmail.com,
 tony@atomide.com, tzimmermann@suse.de
Subject: Re: [PATCH v3 10/10] ARM: dts: ti: omap: samsung-espresso10: Add
 initial support for Galaxy Tab 2 10.1
Date: Sat, 23 Nov 2024 19:26:33 +0000
Message-ID: <20241123192633.2049-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241123200202.684d8bc5@akair>
References: <20241123200202.684d8bc5@akair>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> well, look at the schematics and see how it is wired ;-)

Schematic mentions vddtx, vdda, vdd and vbus, so unsure about that.
VDDTX is the one with 2.8V, VDD and VBUS are at 1.8V and VDDA is grounded,
it just gets the input from GDNA from the same touch sensor.

> As the vendor kernel seem to
> set i2c to gpio mode, so probably because the vio-supply is powered
> down according to the board file you posted.
> So it might be vio-supply only or vio and vdd-supply combined.
> In any case document what you have seen in the vendor kernel.

https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-input.c
This just makes it more confusing. Very confused on what is what now xD.
reg_touch_ldo_en is 2.8V which goes to VDDTX, it is gpmc_nwp.gpio_54 - TSP_LDO_ON
ldo6 is 1.8V presumably ldo6 (VAP_IO_1.8V) which goes to VDD, VBUS.

> basically says that standard touchscreen properties are accepted below
> rmi4-f11. 

But we do not use any of those properties. If you're talking about the
touchscreen-size-x/y, even in the examples those are out of rmi4-f11, in
the parent node.

Best Regards,
Mithil
