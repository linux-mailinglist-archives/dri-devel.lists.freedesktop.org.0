Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D979177B90D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 14:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19FB10E1EF;
	Mon, 14 Aug 2023 12:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BBE10E1EF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 12:51:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-307d20548adso3845925f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692017499; x=1692622299;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtxbpPobBQ60qiIOsVcRjACO5EAGCWGmZXv0NYOmeRg=;
 b=iu1W80X1P0xOIbese/6X5rDsMCWlQoc0D1Xk22w9Ht/qrOXzzK7Nm84yUPBh8YBpeK
 dOWHYGdy4lJmmH1/3QRUDsTm2HPW6+ftxT1wwkC9Oql74xxUPt+M98v1ItIzM/PnFU37
 J3VZxbtCo0nsnKA66BnNTBD2b+q8TBL8jTjZDFV2cq5gwp1NQRMyiyatT+HRFIMJGh+t
 KCr7uZTuVjzoPgPvULTenrLorOeDpVx4bhlrU9pt+sdfB4cChdsAtj/3pwPY9DhT4SEl
 fpdjiI8AhDDXQrkR7kFYwQbs9/yV7AOQvH+7pgFw2BA8e+CbkwgYA2URbjsLBHlj1TYA
 nkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692017499; x=1692622299;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtxbpPobBQ60qiIOsVcRjACO5EAGCWGmZXv0NYOmeRg=;
 b=gNoWfS9De1jojEpaFvtv+eriOQ4XF46aX7suHqmHp+PLnZ5I0KJRKxoxLh6IaT8nS9
 ftVTZpmkluz010nxaiY4eAfKS5G34en7eKdnrzfCSRxLhVaxKn3D+zfzXfRGZr984M43
 SMiQLWQYMdBFX2ydI545erMqW8jIFv4gbI9V8XfWhceo6j2LADXEXWE7jQUkDqBTad1z
 tDwMNGxTXaOpODNTMpneGrEAwMT5qQgMJ5/4YFTe39R4YuQfcsqur/+kU+gcp1E2aIN3
 uOloePWA/uxlwcgaBm5vwwUWkA7y3v6AFfPAsT/V4dpUuPRCpPQp08UNVdIgbFHTcbVz
 ExXg==
X-Gm-Message-State: AOJu0Yzj3oKXD8Bz7MNWrCcXKe3Va13fep0nGgXJmNmjtBF2wPqLY8UF
 3U8RFZ7BwJVE8HKkW+3M0lxvNQ==
X-Google-Smtp-Source: AGHT+IF9Cqcw4S9B/6raPS2pKVWvFX4qVWroY2Ok1sBCnVHvIifsYoZYpdmVpde3HqJt8fcobXdLYA==
X-Received: by 2002:a5d:420a:0:b0:315:a1bb:4d7b with SMTP id
 n10-20020a5d420a000000b00315a1bb4d7bmr7632107wrq.35.1692017499598; 
 Mon, 14 Aug 2023 05:51:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a5d52ca000000b003140fff4f75sm14432530wrv.17.2023.08.14.05.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 05:51:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20230804151239.835216-1-luca.ceresoli@bootlin.com>
References: <20230804151239.835216-1-luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/panel: simple: Fix AUO G121EAN01 panel timings
 according to the docs
Message-Id: <169201749881.1408950.3682671362847659092.b4-ty@linaro.org>
Date: Mon, 14 Aug 2023 14:51:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 04 Aug 2023 17:12:39 +0200, Luca Ceresoli wrote:
> Commit 03e909acd95a ("drm/panel: simple: Add support for AUO G121EAN01.4
> panel") added support for this panel model, but the timings it implements
> are very different from what the datasheet describes. I checked both the
> G121EAN01.0 datasheet from [0] and the G121EAN01.4 one from [1] and they
> all have the same timings: for example the LVDS clock typical value is 74.4
> MHz, not 66.7 MHz as implemented.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/panel: simple: Fix AUO G121EAN01 panel timings according to the docs
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e8470c0a7bcaa82f78ad34282d662dd7bd9630c2

-- 
Neil

