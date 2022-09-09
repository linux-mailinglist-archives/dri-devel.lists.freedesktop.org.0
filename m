Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E595B3675
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D5B10ECA8;
	Fri,  9 Sep 2022 11:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6E910E008
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:36:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b17so2269750wrq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=r8mobWkTyzIOZd/u+mLE5rL/ZYzPtNDIwhda+4LVJMk=;
 b=FfRoEBYrZhDLWhHbT/0GTGwWh6QTJRP4by803RrvZQgWa0rRmyLp4SckrVqBiy4ia8
 jRlK2QLx20mQWdyheQzfmjYSZKdo8Rs5elNTyp/Y59q3fQjphEuinbwlh5hoURa5JHX/
 ZXzlhYlIjIrb0IRxZrydxwc6X3Eyv1o+WEnGC6vJVwhZLLcvzuKQa0Hv4lpkrnT/RiUf
 ligQGPkII9ylgDm3gQKJf4dXbUdr4b5XJSbFOIYXmDtC+jOWkFsjjqb8BQTt1gsg/2bn
 zvP+FHlg2RsCPHjMqoH5KFr3w/LPWTpiZrUjlII/0ajbr38jrNPCE4WbKmUgmAkHaLbb
 RzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=r8mobWkTyzIOZd/u+mLE5rL/ZYzPtNDIwhda+4LVJMk=;
 b=XLrlETne5BarciDdHQaqgtBLhDL5LmvpDRHA/gcKv1czyuOm0jNlgRRdwKrHbr+Wbi
 ydJHlGnOMwNZbfLXX7/zuF/z46NdGkxvKEPoSnFPgWL9dl77iJ6akA71jCK+9Yg3mg3I
 2JmVdXLsSrcjJrSz15VrJbPPIMmnQ9IhCNhcM1iyvSRH8W6AZ8Y+DblNY59NvsMNdYGY
 YmpObr4h/8ymc0aypvCvQ8y1BkdJX2YdSCr8F4SC89yGpqxpGRYOmaCW1w6sTORuJjlU
 zW3O7iqgEXPiAr76OnO7ugfUeqCIMXzPo3e+iNK5zofr5lNv1AmbvYmgZYkap1ndiG+8
 HU2w==
X-Gm-Message-State: ACgBeo0yAyIEt1fydyVGXSJwp2WChQRD4gZdweweGupJpZE/cEsRAhG7
 TyZcdYbRQy4VEMKuH7Ouas1yZA==
X-Google-Smtp-Source: AA6agR68NtvTror9rRcuTLe0sQsLweBMIGhNfQGRdrrp5l9KrJzK7pkPLvcfWaHoT2JgwWB00Jy/0g==
X-Received: by 2002:a05:6000:110e:b0:228:c336:b1db with SMTP id
 z14-20020a056000110e00b00228c336b1dbmr8114208wrw.194.1662723385165; 
 Fri, 09 Sep 2022 04:36:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a5d634e000000b00228da396f9dsm272862wrw.84.2022.09.09.04.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 04:36:24 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: Re: [PATCH] drm/meson: Fix OSD1 RGB to YCbCr coefficient
Date: Fri,  9 Sep 2022 13:36:22 +0200
Message-Id: <166272336889.954213.13842769186384631915.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908155243.687143-1-stuart.menefy@mathembedded.com>
References: <20220908155243.687143-1-stuart.menefy@mathembedded.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 8 Sep 2022 16:52:43 +0100, Stuart Menefy wrote:
> VPP_WRAP_OSD1_MATRIX_COEF22.Coeff22 is documented as being bits 0-12,
> not 16-28.
> 
> Without this the output tends to have a pink hue, changing it results
> in better color accuracy.
> 
> The vendor kernel doesn't use this register. However the code which
> sets VIU2_OSD1_MATRIX_COEF22 also uses bits 0-12. There is a slightly
> different style of registers for configuring some of the other matrices,
> which do use bits 16-28 for this coefficient, but those have names
> ending in MATRIX_COEF22_30, and this is not one of those.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: Fix OSD1 RGB to YCbCr coefficient
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6463d3930ba5b6addcfc8f80a4543976a2fc7656

-- 
Neil
