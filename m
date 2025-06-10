Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E48AD35B8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F4010E51A;
	Tue, 10 Jun 2025 12:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fLm2RENb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2DD10E519
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:13:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so44807995e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 05:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749557582; x=1750162382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aC7BrX8x1EswiMMGxYjxP264vmuUgiUiNAi3UiM8Gaw=;
 b=fLm2RENbjr+NRWLucyyqNpMEnsSSZxLWbQZVmp40H2Ect1qiNtO2kX36hyQCWAMqa/
 7IlItToIMubBAohammhldhnnMH/rzPD2RmmRevPRcSkc+vAulxwfm2oGpfOSaGK2fj+n
 QmmUteOwYJuqpa+PX7Iafmuxhha8URgCjA/CB9qOybThrTcOPDXxG5KdxHYMUyL/uSLv
 Jxxgxyt+mCD7wnXB1dPNwJSjezxO51xoHD1D/NRdHDFSLMXAeYryBCfi3cu+BVehXDa+
 2j1S1+GRGXBO2CM9RoFI69ja/Ls2THrTsojTAwxj2loeajdAhhO/ogM6xjYLtICgFBl+
 w0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749557582; x=1750162382;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aC7BrX8x1EswiMMGxYjxP264vmuUgiUiNAi3UiM8Gaw=;
 b=tZQXXGr+n/Ir3grk0shz0KwZxIW9TZ34s6mOd+kkrPJWG0CRLeKiCVp+aO+lez4RFy
 cJYPAX26XJOqxrROj++oHUbU8DIDCBXKuVXsaTykOOUfqY+iu8ik5BqVpg+++2UpdMfM
 Ioy5R50U3bkyu3ALGgWczBR/k1zGFR+BsbURdCvCihhYdBcUqPIvyoFLVMyxP1MuAl5J
 E7x3S+zJdQKPjmZsxuhWNHgQbff6KIKUh/QfdWrRglD+ckkKgJ90fcOlfYWtB21sHKwd
 ec0dlbqiuBqVqCBfd4suchb2v2pCYPg6477sElZa6iGS/mW3ybzgvoVAJGmhPsClagfy
 30NA==
X-Gm-Message-State: AOJu0YwToAoh1nec2kJ01KoZKDl7OSVpJWRJ9Nc7NHeuSDfPlyhpAs+N
 rYvGpawXfj7Ai9e1T6SsgUAPEtEkrOV70Z6KWgfw9mIAO8+QxE2NuCb7hfnEuLt7jQs=
X-Gm-Gg: ASbGncu5FlIT48+Nujzp8Tzd9pUZZW6SjxkJsn+9T4iMXXW2CIntRC9DafkR8PboEo5
 Fm4syadeaDr9LwtPE5RV8zpr1ShA/+AXbZkayKUNMRWerptrwiC380uBy7Bf5xklqqowOLGOVH8
 Kwa4H2lERsjYe+tyCLYFmRWr6X1UR1gUZ8mXv0+Koqq4mWiGxPf14vsxP++QMr3P9k87DUqky2T
 NZ/oaquzhnHJxbIr8sQgZYl47+xF0s+NNUV/qip96jqtc+B2Tiez9fDuu6Hh+YCPIcMxVqzm8Ls
 0bDilQzJBrxIziTvEaz3FytZI/mRDsEo5MbcbkVN75LvssCG4WrVRy7PKoE81oDYfGsDntLg+sT
 9ZyS/X40=
X-Google-Smtp-Source: AGHT+IFyqTvtGwvnuc3FS7zne0Ce5Fz6EfGEy/ON5HolQgJhZJPOh9o/jA/qGYT7EuGw5oynDbNm/A==
X-Received: by 2002:a05:600c:8b72:b0:43b:ca39:6c7d with SMTP id
 5b1f17b1804b1-452013674e0mr170246245e9.3.1749557581771; 
 Tue, 10 Jun 2025 05:13:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4531fe85260sm9841035e9.0.2025.06.10.05.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:13:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jagan@amarulasolutions.com, quic_jesszhan@quicinc.com, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 Stefan Eichenberger <eichest@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250606114644.105371-1-eichest@gmail.com>
References: <20250606114644.105371-1-eichest@gmail.com>
Subject: Re: [PATCH v1 0/2] Add Winstar wf40eswaa6mnn0 panel support
Message-Id: <174955758106.1700488.8043298951772545828.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:13:01 +0200
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

On Fri, 06 Jun 2025 13:45:49 +0200, Stefan Eichenberger wrote:
> This patch series adds support for the Winstar wf40eswaa6mnn0 panel. The
> datasheet including the init sequence was taken from here:
> https://www.winstar.com.tw/d/308/WF40ESWAA6MNN0.pdf
> 
> Stefan Eichenberger (2):
>   drm/panel: st7701: Add Winstar wf40eswaa6mnn0 panel support
>   dt-bindings: display: st7701: Add Winstar wf40eswaa6mnn0 panel
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel: st7701: Add Winstar wf40eswaa6mnn0 panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d04f6367d39918461d0335d30b860d38668d4b54
[2/2] dt-bindings: display: st7701: Add Winstar wf40eswaa6mnn0 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f79692d0c386bf8b815c92fc0f832d1a0af03628

-- 
Neil

