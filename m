Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA6579054C
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 07:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7898F10E03E;
	Sat,  2 Sep 2023 05:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE39710E03E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Sep 2023 05:40:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99de884ad25so347484066b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 22:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693633211; x=1694238011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2eYGfKj5FgYVlATSk+oYKJA69Cs2Hl9HkvahADLC1bs=;
 b=N+NjQjsXPmtRClaSLRnusMdqFe8PqdhClxeIcs3GzXbu5M4w/LXZHmsTRIyVbZgAl1
 DKBOuJrT5EN/zUx69XPeP3zDbQjZW3dueR236W6OXcbUq9MUf5UX8BJyJ/yha2NtaXoj
 7NXSN0CdixrYqaimCUOZAZp3qfSbeuTfnyZfKSXVjT8NgIrhZYmplWrfBwnwwLIc414g
 kJ0rHkZ6hDI2+0+zSP8qcH7ZURYK+Z2+rNG8XirBvlRtENuLAvLQrspkj9dFGa5fha9F
 YF30Qd68E9qvmbsze7uqIxwFu/V1A/NhBg6qS/lr8bd5ePxgbO3QS44btQXfqdBHenGI
 7aBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693633211; x=1694238011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2eYGfKj5FgYVlATSk+oYKJA69Cs2Hl9HkvahADLC1bs=;
 b=kbfj0lMCB9lTE1mLjxRswd3sygb/g9fszcgc89OKCbkkejMqCz0RefCZCxDQlwVu3o
 y91MZvNtGjMQwt2zYdIAB/2fMgOC7wgcqHEzUs9FDYFr7Fh/YQOmlK+sJXQJA3CDfZRS
 9xDKjFlIjOSsYu7UGrG7SHBuOokqUjKHP6cvlrYaJUCXolLHiok1KDYFG1rFmso0HltB
 TkeJ2ib+WE2xHXyruWEbWGpUPYtyI9zUUxfVHE7QagGF71mFTBYjCyBd10MLWyMfYy/I
 26EbPQR4SL/KniFjSrtHxUvPXbcL409CP9NNRSQiyc32ILkXL34wm+KaDWhKGAlB6FVy
 ZRLA==
X-Gm-Message-State: AOJu0Yw+UH7BoIEcU4qxy7pRn6Ywa8T7xtGDgvwbPZQSaaEC0bJxmMAj
 7INKQTFzx/Q5DEcygShUB2V3wzMYKAMOSmGB6aQ=
X-Google-Smtp-Source: AGHT+IHByDWMLIpE1UUUlZcTJJhTOt3f1lqc1+aSn0SAzE6gizM0n+tOIlcq1HFbumM53POD7k7+ydQDm0JRwq0wrxU=
X-Received: by 2002:a17:906:3192:b0:9a1:bd86:3acc with SMTP id
 18-20020a170906319200b009a1bd863accmr2757943ejy.12.1693633210585; Fri, 01 Sep
 2023 22:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230901102400.552254-1-jani.nikula@intel.com>
In-Reply-To: <20230901102400.552254-1-jani.nikula@intel.com>
From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 2 Sep 2023 07:39:59 +0200
Message-ID: <CA+MoWDrtgtT26F-rZ-7s0PtQcTLqB6g1BARkegfZ3qQnhw=3ZQ@mail.gmail.com>
Subject: Re: [RFC] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to
 drm_do_get_edid()
To: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Zheyu Ma <zheyuma97@gmail.com>,
 Yuan Can <yuancan@huawei.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ian Ray <ian.ray@ge.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Good morning Jani,

It has been a long time since I wrote the driver, and many many years
since I sent my last kernel patch, so my memory does not serve me very
well, but I will try to shed some light.

On Fri, Sep 1, 2023 at 12:24=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> The driver was originally added in commit fcfa0ddc18ed ("drm/bridge:
> Drivers for megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)"). I tried to
> look up the discussion, but didn't find anyone questioning the EDID
> reading part.
>
> Why does it not use drm_get_edid() or drm_do_get_edid()?
>
> I don't know where client->addr comes from, so I guess it could be
> different from DDC_ADDR, rendering drm_get_edid() unusable.
>
> There's also the comment:
>
>         /* Yes, read the entire buffer, and do not skip the first
>          * EDID_LENGTH bytes.
>          */
>
> But again, there's not a word on *why*.

The video pipeline has two hardware bridges between the LVDS from the
SoC and DP+ output. For reasons, we would get hot plug events from one
of these bridges, and EDID from the other. If I am not mistaken, I
documented this strangeness in the DTS readme file.

Did this shed any light on the *why* or did I tell you something you
already knew?
