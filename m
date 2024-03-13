Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5490A87A3AB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 08:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063C910F2FE;
	Wed, 13 Mar 2024 07:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TTyNetms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4179510ED65
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 07:39:34 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a4663b29334so1398666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 00:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710315572; x=1710920372; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
 b=TTyNetmsfM2BTIeELtxMDTh0IWzfFg+kaCKObsFjWnSynqldFQ1Ijh2p5ewT4eah1F
 5gGKhNdI/ZTcBJfUwzPTULJsiGPhrdTdaubrth9dJxyhtIOXrofl/C4y1Kniq5UMu0me
 DCVFnyTFRF6RSy2UNit62edeERwid47D9k6AghqkL0HSPJ/mIlEC93hOFPtOzgQtaz9C
 OL7HiJWYW2szXUlArV4+szBp90ibEw08gXhUIF2x1FunbEu6Z7z9lvP5ZkrPcE52Rjdh
 Vm66dffeuujcQ5Hhvy4hcMjt4mSlDrwvrCigc9BjOcyqAMSN9FP2SYRO3nuxCawCa89C
 ILOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710315572; x=1710920372;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
 b=Lf4EOMEcLeXAPMWON+jY1TXs6zNE68uja8EkVCLC4wLjhwFBywig2R0bpgc5GQUZaB
 QCrsnwOf9JFtMoK2nIwUGECmLi786wXlR3Q+UbePIL+Li9XO4202omEf+eU/4H8eP+c4
 Mm0uFiSkOrvj+HjSkRUPWENQxYxRoRq7oIjXsLI7tY+Jqb6y2iTDsDmeFC8tOH6f44KX
 XzESpoCHESaUTMTI7dJKtofPNIkDqGEpWs/ofwmGdLoJXSiOQDzDLONITXPCRFoVlPjU
 Xe9dxiZtkvbGkdj9fZLDTseo6ws4Oly7nsbclAAHc1M91aWEOidwZxu6UjCdCbA/SQKf
 wlAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfbQv/zN1B/gVPoGBm6tqu8zRPwGnBFHfE/IeZTUx6iA0SfSwO45RyW2Z+JN3y97oFiAYFA7W2lJW/3nIkceDqFM17atPPn1MbG4fTrdD8
X-Gm-Message-State: AOJu0Yy4VfoOY6yDBINXwe7lp6KR6xvRbV2GTH0NzT/abHbMLutxz4V9
 n51jRCbr1HO+fdpae17JZdSuoIuPl5AEmiMfn9foPPTk3w1gXIwQt4FQtTkzEgw=
X-Google-Smtp-Source: AGHT+IH38GneADkyKtRbEkb8+HLK5ZsZNpyhD22lE4uk6eUmiwmdHa00scLatPQEFNYx/T2Y2VkSUg==
X-Received: by 2002:a17:906:2ccb:b0:a41:3e39:b918 with SMTP id
 r11-20020a1709062ccb00b00a413e39b918mr7484516ejr.24.1710315572226; 
 Wed, 13 Mar 2024 00:39:32 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 qx26-20020a170906fcda00b00a45a687b52asm4578781ejb.213.2024.03.13.00.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 00:39:31 -0700 (PDT)
Date: Wed, 13 Mar 2024 10:39:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, netdev@lists.linux.dev
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
Message-ID: <43ef4ef4-303b-45c6-aa50-3e0982c93bd7@moroto.mountain>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
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

Thanks!

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

