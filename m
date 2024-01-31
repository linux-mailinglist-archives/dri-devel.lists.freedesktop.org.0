Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACEB843EAB
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 12:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449FA113B60;
	Wed, 31 Jan 2024 11:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD44113B60
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 11:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706701373;
 bh=1LrKOT6zOkvOtdG1q90dBaEd32pdBD9e7IHCq6opG3E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ABzV98aIWDp/moh2/6kSB/75RQPaCX1CmoupAYsmYelEfLo0KtRw9iQs4R8ItoJ4R
 r1mCT5mRcu9gnjvrMDcPN44gMPE4P3xt98NCrMUKooo1NS+eDLDrptHunAYN+Vl4m2
 XJTlC4JKQakK4DZ0iOxlCy+AzQ+730fZWFI5MXlQojMjH2Ix9fps5FJIk0Lv7jD/6s
 NQXi7vZDeFeKQKaLNGl7TygDovkqpVTeAufE/87T5HPAbA/lvOi0zpHp5IredGZXB8
 R9BcWPxsOb5Sr7sJ7hV1ZrBXeRlpPNh/9iYFGj5xvIwGQnLzIO9ZHgtLCMINIcF/lA
 ZpIrfScC/5ikQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 58C1B3781FE1;
 Wed, 31 Jan 2024 11:42:52 +0000 (UTC)
Message-ID: <11f4cfd2-f6a2-45cb-923a-95760a1b9883@collabora.com>
Date: Wed, 31 Jan 2024 12:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Content-Language: en-US
To: =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
 <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
 <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
 <089fe457-1c61-4b7b-ad37-a67e7f46cb56@sirena.org.uk>
 <6aa6947865795fc534b61f5b8a80b3c42fd5a0cd.camel@mediatek.com>
 <9c90185c-9cd4-4a08-9925-be5d460af54d@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <9c90185c-9cd4-4a08-9925-be5d460af54d@sirena.org.uk>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 =?UTF-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 03/08/23 21:33, Mark Brown ha scritto:
> On Thu, Aug 03, 2023 at 07:20:15AM +0000, Jiaxin Yu (俞家鑫) wrote:
> 
>> I agree with you, in fact the speaker is indeed doing this way. But
>> about the hdmi that on the board, I did not find a defination link
>> snd_soc_dapm_hdmi, so I use snd_soc_dapm_line to replace. The purpose
>> is to control it link speaker. Or what do you suggest I should do?
> 
> I think the sensible thing here is to define a DIGITAL_OUTPUT() which
> can be used for HDMI, S/PDIF and anything else that comes up and isn't
> clearly wrong like reusing one of the analog descriptions is.

Hello Jiaxin,

the MT8186 Corsola Chromebooks are broken upstream without this series.

Are you still interested in upstreaming this one?

Thanks,
Angelo
