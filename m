Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06109A4AA14
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 10:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058CC10E07A;
	Sat,  1 Mar 2025 09:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBC810E07A
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 09:54:54 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Z4gLV3xfGz2CprZ;
 Sat,  1 Mar 2025 17:50:42 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 0ED81180044;
 Sat,  1 Mar 2025 17:54:50 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 1 Mar 2025 17:54:48 +0800
Message-ID: <c87613aa-1d17-4a88-acce-269ea9eddc22@huawei.com>
Date: Sat, 1 Mar 2025 17:54:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 drm-dp 7/8] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <reqpxlbvlz5qssgy6gbjuou33h4zevo4xeztqbsr4keehplyhx@utv22a5ihohx>
 <eef68fc7-30f4-4246-a82e-4f90cd6a665d@huawei.com>
 <6jx5ldpidy2ycrqognfiv5ttqr5ia4dtbryta3kc2mkndrvvgo@qzuakucz765k>
 <6634386b-afc1-4e31-a2f4-9c1afed2d1d8@huawei.com>
 <CAA8EJpqHmhUxLE57XNeh-nVtSP7WvtBE=FiFWk9kqM_P+AC=0A@mail.gmail.com>
 <5af62fa9-e71b-412f-8640-502f03fcaa52@huawei.com>
 <vrsy4hao4qu3hlcbmjyfyibeearhhjgtik3e6o3v2eyzkatdve@kdb7cyvl45tu>
 <ade54ddd-79ea-4335-9058-c17e4525e83f@huawei.com>
 <4hicem4rbz5l7wnzaaz3krrl3euh2dmvlah2rb7errrdq5fann@44dvdxirkuzh>
 <6506e448-3851-436f-9354-42f9ef844d27@huawei.com>
 <njnz5hxumrvqrgsfq7zlunle3jgfan3be34ao5xtkmzczpi6af@waywds2ww6qw>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <njnz5hxumrvqrgsfq7zlunle3jgfan3be34ao5xtkmzczpi6af@waywds2ww6qw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500013.china.huawei.com (7.221.188.12)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On Sat, Mar 01, 2025 at 04:45:40PM +0800, Yongbang Shi wrote:
>>> On Thu, Feb 27, 2025 at 09:46:10PM +0800, Yongbang Shi wrote:
>>>>> On Tue, Feb 25, 2025 at 09:57:17PM +0800, Yongbang Shi wrote:
>>>>>>> On Mon, 24 Feb 2025 at 16:03, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>>>>> On Sat, Feb 22, 2025 at 06:35:48PM +0800, Yongbang Shi wrote:
>>>>>>>>>>>> +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +  struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
>>>>>>>>>>>> +  struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
>>>>>>>>>>>> +  struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
>>>>>>>>>>>> +  int ret;
>>>>>>>>>>>> +
>>>>>>>>>>>> +  if (dp->hpd_status) {
>>>>>>>>>>>> +          hibmc_dp_hpd_cfg(&priv->dp);
>>>>>>>>>>>> +          ret = hibmc_dp_prepare(dp, mode);
>>>>>>>>>>>> +          if (ret)
>>>>>>>>>>>> +                  return ret;
>>>>>>>>>>>> +
>>>>>>>>>>>> +          hibmc_dp_display_en(dp, true);
>>>>>>>>>>>> +  } else {
>>>>>>>>>>>> +          hibmc_dp_display_en(dp, false);
>>>>>>>>>>>> +          hibmc_dp_reset_link(&priv->dp);
>>>>>>>>>>>> +  }
>>>>>>>>>>> If I understand this correctly, you are using a separate drm_client to
>>>>>>>>>>> enable and disable the link & display. Why is it necessary? Existing
>>>>>>>>>>> drm_clients and userspace compositors use drm framework, they should be
>>>>>>>>>>> able to turn the display on and off as required.
>>>>>>>>>>>
>>>>>>>>>> Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
>>>>>>>>>> We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
>>>>>>>>>> the different video modes into DP registers.
>>>>>>>>> Why? The link training and mode programming should happen during
>>>>>>>>> pre_enable / enable stage (legacy or atomic).
>>>>>>>> Hi Dmitry,
>>>>>>>>
>>>>>>>> Right, that's what I'm curious about. It won't call encoder enble/disable functions when I triggered HPD.
>>>>>>>> And I'm sure the drm_connector_helper_hpd_irq_event() is called. So I add a drm_client for it.I
>>>>>>> It should be userspace, who triggers the enable/disable (or it should
>>>>>>> be the in-kernel fbdev / fbcon, which interface through the generic
>>>>>>> drm_fbdev client).
>>>>>> Right, I knew it. When I insmode my driver firstly (or restart display service), it will call disable, modeset and enable,
>>>>>> by user, but it won't call when HPD triggered .
>>>>> - Is HPD even properly delivered to userspace? What kind of compsitor
>>>>>      are you using? Is .detect working properly and reporting a correct
>>>>>      plug-in state?
>>>> Thanks for your answering. I'm not very good understanding about userspace in framework. In my opinion, when I call
>>>> this drm_connector_helper_hpd_irq_event(), the HPD will deliver to userspace.
>>>> I use Xorg, and the display service is GDM.
>>>> The .detect is called and the getting modes info is correct.
>>>> I find that it would only trigger(disable, modeset and enable), when I changed resolutions, restart display service and insmod driver.
>>> You can go to the display settings in GDM. It would be interesting to
>>> observe if it notes the second monitor or not. Last, but not least, you
>>> can use a simple tool like 'xrandr' under your XOrg session to set the
>>> display resolution.
>> Thank you for your advice!
>> Right, there are DP and VGA two monitors. I tried to totally remove the vga connector in driver, the problem is gone.
>> So do I need to clear the vga connector, if dp is plugged in?
> Unless your hardware can not manage two outputs at the same time, no,
> you don't have to. Just check how it behaves on x86 systems. Ideally
> your driver should have the same behaviour.

Our hardware cannot support two outputs with different timing, so I used the one crtc and one plane that DP and VGA share. And just add a new DP connector
with a encoder, just like the previous VGA's code logic. But the HPD problem makes me feel confused, should I change the framwork structure to slove this problem?

And also, I will check whether this driver works good on the x86 server. Right now, I'm testing on arm64 server.

>> And also, I used xrandr to set modes after 'startx'. Changing resolutions works,
>> but there are errs when set some low resolutions.
> That's a separate topic, most likely related to timing or to some other
> issues. You can fix that separately (but please do, switching modes
> should work).

Okay!


