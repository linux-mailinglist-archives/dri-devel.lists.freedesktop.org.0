Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08CE7DB5EB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 10:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F7D10E250;
	Mon, 30 Oct 2023 09:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5097D10E250
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:13:52 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxJujOcz9lQbU1AA--.46258S3;
 Mon, 30 Oct 2023 17:13:51 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxE+TJcz9lgOc2AA--.54536S3; 
 Mon, 30 Oct 2023 17:13:47 +0800 (CST)
Message-ID: <0b704a08-46d2-4c31-b51f-8abf09f99f88@loongson.cn>
Date: Mon, 30 Oct 2023 17:13:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/loongson: Allow attach drm bridge driver by
 calling lsdc_output_init()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-4-suijingfeng@loongson.cn>
 <CAA8EJpoWXtmMt9vpG9Q4dpv6HnMjtdmEo6rbBszXNG30NhbB1A@mail.gmail.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <CAA8EJpoWXtmMt9vpG9Q4dpv6HnMjtdmEo6rbBszXNG30NhbB1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxE+TJcz9lgOc2AA--.54536S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFWDCF1DCFWrJF1fJr4UWrX_yoW8Aw4rpF
 W8Xa98Krs8Jr1kWwn2vr4DA3sFqrsYyFyrt3yvkw13JasIyr9YvF48Xw4DGFy8Aa4Fgr4S
 yw1qgr13ua1Yk3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
 67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr
 0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07Um
 FAJUUUUU=
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/10/30 07:10, Dmitry Baryshkov wrote:
>> +
>> +static void lsdc_pipe1_hdmi_encoder_reset(struct drm_encoder *encoder)
>> +{
>> +       struct drm_device *ddev = encoder->dev;
>> +       struct lsdc_device *ldev = to_lsdc(ddev);
>> +       u32 val;
>> +
>> +       val = PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN;
>> +       lsdc_wreg32(ldev, LSDC_CRTC1_DVO_CONF_REG, val);
>> +
>> +       /* Using built-in GPIO emulated I2C instead of the hardware I2C */
>> +       lsdc_ureg32_clr(ldev, LSDC_HDMI1_INTF_CTRL_REG, HW_I2C_EN);
>> +
>> +       /* Help the HDMI phy get out of reset state */
>> +       lsdc_wreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG, HDMI_PHY_RESET_N);
>> +
>> +       drm_dbg(ddev, "%s reset\n", encoder->name);
>> +
>> +       mdelay(20);
>> +}
>> +
>> +const struct drm_encoder_funcs lsdc_pipe1_hdmi_encoder_funcs = {
>> +       .reset = lsdc_pipe1_hdmi_encoder_reset,
>> +       .destroy = drm_encoder_cleanup,
>> +};
>> +
>> +/* Built-in DVO encoder helper funcs */
>> +
>> +static void lsdc_dvo_atomic_disable(struct drm_encoder *encoder,
>> +                                   struct drm_atomic_state *state)
>> +{
>> +}
>> +
>> +static void lsdc_dvo_atomic_enable(struct drm_encoder *encoder,
>> +                                  struct drm_atomic_state *state)
>> +{
>> +}
>> +
>> +static void lsdc_dvo_atomic_modeset(struct drm_encoder *encoder,
>> +                                   struct drm_crtc_state *crtc_state,
>> +                                   struct drm_connector_state *conn_state)
>> +{
>> +}
> You do not need these empty callbacks, do you?


Thanks a lot for the sharpen eyes.

Yes. I do not need these empty callbacks.
I have some program experience with Linux-4.19 kernel.
I clearly remember that these empty callbacks was need when I add lt8619 display bridge driver.
I have just remove it and tested, it seems that those is not need anymore.

Thanks a lot for review, this problem will be fixed at the next version.




