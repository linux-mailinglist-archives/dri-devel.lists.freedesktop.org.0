Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C9D68D362
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 10:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A840410E49F;
	Tue,  7 Feb 2023 09:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943DD10E49F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 09:59:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id z13so3144187wmp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 01:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=V8cafR5heNSgUWmDd2vLZXXkss4BeQe0FGvhOiDp+Ks=;
 b=Wg9nsLmtRkNb7qtmH3BTcAvf9hsh/NXzrh9HajBihYvZjKVrlT8iygwl7VKcPfGtSz
 hUiATbX/22LwTt3mL3Y0XFKA72EvdU9wvhX2NWtuEIW1JjSq44ZWu3abjrTjn/EHR9eV
 bK60gy6/yHErbhsWcITV5GEZa7s99Tbh2QSpT1leQ28RGX0wkkT9E0jgFwXupbwl2Scw
 MAysXHh4sf+Q6PxCdNDjxr7qFHiIO3/noknpBy7po1CMNvT9k7P87AwBfiXu62o1jXCv
 LdhX21Fr1Na5zis9IUAHMpRgpF/FV4yTLauQHzU2aJDQ3sYt82tiUD+iuz3PvD/aOuL9
 KwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V8cafR5heNSgUWmDd2vLZXXkss4BeQe0FGvhOiDp+Ks=;
 b=ui/+T67hnKiatmpdArylmVmVOFe0lauC7ZYMUwkNVdjXwd79aFzZ+3Xl5DsFhaTR7A
 HKtdOQqvY9AGHkRUHrscrze8sHPgXDTt2bU/k/uVqH9Ci8DMAd2d7XVjegA4qr8ZaGYE
 R7tPbGELuGc6VnTQWAxOZcnXT3BRsFvhFrkvwvNqjsPzF42vYemU8TlCu3YXW69LX4Jn
 3ppJVdOYvvr+KzXcmYfj4RRqLBO8/ORJMG7ZkaUxyo8GTjueO5rzLz7h812VjfNwRLcH
 hWOYu4CSsAJkPR0Z/TOEQ5XGmtAHIclGQRvIdxxDAewnvnBPC9YVC+Y8dhRvlg5fIq6y
 DBLw==
X-Gm-Message-State: AO0yUKWEGUf/7F4rMtx1Iwpchr01XlahaZFpu7WR1uYO0STD9oB/So4q
 vXZTaMC9yCGk1NmYu3SPAAyMRw==
X-Google-Smtp-Source: AK7set+Vkzb2ncsHO4W72nnLnadejmihXcegTjCA60uAkgwinOlVGFJnnk6RDfzbo5U9f9Nzr4EG8Q==
X-Received: by 2002:a05:600c:43c4:b0:3dd:1b76:347f with SMTP id
 f4-20020a05600c43c400b003dd1b76347fmr2504804wmn.18.1675763946130; 
 Tue, 07 Feb 2023 01:59:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3?
 ([2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a5d5002000000b002c3be6ae0b1sm10802739wrt.65.2023.02.07.01.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 01:59:05 -0800 (PST)
Message-ID: <4bf0e5a2-23b6-1964-b30f-a5cb57f35e68@linaro.org>
Date: Tue, 7 Feb 2023 10:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
 <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
 <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
 <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On 07/02/2023 10:40, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> On Tue, Jan 10, 2023 at 5:37 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>> On 10/01/2023 08:57, Laurentiu Palcu wrote:
>>> On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
>>>> On 09/01/2023 18:21, Laurentiu Palcu wrote:
>>>>> It looks like there are some issues with this patchset... :/ I just
>>>>> fetched the drm-tip and, with these patches included, the "Hot plug
>>>>> detection already enabled" warning is back for i.MX DCSS.
>>>>
>>>> Could you please provide a backtrace?
>>>
>>> Sure, see below:
>>
>> I wondered, why didn't I see this on msm, my main target nowadays. The
>> msm driver is calling msm_kms_helper_poll_init() after initializing
>> fbdev, so all previous kms_helper_poll_enable() calls return early.
>>
>> I think I have the fix ready. Let me test it locally before posting.
> 
> Is this fix available?
> Do you have a lore link?

The fix at [1] has been applied on 2023-01-26

[1] https://lore.kernel.org/all/20230124104548.3234554-1-dmitry.baryshkov@linaro.org/

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

