Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780017B4C5C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9AD10E20B;
	Mon,  2 Oct 2023 07:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5562610E1A3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:11:52 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5033918c09eso24764715e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696230710; x=1696835510; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uiq9+pVHUYbBnQZsGKnsCJMnhp9kzQom08VF2zcrJVk=;
 b=UcFFYkrvZr2dPh1tn8XTDAa7zO0rTSc4VJwd2iwP9+I/k/RivnjVJZc81EmMbUa4BF
 bnqEZiBjQyCyQb2u6gdSr5RMBgltw80HdV29kYpB4LfZPeN9ipZPq1HqNQKLciREQpP6
 OwE5R35q2nI4ynu1IuwYUqfVeqmVjkoKLOR0SI/hPZuTfa4G5F0ylZ2KrECNmTwrEcCu
 dlJqFrl66b4QcoYZPCGI9ARqWtllTad4i5V+t//71viL75D/oJ+Fearl6YUIjpZp/HDV
 +UArSj/Hh52zxuE45WnFhf+hClU+4T0IdeayH8JY3K6JNYX6+jvyGvyJ8uVUpVUS/7CZ
 uhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696230710; x=1696835510;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uiq9+pVHUYbBnQZsGKnsCJMnhp9kzQom08VF2zcrJVk=;
 b=KmlLoP8euqtGidpZfnVr3V5/j/GgmzmmPVJ3ADg8gWAy7WDKUqMtedvQLyyYoRkfEH
 0XWMfOg+6F44SY9DXOoihFQ4HTVvRjaoSH+P4UvCAEOXDYqaqqYybQL5//GENm6sm3G9
 eqTPjBhHxV9HyVNnrdfH0BOAu2c0iF98Mqrw+UCXb8HebNInPBg5orAAtKjsG2Ds6X8l
 WC3z0thEKl+Db+ZZpp5QiS5hY7oxPivvXC2JZjmhxdXtOQA/QCw3XIh19bGaO/mx1O6j
 Fkz41eUwCDSMlnIhMJPbqX5KllBIX0zBq0xLg0Uca36tuKOZ64gju9SGkzl+DGbE5mD0
 /pKA==
X-Gm-Message-State: AOJu0Yy8Dx5WiuWFLGcnrZ+GsALjA0nGtLDZMU/dAJUJxbZqn1IGaBg3
 l4YrDPn7dmi8TgZGUx1gX86JeQ==
X-Google-Smtp-Source: AGHT+IFJl/CfWMu3s4dAgiVWtfF3mxSDvQUJlt4LH67191t9D8qRoLsyzJoryymS3jfXet4MnbckJw==
X-Received: by 2002:a05:6512:3189:b0:505:6ef8:2544 with SMTP id
 i9-20020a056512318900b005056ef82544mr8551825lfe.63.1696230710570; 
 Mon, 02 Oct 2023 00:11:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b00405623e0186sm6601371wmj.26.2023.10.02.00.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 00:11:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20231001-drm-chipone-maple-v1-1-fb3ce5a53710@kernel.org>
References: <20231001-drm-chipone-maple-v1-1-fb3ce5a53710@kernel.org>
Subject: Re: [PATCH] drm/bridge: icn6211: Convert to use maple tree
 register cache
Message-Id: <169623070969.3600226.2109511529141649390.b4-ty@linaro.org>
Date: Mon, 02 Oct 2023 09:11:49 +0200
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

On Sun, 01 Oct 2023 00:46:38 +0100, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: icn6211: Convert to use maple tree register cache
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=fb6f4f47dd4a71a0394d346eda7589dd9397c4bc

-- 
Neil

