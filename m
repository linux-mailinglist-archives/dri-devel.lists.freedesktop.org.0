Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E3F4A751E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 17:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6970710E2C0;
	Wed,  2 Feb 2022 16:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900AC10E2C0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 16:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HjIuj8tK/i3bU/jTctNAzn1hnRcxPQQLduo2krywtkU=; b=EH3rg7kdaPqsCQ5aP0CO20CfG5
 Nr+UWWGO7Y6S66ksZxEMOoGILOR1bK+G9d42uuu6ambVde60Hc7LD81TgLh2TObm2TVCRfUkG7ihu
 YXdwsmMZ5CDcWrkl3HdRzDoHqm5JK0pmNBJz+NdYnExIGn3Jd4U3louPhjPJ6NhC4bZc6ZFgOnC1P
 U8F/sqnpOAZ0jum9Po/llG943XMqWBeUDicmOiKZn64jsReQh71GwLPdSJqHFTsK/Kbnhr2bI2MrL
 /lLlAFOowI7vH218ri6Bsr7CpotdaR6QA5afJF6O/fHegYBvp6wFJ/Dcu9rfrlOO9na7n3Ilb54oL
 cHC6hYSw==;
Received: from [2a01:799:95e:a400:cca0:57ac:c55d:a485] (port=60100)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nFI3E-0000np-3N; Wed, 02 Feb 2022 17:00:08 +0100
Message-ID: <7eb83dae-7dd9-1ffc-93ce-b47429ec510b@tronnes.org>
Date: Wed, 2 Feb 2022 17:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com> <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
 <4966d03e-ee0c-5130-3819-05a90a8f6d06@suse.de>
 <c6100ec3-b511-17cf-c542-e124c14fb334@tronnes.org>
 <20220202170455.3eece5a3@eldfell>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220202170455.3eece5a3@eldfell>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 02.02.2022 16.04, skrev Pekka Paalanen:
> On Wed, 2 Feb 2022 10:45:42 +0100
> Noralf Trønnes <noralf@tronnes.org> wrote:
> 
>> Den 02.02.2022 10.14, skrev Thomas Zimmermann:
>>> Hi Noralf,
>>>
>>> since you're here, I'll just hijack the discussion to ask something only
>>> semi-related.
>>>
>>> IIRC the gud driver doesn't update the display immediately during atomic
>>> commits. Instead, it instructs a helper thread to do the update. What's
>>> the rational behind this design? Is that something we should adopt for
>>> other drivers that operate over slow buses (USB, I2C, etc)? Would this
>>> be relevant for the ssd1307 driver?
>>>   
>>
>> Async flushing is only necessary on multi display setups where there's
>> only one rendering loop for all the displays. I saw what tiny/gm12u320.c
>> did and Hans gave me the rationale. The SPI drivers run flushing inline.
>> Info on the gud wiki:
>> https://github.com/notro/gud/wiki/Linux-Host-Driver#asynchronous-flushing
> 
> Hi,
> 
> please also consider that userspace may throttle to the KMS pageflip
> events. If the pageflip event is immediate from submitting a flip, that
> could mean userspace will be repainting in a busy-loop, like 1 kHz.
> However, I remember something about virtual KMS drivers doing exactly
> this, and there being something that tells userspace to throttle itself
> instead of depending on pageflip completions. I just forget how that is
> supposed to work, and I'm fairly sure that e.g. Weston does not behave
> well there.
> 
> Unfortunately, the pageflip event is also what synchronises FB usage.
> Once flipping in a new FB completed, the old FB is free for re-use.
> But, if the kernel is still copying out from the old FB, userspace may
> partially overwrite the contents, temporarily leading to an incomplete
> or too new image on screen. Do you have anything to prevent that?
> 

Unfortunately not. One solution would be to make a buffer copy during
the flip and do the USB transfer async but I haven't looked into that.
My plan is to wait and see what problems users report back before trying
to fix anything.

Noralf.
