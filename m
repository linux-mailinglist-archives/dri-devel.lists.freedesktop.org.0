Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8029A4749D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EEA10EA2E;
	Thu, 27 Feb 2025 04:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VSK5NKfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B3610EA33
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:50 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54843052bcdso419306e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631069; x=1741235869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0yVVoncMUtyJrD71yPvbIabSZ+QZVXWPqdiViPaHHO8=;
 b=VSK5NKfj4TEupsJYu/pHxgkV4I5qxyAE1Sh5BXF65KWAc3LeRAX3J3jNebvXrIgnEL
 B8FnbbzI2vQ16KPhgJCsAMmazVF/3IbNUZRKfMGxilhY1t5wq1jEPldZzUhNKkCgQSt0
 kOhQYgFjyjBn0aerbvAN0iTtkS+Kq0TTSnAGEYUnYI1PBc5qDFKrEmwtXuEo9VDy4P6/
 8t81gOtqKr8L4YX+1H7PaWYSpnUV2Njes4bMQ79G8ctDkIJLCG9csflFFVGKhs57U8w7
 3/o760V3SUfxWMl39uzFNWvzbi4rJVigQJKAtRCx86YsNDCOmwGGdCdWtKEtr7kTuATf
 Dg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631069; x=1741235869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0yVVoncMUtyJrD71yPvbIabSZ+QZVXWPqdiViPaHHO8=;
 b=vk9PUpmSKp2bLsajluX68Ynmtz5Age6qBYnXV3OhPyNynnvOmmu2bCLUcWRVWlKzoP
 pB07GmjJjEYp2BZXDZKT0ZZoCTwQWocwEn/9rm4Wl5sq9jA9cSoxuNe7/Bosr0kL/Ebm
 GzZ50OZ2Wq4S3/NKaSGzYPHOdzmhOYxqrisyt1cmCTXiqxcOU4i0/pZIlbfSqRWDK320
 YvWF0NiwbSJ+cIeHrS4e2XY1tPcCzeWLebhFuClF1L8Amrwi1nakA0NGFl/HZRwR0KyE
 nqmiwrlaWSa3gY62ntjgPyT1bUUQ7dNj/LP8ai9kYI60VaTdQu90pJ40Djfh/ibTJy8b
 /U1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3BSEQVs7/EUWdt+vUNStaQNTPZQBklKoq0Qkkm6I04sY4lVeInLEns4mY3rQ/XGLticX2xD3Lf+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZVwqbmxb1sr28wpUqI8awtjPh1SfVkiIZj0E47BTD35/sNvpg
 PPMtn+DPTrpJQyTNce0QrA0A0uF11dU87PIzSQunv0rF5Mi2UlDrHOx3KhvcvW8=
X-Gm-Gg: ASbGncvytqggxt2fgQ0W5HT++2juc3JqYbqhKkwVmpKlaFHvYOEuMSjLX7F/4c66Ib8
 elmkYAuuQvc1dl1VKK4Vn58KEnAMFJO4t8JHYT1r9A1LquDgCoFfwAFCuuWwQ7/zYKD6jUKqnCu
 kwMOVwcfabiil++dtnW7GO29aiw2VXPZLkyJtkSsPqj7ycXdgtfsla97KHVf8WvLJX8aA7BPJ5/
 A5rstSGwdL9eEs401MuqS3PuIfchzjoV9QZzLg2+fJfvxZc0FCttBke8hM/wShUr+p+1unuqLpk
 LqpONSKl1wmTHpVNUKYxRXhV/dF2F/jr8/jIUCDebw==
X-Google-Smtp-Source: AGHT+IHhHacgUFUOWqaFKwGeZCIyQGRHzXtNQqLQR6DH/wWVs2+qKt/6fID2W1fIzlPqkwNrqTa2aQ==
X-Received: by 2002:a05:6512:2814:b0:545:60b:f38c with SMTP id
 2adb3069b0e04-548510ed080mr5489768e87.41.1740631068697; 
 Wed, 26 Feb 2025 20:37:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: Simplify using local 'ctl' variable
Date: Thu, 27 Feb 2025 06:37:26 +0200
Message-Id: <174063096235.3733075.7263678647140432875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114155959.583889-1-krzysztof.kozlowski@linaro.org>
References: <20250114155959.583889-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 14 Jan 2025 16:59:59 +0100, Krzysztof Kozlowski wrote:
> In few places we store 'phys_enc->hw_ctl' to local 'ctl' variable so use
> it everywhere.  No functional change.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Simplify using local 'ctl' variable
      https://gitlab.freedesktop.org/lumag/msm/-/commit/629ac9f0a68c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
