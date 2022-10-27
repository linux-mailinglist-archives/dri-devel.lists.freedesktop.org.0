Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E15160F67A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 13:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF29710E083;
	Thu, 27 Oct 2022 11:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EE010E06D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 11:48:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id o4so1726406wrq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R42RojmRq4zRc2qoWo071bNzbgLKUBvyZz6AeJFc7EU=;
 b=wBunsa6VUQ0hJ5y0LmUYP6d+PBiC5O2xuJ2H6K0dQS8BmCLaCNDUfCmNCfJgF2y4Jt
 3f4DqIWhRIQ5oNVHNjxtpRd93D87SybKiZUEZBNlDBJTkxKDJloEUEUkwxoscwRHLlPS
 oalspQgNVXJlOSQ1F2pOoc6GqzfGUI2dlLBNAdY2ZN+tYPbfq4xTS5QCGYDo6J1pU9ha
 surevtxCRRsIUEa2tbNLA8lWl2pZUc8aiqPiGB9LmR2F8sAd2IZcJPiyd7zfvBsa6NLU
 uV3/8vu5rG6E7d95NoGM1ZXP0DUNVQ724i48YARqttPT4rFgjmt3dm5Hk/Y1ay9YCHtk
 rjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R42RojmRq4zRc2qoWo071bNzbgLKUBvyZz6AeJFc7EU=;
 b=H3MlvK5hgdeyTXaIHxGXH5iLwueJPA/Xr9jU5mggPSo/GWmShaGlxhNZki6WG9nPJf
 1LfoAtD6kPadgOkLCEh4vO2p7mSw/zjg6eUdwGlqAgnDSHB+JMnHFOcWAVIylPyWj6Ag
 mC/xHPTXWhnu0NgiYG5KkUrLT8b0biJclBPGauzEnhlGJaEhJDFVDMBCdxR5R3JCMbcV
 5OnkwPLd02yZmWTjsqIc0v2hp5rH0dq969Zi35dDQvmuZs4sCI2TTmPTok/KHodrDi2Z
 NnMJiXJmTmpB3Wtqj08xvFkWolTveG8DgOJ9C4f1fMiYTKrJoKdGlZn6jrc5fILH5AJL
 G7Zw==
X-Gm-Message-State: ACrzQf0prNGOydPRaPJZrERS75LENlMQblqZn+AxSSXaLugOGW5XNtws
 TF+hZLTw3Axu167FJAaAYM/8sA==
X-Google-Smtp-Source: AMsMyM44o5az+ftHI1eUglivxRIwCzyx+vdVtkBbLWHRpfg4EtEfocLMTKpLwOLTgeoa+mzvwNPYIw==
X-Received: by 2002:a5d:52cd:0:b0:236:57d0:8245 with SMTP id
 r13-20020a5d52cd000000b0023657d08245mr19746347wrv.152.1666871293206; 
 Thu, 27 Oct 2022 04:48:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c4ec700b003c6f8d30e40sm4965699wmq.31.2022.10.27.04.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 04:48:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 David Airlie <airlied@gmail.com>, Pin-yen Lin <treapking@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Robert Foss <robert.foss@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20221027032149.2739912-1-treapking@chromium.org>
References: <20221027032149.2739912-1-treapking@chromium.org>
Subject: Re: [PATCH] drm/bridge: it6505: Fix return value check for
 pm_runtime_get_sync
Message-Id: <166687129194.255790.5379007139658764602.b4-ty@linaro.org>
Date: Thu, 27 Oct 2022 13:48:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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

On Thu, 27 Oct 2022 11:21:49 +0800, Pin-yen Lin wrote:
> `pm_runtime_get_sync` may return 1 on success. Fix the `if` statement
> here to make the code less confusing, even though additional calls to
> `it6505_poweron` doesn't break anything when it's already powered.
> 
> This was reported by Dan Carpenter <dan.carpenter@oracle.com> in
> https://lore.kernel.org/all/Y1fMCs6VnxbDcB41@kili/
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: it6505: Fix return value check for pm_runtime_get_sync
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3e4a21a29dd924995f1135cd50e8b7e0d023729c

-- 
Neil
