Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA09618C1A7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 21:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624686EA6F;
	Thu, 19 Mar 2020 20:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6F66EA6F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584650948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IYgP7Dgo374I2hcR7mfJ0xCWQFCyIs4UMGGav8EUR8=;
 b=L7NN8vZckHd3HUgZpvrRtIO5pxLUfkBFjx2TmU3kjKLAaD7UORZ5zi9NrAZrtjvu3xmZ66
 tn8rZS3CIGYmFZo/ep5n5mjbG6uxLG0DVbg3Iqpc0/eGnkdf9l1/yXiy+oVIWlvHtNuljv
 I/kYINxutZwguK8DJKrODSPi8R1XRkc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-FpB0YMSKPmKAnaYlwH95Ng-1; Thu, 19 Mar 2020 16:49:06 -0400
X-MC-Unique: FpB0YMSKPmKAnaYlwH95Ng-1
Received: by mail-wm1-f71.google.com with SMTP id z16so1496496wmi.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2IYgP7Dgo374I2hcR7mfJ0xCWQFCyIs4UMGGav8EUR8=;
 b=rAnqJgQuqMtzVFnt6uFOcUybYo7oyZI5ShNW+FYko2vUtdCcZAwgHdLvyBn05XyCSM
 WpI1jY23uBr1CUgaNYe4zubmFr7TkeJ17OcxySmfgToHljoo+XylNUJU29gLsZVhoEPn
 nwJrTlgaVMByQsfJzQtOuo2n60BUYJ0bPmSL2VOSDAX83jvoK/YB0dWnoJUCQHsK+ebG
 RV3DyUtNVCET9ccQBmx/+XlMvHTJ7sTM0MppJLkpPDV+nBQtlou4imo+0nQ0CH2TE4+0
 6kwuBITBmYamhQPSvX/zLXBcRpPNtQs8jAnR8dPOCo6MmPCXBJpns5XCmQm1+4NiUU8V
 yv3Q==
X-Gm-Message-State: ANhLgQ2pQLExWn0sLy3vP9r37VxX9d6i4HOA2mMty6CuJ7AvpGtLinyV
 FxInppJ1J9dAAlmt2ciV7N9OHS7DS/pOFG6at0eZ51PPge6UG/6mO00CtGYQ+nPYQi/Fvjk45MZ
 I+b3TvugvLTDq5nd2fSNjO/2yuNIi
X-Received: by 2002:a1c:25c5:: with SMTP id l188mr6103406wml.105.1584650944686; 
 Thu, 19 Mar 2020 13:49:04 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsO2pTH2+cx41gS5GH7I5PZLWN3o5c3baiD54GKbXjMfJzwu4KEYh6mM6YA8aYFWYMy4jDBTw==
X-Received: by 2002:a1c:25c5:: with SMTP id l188mr6103380wml.105.1584650944414; 
 Thu, 19 Mar 2020 13:49:04 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id b5sm5265292wrj.1.2020.03.19.13.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 13:49:03 -0700 (PDT)
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Simon Ser <contact@emersion.fr>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319120028.56d3427a@eldfell.localdomain>
 <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
 <20200319145842.4b7db322@eldfell.localdomain>
 <c8c75790-9b56-9f7f-98d6-1dd2410d70b2@redhat.com>
 <20200319171633.2ee4afa4@eldfell.localdomain>
 <217ab553-9c16-329d-bbbd-02067a2ccd6e@redhat.com>
 <cusw9Ckx7IvPc-ZlCsXaODZMOjTyxPm5__u0Ufcri1Ug8ulqzDDcXZDK2joUHyK8EbwuYV_e0fj5ejMi_4oVfZi6WHgAlKBcz0LZoyvmcjA=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <817f61b4-2b27-fd96-9e42-79ba2a6889bc@redhat.com>
Date: Thu, 19 Mar 2020 21:49:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cusw9Ckx7IvPc-ZlCsXaODZMOjTyxPm5__u0Ufcri1Ug8ulqzDDcXZDK2joUHyK8EbwuYV_e0fj5ejMi_4oVfZi6WHgAlKBcz0LZoyvmcjA=@emersion.fr>
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

On 3/19/20 9:14 PM, Simon Ser wrote:
> On Thursday, March 19, 2020 7:18 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>>>>> The only way to fix that is to stop Weston from putting non-cursor
>>>>> content on the cursor plane.
>>>>
>>>> Correct.
>>>
>>> Is that something that should be done?
>>> If the hotspot property also had a "disabled" value, then Weston could
>>> set the hotspot to disabled when it is using the cursor plane for
>>> non-cursor content and not lose the feature. And of course set hotspot
>>> correctly when it in fact is a cursor (but for what input?).
>>
>> I believe cursor planes in the affected virtual gfx-cards do not
>> really have a mode where they can actually be used as a generic overlay
>> plane, certainly not in a useful manner (if anything works it will all
>> be software emulation), implementing a hotspot disabled mode would be
>> tricky and this would needs to be duplicated in all virtual-gfx cards
>> kms drivers.
>>
>> If I understood Daniel's proposal for how to deal with this properly,
>> then only cursor planes which actually need them would get the new
>> hotspot x/y properties. If we do that then Weston could use the
>> presence of the hotspot x/y properties to detect if it is dealing
>> with a proper hw plane which can also be used as a generic
>> plane; or a virtual-gfx cards cursor-plane, and then just not
>> bother with trying to use the plane as a generic hw plane.
>>
>> Would that work?
> 
> That would need to at least be hidden behind a DRM capability, otherwise
> it would break existing user-space ignoring the hotspot props (e.g.
> current Weston).

Current Weston is already broken, fixing that is what this whole
thread is about.

The virtual gfx-cards drivers simply must now the hotspot for things to
work; and a capability is not going to help here for 2 reasons:

1) Short of disabling seamless mode there is nothing the virtual
gfx-cards drivers can do when clients do not pass the hotspot info;
and in some cases they cannot even do this as it is under control
of a userspace agent process with its own channel to the hypervisor.

2) Most existing clients which obviously do not set this to-be-introduced
capability already pass the hotspot info using the DRM_IOCTL_MODE_CURSOR2
ioctl. Disabling seamless mode when this to-be-introduced capability is
not set would cause a huge regression for all these existing clients.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
