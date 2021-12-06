Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C54695BF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 13:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A4B73FD9;
	Mon,  6 Dec 2021 12:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [IPv6:2001:888:0:108::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DEA73FD6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 12:33:42 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id uDBYmouE8QyExuDBbm29bY; Mon, 06 Dec 2021 13:33:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1638794021; bh=bZ+CLaoPT5tY5Fs+ojwV7IM2puh3ptKjmQumE2EskXM=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From:
 Subject;
 b=X4WyQ3Fp534wSlbVoSTh1FXgXSqlGMEXsHS4YcWzReeS4LDuXa/lwTbYD4A9BUtv3
 mGYmj2S29NGlHeYx/KEvTsnaIzHTZwEWboY5ldnbTN1gvEvBH/Ywlt3pqQKyC6eRm3
 Aj3dWvs2pghyHSKPNoX8VHwhEOnf8KRb4zUdSeypdpDQlhaCf+jyRpJZ4/yFHCOsdT
 NmJIIzSnAxKLi6pl3tjByhd2lslWTJlROmRLu7LU/pkUsvurqkOr5lbEytEVZNwe36
 7ueMeLvySN/cmSomHmVHaGt9llrr6Mpdcjodzq6TEw8ZzXU2AedK7GxyeW0SYaw195
 vJtmYYhZEwqCA==
Message-ID: <657ad1fc-0a90-bfc5-d4f1-9ff007f9f672@xs4all.nl>
Date: Mon, 6 Dec 2021 13:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH v9 00/15] Clean up "mediatek,larb"
Content-Language: en-US
To: Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <Ya35hNY0iAR/JPmI@8bytes.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Ya35hNY0iAR/JPmI@8bytes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC6q05SjXglfV5LxXFaSTSUMB/dlJSUNGmCADHFo5BmcyXwSnRfdCc1gNpWXs96C56P8Ity4Lw2P1xbKIlNoFwuzV4OYs5VbC4qyKxrfBLR09U0/kE5u
 5KEEkM7ZEJA7Nbmao7irdT15MoJD0Y+jwqFL5hqtuBO1x5Yx0YX9fcv9X+48YLAexPDS22OYZ3fRdQmu6BfbtFTNG1BXwYJrSv2CtcdC9z8ZxeoLDq7gRIQo
 d0WtL+CyxkfBKgBJQ5qIKFYPSAoE+PZ3JOHA3qp2uBhpOmyqe2+gX+Ct8sXYHfFzvXynqBIfyUiyMJ1SSnYawd3IXilpXxuLNhYqakWWMTuSMnnvEJmO94if
 kuLbLrG04MEtte+1n3coylDTLxKoM1Ny9Q+9+bHr1YRvg8aNBPrlq43SnobF13GLV+c25sLpdjI2GroYX7+bdBplzV7ti4urX6YMzjD8hE4t3dQgqZUcdoBM
 HyYp//T3CIVD1iPNhgFp51GKugQmeRE5wadiACVsyLD65InVfvNJQDpKdHgqB3mRFX87ah6D/NcC9O/TmvDGgL1nR1WlIwMHoHybex2mPoolv7l3KZQz54tf
 Y6nIrOdaTBKeWvZNjqWY77E4nOgZPVpaIiWyDiWaOams8YZuJBiAFu1gTL2DO18imGHECP+m4Efo9KmcjUfi05bEjCCi5SoZJMbQtauuBkhGw1BNi/nDvANX
 UF0e1EzKIl//d+5kCcgazSjh+WmzYFQzgpEh8Oav1klMGB+ATJgjuD2uQOhTkq1am3ZJ6bla4q8k0Umu7wARvp3LjjK41h/6SdcQOyZGmm0Ob1vg5tXjT7VV
 7gp87ouT+q/1l51vzHPSLspXXBfo3skIv4LPaBaAYrJbkxcqzjfKzCd8Td4ZijZ2ECIaFMLlm4wnunnHcPd9hQcf0FNulNqLSyPyhYUCwCrPnoX1M11bQDNc
 yhn1//ohwLCPL1IS6mrV8gQzOzz0xhOdyun/Ip7kSL/ImdbLORUz3UtJQRHtNdTBH/6AU7cAnGtFia5ho5wLyYQCNBe+R49EOznrp/miEZPfeN9qs3OKtyDN
 LR5mNbUz5XZf85F6CMwllw/hfEHRX69G3uiI3mzn+vq+52qQvot7It/LXvw5+cF949e6VmfTMpEdSIzqSDKq5gLKEYONyrxvCfiFkgiiq6GISkA+XpdOCFTQ
 5iw4uShr9zFgmQ7g9kR6y3Gb+SPNfXhh/Sl7SYgiZGGnvXKbDSZfirOZrIywOQ5yle4/Z6aNGlaG7pCuXAARbO2QdneI25kh8fkfd3DvxM18QAX7g269Kdbi
 9IVeQs/DebcHR50lMl1Gx9UAFiAe4vEbxxh8bFpvFFBykbMZLJ7pRM9+bChatDrg3fTSGVsh2KWR7BtOoiNxFgJu8HZt6D1Yf6osoRnq3Wv77FP6UoQmfhzY
 O6yuRj6tYBEB412IsrwaVJmqUfY9uOoDMebDRg==
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 yf.wang@mediatek.com, anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/12/2021 12:52, Joerg Roedel wrote:
> On Fri, Nov 12, 2021 at 06:54:54PM +0800, Yong Wu wrote:
>> Yong Wu (14):
>>   dt-binding: mediatek: Get rid of mediatek, larb for multimedia HW
>>   iommu/mediatek-v1: Free the existed fwspec if the master dev already
>>     has
>>   iommu/mediatek: Return ENODEV if the device is NULL
>>   iommu/mediatek: Add probe_defer for smi-larb
>>   iommu/mediatek: Add device_link between the consumer and the larb
>>     devices
>>   media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
>>   media: mtk-mdp: Get rid of mtk_smi_larb_get/put
>>   drm/mediatek: Get rid of mtk_smi_larb_get/put
>>   media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
>>   media: mtk-vcodec: dec: Remove mtk_vcodec_release_dec_pm
>>   media: mtk-vcodec: enc: Remove mtk_vcodec_release_enc_pm
>>   memory: mtk-smi: Get rid of mtk_smi_larb_get/put
>>   arm: dts: mediatek: Get rid of mediatek, larb for MM nodes
>>   arm64: dts: mediatek: Get rid of mediatek, larb for MM nodes
>>
>> Yongqiang Niu (1):
>>   drm/mediatek: Add pm runtime support for ovl and rdma
> 
> What is the plan for merging this? If Matthias has no objections I can
> take the iommu-parts, or will this go through another tree?

I think it might be easiest if it is all going through the media subsystem
(except for the dts patches, we don't handle those unless specifically
requested to do so). I need a resend for jpeg bindings txt to yaml
conversion series first, though. This time with the linux-media mailinglist
included :-)

I would need your Ack for the iommu patches as well, of course.

Regards,

	Hans
