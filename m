Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CAA1CEEAF
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 10:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AFF6E85D;
	Tue, 12 May 2020 08:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830236E85D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589270541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LQqUt9VDKrDbfrSAUg0O02XfkUn41gCZ1aqk99ZVPGA=;
 b=bUGUf9PGjjnhU+pnLXa+06IoiPvqJwLY9p92/q/x2sgiVVaKtoL9THoegWF70vzXOGFtEq
 6xMiSctTDwVHkrl3ItF7HLRTqOR1KhOmta8YMPo4UGeJt7v83zUoFw+uW9WSeQsBrqROQE
 yP+cCP04YkpjKy1LTZtcWnBL6K2lyS4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-2KGthozKMTOGEOTjWx7MLw-1; Tue, 12 May 2020 04:02:16 -0400
X-MC-Unique: 2KGthozKMTOGEOTjWx7MLw-1
Received: by mail-wm1-f69.google.com with SMTP id a206so3486297wmh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 01:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LQqUt9VDKrDbfrSAUg0O02XfkUn41gCZ1aqk99ZVPGA=;
 b=Ofk7yZFidho+GKgGeGpPQ2+G9t9KEktYdOlho9xaWLNTb9RyjGfA5RNWBpAMaFQFr2
 oa/mVfs4+dXqoskqA2RgBXx/ZBzEwTE6808SWVf+3knu9kkDSX1k8rRuAkPeNJ/bXSAZ
 WZHMv8hLhZjxqGRn57Ea8hbQSnazzXFmY/wCBBX4421WOOk1EgxrGw8LujlH7btCGHQo
 9EpcGyfOrE6z7lELQWwNEAgpVh00gNsRlC/Izg9l1ehvTP78mpTZRtpwrulFDDSauj1F
 BMZeIMShTA0HTDcxe1syVlTigaqeV9mjCox/ekWrCmJ4GHquKFcH6vrUdy6EVafk8vbP
 BsCg==
X-Gm-Message-State: AGi0PubwCOEwYJw5GclQx4Q1dmvxXTqmn7tyMcJd2Ox/IyVwTT+wdIx2
 f1kNPIk+SBZ8ftBGg2pcl3K8aFqcTmYIFx+hJ720C4DPldMsq9jp8RVuVAuYQsjkOoQRdv54mPU
 f6nfM01vblVSGQ88WY4N9IvXist/N
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr18057203wrv.269.1589270534749; 
 Tue, 12 May 2020 01:02:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypKhufB7bAZTjf8V+zliOc4Zjmsdyxj5TqxbTsa/hlaEi+Ke3Hpr1INiLtSXtXcvdIJcgchGfw==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr18057171wrv.269.1589270534452; 
 Tue, 12 May 2020 01:02:14 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id d13sm30129982wmb.39.2020.05.12.01.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2020 01:02:13 -0700 (PDT)
Subject: Re: [RFC v2] drm/connector: Add support for privacy-screen properties
 (v2)
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <20200511174724.21512-2-hdegoede@redhat.com>
 <20200512104912.419270ff@eldfell.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d6421971-cff2-9aa7-30c5-9e6d9bea3f62@redhat.com>
Date: Tue, 12 May 2020 10:02:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200512104912.419270ff@eldfell.localdomain>
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
Cc: Sonny.Quintanilla@dell.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@dell.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jared Dominguez <jaredz@redhat.com>, Rajat Jain <rajatja@google.com>,
 Mark Pearson <mpearson@lenovo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/12/20 9:49 AM, Pekka Paalanen wrote:
> On Mon, 11 May 2020 19:47:24 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> From: Rajat Jain <rajatja@google.com>
>>
>> Add support for generic electronic privacy screen properties, that
>> can be added by systems that have an integrated EPS.
>>
>> Changes in v2 (Hans de Goede)
>> - Create 2 properties, "privacy-screen sw-state" and
>>    "privacy-screen hw-state", to deal with devices where the OS might be
>>    locked out of making state changes
>> - Write kerneldoc explaining how the 2 properties work together, what
>>    happens when changes to the state are made outside of the DRM code's
>>    control, etc.
>>
>> Signed-off-by: Rajat Jain <rajatja@google.com>
>> Co-authored-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   Documentation/gpu/drm-kms.rst     |   2 +
>>   drivers/gpu/drm/drm_atomic_uapi.c |   6 ++
>>   drivers/gpu/drm/drm_connector.c   | 100 ++++++++++++++++++++++++++++++
>>   include/drm/drm_connector.h       |  50 +++++++++++++++
>>   4 files changed, 158 insertions(+)
> 
> ...
> 
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 644f0ad10671..01360edc2376 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1186,6 +1186,45 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>    *	can also expose this property to external outputs, in which case they
>>    *	must support "None", which should be the default (since external screens
>>    *	have a built-in scaler).
>> + *
>> + * privacy-screen sw-state, privacy-screen hw-state:
>> + *	These 2 optional properties can be used to query the state of the
>> + *	electronic privacy screen that is available on some displays; and in
>> + *	some cases also control the state. If a driver implements these
>> + *	properties then both properties must be present.
>> + *
>> + *	"privacy-screen hw-state" is read-only and reflects the actual state
>> + *	of the privacy-screen, possible values: "Enabled", "Disabled,
>> + *	"Enabled, locked", "Disabled, locked". The locked states indicate
>> + *	that the state cannot be changed through the DRM API. E.g. there
>> + *	might be devices where the firmware-setup options, or a hardware
>> + *	slider-switch, offer always on / off modes.
>> + *
>> + *	"privacy-screen sw-state" can be set to change the privacy-screen state
>> + *	when not locked. In this case the driver must update the hw-state
>> + *	property to reflect the new state on completion of the commit of the
>> + *	sw-state property. Setting the sw-state property when the hw-state is
>> + *	locked must be interpreted by the driver as a request to change the
>> + *	state to the set state when the hw-state becomes unlocked. E.g. if
>> + *	"privacy-screen hw-state" is "Enabled, locked" and the sw-state
>> + *	gets set to "Disabled" followed by the user unlocking the state by
>> + *	changing the slider-switch position, then the driver must set the
>> + *	state to "Disabled" upon receiving the unlock event.
>> + *
>> + *	In some cases the privacy-screen state might change outside of control
>> + *	of the DRM code. E.g. there might be a firmware handled hotkey which
>> + *	toggles the state, or the state might be changed through another
> 
> Hi,
> 
> in the above three lines, I'd use the term "hardware state" instead of
> just "state" to be explicit. Or should it be "physical state" since
> "hardware state" might be confused with "hw-state" property state?

Maybe "actual state"? That is what is used a few lines higher:

'"privacy-screen hw-state" is read-only and reflects the actual state'

And you use it yourself to describe what we want below:

> I don't mind as long as it's unambiguous and distinguishes explicitly
> between actual and the two property states.

So since you and I both naturally described it as "actual state" without
thinking too much what we where writing at the time (I guess that applies
to your use too), "actual state" seems a good fit ?


>> + *	userspace API such as writing /proc/acpi/ibm/lcdshadow. In this case
>> + *	the driver must update both the hw-state and the sw-state to reflect
>> + *	the new value, overwriting any pending state requests in the sw-state.
>> + *
>> + *	Note that the ability for the state to change outside of control of
>> + *	the DRM master process means that userspace must not cache the value
>> + *	of the sw-state. Ccaching the sw-state value and including it in later
> 
> Extra 'c' in "Caching".

Ack, will fix.

>> + *	atomic commits may lead to overriding a state change done through e.g.
>> + *	a firmware handled hotkey. Therefor userspace must not include the
>> + *	privacy-screen sw-state in an atomic commit unless it wants to change
>> + *	its value.
>>    */
> 
> This documentation and intended behaviour looks perfect to me.

Great I'm glad you like it.

> If you
> can record an R-b just for the doc, please have:
> 
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> You can also downgrade that to Acked-by for the whole patch from my
> behalf.

I don't know of a way to add partial Reviewed-by tags, so unless
someone educates me on that I will change it to an Acked-by for the next
version.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
