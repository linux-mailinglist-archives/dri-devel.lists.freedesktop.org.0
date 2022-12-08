Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51164774B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 21:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AE810E1F7;
	Thu,  8 Dec 2022 20:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F3810E1F7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 20:29:00 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id l11so421691edb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 12:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8WxnA+0hjy8Yr+4yHmOoSs9ITlTqMEqWN8NkekBvV0=;
 b=CdnjVnaR14zo0vAXl05kBzlv4jHJz/ja8XnMDGfU8xF7ucn4EgXsRRC4a9lbF1xwMT
 4EJtngAUCVYZRr4+ykUuDiQ385ZYIDD4J/XWpxBd0SF0o/uoYJMQLvwHZRfD85K0w8aM
 5dRULtcIKiON868CGv6nVN1/HhCLgTMOrgbO1ptvk+XtlNyRGRblr7cwVU3GbNA2c/Vx
 x5BJxFpWqQsn5QfZ8l1dJ3EYqjUZ5evwIi/4EmzB3k5/VgqDvuLJSH1LpB/Lp4XY1Rhd
 SPoEnl6HHJPrejb65l2SksoZGkz6/tMj+sWlnGNT1+zC/ZV3H44R0zJYcHVvwZxoc4hn
 tyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j8WxnA+0hjy8Yr+4yHmOoSs9ITlTqMEqWN8NkekBvV0=;
 b=ZBK5cs05tFe2ixoMHA4jY+PLHwmxygaSqFRd4RhDvxzX2vhzOlWK2YAeg007chvCnm
 VqWG1JCJYVDE001XzqqW8x3lTlbdpq6YftBttzNIjAyh1RsTl2SJxZhELeRt+eTCx4Rc
 tO1mGDCfVgsJdzIWqqKKOGH7WgTm+WGhmJToyWlaVXw0A0jUI6fD4qmMXSfEoWZYuHcG
 zGYqktocTHYlcKvdFDgxjmFMzXWBIvPaqeoMqYlEtGEFcKhhLmnFLggrn77qX8GkoJmx
 z46nFuk6WIkfzUTNx9ejIPwUaSEqm6XmP4ig7mHOl1/b5l8rVe2rMUORIKvvCVyQo+CF
 10FQ==
X-Gm-Message-State: ANoB5pkSg/M1SLvtRHw2r6c8ijBh9NY2dmQB5Z4KssjgN2P94EmFXLxa
 fNvISjO/Em64brToM+iIBt3VxA==
X-Google-Smtp-Source: AA0mqf5rcV9xRtY1h4WfcVI8l8vLRyw48pLqC/U7iu2ZM9S9IdpvJUn6Grmyc33O3GUMZgzfTa7a8w==
X-Received: by 2002:a05:6402:5303:b0:462:8a68:1398 with SMTP id
 eo3-20020a056402530300b004628a681398mr3911867edb.1.1670531339216; 
 Thu, 08 Dec 2022 12:28:59 -0800 (PST)
Received: from [127.0.1.1] (freifunk-gw.bsa1-cpe1.syseleven.net.
 [176.74.57.43]) by smtp.gmail.com with ESMTPSA id
 d16-20020a056402001000b0046951b43e84sm3768858edu.55.2022.12.08.12.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 12:28:58 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>
In-Reply-To: <20221128112320.25708-1-francesco@dolcini.it>
References: <20221128112320.25708-1-francesco@dolcini.it>
Subject: Re: [PATCH v1] drm/bridge: lt8912b: Add hot plug detection
Message-Id: <167053133778.136002.7853520111794551395.b4-ty@linaro.org>
Date: Thu, 08 Dec 2022 21:28:57 +0100
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Nov 2022 12:23:20 +0100, Francesco Dolcini wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Enable hot plug detection when it is available on the HDMI port.
> Without this connecting to a different monitor with incompatible timing
> before the 10 seconds poll period will lead to a broken display output.
> 
> 
> [...]

Applied, thanks!

Repo: https://cgit.freedesktop.org/drm/drm-misc/


[1/1] drm/bridge: lt8912b: Add hot plug detection
      commit: 3b0a01a6a5224ed9b3f69f44edaa889b2e2b9779



rob

