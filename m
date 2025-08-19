Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01676B2BD8E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7602410E230;
	Tue, 19 Aug 2025 09:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d1dqfpzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12ABE10E230
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:38:18 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b9d41d2a5cso3725968f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755596296; x=1756201096; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CLBxZ2XFo8q0Rxn5F959lMnUzEFlfrmKWedQTzD7m/w=;
 b=d1dqfpzFyW3aoSQAdA2nbqjmcyd3CPFzHdiHn81sN3XGfhCV8eMazLNBwdKYca0UHs
 dXr/qhhmkY0iCWq0yWsaLZUlAWTmeXvpLKCDYGnku5uM6OtYNxCsOFMdyVoNhmSa0W8a
 2bQ9gqFgGqZ4CP7WXU+OG7hCQZN/5UlHHBIcS+fzUy57XPHOYr9ULNlNoy9OF+Xvy/7Q
 uevkbxJbM1veOhUml0PUC3FuNRooiA2OrB7XXmTrhIgEnHOKviqznmeV1fjtkY5XxsMh
 M3ecQ7/V0FC1hLOBhoFzdCfmgwcwuK28vQrQjdwyCNLKRdIu7GiajcnWtdKAc5QFBD5n
 Lkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755596296; x=1756201096;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CLBxZ2XFo8q0Rxn5F959lMnUzEFlfrmKWedQTzD7m/w=;
 b=ofv+T0YIbLJg61XXGa26y0veWZg9A0VSYfFlM5cJqY6Uz3xn/ua4Qu3FR+RfD5quVd
 xxKYaZV2g3qRcpB3lqNbDH1pLqsbhMldXBsEdqyKsO6GBYcJ+9zWiXsvxD8+FBErwjuT
 Zv2V43sF9vqb28OerklulX5MN1uK0+krOAbNsl8L/CVU7D45MOE7hVZsYVcULSkm80OL
 yKeK+e6JXVLLxv3mvcsnfjQ+hPId3oNwyCxvHj9JzbovhPiDaPdzjlq++NbzBnenfbAY
 hVosiWDgsxc+B2VEg3kaxjtB+WAbzbnkZOJWmDoyatT8j9eyfbs+yspxsn6KTQf1HPW/
 OzKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCP2Jpomf3rfhXAbIRmyL2QYGaFDpN7rlMvk2m1BgUPJlTLBxS6jSnJXVG4f+WcXcfawYs+a0ByB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKqEIHR0lhcZsNLl1+5+8NvFl/marPJnN06tK+Ce9IHkrKmsdq
 zeHRFFDWNFBXmQS8Bk7n8lSGvipuSqFsYNWSxoYJioEzkZbAqojjDeGk+xrZrQp5IPQ=
X-Gm-Gg: ASbGnctB0I05j3B1MpVMercSE6oEip/XHKPjUT3WnGumtteZwTpNtyNJepNG4OlrRvZ
 DwaNa8zn/dQVQrfkB28frdfYySvrNzlIHrwFr7nKw6FYDgLW6H6cQU/nSntvXioNKdTsBcVOrAo
 mu7aSQ+oEmqsuGeQGzIRLdpyRkbOE5TD1O5GtZVsVg0l3wB1H5Obt7taobrXpvC6/FR/7Vp2EBs
 hHRgEKSmmyi/OQSdHeiq4mr9sMrtbntbjX+keJ5Zyq8dXKO3GoyxOj9CSYn8o4/FTg1V5mehERb
 Sdr+SKfCpyeShzQpxxo2Wdmpxy0IJwYanf4Rr6SjgsSXvyGHCwYgxSEPuvT6CJkMF35LTbj8YrN
 iCiefJR94iuThR4jAipHtxHgP1VqJ4d0owPVbMYBUHns=
X-Google-Smtp-Source: AGHT+IHaXceFYqPqRKvPcN0LOYanA0xMBHQBhtMGDdnYq7Gnkt0uyvBK/Afn6hD4lEvXnVat0epI+A==
X-Received: by 2002:a05:6000:26ce:b0:3b7:9b58:5b53 with SMTP id
 ffacd0b85a97d-3c0ec660768mr1387363f8f.45.1755596296412; 
 Tue, 19 Aug 2025 02:38:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c077c57aa0sm2974446f8f.66.2025.08.19.02.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 02:38:16 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:38:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>, Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH 0/3] drm/plane: Fix a couple NULL vs error pointer bugs
Message-ID: <cover.1755591666.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

These are a couple fixes for NULL vs error pointer mixups.  I had sent
the one earlier, and it was Acked but we forgot to apply it.

Dan Carpenter (3):
  drm/plane: Clean up 0 vs NULL issue
  drm/plane: Fix IS_ERR() vs NULL checks in
    drm_plane_create_hotspot_properties()
  drm/plane: Fix IS_ERR() vs NULL bugs in __drm_universal_plane_init()

 drivers/gpu/drm/drm_plane.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.47.2

