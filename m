Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C106445062
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 09:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501636EC1E;
	Thu,  4 Nov 2021 08:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTP id D28DB6F4EF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 02:39:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.128])
 by APP-01 (Coremail) with SMTP id qwCowADnfyDxR4Nhrh13Bg--.47019S2;
 Thu, 04 Nov 2021 10:39:45 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: marex@denx.de, stefan@agner.ch, airlied@linux.ie, daniel@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Subject: Re: Re: [PATCH] drm: mxsfb: Check NULL pointer
Date: Thu,  4 Nov 2021 02:39:44 +0000
Message-Id: <1635993584-3414975-1-git-send-email-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: qwCowADnfyDxR4Nhrh13Bg--.47019S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWxArWrXw47KF48Gr1kGrg_yoW8GF43pr
 45WrZ2kFy8Xay5KanrA3W7GFn5Aa4kJFy8Cr10g3s5uFn5ur4DAFyDJF45XF18ArZ5XFy2
 q345Z3yfWr1UCFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JUHWlkUUUUU=
X-Originating-IP: [124.16.138.128]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Mailman-Approved-At: Thu, 04 Nov 2021 08:33:27 +0000
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
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/3/21 8:58 AM, Marek Vasut wrote:
>> As we see in the drm_connector_list_iter_next(), it could return
>> NULL. In order to avoid the use of the NULL pointer, it may be
>> better to check the return value.
>> 
>> Fixes: c42001e ("drm: mxsfb: Use drm_panel_bridge")
>> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
>> ---
>>   drivers/gpu/drm/mxsfb/mxsfb_drv.c | 2 ++
>>   1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> index 6da9355..b875c11 100644
>> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> @@ -145,6 +145,8 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>>   	 */
>>   	drm_connector_list_iter_begin(drm, &iter);
>>   	mxsfb->connector = drm_connector_list_iter_next(&iter);
>> +	if (!mxsfb->connector)
>> +		return 1;

> In which case does this happen failure happen ?
> What is the test case ?

As fas as I am concerned, 'connector_list' in the
drm_connector_list_iter_next() is initialized in the
drm_mode_config_init(), which is 'connector_list->next = connector_list'.
And therefore, the check in drm_connector_list_iter_next() that
'if (lhead->next == &config->connector_list)' is directly satisfied and
returns NULL.
I am not sure wheter it is designed on purpose. If not, please fix it.

