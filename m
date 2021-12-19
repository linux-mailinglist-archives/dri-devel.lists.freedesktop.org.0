Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CBC47A13E
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 17:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8A610EE12;
	Sun, 19 Dec 2021 16:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A7210E573
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 16:02:08 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id b19so11873125ljr.12
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 08:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lOJVwY5jpStaCZAdlI9r7F578YcqW449P/YXre+J0tQ=;
 b=pjA90ue/y2GqwI2z14nTc67a4m47280O/yxsM3rbaOR0jXnST/2OFTz7rnBTTlDTiD
 yrSS6Y7Bxy5Uf9WLx+PToztObgQKrfnS007NXaKbF1DUQCVehT4AnS1J7HTmnU7awlAL
 DXhtAkhd+90jcpkSK2sqOdfRMlJLZpli8dT1Wfmv7t9H3OW0hfWcIR8ZJ9CJdh9XdZuw
 7icknWh9L06pnfWketuwEXCRVG8syJqoUQNyQPMz4ty1kgX9w/NGWOI7mKzhhWsPBcOX
 4N/kDK7AWqIhtjAnv2ccV2MxIBxJs7xIUxRl6HdKTaaidslm/H9merf2IgHYxbdeB7zI
 1UQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lOJVwY5jpStaCZAdlI9r7F578YcqW449P/YXre+J0tQ=;
 b=xCIVcroBAcnIh/r/W8TJpzFditOmtaBf5s1EVlnHJp42d5THSSEYonFTIZlQr9JULx
 dPpoKfW+52DRReAn9rCiC0njYAUp4ulvwpLgMmHg52VYQiv71HI2q2iUE2VpOKFwi015
 Rk5mNqnpnTy/rZYpx57wfMn/DDZPx6Yx6Kq2BKgOqqhOizPQAEAUZLEpjbxtD5W8LVjR
 fuFh3wxWcA2NTBWPpfUTv/uEcq5+mSZZEp75KKbm7TM/knCC4SX5uFC+pZLhdNlJLTuX
 49Raljw4iNX66IVFnLcDA9YE3SiBY3aHlikJBs9Q5zaLAUvWuHXpPmn7lmNZ4P4O7PKK
 i1SA==
X-Gm-Message-State: AOAM530w/hR2StBP3DTvQA5RPRqEvK5m65zEfjiwwW/5oz54ps5Lo+Gb
 YlVsgI3Hb21twkWcL+NvZQE=
X-Google-Smtp-Source: ABdhPJx1ZWsrVE8ULcM6usPQM1yX8t+9VcsmDxvcl3oZQN3xvGSoTr7yvW/BSd8mrcEdFyMmhUUbjw==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr11100264ljm.2.1639929726863; 
 Sun, 19 Dec 2021 08:02:06 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id 76sm2196162ljj.69.2021.12.19.08.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 08:02:06 -0800 (PST)
Subject: Re: [PATCH v1 0/5] Improvements for TC358768 DSI bridge driver
From: Dmitry Osipenko <digetx@gmail.com>
To: Robert Foss <robert.foss@linaro.org>
References: <20211002233447.1105-1-digetx@gmail.com>
 <CAG3jFysa8G_fuGDfSLze-ovft3=gc5PXLaPtwTkC2_e0itQYNw@mail.gmail.com>
 <c09bd552-767e-e783-3f9f-114b8cedb475@gmail.com>
Message-ID: <a999b141-4b14-cdd0-f6fa-3d861c0f381f@gmail.com>
Date: Sun, 19 Dec 2021 19:02:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c09bd552-767e-e783-3f9f-114b8cedb475@gmail.com>
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
Cc: Andreas Westman Dorcsak <hedmoo@yahoo.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

19.10.2021 23:37, Dmitry Osipenko пишет:
> 19.10.2021 12:47, Robert Foss пишет:
>> Applied to drm-misc-next
>>
>> On Sun, 3 Oct 2021 at 01:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>
>>> This series adds couple improvements to the TC358768 DSI bridge driver,
>>> enabling Panasonic VVX10F004B00 DSI panel support. This panel is used by
>>> ASUS Transformer TF700T tablet, which is ready for upstream kernel and
>>> display panel support is the biggest missing part.
>>>
>>> Dmitry Osipenko (5):
>>>   drm/bridge: tc358768: Enable reference clock
>>>   drm/bridge: tc358768: Support pulse mode
>>>   drm/bridge: tc358768: Calculate video start delay
>>>   drm/bridge: tc358768: Disable non-continuous clock mode
>>>   drm/bridge: tc358768: Correct BTACNTRL1 programming
>>>
>>>  drivers/gpu/drm/bridge/tc358768.c | 94 +++++++++++++++++++++++--------
>>>  1 file changed, 71 insertions(+), 23 deletions(-)
>>>
>>> --
>>> 2.32.0
>>>
> 
> Robert, thank you for taking care of these patches! Now nothing is
> holding us from upstreaming the device-tree of the Transformer tablet.
> 

Hello Robert,

These patches spent 2 months in drm-misc-next, will they graduate into
v5.17 or something special needs to be done for that?
