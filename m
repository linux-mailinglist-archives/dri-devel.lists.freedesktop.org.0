Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63592A1C0E9
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 05:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CED510E162;
	Sat, 25 Jan 2025 04:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="KEMjxQrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973184.qiye.163.com (mail-m1973184.qiye.163.com
 [220.197.31.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F0F10E162
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 04:18:19 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 9a494985;
 Sat, 25 Jan 2025 12:18:10 +0800 (GMT+08:00)
Message-ID: <7ef0454b-fddd-44c0-be4a-c81c443f08f6@rock-chips.com>
Date: Sat, 25 Jan 2025 12:18:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/14] drm/edp-panel: Add LG Display panel model
 LP079QX1-SP0V
To: Doug Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-13-damon.ding@rock-chips.com>
 <rwn3g7tqgjnc525cjqtivgfgedhooiayn5nujng7bdzazgqhle@wfpuvoyr2tii>
 <CAD=FV=WKsA9fcq-LzGcYmgbMuMLUp5SMggpzBzZnvd3sxGf9BQ@mail.gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <CAD=FV=WKsA9fcq-LzGcYmgbMuMLUp5SMggpzBzZnvd3sxGf9BQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk9DH1YfHUxJT09CSU9CHU5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a949bae7a1d03a3kunm9a494985
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kyo6DTo*HjIWNBktLzE3F0sp
 CzEwCzpVSlVKTEhMTExDTUJJSE5JVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPSU9KNwY+
DKIM-Signature: a=rsa-sha256;
 b=KEMjxQrOrfEtKZzt6CYphQDs7eNUjjH8m8AWiodw6j70gQcFojna9y5+Fy0sONQ3/SEZtPD1VMuZKpejaV6BtqPVrmfQHyB2/HvVOpkGv/QGCiiQSO44oAVs8y3NeqvAXjLYhldpjhTostWKSR+CS4rVq2br+QqVb20XwbhKWRs=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=LT1lOhEhh2VSdBgeTO1/jteMwTIRumP4Sm+3/Zt7qdA=;
 h=date:mime-version:subject:message-id:from;
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

Hi Doug,

On 2025/1/24 8:30, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jan 23, 2025 at 3:31 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Thu, Jan 23, 2025 at 06:07:45PM +0800, Damon Ding wrote:
>>> The raw edid for LP079QX1-SP0V panel model is:
>>>
>>> 00 ff ff ff ff ff ff 00 16 83 00 00 00 00 00 00
>>> 04 17 01 00 a5 10 0c 78 06 ef 05 a3 54 4c 99 26
>>> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
>>> 01 01 01 01 01 01 ea 4e 00 4c 60 00 14 80 0c 10
>>> 84 00 78 a0 00 00 00 18 00 00 00 10 00 00 00 00
>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 4c
>>> 50 30 37 39 51 58 31 2d 53 50 30 56 00 00 00 fc
>>> 00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 3f
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> ---
>>>   drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>
>> Please use get_maintainers.pl when compiling To/Cc lists. Added Douglas
>> to CC manually.
>>
>> Or, better, split irrelevant patches to separate series.
>>
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>>> index f8511fe5fb0d..77e3fd3ed160 100644
>>> --- a/drivers/gpu/drm/panel/panel-edp.c
>>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>>> @@ -1808,6 +1808,12 @@ static const struct panel_delay delay_200_150_e50 = {
>>>        .enable = 50,
>>>   };
>>>
>>> +static const struct panel_delay delay_50_500_e200 = {
>>> +     .hpd_absent = 50,
>>> +     .unprepare = 500,
>>> +     .enable = 200,
>>> +};
> 
> Wow, hpd_absent is 50ms. That's excellent!
> 
> I was curious if this was really correct since it's the lowest I've
> seen, but I searched the internet and found a datasheet that confirms
> it. Crazy. Although my datasheet has that whole section grayed out and
> says "Measurement not available". How worried should be about that? I
> guess if "hpd_absent" of 50 eventually doesn't work it can always be
> increased.
> 

The datasheet I have should be the same as yours, and the T3 is "Min. 
2ms | Typ. 30ms | Max. 50ms" with the gray "Measurement not available".

> Looking at that datasheet (assuming you can find the same one), I
> wonder how you handle the T4 120ms requirement. It looks like that's
> the time from tcon reset (which is nearly power on) until you're
> allowed to put valid data on the panel. I _think_ you could meet the
> requirement via setting `powered_on_to_enable` to 320 though, right?
> ...or maybe 335 to handle the maximum value of "tcon_reset" (no idea
> how you control this signal). If I remember correctly (it's been a
> while), things will already be clocking but outputting black when the
> panel's "enable" function is called. After the function is called then
> we'll turn on the backlight (and still outputting black) and
> eventually we'll put valid data. So as long as you consider the
> continued output of black as "valid data" then the timing diagram is
> satisfied.
> 

Yes, it is indeed better to set the "powered_on_to_enable" to 335ms, as 
this will help prevent the display from showing invalid black screens. I 
will add it in the next version.

> BTW: don't you also need a 200 ms "disable"?
> 

According to the datasheet, it is a good idea to set "disable" to 200ms.

> 
>>>   #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
>>>   { \
>>>        .ident = { \
>>> @@ -1955,6 +1961,8 @@ static const struct edp_panel_entry edp_panels[] = {
>>>        EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
>>>        EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
>>>
>>> +     EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200, "LP079QX1-SP0V"),
> 
> I don't love that the ID is 0x0000. That makes me nervous that the
> panel vendor isn't setting the ID properly. ...but at least the string
> matches in the EDID so hopefully that will be enough to uniquely
> identify things.
> 
> 

The ID "0x0000" makes me nervous too, but the EDID obtained from this 
panel indeed show it, which is quite surprising. May I still set it to 
"0x0000" as it really is?

Best regards,
Damon

