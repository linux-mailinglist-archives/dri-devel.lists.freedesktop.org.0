Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67836373892
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 12:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F7D6E48B;
	Wed,  5 May 2021 10:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1CC6E3D6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 10:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620210621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zE1dVKPK82uToYAi4Qlfa5L92Nao6h848ucJ6GBhOnM=;
 b=a1ZcFbHMCzxB/vwmOPooCeQpC03+F+kh3+IGtUnVrqJ6JIC5cYDX0oFHeg12filTyF4NuB
 hIZWs3xRLmqu50k/5cf2mT6wG58jLWmWBQV1DW92yZdJVCgU9rwucthEf/UJQhP0SHQvSO
 Zcfs9DUrb1u//0sp1y7gZmsb4/1nIqc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-uTM8DYABP5O8KTAOzUGZlQ-1; Wed, 05 May 2021 06:30:17 -0400
X-MC-Unique: uTM8DYABP5O8KTAOzUGZlQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 y15-20020aa7d50f0000b02903885ee98723so615692edq.16
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 03:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zE1dVKPK82uToYAi4Qlfa5L92Nao6h848ucJ6GBhOnM=;
 b=LD0hoyfHRdSANw2yIzPH07hHWRZJI1tCxj0mSq68aaKIRAbo0vSB+D+tpDpI4XcScS
 fT1NCgUg3+eQHRnUXx1DTVtXAyRYC5QqkX83VjhLQp4Qx2wtPwt4CQYt6Os2KYdxsaB3
 5NtUxx3dg0+qR851+TFCEX02hKoW52mDXytZWVbofodBca0feoJLaXzDK8zeYK6kuwA5
 6QlxEiS9gj95Ws1K6WZSenh9OqRFZcOPlphO4toOSwfYBXiwCNR9gPxmst4v//HY2i+f
 2s6yH1idzRtQgdE87uIeCKgUeaiFXJ4hpZRY674XTr7dZEiCQhvPZamxmw7AQpJqfHi8
 VL4A==
X-Gm-Message-State: AOAM531G/jji9b49KQQBprev64sku/OVhpZwQzy0iu5TsElUZY0apl+3
 F4kPikmKeTsnzcxzkprXJO0J+UYi7FnjTLp9pLvnbDNXtZJZt21YrH7HAleA/xYRtsFdp+A0+dZ
 hLhSwamyJyu8KqYFVk4zYCWZYODMQ
X-Received: by 2002:a17:906:3e42:: with SMTP id
 t2mr26203544eji.508.1620210616748; 
 Wed, 05 May 2021 03:30:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwORVYcTi6Wi6NDO0GOpSEZ0NUK0+6R4wrD+Ub3k6LyrPH/SxZE8FmOv9YyY07/ujKwC3W5Vg==
X-Received: by 2002:a17:906:3e42:: with SMTP id
 t2mr26203515eji.508.1620210616512; 
 Wed, 05 May 2021 03:30:16 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id t20sm2658262ejc.61.2021.05.05.03.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 03:30:16 -0700 (PDT)
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
 <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com>
 <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
 <ffb46bb6-3548-4ec2-f176-99f3674e7f6d@redhat.com>
 <CAHp75VcHEMaZ67yy7TD8f8Nk=+oiLT-vRCt9A6fT9K6LeR78Ew@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <adb9be8a-70c7-b515-48c3-7e372e5d8801@redhat.com>
Date: Wed, 5 May 2021 12:30:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcHEMaZ67yy7TD8f8Nk=+oiLT-vRCt9A6fT9K6LeR78Ew@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/5/21 12:02 PM, Andy Shevchenko wrote:
> On Wed, May 5, 2021 at 12:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 5/5/21 11:17 AM, Andy Shevchenko wrote:
>>> On Wed, May 5, 2021 at 12:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> On 5/4/21 9:52 AM, Andy Shevchenko wrote:
>>>>> On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
>>>
>>> ...
>>>
>>>>>     +               fwnode = device_get_next_child_node(kdev, fwnode);
>>>
>>>>> Who is dropping reference counting on fwnode ?
>>>>
>>>> We are dealing with ACPI fwnode-s here and those are not ref-counted, they
>>>> are embedded inside a struct acpi_device and their lifetime is tied to
>>>> that struct. They should probably still be ref-counted (with the count
>>>> never dropping to 0) so that the generic fwnode functions behave the same
>>>> anywhere but atm the ACPI nodes are not refcounted, see: acpi_get_next_subnode()
>>>> in drivers/acpi/property.c which is the get_next_child_node() implementation
>>>> for ACPI fwnode-s.
>>>
>>> Yes, ACPI currently is exceptional, but fwnode API is not.
>>> If you may guarantee that this case won't ever be outside of ACPI
>>
>> Yes I can guarantee that currently this code (which is for the i915
>> driver only) only deals with ACPI fwnodes.
>>
>>> and
>>> even though if ACPI won't ever gain a reference counting for fwnodes,
>>> we can leave it as is.
>>
>> Would it not be better to add fake ref-counting to the ACPI fwnode
>> next_child_node() op though. I believe just getting a reference
>> on the return value there should work fine; and then all fwnode
>> implementations would be consistent ?
> 
> But it's already there by absent put/get callbacks.

Ah, I completely missed that the put/get-s are actually done
through function pointers in fwnode_operations. I assumed that there
was a kref embedded inside the fwnode_handle struct and that they
operated directly on that.

So this whole discussion is entirely based on that misunderstanding,
my bad, sorry.

So yes you are right, things are already consistent thanks to the
absent put/get callbacks.

But we do really need to document the behavior better here
in the kdoc for fwnode_get_next_child_node() and
device_get_next_child_node().

of_get_next_child has this bit, which applies to those too:

 *      Returns a node pointer with refcount incremented, use of_node_put() on
 *      it when done. Returns NULL when prev is the last child. Decrements the
 *      refcount of prev.

I'll prepare a patch to add this to the kdoc for fwnode_get_next_child_node()
and device_get_next_child_node() once I'm done with readying v3 of this series.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
