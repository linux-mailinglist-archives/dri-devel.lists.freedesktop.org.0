Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98718BF31
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 19:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033EA6EA48;
	Thu, 19 Mar 2020 18:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AEA6EA4F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584641925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxzYiYuCRcQSWbGtS8MduEZ+VBaFmKVE/lOJCGx4eSw=;
 b=Fz5NtRtm6+6YspwjjWonU/zlhTyM6nW3g5JtiOLvXqB0IZ1TMx9HFLDCwTWZd8+VAQ8lzR
 8CSEc1V4/+Fv92BY7TfOSuf5hTP5reFhrlUq2FcjFqOxuLZ32+kHzz0QoLu1g/ta6z4yfm
 4DZF8ZGqGAQfw9WC96NaXegvVwahZls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-R9mYwcCAN-uY9DIXO2FhCQ-1; Thu, 19 Mar 2020 14:18:43 -0400
X-MC-Unique: R9mYwcCAN-uY9DIXO2FhCQ-1
Received: by mail-wm1-f69.google.com with SMTP id 20so1346417wmk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 11:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FxzYiYuCRcQSWbGtS8MduEZ+VBaFmKVE/lOJCGx4eSw=;
 b=BXAP1pW6eHdOivKexi3ODhSETFF8ui5tZ+Mlhu98HtXjJOBufTP99WnGJ6HQsAiu8P
 ElzmVyhPba3ngRCakm2210ud2+8Lb+ics1ebk7T39D7k/yEja53gzaHT65sjRRN5kLQX
 cV+nDs3ts6fDzTFUaj+Zgu1ihLszplL5aQqNoAirBi0UBMEyYgF2SG6Lp/ZdTmg9il5f
 DhCrzt+YQufD38TBdr8Qj8c0tV9vR0cnFy/jIQY+ebRiqTSUZ+g3t4z37S3lkNQZFJ6N
 cjPBvu/76zf1ai9dQc3CQ5O6swsIkvpaaEmoceLkhKRVZY4YWLKLK79OGWK4PG/G4qNO
 8JZg==
X-Gm-Message-State: ANhLgQ1bXe+EQ9Z0g/0TJdxAI/iBLJAEtgltA5dI5qoHpV8RkYER7tkF
 nxdehiqQcZRREiu0tOIgZRbxvFsWMfqhR7lr7FDot1s/zS0eUOybEgt0Cpy4i5F3P+O5c+oenLl
 YQeCkVwm7Va5j0DKiH13iDyHYwods
X-Received: by 2002:a7b:c0d7:: with SMTP id s23mr3244863wmh.104.1584641921932; 
 Thu, 19 Mar 2020 11:18:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuMi4jz4BjI87rgvrK5SDCFySiGWQr3ZIfW4NBezv+pFuw9QKFM/MExHFfqiZEN10WtFFGEgQ==
X-Received: by 2002:a7b:c0d7:: with SMTP id s23mr3244841wmh.104.1584641921684; 
 Thu, 19 Mar 2020 11:18:41 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id c18sm3248386wrx.5.2020.03.19.11.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 11:18:40 -0700 (PDT)
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319120028.56d3427a@eldfell.localdomain>
 <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
 <20200319145842.4b7db322@eldfell.localdomain>
 <c8c75790-9b56-9f7f-98d6-1dd2410d70b2@redhat.com>
 <20200319171633.2ee4afa4@eldfell.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <217ab553-9c16-329d-bbbd-02067a2ccd6e@redhat.com>
Date: Thu, 19 Mar 2020 19:18:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319171633.2ee4afa4@eldfell.localdomain>
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

On 3/19/20 4:16 PM, Pekka Paalanen wrote:
> On Thu, 19 Mar 2020 15:30:03 +0100
> Hans de Goede <hdegoede@redhat.com> wrote:

<snip>

>>> The only way to fix that is to stop Weston from putting non-cursor
>>> content on the cursor plane.
>>
>> Correct.
> 
> Is that something that should be done?
> 
> If the hotspot property also had a "disabled" value, then Weston could
> set the hotspot to disabled when it is using the cursor plane for
> non-cursor content and not lose the feature. And of course set hotspot
> correctly when it in fact is a cursor (but for what input?).

I believe cursor planes in the affected virtual gfx-cards do not
really have a mode where they can actually be used as a generic overlay
plane, certainly not in a useful manner (if anything works it will all
be software emulation), implementing a hotspot disabled mode would be
tricky and this would needs to be duplicated in all virtual-gfx cards
kms drivers.

If I understood Daniel's proposal for how to deal with this properly,
then only cursor planes which actually need them would get the new
hotspot x/y properties.  If we do that then Weston could use the
presence of the hotspot x/y properties to detect if it is dealing
with a proper hw plane which can also be used as a generic
plane; or a virtual-gfx cards cursor-plane, and then just not
bother with trying to use the plane as a generic hw plane.

Would that work?

<snip>

> I think one of the major reasons why Wayland pointer relative motion
> and confinement extensions were designed was VM- etc. viewers, and of
> course games.

ack.

>>> What if display servers stop using the cursor plane completely, because
>>> people may hit a case where a VM-viewer makes the wrong assumption about
>>> which input device is associated to which cursor plane inside the VM?
>>
>> The confine + warp trick is typically the default mode and only
>> if the guest indicates through e.g. a guest-agent process that
>> seamless mode is supported then seamless mode is enabled.
>>
>> IOW the VM is careful to not enable it when it might not work.
> 
> How would the guest-agent know? Does it check that there is literally
> only one pointer input device and that comes from the VM-viewer?
> Or does it limit seamless to white-listed display servers perhaps?

This varies between different solutions. E.g. the spice vdagent has
a desktop component which is started with a /etc/xdg/autostart/foo.desktop
file, assuming that it will work with any desktops honoring
/etc/xdg/autostart.

VirtualBox OTOH assumes it can use seamless mode as soon as
the vboxvideo driver loads inside the guest.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
