Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193444C1718
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 16:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B5010E464;
	Wed, 23 Feb 2022 15:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CF610E464
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 15:40:50 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id hw13so52997879ejc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 07:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WFKWHYEVTYdSkLxtSrxqY8mhLgNlskLotNcdJEfeS30=;
 b=BP+e7Hj+fIGrqQgvKxLgqJqGW+XjvC4W2WeMvrdSqNdlahm2nKkkb8pJURAf3TIG4l
 nDZx+yavvODjPUeqEteCxxHmPOleXTxNw1Dqft+zippmkFc2ClBIfOTzSknGrNYt/byt
 vN65phgYWoMfWWMHzyNmpBu7+mhCmqsXqsvaQTUdMfLA4wSRKF+vAvorAJUmL1lbYgbm
 bQEvuF4P0kIVxHGH3F41lYuBKNCB1QvW//E11i1rad/zwVkh0HPQPgUcSASXOU21HAwB
 2j23SQPdXY+fSSD2mPsPVv3EgeYLHn09I9QRpUnuINWtIYlyMeP2/z/vueyYYJwVKfzm
 ytfg==
X-Gm-Message-State: AOAM530iRNG6BzdrAyoLwauMPVW3vGEY8jqcPrHBXQ9NwlxOXjRRlcrZ
 tPJIfmtTXkw/3rc7i4LSnGQ=
X-Google-Smtp-Source: ABdhPJwCjKeESc3L8IbeV5j21bvDk0eitpRamZsq6g9YoXBYxtk65XHiLToC3J+qPucyR9UNzMvs2A==
X-Received: by 2002:a17:906:31c1:b0:6c9:cfb3:4dd3 with SMTP id
 f1-20020a17090631c100b006c9cfb34dd3mr257861ejf.392.1645630848908; 
 Wed, 23 Feb 2022 07:40:48 -0800 (PST)
Received: from [192.168.0.125] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.googlemail.com with ESMTPSA id l6sm233ejz.189.2022.02.23.07.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 07:40:47 -0800 (PST)
Message-ID: <ac2c2075-3d5c-3f7e-d4e2-a8c80ec61883@kernel.org>
Date: Wed, 23 Feb 2022 16:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 2/4] Documentation/dt: Add descriptions for loongson
 display controller
Content-Language: en-US
To: =?UTF-8?B?6ZqL5pmv5bOw?= <suijingfeng@loongson.cn>,
 Rob Herring <robh@kernel.org>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-3-15330273260@189.cn>
 <YhVrigEnXTiNgk67@robh.at.kernel.org>
 <720f940e.5ac.17f26de3a5b.Coremail.suijingfeng@loongson.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <720f940e.5ac.17f26de3a5b.Coremail.suijingfeng@loongson.cn>
Content-Type: text/plain; charset=UTF-8
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Sui Jingfeng <15330273260@189.cn>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2022 14:56, 隋景峰 wrote:
> 
> 
> 
> &gt; -----Original Messages-----
> &gt; From: "Rob Herring" <robh@kernel.org>
> &gt; Sent Time: 2022-02-23 07:02:34 (Wednesday)
> &gt; To: "Sui Jingfeng" &lt;15330273260@189.cn&gt;
> &gt; Cc: "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Roland Scheidegger" <sroland@vmware.com>, "Zack Rusin" <zackr@vmware.com>, "Christian Gmeiner" <christian.gmeiner@gmail.com>, "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, "Dan Carpenter" <dan.carpenter@oracle.com>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Andrey Zhizhikin" <andrey.zhizhikin@leica-geosystems.com>, "Sam Ravnborg" <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>, "Jiaxun Yang" <jiaxun.yang@flygoat.com>, "Lucas Stach" <l.stach@pengutronix.de>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Ilia Mirkin" <imirkin@alum.mit.edu>, "Qing Zhang" <zhangqing@loongson.cn>, suijingfeng <suijingfeng@loongson.cn>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
> &gt; Subject: Re: [PATCH v10 2/4] Documentation/dt: Add descriptions for loongson display controller
> &gt; 
> &gt; On Sun, Feb 20, 2022 at 10:55:52PM +0800, Sui Jingfeng wrote:
> &gt; &gt; From: suijingfeng <suijingfeng@loongson.cn>
> &gt; 
> &gt; Follow the conventions of the subsystem for patch subjects. It should be 
> &gt; evident with 'git log --oneline Documentation/devicetree/bindings/display'.
> &gt; 
> &gt; Something like this:
> &gt; 
> &gt; dt-bindings: display: Add Loongson display controller
> &gt; 
> 
> Hi, 
> 
> We are not a platform device driver, there is no
> of_device_id defined in my driver. In other word, 
> my driver will not bind against devices whose compatible
> is "loongson,ls7a1000-dc". We just parse the device tree
> actively, find necessary information of interest. 
> In this case, can I use the word "dt-bindings" in the commit title?

This is a patch for specific subsystem, so as Rob said, it should follow
subsystem conventions.

The patch itself is a dt-bindings patch, so there is nothing here
special which would encourage for any exception.


> 
> I want to follow the conventions, but get some push back,
> Krzysztof say that he can not see any bindings, these are not bindings.

I said in comment to your patch with DTS, which you called bindings,
that there are no bindings at all in it. Because in your patch with DTS
you did not include bindings, but you called it bindings.

Here, this is a patch with bindings, so your comment "these are not
bindings" is not true.


</suijingfeng@loongson.cn></suijingfeng@loongson.cn></zhangqing@loongson.cn></imirkin@alum.mit.edu></maarten.lankhorst@linux.intel.com></l.stach@pengutronix.de></jiaxun.yang@flygoat.com></davem@davemloft.net></sam@ravnborg.org></andrey.zhizhikin@leica-geosystems.com></krzk@kernel.org></dan.carpenter@oracle.com></tsbogend@alpha.franken.de></daniel@ffwll.ch></airlied@linux.ie></christian.gmeiner@gmail.com></zackr@vmware.com></sroland@vmware.com></tzimmermann@suse.de></mripard@kernel.org></robh@kernel.org>

This link does not work...

> This email and its attachments contain confidential information from Loongson Technology , which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this email in error, please notify the sender by phone or email immediately and delete it. 

Such automatic footers do not help. Could you work on a way to avoid them?



Best regards,
Krzysztof
