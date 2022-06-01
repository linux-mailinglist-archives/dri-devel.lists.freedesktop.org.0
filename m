Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F41539FC5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0C010E13B;
	Wed,  1 Jun 2022 08:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTP id A3B2910E13B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:46:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-05 (Coremail) with SMTP id zQCowAC3vHwQJ5diSvI3DA--.11078S2;
 Wed, 01 Jun 2022 16:45:19 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: laurent.pinchart@ideasonboard.com
Subject: Re: Re: [PATCH] drm: bridge: adv7511: Add check for
 mipi_dsi_driver_register
Date: Wed,  1 Jun 2022 16:45:01 +0800
Message-Id: <20220601084501.2900380-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3vHwQJ5diSvI3DA--.11078S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFyxtF43WFW8tF15tr1DWrg_yoWxKrbE9r
 WjqF17uw4DGa9xGF1fCr1ruFy2kFWUArs3Xr1SyFyaywn3tr40gw4UJF92yF1DGr4Iya9x
 KFWUXryfAwnFvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxkFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 QVy7UUUUU==
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: jagan@amarulasolutions.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, robert.foss@linaro.org, andrzej.hajda@intel.com,
 alsi@bang-olufsen.dk, biju.das.jz@bp.renesas.com, sam@ravnborg.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 01, 2022 at 02:52:00PM +0800, Laurent Pinchart wrote:
>>  static int __init adv7511_init(void)
>>  {
>> -	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
>> -		mipi_dsi_driver_register(&adv7533_dsi_driver);
>> +	int ret;
>> +
>> +	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
>> +		ret = mipi_dsi_driver_register(&adv7533_dsi_driver);
>> +		if (ret)
>> +			return ret;
>> +	}
>>  
>>  	return i2c_add_driver(&adv7511_driver);
> 
> While at it, should this then call mipi_dsi_driver_unregister() on
> failure ?

Well, as far as I am concerned, the adv7511_exit() in the same file has already dealt with the issue.
Therefore, it might not be necessary to add another mipi_dsi_driver_unregister().

Thanks,
Jiang

