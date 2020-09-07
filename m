Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0025FC12
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 16:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA04F6E47A;
	Mon,  7 Sep 2020 14:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AFA6E328
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:06:24 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w11so7044185lfn.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d2UKtxSDsLOJMZMvP4V6fDHQ9DOK38Nub6TkWq2gStU=;
 b=vFg4C207s1HYEz3DxFduhR35WgnfoYhDmDerHgHdYFuDCemywqeA2dEAKzMmt93QxI
 RI9/AYrJGw39gr3JEB8H5Z6BNrq/of0J4kSiWqMuuqhnUaYVe1CxuQ1SwWhm7tsnvhzu
 rk3+M8zBe3OOOu7dTuYYzZmSJ9ty57aY+46fLPTbBmcubNdRwIwGW2mxZKbrVzN2nfkT
 1PsIFUOudcginzFbN9TwBL+QrV8lRO/Fkt8mI0M6t9/s/VwnlNWwOeUexzdRtcbcbyWa
 9in9OfoYHHu/S2RFfb2Jjei/bqpqUzdDlKgixUsZCdmrxp2Luu1jAiM9imvMqLsC4EbY
 2OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=d2UKtxSDsLOJMZMvP4V6fDHQ9DOK38Nub6TkWq2gStU=;
 b=ItGiuE2r+7wBU0lhBcBXw/AggofH1McNhpHb6c2o4o2ahJmZpKz9FKsB/leqabjf/o
 tBkAvS3sfOTnzKe/1Y2PKuP58t+S0/tl0cJ8r21emGPQObnjpjjWWRRewhkNmjCRQnL2
 gP11OoGUcpuFOY7T3UYXrZuO3Nyvljhtd52+rk5dj3Qwp2YuqsE3Uk+Xo5YSpdKzs/PN
 yoM0nyWJifGWwYqFTlHdIxUycX8vCIv2YcueMmqvMSscy+b7k1eFWvMqLAEGM/t/drEC
 HqpkqLFTAzlim59J62l2+xIYiTqzEecjdoe6Obh7zLtT3sJbkNAsDj3/orb1yWRFytuu
 yXaQ==
X-Gm-Message-State: AOAM530VWxwlns+BuyhgftlEHevMLdSaW4+xotiEVhvkcYB3BXKPJ38a
 Y9uyGMsAHvhuUJJTAlRWduMwSBDO0s4fxA==
X-Google-Smtp-Source: ABdhPJz9n9KbuzMzDlSQa4iknXvJcYJO+CSM3n5dQxn6kAweLvkB4JJPqXoF448FuJjg3rn3KOOgAw==
X-Received: by 2002:a19:7e02:: with SMTP id z2mr9554798lfc.130.1599465982981; 
 Mon, 07 Sep 2020 01:06:22 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276?
 ([2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276])
 by smtp.gmail.com with ESMTPSA id q22sm6725588lfp.40.2020.09.07.01.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 01:06:22 -0700 (PDT)
Subject: Re: [PATCH 8/9] arm64: dts: renesas: r8a77961-salvator-xs: add HDMI
 Display support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Laurent
 <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87h7sa70r7.wl-kuninori.morimoto.gx@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <17f337ce-99db-18c3-491b-d29f1046d0e9@gmail.com>
Date: Mon, 7 Sep 2020 11:06:19 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87h7sa70r7.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Sep 2020 14:29:04 +0000
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
Cc: Linux-DT <devicetree@vger.kernel.org>,
 "\(Renesas\) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

On 07.09.2020 5:59, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch enables HDMI Display on R-Car M3-W+ Salvator-XS board.
> This patch is test on R-Car M3-W+ Salvator-XS board.

    Was tested, perhaps?

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[...]

MBR, Sergei

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
