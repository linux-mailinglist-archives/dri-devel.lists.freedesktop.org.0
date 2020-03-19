Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0494918C365
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 23:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005BC6EAA7;
	Thu, 19 Mar 2020 22:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCB36EAA7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 22:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 2A41F3F5AF;
 Thu, 19 Mar 2020 23:57:12 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=JbvyQBgx; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHbquDyoAtVF; Thu, 19 Mar 2020 23:57:11 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id F2D303F5A0;
 Thu, 19 Mar 2020 23:57:09 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 44845360413;
 Thu, 19 Mar 2020 23:57:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1584658629; bh=1X89mZ7ALc+SMgByMftQRmR4IuJIqlO1Ahqhz2ZhSOE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JbvyQBgxb6pz7q7V/N+kkBYp+Oor8aU2e8z9qvAGN06F5blZoXnUSnQW4hq2K8t+q
 NBVSkcwXD6aUmaKK8jmSr6Y0rdZwBQ9P3WZ3uIgjLAmuwXq39lkgWY/wjeHiU17grU
 DZS0svAdSh4U8X6YyeD59usq2Y3SSCiqI4c21dQU=
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Simon Ser <contact@emersion.fr>, Hans de Goede <hdegoede@redhat.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319120028.56d3427a@eldfell.localdomain>
 <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
 <20200319145842.4b7db322@eldfell.localdomain>
 <c8c75790-9b56-9f7f-98d6-1dd2410d70b2@redhat.com>
 <20200319171633.2ee4afa4@eldfell.localdomain>
 <217ab553-9c16-329d-bbbd-02067a2ccd6e@redhat.com>
 <cusw9Ckx7IvPc-ZlCsXaODZMOjTyxPm5__u0Ufcri1Ug8ulqzDDcXZDK2joUHyK8EbwuYV_e0fj5ejMi_4oVfZi6WHgAlKBcz0LZoyvmcjA=@emersion.fr>
 <817f61b4-2b27-fd96-9e42-79ba2a6889bc@redhat.com>
 <da1Sy2AQg2pW3xtrqoF7yjUF5NpTkwSyooPGrnbBX8P5AEM283ODYI-kLYU1R76B27Zx7WT3uTg3s2B9ko1-KVTYRM7S0dpkjSPJM-Ehm8w=@emersion.fr>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <3f0b858c-aa1b-2391-a936-6d1c8e36c0df@shipmail.org>
Date: Thu, 19 Mar 2020 23:57:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <da1Sy2AQg2pW3xtrqoF7yjUF5NpTkwSyooPGrnbBX8P5AEM283ODYI-kLYU1R76B27Zx7WT3uTg3s2B9ko1-KVTYRM7S0dpkjSPJM-Ehm8w=@emersion.fr>
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
Cc: =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/19/20 10:07 PM, Simon Ser wrote:
>>>>> Is that something that should be done?
>>>>> If the hotspot property also had a "disabled" value, then Weston could
>>>>> set the hotspot to disabled when it is using the cursor plane for
>>>>> non-cursor content and not lose the feature. And of course set hotspot
>>>>> correctly when it in fact is a cursor (but for what input?).
>>>> I believe cursor planes in the affected virtual gfx-cards do not
>>>> really have a mode where they can actually be used as a generic overlay
>>>> plane, certainly not in a useful manner (if anything works it will all
>>>> be software emulation), implementing a hotspot disabled mode would be
>>>> tricky and this would needs to be duplicated in all virtual-gfx cards
>>>> kms drivers.
>>>>
>>>> If I understood Daniel's proposal for how to deal with this properly,
>>>> then only cursor planes which actually need them would get the new
>>>> hotspot x/y properties. If we do that then Weston could use the
>>>> presence of the hotspot x/y properties to detect if it is dealing
>>>> with a proper hw plane which can also be used as a generic
>>>> plane; or a virtual-gfx cards cursor-plane, and then just not
>>>> bother with trying to use the plane as a generic hw plane.
>>>>
>>>> Would that work?
>>> That would need to at least be hidden behind a DRM capability, otherwise
>>> it would break existing user-space ignoring the hotspot props (e.g.
>>> current Weston).
>> Current Weston is already broken, fixing that is what this whole
>> thread is about.
>>
>> The virtual gfx-cards drivers simply must now the hotspot for things to
>> work; and a capability is not going to help here for 2 reasons:
>>
>> 1) Short of disabling seamless mode there is nothing the virtual
>> gfx-cards drivers can do when clients do not pass the hotspot info;
>> and in some cases they cannot even do this as it is under control
>> of a userspace agent process with its own channel to the hypervisor.
>>
>> 2) Most existing clients which obviously do not set this to-be-introduced
>> capability already pass the hotspot info using the DRM_IOCTL_MODE_CURSOR2
>> ioctl. Disabling seamless mode when this to-be-introduced capability is
>> not set would cause a huge regression for all these existing clients.
> Compositors which don't support the hotspot prop are and will continue to break
> seamless mode. Setting the prop will never be mandatory, because all user-space
> today doesn't do it.
>
> Since we need to update all user-space to add support for this prop, it would
> be a good idea to recognize user-space that doesn't support it. Doing something
> sensible with user-space that doesn't support the prop is up to the virtual
> driver.
>
> If we have a capability, the virtual driver could for instance not advertise a
> cursor plane at all if user-space won't correctly set the hotspot anyway.

What compositors do we have around today that wouldn't want to support 
setting the hotspot correctly? Do we like to keep them that way, and do 
we want to encourage any new compositors to also not do this properly?

/Thomas


>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
