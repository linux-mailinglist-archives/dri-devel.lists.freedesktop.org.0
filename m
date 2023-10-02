Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A997B4C5E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7235110E20D;
	Mon,  2 Oct 2023 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0733A10E20B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:11:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-405497850dbso142035085e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 00:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696230712; x=1696835512; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKGiwg0kzwrgwMuSE7lVQeLBJXKyNEtXJnfvBT0Ae9U=;
 b=I8wCfY8sDtov5BwAqa+sLOLCJimLt6AMVCrAToG1/2GCbKdKfkwC/AYknwlpMWrtN4
 XdfGrtJYIAoRrTVA/ssduEMw1svQBhe8r15rmZsREnC3+hOSu6VYpMLVMkUX15/TTygl
 bD2uMUHtCZQHssQlOMVt+pq4cJbqIJQ9aofP05uHj1Xs7jKGOmMS+ZshT7pBgekboUTj
 GRDQ/N7kGxYWNpMU2w6N2wB8fm91yW9vrXw3o/yloi0ww30ZvGWhN9ezzstT5ilqelUN
 cI1o+S9nwJ2/c0rdK3ycI541OdkTH20qvxX3aA8/Q7TFzLHiDdEho4BbpfYg/3A/WgZU
 vwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696230712; x=1696835512;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKGiwg0kzwrgwMuSE7lVQeLBJXKyNEtXJnfvBT0Ae9U=;
 b=S7ex5gYuHEMmXTZvFhzGNLS27uOHE5avCqUFXahY1qnhbQ3hqS3O7sD3BQ1pIivLku
 MspKa0/eo4akjK40l8KLh6SCcjZ5usQx2N5bvbWGuRZCDWrv+9A4vaGu5n37MuM0OlPL
 QZAyFx9Di3olrABn5wBgDic2QREPv0wg67pARqlwIL6pe0SbX8GG9MiLP9GjWU+EvyVG
 4GmNgyRRP2PgqlSwf6Py/Jp9ZHLvcVRwu0ZtHug1ldyhfgshdPpx061Gq9zp4RIBuZgI
 1TRhBdWxXkYzDAU8CWOrJAuZQmx2bxwWe901ze2R1Mj2Ss5sdnojvMYnzSgLTVUmWDZJ
 Ti8g==
X-Gm-Message-State: AOJu0YwEjcgt/N/FllkZacUmeCvzkgdj6JVzYLCFNIaGPGZZSI22HoB+
 4aVLLffPnK8P57b+dwZSw/ZMuw==
X-Google-Smtp-Source: AGHT+IEBXLLjLVxLUhpaMo4GWOu/TORHc/EVul2gZUOumUPoUmfEf9fOSL+NkxU+zxphePd/sitxDQ==
X-Received: by 2002:a7b:c3d2:0:b0:405:1bfb:ff14 with SMTP id
 t18-20020a7bc3d2000000b004051bfbff14mr8929570wmj.9.1696230712390; 
 Mon, 02 Oct 2023 00:11:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b00405623e0186sm6601371wmj.26.2023.10.02.00.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 00:11:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20231001-drm-sn65dsi83-maple-v1-1-cf8ad22b6be0@kernel.org>
References: <20231001-drm-sn65dsi83-maple-v1-1-cf8ad22b6be0@kernel.org>
Subject: Re: [PATCH] drm/bridge: sn65dsi83: Convert to use maple tree
 register cache
Message-Id: <169623071158.3600226.17074010436243792465.b4-ty@linaro.org>
Date: Mon, 02 Oct 2023 09:11:51 +0200
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

On Sun, 01 Oct 2023 11:26:22 +0100, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: sn65dsi83: Convert to use maple tree register cache
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0908a0225d0fa6d7675bf3c2cc4c25a89e13e83c

-- 
Neil

