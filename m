Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B54921BD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 09:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E840112955;
	Tue, 18 Jan 2022 08:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050::465:201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB39112955
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 08:58:22 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4JdN3G6Hy2zQjhc;
 Tue, 18 Jan 2022 09:58:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1642496296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAxLU0mYbTsljTv5PTOd37yr52jarIfsaW4h+9H3yw0=;
 b=airmWeIz27QYgz7d3e/3yuC4vceSng6waZCW0gvaE4E7UYuc1aILplg0H/6OPwoKca2OOW
 p/7g3rC61zZyA1RBswOsiJ8l5paqxrht/2/wAAoURZzmvEqCX88rTeakdn52counfXs2jT
 hLMSuMrfGKbh1N1QsHKVbiOLbfPH+7pBBUz8oEy2W7slhIJVzluhXwckG4F2KCW4qGnTqP
 8GiGjsw99EkV686MEWouB11b1Pgf+c8NzWH72DspddW0o+nCT6VKxRvIcWL1lrQQ4n3BgW
 arDsjb31MI+9alqTWT7WYRzcXVeV7xAo9yEI8Ju/HuE9/f3iLZWJL9vLRxFvVA==
Message-ID: <a922343d-8805-3446-c000-cf7969699823@mailbox.org>
Date: Tue, 18 Jan 2022 09:58:13 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-CA
To: Sven Schnelle <svens@stackframe.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <87bl0amc6s.fsf@x1.stackframe.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-17 19:47, Sven Schnelle wrote:
> 
>>  * There's no new development in fbdev and there are no new
>>    drivers. Everyone works on DRM, which is better in most
>>    regards. The consequence is that userspace is slowly loosing the
>>   ability to use fbdev.
> 
> That might be caused by the fact that no new drivers are accepted for
> fbdev. I wrote a driver for the HP Visualize FX5/10 cards end of last
> year which was rejected for inclusion into fbdev[1].
> 
> Based on your recommendation i re-wrote the whole thing in DRM. This
> works but has several drawbacks:
> 
> - no modesetting. With fbdev, i can nicely switch resolutions with
>   fbset. That doesn't work, and i've been told that this is not supported[2]
> 
> - It is *much* slower than fbset with hardware blitting. I would have to
>   dig out the numbers, but it's in the ratio of 1:15. The nice thing
>   with fbdev blitting is that i get an array of pixels and the
>   foreground/background colors all of these these pixels should have.
>   With the help of the hardware blitting, i can write 32 pixels at once
>   with every 32-bit transfer.
> 
>   With DRM, the closest i could find was DRM_FORMAT_C8, which means one
>   byte per pixel. So i can put 4 pixels into one 32-bit transfer.
> 
>   fbdev also clears the lines with hardware blitting, which is much
>   faster than clearing it with memcpy.
> 
>   Based on your recommendation i also verified that pci coalescing is
>   enabled.
> 
>   These numbers are with DRM's unnatural scrolling behaviour - it seems
>   to scroll several (text)lines at once if it takes to much time. I
>   guess if DRM would scroll line by line it would be even slower.
> 
>   If DRM would add those things - hardware clearing of memory regions,
>   hw blitting for text with a FG/BG color and modesetting i wouldn't
>   care about fbdev at all. But right now, it's working way faster for me.

A DRM driver can implement the same fbdev acceleration hooks as an fbdev driver.

(Most DRM drivers never bothered because the HW is more complex than traditional 2D accelerators, and can't safely be used under all circumstances where fbdev acceleration hooks could get called from. That's not an issue for a traditional 2D accelerator driver though)


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
