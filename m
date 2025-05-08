Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1BDAAFFCB
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 18:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12FA10E3AA;
	Thu,  8 May 2025 16:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YjpT6PhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE9E10E3AA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 16:00:03 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so13192025e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746720002; x=1747324802; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YS0Xnbw81nX59SdK0HAxNgdPMxZ888/mJK0SILf8DlE=;
 b=YjpT6PhSURtvdmecmN3ho/dlkFKhF+TTuyEa5TDY2h84L8PwaLT4YdNU7H7CcjGyYN
 x5AEfJphHeHdX5ugW1MWjrEznfyAO1DmHzVtbqRS1a+CF0vYS9smtnsoX1SryHbnjLQI
 AwTDQPwR9tDHZzvQnGpN2dBAy+k4ejf+S9zPLYz+w5A8VlDWjHUmYTB6QuaBajL35srp
 Pnmr0My2xmR+M40FfqL/f+Imq0OQg8b12hHfwO294Kw3tJwEBy0fXBm+qwc3wiJKA7TC
 PJ7a3E7DHLwDB6E8QIhNaFjbm5Vaowrj0aRX/B37vB5aE1LulrUXX0haiOG8zKTLjhaP
 tg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746720002; x=1747324802;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YS0Xnbw81nX59SdK0HAxNgdPMxZ888/mJK0SILf8DlE=;
 b=qXdTsQRruIHpr4+VxKKGesOIM68XE/BoDoXSsogvFkWMrj5oOFfcwfNrpdC/mMW+Sm
 38oxY0/3hz0y7vpeHXTbw45ce6xyhiQziMQjXl3IZl0R2SmzoLh3+MvJgdC9mC8Q2qhZ
 jaBWS09sJ8tgvsIL8CmA4v5SFsq+lzPBauA15wqA35/O47riXsqCj/4DQZ9dXgqkMtxx
 KFcavEapWcqhbZYQGTdoUssYwXWvvcUBAoIZwTti93rwXkgz+ZbbnoHvDC/yAGLjF2Wi
 JmBknwN3Eb2CQ7ags7rj7kyo3XsoZ6GN7+JcHOI+hh4Z6MgtoEqLu58B+QxYbFH7T2Fp
 6nuA==
X-Gm-Message-State: AOJu0YwniHg1B5OmlZqyPKlkrr+rCaczf9Zkyu5qdLeM2MohlvIyebGn
 DePdvni9/sPpjEk7Oqu2UqkV8Xbej+7RNynV0EYJrQaE9+yz7P/DlMYJZaPw6yQ=
X-Gm-Gg: ASbGncuz93C9PHsTyF3fRNPWfc4260dEBM6YxQKKLmmJmiAYICof5XQLEzyjlX9E9+i
 oIzkqtV8hPuoYOL7eov7yfEwloOVx5hgYHF3bDnZF7EUTkXM924mrFHOvSBaWjqBxAKeijeoudH
 PCf6KYchX6xohbnL64Ulpld6Z/UM/J/zqEX3l6OaUWkswuC+kQ11w/BIHRWr44jhnori80MknWo
 2PsTNGuC2BVQrcWhVd2hBma/FOEbMd3DODOxUEqkDwSkISYRTATb2q4J/y61EGfOm1b8i3Mz0AU
 0GVICG5UwvVlvrL+skAn8IwHPg74Q+WIdjYXaGpeO5XP/cw2CPjalubGVAhvmVgkMnbnxO+a
X-Google-Smtp-Source: AGHT+IEvpHsTy01Eo4gysKeG+qM4D5wZ8KIr/xTJMUG/QfjziBf3FyN/tL93852mL28CaKMQiLmseQ==
X-Received: by 2002:a5d:64e2:0:b0:3a1:d06c:4e5c with SMTP id
 ffacd0b85a97d-3a1d06c4ee3mr1123892f8f.26.1746720001821; 
 Thu, 08 May 2025 09:00:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d676ef1csm43535e9.0.2025.05.08.09.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 09:00:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250507-topic-misc-truly-nt35597-yaml-v1-1-bc719ad8dfff@linaro.org>
References: <20250507-topic-misc-truly-nt35597-yaml-v1-1-bc719ad8dfff@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: panel: convert truly,nt35597.txt
 to dt-schema
Message-Id: <174672000108.3610792.1743383876535805505.b4-ty@linaro.org>
Date: Thu, 08 May 2025 18:00:01 +0200
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

Hi,

On Wed, 07 May 2025 11:19:21 +0200, Neil Armstrong wrote:
> Convert the Truly NT35597 2K display panel bindings to dt-schema.
> 
> The vdispp-supply & vdispn-supply are not marked as required since
> in practice they are not defined in sdm845-mtp.dts which is the
> only used of these bindings.
> 
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: display: panel: convert truly,nt35597.txt to dt-schema
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e7c523c58dd46e417963a9878971bf74026083a

-- 
Neil

