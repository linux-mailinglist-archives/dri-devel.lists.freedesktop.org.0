Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F97264CE60
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 17:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B44310E03B;
	Wed, 14 Dec 2022 16:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9347610E03B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 16:51:43 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id a16so23368582edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 08:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czD2rPOx9OiZcdJviML+H8nDE1bCxJVFDnkUjNKkP+g=;
 b=LEb7HZpqHNLosW6dXyA2OiFJA5bKjR1TN9jw+WfKLEhClD5CLL0XhnsrSv2L52/cU8
 zJ+wJrRlHXk+bv9u/XHT+erWxwYGz7SC2xfPO0xfOdZDbHsV2ATwck18gEyxqOuAnYWY
 VLwmSwjjF5HXLbcNg2nLJiarnFZucgdCw6sX1jV9MfQdvWRe8L68Ku6Ft3KkBDcw7k5g
 C+enr++FiA8f1yNt19eONDe5kTEEeNMB8X3FFg1H7ZaFXS8thAkGk4SXh6T5eJCLxlgw
 CqW8QncumriceyvwjREh3FkFdovcNlbrqhcmzTtvYQbiNGXnyLylVXkkuAaji1hhelWr
 T9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czD2rPOx9OiZcdJviML+H8nDE1bCxJVFDnkUjNKkP+g=;
 b=qmNmsiYm/N11BwCFp+0fkmJE6jD+8PWQ9ClxEOHG35dRluzKzNIYP+LfQnYX3kjD5x
 OfxeY4OLmS7UNVYJf/G/g5qJLWTgZffy977+pjhGtRmEfOZPnFvuwwP3CVaz9j9/E3SP
 vzYmQTvWd19X/A2RfFoegp3D1iOqvXzJcbLCnl0VG9CrfxDiEzPDUBWFvXbhtmcuxUFo
 EC0waprp3+WQV3QOPiKcLDOC3WumYtAKTKVX5QsjFfRLsPIJyn1PjqUp7byIfOvy9uzJ
 4kOZxI7T0xG/Kyln/REQi4g9FAiuk/3YO0hpOqjdEBRngIAIrc3wdVi4sqnetr/Hug0M
 h43g==
X-Gm-Message-State: ANoB5pkgi1fXv4jEM5566skQW9V/yGwCG2E9WRmmVCCVKiLjruhP+w8F
 eh2nPD/9JTbZXaWK5JuvFqCSzw==
X-Google-Smtp-Source: AA0mqf6jNv3/NX9rm+O5/sllvALiPUWVimAqqQ0Ee8xAiZf4HNQ9uqqhxFGKpzX7BsoWPTZm1IGcHQ==
X-Received: by 2002:a05:6402:110c:b0:46f:7453:a99d with SMTP id
 u12-20020a056402110c00b0046f7453a99dmr12178462edv.6.1671036702339; 
 Wed, 14 Dec 2022 08:51:42 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 lb19-20020a170907785300b007c0a90663d5sm6010023ejc.162.2022.12.14.08.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 08:51:41 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH] drm/bridge: it6505: Add caching for EDID
Date: Wed, 14 Dec 2022 17:51:33 +0100
Message-Id: <167103665890.995711.9267085599513513874.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115112720.911158-1-treapking@chromium.org>
References: <20221115112720.911158-1-treapking@chromium.org>
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
Cc: allen chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Nov 2022 19:27:20 +0800, Pin-yen Lin wrote:
> Add caching when EDID is read, and invalidate the cache until the
> bridge detects HPD low or sink count changes on HPD_IRQ.
> 
> It takes 1.2s for IT6505 bridge to read a 3-block EDID, and skipping
> one EDID read would be a notable difference on user experience.
> 
> 
> [...]

Applied, thanks!

Repo: https://cgit.freedesktop.org/drm/drm-misc/


[1/1] drm/bridge: it6505: Add caching for EDID
      (no commit info)



rob

