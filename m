Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4AC76E325
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236E710E5CD;
	Thu,  3 Aug 2023 08:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E0B10E5CE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:30:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbea14706eso6818445e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691051416; x=1691656216;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nNIwIsxjJmaxEOlzObqYJVtWFyFSXBlHeRED/hdg1QM=;
 b=zkUcyVf3rAwfq2kXleCApjRklB37tbgUSpZJZcWihX4YqFsXhDPT08HsaeexVppIJN
 BiU979I05J7Ofco1yJWqA2Selw2anFzQlMJ9b52bRDU5eSQu+4HDT3WaWhqRYYJNXco0
 607gAj2kCIAI4OOaryKYJVoHAkZqOgEGJCeyy6Kv6afJRG6e8PnwJh82sAfN/mWJaieu
 mMgdCZhaqDtzx4UUKqHD4XYciCWO4ial6KfutteiIblA0R2kN2yxKpd8vnQeAsp1Vawr
 1wR4BsZQgBhVIZbRqxJ5os3lbxJnlsjlUtyZgsSFHhPAEDqNcyFQWozO1WWvxAGUcBuy
 AGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691051416; x=1691656216;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nNIwIsxjJmaxEOlzObqYJVtWFyFSXBlHeRED/hdg1QM=;
 b=VgqIsY46+5dAbEmjsE/5ZYxzBDElYsnhLNBlmxhsXucgbDZ1mMfKj65jkQbWDjgjN4
 Cj1wmC1afSlR8Ix/vfDibzMHW+6hoPACy5LW0ncQsqnFMBpzoJyIqG9qEIGyuVFSQZ/l
 ozQLXnD8A16qJaGdg4Y3ap2MeG6OpXH2YxWycNpzj+tbrTqOIfcYeufIsPKurDBxbSXh
 zbYnHUNtsCT9u5qYo3eV+CPWE6PO8Yg8QD0DPcGNaedII45K+1qjrx24HLU4aCyeCqhn
 fD+ZVaKuIrqND1GoAkLJoqCRN3IrokorbzSJ/VdgPJ2gjEX99/K2hzgs1jp/qul2IFSg
 o+pQ==
X-Gm-Message-State: ABy/qLZSlHWm0lDU9GNNRwZwSXkmOwl8n44dwa5bIczoswjVQ+jbuhLG
 6tf1z2DBg7X4KHKbnEh7GnBnHQ==
X-Google-Smtp-Source: APBJJlEmlEgVB4qWrr+du5op9x/yldXQVJG0mpC1p+iIiQpwaJOgPx/9LF3cVhUUTgDcV982JHnuWw==
X-Received: by 2002:a7b:c4c5:0:b0:3fe:19cf:93c9 with SMTP id
 g5-20020a7bc4c5000000b003fe19cf93c9mr6412813wmk.1.1691051415958; 
 Thu, 03 Aug 2023 01:30:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a05600c219600b003fc080acf68sm3646649wme.34.2023.08.03.01.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 01:30:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: andrzej.hajda@intel.com, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch, 
 u.kleine-koenig@pengutronix.de, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sandor Yu <Sandor.yu@nxp.com>
In-Reply-To: <20230721124415.1513223-1-Sandor.yu@nxp.com>
References: <20230721124415.1513223-1-Sandor.yu@nxp.com>
Subject: Re: [PATCH] drm: bridge: dw_hdmi: Add cec suspend/resume functions
Message-Id: <169105141513.2515343.11302551139534235865.b4-ty@linaro.org>
Date: Thu, 03 Aug 2023 10:30:15 +0200
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 21 Jul 2023 20:44:15 +0800, Sandor Yu wrote:
> CEC interrupt status/mask and logical address registers
> will be reset when device enter suspend.
> It will cause cec fail to work after device resume.
> Add CEC suspend/resume functions, reinitialize logical address registers
> and restore interrupt status/mask registers after resume.
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: bridge: dw_hdmi: Add cec suspend/resume functions
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=db1184e410744a680f92ca21e5acd5ae54510db8

-- 
Neil

