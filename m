Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DCE6C51B7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 18:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6579110E9B4;
	Wed, 22 Mar 2023 17:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B51710E9B1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 17:03:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 p13-20020a05600c358d00b003ed346d4522so11952111wmq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679504596;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dujRv61zmcVnrqSD4vDmJ5J/GQAubkah0V6OA3TTILA=;
 b=sKtjJBbDGU0biBN4S1JJo8juFcgpQhRBWIJGAKcjYfqy9mDBkD90dLvyqe3atDMZ7O
 XTgAUDtnxcwY8iFQsqcSfi35s5ERoHbHgpFJZMZFzCfkkDAQS1EQ7IzcOyVuYFlHjKRk
 ne1VdqeF7UJMvsWNQ0dSNlR/MGVit0NsFHHwthFZzTqT+af4yQgPFvda/iKJhrFzg64r
 tuJrYlBhriAgxXqAAEt+D70oT3QTn6kMuGIUrIp2ZdGAl6pKcxqDh3Q1TyOnUM1pQO5P
 9Sa8iTQAyeCByYSrmtx93sMxXdfx4TSd+ivb69qC5fn145xqbb91EKgJzCsF//6Jz2x0
 agOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679504596;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dujRv61zmcVnrqSD4vDmJ5J/GQAubkah0V6OA3TTILA=;
 b=vMtep0zPlQ3gCMnkhMfxzrdv1ZeatmhZKathwzpBMDvM/9Pg5AL0HCsvJvukkS6jLI
 fcSoNfKgXKJ6R07hg6wvXoKxsFxg12f1sTiixPnnILOcDLqq4e0fiexEKdqWzNTjJb+D
 L1IcwINt0NGGiU99IdstcsqF4R8lS3YpWTtPalCYmvtTPRW3yL+0KvV6BSFHnmh448c7
 umlKCKV6hracetJFG6RrUJ4KjeHhMFe6Cny114+9gE+hTKV3xWv5tcFymepGTU+jM+1s
 2QnhSUvRuvb+pEI+WCw6U7mcb301M0Xgr63Ld66BmHvDvhNWOjlzd3MN6Y/z6xX1E+VO
 ouMA==
X-Gm-Message-State: AO0yUKWb2/Kp2thzPB9A6SQWJGNMAbi+frjh2qbc/narekAe0p8mIGl1
 X1cDyjCgU6pn9iiHR3zxP4iVgQ==
X-Google-Smtp-Source: AK7set8xfrpjFFbD6r13fZmKLXi2Ry9Kxeb7eX/Cxlh2km+WD2n0mJl4cS46A1F/aNWPtnFIBzQJ+g==
X-Received: by 2002:a05:600c:2182:b0:3ee:3d2d:841a with SMTP id
 e2-20020a05600c218200b003ee3d2d841amr172302wme.24.1679504595885; 
 Wed, 22 Mar 2023 10:03:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a7bc5c1000000b003db03725e86sm17553580wmk.8.2023.03.22.10.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 10:03:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Adrien Grassein <adrien.grassein@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Francesco Dolcini <francesco@dolcini.it>
In-Reply-To: <20230322143821.109744-1-francesco@dolcini.it>
References: <20230322143821.109744-1-francesco@dolcini.it>
Subject: Re: [PATCH v2] drm/bridge: lt8912b: return EPROBE_DEFER if bridge
 is not found
Message-Id: <167950459507.530086.7266374998941792767.b4-ty@linaro.org>
Date: Wed, 22 Mar 2023 18:03:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Matheus Castello <matheus.castello@toradex.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 22 Mar 2023 15:38:21 +0100, Francesco Dolcini wrote:
> Returns EPROBE_DEFER when of_drm_find_bridge() fails, this is consistent
> with what all the other DRM bridge drivers are doing and this is
> required since the bridge might not be there when the driver is probed
> and this should not be a fatal failure.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/bridge: lt8912b: return EPROBE_DEFER if bridge is not found
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1a70ca89d59c7c8af006d29b965a95ede0abb0da

-- 
Neil

