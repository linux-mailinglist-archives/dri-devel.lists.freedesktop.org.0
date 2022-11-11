Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FF6625D64
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 15:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8DF10E06A;
	Fri, 11 Nov 2022 14:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C267910E12F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 14:44:53 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z18so7882684edb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2JELu3fGxOmGVkXFeaA5505l4a1jidBqZD8y7rjuSU=;
 b=b80kxGzyFjuVt2eWN8RdQk5+0NuwtKPWjqUSXTc5WYzyaOpzmSNrMNy0GOL36yky+1
 ng87cTyWuvq/QWxswMcvQznMQUnr2vtZH41F5gC83Gyxsv410qy12vkzCdVK6d4JKxPJ
 oHgjHGv1pUNhRGUKAY88lWR76fsqnt1DFCZYnf+6Hv4Px+7b9sVxUbVht4cMxE0PI1cS
 wJFJ/WOUSskHlXGLiVNUk9b4kK53549crKkZzRuc/mrDXOXGYIc24IT7e2uBnhrK96yC
 on3ATboEwCtOA1Lm5GqQoMrnraGuGjZSGLLJzJWElx9PKQDpLyQKskMJmxl9fADRI2s5
 yjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2JELu3fGxOmGVkXFeaA5505l4a1jidBqZD8y7rjuSU=;
 b=gq2VjgFobvBjgEPN1sgtkctQgSjRzvGbhjAmxn/ucBjMU2CNnaYDHuIyubSppJh/XK
 wzT0Jtj9zXAIou9ViqR2NSn3QmRUL5FrJKQvpSCvlXqI2cliCLGIjG2SDcNdBZ03ucK/
 V7aP5cSpAVfJdLyO0HtDTqmF2mnQvI45kOu3ydo5JtLgTn5DPIPby9rDwOHeJHmHjxmx
 8xVjpbIhLGuYSFmcJ9+OyVrhhLg+AfeBNZVx78aqWxA/4PbyalANzmLLWQJHh+03asdB
 pZ+xyNEuTA0or1tziPDhsoZ9v+ZtkFHpA0j83QdBjZvwSKqbgVp/lr0OpHJHw49U5x+0
 UwlQ==
X-Gm-Message-State: ANoB5pm/VWPLDVwoJA81SmZZSlnhhPHi12jVloKVaIKlwTuHYwdTIhpI
 MR9BYxIWF2qnFYSDdrs6+nU=
X-Google-Smtp-Source: AA0mqf6APIwDf/9nYycKA9AOhb4lIHvy+W14xqMDOq8PsbKJX1i4YgbyVJiYdjBSEicldwvSA5U5fA==
X-Received: by 2002:aa7:d38b:0:b0:467:71de:fe10 with SMTP id
 x11-20020aa7d38b000000b0046771defe10mr208586edq.63.1668177892262; 
 Fri, 11 Nov 2022 06:44:52 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 iy6-20020a170907818600b0078de26f66b9sm943496ejc.114.2022.11.11.06.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:44:51 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH] drm/tegra: switch to using devm_fwnode_gpiod_get()
Date: Fri, 11 Nov 2022 15:44:50 +0100
Message-Id: <166817787160.520183.17377804906951332813.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <Y2neBkfe6b+MzQGa@google.com>
References: <Y2neBkfe6b+MzQGa@google.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Mon, 7 Nov 2022 20:41:42 -0800, Dmitry Torokhov wrote:
> devm_gpiod_get_from_of_node() is going away and GPIO consumers should
> use generic device/firmware node APIs to fetch GPIOs assigned to them.
> Switch the driver to use devm_fwnode_gpiod_get() instead.
> 
> 

Applied, thanks!

[1/1] drm/tegra: switch to using devm_fwnode_gpiod_get()
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
