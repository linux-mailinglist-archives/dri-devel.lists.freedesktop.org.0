Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B59168D3EE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8553010E4AE;
	Tue,  7 Feb 2023 10:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3E910E2B1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 10:18:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so12791797wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kLLx20F7NbR7nNfJdfQ5Hgv+0Ve1FHr+kCZtFl+OlO8=;
 b=avGr3m3d8F5tOb+6Mkyv4qLlQF0g8TbRNg8d6tCXYrnbY28MtEg4vqEOH9kCRyZWl7
 iDrLSChYDzdWIu47F/xuhTtMm+zx3X7S9BTvDPFa24vY1d1l2dbEIZJHR5o3DpnUDqEZ
 wHAqp0tDVSeEiLNUpTQpZbaaTzg58XVyQSIUWzzb/vRN/3sYFbkyPhTVxQHDEv/yFuVm
 iSSTrHCGeiITlE50s1hiWgMllOmaPSYBeIfVDwk2xiw6IARp3d8HSHUZVGpt4040oSEW
 znENUSB/kOLUhWoIKS7mrr9whp9fx8aW8TMFktOjhqY8zkGsBpYRrmIB6K0xU8k5L6ji
 urqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kLLx20F7NbR7nNfJdfQ5Hgv+0Ve1FHr+kCZtFl+OlO8=;
 b=IHjlImTRtho7AWBjlNEjMoPEk1cEIwh8t+0+1o+xQJUYt6Td0j6BTUtcuKQRY+nAA9
 aRdUMqhQuRhcpbrQ+MIurWykDQcwjpdadZn/VkislVaFBfO1bAKGuQE5rKsopJUXTLyx
 NhvE6vvKMgN0jfyMUFCwIg9t9vr3mk4oarzdOE4RLak7kJqIceg1XDtiehB391XRqTD1
 eYOSigmbznN4zBzYIH3HBxWg9ImGhZzOYk40r0JHIbqYeKT9/ZyfzDUFVSMuFDPXBIDF
 tVTPgcPe6hNzE6G1k7S4HhIiOKTS0coeeyoEjgobGFpvehnXXHlPUbxAhDy1p1SHRs0f
 jnbw==
X-Gm-Message-State: AO0yUKXP9DaeQ+rCjVw4v8PyiLwXmyJnOXVgprQJqRN/bVavYW6I1cR8
 OwFM91+Tr7GOioyCL+NUhHaFrg==
X-Google-Smtp-Source: AK7set/fqWMoo/67C5e6aN/N23/ojrGCaNOq7vIp4qocRepL61PNkS4QjdfpRrdi1TuwVF/TsTNoFw==
X-Received: by 2002:a05:600c:a292:b0:3df:eb5d:fbf with SMTP id
 hu18-20020a05600ca29200b003dfeb5d0fbfmr2598489wmb.38.1675765084722; 
 Tue, 07 Feb 2023 02:18:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3?
 ([2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c3b8200b003dfe659f9b1sm1725584wms.3.2023.02.07.02.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 02:18:03 -0800 (PST)
Message-ID: <b02bc768-ea92-27ea-86c7-413246fe95a5@linaro.org>
Date: Tue, 7 Feb 2023 11:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
 <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
 <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
 <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
 <4bf0e5a2-23b6-1964-b30f-a5cb57f35e68@linaro.org>
 <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 11:02, Geert Uytterhoeven wrote:
> Hi Neil,
> 
> On Tue, Feb 7, 2023 at 10:59 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>> On 07/02/2023 10:40, Geert Uytterhoeven wrote:
>>> On Tue, Jan 10, 2023 at 5:37 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>> On 10/01/2023 08:57, Laurentiu Palcu wrote:
>>>>> On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
>>>>>> On 09/01/2023 18:21, Laurentiu Palcu wrote:
>>>>>>> It looks like there are some issues with this patchset... :/ I just
>>>>>>> fetched the drm-tip and, with these patches included, the "Hot plug
>>>>>>> detection already enabled" warning is back for i.MX DCSS.
>>>>>>
>>>>>> Could you please provide a backtrace?
>>>>>
>>>>> Sure, see below:
>>>>
>>>> I wondered, why didn't I see this on msm, my main target nowadays. The
>>>> msm driver is calling msm_kms_helper_poll_init() after initializing
>>>> fbdev, so all previous kms_helper_poll_enable() calls return early.
>>>>
>>>> I think I have the fix ready. Let me test it locally before posting.
>>>
>>> Is this fix available?
>>> Do you have a lore link?
>>
>> The fix at [1] has been applied on 2023-01-26
>>
>> [1] https://lore.kernel.org/all/20230124104548.3234554-1-dmitry.baryshkov@linaro.org/
> 
> Applied where? linux-next does not have it.

On drm-misc-next, it should have been send to drm-misc, but it seems the last PR
to drm-misc was sent without those:

https://cgit.freedesktop.org/drm/drm-misc/tag/?h=drm-misc-next-2023-01-26

Thomas, Maxime, is it too late to get those into v6.3 ? I did apply them before rc6.

Neil



> Thanks!
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

