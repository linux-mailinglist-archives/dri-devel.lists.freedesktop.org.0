Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281633957C2
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 11:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14CF6E4A1;
	Mon, 31 May 2021 09:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B334B6E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 09:02:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c3so10100723wrp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 02:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7rJplqz1B4mRiJ2dwI16PchKlluJ50WrZ1kh7PRVcNM=;
 b=aKNnojQsHm5Q3sD8Wo2gfxUH7swgBb4Bj0od5iCRSO8CM3Nxx2KbzkaeRqxduWqJAX
 jrMzdo7iu0nGGpvdTiGrI1CNo3XfXKBOIwYt/4Dl4mUegiB0JGN6CtCBHiu+avkWmDmk
 03zwXdkNrNwg3JCSkBilIEJtPF+IkfYDNJVTfLh1Go9e7ZCmoY9H5ZKxErp6s36IQ61U
 kvGC9Hz77AkQgnhW80bUUQy+fziEX69/rcSlf5ISJPtRuqvdmD087BuM3k57m5GeyMVa
 Hr+6qlcwef9pTriNBZ0z5xZG9+oxtCcvR466P2I3aOw+WbznindftPNsU+2CcSqXbqoS
 gDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rJplqz1B4mRiJ2dwI16PchKlluJ50WrZ1kh7PRVcNM=;
 b=MuSWgFt0EGQl0Whpt4NMdDj4IXHa8rlWuWj/AsVIqnZyxFpAMp1kwIkNPkml0Y0Ov9
 kQO6Sokfubbz+uxl7pToMhqNI9fG8qipkbPBz+DjzH2SLVMV/p24JTSNovVVimRtkRIB
 xmMocmkJ1gl6qzoxCKppn57kjQcVvDI4al0sDPzQ1mE+gWhB1+FaDD6aWwLlIMQes2Pk
 Tpi1UGcbJrvA+j9Bh/5Y8CBu/mmi9J4MdRwq4fRHKD4mWRMHp51Bxw5jvYjX4XnYbyzz
 syTKwbIDp30JBnLYuVV9oupkm6h99+4LI4OFpqJAKWqZMYjTqMbncMSXvY5c+XF0F3p1
 f37g==
X-Gm-Message-State: AOAM533naE4WYBt+SUX7GuUeAr4n+5Pxy859x/xyz34YkF+qHQGDCVj9
 R3/dLvm6uYnCrLnAm2d4HEI=
X-Google-Smtp-Source: ABdhPJwlR3gPlkmEtFNoXZ53E3/8KCC8B/9daZ0DN9jGxvzNDIv6mRFag2NXf8DL4r7zxGRSdAJLtg==
X-Received: by 2002:a05:6000:1147:: with SMTP id
 d7mr21577790wrx.302.1622451731364; 
 Mon, 31 May 2021 02:02:11 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id k11sm22383677wmj.1.2021.05.31.02.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 02:02:10 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1] drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT
Date: Mon, 31 May 2021 11:03:44 +0200
Message-Id: <162245181129.52988.11893553794139124150.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210530195506.19124-1-digetx@gmail.com>
References: <20210530195506.19124-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Sun, 30 May 2021 22:55:06 +0300, Dmitry Osipenko wrote:
> The format modifier is 64bit, while DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT
> uses BIT() macro that is 32bit on ARM32.
> 
> The (modifier &= ~DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) doesn't work as
> expected on ARM32 and tegra_fb_get_tiling() fails for the tiled formats
> on 32bit Tegra because modifier mask isn't applied properly. Use the
> BIT_ULL() macro to fix this trouble.

Applied, thanks!

[1/1] drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT
      commit: cdbbb5978467469a2ee2311ef0efc407f8c0bfea

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
