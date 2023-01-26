Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3A567C571
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 09:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385EE10E116;
	Thu, 26 Jan 2023 08:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0F810E116
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 08:04:11 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso554348wms.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 00:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ji4UTQQpkaAaZP+qzWQ/1r3qUElt3jvEA4W3T+OpYO0=;
 b=gPR+gspI2MU/0UF2Z3HOxYkp5nU9ZXepeVHhkbdy7Z+JPWkMm9jjyJQ0zU6IGppXc2
 kAgPuZ8bEyvi+VQJYGcQyTXmIrXH5i+ko4JH7+hBI4T2Wbs2cW8i5nV9RZwEgMrQd4O7
 HsBjNHcfzDvkmnvadrbPHFsUWR8329DYzpIUz/I8qrw8J2WMBklmTHLLjFohzkkBo8zo
 f/kFfiEd0+5jLmsc0AaJZ5nJK7VxiZXqztHhUzBAyhyOTVk7+pSQRhvLawZHkcTAXF8J
 cAFetoGhpcNHgNtjyuSig6wEi4RXTemE9nAWHhwoLYJYyOjTySWh3KmNUQrCgPVo0MOT
 uCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ji4UTQQpkaAaZP+qzWQ/1r3qUElt3jvEA4W3T+OpYO0=;
 b=Xm1hOFJmQgb+EWOxk/cHDr75/Mknf6wzRbXriD6fh2agPff29MnYTuss08h44gW7ga
 nnrsvMwGHdUquotjyz6x3oO+epJ/m4Yy2fbrB+HbfCfUaiiCLuczZwe6pxjZ/Q0TE2Iy
 sUbz0L5U+4uJhcb7M9ZoUNfTRbiCgC4ybPn5jpj0z/B9NnzPBwvPoT/7u+xTIJ8YDtsE
 YptrshGjbMly8i+87ovzU8sJqzWvEwEiPskIgck72AMQ2Utd07095XtKbFFzcDHeKpQa
 DJoVcS5IHLjGb7bd0MUrvCc8aRrbpM8Q3GZBCMx6TZxQCMD2N7RT2Ki0bPkT9q1+jFek
 OpCA==
X-Gm-Message-State: AFqh2krG0H28o3oXzhDS2l/K+BGSumEUEp5j0PUjEJTRlo0x1qSgWtO+
 PpD0zexuFeVjB7LG58pX0ku9kQ==
X-Google-Smtp-Source: AMrXdXuJNrn3BzkCdTgrYpCfTq6/eSP+lbun1Vj0Xqd9mftWK2fG9+wLcQ1KGgBamIEV6xrufa2tsQ==
X-Received: by 2002:a05:600c:1e08:b0:3da:f443:9f0f with SMTP id
 ay8-20020a05600c1e0800b003daf4439f0fmr35166987wmb.18.1674720249603; 
 Thu, 26 Jan 2023 00:04:09 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a1c3503000000b003dc1d668866sm3685427wma.10.2023.01.26.00.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 00:04:09 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230124104548.3234554-1-dmitry.baryshkov@linaro.org>
References: <20230124104548.3234554-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/2] drm/probe_helper: extract two helper functions
Message-Id: <167472024866.416690.8614815459013912607.b4-ty@linaro.org>
Date: Thu, 26 Jan 2023 09:04:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: intel-gfx@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>,
 dri-devel@lists.freedesktop.org, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 freedreno@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 24 Jan 2023 12:45:47 +0200, Dmitry Baryshkov wrote:
> Extract drm_kms_helper_enable_hpd() and drm_kms_helper_disable_hpd(),
> two helpers that enable and disable HPD handling on all device's
> connectors.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/probe_helper: extract two helper functions
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=cbf143b282c64e59559cc8351c0b5b1ab4bbdcbe
[2/2] drm/probe_helper: sort out poll_running vs poll_enabled
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d33a54e3991dfce88b4fc6d9c3360951c2c5660d

-- 
Neil

