Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4407E1AB33C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 23:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED72D6E0E3;
	Wed, 15 Apr 2020 21:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12446E0E3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 21:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586985691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QLUlQE0JskPyH3bNGy6m16cs6UOPb+RPsXhfD3emDuY=;
 b=d6iVO0+xZd/rQGvd1R15eqebiOfN/B3MJuAIlTA/GOsHFE6wEOLQl4KRfColab+rd8y5zm
 INXu6yz2pshzwd5SQXpZQhqoI6FXpae1akqL8QgtxDUipcYrK8BRmQODgH/SfAjOGX1Yv/
 c1YLMeb/GKbRh1shQy/u0qiNhB4EGgE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-MGPW6gqiOXCsSneDTwHukA-1; Wed, 15 Apr 2020 17:21:28 -0400
X-MC-Unique: MGPW6gqiOXCsSneDTwHukA-1
Received: by mail-wm1-f72.google.com with SMTP id h22so515137wml.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 14:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QLUlQE0JskPyH3bNGy6m16cs6UOPb+RPsXhfD3emDuY=;
 b=IQ84oLLdMs/erExV+JXYahNLeIegxn4nyIizLftLWBR8GdJEZcEplMFK+OWMDZBsuI
 hYMySoZ5Q9tZsw7Ofg/FblWcKSxb3UOG5R+nBQo7sLumXUI8fzPHgGANWMneg03XOrsM
 NQXQ8GKqQoYzfgn3clumC4Xo9AFYSNoTCIlLwUIf0RTGcv32UiNMlqorlybyhCkE185h
 +P/Came8aryEhI++MFoKnJ3C0wpTSOHLpudBMRE9QMVKVR0b/e+EtfawTLLKJ5BGkO/s
 OO31yeMI7B412peGDpwg+2rioODKyPWbmBunauBv1AplUriG84cs0PyernD9jYNDUvHl
 uaEg==
X-Gm-Message-State: AGi0PubU+zdJZBBnZcsv05pX4RUauDcCWUGjxsB4dED+0RmRO1z7dhBS
 /bUFrgukWQ40AbkmEHTti4Po5LZZ6Bcbdl0nII/lq5UP9ggUxl4YMDomdyO4P+r2gy3Xvu3n4/d
 YhYm6iEllng28IBpGq3742HTVE55x
X-Received: by 2002:a7b:c156:: with SMTP id z22mr1321030wmi.51.1586985687418; 
 Wed, 15 Apr 2020 14:21:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypIyHcrPlcMEXQxxYIwH1gVltMGEH6DlmSMtFQ0yTAYJBOTGAqJu/89WfxfDITlktqO6P/gURg==
X-Received: by 2002:a7b:c156:: with SMTP id z22mr1321011wmi.51.1586985687159; 
 Wed, 15 Apr 2020 14:21:27 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id p6sm17424840wrt.3.2020.04.15.14.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 14:21:26 -0700 (PDT)
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Jani Nikula <jani.nikula@linux.intel.com>, Rajat Jain <rajatja@google.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <CACK8Z6HZe0iiyYUR57LvQVJjZCt+dbK9Vc9Tr+Ch8fUuh0h-gw@mail.gmail.com>
 <87pnc84frl.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <895edf22-8138-b3c7-52e8-5a46588badd4@redhat.com>
Date: Wed, 15 Apr 2020 23:21:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87pnc84frl.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nitin Joshi1 <njoshi1@lenovo.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/15/20 11:10 PM, Jani Nikula wrote:
> On Wed, 15 Apr 2020, Rajat Jain <rajatja@google.com> wrote:
>> Hello,
>>
>> On Wed, Apr 15, 2020 at 8:40 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> On 4/15/20 5:28 PM, Jani Nikula wrote:
>>>> On Wed, 15 Apr 2020, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>> ii. Currently the "privacy-screen" property added by Rajat's
>>>>> patch-set is an enum with 2 possible values:
>>>>> "Enabled"
>>>>> "Disabled"
>>>>>
>>>>> We could add a third value "Not Available", which would be the
>>>>> default and then for internal panels always add the property
>>>>> so that we avoid the problem that detecting if the laptop has
>>>>> an internal privacy screen needs to be done before the connector
>>>>> is registered. Then we can add some hooks which allow an
>>>>> lcdshadow-driver to register itself against a connector later
>>>>> (which is non trivial wrt probe order, but lets ignore that for now).
>>>>
>>>> I regret dropping the ball on Rajat's series (sorry!).
>>>>
>>>> I do think having the connector property for this is the way to go.
>>>
>>> I 100% agree.
>>>
>>>> Even
>>>> if we couldn't necessarily figure out all the details on the kernel
>>>> internal connections, can we settle on the property though, so we could
>>>> move forward with Rajat's series?
>>
>> Thanks, it would be great!.
>>
>>>
>>> Yes please, this will also allow us to move forward with userspace
>>> support even if for testing that we do some hacks for the kernel's
>>> internal connections for now.
>>>
>>>> Moreover, do we actually need two properties, one which could indicate
>>>> userspace's desire for the property, and another that tells the hardware
>>>> state?
>>>
>>> No I do not think so. I would expect there to just be one property,
>>> I guess that if the state is (partly) firmware controlled then there
>>> might be a race, but we will need a notification mechanism (*) for
>>> firmware triggered state changes anyways, so shortly after loosing
>>> the race userspace will process the notification and it will know
>>> about it.
>>
>> I agree with Hans here that I think it would be better if we could do
>> it with one property.
>>
>>   * I can imagine demand for laptops that have a "hardware kill switch"
>> for privacy screen (just like there are for camera etc today). So I
>> think in future we may have to deal with this case anyway. In such
>> devices it's the hardware (as opposite to firmware) that will change
>> the state. The HW will likely provide an interrupt to the software to
>> notify of the change. This is all imaginative at this point though.
>>
>> * I think having 2 properties might be a confusing UAPI. Also, we have
>> existing properties like link-status that can be changed by both the
>> user and the hardware.
> 
> I think the consensus is that all properties that get changed by both
> userspace and the kernel are mistakes, and the way to handle it is to
> have two properties.

But the actual privacy screen has only 1 state, having two properties
for this will only be confusing. As I mentioned before we have a similar
case with e.g. keyboard backlighting and there the userspace API
also has a single sysfs attribute for the brightness, with change
notifications to userspace if the firmware changes the brightness
on its own and this works well.

What would the semantics of these 2 different properties be? And
what sort of extra functionality would these semantics offer which
the single property versions does not offer?

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
