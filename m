Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B988062FBCA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 18:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFB410E226;
	Fri, 18 Nov 2022 17:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CE010E226
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 17:40:17 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id j12so5175756plj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BI5MC5wPkQQeEE83qP7tE3SCFpQYK/xq9Ol93cnM3VY=;
 b=gFc4SfbZvgjlbAJ650Ar86zoxHOUfORQSyStvBp17HLK7lxP5lrqFPd3H7gr+4Ayt6
 Ud/yj2PxnUbWSfETvS7Ohq73hj+K2B1RLD25ZA1swwLA8JwR13Oz7bR/zKNnRBV69dr8
 1vERiIK/GLorWogYSmx2pdLuuNxPbKoaI/V+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BI5MC5wPkQQeEE83qP7tE3SCFpQYK/xq9Ol93cnM3VY=;
 b=SnWAz6ZcgeRsQDrZfdKcFfVb+R/KlE6Hh06eFCOYy2w3mdUOjtqwxNRtDXEp/geuyI
 nSMEYR0auj1QEDDGQo6udyjCRX2reYymMXgLbBsdJid9sPwYKfzJmmy87ySnuabJI6NG
 UNfyi7+Kv5lrvdhIIsPRU5ojbYC3zqHrd0QLVTSo/qkZFYHic+6fXPK6Rk1JMTSw5iiP
 4xLFjeeARDCs/cvhZepswXWK0bxrt8ta+AJVKVQcXB05WdrxmMEpTF3SnpvxxcQnl1n6
 2NKLFIpd57ZLAEz3KtVrnO4t7364ksp8XeGQyOdYn2LpCWuNTKEDxP4daiagXNZvj432
 UYFg==
X-Gm-Message-State: ANoB5plPMIdeVLr7+idQVKKZ12x2BP62etRSh1KrXj00ZyDcvY0eHZwT
 6/KHDa2GqIykHtKvI/7xIf+sMQ==
X-Google-Smtp-Source: AA0mqf7FFavVCClOULx9pEedXB/2PA+q16XqUjZI2216vnXrk6B4HMcy7q6rcPKHBlGCFkt/8m95FQ==
X-Received: by 2002:a17:90a:7885:b0:20a:d81d:a8 with SMTP id
 x5-20020a17090a788500b0020ad81d00a8mr14555998pjk.177.1668793216603; 
 Fri, 18 Nov 2022 09:40:16 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 ij27-20020a170902ab5b00b001885d15e3c1sm3992123plb.26.2022.11.18.09.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 09:40:16 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: nathan@kernel.org,
	alain.volmat@foss.st.com
Subject: Re: [PATCH] drm/sti: Fix return type of sti_{dvo, hda,
 hdmi}_connector_mode_valid()
Date: Fri, 18 Nov 2022 09:40:02 -0800
Message-Id: <166879319847.2080862.11821072640113889089.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102155623.3042869-1-nathan@kernel.org>
References: <20221102155623.3042869-1-nathan@kernel.org>
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
Cc: Kees Cook <keescook@chromium.org>, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 samitolvanen@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Nov 2022 08:56:23 -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drm/sti: Fix return type of sti_{dvo,hda,hdmi}_connector_mode_valid()
      https://git.kernel.org/kees/c/0ad811cc08a9

-- 
Kees Cook

