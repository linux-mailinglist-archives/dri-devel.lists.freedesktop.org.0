Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF54BC770
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A578810F6D0;
	Sat, 19 Feb 2022 10:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D8110EAD9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 14:00:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id B0F181F45C8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645106440;
 bh=ssJasQQ8weULUqHF5Y87VL+8ytcuA+D5QpQWHyuRV2k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e+8D2NrfmVm3obXlqpX0Z6PwoRJRYhkdF5E7yreEMnY4/q4bLQZcy6CW0m6BTinMu
 49KQmGTnQMM79aBTQQUP8VvzCuJK4AC8qouh9Fl625xa9Z5muNHnT4xOwa/lWtykqR
 eiDNDtCPiXivs71Bs+sSQfP+9J93HvG8hMTWWSCy5LarVdWD2xqWn1Jj9lPu7hN5+k
 nC9BorluLt0D+ovNoo+kFNk/24cJRyLUn/dHx1sIWIughQbk5qjoud8EM8w/6VbnhN
 IjKvG8oP2nZhLA5HC5qn8kLrvPggf/R2UUBfQhhK4uEGwK8OudORHZujtQjjRt6pU9
 Yh4JvrQPU7aGg==
Message-ID: <f5abe6aa-473a-a00d-2bc5-b8a1d0560d1f@collabora.com>
Date: Thu, 17 Feb 2022 17:00:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 13/23] drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-14-s.hauer@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220217082954.2967889-14-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Yakir Yang <ykk@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

17.02.2022 11:29, Sascha Hauer пишет:
> From: Douglas Anderson <dianders@chromium.org>
> 
> Jitter was improved by lowering the MPLL bandwidth to account for high
> frequency noise in the rk3288 PLL.  In each case MPLL bandwidth was
> lowered only enough to get us a comfortable margin.  We believe that
> lowering the bandwidth like this is safe given sufficient testing.

There are no device-trees that use "rockchip,rk3288-cru", AFAICS..

Was this change tested on a non-RK3288 devices?
