Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D859652F36
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 11:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F93D10E44B;
	Wed, 21 Dec 2022 10:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB4E10E44A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:15:18 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1p7w80-0004GU-RS; Wed, 21 Dec 2022 11:15:12 +0100
Message-ID: <8bcf04de-47eb-cb3c-4589-ba5a67477977@leemhuis.info>
Date: Wed, 21 Dec 2022 11:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct
Content-Language: en-US, de-DE
To: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>, zackr@vmware.com
References: <CAPDLWs_7331QyD_Mnb9k1LrBsYopeVVbd9zDM_2R-xCoG272PA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAPDLWs_7331QyD_Mnb9k1LrBsYopeVVbd9zDM_2R-xCoG272PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1671617718;
 c1ff6228; 
X-HE-SMSGID: 1p7w80-0004GU-RS
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
Cc: airlied@linux.ie, hdegoede@redhat.com, Linux-graphics-maintainer@vmware.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, this is your Linux kernel regression tracker. The relevant code here
is not my area of expertise, nevertheless a few questions:

On 21.12.22 03:23, Kaiwan N Billimoria wrote:
> [REGRESSION] ?

> Testing with 6.1, I find the same issue - VirtualBox VMs seem to hang
> on boot, though the kernel has this patch applied of course...

Maybe I'm missing something, but what made you assume that it's the same
issue? The fix for that issue talked about "garbage" in some structures
that "can cause random failures during the bringup of the fbcon." Yeah,
maybe that ca result in a hang, but I didn't see it that thread (but
maybe I missed)

> Am running VirtualBox 7.0.4 on an x86_64 Linux (Ubuntu 22.04.1) host;
> the system hangs on boot with the screen
> going blank.

A bit more details would be helpful. For example: is anything printed at
all before the system hangs? What's the last kernel that worked for you
(and is the newer kernel using a similar build configuration)? Which
graphics adapater did you configure in VirtualBox?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
