Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400F5481E91
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD21810E2CC;
	Thu, 30 Dec 2021 17:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B9B10E22D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 17:19:13 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x7so49357978lfu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 09:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ApBdSAzt+Zwxf/bUdk7J8+5TGYqTMygUtZUxKyiH+JI=;
 b=EczcsHb6QnST7K5tF6xIvkMEWJ6xh0Hh27/S5aGO6Bcrb1qI/3InFft+DwOMQFvXK3
 6Uy2WfYtq7hObIexa3klhXSajsk42jMWpuSaGVGhAaO7WI3b6GZBq/QwC4rHCkJ6VIKn
 CFtkCtOEzLAva5IS4L8sTb7axN0vWGvve9/w5qCJVAQ6fPBdoKu5Wc2tcpWWkmPDhBln
 1YFpP/8VcErYQB+F1ktL7GhmduKce8WdoN22Qs/uHoQ/ETyFKupJ+DCFfukX8o/dEl18
 Kg5kXtLPXaXLbOg7vpOhyFvbSWccgu+MQmSs8wcdZTrfPWTaIey4qvJZzdcwyxUB0a0+
 /tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ApBdSAzt+Zwxf/bUdk7J8+5TGYqTMygUtZUxKyiH+JI=;
 b=J1WJ8BBF7HWf0V3CksGlddGWr1rUMgiF44K2xINu8VjYYAGWEof2D14Cogj9BkiSFM
 NSgSQ1x6MrE9N81yI5ZMd1vw6mWipjj7DHW2Nh5Jao5aydRhCsRpOvS8COCceTgFJIzY
 v2BkT2m0HmGqMeKeArSWBTj6nhhwoS7tbYMfQ2fOP62lb102EpV71Xrt1nnAjEPIFJ0U
 NphKGTCvpImLM4XmWmHxHefagGvKTWjrk7OYy5GXdfcJO/etr2nnBTVmv7J4wmjz3P66
 4LpBGoIA7j6hJ/6QyF48EWD+4OVp5CwFwXK7miPSi3cfXwMAd0OWhW/8l6nsskBoZmS5
 VF6w==
X-Gm-Message-State: AOAM531EfbYuiL1m+PWJru4YoeU9ZLL0MUBnbvfpwIudj8KCfrdMGrUt
 Mi6ZMD2PhOBkgsHf3AzskeguTg==
X-Google-Smtp-Source: ABdhPJzJ/vs5ia+NXIwRMuT9HMiGYdJGHoTCRb9uX4YNy/amgGcQX361wEa95q8uNE2X1yzH3ss36A==
X-Received: by 2002:a05:6512:15b:: with SMTP id
 m27mr21949929lfo.218.1640798351957; 
 Wed, 29 Dec 2021 09:19:11 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id z18sm2251172lfd.8.2021.12.29.09.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 09:19:11 -0800 (PST)
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
 <87626d61-ada0-c220-bea5-5330f5256629@cogentembedded.com>
 <YcyXQxW3kRqQ2Yv0@pendragon.ideasonboard.com>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <39f70781-831e-c86a-ec5f-68f2b4bd3d62@cogentembedded.com>
Date: Wed, 29 Dec 2021 20:19:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcyXQxW3kRqQ2Yv0@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> If this approach is not appropriate, then perhaps need to fix it in
>> files for all SoCs, to make it possible for extension board dtsi to be
>> compatible with all of them.
> 
> I'm writing a patch to drop those right now :-) I'll CC you.

Ok.

But, are you sure that empty nodes like these are that bad?

I was going to suggest a movement in opposite direction - adding more such nodes, so they could form a 
sort of API for dts plugins describing e.g. displays connectable to boards based on different SoCs.

Nikita
