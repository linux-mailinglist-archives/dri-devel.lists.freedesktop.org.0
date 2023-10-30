Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 222B47DB273
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 05:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CDB10E1FD;
	Mon, 30 Oct 2023 04:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9687110E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 04:13:36 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxXettLT9lQqs1AA--.34413S3;
 Mon, 30 Oct 2023 12:13:33 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxO9xrLT9l5M02AA--.51747S3; 
 Mon, 30 Oct 2023 12:13:33 +0800 (CST)
Message-ID: <ea335f64-16cc-47aa-b523-0aae6f64e223@loongson.cn>
Date: Mon, 30 Oct 2023 12:13:34 +0800
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
X-CM-TRANSID: AQAAf8CxO9xrLT9l5M02AA--.51747S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXw1kCw17CFykCF43Zw4rCrX_yoWrGF4UpF
 Wrta9xKr4DJFn0gry8Zr48Z34xKrZ5tFs5twsYkFy3C34Yyryfta1jqr45CFykAFsYqrWI
 yF4qqF1kuFn0yrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
 jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
 x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
 8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
 0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcyxRUUUUU
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
>> +/* Built-in HDMI encoder funcs on display pipe 0 */
>> +
>> +static void lsdc_pipe0_hdmi_encoder_reset(struct drm_encoder *encoder)
>> +{
>> +       struct drm_device *ddev = encoder->dev;
>> +       struct lsdc_device *ldev = to_lsdc(ddev);
>> +       u32 val;
>> +
>> +       val = PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN;
>> +       lsdc_wreg32(ldev, LSDC_CRTC0_DVO_CONF_REG, val);
>> +
>> +       /* Using built-in GPIO emulated I2C instead of the hardware I2C */
>> +       lsdc_ureg32_clr(ldev, LSDC_HDMI0_INTF_CTRL_REG, HW_I2C_EN);
>> +
>> +       /* Help the HDMI phy get out of reset state */
>> +       lsdc_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, HDMI_PHY_RESET_N);
>> +
>> +       drm_dbg(ddev, "%s reset\n", encoder->name);
>> +
>> +       mdelay(20);
>> +}
>> +
>> +const struct drm_encoder_funcs lsdc_pipe0_hdmi_encoder_funcs = {
>> +       .reset = lsdc_pipe0_hdmi_encoder_reset,
>> +       .destroy = drm_encoder_cleanup,
>> +};
>> +
>> +/* Built-in HDMI encoder funcs on display pipe 1 */
> All pipe 1 code looks like a pipe0, just the registers were changed.
> Could you please refactor that to use a single instance of all
> functions and pass pipe id through the data struct?
> Then you can use macros to determine whether to use pipe 0 or pipe 1 register.
>

Yes, you are right. But please allow me to explain something.

In the past, Thomas told me to untangle it, despite this idea lead to duplicated code(or pattern).
but at the long run, this pay off.

Because the method of passing pipe id will introduce the "if and else" side effects.
But my functions have no if and else.


```
if (pipe == 0) {
     ...
} else if (pipe == 1) {
     ...
}
```

Using the C program language's Macro(#define XXX) to generate code is not fun to me.
Because every time you want to change it, It needs my brains to thinking it twice. Maybe
more than twice.

1) It needs my brains to replace the macros manually each time I saw the code.

2) When I want to change(alter) the prototype, I need to worry about all of the instances.
    sometimes it is not symmetry. The DVO port and HDMI phy itself is symmetry, but the
    external display bridge connected with them are not symmetry. So, there are some registers
    located at the domain of this display controller side should change according to the
    different type of external display bridge.

3) Code duplication is actually less harmful than unmaintainable.
    macros are abstract, as noob level programmer, we completely drop the idea of abstract.
    Bad abstract means design failure, this is what we are most afraid of.
    Generally, we would like divide the whole into small cases, handle them one by one.
    It is actually to review and understand.

4) From the viewpoint of the hardware, the display output hardware suffer from changes.
    Because users always want *new* display interface. The need of the users are also varies.
    Personally, I think macros are best for the symmetry case, while the output part of a
    display pipe always suffer from change.

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

