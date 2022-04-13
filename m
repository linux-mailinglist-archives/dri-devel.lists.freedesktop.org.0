Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 175464FF11C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 09:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FEA10EEFB;
	Wed, 13 Apr 2022 07:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F4D10EEFB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 07:57:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D10231F44E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649836663;
 bh=mzWuX58y4C68CcEn/a3a+EywObIenobNezPNhsxckgU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kmXqsesSLvWFXzGLTRqiWYSvGN5LlWNAB2FD23E8+ZrbGAW+o2zP1LzJNsSBPxhjg
 nZD50ua/mXxtL5FVp3MUxGXDKntSSHgUHVzv+8hZN9VsiSkBuW+aLxP3HcN7+qrpsp
 ZA4/7d8gH9NrJ4NCZsIMElGupIRW+KNTFSxc6sD4dSLglT75G1iWWAb/WDPiw/unGt
 Ptq5TZN3NIP95ftv0KTiPn+ZlxAYI1yBuNReJsIH39gIkOEQzmacvZq8/RGRGIZWUs
 YQ4tBIFxaakTc1bVA8nSmLlZFdlos8RfWTvoDvMg4WYfAXtZe7G1FEb2t+VnQa5OsO
 XD08QtZM8nlfg==
Message-ID: <1d9a6259-b1f6-5c4f-7e91-0529b77b6a44@collabora.com>
Date: Wed, 13 Apr 2022 09:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v8, 00/15] media: mtk-vcodec: support for M8192 decoder
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
 <fbfe4572296a133492310f13e3f41db56218fc17.camel@ndufresne.ca>
 <0f385e6e2d0687c3e6de12a576d1617af9504cee.camel@mediatek.com>
 <c5dc9f759054418082849233639f727e39329550.camel@ndufresne.ca>
 <cdcaf769ee162658e3bbb0c30bb8c4cbb168c6d6.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cdcaf769ee162658e3bbb0c30bb8c4cbb168c6d6.camel@mediatek.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/04/22 09:03, allen-kh.cheng ha scritto:
> Hi Nicolas,
> 
> On Tue, 2022-04-12 at 10:48 -0400, Nicolas Dufresne wrote:
>> Le lundi 11 avril 2022 à 11:41 +0800, yunfei.dong@mediatek.com a
>> écrit :
>>> Hi Nicolas,
>>>
>>> On Thu, 2022-03-31 at 16:48 -0400, Nicolas Dufresne wrote:
>>>> Hi Yunfei,
>>>>
>>>> thanks for the update, I should be testing this really soon.
>>>>
>>>> Le jeudi 31 mars 2022 à 10:47 +0800, Yunfei Dong a écrit :
>>>>> This series adds support for mt8192 h264/vp8/vp9 decoder
>>>>> drivers.
>>>>> Firstly, refactor
>>>>> power/clock/interrupt interfaces for mt8192 is lat and core
>>>>> architecture.
>>>>
>>>> Similarly to MT8173 and MT8183, a shared* firmware is needed for
>>>> this
>>>> CODEC to
>>>> work (scp.img). I looked into linux-firmware[1] it has not been
>>>> added
>>>> for mt8192
>>>> yet. As your patches are getting close to be ready, it would be
>>>> important to
>>>> look into this so the patchset does not get blocked due to that.
>>>>
>>>> best regards,
>>>> Nicolas
>>>>
>>>> [1]
>>>>
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mediatek__;!!CTRNKA9wMg0ARbw!zy4N6JDroSXtumXXa7MuxAgYAPAink8uyW-978vpWct8S3vOjBqXirFE8uTEHopHCovbSl0FNP9LPgWCEBrZfMIcvQ$
>>>>   
>>>> * Shared at least between MDP3 and MTK VCODEC from my knowledge
>>>>
>>>
>>> Thanks for your remind.
>>>
>>> I have already sent mt8192 scp.img to github.
>>>
>>>
> https://urldefense.com/v3/__https://github.com/yunfeidongmediatek/linux_fw_scp_8192/commit/3ac2fc85bc7dfcebdb92b5b5808b0268cdfb772d__;!!CTRNKA9wMg0ARbw!zy4N6JDroSXtumXXa7MuxAgYAPAink8uyW-978vpWct8S3vOjBqXirFE8uTEHopHCovbSl0FNP9LPgWCEBpf9F_nWA$
>>>   
>>>
>>> Waiting for to be merged.
>>
>> On boards I have, the firmware is loaded from /lib/firmware/scp.img,
>> but with
>> this submission it will be in lib/firmware/mediatek/mt8192/scp.img .
>> I haven't
>> found anything around:
>>
>>   drivers/remoteproc/mtk_scp.c:812:       char *fw_name = "scp.img";
>>
>> That would use the platform path. This seems like a problem to me,
>> the
>> upstreaming of the firmware isn't being aligned with the were the
>> firmware is
>> picked by the upstream driver. Correct me if I got this wrong, but
>> I'd really
>> like to clarify this.
>>
>> Nicolas
>>
> 
> I am not sure why it's accepted the fw path of scp is
> /lib/firmware/scp.img in mt8173/8183 but we upload scp.ing in
> /lib/firmware/mediatek/mt8173(mt8183)/scp.img to
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mediatek
> 
> Currently, the scp driver will load firmware in /lib/firmware/scp.img.
> that means there is only one firmware for a specific platform.
> I think we can send a PATCH to make firmware name of scp being more
> flexible.
> 
> Maybe get firmware name from dts. e.g.,
> &scp {
> 	status = "okay";
> 	firmware-name = "mediatek/mt81xx/scp.img";
> };
> 
> Do you think it feasible?
> If you have any concerns, please let us know.
> 
> Thanks,
> Allen
> 

Hello Allen,

what you proposed is exactly what has been done for other platforms because of
both per-device firmware differences (different signatures) and per-SoC (different
firmware entirely), found on TI K3, iMX DSP, Qualcomm MSS/DSP remoteproc and
others.

Of course this is an accepted way to resolve this situation: please go on!

Cheers,
Angelo

