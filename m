Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F49D6CF8
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 08:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1308410E125;
	Sun, 24 Nov 2024 07:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lVa3Gniu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985F710E125
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 07:44:47 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2ea68cd5780so2914735a91.3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 23:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732434287; x=1733039087; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aq2f37XpxmkvDg9k6RPxNwitNinOPVD09l4HgvPD3Nw=;
 b=lVa3Gnium3rZxuASaGMPxNDGo4w0qegp0Y5QqTLdchw/A9fv45Ja+Un+I7zfsz7PwW
 OotPJCZvsJmMCDBTUvurIdiom34BowEtyjVfQWBzIg4ZR95dIXaH00pSPvFbN4SUtvse
 vh7AVH6ZJmCjaeaaFS0czbO6mUHLeA01cl2UB4RgMISxUXi4rRuJmzpFl21i/xHQucCB
 3cIamzyguYJvgXtDq3A+a58iqgCYBVCtm+H02RS6OkvaFU7LlnOTEvUJMQ5JnOYc/nuW
 yGC8gu2OLo0JL10uqH7VGmoyqkqNkwJSpvNH2tzaw9fgW8hTnBRf/DrJmgRGPD/RFdnc
 Y/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732434287; x=1733039087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aq2f37XpxmkvDg9k6RPxNwitNinOPVD09l4HgvPD3Nw=;
 b=rYGy7KB8SJeDvlNMfsu7Ein54ASpqAdIsStxuhB/Q6GAiedLZUyq6bnoxH+6ffe9kW
 3aywue7NtzAnYc2kPlkZVMCvfprpUE61wRKb9cwC5paD3vsCiqeSYfA0aUfOJr4h2GAd
 tTYeZaT2Oml0F9XRw2Pw+7FHAvocYa4hAxRLyTHG/4W7TpXY7tOA5b83fYdRJIobhgAR
 R30xXlCi0pmKFcCuBCKH+hPaGHgRPciqhjfJcE3dhTmFLnSH9KXczPX9TrEv+71tgnAl
 0S3c45IaIyAv6V8cn9SjGwyuvOjsNWafDW/3kur8pFWL3MLY/SrcAK4MULesXC0LDuQA
 UC0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbvxKNOndC3uzcxsu3N/tbVleEX236AjouCFoB4oLH4CC13CzPqWAqthprNMseUOEsEXleJdp9r6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVm4gzqA6EbBDpOeJVOtKlrVjvcPTMOJDsCSl6ovv+D7qWfHK9
 NrO5wmQzdGbWaGkIfyHF9tAcTbXCjTeNN2dDV9YGn45mG+iy5Nf4
X-Gm-Gg: ASbGncsp0iYWeYgFI0LhbSWGPdpieItXloEdkD9aTc7XqauZcE7+0gAVcoLGe8CqmKT
 oF8xQ31Rj/39QQPjJU98CpZaAD3J9BfY0H35NiNZYY0yUf8va7SKqR7hBPjG4umkSrR1pfMXzXh
 PoUH5zRO064kTAQmRJytj7uzSU8UTV8n20AUyov0zbruO+EaYaO1RjrwKDmGdshVktNyJ0TgWIe
 /8El2cmuuhie8n5TBpAvYD0msuH3IDgNlbDFnG8IX1EOxz/klUKphl8/S22IsufvfOT2ks4p0U=
X-Google-Smtp-Source: AGHT+IGmkHiMH8U4JrZGmeZGNyxfAdia1O9NuHDN7UBXQpwBwxx7QaDqfGke2FmpU6dpMC+J18Wgmw==
X-Received: by 2002:a17:90b:4e8c:b0:2ea:525e:14a7 with SMTP id
 98e67ed59e1d1-2eb0e866014mr11327597a91.29.1732434286850; 
 Sat, 23 Nov 2024 23:44:46 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.219])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ead02eca46sm7870925a91.7.2024.11.23.23.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 23:44:46 -0800 (PST)
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
Date: Sun, 24 Nov 2024 07:44:34 +0000
Message-ID: <20241124074434.534-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241123223150.28d4002b@akair>
References: <20241123223150.28d4002b@akair>
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

> well, I think I2C bus runs at 1.8V, and there is IO_1.8V in the name,
> so vio-supply should be something at 1.8V, so probably ldo6 is
> vio-supply. Maybe add a remark in the comments. But then it might be
> not a good idea to turn that off in suspend. if the other regulator is
> kept on.

But we are not sure if it is the same, also I personally cannot test it
since I own the 7 inch version. Let's remove avdd supply for now and see
if someone with 10 inch version can test it again later. This is better
than putting potentially incorrect information.

> We have also the warning from dtbs_check:
> arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb:
> synaptics-rmi4-i2c@20: Unevaluated properties are not allowed
> ('avdd-supply', 'touchscreen-size-x', 'touchscreen-size-y' were
> unexpected)

Ah, indeed. I missed it, will fix it as you've mentioned.

Best Regards,
Mithil
