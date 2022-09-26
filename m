Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD735EA782
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 15:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8523410E6B8;
	Mon, 26 Sep 2022 13:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAA910E6B8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 13:41:53 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x18so10279373wrm.7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 06:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=2nV3OnX8WCDnxp7VmTZBQLJ8CRRFanST3tqzj4Y4KE8=;
 b=YA1QVKi9UhBceT8AYoU50XlwYm1lOjXb2nuUznMFTiWrlEK+LzOJWcLB2yqp+o1A6w
 bI1XP1RJWoBGDcNWWwN6OL265YVGYxudeRrZpoEVwxxW4/4Yi7xovqZ1h/YBF+6gkjMr
 HD3HUKt0HkfkclClzLJrVUh9gxPgYo+je1bhwvBmyAxMsghzNrnwi8k+HhBT6EvMW5nI
 YBI7y2/Aa6SDSE/3mYbNhWbQxOOgGf3NKXs4Q4banlgt57gqTvNqu2cwK89pTdN1Ip0T
 mOAys+URoeP83ML0gNV7IAxuTikg89HfJsEh0Tnbi2XkCTZ2VkdQUaslAuYWWbYRqApY
 8KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=2nV3OnX8WCDnxp7VmTZBQLJ8CRRFanST3tqzj4Y4KE8=;
 b=ba2yDUZkBDbAnn7P2ftHokatEuZL2XAvh8bP2L+M//6KZfaC1axEy7O7GIAAte6xEc
 9U/P6sxbsFsMH1PYj1uA6qRF75KC41u5qGhdSg3XbX/jyLXnSIpBFOAyRSPI8xYcyRQz
 7d4fr/dzLpD8w3FTfyagM2eOzmNDUyOZb0I9eDUooOT02aZT36LMQK3ZiqZUwCHk77YC
 uLub0CQPz6sYsePd79g9IZ+Y4QaLSClBMTVrvmo8nB05+zA/6Gq4mZZgaCgDEsgYywjD
 9C5/Q7PTBE1GiNciia7g1iJZnAbPX4Mfk8LeJSs5zVpokieYkCIJfvlq1lZ7hIwtLvZU
 TfYQ==
X-Gm-Message-State: ACrzQf3oLF7MHELBh5K5qsGte+TE8/mBkpYIEJIzq7tcS+uxsLf0EAZi
 iaTrpSTMzDSmnauzMQN8Wbr+Hg==
X-Google-Smtp-Source: AMsMyM4Uq3HSM4U6VhE/gf8dGJYxbyoeho5aabOD87EFFcvHpRSUKodVZ5it2S0OCse+91AeNK77+A==
X-Received: by 2002:a05:6000:2cd:b0:22a:4831:dfd with SMTP id
 o13-20020a05600002cd00b0022a48310dfdmr13309159wry.706.1664199712029; 
 Mon, 26 Sep 2022 06:41:52 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 x2-20020a5d6b42000000b00225307f43fbsm14449467wrw.44.2022.09.26.06.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:41:51 -0700 (PDT)
Date: Mon, 26 Sep 2022 14:41:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] backlight: pwm_bl: Switch to use dev_err_probe()
 helper
Message-ID: <YzGsHadJ+HGJETJv@maple.lan>
References: <20220926133258.1104850-1-yangyingliang@huawei.com>
 <YzGrLsNrwEyL98nP@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzGrLsNrwEyL98nP@maple.lan>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org, lee@kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 02:37:50PM +0100, Daniel Thompson wrote:
> On Mon, Sep 26, 2022 at 09:32:58PM +0800, Yang Yingliang wrote:
> > In the probe path, dev_err() can be replaced with dev_err_probe()
> > which will check if error code is -EPROBE_DEFER and prints the
> > error name. It also sets the defer probe reason which can be
> > checked later through debugfs. It's more simple in error path.
>
> I'd prefer to have received these patches as a patchset rather than
> individual patches... but it is a good change so:
>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Oops. My last mail neglected to mention that you did not sign off your
changes (meaning we cannot accept them). When you re-send this please
add a SoB and combine with the other similar patches.


Daniel.
