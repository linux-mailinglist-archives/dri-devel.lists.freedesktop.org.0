Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF2B426BA5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 15:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921B26F4A4;
	Fri,  8 Oct 2021 13:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71B96F4A4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 13:27:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r7so29836386wrc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gqzR+o0h40Gz9BebRFy0Yxo1R3lTUfD74jf72dbg2zg=;
 b=mgNx+Hvailh/BlhYWC2KINCh0g6fkBuHssRPSLTeN1qnjVTpJF7OnwT3a5IP/f90cu
 /QVjz9Z1As6kqKNNxXwhigfw7ZUL+lZIEOelpbkCjSRsyIrRKCL8ObtTGWivRUWusx8q
 pN9/QJ5ahx0yzwAI3aTjWoKpP82loTAcpFWxc7dSw1/GCdyjqz3LheZJm8MMkEZjwcDk
 jA0jbFGdMrerbqWu71DYBvyTHbmBZXlQ921VzEPCpnOwzwfuALVUEQLPQihiftLkp/Fr
 MkLbfCBmSxOhWhaOWH1xFVk8SuFCHHvaINSNjBFgOOSFJwcmWigJUNWUMvhiyfnmQEZc
 EQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gqzR+o0h40Gz9BebRFy0Yxo1R3lTUfD74jf72dbg2zg=;
 b=VKqMiURV6Tsu2t/FjborXvUowTtxcTar0wXohNMIPupQOjJXC5W3hWrzw8oHq9EiQu
 8WfCj14fVOSFLXB6lR13rv+5DpVtHlyfOFuFGERmYYnQWF67JrfaH1HMGhZLhek89iKO
 oHw+2C5pH4MEoIYQN3wxUD1SbzESWEbR+gDj5XbdqwdmjC7cyKAs/GY881lIg2wjXvBf
 L13yacXol7pWw/gNAiePxiHwFyGhjFK4suMkIySvcjIpmvKKrTOFOaJBWdNxJW+JJaeT
 4F4GmhsrVPYDIIlXtF76psSC/CAPqn8qFpOUITWC1U/tM6b16cU3NvNLL5Xh3NKgFAuU
 YmKg==
X-Gm-Message-State: AOAM5311veWW2R09xCCOpiy9P2sN1DgJ8k9qtBgn4ysdNiPXBqoeTw9i
 duREba++JgEr5/stzadM4UWECDFYMnKvB8NQQxc=
X-Google-Smtp-Source: ABdhPJyz20MAiD4SWzEJPsbKkEkdqrZ7OJrh/ELNsAf47ouQIwcPHMhZ89iPEFgScStsccnKgwFyfA==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr3383571wmh.137.1633699665499; 
 Fri, 08 Oct 2021 06:27:45 -0700 (PDT)
Received: from [192.168.0.14]
 (095160158079.dynamic-2-waw-k-4-2-0.vectranet.pl. [95.160.158.79])
 by smtp.gmail.com with ESMTPSA id d8sm2631426wrv.80.2021.10.08.06.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 06:27:45 -0700 (PDT)
Subject: Re: DSI Bridge switching
To: Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
From: Andrzej Hajda <andrzej.hajda@gmail.com>
Message-ID: <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
Date: Fri, 8 Oct 2021 15:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Removed my invalid email (I will update files next week).


On 08.10.2021 13:14, Jagan Teki wrote:
> Hi,
> 
> I think this seems to be a known use case for industrial these days with i.mx8m.
> 
> The host DSI would configure with two bridges one for DSI to LVDS
> (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technically we
> can use only one bridge at a time as host DSI support single out port.
> So we can have two separate device tree files for LVDS and HDMI and
> load them static.
> 
> But, one of the use cases is to support both of them in single dts, and
> - Turn On LVDS (default)
> - Turn Off LVDS then Turn On HDMI when cable plug-in

Are you sure it will work from hardware PoV? Do you have some demuxer? 
isolation of pins?

> 
> The HDMI event can be detected via some HDMI-INT GPIO on-board design.
> 
> The possible solution, I'm thinking of adding LVDS on port 1, HDMI on
> port 2 in the DSI host node, and trying to attach the respective
> bridge based on HDMI-INT like repeating the bridge attachment cycle
> based on the HDMI-INT.

I think more appropriate would be to share the same port, but provide 
two endpoints inside this port - we have two hardware sharing the same 
physical port.

> 
> Can it be possible to do bridge attachment at runtime? something like
> a bridge hotplug event? or any other possible solutions?
> 
> Any suggestions?

Practically it is possible, see exynos_dsi + panels, or exynos_dsi + 
some toshiba bridge - panel and bridge are dynamically 'plugged' and 
'unplugged' from exynos_drm, but they do not use bridge chain for this 
and some other reasons. (un|re|)plugging should be performed of course 
when pipeline is off (connector disconnected). I am not sure about 
bridges added to bridge chain - you need to inspect all opses to ensure 
it can be done safely.

And the main issue: Daniel does not like it :)

Regards
Andrzej


> 
> Thanks,
> Jagan.
> 

