Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D02749EA5D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 19:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D6E10E2E7;
	Thu, 27 Jan 2022 18:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30BB10E2E7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 18:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643308154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOwmBaoQYc9ipxJsD5Xp8lQm0++NvPyuGzOAK0NnjAs=;
 b=IQz1sZJVBtumlIjzt71IBB3nATOvWtRdzOp1+GaEl7aBAZJMnLZ+vtzJv25qTt6s1vrmTG
 JWMnbxiWjt+aH2SktkTQt/Qkr5hx4YUjC6m7oNzNpZ4MWqBBTTZp7UouA7+DrIOC6mSb6V
 qPSO0VpeLLUu+vMbaBfIwYeCoKx6X38=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-L1mp-DXfMJy2-TLNgZc4iQ-1; Thu, 27 Jan 2022 13:29:11 -0500
X-MC-Unique: L1mp-DXfMJy2-TLNgZc4iQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 a6-20020adfbc46000000b001d7370ace6eso1360214wrh.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 10:29:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VOwmBaoQYc9ipxJsD5Xp8lQm0++NvPyuGzOAK0NnjAs=;
 b=O4PNjObyOiL3wVwMWrdU1VPY8brx81dTzUw7YJ4/hnaanQ9Jrm4tNdMy8Hw7gQvHuW
 VC4++edstVc+n3CB++dtWZ+wk/W+uZXfA0kHXmspT1DaVsqS81il33t9OyUubbrVlz70
 6znveFOdaotDUKya33QuWYtKWagNBAS2eoyGBPbyq1idGVaiMvs/1oYJCAQOx2kBZkC7
 AHUYAHju845tHaA6WkuEBNkxFMLZN50lMqjRE45IRyNrv+UEhPdYFZzUnF7WwaXp6+Bj
 MCKAOd1BfZNgkcw1IgAsf9MaqbtX1D7X84Nl6Rqd1JEpy27BKLuOwcnDwasmW/txzDRH
 RoXQ==
X-Gm-Message-State: AOAM532c0JGNIUjfpMOmKs7GRqHEtc0nsApJhXhaq0HFG8KWlR3f2QUQ
 qeNoz5jrGs12UWQiIYYMtll1ncPKiVfbntHF6+MDCQN3xmZ5io8WoBqe/LK+E0L8FGa1LQljDgW
 Z2wLguoKn7QSvFz6Qnt9QIG67lqrb
X-Received: by 2002:adf:90ec:: with SMTP id i99mr4246332wri.484.1643308150327; 
 Thu, 27 Jan 2022 10:29:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWB8J69usKDani3SgGZH67M+S5JrzOq9AWvBqm+JPvJVzt8o/DJlUEg++S01dqSOe3YsZ/fA==
X-Received: by 2002:adf:90ec:: with SMTP id i99mr4246313wri.484.1643308150088; 
 Thu, 27 Jan 2022 10:29:10 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id a3sm3391827wri.89.2022.01.27.10.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 10:29:09 -0800 (PST)
Message-ID: <c5948761-c031-f9a4-2459-37bb5b40fda9@redhat.com>
Date: Thu, 27 Jan 2022 19:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/37] drm: Make drivers to honour the nomodeset
 parameter
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211217003752.3946210-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Edmund Dea <edmund.j.dea@intel.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, Joel Stanley <joel@jms.id.au>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Alison Wang <alison.wang@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sean Paul <sean@poorly.run>,
 Tomi Valkeinen <tomba@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Sandy Huang <hjc@rock-chips.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Tian Tao <tiantao6@hisilicon.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/17/21 01:37, Javier Martinez Canillas wrote:
> The nomodeset kernel command line parameter is used to prevent the KMS/DRM
> drivers to be registered/probed. But only a few drivers implement support
> for this and most DRM drivers just ignore it.
> 
> This patch series is a v2 to make DRM drivers to honour nomodeset. It is
> posted as separate patches to make easier for drivers maintainers to ack
> or pick them independently at their own pace.
> 

Pushed the remaining of the drivers patches from this set to drm-misc-next.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

