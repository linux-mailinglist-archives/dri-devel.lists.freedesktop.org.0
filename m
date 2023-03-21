Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6862A6C32D3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 14:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF0510E780;
	Tue, 21 Mar 2023 13:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E4C10E1A0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 13:27:12 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 i10-20020a05600c354a00b003ee0da1132eso2859989wmq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 06:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679405231;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nmuE9i4BOGv8wbGqII05vBX2hvOFUNZmklG6jr67aGk=;
 b=TWUgzxiNQuNvs7HKZcuVl11DJ1mctEQVxFLCpudW0tHRvL0lXGjm+4L6Z2fiaI/kMt
 xI+L3BVymVEMvaQK8wSVmHvCH9quIyRsWF1gknYrMmNvvLG3ETJtwVl2mPgLUQ6v2fc4
 djM+OmxrRuie9OnzKX+gOmRYv2OJnFTzDHBWw/H2/TrZxeW8qddUCFCHytTBZGotJxUH
 xudE6MwyuMnO4yDx/jwRvxDZcgI5h5zo28nlnmZTaCFgIbKmxEK9crSUkF2ej13pjdU2
 rNhaVogcHF+Keavw1r2sOJYFlXOcCzPT7BL9CL2wTQQnsqRtDOzrujTEwvjA3lS//L8Q
 2jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679405231;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nmuE9i4BOGv8wbGqII05vBX2hvOFUNZmklG6jr67aGk=;
 b=zKCSehFmo/YToXtbN+laNRzpKcwxrLOyEkIO5FY2+0cMY0OBQE6MIARrT4ldziqVfF
 csVQsOniyeRcNVmdQg7ngqvCuGyysCp5i7soRubSoYLqW5y57ShmT0ZCN948PvFFRbg6
 0kFW095f7Z0ipqPDTbGIAgE79UzhG2uPckGOofzdne3/JZAPC8izXpmQSxdvBHIn7dwI
 W+hN5K+kLIxXo3irSlk+vLpp2Gfxk0ZbRuUsheNLch6WWImurD9ZzJSlUqJQVH64i2oo
 WNPm+2JtaqjyAPoxo7mP/CJSHdrHr9COytZNsx5CrCBtXK+hY69oCkCLNO/CD27yVMa5
 cHkw==
X-Gm-Message-State: AO0yUKVhbaGU/eXkFKPyCM+btGwGJr6lfkA2qhC9Cx3XXAj12+ZYMshu
 ICn9GaXPKbMN/QiLhWqYmSKo5w==
X-Google-Smtp-Source: AK7set9+2mXnERPRLq+QIR9/XRsWTj2Mg5s8G1jTh6AI8V1S7SD/6C6xUGT5J2z1GE5KNYG1w8JPug==
X-Received: by 2002:a05:600c:28d3:b0:3ed:2eb5:c2dd with SMTP id
 h19-20020a05600c28d300b003ed2eb5c2ddmr2133002wmd.39.1679405230793; 
 Tue, 21 Mar 2023 06:27:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c8ed:7915:30cc:f830?
 ([2a01:e0a:982:cbb0:c8ed:7915:30cc:f830])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003eda357cfc5sm11232426wmq.43.2023.03.21.06.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 06:27:09 -0700 (PDT)
Message-ID: <35aa4401-8b35-09b5-9d97-59867d1df15c@linaro.org>
Date: Tue, 21 Mar 2023 14:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix missing component unbind on bind errors
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20230306103533.4915-1-johan+linaro@kernel.org>
 <CAFBinCBsC+P=zvh6RF3UKiPnferUYU0QZvZfnn1oS5xWX-65Jw@mail.gmail.com>
 <ZBmtu4klxYwQyN7R@hovoldconsulting.com>
Organization: Linaro Developer Services
In-Reply-To: <ZBmtu4klxYwQyN7R@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, stable@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/03/2023 14:14, Johan Hovold wrote:
> On Thu, Mar 09, 2023 at 10:41:18PM +0100, Martin Blumenstingl wrote:
> 
>> On Mon, Mar 6, 2023 at 11:35 AM Johan Hovold <johan+linaro@kernel.org> wrote:
>> [...]
>>> @@ -325,23 +325,23 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>>
>>>          ret = meson_encoder_hdmi_init(priv);
> 
>> I'm wondering if component_bind_all() can be moved further down.
>> Right now it's between meson_encoder_cvbs_init() and
>> meson_encoder_hdmi_init(). So it seems that encoders don't rely on
>> component registration.
> 
> Perhaps it can, but that would be a separate change (unless there is
> something inherently wrong with the current initialisation order).

The CVBS doesn't rely on any components unlike HDMI, this explains the
current position of component_bind_all().

>   
>> Unfortunately I am also not familiar with this and I'm hoping that
>> Neil can comment on this.
> 
> Any comments on this one, Neil?

Yep, components should be bind for HDMI encoder/bridge init.

Anyway for this patch, sorry for the delay, but it's looks fine:

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
> Johan

