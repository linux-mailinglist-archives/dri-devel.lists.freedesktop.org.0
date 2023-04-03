Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66886D410F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 11:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AF210E2CA;
	Mon,  3 Apr 2023 09:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A31E10E2CA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 09:47:21 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id cn12so114884509edb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 02:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680515237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=htPk5PXTOqeqOET7dyhcLS5Nxh2cxnK3mpGnQz9jlEw=;
 b=SvoeEbbR8OcfvVqTljRORHpbqaNFE7cu/bdh4a3d3VE4NUnwo1J/oyoAPXZ0a+yBUd
 hIKYw+s6BKEbV0nyzwPXNSkFmbnG6OvxYMeFlUu8hGHeCQjuWipnJzmGn+D0mXZA7nOM
 /Y+FgreAigmNIHhIlvRuWlr3UDh+bYcY3u4ByQaS7QhPfxvqH4hJAZS0IR9nJoqOfiPU
 GZLEPeUrjBKgNAEOt9DNXW8PLIhwOk20YHAJALYC7vLuI5K+qpFmK2ZLZAVYgR4bIwAa
 EhDpTeIbMKoqH9kswhsCWOrMOTkV2nvh1hy+jA9x4KeaKRRkGfWjdQ4iChZRhW1ax7/b
 vGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680515237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=htPk5PXTOqeqOET7dyhcLS5Nxh2cxnK3mpGnQz9jlEw=;
 b=N33sH66FCM1Df2wDnqD/asQ05uuootgRf+jl1eWIRI21mzj7VlGiarQuWSmYnaZ/RA
 E+ahtH0qgJd61XjRtoZu1P8/5EW770yqDYjlVO39tiHKeFHUjl2uiMLX7rnWtjy8FYPk
 pfGhfjwzPoq/fXqnpYw15EUqWdvttTUethE77ypH/6+lSWHodGbuaX3mhXUZQcA3m5/F
 5yemi1XiRKabsDdmkT4VJZiLCqvvZNokvXgBqgBp6MlMMfJ4c2rM4KfdujbHEBQZH/31
 1FnUAwqJ89hdljfkH3l+N6BkmkSFPaPE5jj8OGRVx029bnzLBLRA0iS/GL+SiPhuB/hw
 a+HA==
X-Gm-Message-State: AAQBX9dWaWsd3Zat1jOxtuLT/GpBFhBvXmivjDvHDQplHXd8AXqM/FwI
 wScv6JGoOywmEEXSgQWZhNfZyA==
X-Google-Smtp-Source: AKy350aq2/eAtEYHLJ3R4+ZQV7M03sIMNYL9wBr9zDABKJ8ufu9aCsyLHfIX7yY35iys3sUdYSzvjg==
X-Received: by 2002:a17:906:6bd5:b0:930:7ae6:9ebd with SMTP id
 t21-20020a1709066bd500b009307ae69ebdmr35660301ejs.70.1680515237638; 
 Mon, 03 Apr 2023 02:47:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805?
 ([2a02:810d:15c0:828:ae90:d80:1069:4805])
 by smtp.gmail.com with ESMTPSA id
 la6-20020a170907780600b009351565d1f5sm4285058ejc.52.2023.04.03.02.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 02:47:17 -0700 (PDT)
Message-ID: <d0b9d8a2-14ae-8c0d-309b-5f5d60d43a1d@linaro.org>
Date: Mon, 3 Apr 2023 11:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
References: <20230321121859.2355-1-nancy.lin@mediatek.com>
 <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
 <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com>
 <97a5f383-38f5-e8ea-e1d8-489b690e4521@collabora.com>
 <CAAOTY_9_vn-m2jTaaHkFDV+v2-LeaAxtCLNNnOxZq5Httb-TAQ@mail.gmail.com>
 <CAGXv+5FJCuG_zHnaKZ=baNzKAWKLEe3jZnghNAxuGv7i7L6e7Q@mail.gmail.com>
 <CAAOTY_9Dbtubah3ndj9+FeYDh7D42k6-BtHrYMNc=CP6GL6uFA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAOTY_9Dbtubah3ndj9+FeYDh7D42k6-BtHrYMNc=CP6GL6uFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, singo.chang@mediatek.com,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 clang-built-linux@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy.Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/04/2023 05:30, Chun-Kuang Hu wrote:
> Hi, Chen-yu:
> 
> Chen-Yu Tsai <wenst@chromium.org> 於 2023年3月30日 週四 下午7:05寫道：
>>
>> On Mon, Mar 27, 2023 at 11:17 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>>>
>>> Hi, Angelo:
>>>
>>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 於
>>> 2023年3月24日 週五 下午4:38寫道：
>>>>
>>>> Il 24/03/23 00:25, Chun-Kuang Hu ha scritto:
>>>>> Hi, Angelo:
>>>>>
>>>>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 於
>>>>> 2023年3月23日 週四 下午4:58寫道：
>>>>>>
>>>>>> Il 21/03/23 13:18, Nancy.Lin ha scritto:
>>>>>>> The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.
>>>>>>>
>>>>>>> Add DRM and these modules support by the patches below:
>>>>>>>
>>>>>>
>>>>>> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromebooks.
>>>>>> Green light from me.
>>>>>
>>>>> I'm curious about how you build code and test on Chromebooks. Do you
>>>>> build in cros environment or pure linux
>>>>> (https://archlinuxarm.org/platforms/armv8/mediatek/acer-chromebook-r13).
>>>>> I've a MT8183 based Chromebook (HP 11a) and I've tried to run a
>>>>> upstream kernel on it. cros is too heavy for me and I doubt I could
>>>>> use it. I've tried the pure linux and could boot up with console, but
>>>>> display does not work. If you use the pure linux environment, could
>>>>> you share how it works?
>>>>>
>>>>
>>>> I haven't tested MT8183 (I don't actually have any 8183 machine in my hands)... but
>>>> yes, I can share my test environment.
>>>>
>>>> I have one MicroSD that I use either in the MicroSD slot of the target machine, or
>>>> in a USB reader; this *single* system is what I boot on *all* Chromebooks that I
>>>> have: one kernel, multiple devicetrees, same Debian-based userspace.
>>>>
>>>> What we have to prepare this bootable media can be found at [1], but beware that
>>>> it currently uses an outdated kernel, so, what I have locally is a symlink to my
>>>> kernel tree.
>>>> You can change/add/remove the devicetree blobs that will get added to the image
>>>> by modifying `chromebook-setup.sh`; before tampering with kernel tree symlink,
>>>> please run that script for the first time, as it will download a cross-compiler,
>>>> a kernel tree (that you will replace for sure) and the (very old) Debian rootfs
>>>> that you can update with `apt-get dist-upgrade` after booting the Chromebook.
>>>>
>>>> If you want to check about possible kernel configuration differences, what I use
>>>> is at [2], so that you can compare.
>>>
>>> Thanks for the information, I would try to compare the kernel config first.
>>
>> Hi CK,
>>
>> Would you consider adding your repo to linux-next? That would let everyone
>> do integration testing, especially automated ones, earlier, before you send
>> your PRs to drm maintainers.
>>
>> You can do so by sending an email to Stephen Rothwell to do so.
> 
> I don't understand what this process is. Does it means that I directly
> upstream patches into linux-next? I prefer that my patches go through
> drm maintainers' tree. Does any document introduce this process?

All maintainers and sub-maintainers trees are supposed to be fed into
linux-next.

https://lore.kernel.org/linux-next/20230327124805.3ca4f3cc@canb.auug.org.au/T/#md226a8e714cc731c2ab4ba5ee7eb43fe21a55009

Documentation/process/howto.rst
Documentation/process/2.Process.rst


Best regards,
Krzysztof

