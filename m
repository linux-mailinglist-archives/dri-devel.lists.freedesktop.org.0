Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746DE1727DB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9ED6ECCE;
	Thu, 27 Feb 2020 18:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D846ECCE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582829143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVuKwPMK/eXRF4YBEvxtVfssRdB3IYBa8t0n9NIPWaY=;
 b=MDaBGn7vsAc2MIrnUEE1llsZ76vTN+2LM/zgdPLDI5fVzd2js+xFt6cazaBET4FO/uqcBy
 4nTfxtQ5NPlTzu7/mPho1Vb7XL5efFwmC+Z7w4Fg8iMDgA9EjcHg2gV+Du1UJZ0/c6iJsa
 nSpOPhouMX+hgV6BhfoaxuZJ/idDBwU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-xG-771-eN8yzXVcvveVbVQ-1; Thu, 27 Feb 2020 13:45:41 -0500
X-MC-Unique: xG-771-eN8yzXVcvveVbVQ-1
Received: by mail-wr1-f69.google.com with SMTP id r1so200294wrc.15
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:45:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iVuKwPMK/eXRF4YBEvxtVfssRdB3IYBa8t0n9NIPWaY=;
 b=KzLDMjVEKpdq9RPWcyNrN5Wy43Q4FYOiJXNHop3q0CDxZf/pDT+d7UrQDk99fcYzIs
 HcpyE60F3jxq0qwfx4E70zzqQxu4vr8wA3az73F2gTHqbuslOEUQmWFW1gxv85yW/6iJ
 DlcqHB8p9eNwQUJac6O7vd5Ch2lG0CI/sU1iCOAL/I1NQkPz+9W+vaTGkTEK6f3rhRFu
 hULWQMKl+crwU8H4jVkwnz9gQWMwvtrdfEhxtUe5VZ+tfZJrXUeMQTkauCFud88TztfP
 V8lmBZMyJZm2+hppbZH6WUke4jdafZr16B1zmB7SSoqchLjfOek4a4dJhm43nVJc53kg
 NldQ==
X-Gm-Message-State: APjAAAUD1mTADpHwbSv3t4GcC/DVS3PyORFLNdsyFaK2muDRQVtZQq1A
 w8NVpawXG5hW5A0NayzwP9aL4vwFhKRjDi3cF+N/SXy4p5WuDGK8ZvXwSZDfuFM4/kLmMmFoU97
 VzZIGMMCXRjVAgFDqKq5aoVnFd5bm
X-Received: by 2002:adf:facc:: with SMTP id a12mr255976wrs.100.1582829139826; 
 Thu, 27 Feb 2020 10:45:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqzS7iwolLIglWsHkFQf0lunQH/92lmCChlV7hbhGP0V+6bufdLAND2rjW3JWdum8vxXoHyNTg==
X-Received: by 2002:adf:facc:: with SMTP id a12mr255959wrs.100.1582829139570; 
 Thu, 27 Feb 2020 10:45:39 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id v16sm8831596wml.11.2020.02.27.10.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 10:45:38 -0800 (PST)
Subject: Re: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
To: Lyude Paul <lyude@redhat.com>
References: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
 <cd775055fc4450bba045cfbde66d45502e16162c.camel@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3bcd1280-0690-0193-31ef-36a937290cfb@redhat.com>
Date: Thu, 27 Feb 2020 19:45:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cd775055fc4450bba045cfbde66d45502e16162c.camel@redhat.com>
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

Hi,

On 2/27/20 7:41 PM, Lyude Paul wrote:
> hi - I almost certainly know the solution to this, the patches that we got
> from amd to do bandwidth checking in the DP MST helpers don't actually work
> correctly in a lot of cases and I need to fix them. I've just been busy on PTO
> and only just got back today, and have been busy with fixing a lot of RHEL
> stuff at the same time. I'll take a closer look at this soonb

Great, I'm a bit worried about the timing for getting this fixed though. We are
not that far into the cycle yet, but still I have the feeling it might be better
to just revert the commit triggering the probably pre-existing problems here
and then queue up the necessary fixes + a new version of that commit when
we have everything in place ?

This way you can take your time to fix this properly instead of having to
do a rush job to fix the regression before 5.6 ships. I think rushing things
never is a good idea. So my vote on this goes to just reverting the commit
triggering this for now and taking our time to get this right.

Regards,

Hans





> 
> On Wed, 2020-02-26 at 16:15 +0100, Hans de Goede wrote:
>> Hi Lyude and everyone else,
>>
>> Lyude I'm mailing you about this because you have done a lot of
>> work on DP MST, but if this rings a bell to anyone else feel
>> free to weigh in on this.
>>
>> I'm currently using a Lenovo X1 7th gen + a Lenovo TB3 gen 2 dock
>> as my daily rider for testing purposes. When 5.6-rc1 came out I
>> noticed that only 1 of the 2 1920x1080@60 monitors on the dock
>> lights up.
>>
>> There are no kernel errors in the logs, but mutter/gnome-shell says:
>>
>> gnome-shell[1316]: Failed to post KMS update: Page flip of 93 failed
>>
>> With 93 being the crtc-id of the crtc used for the monitor which is
>> displaying black. Since then I've waited for 5.6-rc3 hoping that a
>> fix was already queued up, but 5.6-rc3 still has this problem.
>>
>> gnome-shell does behave as if all monitors are connected, so the
>> monitor is seen, but we are failing to actually send any frames
>> to it.
>>
>> I've put a log collected with drm.debug=0x104 here:
>> https://fedorapeople.org/~jwrdegoede/drm-debug.log
>>
>> This message stands out as pointing to the likely cause of this problem:
>>
>> [    3.309061] [drm:intel_dump_pipe_config [i915]] MST master transcoder:
>> <invalid>
>>
>> Regards,
>>
>> Hans
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
