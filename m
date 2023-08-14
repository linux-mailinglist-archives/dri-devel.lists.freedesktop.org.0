Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8572477B8E9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 14:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F8210E1E2;
	Mon, 14 Aug 2023 12:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D227510E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 12:46:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe4a89e7efso38372545e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 05:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692017175; x=1692621975;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kPg8mT0qGY6qbRMrFGYf6f8zh9YxV/m5DARJPVVyyy8=;
 b=uSd6lNXktTpohl+0hq6b6UEfImFdVbGSUns9LlDc46OwRy4ymGeZXPD7yMGUcCdSAJ
 ub5zTqP5aCTpWesGTQWRlwYVTxEjNb8yuCpjVGU4v8LggiPvBGLbyFmsHtwjGSWUd91R
 ucvFFzDHkhzSFQAZ+SR2ix+zWGnME0CVYJiM3HAPewoVWqHJ9Q3RomNAcNUSo8jKszRm
 m4VXfWe1CsofurF2N3TDLCvi72MdHr2bNBD2qsGFh1/w9/M6XUgr2VUVeOH8Z6zb+erx
 gc7+r6e44y2I0NbzBTUrf8Pdx1hsktuVTJszc2gslCRqZd2vbBOhgOL7wqFpmgrmIcZf
 QxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692017175; x=1692621975;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kPg8mT0qGY6qbRMrFGYf6f8zh9YxV/m5DARJPVVyyy8=;
 b=Couk40a5KNr8U/e7Vi7Kx2HUJ3byE7AxpbrDDOaQuWs4EU1D4WbTjx5s33AEm/Tm2O
 SX8PMP1g8GCKiqZT26E4COyXnCTgt/d72e8RYQo2nKdiEjbvkYkpLuCeXQQ+hrrzMP1e
 3kgTYZtEXHFqTfxF4lcKjUmTQ/cwSEjY0j9eeZC5PBKZ1ywM8iIJ9B5G9AgOHtdCaNSf
 r3Y75tyucc1DRmV+so5t4cU6Wopoy1R7is9oUcAeWcRBrABpw3NgvgIrWXBkNouK8rzR
 nLsXb6E+22bgw9K9xWQW4mkk9oEfi45IJuupEXlQBcxm2Ruxy9A40MaHyKDjpdPiHcR6
 Ol+w==
X-Gm-Message-State: AOJu0Yw4VNPQ0MzuI7oeXa9jbQYYHYgq0JUDWIFcYIFP+58M1QwL+Xbn
 V84GgMDbT/JNky2k70bu9IObSQ==
X-Google-Smtp-Source: AGHT+IHLvIZkW6GMLB2kk5tUZymEkm/TENegzimmE39RexsRxHeMXzQelswaRvh77Epb/xJjjjwzZQ==
X-Received: by 2002:a05:6000:11d2:b0:319:52da:8f0b with SMTP id
 i18-20020a05600011d200b0031952da8f0bmr7078941wrx.17.1692017175282; 
 Mon, 14 Aug 2023 05:46:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d444d000000b00317f29ad113sm14249506wrr.32.2023.08.14.05.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 05:46:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Heidelberg <david@ixit.cz>
In-Reply-To: <20230812185239.378582-1-david@ixit.cz>
References: <20230812185239.378582-1-david@ixit.cz>
Subject: Re: [RESEND PATCH v2] drm/panel: JDI LT070ME05000 simplify with
 dev_err_probe()
Message-Id: <169201717460.1374248.10255563914094623765.b4-ty@linaro.org>
Date: Mon, 14 Aug 2023 14:46:14 +0200
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, 12 Aug 2023 20:52:39 +0200, David Heidelberg wrote:
> Use the dev_err_probe() helper to simplify error handling during probe.
> This also handle scenario, when EDEFER is returned and useless error is printed.
> 
> Fixes error:
> panel-jdi-lt070me05000 4700000.dsi.0: cannot get enable-gpio -517
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: JDI LT070ME05000 simplify with dev_err_probe()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f5d8f9c0d8b4bc8ad7e7b23a9f4d116e99202dd3

-- 
Neil

