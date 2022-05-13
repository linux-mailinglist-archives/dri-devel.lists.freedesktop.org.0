Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C12525C77
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 09:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2521710E7E6;
	Fri, 13 May 2022 07:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C6C10E7E6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 07:44:04 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1npPxw-00088Q-JF; Fri, 13 May 2022 09:44:00 +0200
Message-ID: <8719f148-7e28-c5a6-08c4-3fbb28138b1c@leemhuis.info>
Date: Fri, 13 May 2022 09:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zack Rusin <zackr@vmware.com>, David Airlie <airlied@linux.ie>
References: <20220509110425.165537-1-hdegoede@redhat.com>
 <6eea44ce-4057-7267-8a0b-096cdc61dd94@redhat.com>
 <aa4c0305-c99b-050b-80a5-d13e8e10b78c@redhat.com>
 <f460b87a-a53c-0570-9c87-9997519ebb97@redhat.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <f460b87a-a53c-0570-9c87-9997519ebb97@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1652427844;
 e1a5b974; 
X-HE-SMSGID: 1npPxw-00088Q-JF
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CCing airlied

On 09.05.22 14:02, Javier Martinez Canillas wrote:
> On 5/9/22 13:55, Hans de Goede wrote:
> [snip]
>>>>
>>>> Fixes: dabdcdc9822a ("drm/vmwgfx: Switch to mode_cmd2")
>>>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2072556
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>
>>> Zack fixed this already:
>>>
>>> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5405d25b9e8e6
>>
>> I see, but it seems that this was never pushed to drm-misc-fixes,
>> so this is still broken in 5.18-rc#
> 
> Indeed. Agreed that should be cherry-picked in -fixes as well.

Looks to me like nobody did that and this regression fix is missing in
the pull request Dave sent to Linus earlier today. Can anybody please
make sure it makes the next weeks pull? Or was there a change of plans?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.




