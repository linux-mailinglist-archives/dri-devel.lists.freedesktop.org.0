Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B36C189EAA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 16:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9007089EB8;
	Wed, 18 Mar 2020 15:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE2189EB8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584543852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX/Xv/jspAcnKX1gX2cg+H36N4y20wfWdXA8a+h6xkU=;
 b=KkP483GEZyDnibYjEzYPvwdVo5SZQYcFs5yObAsCmU2UbDB3T2mwLoQ/bIhn66e4vXcGh3
 p/6jX5ud4XVoAu4qd1HG8v/iy1J8nEHTVJzdXC3dra2z4u3g7RBQIzoSRIx5OlrSIFFgfu
 OX0KrGnGui89eh9Lo8JgYgrFaMZ8X+M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-v5a4JYX4NDOWtUik1tDG1A-1; Wed, 18 Mar 2020 11:04:10 -0400
X-MC-Unique: v5a4JYX4NDOWtUik1tDG1A-1
Received: by mail-wm1-f72.google.com with SMTP id r23so1206330wmn.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 08:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gX/Xv/jspAcnKX1gX2cg+H36N4y20wfWdXA8a+h6xkU=;
 b=AwRPenoLDAMQZEG6iWWavJ4O1eqWToyBtp43jWd6GGZtMTi/M0MNMKLdtOUNvGwqa7
 Mw+OVVPeeIFiH0uOqQjUATuWbSzin37h+tlPvQnj6R1iw8FXahVYEalgXoBYHGoGxwl2
 /R2koyzrsMXVNBejRQyT0phaB39APOLOBr8gApYZT8XnXJBjAkcEfFxqlAopzXq4zzbh
 eA4u8810bDzd7p90u+gY7U7eNxjqanLiBBbJE7WuqP6U43CQWU5VVM/g53X/zmQ3zwew
 6CiJR4XFBPCgo0EnhIw9g0yDGuSWhFCbbbVwMW8s+OFbuYz70w/lAyVGWL43RmncwA9p
 82tA==
X-Gm-Message-State: ANhLgQ3qhMSxJR6MEnHlcFsSazEI8qX5PvOdSYq4Po6LWAzw8HXUvzxy
 +ebiFk9qYMKMBEdtTI/t2WTb7y1RMcf/DiM9Tk/oSEfuCkCLnC9gCmXqtREuy+CTkFeV+Kssh72
 yCVNXtcY5gOyYvUhmNKqSzJ9TPTGb
X-Received: by 2002:a1c:7c0d:: with SMTP id x13mr5502161wmc.44.1584543849033; 
 Wed, 18 Mar 2020 08:04:09 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtkRFbqgghGGmhOyYOewh7dRD7tSRCetnOp5DI4DbnNtXIBI3UcEeg7G9UKdRiwqUCJJHfEyA==
X-Received: by 2002:a1c:7c0d:: with SMTP id x13mr5502146wmc.44.1584543848770; 
 Wed, 18 Mar 2020 08:04:08 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id g129sm4636255wmg.12.2020.03.18.08.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 08:04:08 -0700 (PDT)
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Simon Ser <contact@emersion.fr>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5c9f7c0e-e225-dfbf-f5bf-cb1c1cc4ac08@redhat.com>
Date: Wed, 18 Mar 2020 16:04:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
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
Cc: =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/18/20 3:38 PM, Simon Ser wrote:
> Hi,
> 
>> 1) Letting the VM-viewer window-system draw the cursor as it normally
>> would draw it.
> 
> Why is this important? Can't the VM viewer hide the cursor and use a
> sub-surface to manually draw the cursor plane configured by the guest?

Because then moving the cursor as seen by the user requires a round trip
through the VM and that adds latency, esp. when the VM viewer is viewing
a VM which is running somewhere else over the network.

Also note that a subsurface is a Wayland specific solution, where as
the VM-viewer may be running on X11, Windows, Mac OS, etc.

> This would also allow the compositor running inside the VM to correctly
> have control over the cursor position, which is necessary for pointer
> constraints.

Vms basically have 2 mouse modes:

1) Seamless, this works well for all apps which don't do weird things
with the cursor. This is what 99% of users want

2) Grab/confine the mouse on the first click inside the VM-viewer window
and constantly warp it to the center so that it can move "endlessly"
combined with drawing the VM's mouse cursor as a software sprite.

Combined with a special key combo to release the cursor and allow it
to leave the VM window in case the user wants to interact with anything
else on their desktop. AKA the "this user experience sucks" mode which
sometimes is necessary for guests which don't support absolute input
coordinates, or for special use cases.

Mode 2. can be used in case of apps inside the guest which want need
to constrain the pointer to stay inside a part-of the vm-viewer window,
note that the most prominent example of such apps are VM-viewer's
themselves and the whole purpose of seamless mode is to not need this
less then ideal user experience mode.

Anyways as I mentioned in the p.s. to my original mail already, this
is exactly NOT the kind of feedback I'm looking for. Seamless mode
exists, it has done so for at least a decade, probably a lot longer.

It works everywhere, across multiple platforms and hypervisors,
except with the KMS atomic API. The need to set hotspot coordinates
is not something which is up to discussion from my pov. What is up
for discussion is how to extend the KMS atomic API to allow this.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
