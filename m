Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EB46CB8BC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 09:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4843210E434;
	Tue, 28 Mar 2023 07:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE1610E434
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 07:53:58 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h17so11134687wrt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 00:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679990036;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1KWp1+z6lyc6dsscSk2tZ4gyzAuqIqBXoGIiti+qmqQ=;
 b=X0gkVOwnCdVvjs8+7aabpFC37zQNWPvw0NyjO8TQLgbSDDIQgjn+qlzfZ93IGekpUX
 GURrvxyzVHMV6utOrtglu2oI0OIhcX2SF20DFzBEXyPSjlMaXW9ORejLtGBv2wlzhBPd
 OZrB3WAiqtZ1M1pkskfqJjtU2nI2Kd4h8IXhue7uYcKyrn0cuYkZw27XgagXAIUC15FB
 iPqf6PNk1UvdVmx65jGbN3mQ76yP70wcVZuEbnKJPaRMh9XS63XOKZSkqBYszofT1k5U
 jtzfSaFDNZFNVZKdM3KYba9zIziq4xKnFM2vx4WkQgG07l3juFXziIksq/i6mjRzUlFM
 k+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679990036;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1KWp1+z6lyc6dsscSk2tZ4gyzAuqIqBXoGIiti+qmqQ=;
 b=68f/Rw2P9vtpz2j37pq+1L7RO+/Q0WMR3Zs8x4DF1yX3XwU8qBRNuJIQOwxE/XBw92
 DSx7lV4TQFPy0uh2zs8RGoEOPZCPs833vveCiCCNcw6tWvibk4QT9s5K/hcgP1WlWAuJ
 fQAphAxrBX5Z4wlXFfzYUPHbK+roF/b34Z1H/bV2bSZeavUsKdfbBFNSiE7LkLU9I7So
 sV/0bvqGvqAsgpNFirmyOhNU3WggEEOHsQJJN0yTBBC+YLQ3gyvMbzkw6uf6pKoqqLc+
 fXx4ibT4VI0Det7tdvMisd1tRjzSZM/UwQrpkqI9zcV0PPuKVXaUpwDjVdr6aCyaE7k9
 Fjcg==
X-Gm-Message-State: AAQBX9edC0uUVVE/pQgxD6UnV0t9MX5tmUK7ged/B/UrnLMFDmT8OvG5
 8IarQEmbPnKWrIcRHG1A62Sx5w==
X-Google-Smtp-Source: AKy350buoSiGjbtjSppckEMPlWqbnD3nYQLLEwwIKp+tQwnuDZvp3ZvbNOMNBEmX0UvtUzK336DHPA==
X-Received: by 2002:a5d:66c9:0:b0:2ce:aa62:ff73 with SMTP id
 k9-20020a5d66c9000000b002ceaa62ff73mr11309446wrw.54.1679990036616; 
 Tue, 28 Mar 2023 00:53:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8cdf:4bfe:3100:4240?
 ([2a01:e0a:982:cbb0:8cdf:4bfe:3100:4240])
 by smtp.gmail.com with ESMTPSA id
 p17-20020adfcc91000000b002c71dd1109fsm27043331wrj.47.2023.03.28.00.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 00:53:56 -0700 (PDT)
Message-ID: <3e22ad9f-eafb-f5ce-6de2-151bcb193543@linaro.org>
Date: Tue, 28 Mar 2023 09:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Inki Dae <daeinki@gmail.com>
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
 <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
 <CAOMZO5DFhFTh9kd2NdEe1m2AEs7Se0PNeWZ+5q-cSAz-QVoPDg@mail.gmail.com>
 <CAAQKjZM66M6wgtoBmAcQifq8LgBUos0bZfbTkRBqnOb7E-05tQ@mail.gmail.com>
 <CAOMZO5ArYAf72oSY-WMSdfH6w5HAvvrLz24eR+4YBzOASp7U-Q@mail.gmail.com>
 <794538dd-f29a-571b-601a-f61c60d00382@linaro.org>
 <CAAQKjZPmYcdUphP9w7i_O65rhXwsw2rCxAnDJ1JG73-RuLP4UQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAAQKjZPmYcdUphP9w7i_O65rhXwsw2rCxAnDJ1JG73-RuLP4UQ@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/03/2023 02:03, Inki Dae wrote:
> Hi,
> 
> 2023년 3월 27일 (월) 오후 11:08, Neil Armstrong <neil.armstrong@linaro.org <mailto:neil.armstrong@linaro.org>>님이 작성:
> 
>     On 23/03/2023 16:34, Fabio Estevam wrote:
>      > Hi Inki,
>      >
>      > On Mon, Mar 13, 2023 at 9:51 PM Inki Dae <daeinki@gmail.com <mailto:daeinki@gmail.com>> wrote:
>      >
>      >>> Could you please apply v16?
>      >>
>      >>
>      >> I am planning to merge this patch series soon, but I will be proceeding with the pull-request next week. As the DSIM driver is being moved to the bridge folder, I would like to wait for acknowledgment from the bridge maintainers. However, if there are no further comments until next week, I will proceed with the pull-request.
>      >
>      > A friendly reminder: do you think you can proceed with the pull-request now?
> 
>     I can apply the entire patchset to drm-misc-needed if needed.
> 
>     Inki, is it ok for you or you still want to take it in the exynos tree ?
> 
> 
> Sorry for late. I will proceed with pull-request today.

No problem. ping me if I can help on the bridge side.

> 
> BTW, now is rc4 so we have more time for pull-request. Is there any reason you hurry up?

As Fabio explains, it's v16 and was fully reviewed for a few weeks now, so it's time to LGTM !

Neil

> 
> Thanks,
> Inki Dae
> 
> 
>     Neil
> 
>      >
>      > Thanks
> 

