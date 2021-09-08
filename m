Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E02B404075
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 23:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03736E301;
	Wed,  8 Sep 2021 21:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3436E301
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 21:14:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210908211424euoutp0157a7ac36f95c7a5738d963a6e2c0c182~i9T65kXqs2235622356euoutp01e
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 21:14:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210908211424euoutp0157a7ac36f95c7a5738d963a6e2c0c182~i9T65kXqs2235622356euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631135664;
 bh=aNswn0aopGfCI3dH+hLJ84xtfysKB05ZTsag3OGVnbc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=eSXkxiM/kJFq3W/lBJ1bebNvDDDTKvFvQGcj7wbB81kpIXP6aooP1+Ob3/tXEiIyr
 O+Ok63vddFpWWgWgQxGl7/7iblefu5afMFm4aTrRfdyH3wXTeWhDv6+jwMFEZZK4R7
 sKCLUE14R5AKl49BOxTpLKmlpSMCqmxJ7Le5+FZ0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210908211423eucas1p2efb55300751c2258ed3d5a413b10c1ee~i9T6B3Nq52060320603eucas1p2T;
 Wed,  8 Sep 2021 21:14:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 63.87.56448.FA729316; Wed,  8
 Sep 2021 22:14:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210908211423eucas1p1e9e3320b77d3e0a3ca6807b6420ea069~i9T5T8d1g1260512605eucas1p1r;
 Wed,  8 Sep 2021 21:14:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210908211423eusmtrp1991105dd8e8cae1c0a018cc1f615b5e1~i9T5TJWFk0829908299eusmtrp1a;
 Wed,  8 Sep 2021 21:14:23 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-12-613927af7a2b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 38.64.31287.EA729316; Wed,  8
 Sep 2021 22:14:23 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210908211422eusmtip1ea537a765df6fff130a96def688b75df~i9T4yzZLA0993509935eusmtip1k;
 Wed,  8 Sep 2021 21:14:22 +0000 (GMT)
Message-ID: <6700c90f-d0e0-5cbf-1616-0c1d158441b1@samsung.com>
Date: Wed, 8 Sep 2021 23:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0)
 Gecko/20100101 Thunderbird/92.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Check link status register
 after enabling the bridge
Content-Language: en-GB
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Marek Vasut
 <marex@denx.de>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, Jagan Teki
 <jagan@amarulasolutions.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Linus Walleij
 <linus.walleij@linaro.org>, Robert Foss <robert.foss@linaro.org>, Sam
 Ravnborg <sam@ravnborg.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <CAPY8ntBVdvHSofXcd7nU5Z4uCMUzmiMF3GmJn=VpLDVoe6xL2g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUwTURT1zUynU5KpY0G4oolp44JbwUDsuGOCsT+uH2pIDFQYqUoLaQFF
 Y1DQWqsCVgEpgqKyGZEKFLWCCwERccEEkLq0mriCqChowKVSBiN/551zzzvnvjwKl5QL/Kmt
 2gROp1XFykgvoubOwKM5FdPnq4KsubPZnvxzBNvW/5lk+yozSfbQsfNC9sSvEoz9aNiH2K+W
 VzhbOmBDoZSyvNclUBZY7hLKPGOuQPm8o5ZUug43YcoDjYOE8nx2O7lGGO61KJqL3ZrE6QKX
 RHqpTfdSsfgj2p3G9+3YXuTcaEIiCpgQsH63EybkRUmYUgTXX2SR/KEPwbWMZsQfviHIOliJ
 /lkuvboq4IUSBLn3W3CPIGE+I2gw7fFgmlkCOemZQg8mmCnw40URxvPjoDn3NeHB45lIeFfU
 P8x7MxwYittID8YZP0jtKxsKoCgfZh18qaU8WThzFIPH+cXDWSQzA35XOYbnRcxasGfcF/Le
 yZBmy8M9BmD6KDCUOYV86zBou1iO8dgbupqqR/hJ0HL8CMHjFHCV7h8xGxHYrNdwXlgIzx8O
 kp5G+FByhT2Qp5dBp/v6cFFgxNDZM47vIAZzTQ7O0zQYDRJ+WgquB7aRC/2gqLWfzEQyy6hX
 sYza3jJqG8v/3DOIuID8uES9JobTB2u5HXK9SqNP1MbIo+I0lWjoR7X8aeq/ikq7euX1CKNQ
 PQIKl/nQvxXzVBI6WpW8i9PFRegSYzl9PZpIETI/2m67GCFhYlQJ3HaOi+d0/1SMEvnvxSqO
 Sh1Baaa4T+65Cas2FbCFMyPT9NWtDe4NA51hhslS85OoDt8s6e0Fmh0Tuh2N4++uMV+m5szY
 3Bqev7jXvDK78VD7sUC6xuYOCDl4gH56prag7lxsMbrZNUiEJ42ZJipWrFCLqj6efhngdIau
 WJ0z+M1/bWT6l21v0van+DZWZCgybwc1aXbnnXCcTY4Sf9BMW18o6HKlLA2KMBeEhCFrqDtp
 t1PZurysjvaP3nLqZfrb1HlT0bqewstcuPeUG+pg4y71k+5JhpIyqbj5ZHfVp4z4C4GOn5Rc
 nj3W51lNXrZdoejYWb0lOT+9N4fcELcweEBMz7ryuPCW9evhAO86GaFXq+bOxHV61V+WNSTP
 wAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xu7rr1S0TDa6GWLydu5jF4srX92wW
 XzZNYLPonLiE3WLKn+VMFm/aGhktPs16yGyx4udWRgcOj7Uf77N6zJt1gsVjdsdMVo871/aw
 edzvPs7k0Xr0F4vHkmlX2QLYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV
 9O1sUlJzMstSi/TtEvQyuk41MRX05FV0vLjK1MB4L6KLkZNDQsBEYt3DHaxdjFwcQgJLGSXm
 /H3NDpEQl9g9/y0zhC0s8edaFxuILSTwllHi2hQxEJtXwE5iet8EsHoWARWJ73eXMkHEBSVO
 znzCAmKLCiRI7D7cBVYjLJAq0bbsCtgcZqD5TV9WAi3m4BARCJLYPcsR5AZmgV4micUtnYwQ
 B81iltiyai0rSAObgKbE3803wZo5BQIldvWfYYcYZCbRtbWLEcKWl2jeOpt5AqPQLCR3zEKy
 bxaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjMltx35u3sE479VHvUOMTByM
 hxglOJiVRHj/mpslCvGmJFZWpRblxxeV5qQWH2I0BQbGRGYp0eR8YFLIK4k3NDMwNTQxszQw
 tTQzVhLn3Tp3TbyQQHpiSWp2ampBahFMHxMHp1QDU6fqrumRfT5hZWGPE29fn3u+bnPp1HU/
 NtjaaspuM+m7lnIxNO123Io5M79Out7RqiL11EpZrmFOyaz8K5sv+tWbro3VP178I6371N0l
 enr5Cp9WT7nwdZmfVPon/6J9YsFlGznCky+r2xdKznJga7mTryQSrK93hK3q9rkewwmmk+83
 B1VICHtK79XkuKPD/P9bYdPDkHVLP97T+LeWd/rUWw7tUcJLWx7p+8osyt9fGPfwLvNyxvyq
 6mMRySe+yv88PGn/rOuKFx1XNaz9YDltKafM5BSbE8KrVquZirE9CTjnEzqrZ/0h++3dZit2
 eMlfb1AVKT7Cu6Kom4f9Qey5PsbHk2T2RiutN49dpcRSnJFoqMVcVJwIAMYLXP9SAwAA
X-CMS-MailID: 20210908211423eucas1p1e9e3320b77d3e0a3ca6807b6420ea069
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210907073151eucas1p196543fbd114f34f6de700013fd0e4168
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210907073151eucas1p196543fbd114f34f6de700013fd0e4168
References: <20210907023948.871281-1-marex@denx.de>
 <CGME20210907073151eucas1p196543fbd114f34f6de700013fd0e4168@eucas1p1.samsung.com>
 <2f530ec2-3781-67eb-6f34-c7b6a29641ea@samsung.com>
 <6544aaba-a3e3-f3f6-32d9-5c396df52601@denx.de>
 <9b3d6595-0330-f716-b443-95f3f4783ac4@samsung.com>
 <2bf8e1fe-3f55-85ab-715a-c53ad98bb6d2@denx.de>
 <CAPY8ntBVdvHSofXcd7nU5Z4uCMUzmiMF3GmJn=VpLDVoe6xL2g@mail.gmail.com>
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


W dniu 08.09.2021 o 13:11, Dave Stevenson pisze:
> Hi Marek and Andrzej
>
> On Tue, 7 Sept 2021 at 22:24, Marek Vasut <marex@denx.de> wrote:
>> On 9/7/21 7:29 PM, Andrzej Hajda wrote:
>>> W dniu 07.09.2021 o 16:25, Marek Vasut pisze:
>>>> On 9/7/21 9:31 AM, Andrzej Hajda wrote:
>>>>> On 07.09.2021 04:39, Marek Vasut wrote:
>>>>>> In rare cases, the bridge may not start up correctly, which usually
>>>>>> leads to no display output. In case this happens, warn about it in
>>>>>> the kernel log.
>>>>>>
>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>>>>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>>>> Cc: Robert Foss <robert.foss@linaro.org>
>>>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>> ---
>>>>>> NOTE: See the following:
>>>>>> https://e2e.ti.com/support/interface-group/interface/f/interface-forum/942005/sn65dsi83-dsi83-lvds-bridge---sporadic-behavior---no-video
>>>>>>
>>>>>> https://community.nxp.com/t5/i-MX-Processors/i-MX8M-MIPI-DSI-Interface-LVDS-Bridge-Initialization/td-p/1156533
>>>>>>
>>>>>> ---
>>>>>>      drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
>>>>>>      1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>>>> b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>>>> index a32f70bc68ea4..4ea71d7f0bfbc 100644
>>>>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>>>> @@ -520,6 +520,11 @@ static void sn65dsi83_atomic_enable(struct
>>>>>> drm_bridge *bridge,
>>>>>>          /* Clear all errors that got asserted during initialization. */
>>>>>>          regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>>>>>>          regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
>>>>>
>>>>> It does not look as correct error handling, maybe it would be good to
>>>>> analyze and optionally report 'unexpected' errors here as well.
>>>> The above is correct -- it clears the status register because the
>>>> setup might've set random bits in that register. Then we wait a bit,
>>>> let the link run, and read them again to get the real link status in
>>>> this new piece of code below, hence the usleep_range there. And then
>>>> if the link indicates a problem, we know it is a problem.
>>>
>>> Usually such registers are cleared on very beginning of the
>>> initialization, and tested (via irq handler, or via reading), during
>>> initalization, if initialization phase goes well. If it is not the case
>>> forgive me.
>> The init just flips the bit at random in the IRQ_STAT register, so no,
>> that's not really viable here. That's why we clear them at the end, and
>> then wait a bit, and then check whether something new appeared in them.
>>
>> If not, all is great.
>>
>> Sure, we could generate an IRQ, but then IRQ line is not always
>> connected to this chip on all hardware I have available. So this gives
>> the user at least some indication that something is wrong with their HW.
>>
>>>>>> +
>>>>>> +    usleep_range(10000, 12000);
>>>>>> +    regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>>>>>> +    if (pval)
>>>>>> +        dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
>>>>>
>>>>> I am not sure what is the case here but it looks like 'we do not know
>>>>> what is going on, so let's add some diagnostic messages to gather info
>>>>> and figure it out later'.
>>>> That's pretty much the case, see the two links above in the NOTE
>>>> section. If something goes wrong, we print the value for the user
>>>> (usually developer) so they can fix their problems. We cannot do much
>>>> better in the attach callback.
>>>>
>>>> The issue I ran into (and where this would be helpful information to
>>>> me during debugging, since the issue happened real seldom, see also
>>>> the NOTE links above) is that the DSI controller driver started
>>>> streaming video on the data lanes before the DSI83 had a chance to
>>>> initialize. This worked most of the time, except for a few exceptions
>>>> here and there, where the video didn't start. This does set link
>>>> status bits consistently. In the meantime, I fixed the controller
>>>> driver (so far downstream, due to ongoing discussion).
>>>
>>> Maybe drm_connector_set_link_status_property(conn,
>>> DRM_MODE_LINK_STATUS_BAD) would be usefule here.
>> Hmm, this works on connector, the dsi83 is a bridge and it can be stuck
>> between two other bridges. That doesn't seem like the right tool, no ?
>>
>>>>> Whole driver lacks IRQ handler which IMO could perform better diagnosis,
>>>>> and I guess it could also help in recovery, but this is just my guess.
>>>>> So if this patch is enough for now you can add:
>>>> No, IRQ won't help you here, because by the time you get the IRQ, the
>>>> DSI host already started streaming video on data lanes and you won't
>>>> be able to correctly reinit the DSI83 unless you communicate to the
>>>> DSI host that it should switch the data lanes back to LP11.
>>>>
>>>> And for that, there is a bigger chunk missing really. What needs to be
>>>> added is a way for the DSI bridge / panel to communicate its needs to
>>>> the DSI host -- things like "I need DSI clock lane frequency f MHz, I
>>>> need clock lane in HS mode and data lanes in LP11 mode". If you look
>>>> at the way DSI hosts and bridges/panels work out the DSI link
>>>> parameters, you will notice they basically do it each on their own,
>>>> there is no such API or communication channel.
>>>
>>> There is one-time communication channel via mipi_dsi_attach, it allows
>>> to set max frequency i HS and LP, choose mode of operation (HS/LPM) and
>>> few more things. If it is necessary to extend it please propse sth.
>> Well, take for example the drivers/gpu/drm/exynos/exynos_drm_dsi.c ,
>> there is this:
>>
>> static void exynos_dsi_enable(struct drm_encoder *encoder)
>> ...
>>                   list_for_each_entry_reverse(iter, &dsi->bridge_chain,
>>                                               chain_node) {
>>                           if (iter->funcs->pre_enable)
>>                                   iter->funcs->pre_enable(iter);
>> ...
>>           exynos_dsi_set_display_mode(dsi);
>>           exynos_dsi_set_display_enable(dsi, true);
>> ...
>>                   list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
>>                           if (iter->funcs->enable)
>>                                   iter->funcs->enable(iter);
>>                   }
>> ...
>>
>> So the bridge enable callback is called with clock lane already in HS
>> mode, and data lanes streaming video. This doesn't work with the DSI83,
>> which would need clock lane in HS and providing clock , but data lanes
>> in LP11 with no video.
>>
>> Sure, I could probably move exynos_dsi_set_display_enable(dsi, true);
>> after the enable call, but is that really the right solution ? What
>> about bridges which need some other specific configuration of the data
>> lanes during init ?
> I hadn't noticed that Exynos was doing that.
> vc4 DSI is doing the same thing in deliberately breaking the
> panel/bridge chain so that it gets a chance to do some initialisation
> before panel/bridge pre_enable.

Initially ExynosDSI was written with panel support only, in such case 
developer can explicitly control time of calling panel ops - and that 
was good.

Later, adding bridge support showed that bridge chain has fixed call 
order which is incompatible with Exynos, so the driver needs to calls 
bridge ops explicitly - flexibility was scarified for simplicity.

For me, fixed order of calls in the whole chain 
(crtc->encoder->bridges...->panel) seems incorrect. Crtc starts 
transmission but the encoder is not yet ready, the same with encoder and 
bridges, later is slightly better - bridges have two ops (pre_enable, 
enable) but since they are not well defined developers are confused what 
should be performed where, as a result we have incompatible approaches.

Only panels have well defined opses: .prepare is for getting panel ready 
for video transmission, .enable is called after starting transmission to 
start showing the image (backlight-on or MIPI_DCS_SET_DISPLAY_ON).

Apparently this model somehow works, probably due to nice hardware and 
custom hacks, but as we see more complicated protocols like DSI or more 
delicate devices cannot be handled with such callbacks.

In case of Exynos DSI and s6e8aa0 panel we need to implement complicated 
sequence, which I have implemented this way:

1. Power on DSI host, start clocks, enable DSI PHY: 
pm_runtime_resume_and_get->exynos_dsi_resume.

2. Power on DSI device: 
drm_panel_prepare->s6e8aa0_prepare->s6e8aa0_power_on.

3. Initialize DSI host: 
drm_panel_prepare->s6e8aa0_prepare->s6e8aa0_set_sequence->...mipi_dsi_device_transfer->...->exynos_dsi_init.

4. Initialize DSI device: 
drm_panel_prepare->s6e8aa0_prepare->s6e8aa0_set_sequence (bulk of MIPI 
DCS/MCS commands).

5. Configure and start video stream on host: 
exynos_dsi_set_display_mode, exynos_dsi_set_display_enable.

6. Show the image: drm_panel_enable


I guess LP-11 state is after DSI host init (3).


>
> Another issue I've noted in doing this is that it breaks calls to the
> bridge's mode_set, mode_valid, and mode_fixup hooks. The framework
> doesn't know about the bridges/panels beyond the encoder, and the
> encoder doesn't get all the information required in order to replicate
> those calls.
If you put such calls into dsi host it will work, this is minus of the 
flexibility - you must do on your own.
> I'm about to look into whether switching the DSI host to being a
> bridge instead of an encoder allows me to overcome that one.
> Doing so doesn't solve the issue of the DSI host bridge pre_enable
> being called after the panel/bridge pre_enable though.


The latter is rather blocking issue, maybe you can overcome it by adding 
mipi_host callbacks: power_on, init - this way you can call them from 
device's pre_enable

This would solve the issues described later.

It seems little bit hacky, but quite easy to implement, what do you think.


Regards

Andrzej


>>> Regarding requesting LP11 I am not sure if we really should have such
>>> low level communication. LP11, as I remember ,is initial state in HS so
>>> it should be set anyway, before starting video transmission.
> LP-11 is the idle LP state. Both P and N lines of the pair are at
> LP-high (~1.2V).
> You then have an escape sequence to shift to HS mode (LP-01 for
> T(lpx), LP-00 for T(hs-prepare), enable HS driver) when you are
> wishing to send data bursts. The signalling levels for HS drop to
> ~100mV for low and ~300mV for high.
>
> Add in ULPS which is effectively powered off but has a specific entry
> and escape sequence to sleep/wake up the receiving device. ULPS seems
> to be totally ignored in DRM as it seems to rely on regulator or other
> control of the panel/bridge to power down.


Nodoby tried to implement it yet, if you want patches are welcome.


>
>> Well, see above, that's the problem I ran across recently.
>>
>>> And maybe this is the main problem:
>>>
>>> DRM core calls:
>>>
>>> crtc->enable
>>>
>>> bridges->pre_enable,
>>>
>>> encoder->enable,
>>>
>>> bridges->enable.
>>>
>>>
>>> Usually video transmission starts in crtc->enable (CRTC->Encoder), and
>>> in encoder->enable (encoder->bridge), so in bridges->enable it would be
>>> too late for LP11 state - transmission can be already in progress.
>>>
>>> It shows well that this order of calls does not fit well to DSI, and
>>> probably many other protocols.
>>>
>>> Maybe moving most of the bridge->enable code to bridge->pre_enable would
>>> help, but I am not sur if it will not pose another issues.
>> Yep, that won't work e.g. with the exynos DSIM, because
>> exynos_dsi_set_display_mode() sets the data lanes to LP11.
> Isn't the bigger question for SN65DSI8[3|4|5] whether the clock lane
> is running or not in pre_enable?
>
>>> This is quick analysis, so please fix me if I am wrong.
>> I pretty much agree that the current state of things does not fit with
>> DSI too well.
> That was why I was questioning how DSI was meant to be implemented in
> https://protect2.fireeye.com/v1/url?k=8518e60b-da83df6e-85196d44-000babff32e3-efd6ff7a2d2163dc&q=1&e=0ab51aa1-fbca-44d3-b10d-56f32a581aa5&u=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2FCAPY8ntBUKRkSam59Y%2B72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ%40mail.gmail.com%2F
>
> The need to have the DSI host in a defined idle state (often LP-11,
> but varying whether the clock lane is in HS) before powering up the
> panel/bridge is incredibly common, but currently undefined in DRM.
>
> Taking the SN65DSI83 as an example, the datasheet [1] section 7.4.2
> states that the clock lane must be in HS mode, and data lanes in LP-11
> when coming out of reset. That means that we can't be "enable" as that
> will have the data lanes in HS mode and sending video, and as we can't
> be in "pre_enable" as the DSI PHY will be powered down and so we won't
> have the clock lanes in HS mode.
>
> I've hit a similar one with the Toshiba TC358762 where it seems to get
> upset if it is receiving video data when it gets configured.
> panel-raspberrypi-touchscreen[2] which drives that chip is
> intermittent when using panel enable, whereas panel prepare is
> significantly more reliable but relies on the DSI host being
> initialised to LP-11 by breaking the chain.
>
>    Dave
>
> [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
> [2] https://protect2.fireeye.com/v1/url?k=2f04bd31-709f8454-2f05367e-000babff32e3-b90973c6593e81b3&q=1&e=0ab51aa1-fbca-44d3-b10d-56f32a581aa5&u=https%3A%2F%2Fgithub.com%2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Fdrivers%2Fgpu%2Fdrm%2Fpanel%2Fpanel-raspberrypi-touchscreen.c
>
