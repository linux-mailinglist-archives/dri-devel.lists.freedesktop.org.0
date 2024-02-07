Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB1784C71E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360FE10ECF4;
	Wed,  7 Feb 2024 09:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hwxtz38g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001A710E1AF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:19:19 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40ffd94a707so3657935e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 01:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707297558; x=1707902358; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GaRiKb/w4iH5KbxLrr0CsrBk0xODem4EHSIMgHr4BH0=;
 b=hwxtz38gLrcqIi1XCa0gsVG1jhUBQQIVQzKoeBYKlIWBHwAH1wCXuujWPEP05xGcX9
 KyzBWA9FhJ7mIdNNkrbGywg7IdJ522iK6MzRNUq1DhDZE2zV29bufExPiB80eSYnSzgK
 cPyALf5xBFPjuOPdI+1VAYILM5DQcnxKEXd1NFTi4Pi7Qy56FcTLDTtymcGMPMzDhG/S
 G0iKD0ZlshlxWOAEzhwLTUx//spsHNYRjZxmX1iLj9nhb7dUE0s7sUdZ0N2cd+rUFSMr
 KmtJROAvA7jYJrH5COQk8zL297oqF+6G1k0hP3wYcpfK9PcEC08jHZ+EteQ14QpDUVIf
 8pPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297558; x=1707902358;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GaRiKb/w4iH5KbxLrr0CsrBk0xODem4EHSIMgHr4BH0=;
 b=fI7kZQIXADinDNJQe6rD3FJ5eQnXUNGm0c4BUh3vDYrKFHAAI31ClUnmpk+0OENDf9
 0Y7nQNr2mgDisusMM70GlBa1F/6PgYpJbaaKopJrc/eXG+pTN5uJvl4ZGT263aTWlCxu
 cIUsuAbCpuxtwgtVdjl8UXmkTcA6OgatGveLfuKwFYk+PKr071Mo3zfVPZonPBKzud1Q
 fCojt+oVaSyCriij1djVx8do1oMs1iNyS4uKcXXXfuvv+sJmfjO0BJSVU0XqbyXaNGsi
 oW8lmZ+6bLe4t4g8zI3M53NBMQHyPN+s7QbwPYK/4t5cHJoMKNWOLxP/oj4Ga7vpj6r1
 5lFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmEJcSrDVex1zkyvNMdaBAyxCFEtCaRQWaeMdwfdXYmZE5xJ7/0+sz9JYlsDv4aHPm4gzQqwuV59SM1ymljkIbE0AS22GWLY5THtofwORT
X-Gm-Message-State: AOJu0Ywk2alQ0wYQRF+ivwCTRejBoVZAA4GeYFB1CHCcBaHJq2gbsaLy
 oF5cyaUusdj01vwyxcIIEs6rJ8rR/Lmv6JcvnuyqKhxZPy/Koo3A1nPbtoS4+fs=
X-Google-Smtp-Source: AGHT+IFGQyyZHPIzn2dkD1ijtaQRSJPfvlhiX/TITJ7pLRltia26Y/6md7Btyg2bU3MuWqR3x8jxAQ==
X-Received: by 2002:a05:600c:1f86:b0:40f:dd3f:ba10 with SMTP id
 je6-20020a05600c1f8600b0040fdd3fba10mr3527983wmb.33.1707297558488; 
 Wed, 07 Feb 2024 01:19:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWLdxICuHk9a9uCPjkcqKn8D2izq4JpwnK5k1d2F6IeVq6PIRaTvmsmwfTVEOAFt0A2nwwC3Zpb+8KNn9SiBwy6LN7oXcPExw4oBvu2VEBYjClh4Ynd+fWiuDTvtrtAO1hTsF2ewoWIR/meWKN3YpFTEVdYttq8VbRrVXRdDYXENuA2pC95o6eCsNq6wXFDhfYH1HRCWdKKjUM2TifR0FaiUngrM+wyjVGO2XyCpP57F71z+RX8tNjpSVU6Mm0wrqH4Ue+WGvQ4RJCYV/+2hUqBYQkrCPn3HxSR+Pad7xDDC73t8F2m4c/Rk6SZji+G3eD49QL01HdSY+Gn
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r20-20020adfb1d4000000b00337d6f0013esm1003490wra.107.2024.02.07.01.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:19:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20240205062711.3513-1-rdunlap@infradead.org>
References: <20240205062711.3513-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] drm/panel: re-alphabetize the menu list
Message-Id: <170729755771.1647630.8570612992728203897.b4-ty@linaro.org>
Date: Wed, 07 Feb 2024 10:19:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Sun, 04 Feb 2024 22:27:08 -0800, Randy Dunlap wrote:
> A few of the DRM_PANEL entries have become out of alphabetical order,
> so move them around a bit to restore alpha order.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: re-alphabetize the menu list
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=aaf7f80996834ae5e2fd46d03f6fdb852cfa9911

-- 
Neil

