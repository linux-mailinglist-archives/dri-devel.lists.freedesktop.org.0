Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF03B478A79
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 12:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B1410F802;
	Fri, 17 Dec 2021 11:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C09110F802
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 11:55:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id d38so4199590lfv.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 03:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IVoSwh1vrOcOYMzSFZcBGiekwmrvmnu/yu9ynAy3UtA=;
 b=Gj4M7BgLMNPwhiJBvGzl/JDenwkO7HDujABojJBRvVGLCRYQeHHyruewEpwh6ybCyL
 Av1yUjLdjkR52TDV9592LyZLu1xchFpalL3pBfN/s4J6GTD8OOlofaYsxubHYKVU2D6O
 CbHHedms1cH2t6sC0TTo3ffEOH/fd2BqYI9jaqOIfwtwvVCamaraABKsvlzeRrJ4cZOF
 7tXhjqCqOV+AEwTPnXm7hTyGdi7sLrHvX26MLPYSwDk05X49ikx2cs4YXE2R435mCgYf
 BeB9yakD/M3i6mbNh1aJSrhdCmtLCJpriqea6faSFaKjZhK9ZTwQb/aCz6oBwahpX3C/
 o4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IVoSwh1vrOcOYMzSFZcBGiekwmrvmnu/yu9ynAy3UtA=;
 b=pQJSKQY04/riEm30+vGsygTK+oBHpIP20aMV9rrMIuNZr0PATV4TnC1WCgyqGXrwrs
 80J51SINzNBl7r37LFaCYxP6mZjPNVEa9S0Q8fdWQoC5SoLnjgqsjIs/mBizBLHBio2n
 mpz1Ao6qi1CGGfjI3homPacXmP9MQx/GH76FDBDsh8oBGfaZ4sqAp2kHLsR/LzV/m6uO
 QDL+6XLfFJZoM9HjA9H32JOD7n3yMjFw55NEzmvS8dz7Db68B3c+5LlHlvFhdhjpKsbM
 /g31cPwzCkKQ3+K2oMkSO9QFY6IYjbXaMDJMZgMIV677KF6MyvRhZ/LgZ7hL99snHtQl
 LFKg==
X-Gm-Message-State: AOAM533u0/ZZrnhOfRWElk11/rG3qbLcKoOOb1xBFJaWYGSVqu6OPDdW
 DI5SnP8xfuMGBmGiLkf4GQg4nQ5GwrE=
X-Google-Smtp-Source: ABdhPJzR7F4ntqza5TxeJHdnruw3Sr909Ky7UaeX6gfiS/xaUtY7aJ1DkExo+7MWJU3p6Tpo8cWycQ==
X-Received: by 2002:a05:6512:308b:: with SMTP id
 z11mr2508194lfd.177.1639742150078; 
 Fri, 17 Dec 2021 03:55:50 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id f10sm1355834lfg.211.2021.12.17.03.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 03:55:49 -0800 (PST)
Subject: Re: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-5-digetx@gmail.com> <YbtLJeIxXlVyQhd3@orome>
 <Ybxwovlw2GARzqUO@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4edfbff2-ffd9-1c33-de0c-013a29dc286c@gmail.com>
Date: Fri, 17 Dec 2021 14:55:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybxwovlw2GARzqUO@sirena.org.uk>
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

17.12.2021 14:12, Mark Brown пишет:
> On Thu, Dec 16, 2021 at 03:20:21PM +0100, Thierry Reding wrote:
>> On Sat, Dec 04, 2021 at 05:37:07PM +0300, Dmitry Osipenko wrote:
>>> Document new optional sound-dai-cells property of HDMI node. This node will
>>> be used as endpoint of HDMI sound DAI graph.
> 
>> It's probably best for this to go through ASoC along with the other
>> audio-related bindings.
> 
>> Alternatively, I've just sent out a patch that converts the host1x
>> bindings to json-schema, so I could work this into that as well.
> 
> It doesn't apply to the ASoC tree for whatever reason so probably best
> to roll it in with those JSON updates.
> 

This hos1tx binding patch indeed will conflict with the Thierry's patch.

Thierry, will you be able to take the binding patches into the Tegra
tree and resolve all those hos1tx binding conflicts there?
