Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 101F83EB614
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 15:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5D56E7D7;
	Fri, 13 Aug 2021 13:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D1A6E7D7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 13:27:59 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g13so19787546lfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 06:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b2ifuGO0OwtV+DJhwJpc6J6jVy2SNXahQGiPbiV560Q=;
 b=UKvVHtxPXaeNsM11MJdXSl4Lzyrj9BcnCM+qfKNHOsuZx74p5FTEskvqRk+78LKYKj
 s5NIUY/Gn/tsjA9xFeAtNjhqOtxNa4boRW726SeneaoYlaaAU7Z2hRwdQKEJ9s0cv2uK
 8KvSru7xc9b7ZcjdWqfBqkW1/MpZWMfw/KleBe3jWfaIXGMni58CPgAAc9yd6hgBk/n4
 lTtTwhGZqdm9bwyHtlDCyCUg7UR+x2Y2+Gu4VDTjdQORZj8gutxu2VJ72T9sawf1QAHy
 gQzqo9QGL002O9yHYKm7KJ7mYfqLU1vJUbTYmiSDJK5fVHvNQpheD6+dpqdDsrtdO9O2
 zedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b2ifuGO0OwtV+DJhwJpc6J6jVy2SNXahQGiPbiV560Q=;
 b=HWikRR7yyW72WNPvJkK5RQW0sbesOKo/zQP2e8HnnTRehfFNPQe6NFNXtvntinayES
 FtVljHa4GV3XwQcc8daABKe7XcqcD8yeQEtfzQCTVx8eXRQSKmLp1zSyW6lBvx1nPSg3
 1qAj2fKMAjlHn9BUuXEvRqG9N0OQw1EgkGKKvy74IRWsNSdQV+3gOz5WYVakXipQqZP1
 +T7TjIf28UmW/vozPy9patOXrRz1PF0SJw0PSY4fQ3C97oprFTRqtpEFCHhToCNsKibQ
 PRfoVto26CtJe/iugMwEXGpYi0ggk0KT4a/o8+XdwfnXzmjORBv9bicZ/Cip5oE4EBMV
 X3HQ==
X-Gm-Message-State: AOAM5317t4Vp9y3ZYQbnsFIPdCBhxjYR9FoBRNB1mogW9vX82OShM5jo
 y1SU4zxLfHwlvHkEgYuB8Uk=
X-Google-Smtp-Source: ABdhPJy8wlbCms3nlFay8c37XAlqmB8bo1ed7BuAcEt6Sqfq+V64sfLy4N/WjLWAv2/RglQFEes1DQ==
X-Received: by 2002:a05:6512:3da2:: with SMTP id
 k34mr1600973lfv.3.1628861276619; 
 Fri, 13 Aug 2021 06:27:56 -0700 (PDT)
Received: from [192.168.2.145] (46-138-117-53.dynamic.spd-mgts.ru.
 [46.138.117.53])
 by smtp.googlemail.com with ESMTPSA id bt28sm158144lfb.195.2021.08.13.06.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 06:27:56 -0700 (PDT)
Subject: Re: [PATCH v18 0/2] Add memory bandwidth management to NVIDIA Tegra
 DRM driver
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matt Merhar <mattmerhar@protonmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20210601042108.1942-1-digetx@gmail.com>
 <8accfe1e-fc48-21ca-f7c6-bd2d60162e6d@gmail.com>
 <YRZKlYg5YQlbmqFg@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <13277e43-d94a-8358-276e-62cfc2dd08be@gmail.com>
Date: Fri, 13 Aug 2021 16:27:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRZKlYg5YQlbmqFg@orome.fritz.box>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

13.08.2021 13:33, Thierry Reding пишет:
> On Mon, Jun 07, 2021 at 01:40:06AM +0300, Dmitry Osipenko wrote:
>> 01.06.2021 07:21, Dmitry Osipenko пишет:
>>> This series adds memory bandwidth management to the NVIDIA Tegra DRM driver,
>>> which is done using interconnect framework. It fixes display corruption that
>>> happens due to insufficient memory bandwidth.
>>>
>>> Changelog:
>>>
>>> v18: - Moved total peak bandwidth from CRTC state to plane state and removed
>>>        dummy plane bandwidth state initialization from T186+ plane hub. This
>>>        was suggested by Thierry Reding to v17.
>>>
>>>      - I haven't done anything about the cursor's plane bandwidth which
>>>        doesn't contribute to overlapping bandwidths for a small sized
>>>        window because it works okay as-is.
>>
>> Thierry, will you take these patches for 5.14?
> 
> As discussed offline, I've picked these up for v5.15 with a small patch
> squashed in to unbreak the Tegra186 and later support.

Cool, thanks.
