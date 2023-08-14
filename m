Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9399077B8E6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 14:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C73E10E1DA;
	Mon, 14 Aug 2023 12:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F1110E1DA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 12:46:13 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31977ace1c8so814321f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692017172; x=1692621972;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MT4WIsJdIaKJmtpZrvoV9bGE/dt0RUZTjejJTMKrR68=;
 b=Jqiq4BJp44wWy2El0A6CsKSrG1sf+IKBoeejY/RUzOpsWTbo0kW8NRZNwt8TVy0M24
 4NAlhPnsYf4Lo3NQ3n7bi1mIC0Sltf1ogpx44uceqspe4YBOcC5JAIsydGXLpQupfbYf
 YwMilRXIfkbiu8R0F8dMTp9/vrOX6EsLGgFW0jCvq8lu99HbYZ6AZpCIo/TvVTv24aMN
 L+Ko+r1PxpyUTqPhg3uJBeXfZeLgUy8ELh38dtHJdS20lgk/CFlgFkCUhf+HaJe26o9H
 3GoJ3PXky3OsUuJCDnSWaYa3/kQ1RMoKcZjn3jUYyRnGlIf205gV6rVn5xsy3qdqBfhD
 4VZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692017172; x=1692621972;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MT4WIsJdIaKJmtpZrvoV9bGE/dt0RUZTjejJTMKrR68=;
 b=gBu3FP3MEjE3bQePmZC/slCXlFeakhrTJhlFUi3nm2EI9PdeTXKeyfgniSMLZ8Ifoy
 4YIoZTJIvwfo+Sl6I+586LIecTRZJxNJO9LTe+k09wXATuw2hYV9fBLWDz7mcf2rJF4V
 jKNjhFlU2iT/efc177FTLDN5kDBYxGpCSmKAPWoPp3L7b4kxoGepK5JCdeo2/cG6e2HR
 vcSpkXEXlOGOqTHc05EMMHNKTfDeJuhD0u9OzbzZYIHbFv47vgQJclNegjJoSWDWq7Dp
 1zUIhYSnJjivRJfwkHi4DQ8/h1DrnTjoauox/LeLJMYUUIkaaDIoMjC+LYhClDY4kub2
 1zLA==
X-Gm-Message-State: AOJu0Yxbn4g0vZjdaq3CliBDrV4thVQsRrdvYJM83WBrYGFcZY4UsTKr
 otFkhk7kMH+7JFay/rHY4M1Kug==
X-Google-Smtp-Source: AGHT+IGuiHcTy126FM1AYZ1EsMq3UD4lAKjOVCjna8Vb8pLrk8pgmfSNPub/Y3opmRkGwujYR1uRSA==
X-Received: by 2002:a5d:4952:0:b0:315:7d2f:fc36 with SMTP id
 r18-20020a5d4952000000b003157d2ffc36mr7676022wrs.20.1692017172203; 
 Mon, 14 Aug 2023 05:46:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d444d000000b00317f29ad113sm14249506wrr.32.2023.08.14.05.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 05:46:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20230807061115.3244501-1-victor.liu@nxp.com>
References: <20230807061115.3244501-1-victor.liu@nxp.com>
Subject: Re: [PATCH v3] drm/bridge: panel: Add a device link between drm
 device and panel device
Message-Id: <169201717119.1374248.4944625846885849850.b4-ty@linaro.org>
Date: Mon, 14 Aug 2023 14:46:11 +0200
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, rfoss@kernel.org, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 07 Aug 2023 14:11:15 +0800, Liu Ying wrote:
> Add the device link when panel bridge is attached and delete the link
> when panel bridge is detached.  The drm device is the consumer while
> the panel device is the supplier.  This makes sure that the drm device
> suspends eariler and resumes later than the panel device, hence resolves
> problems where the order is reversed, like the problematic case mentioned
> in the below link.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: panel: Add a device link between drm device and panel device
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=199cf07ebd2b0d41185ac79b895547d45610b681

-- 
Neil

