Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FBC68D94F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 14:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CB010E2CF;
	Tue,  7 Feb 2023 13:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CED10E2CF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 13:30:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id y1so13570369wru.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 05:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=QFRY8l975SG0htBMNX2RaAHlE3X6PIi5Arw3VidyWxk=;
 b=PzI8UYULwWu0ZkL3TzdEroaha7ac16Lsd6ACzqnS1czR/eFkebq/zPekJHdgwUP8ey
 gVezDX3nKvLQ84rHuN1vO7mxYWmV2ZKYubaN0tS50a7HlHT10YiMgdERvpZofoQJt5em
 Y/BX5a1Pz/0qqveRQi680OJQ0UDfnV1LPmELwW7ONMJdQp3t6+8GNgWLTYRMHW8WFO/A
 bA/ofZhTwXdW3nZeTFaWs9QerwLp77BmkmDlpwPAGDXH2JaRrYP0ypQ1xlcvrBYCQS02
 PWCViepUxb+7O42yaKbjpI2mfSEAYVivKXo7oKTFJvk8IpFyge7qVCJapqwYOw/WyaWA
 0Wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QFRY8l975SG0htBMNX2RaAHlE3X6PIi5Arw3VidyWxk=;
 b=zNYRw0hFWsXwXyeiORsZf5vhCh56bySXrKOoqh0g1T9I0/p2t7szQW+b5YA7N8DtyZ
 14v9Cs1tUu0hz35/QHNAagm0DLirf5tIDnz3MdSIH4tKtkO9bshR9VDuTFravloEgfmY
 uXQAyjTjCsmE1Q7LMtFi0z97XOrNZb6hLKIaDAn0PUI/r6b624eBHJHiZcgz4RjNDvQm
 LRA7FKrffMkoFNMDKmPVMZDbFCaqvvbgNdfuqlcBWLOLFPYpUEtk5rAOJglDwGiTjMMA
 74lVnYV+p4OrZsetIoArQI0m5pjebWcPw6Key6oZS5IJ3Dy2QtQNI323sImota30IfOn
 c2rQ==
X-Gm-Message-State: AO0yUKWz4J1a0XXobSndx1UEVAV1kaJVW9rPCMA3YOreLOmBewBQz3Nv
 LBiF4hh/paeh2oh0SN6szHCg6Q==
X-Google-Smtp-Source: AK7set8lMKCObqyAdbxEb0nTgdUyVM5rVpjgn42BqxPP5fL2YunnT7ZwjsQLHDKt6pgJf9pq87hmig==
X-Received: by 2002:adf:f007:0:b0:2b6:7876:3cd4 with SMTP id
 j7-20020adff007000000b002b678763cd4mr2691948wro.16.1675776636869; 
 Tue, 07 Feb 2023 05:30:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3?
 ([2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a5d58d5000000b002c3f0a78e39sm2651551wrf.9.2023.02.07.05.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:30:36 -0800 (PST)
Message-ID: <31b5a693-d9e6-1c21-9fa7-32abc431a46d@linaro.org>
Date: Tue, 7 Feb 2023 14:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
 <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
 <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
 <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
 <4bf0e5a2-23b6-1964-b30f-a5cb57f35e68@linaro.org>
 <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
 <CAMuHMdUgtiuxJ9dnjcGy77onHtrhabT5krJMp2XSr4KOD31ydQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAMuHMdUgtiuxJ9dnjcGy77onHtrhabT5krJMp2XSr4KOD31ydQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Tomi Valkeinen <tomba@kernel.org>,
 freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 11:19, Geert Uytterhoeven wrote:
> Hi Neil,
> 
> On Tue, Feb 7, 2023 at 11:02 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Tue, Feb 7, 2023 at 10:59 AM Neil Armstrong
>> <neil.armstrong@linaro.org> wrote:
>>> On 07/02/2023 10:40, Geert Uytterhoeven wrote:
>>>> On Tue, Jan 10, 2023 at 5:37 PM Dmitry Baryshkov
>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>> On 10/01/2023 08:57, Laurentiu Palcu wrote:
>>>>>> On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
>>>>>>> On 09/01/2023 18:21, Laurentiu Palcu wrote:
>>>>>>>> It looks like there are some issues with this patchset... :/ I just
>>>>>>>> fetched the drm-tip and, with these patches included, the "Hot plug
>>>>>>>> detection already enabled" warning is back for i.MX DCSS.
>>>>>>>
>>>>>>> Could you please provide a backtrace?
>>>>>>
>>>>>> Sure, see below:
>>>>>
>>>>> I wondered, why didn't I see this on msm, my main target nowadays. The
>>>>> msm driver is calling msm_kms_helper_poll_init() after initializing
>>>>> fbdev, so all previous kms_helper_poll_enable() calls return early.
>>>>>
>>>>> I think I have the fix ready. Let me test it locally before posting.
>>>>
>>>> Is this fix available?
>>>> Do you have a lore link?
>>>
>>> The fix at [1] has been applied on 2023-01-26
>>>
>>> [1] https://lore.kernel.org/all/20230124104548.3234554-1-dmitry.baryshkov@linaro.org/
>>
>> Applied where? linux-next does not have it.
> 
> commit cbf143b282c64e59
> ("drm/probe_helper: extract two helper functions") in next-20230127
> next-20230130 next-20230131
> commit d33a54e3991dfce8
> ("drm/probe_helper: sort out poll_running vs poll_enabled") in
> next-20230127 next-20230130 next-20230131
> 
> but not in any later version?

$ git log --oneline --author=dmitry next-20230207 drivers/gpu/drm/drm_probe_helper.c
c8268795c9a9 drm/probe-helper: enable and disable HPD on connectors
78b991ccfa64 drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()

$ cat Next/SHA1s | grep drm
drm-fixes       4ec5183ec48656cec489c49f989c508b68b518e3
drm-intel-fixes 4c7b9344cadbed477372c75e3c0a8cfd542f5990
drm-misc-fixes  8f20660f053cefd4693e69cfff9cf58f4f7c4929
drm             1c0db6d84f8e0ac8f14178f13250e36ebcf457ee
drm-misc        d20a8f409259f1782f080b434054854020878f23
drm-intel       155c6b16eec2eaaaf6c71abf2d5e71641770d7ba
drm-tegra       b9930311641cf2ed905a84aabe27e8f3868aee4a
drm-msm         dbd7a2a941b8cbf9e5f79a777ed9fe0090eebb61
drm-msm-lumag   1d233b1cb149ec78c20fac58331b27bb460f9558
imx-drm         927d8fd465adbaaad6cce82f840d489d7c378f29

so weren't merged into drm-misc, I'll ping Thomas & Maxime on irc.

Neil

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

