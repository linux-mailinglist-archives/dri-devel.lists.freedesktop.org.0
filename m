Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D769517CDFF
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 13:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D256E1E8;
	Sat,  7 Mar 2020 12:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38EE6E1D7
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 12:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583582964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96524gaXW3OQUuzzV2Ksmj9DNjYno8V/mkk0UGdXVFo=;
 b=MPQAozrkBO/9mSq1F+uR7pJCGeOXTtqN6vej8A3IJfLV3i0vQSpnOjBWGR0v9d0pZUyjC/
 bY1sW5LBOeBZpbPfyOVmAZdEYgYNO7pZgMRQ5YWiEyPn/bzkWnz6S76FF/I7bg0XH0WzK5
 4H+OvYEv0K6nvkLPE/AQ4Ewplsc59fY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-fE72Jv-qNLO-mzuUvDyK7g-1; Sat, 07 Mar 2020 07:09:20 -0500
X-MC-Unique: fE72Jv-qNLO-mzuUvDyK7g-1
Received: by mail-wr1-f71.google.com with SMTP id m18so2306089wro.22
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2020 04:09:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=96524gaXW3OQUuzzV2Ksmj9DNjYno8V/mkk0UGdXVFo=;
 b=sZeqUvvnrsw3xRneNcQxJ5EuN6zDLFjZeXi+yeJ434Un2vbBt7XfH8WYe/hPXzsNNO
 mNd4iWMVFmcBkmVNWR9wWkrWAI3YvWCslmR/00U0+UitjCQY6OzjvIlZ+8yaay2X3Z89
 78NeMZ1UoaDFHL8pnqskmypO0DSfx51VDIUvrkbeoM1aWQTwY/6m6c+QupqeSDav/Zn+
 DWxpZ6mroa5ODMT9frQHRwvi3u9Eee7AgAuvzGsC1cfeFgwEeVkQCOAdCKqjkdufVwOE
 U5E3RV0/TLu0KP+Oib/83S1LxHYiq9gV8rr+hCuG6IF0HFbExG+JqsifzpGX+OMbtfoO
 q1pw==
X-Gm-Message-State: ANhLgQ2JrdZFubni18EgH4X1NgTWgJOawg3ZkoI9jTiMEO4iBNmLHLXh
 UX2A2c+ZE9XRbpKEysQfezg0m3Yp/PYo7STgoH/bPgdvZxX/E2vry85MEj41e1n1ZvSq/SdQL89
 cryaeB3jLsxMmlYvEFTo7AqFbWfQD
X-Received: by 2002:adf:f087:: with SMTP id n7mr9131067wro.328.1583582959298; 
 Sat, 07 Mar 2020 04:09:19 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvyZwgDP1aCtmdRdnjCBOmIO3vo8Xs9w8kJpFPnVMboD01vtiDqUWka+YKiV9mza4r6OtS+vA==
X-Received: by 2002:adf:f087:: with SMTP id n7mr9131021wro.328.1583582958424; 
 Sat, 07 Mar 2020 04:09:18 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id b12sm25561163wro.66.2020.03.07.04.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2020 04:09:17 -0800 (PST)
Subject: Re: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
To: Lyude Paul <lyude@redhat.com>, Alex Deucher <alexdeucher@gmail.com>,
 "Lipski, Mikita" <mikita.lipski@amd.com>
References: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
 <CADnq5_OUt5XaJ_Nf23F2zsKeuPgoka8p2S6ny-H2WK==Ncg7vA@mail.gmail.com>
 <b0181c20-017b-7e3f-13c0-3ea5b98cadaa@redhat.com>
 <CADnq5_MjaOD+QrupjQwjdu-MgVZm1sg1x9=4uxdv92u1xuSdvQ@mail.gmail.com>
 <77b812d5-5b87-49b7-87dc-16d50a5666df@redhat.com>
 <aebf675d3c44ed6dc6db670067503a32113ebce9.camel@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a917575e-cba5-2215-377a-fe70919f1eda@redhat.com>
Date: Sat, 7 Mar 2020 13:09:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <aebf675d3c44ed6dc6db670067503a32113ebce9.camel@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude,

On 3/7/20 12:54 AM, Lyude Paul wrote:
> On Wed, 2020-02-26 at 18:52 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 2/26/20 5:05 PM, Alex Deucher wrote:
>>> On Wed, Feb 26, 2020 at 10:43 AM Hans de Goede <hdegoede@redhat.com>
>>> wrote:
>>>> Hi,
>>>>
>>>> On 2/26/20 4:29 PM, Alex Deucher wrote:
>>>>> On Wed, Feb 26, 2020 at 10:16 AM Hans de Goede <hdegoede@redhat.com>
>>>>> wrote:
>>>>>> Hi Lyude and everyone else,
>>>>>>
>>>>>> Lyude I'm mailing you about this because you have done a lot of
>>>>>> work on DP MST, but if this rings a bell to anyone else feel
>>>>>> free to weigh in on this.
>>>>>
>>>>> Might be a duplicate of:
>>>>> https://gitlab.freedesktop.org/drm/amd/issues/1052
>>>>
>>>> Looks like you are right, reverting the commit which the bisect
>>>> from that issue points to:
>>>>
>>>> cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic
>>>> check")
>>>>
>>>> Fixes the issue for me. I will add a comment to the issue.
>>>>
>>>> Note I'm using integrated Intel gfx, so that means that this issue
>>>> definitely is not amdgpu specific.
>>>>
>>>
>>> I'm not too familiar with the mst code, but I wonder if we were
>>> exceeding the bandwidth limits in some setups and it just happened to
>>> work, but now that we enforcing them, they don't which is correct, but
>>> a regression from some users' perspective?
>>
>> I seriously doubt that is the case according to:
>> https://support.lenovo.com/nl/en/solutions/pd029622
>>
>> The gen 2 tb3 dock can handle 2 external
>> displays at 3840*2160@60Hz together with the internal
>> panel being on and both my external displays run at
>> 1920x1080@60 so I'm consuming less then half of the
>> maximum bandwidth.
> 
> OK-so I wasn't actually able to reproduce this issue with my setup (I've got a
> X1 Carbon 7th generation, but I don't have the 2nd generation dock - only the
> first generation dock) but I'm certain I've actually fixed it now, since I
> realized we did not have a very good understanding of how PBN limitations are
> advertised with MST. I rewrote the bandwidth checks again, and in the process
> also found a much more subtle regression that got introduced in 5.6, which
> would sometimes cause MST probing to appear to just stop in it's tracks with
> no messages.
> 
> I cc'd both patch series to you, so I'd recommend applying them both onto your
> kernel and seeing if that fixes your issues. If it still doesn't, then get me
> some kernel logs with:
> 
> drm.debug=0x116 log_buf_len=50M
> 
> And I'll take a closer look. I'm pretty confident this should fix everything
> though :)

I can confirm that the v2 series you posted fixes the problem of only of the 2
FHD monitors on my Lenovo TB3 gen 2 dock lighting up, thank you!

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
