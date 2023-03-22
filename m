Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DE66C4847
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A013110E910;
	Wed, 22 Mar 2023 10:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F398410E90F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:53:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i9so16525393wrp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679482380;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzWdOETeKkfj0OjRM+C7rh/5LlaXa2JRYFRBahnbMUE=;
 b=wmDrTIFohkUG8pxLgNrsqVVqKFLE4nfuGcK4Af7uKUCQmD2NT3xA7ub9BUp5jqYgtE
 aQrQdvWorAfxrjZAvqjv7SvTfWg4YR1KnhDtgX9Tnu36Objyt4kMS1jdHwhTPQAXn2ef
 SDQlOgqxnzksE3bVaMrii+lLFHYWKP7JMp6IXePGrldVqeOw8ot2SZPNyHGhIMZ2JKuX
 DepmNMGJHveaY0a1G5V1UAQ/iWiAsJfzF4MViz9yUGnYk/ujKTv7yAj+lefBtP6eszxQ
 GfzRboP4/DTZ7tOPhDaXB0blq/y0YaT0GthkKVPy+sJxO9sF+dE6XKD0TMJe7ZlVZvfa
 TKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679482380;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NzWdOETeKkfj0OjRM+C7rh/5LlaXa2JRYFRBahnbMUE=;
 b=WXU5TIpALTGftYnj573oo8UR0CUKVYIY/k2v6IF9Fnc3n/ZLvFGW9fLdG+lUZDkp9S
 0QKfHdVQQlGm7TwEf0ZWNjkvoEoU/fAgg9j1epwvxMNeW88ZTz4y7SUZPy5GkNt5pYkP
 8wHlO1SQuPrCW+MXGQ/YoQU2aFmTvu8tbcqxo7K8R3Ge3LbNSYUv9HTsNVWZsS1jkVVZ
 zYAdeZT04SoAwTkmJJjMIICj1DOeUbeSFnsNtZdTJ3NosRSpjRWqwrw0JjGB7rD7EZEP
 SstNMjRZ2GmwVHVW1wdpF+euG5JDTaQbV9U0cLFI7Z3B3eQJeKsQDuLdRF/Qa8R+GI0L
 oV2g==
X-Gm-Message-State: AO0yUKW7xgTSkwcTsqdY4y8o18gUaz32XiV132nlzvzkoC+XR2JRY92X
 J3E5mts2+oB2RJ/0Df2cHtu+nQ==
X-Google-Smtp-Source: AK7set9MJI5Uw+Netidw+IiEGOmh4is+8m96rUXxAiW8nBCSWWmBCMEeEQ4D53DFFAczickRyV2ACA==
X-Received: by 2002:adf:f688:0:b0:2d7:998c:5aee with SMTP id
 v8-20020adff688000000b002d7998c5aeemr4821335wrp.17.1679482380462; 
 Wed, 22 Mar 2023 03:53:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 j10-20020adff00a000000b002d1bfe3269esm13555049wro.59.2023.03.22.03.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:53:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: laurent.pinchart@ideasonboard.com, ye.xingchen@zte.com.cn
In-Reply-To: <202303221621336645576@zte.com.cn>
References: <202303221621336645576@zte.com.cn>
Subject: Re: [PATCH] drm/bridge: display-connector: Use dev_err_probe()
Message-Id: <167948237963.3845492.14392683700321737363.b4-ty@linaro.org>
Date: Wed, 22 Mar 2023 11:52:59 +0100
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
Cc: rfoss@kernel.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 22 Mar 2023 16:21:33 +0800, ye.xingchen@zte.com.cn wrote:
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: display-connector: Use dev_err_probe()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ed8f4e1002781c47813e4e2b37ad15b927fd8b67

-- 
Neil

