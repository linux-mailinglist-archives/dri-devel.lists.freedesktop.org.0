Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B01B0D89C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 13:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3879310E0DA;
	Tue, 22 Jul 2025 11:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 546 seconds by postgrey-1.36 at gabe;
 Tue, 22 Jul 2025 11:54:51 UTC
Received: from hs01.dakr.org (hs01.dakr.org [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9C810E059;
 Tue, 22 Jul 2025 11:54:51 +0000 (UTC)
Message-ID: <2e94329d-04c7-4cd5-bce4-235a81db214b@dakr.org>
Date: Tue, 22 Jul 2025 13:45:41 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/nouveau: check ioctl command codes better
To: Arnd Bergmann <arnd@arndb.de>, Satadru Pramanik <satadru@gmail.com>
Cc: Chris Bainbridge <chris.bainbridge@gmail.com>,
 Arnd Bergmann <arnd@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Simona Vetter <simona@ffwll.ch>, Timur Tabi <ttabi@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, regressions@lists.linux.dev
References: <CAFrh3J85tsZRpOHQtKgNHUVnn=EG=QKBnZTRtWS8eWSc1K1xkA@mail.gmail.com>
 <aH9n_QGMFx2ZbKlw@debian.local>
 <d5010230-b718-4770-b731-f62225f1f808@app.fastmail.com>
From: Danilo Krummrich <kernel@dakr.org>
Content-Language: en-US
In-Reply-To: <d5010230-b718-4770-b731-f62225f1f808@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 7/22/25 12:52 PM, Arnd Bergmann wrote:
> On Tue, Jul 22, 2025, at 12:29, Chris Bainbridge wrote:
>> On Mon, Jul 21, 2025 at 08:22:48AM -0400, Satadru Pramanik wrote:
>>> Hello all,
>>>
>>> I suspect this commit in 6.16-rc7 has broken acceleration with Mesa's
>>> nouveau drivers on my machine.

Thanks for the report!

Please make sure to keep maintainers in the loop, for some reason I was removed
from the recipient list for this regression report.

>>>
>>> glxinfo -B reports that I'm using llvmpipe.
>>>
>>> Reverting this in 6.16-rc7 restores nouveau acceleration, and glxinfo
>>> then reports: "OpenGL renderer string: NVE7"
>>
>> I also bisected an issue to this commit. On my laptop, this commit
>> results in an intermittent desktop crash (Xorg segfault) when changing
>> display scale, which can be more reliably reproduced with:
>>
>> for x in {1..100}; do
>>    xrandr --output eDP-1 --mode 2560x1600 --scale 0.5 --filter nearest
>>    xrandr --output eDP-1 --mode 2560x1600 --scale 1 --filter nearest
>> done
>>
> 
> I won't have time to work on fixing my patch before the merge window,
> let's just revert it.

@Arnd: Yes, given the short timeframe I think that's the best. Can you please 
send the revert?
