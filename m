Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92BD1AB052
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 20:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BE86EA57;
	Wed, 15 Apr 2020 18:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0206EA57
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 18:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586974017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5urDOl6mAz4+l5iykUJ7kiUQPAmdYwysMCaAyMr6U8=;
 b=KEQjQWpXzwdZ5tgWFrhp6wW9k02f0UVH40PKbi1pEyB04c5MPRErcHzSd+Uy2os82stRye
 JZZOEp/bxvdTg0QxuGImWUk6lvOuZBA+bgaGbMQ7EtwvexUXDztMWkCrqqWkFClm+Uuv79
 4bKR2npxbQu8IjFWuf2pO1KradpisJ4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-XxG_725aNoC4FfvrsXxBng-1; Wed, 15 Apr 2020 14:06:56 -0400
X-MC-Unique: XxG_725aNoC4FfvrsXxBng-1
Received: by mail-wm1-f70.google.com with SMTP id l21so217312wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L5urDOl6mAz4+l5iykUJ7kiUQPAmdYwysMCaAyMr6U8=;
 b=ZjQ85LhmAHgdGhl3H4ByHx2FC5+tDeLa2t6ly3+/5S1oJ0J/3JUy/V0WJTgqu/FfPQ
 yZYONYEjzAengG7EQ8VtLQPzSeLuHpsAj1MR3tbaJnC03NLE3Eand6CIKDWAxwDfKO3l
 e4bRhKOpZk18ysj6OLubjq7uIdgz7ViFuhdSksLX5Kl5BJcZqvJzPxl2Si9F/cloo3L5
 uZ4DC07PSCTVtrKoszm6pb62I0p1L+0v/fcfcGWzGJV9yBYgVsJ13nyys85gi4diPKhr
 brhHjIsCMPo27mD3PRdvv9L+Y9vWP3+bz7DvLeI0SNTZPAr+qgjJyf3yO5YjWXA2mzKG
 5EIg==
X-Gm-Message-State: AGi0PubLKvBC301A65kU1cbWCBW8HIklytMQv8JTMEQViE9FZUeENvcj
 hJH+bP3RfAHQJ1tMhyp69/AphshevEFRuTV9CHSbMDmM+s0gJxBoQr6Ymu2x3MJdFIzVEJufiiC
 fEutsMKaLbdsPNAk/lSfPMMYsfK1H
X-Received: by 2002:a1c:1d84:: with SMTP id d126mr400340wmd.119.1586974013615; 
 Wed, 15 Apr 2020 11:06:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypL8WS+u9gERvczHvUMflrOOlruyOnuDrrQtxNiJaNkbYX30vPC9Tb4qhwUH+86LGf/Ym3LtLw==
X-Received: by 2002:a1c:1d84:: with SMTP id d126mr400305wmd.119.1586974013342; 
 Wed, 15 Apr 2020 11:06:53 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id w83sm397149wmb.37.2020.04.15.11.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 11:06:52 -0700 (PDT)
Subject: Re: [External] Re: RFC: Drm-connector properties managed by another
 driver / privacy screen support
To: Mark Pearson <mpearson@lenovo.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <SG2PR03MB3324D2E70FF609FA020F6C9EBDDB0@SG2PR03MB3324.apcprd03.prod.outlook.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6bf78504-5716-997e-6acb-346dfdd406f3@redhat.com>
Date: Wed, 15 Apr 2020 20:06:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <SG2PR03MB3324D2E70FF609FA020F6C9EBDDB0@SG2PR03MB3324.apcprd03.prod.outlook.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Benjamin Berg <bberg@redhat.com>, Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Rajat Jain <rajatja@google.com>, Nitin Joshi1 <njoshi1@lenovo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

On 4/15/20 7:14 PM, Mark Pearson wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Wednesday, April 15, 2020 11:41 AM
>> On 4/15/20 5:28 PM, Jani Nikula wrote:
>>> On Wed, 15 Apr 2020, Hans de Goede <hdegoede@redhat.com> wrote:
>>> Moreover, do we actually need two properties, one which could indicate
>>> userspace's desire for the property, and another that tells the hardware
>>> state?
>>
>> No I do not think so. I would expect there to just be one property,
>> I guess that if the state is (partly) firmware controlled then there
>> might be a race, but we will need a notification mechanism (*) for
>> firmware triggered state changes anyways, so shortly after loosing
>> the race userspace will process the notification and it will know
>> about it.
>>
>> One thing which might be useful is a way to signal that the property
>> is read-only in case we ever hit hw where that is the case.
>>
>>> I'd so very much like to have no in-kernel/in-firmware shortcuts
>>> to enable/disable the privacy screen, and instead have any hardware
>>> buttons just be events that the userspace could react to. However I
>>> don't think that'll be the case unfortunately.
>>
>> In my experience with keyboard-backlight support, we will (unfortunately)
>> see a mix and in some case we will get a notification that the firmware
>> has adjusted the state, rather then just getting a keypress and
>> dealing with that ourselves.  In some cases we may even be able to
>> choose, so the fw will deal with it by default but we can ask it
>> to just send a key-press.  But I do believe that we can *not* expect
>> that we will always just get a keypress for userspace to deal with.
>>
> Afraid, the "hotkeys" control for ePrivacy (Fn+D I believe) is very unlikely
> to change - Windows uses it as well...
> We can do notification of any hotkey presses to update the DRM layer (and
> userspace) if that helps

We are not asking for changing the hotkey, what we would like is
for the hotkey to only send a notification that it was pressed
and for it to not actually do anything with the ePrivacy screen
state.  This does not need to be it defaults behavior, but we would
like to be able to ask the firmware to not act on it itself,
just like we can already disable the firmware/embedded controller
responding to e.g. brightness up/down key presses itself.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
