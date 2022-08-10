Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332F658F392
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 22:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46ABF1133AE;
	Wed, 10 Aug 2022 20:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C8211B037
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 20:34:18 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.248.80]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MIdW9-1o7rlQ1flt-00EaiJ; Wed, 10 Aug 2022 22:33:49 +0200
Message-ID: <abc70ec9-cf6a-3057-0d80-65a3cb81ea2b@i2se.com>
Date: Wed, 10 Aug 2022 22:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 23/33] drm/vc4: hdmi: Move HDMI reset to pm_resume
Content-Language: en-US
To: Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard
 <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20220613144800.326124-1-maxime@cerno.tech>
 <20220613144800.326124-24-maxime@cerno.tech>
 <ebd018b6-456e-fb22-b075-4da87f50b20b@gmail.com>
 <c82f57ba-0b60-10a0-d254-da91a32a923d@gmail.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <c82f57ba-0b60-10a0-d254-da91a32a923d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:UnJtrBhYA7Nifo6L9t2KtKlHaEdfl387SdRJfUJB0FYxaMwL+j+
 EJfsH4Nlibmdvf/WL39w3OFoab2MlbJeGNYkrMCneBw0wmCLk3MmGeekrBaaw73IFH0lhn5
 Y9JSoNwF9iubQ9uDXcRpWVNlCs7YZ6GgYJwaL6A5+sfP2DjtfJctaSjhkT52NAm0NAWAse7
 +D4x29HKwvx6qZhJF2ivQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Yfe98z4Z9C4=:johMK2DBPLDlgEraPgMhQ6
 UPia6qvNCuu6xDs7kkiHmWjHsffWjtWGE91HwxeLcyhtj9T1SvckFGiS0giTGLzaJR5YmT8S/
 NmNE3Rlq73AFJI5WseI9jzWX8jZgFdZb3vb6Ke0DDcvepDE7wayt0YaOvEZGiEw7ifLgC+b3X
 9hms0/ymbyXBnPMFj+FhThFJsYSBlBw6gEjaRkPgYCa5fCOXPaWz6ewCLDl8FLuf9eUMaIWZh
 UJGezz1HXp9UnXS8H+KUqtYsPve6TzsfNoLV+lBHrle1KghYjehmVBI5+BvuP7JrttZmXQJw1
 s8YLE6aqXNhRX7MzVO57DqXV6WOC7TeFjEETwtDWv3PoqKprnlBTWfiLZ0jtZmH/Jq8MDeSLi
 GxMux0PXBbe82RVxVrAPlQPsgR43WJ4dHg855yrQRVLOEIUXkqIrdwVcn8Sc9D4Yl1kf706BT
 4g0IiLtKUB+mIslsBS7Xglzb2Svw99zN1pX+mofPpXDv45hGgS33IDI4hcASA7H5ijKg7FZdq
 u0a1ikEp2xWbOrMpQ1WS8I67iE7R7+CCVTosI3OB1v1jrUrtJEWRwoYkowY/BYiGRUrliXYhY
 NgaisgQo2WV80it/PP0muweyOT9jriSpnXTjwa5D69OyZGqvJAJ2WbgRPOdKeg7r2KAQ/4nYl
 8Za6F7HdZctNIMM1fKsQxFXxz0CNfveN5a/odJB+hXkxKOxDkR22+U9t7dDJ/X5cLlQfvMhx1
 7Unz8Flk1SSznXwU3wvog21tv6+I7b9NR8Evk/CdXF1BgF/qUdedXMhuZ70=
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Florian,

Am 09.08.22 um 21:02 schrieb Florian Fainelli:
> On 8/4/22 16:11, Florian Fainelli wrote:
>> On 6/13/22 07:47, Maxime Ripard wrote:
>>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>
>>> The BCM2835-37 found in the RaspberryPi 0 to 3 have a power domain
>>> attached to the HDMI block, handled in Linux through runtime_pm.
>>>
>>> That power domain is shared with the VEC block, so even if we put our
>>> runtime_pm reference in the HDMI driver it would keep being on. If the
>>> VEC is disabled though, the power domain would be disabled and we would
>>> lose any initialization done in our bind implementation.
>>>
>>> That initialization involves calling the reset function and 
>>> initializing
>>> the CEC registers.
>>>
>>> Let's move the initialization to our runtime_resume implementation so
>>> that we initialize everything properly if we ever need to.
>>>
>>> Fixes: c86b41214362 ("drm/vc4: hdmi: Move the HSM clock enable to 
>>> runtime_pm")
>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>
>> After seeing the same warning as Stefan reported in the link below, 
>> but on the Raspberry Pi 4B:
>>
>> https://www.spinics.net/lists/dri-devel/msg354170.html
>>
>> a separate bisection effort led me to this commit, before is fine, 
>> after produces 4 warnings during boot, see attached log.
>>
>> Is there a fix that we can try that would also cover the Raspberry Pi 
>> 4B? Is it possible that this series precipitates the problem:
>>
>> https://www.spinics.net/lists/arm-kernel/msg984638.html
>
> Maxime, Dave, anything you would want me to try? Still seeing these 
> warnings with net-next-6.0-11220-g15205c2829ca

At first this issue doesn't occur in Linux 5.19. So it's something new. 
I was able to reproduce with todays linux-next, but interestingly it 
doesn't occur in drm-misc-next.

>
> Would be nice to see those fixes before 6.0 final, thanks!
