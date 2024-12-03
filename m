Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF919E2B14
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC4F10EB27;
	Tue,  3 Dec 2024 18:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bCCYNqw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03CC10E9C6;
 Tue,  3 Dec 2024 09:59:23 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f804233so6161687a12.2; 
 Tue, 03 Dec 2024 01:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733219962; x=1733824762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ahmnL1IDbHLPob3UkQDYkiIlRrX9F5Q3RSPdj7jI85A=;
 b=bCCYNqw+JMvZbggeICAK/5C8wtYt8qYzLetz7fxefO8gbU3ZjVPYUqP3vQ1o7xcvc6
 ou3v0JSE2GZACkQHpo+VE8U8w6DwEO/AU/Fub7JHNGfdfGDTw4XiqfzBwwSPl7tK7TPY
 aKgby3PbcKfTosT49KuvdvxtrxUwPzc2wPtNircQdt+3z/UdUAZBwhyhuW8LPfyxd3bQ
 suRyKzdsfGrrJiiM09bJZHEUYHWv4ag84ER/uc+yx8G5Rv1XlCKRx9I/BEbrYW9XD2ty
 ke6dUsfOIixqgg6VjFg6ZPbQN3FsQ/PD9FpRPfTYaUHXySygYYU44yRlR7PYWAh3oBHb
 j7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733219962; x=1733824762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ahmnL1IDbHLPob3UkQDYkiIlRrX9F5Q3RSPdj7jI85A=;
 b=DaEf9JCWVraUoXV1Mb6nmdnh+1mIGQdymeEHLfFExI6TGbYt/8Gvu//FClClVccoDa
 SXA1FqZPbArkKmpe/FQWU1aKBsRLdhrp0yGgwN0ao53QagNuK4PsVRXceDpLNhUNI+yd
 AoOcZyDznbn9INJojwCwNjdHG0KilFOiofBVGXbDAvLMaP9HgJt1lTsuyKwSji7w9+k8
 OpeGAx6D7x1Zf1EiGit6Kj41qLG0aRFWnwOq4XQTwcevNHn9JznIVDAm+HuLmGHIq0Fb
 oYBN3To6FgROdbfF58iW0oSvGXW0zV/oFoW/cq6+4v1Tw9ApcDFmFYJEG1y7vmOWpEZ3
 cU7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjnm3i7/2GuJC6HlbyAyyfGroP2e647gq+mfnJobCFXnSUd4Ivoeuf0uCOHlXyNhmRHixh7R6qmpA=@lists.freedesktop.org,
 AJvYcCXv+XZ+S3aCRrYoSr2MoCvywpt9BTcRMoUVg14rEl8B+AoazmFD0IJjMoDOBOGbruHUp0wt9AgKH+I5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylqPAOjFMMPciE4RQ5GP1xyIsmX0BHjlx+w6HPJlGg5v2Z4XT4
 znltfL3s7WqSU4iMMVfHqK8P/kJz0aUyUt37Fi2xy7K8/M2Sj1pN
X-Gm-Gg: ASbGncvMT8bYexdydTW2VMQL8VMuccQ+8voJ6/Jg8LXAy0DWeVLpVvhA2PHeXr5G47f
 zYkhwQMQn/XGg3uPM+btGEhqjAcLTH7LAUMiOXhLt4vtl81WTRrW3SLcd2HoB1W0GdQMqfSUJ96
 Y5Hts/63M7QKHGbtZz9TNbmOYhV3cc1q1OAECA2vJHYwTQkMb+hrjsQ4XPQ7/5fbqkCbV9/ZTWR
 1EWaH44VBF9XHh+dr0ZeDtiLASh5MyDh0yOjoI1KMBUAAwuYq1jdKase4WjddOmHoOwFw==
X-Google-Smtp-Source: AGHT+IErEKTcX9+KMr3v46BnRtMhPvpHhE5bS9oaE9UMKoPerpaBYHBLIEZ8kNKDthyQ+8ttTNBC6A==
X-Received: by 2002:a05:6402:378a:b0:5cf:c0d2:698 with SMTP id
 4fb4d7f45d1cf-5d10cb5baf9mr1582390a12.18.1733219961754; 
 Tue, 03 Dec 2024 01:59:21 -0800 (PST)
Received: from archlinux.tail7f7b1.ts.net ([195.136.68.87])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097d9f6b6sm5867365a12.2.2024.12.03.01.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 01:59:21 -0800 (PST)
From: Danylo Piliaiev <danylo.piliaiev@gmail.com>
X-Google-Original-From: Danylo Piliaiev <dpiliaiev@igalia.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, danylo.piliaiev@gmail.com
Subject: [PATCH 0/1] Expose UCHE_TRAP_BASE value via uapi
Date: Tue,  3 Dec 2024 10:59:19 +0100
Message-ID: <20241203095920.505018-1-dpiliaiev@igalia.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Dec 2024 18:39:38 +0000
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

The parameter would be used in [1] to implement VK_KHR_shader_clock
and GL_ARB_shader_clock.

Downstream driver exposes uche trap base via uapi only on A7XX+.
However, from testing, we could get correct shader clock on A6XX.
The uche trap base value is not used by Mesa for A4XX and A5XX.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29860

Danylo Piliaiev (1):
  drm/msm: Expose uche trap base via uapi

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
 include/uapi/drm/msm_drm.h              |  1 +
 6 files changed, 23 insertions(+), 11 deletions(-)

-- 
2.46.2

