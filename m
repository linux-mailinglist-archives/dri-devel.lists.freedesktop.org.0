Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E98AB48E895
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 11:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB6110ECDE;
	Fri, 14 Jan 2022 10:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AB810ECDE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:51:09 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s1so14911075wra.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 02:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MNu7t1Ljlb2prCp8AD9cBENC17XN93Gmt4yUeCJHVzE=;
 b=Qbfn7uypSV1LyQz2w1EFtaCpmN2h4zjJddCuPiwhAyDaSSF2i3jPujf29um0kCabTq
 U45Puo1QbpVM3z/rl4IOx9lqIBmZ+2X9XqFdG7jFxqsYIlsJ6QrSbPkjWQ6EUx6d8Jzq
 fXtOXMZhEcR7EC+IlwcOVX9UKTx9QTWJJe6zdWc9rv59dm1S6F9SYiO2fykAbJamo2Eo
 VIuM+egIFmCRpjjvYviXIGJ81mvM0nXi2xUOF4HT7f8tUhB+2i1JJvOrGYbJHPCaIFgC
 qh4+jfJ8KDiDnpmVi0AVHTGPP6FJmB1QdcMt8Ttu66Z5t/FpWvi/riMC1aSBBdD9VkS9
 e6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MNu7t1Ljlb2prCp8AD9cBENC17XN93Gmt4yUeCJHVzE=;
 b=sK1S49nnUkg6OTl0o4PUSwGcfFX9hIiFCPzE5cii4Hx4I5LDDfz+/ccCzDUU12C9rx
 +aV1xhHjWr6b9RcPV//9aDNnrn8MUavex/lxtY9n2hLUSqr9MSsbW2/aollLS11xcz68
 w93MC4e8rCzI2vYrqYecFTBAWpv2fc5oUv5hsF4Bzv2WGNDhZuY8/5H3G0o8ZuRg9lRR
 4fmUMGohjeyhiGQRpuljdzvS8owYpEU3VRz5Wrkfpo0c91gfjPrVC2yh7eHCbiFB3s6s
 gQl1pxYRBWrCmaJQ6vtxJMzbiTJVE1P8WtfVwXyN1j9fCnksfzR50fm7lKLwXEAJMeOJ
 7rxg==
X-Gm-Message-State: AOAM5309D+b4oLUr94vayOoWRHQNpTvnkUKv9PZv6Iz5VAq5Gp7Z20XE
 npwFjsbzXTTDbUmaXPe9rNlrz2wnIj2NBQ==
X-Google-Smtp-Source: ABdhPJyXciixk6P7RQpoKiS2hUdjfnUFK4nzYmJVI6x87htxXI15K67RzfBYwm7rm5rsVFdeNbvWMg==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr7669525wrn.259.1642157468117; 
 Fri, 14 Jan 2022 02:51:08 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:a3fc:c40b:5afc:88ee])
 by smtp.gmail.com with ESMTPSA id i15sm268207wry.99.2022.01.14.02.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 02:51:07 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Drew Davenport <ddavenport@chromium.org>,
	ple@baylibre.com
Subject: Re: [PATCH] drm: bridge: it66121: Remove redundant check
Date: Fri, 14 Jan 2022 11:51:05 +0100
Message-Id: <164215742752.1114906.11976523106834193507.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114064012.1670612-1-ddavenport@chromium.org>
References: <20220114064012.1670612-1-ddavenport@chromium.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, a.hajda@samsung.com, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 13 Jan 2022 23:40:12 -0700, Drew Davenport wrote:
> ctx->next_bridge is checked for NULL twice in a row. The second
> conditional is redundant, so remove it.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: bridge: it66121: Remove redundant check
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1500296576464dd4f8f7ba409069591648f4e98c

-- 
Neil
