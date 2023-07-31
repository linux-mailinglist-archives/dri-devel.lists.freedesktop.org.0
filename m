Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55317696FE
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 15:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A6D10E292;
	Mon, 31 Jul 2023 13:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6C410E28F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 13:01:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc244d307so48966465e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690808481; x=1691413281;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9MDoATswjs1rbiFd+ZmFlsPGxSU/E8E1Oltolanpf4=;
 b=KfXiwQUUk0PpbG+asOC85Ie5E5BEaATeIHE7Ci7ID5oRZtkG+0ZZ59W7rXLh++lK0g
 7YIdviLdC/sbeOhRgEL743mOR9+GyeQ7t5Su01eV4017i2c7uZ9bIA2YDLahE0biNzln
 DrPfypIkpoJ7KxVHy/XeU4hQooTuhRNe/moIsvVWMysS66+DKtXUMXIIfZVIgM3wQnP7
 jPBatAYBjtxctcXqoPr+LnNfAKA7fuCL4weVQv7HTl7wWTMtEqA5cruSvXyDBhWOZjOb
 OcxlFCKVRJoHxcd3RdhH40nPBkAjTDpWs3xNd6XBnneb1CwS4W9iTFgTmV4Rw7Z9Ur57
 Edig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690808481; x=1691413281;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r9MDoATswjs1rbiFd+ZmFlsPGxSU/E8E1Oltolanpf4=;
 b=goUdh86K7TB8UZqMxIu41FUCD/pLzQIvP6Tf2PkkCCCYXh3aLf1oNbeBmqcAqHfj5E
 vbuCvispCgmia1Fit6P5zJKGHUOwIX1HW8r76TXlgWzoV3SNyKT024Bq0t03KTDBMBrQ
 mujDoCUc+LXXYz1EqzEk10UOKq6rG4IjRlyZF0E9mslosPxMsCI70V/BPyMbi/wwLZit
 IzB55opxef6l4dF87oR6/68ba6MsXVlB18xEeTk+eWPQXhhufMGN92rdN+b8ov2U0qGq
 6LP1/rQYmR2V7cv6YDTpd2BamgiElr1aM+G6Pg9awTEWfYczGsBu6hk+TFoOJcN7Etht
 qAAg==
X-Gm-Message-State: ABy/qLbmWlvBjiJjy/YLZjHDQ9Vx/ZN1RCoAWR/78mMLyyKfSGkol87J
 rbskF37qrD42L1TZ01juryOYF/oD62TxjxiX95ucnV32
X-Google-Smtp-Source: APBJJlHKCqrvQGkFemJBYAQ2VSIrtkzuJhHyQrs9gE3ZJQvALwxbSggbuFPEBeuQekU2X+Q89CcxTw==
X-Received: by 2002:adf:f00e:0:b0:317:6348:8a9d with SMTP id
 j14-20020adff00e000000b0031763488a9dmr9326186wro.66.1690808481674; 
 Mon, 31 Jul 2023 06:01:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 j4-20020adfe504000000b003063a92bbf5sm13220390wrm.70.2023.07.31.06.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 06:01:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230727172445.1548834-1-dmitry.baryshkov@linaro.org>
References: <20230727172445.1548834-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm: panel: simple: specify bpc for
 powertip_ph800480t013_idf02
Message-Id: <169080848093.304500.18306607233351191172.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 15:01:20 +0200
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 27 Jul 2023 20:24:45 +0300, Dmitry Baryshkov wrote:
> Specify bpc value for the powertip_ph800480t013_idf02 panel to stop drm
> code from complaining about unexpected bpc value (0).
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: panel: simple: specify bpc for powertip_ph800480t013_idf02
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=65f4937fc8a8fce8d6b483c289b18abb09b777ff

-- 
Neil

