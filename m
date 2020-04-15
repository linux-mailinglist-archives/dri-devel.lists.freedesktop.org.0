Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111541AAC0D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259B36EA1A;
	Wed, 15 Apr 2020 15:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1976EA18
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586965251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4oymgFkEFwlTec7140mrbThxrh6RimLsx7khTDCdeq4=;
 b=InycMRWpVdiQEd2hlGsrL4cuxqou4afYKTGK3hVCSz5j/Mx0sDW4J7ODWjqsIpRM61FR4g
 RI8iPzq8m8k0mEdxE+EKJtOdLXswNygUdadQFUReterAQpmBIzPXAjwraMJdhk6y69Itci
 pjDS6l1P73CKJATCsKD3oLuGIKcCOo0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-Lh_YGg9MPWCbFlQUNt8jUQ-1; Wed, 15 Apr 2020 11:40:50 -0400
X-MC-Unique: Lh_YGg9MPWCbFlQUNt8jUQ-1
Received: by mail-wr1-f70.google.com with SMTP id h14so100809wrr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4oymgFkEFwlTec7140mrbThxrh6RimLsx7khTDCdeq4=;
 b=iq0gFksTp0aIm6u3hOtlUm6EeHuCTJGohI0QTdtr4sffi3dDdgHDvJMybl+PZdYUpa
 MGMechjQhplEtxfNQO3rENEcubBhhivxBHm1wdTh1P2C64weDXmPXPq9Q3G08wiGbfAq
 Rd5vGPuHnIOy72C7hBdbBHA3YDcpQg7WQkLWrmJxYmPVGo0f1RA8cL6AAoBkqIqHy0t0
 n8dzBnzve6cTDfRAqxLYzyDJOVhJBi4yNFVsAYcjUeQp9LUDEFtanJkgUNVomGzWlVK8
 NEdoYCDWKTwCO2980cfjaRNxUBgaPmLsiJpbYUnAL2AjonZl95er2ZJCyrotJYxb8nZh
 uzzA==
X-Gm-Message-State: AGi0Pua3wcbZXuEGocWE2TEfD2RC1Yw+r52bDAi+he/mWJFg7qeV5Icb
 XOXRwF11CesKxm21JHHuyiBya4uwEP/BwYZ1vZ3dQ3SkAP3lkcgQFHmo8lVDtogQGFWbl+UtGW4
 c0YygnR4+2ekqj3MuPVc1RqOahcYq
X-Received: by 2002:adf:d091:: with SMTP id y17mr28943008wrh.418.1586965248352; 
 Wed, 15 Apr 2020 08:40:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypIeQeOsF0LxpFckNVPxnQbbI1gS+6d/aNQqR0hT0XKdVzEQpjG/QqCpBbAIbASZHNQz6jDH1Q==
X-Received: by 2002:adf:d091:: with SMTP id y17mr28942986wrh.418.1586965248077; 
 Wed, 15 Apr 2020 08:40:48 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id y7sm24576009wrq.54.2020.04.15.08.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 08:40:47 -0700 (PDT)
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
Date: Wed, 15 Apr 2020 17:40:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87tv1k4vl6.fsf@intel.com>
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
 Nitin Joshi1 <njoshi1@lenovo.com>, Rajat Jain <rajatja@google.com>,
 Mark Pearson <mpearson@lenovo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/15/20 5:28 PM, Jani Nikula wrote:
> On Wed, 15 Apr 2020, Hans de Goede <hdegoede@redhat.com> wrote:
>> ii. Currently the "privacy-screen" property added by Rajat's
>> patch-set is an enum with 2 possible values:
>> "Enabled"
>> "Disabled"
>>
>> We could add a third value "Not Available", which would be the
>> default and then for internal panels always add the property
>> so that we avoid the problem that detecting if the laptop has
>> an internal privacy screen needs to be done before the connector
>> is registered. Then we can add some hooks which allow an
>> lcdshadow-driver to register itself against a connector later
>> (which is non trivial wrt probe order, but lets ignore that for now).
> 
> I regret dropping the ball on Rajat's series (sorry!).
> 
> I do think having the connector property for this is the way to go.

I 100% agree.

> Even
> if we couldn't necessarily figure out all the details on the kernel
> internal connections, can we settle on the property though, so we could
> move forward with Rajat's series?

Yes please, this will also allow us to move forward with userspace
support even if for testing that we do some hacks for the kernel's
internal connections for now.

> Moreover, do we actually need two properties, one which could indicate
> userspace's desire for the property, and another that tells the hardware
> state?

No I do not think so. I would expect there to just be one property,
I guess that if the state is (partly) firmware controlled then there
might be a race, but we will need a notification mechanism (*) for
firmware triggered state changes anyways, so shortly after loosing
the race userspace will process the notification and it will know
about it.

One thing which might be useful is a way to signal that the property
is read-only in case we ever hit hw where that is the case.

> I'd so very much like to have no in-kernel/in-firmware shortcuts
> to enable/disable the privacy screen, and instead have any hardware
> buttons just be events that the userspace could react to. However I
> don't think that'll be the case unfortunately.

In my experience with keyboard-backlight support, we will (unfortunately)
see a mix and in some case we will get a notification that the firmware
has adjusted the state, rather then just getting a keypress and
dealing with that ourselves.  In some cases we may even be able to
choose, so the fw will deal with it by default but we can ask it
to just send a key-press.  But I do believe that we can *not* expect
that we will always just get a keypress for userspace to deal with.

Regards,

Hans


*) Some udev event I guess, I sorta assume there already is a
notification mechanism for property change notifications ?


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
