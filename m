Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F86E47C61C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F6110F08D;
	Tue, 21 Dec 2021 18:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AFF10F08D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 18:15:15 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 207so22727928ljf.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 10:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rGlhGYi7c9JFZAs90lb+S8aDlBU/W750jjxARuJX2+M=;
 b=JUt+MrsyFxQklIoUIT4pV5yzp+XK3eXrKwgHYOSzSuVh2z6eRilPd/TOs+710UFBIH
 ArQaGW3hA8gmXDMLSfeZceTijix+xnOk3CZbSaNP3lMEch4yqP6u0iUwkEvX3YtK0+io
 5t7YuqjsI2YEVkSKgCADJ6G/leKK+qstYUmtL95nAY0eYwOu6NOWMBrRBEUFNKkkJd3K
 PiCxfdbqxcauBcEnAGwpwKoTDKnazhLroJLRufJFL4EHdUyksSngPQMe0WfABrhCGgX2
 AOahhbRdJa8OKcTzWnmrml4Htny/mR9IZO9IhBi2t6PoLM8uixux9bPc3fFh6rSi5aKh
 K+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rGlhGYi7c9JFZAs90lb+S8aDlBU/W750jjxARuJX2+M=;
 b=mf6GxBZZTgtq0L0smboEQKwyFii34H9VW1symXNHxK70cPEMsLXpqqdetLrFpko8ZE
 XR7V96+GMucB9+U83+JMrUvC3jQsR1sFlulbkROjf1j1wDF/9xw+n3S4vIbguoswJXys
 +glWhEtFQTDlhFBoi7EqGXjx9OI0hgO61aO6v/aEDwalghHafaPLjfILdWwFLBt4LRIC
 9nCHWk/x+MbG8pxiKX0qLFkJ8vXHVezWNafcQcavoB58H6no3XKuI2GaYGMlTXL/aZzF
 RiTEUJAV2Awo6MW6BKX5HDyBo+l8NKmJU7AawDPnT1Zc/KDLNOQatPkKOcNr0+LNTwKs
 RsOA==
X-Gm-Message-State: AOAM533NwiGZNmbDOFzEDTrlaS9boCnpJEzh6Maj/ayQqyz35YedsxCb
 ysiuqt5CRXfeejEdC0SRacE=
X-Google-Smtp-Source: ABdhPJynGnhbhNwiivGaod1p0Su4ja3s2R0c4x90ptRc7pL2XdvSrcCA4gOoBZT/M4xHVrzuaPKaFg==
X-Received: by 2002:a2e:b0ca:: with SMTP id g10mr3291206ljl.491.1640110513110; 
 Tue, 21 Dec 2021 10:15:13 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id m15sm317882lfg.291.2021.12.21.10.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 10:15:12 -0800 (PST)
Subject: Re: [PATCH v1 0/5] Improvements for TC358768 DSI bridge driver
To: Robert Foss <robert.foss@linaro.org>
References: <20211002233447.1105-1-digetx@gmail.com>
 <CAG3jFysa8G_fuGDfSLze-ovft3=gc5PXLaPtwTkC2_e0itQYNw@mail.gmail.com>
 <c09bd552-767e-e783-3f9f-114b8cedb475@gmail.com>
 <a999b141-4b14-cdd0-f6fa-3d861c0f381f@gmail.com>
 <CAG3jFytG110MN=AjnY3mz4pHtLYaTTXVWr9z_1=qpCo8hJoM2g@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1aeaf8f2-a65e-5142-65ae-e3ca7f42fc55@gmail.com>
Date: Tue, 21 Dec 2021 21:15:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFytG110MN=AjnY3mz4pHtLYaTTXVWr9z_1=qpCo8hJoM2g@mail.gmail.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

21.12.2021 21:10, Robert Foss пишет:
> Hey Dmitry,
> 
> On Sun, 19 Dec 2021 at 17:02, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 19.10.2021 23:37, Dmitry Osipenko пишет:
>>> 19.10.2021 12:47, Robert Foss пишет:
>>>> Applied to drm-misc-next
>>>>
>>>> On Sun, 3 Oct 2021 at 01:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>>
>>>>> This series adds couple improvements to the TC358768 DSI bridge driver,
>>>>> enabling Panasonic VVX10F004B00 DSI panel support. This panel is used by
>>>>> ASUS Transformer TF700T tablet, which is ready for upstream kernel and
>>>>> display panel support is the biggest missing part.
>>>>>
>>>>> Dmitry Osipenko (5):
>>>>>   drm/bridge: tc358768: Enable reference clock
>>>>>   drm/bridge: tc358768: Support pulse mode
>>>>>   drm/bridge: tc358768: Calculate video start delay
>>>>>   drm/bridge: tc358768: Disable non-continuous clock mode
>>>>>   drm/bridge: tc358768: Correct BTACNTRL1 programming
>>>>>
>>>>>  drivers/gpu/drm/bridge/tc358768.c | 94 +++++++++++++++++++++++--------
>>>>>  1 file changed, 71 insertions(+), 23 deletions(-)
>>>>>
>>>>> --
>>>>> 2.32.0
>>>>>
>>>
>>> Robert, thank you for taking care of these patches! Now nothing is
>>> holding us from upstreaming the device-tree of the Transformer tablet.
>>>
>>
>> Hello Robert,
>>
>> These patches spent 2 months in drm-misc-next, will they graduate into
>> v5.17 or something special needs to be done for that?
> 
> They series has landed in linux-next, and will be in v5.17 if nothing
> catastrophic happens.

Very good to know, thank you!
