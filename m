Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE9487A8C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 17:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C430D10EDC3;
	Fri,  7 Jan 2022 16:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F17A10ED9D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 16:39:45 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id t32so5867443pgm.7
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 08:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJyOALamxRFMJcn4o1a34k+J+D9h1hzsUTCMkOSszJ8=;
 b=NVMcCWu8NYWRB/wm9VgzmwpVvnKv3PpnyuzqMgbKtmK2KX/l0s8YqHoowVqA1Vlsu9
 vyVx+xv5W+kYUZKQz+adZl+yKmcI0SlDKkMsPygGV1CyVTTEis3pCmAC6DIDj+Ti5BLi
 95Xx/NEHjxaruM9WF8cUkhTKE3aQk43ijen1QgvMk4otbL7al3YJVw0L+j64Ce0VYn7g
 H91FMVsklLWfbfcr3x+lXGbkqY0toMVzpLOZdy3LpoeieOgQrRY3rhftPKPAUsvcq3g4
 g53qaJ+Vo2uHng1lxfgZPWPXKpahzuoVvZ7WirO5ca7Ffz4gG23uzqr5akCb2apMdoLe
 rcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJyOALamxRFMJcn4o1a34k+J+D9h1hzsUTCMkOSszJ8=;
 b=n7UeVFHlqZPnyL9hNit1LZWAeipBLKpPGVgJb3Kq1Fk2K1ihmhQGBhKEwjxMb+Mv3t
 DXy4aud7MSZGMZkPJE24ClWLbMqERweHDCiUxgoCEryHJepkJh9RPc3rJKEEvzeluBVE
 do/xQdhPY02FArORROsgNmL8fjNJ1xfXI8ejxSaq6Ir2vhbuF357HvlpV1z57w5I/QG4
 lLQQmMFR6qimPosEOJCUvDYgJsSh76/g8V+4zGbc8/l+/gAendWy/m66KSdB6HudTaxg
 gRArlxExukHpKd3zzU7yp7+qtSX+RVYTjxVvGe1igvTcuiuk7q7mQgZ8AELDqm7u2YP9
 lPLw==
X-Gm-Message-State: AOAM530oK6BURyMnirgbnKNntvRBIFeBDVuX17liKnfNEa4SP8eSa2E3
 V9zGwoIXKhmguF8mjQqr81pLwY9/8r/nhJb0II5mQg==
X-Google-Smtp-Source: ABdhPJwFNRCSr0/dPoK8wSlj1H2T5uIMWR0N4+GVlprTJ6WDuON1qW34quodUCBvOQ/VjzEH4Ib34wSCpNcyoA7J6WQ=
X-Received: by 2002:a62:d044:0:b0:4ba:6f3b:ab08 with SMTP id
 p65-20020a62d044000000b004ba6f3bab08mr65661363pfg.29.1641573584363; Fri, 07
 Jan 2022 08:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20211110220050.2854-1-jirivanek1@gmail.com>
 <20220106190027.1498-1-jirivanek1@gmail.com>
 <CAGWqDJ6T6EGNjoc2qfNHLMdcuwcnJArF7a7sToRXJ90Zs57E_A@mail.gmail.com>
In-Reply-To: <CAGWqDJ6T6EGNjoc2qfNHLMdcuwcnJArF7a7sToRXJ90Zs57E_A@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 7 Jan 2022 17:39:33 +0100
Message-ID: <CAG3jFyuWtQ4Zr1RhHjjzjOavzt7T2_z9bHVZJ2vDXCjSEuWztA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge/tc358775: Fix for dual-link LVDS
To: Vinay Simha B N <simhavcs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jiri Vanek <jirivanek1@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Jan 2022 at 20:22, Vinay Simha B N <simhavcs@gmail.com> wrote:
>
> Reviewed-by: Vinay Simha BN <simhavcs@gmail.com>
>
> Jiri Vanek,
> Could you please share the part number or datasheet of the dual-link LVDS display/panel used.
>
>
> On Fri, Jan 7, 2022 at 12:30 AM Jiri Vanek <jirivanek1@gmail.com> wrote:
>>
>> Fixed wrong register shift for single/dual link LVDS output.
>>
>> Tested-by: Jiri Vanek <jirivanek1@gmail.com>
>> Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
>>
>> ---
>> v1:
>> * Initial version
>>
>> v2:
>> * Tested-by tag added
>>
>> ---
>>  drivers/gpu/drm/bridge/tc358775.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
>> index 2272adcc5b4a..1d6ec1baeff2 100644
>> --- a/drivers/gpu/drm/bridge/tc358775.c
>> +++ b/drivers/gpu/drm/bridge/tc358775.c
>> @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
>>  }
>>
>>  #define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
>> -#define TC358775_LVCFG_LVDLINK__SHIFT                        0
>> +#define TC358775_LVCFG_LVDLINK__SHIFT                        1
>>  static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
>>  {
>>         return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
>> --

Applied to drm-misc-next
