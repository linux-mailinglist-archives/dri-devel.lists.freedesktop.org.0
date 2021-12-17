Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE5A4792AF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 18:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A1F10EAB1;
	Fri, 17 Dec 2021 17:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F69410EA91
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 17:19:01 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id z8so4406641ljz.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 09:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aD+hC6FqlLZlRa2bYYfAt8xGKCazGEctgmQARu+DDU8=;
 b=N+UO0OVMGnFIK0uWKGSzU0og53fRsylVVAjm+0aq9GOMGpnSHN/MN8kNXkzeAsUDVi
 /r3VLwK2ENO7yz83w5dxYdI5t3Xrv9LkpIuK59aiYvbL0fnapPr85PwHaEBDabE/5kRK
 GWeJrY7WmFCNzRw5gUmLBURUHiKJ9PBeOU2tm2n2GrnLu++HyRIPa3Ye1MwUdAwGGWbE
 WkKXwxi1SujNH17xZAIHeVmtVq7GLDTEgKFP3rosA/WbXc4Kzf5WbVSgbgtx9AG3zGr4
 qMiB+ODoVkA4ZSUPGZPuN5onKzOXsyqQP9UHjAAgMzmkNkZ4L+hZxC1xdF8qDU+/jHL/
 Aong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aD+hC6FqlLZlRa2bYYfAt8xGKCazGEctgmQARu+DDU8=;
 b=GOUdTWn7SAywN+HaVi1qq4gEi476UxGxLKhBGoaTRQq9+Emk5Bh1PNbhy1sPq5rFlm
 lHTsV/yXqBTefCF0weyNlObNr0lg6ZVhUIBroEJ75CeOOlJD7HaUCXCL5SDd5ZClZuT/
 6PdleDqryRWJDebWut88eHbDL/VXA+w6wdG6MTEM7PNmAROnUZea+aNsJQtDsqhfnxa5
 hQ39wgLrbUr2a2sfUJvuxC+wbXreqtFaDpVXrNhvAXXYClVgc7nyevhgwfU/ghoODsZZ
 zpSBAMZyTqT+vewFSvzmaFnrfTcGjlgQtAtOJDARBef2QPB37ZqAsxN0p2DqZwBZxQGh
 4pTw==
X-Gm-Message-State: AOAM530xgHVqtnFcthlpUD1JYILHq6e9lKydqtS4tpATiUWX3p8LRNP1
 yQFL5L7+/zwc6fnH+UMZdz7RsG6S+xM=
X-Google-Smtp-Source: ABdhPJzBjfXZEGXsleWCP8vjNzkIbrIDY0hTHQDynU+0L28mioCf9nBMTGevXSjGLXhOGHJT4nr+6w==
X-Received: by 2002:a05:651c:504:: with SMTP id
 o4mr3649716ljp.242.1639761539376; 
 Fri, 17 Dec 2021 09:18:59 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id p20sm1470067lfu.151.2021.12.17.09.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:18:58 -0800 (PST)
Subject: Re: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-5-digetx@gmail.com> <YbtLJeIxXlVyQhd3@orome>
 <Ybxwovlw2GARzqUO@sirena.org.uk>
 <4edfbff2-ffd9-1c33-de0c-013a29dc286c@gmail.com> <Ybx8XdLGGiQsNMTq@orome>
 <36972e00-0eb9-acb7-d537-3b9a4b53386d@gmail.com>
Message-ID: <e0536860-3fea-e57b-8602-4936bfdcd4a6@gmail.com>
Date: Fri, 17 Dec 2021 20:18:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <36972e00-0eb9-acb7-d537-3b9a4b53386d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Rob Herring <robh+dt@kernel.org>, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

17.12.2021 15:06, Dmitry Osipenko пишет:
> 17.12.2021 15:02, Thierry Reding пишет:
>> On Fri, Dec 17, 2021 at 02:55:48PM +0300, Dmitry Osipenko wrote:
>>> 17.12.2021 14:12, Mark Brown пишет:
>>>> On Thu, Dec 16, 2021 at 03:20:21PM +0100, Thierry Reding wrote:
>>>>> On Sat, Dec 04, 2021 at 05:37:07PM +0300, Dmitry Osipenko wrote:
>>>>>> Document new optional sound-dai-cells property of HDMI node. This node will
>>>>>> be used as endpoint of HDMI sound DAI graph.
>>>>
>>>>> It's probably best for this to go through ASoC along with the other
>>>>> audio-related bindings.
>>>>
>>>>> Alternatively, I've just sent out a patch that converts the host1x
>>>>> bindings to json-schema, so I could work this into that as well.
>>>>
>>>> It doesn't apply to the ASoC tree for whatever reason so probably best
>>>> to roll it in with those JSON updates.
>>>>
>>>
>>> This hos1tx binding patch indeed will conflict with the Thierry's patch.
>>>
>>> Thierry, will you be able to take the binding patches into the Tegra
>>> tree and resolve all those hos1tx binding conflicts there?
>>
>> Yes, I'll resolve all of those conflicts in the Tegra tree.
> 
> Thank you!
> 
> Mark, then you may apply patches 5-13 to ASoC on top of the Vinod's
> branch, skipping patch #6. Thanks in advance!
> 

I see that Thierry applied only the host1x patch, but not the other
bindings.

Mark, perhaps will be easier if I'll just make the v5 which you could
apply easily without a need to apply only selective patches. I'll try to
post it ASAP.
