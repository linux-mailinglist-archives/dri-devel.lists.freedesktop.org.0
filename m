Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8725AD0A9
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C21210E2D1;
	Mon,  5 Sep 2022 10:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F17D10E2D3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:53:45 +0000 (UTC)
Received: from [192.168.2.145] (unknown [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 481FC6601EE3;
 Mon,  5 Sep 2022 11:53:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662375223;
 bh=tUTd2m3nR6U01woQKAodDrlaOuHhF5+x2TW8FD72guk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QDVKaBW+A1Hwo04iGcKbPUC1E2zUzzl+LF//Tj5x3fJdHDPLj2xM1R6GFnViVR1Gt
 cRv/C2z76XL5CAWqmwjvdtvHYFRRLxdwQKylPWDhkWIK3KRWz0xsckY1698E1Cn76e
 CKro+FXClUE06ko1BHN7mbOjuDN4Bk2zC7yU0YrY4WmPjFRqjJhxfbZHGfWYKN0XQR
 jSg6GHzW2x2FdpZHDGGuo+uU2HIO8itcP7y4fIKs54UhTa/a8JH8GvkRhZULqap4Ex
 KGIyQKIXamGfvLvR8ji2pvqiz2MFxJyzNvDe64dde6dh5+2iFEZix3Pksg0gDzvuHe
 JWk33/t/bjyJw==
Message-ID: <80985882-c46f-cfb1-b077-a92866536678@collabora.com>
Date: Mon, 5 Sep 2022 13:53:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v17 00/10] Add MT8195 DisplayPort driver
Content-Language: en-US
To: chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
 <af23462c-2d3b-470a-7fd6-2bf09a3174cb@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <af23462c-2d3b-470a-7fd6-2bf09a3174cb@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 Dmitry Osipenko <digetx@gmail.com>, deller@gmx.de,
 Project_Global_Chrome_Upstream_Group@mediatek.com, wenst@chromium.org,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, devicetree@vger.kernel.org,
 jitao.shi@mediatek.com, tzimmermann@suse.de, liangxu.xu@mediatek.com,
 msp@baylibre.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 granquet@baylibre.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/4/22 15:59, Dmitry Osipenko wrote:
> 01.09.2022 07:41, Bo-Chen Chen пишет:
>> This patch is separated from v10 which is including dp driver, phy driver
>> and dpintf driver. This series is only contained the DisplayPort driver.
>>
>> This series can be tested using 5.19-rc2 kernel and I test it in MT8195
>> Tomato Chromebook. Modetest these modes:
> 
> Applied to drm-misc-next, thanks!

Hello Chun-Kuang Hu,

Angelo told me today that you wanted to pick up the MTK driver patches
and I applied them all to the drm-misc instead just of the "video/hdmi"
patch. The series was fully reviewed and tested, so I had no doubts when
applied all the patches.

The applied patches can't be reverted, so if you have more changes
prepared for the MTK driver, then please rebase them on top of the
latest drm-misc-next.

Apologizes for this confusion. Please let us know if we can help you.

-- 
Best regards,
Dmitry
