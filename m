Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DAB6C79F3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6FF10EB98;
	Fri, 24 Mar 2023 08:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0466010EB98
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 08:38:02 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AF9CC66030AA;
 Fri, 24 Mar 2023 08:37:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679647080;
 bh=leUkIfYHsV7YSnV9uYcacAILh9PlFS9yw7oLnYyzBZk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YM36CPg3tx9GWc9j6w8ZllGxCQEngD+c15etZO4mZbNg0VZBSL+0UGXta0bloiDL+
 OONOa/97wu2hlYB93PA6FPDUnij7iz1cZkVjgmyBj1ee8yBBuyHbxUpBiG69bulGin
 9dd6v5nDtiOyzjs5szA+3AbzTZJb5pSVsdWSql0sxNHw+qeyQnUlelkhSXeWDHYKAd
 BXTT8hDlLF9gsqYiVzChYl4RnhKfrdY07RCUdE4yrqIKLx/XYsPRmxPtJmD/434GvE
 2yOw6yZYQ1IW/lvT/Bi2E49UdnfR9WNU+IX4nEpDiBGVUZnbiV1Sjplm7hmUmIgiLf
 2ljUSwxxqBguw==
Message-ID: <97a5f383-38f5-e8ea-e1d8-489b690e4521@collabora.com>
Date: Fri, 24 Mar 2023 09:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230321121859.2355-1-nancy.lin@mediatek.com>
 <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
 <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, clang-built-linux@googlegroups.com,
 singo.chang@mediatek.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy.Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 24/03/23 00:25, Chun-Kuang Hu ha scritto:
> Hi, Angelo:
> 
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 於
> 2023年3月23日 週四 下午4:58寫道：
>>
>> Il 21/03/23 13:18, Nancy.Lin ha scritto:
>>> The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.
>>>
>>> Add DRM and these modules support by the patches below:
>>>
>>
>> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromebooks.
>> Green light from me.
> 
> I'm curious about how you build code and test on Chromebooks. Do you
> build in cros environment or pure linux
> (https://archlinuxarm.org/platforms/armv8/mediatek/acer-chromebook-r13).
> I've a MT8183 based Chromebook (HP 11a) and I've tried to run a
> upstream kernel on it. cros is too heavy for me and I doubt I could
> use it. I've tried the pure linux and could boot up with console, but
> display does not work. If you use the pure linux environment, could
> you share how it works?
> 

I haven't tested MT8183 (I don't actually have any 8183 machine in my hands)... but
yes, I can share my test environment.

I have one MicroSD that I use either in the MicroSD slot of the target machine, or
in a USB reader; this *single* system is what I boot on *all* Chromebooks that I
have: one kernel, multiple devicetrees, same Debian-based userspace.

What we have to prepare this bootable media can be found at [1], but beware that
it currently uses an outdated kernel, so, what I have locally is a symlink to my
kernel tree.
You can change/add/remove the devicetree blobs that will get added to the image
by modifying `chromebook-setup.sh`; before tampering with kernel tree symlink,
please run that script for the first time, as it will download a cross-compiler,
a kernel tree (that you will replace for sure) and the (very old) Debian rootfs
that you can update with `apt-get dist-upgrade` after booting the Chromebook.

If you want to check about possible kernel configuration differences, what I use
is at [2], so that you can compare.

[1]: https://gitlab.collabora.com/google/chromebooks/-/tree/mtk-av1
[2]: 
https://gitlab.collabora.com/google/chromeos-kernel/-/blob/mt8195-tracking-master-rolling/arch/arm64/configs/defconfig

Regards,
Angelo
