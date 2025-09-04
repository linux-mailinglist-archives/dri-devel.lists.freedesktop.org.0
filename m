Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15816B430B4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 05:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A9910E02C;
	Thu,  4 Sep 2025 03:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="O0YEV7pw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4050D10E02C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 03:58:36 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-248ff4403b9so5758275ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 20:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1756958316; x=1757563116;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdcVC7EGsc3p5AhbAck6hSHkD/WxcPvPTOs/rsi4Pyk=;
 b=O0YEV7pwrdZTNlWWXGLnJoy+YkN6wgQs196nOJOZJ60GizkkXNdsuYpzBm2/k8iR1M
 5I+r+hYDWQMJ9liLlQ295BpI+P+S6A8MhJ4uvifUmiS6fasUckMNWAqEXu7KRo9rkWf9
 fl6fAAgWdL662IKIq43v4O1MP2mnfEk4UFTu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756958316; x=1757563116;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdcVC7EGsc3p5AhbAck6hSHkD/WxcPvPTOs/rsi4Pyk=;
 b=KaWfbuiqFjgHAU/9kCQaeGKEFtraXkwmctlZZV16qcCaQE36jurNgAYy9OzXj86bOT
 qdr0NBca1ADccBJMC83D2ngS3zxXce6QGbKkpII8OwkECMquyys0pNz/+AdsrjnCneaR
 id24uOKkyJZdgQ68yJbfe5aZ1+9q06xkTQiF/vEyVZ3L55GeW1WtaNzzDYhDtQ178OcM
 L6SMTkFbe9fOWo3+HeOMq+zVQetMJ+TUc1kUxRfbtLiFXWG+MdNc9u9BrpQdp9j0kM+Q
 cI5Ht29VNDlOEXZ6ygBauqfDYTkeZoB3BarJdhaZAs+MAxywDPKQgi6NVz6vC/bqTsiH
 p+RA==
X-Gm-Message-State: AOJu0Yyvk2LI1pPSweqN63Oth1YOa9oFxoCsHawA62jSHaZPwKZc6vzy
 XXFwHF7R1AVsRiICs7v4EMlzFgWjkiLkKRLUOW0E2b96QayMNouRQfWacIbjVKAgWg==
X-Gm-Gg: ASbGncsRto817OD3I+6JV+kjg+qFeV0uf3MzhHtIE/zUyqlSrJcaDDyU4NoUIfZ6qXC
 1oCM7gqM2DHMv3Ftflk7hiowlYm057I1oxfeVGY33udk1NP+3zmBxzlzZotp3DJv6vyaR92RtVA
 vMQDStUNrjsSHI21PbAWbCl/UL78yWFLutw7LRM+4QPO+ZzsbYmoXE9bmvqTXM9HMjnUW3etwoT
 ucOQXLDgYa3XUQ3SM15x8rUw4ZiBDdTb7N4AbWAj0uhKfFVr4YFhSepdQpxbjFF95dngZyD3/Za
 QPumKT4NShoA+tBo1dHKNtqlVVAkiHcoVYFUjYPgWBYzv/BRBZCDUG0zxCQ/Pc+w3rzJdhHpR8s
 dGl9XCTaAz02QzOh40pDFIIPzbFjZLH8rAJT306vKWbGx1J+agGDJ+pG1ZjOm5+MjqSCjPvt1Km
 RGdU2DydlGbym1Sg==
X-Google-Smtp-Source: AGHT+IFqjpDEL+NZxw/zBYdqqN1met/cuuCeIu/YOCgUar+yk4gMXjjK8G9vvtXW5yAKilSqQDIh9Q==
X-Received: by 2002:a17:903:37c4:b0:246:cb10:6e2f with SMTP id
 d9443c01a7336-24944907804mr238303175ad.26.1756958315783; 
 Wed, 03 Sep 2025 20:58:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2a00:79e0:201d:8:3c2b:f8f3:78fe:d80f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24cb28c3126sm16707405ad.65.2025.09.03.20.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 20:58:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-crypto@vger.kernel.org
In-Reply-To: <20250821175613.14717-1-ebiggers@kernel.org>
References: <20250821175613.14717-1-ebiggers@kernel.org>
Subject: Re: [PATCH drm-next v2] drm/bridge: it6505: Use SHA-1 library
 instead of crypto_shash
Message-Id: <175695831382.1322876.17900015503262535191.b4-ty@chromium.org>
Date: Thu, 04 Sep 2025 11:58:33 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Thu, 21 Aug 2025 13:56:13 -0400, Eric Biggers wrote:
> Instead of using the "sha1" crypto_shash, simply call the sha1() library
> function.  This is simpler and faster.
> 
> 

Applied, thanks!

[1/1] drm/bridge: it6505: Use SHA-1 library instead of crypto_shash
      commit: e339a73737d365dc88e1994d561112ef2c21ad88

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>

