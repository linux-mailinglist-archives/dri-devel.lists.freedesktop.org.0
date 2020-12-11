Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9733C2D7178
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7EF6ECCB;
	Fri, 11 Dec 2020 08:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD7F6E506
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 00:46:15 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f24so8863660ljk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=TgFRl4hY2jVegpQsEVcSi759bqYrRdxorewfve1OEAM=;
 b=WWqd4F0EGETgFArsXDAFcxPg0XMQ+HOwpv7O40kc3nluV/bF9mIIBiW8+Eu0GMg+lo
 n8PSOfLmU3eZ3MsB4yUyMeT7S58MsYUDqfsVOWIUZGb3FE5EQGp7tZzcG20WDd0UCH2E
 DE8dURg+HXSDD430Z0yyeoNQ5LcKrgq19v+oKN4pjpei7j8MspKtF6iEs+i80Ieqtx2o
 ZJ9jPMhO7BwPvPN8kjSLYIkfKSlN7Pm9sMVGFklzKGdHRaCzUU4/ijBYSVOViyqR4Iu6
 yNFdw/q9aUN2T6X5D0I2I2+Pq9MxP82riNs0/u1CpDQTZfb8E2JbTpJI4KFlDCsw2olI
 MG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=TgFRl4hY2jVegpQsEVcSi759bqYrRdxorewfve1OEAM=;
 b=Qwe7tntAfsZ/+2Xnm1eiFmqqkwnT16PcK6FVc33LBjKI5HdawpMIlYyiCfEz3zZ7ld
 wpMQQjYq4ogMt+ZHQeQkYqytJE6GDGpXnNYwqlpCrYFaitncS43SkormsOOdCAvOAK98
 0Gh0iV/1E3BTF77YIW2SMfmauD8IL/Grz6U0g56vz/zFRuj7BOprZNQRvfzPDBa23abs
 PsZXJI7Wm12lP/i2b1+/1sRrEYiOJtRcGwriTjnarJyFJPtJMHObLvbcTn5CuJGOECTa
 URI0mn1d5GHEZhFGsBCYvSU1SqMlJqjNkfgfd1m9CAbmEV11ArJ8U1jACcZ3i39Ng2dC
 70jg==
X-Gm-Message-State: AOAM532vBpD7BclaccGY+kAbHUUD9xZXWr8JO77hwiAMHz9ZpvVl4+M0
 +3BtnF68vaEC+/HcrJeQRFNTug==
X-Google-Smtp-Source: ABdhPJyfGzITQ3mb+eij+usHJPbNHtfUfmXccmO08xQzZQht6KMEH+jL6qM5c5dp4ugrWMhfPQcZ9w==
X-Received: by 2002:a2e:681a:: with SMTP id c26mr4091377lja.412.1607647574097; 
 Thu, 10 Dec 2020 16:46:14 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.52])
 by smtp.gmail.com with ESMTPSA id u11sm694953lfq.142.2020.12.10.16.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 16:46:13 -0800 (PST)
Date: Fri, 11 Dec 2020 03:46:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-firmware@kernel.org
Subject: linux-firmware: add firmware for Lontium lt9611uxc DSI to HDMI bridge
Message-ID: <X9LBUn5KIKVKQGlI@eriador.lumag.spb.ru>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:07 +0000
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello linux-firmware maintainers,

The following changes since commit 7455a36066741a6e52fba65e04f6451b4cdfd9c4:

  Merge branch 'guc_v49' of git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 09:26:11 -0500)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware lt9611uxc

for you to fetch changes up to 63ab3db8399a504048716eb3feed2867da58876a:

  linux-firmware: add firmware for Lontium LT9611UXC DSI to HDMI bridge (2020-12-11 03:27:38 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      linux-firmware: add firmware for Lontium LT9611UXC DSI to HDMI bridge

 LICENSE.Lontium  |   2 ++
 WHENCE           |   8 ++++++++
 lt9611uxc_fw.bin | Bin 0 -> 17932 bytes
 3 files changed, 10 insertions(+)
 create mode 100644 LICENSE.Lontium
 create mode 100644 lt9611uxc_fw.bin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
