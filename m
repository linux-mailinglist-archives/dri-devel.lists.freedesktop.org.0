Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3320318A802
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 23:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5745C6E976;
	Wed, 18 Mar 2020 22:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93E66E976
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 22:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584570027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQaXTbYCM8vKZK0txJu8dgWPj2NpFm+69ETt6a/FCj4=;
 b=Ei2rC6vYr2+JKWyxaG2OKy+j9iij41r/wniyMD3aHoSrAfpDxrVS3ONJ/JruhJLPNUvY83
 72aqX31heok0L6TNf//TdY69O3lvsJr1MRK+aQIKZbfWHTo80U3eLCzhKpzV+Seitoh96O
 k+hdO6kNYUKtc9jvSxqVjvY/jZ1tIhA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-B5t18c6rMGqGWpHvi0NvlQ-1; Wed, 18 Mar 2020 18:20:25 -0400
X-MC-Unique: B5t18c6rMGqGWpHvi0NvlQ-1
Received: by mail-wr1-f69.google.com with SMTP id b11so4568wru.21
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XQaXTbYCM8vKZK0txJu8dgWPj2NpFm+69ETt6a/FCj4=;
 b=Kbgy6aCD2YhFB2sdfGi893vmh2lJscv7uwrIXpc9NT9nhcRcPpLjNaoFEdUUF48p35
 0ZlDk76pcfCrBYcX88eoMMxzrqkNXrC8U72LrEsKmoy+EAt4YRxVlLE7LTD0c7JZzmcW
 IayqODa1vpIHNBU0eXMmWhuBiZ0VNFMAZek8eGFnkm3f11SBJOOpvdBnqVyvwJsR469u
 JhDQE3Bpzm12Q12ZibM8Iu5wJPq4wkGR8R9sxn4r4Tu2QQf/gQdTzs96eLoDcLsnu3Wb
 Rt6pFY4NFqxeEEWarFjI2zDVGNGJ8mjate2mjMsRc2PyHzwk0x+j2B0barrATuGaZrwk
 V7Ww==
X-Gm-Message-State: ANhLgQ11RrImE5Y8+2N9DEzNoE1rJW3DaTJi13e1Xd1J4X0EEJxnkilX
 kk4deDUyqgYDCvuiBMJpHCzQ8FK32v4u3JH9RJorXQraGiEKl3p9C2/w2eAFsGSOKwSLwvdCDYn
 3DwR3MugR3ByTIG0+bh4324YAmJpN
X-Received: by 2002:a1c:3d6:: with SMTP id 205mr7946335wmd.155.1584570023525; 
 Wed, 18 Mar 2020 15:20:23 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs1surF9zkRl1PHeCyB2OGCGTHwTlh3+ZAkX3c/ncx1wr1ny/eO6GJM38z3GpA/Py1i1hh34w==
X-Received: by 2002:a1c:3d6:: with SMTP id 205mr7946312wmd.155.1584570023298; 
 Wed, 18 Mar 2020 15:20:23 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id w204sm289547wma.1.2020.03.18.15.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 15:20:22 -0700 (PDT)
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Daniel Vetter <daniel@ffwll.ch>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <CAKMK7uFo67jkgnDFb5Gs02CCkTVCe11ieqp6jeEZjJUjpF8Ssg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ec55bee0-f716-a389-121d-83ac5c3bbb16@redhat.com>
Date: Wed, 18 Mar 2020 23:20:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFo67jkgnDFb5Gs02CCkTVCe11ieqp6jeEZjJUjpF8Ssg@mail.gmail.com>
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

On 3/18/20 4:09 PM, Daniel Vetter wrote:
> On Wed, Mar 18, 2020 at 3:29 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> I'm not sure if $subject was a conscious design decision, or an oversight,
>> but that does not really matter.
>>
>> ATM the Atomic KMS API lacks the ability to set cursor hot-spot
>> coordinates. Mutter (and Weston) have tried to emulate this by shifting
>> the coordinates for where to draw the cursor by the hotspot-coordinates
>> and always using 0x0 for the hotspot.
>>
>> But this breaks the so called "seamless mouse mode" for virtual-machines
>> and there really is no way to fix this but to allow passing the proper
>> hotspot coordinates to the virtual gfx-card.
> 
> Fully aware, we simply never had userspace for this. So
> - type weston patch
> - type kernel patch (iirc this might be some work of moving the
> hotspot coordinates from struct drm_plane to drm_plane_state)
> - wire up atomic property (it'd just do "CURSOR_HOT_X/Y" and be done
> with it, only attached to cursor planes that support it ofc)
> - I think all drivers supporting vm cursor hotspot are now atomic, so
> would be good to garbage-collect the old legacy infrastructure
> completely. legacy cursor ioctl will remap to the atomic call
> transparently like we do now already for everything else
> - type igt
> - get it all reviewed and merged.
> 
> 0 design reasons for omitting this, simply Not Yet Done (tm).

Ok, sounds good, thank you.  I've put this on my TODO list, but below
a bunch of other higher prio items, so it may be a while before I
get around to this.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
