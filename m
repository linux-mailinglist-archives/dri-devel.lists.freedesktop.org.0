Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A704B860CD7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 09:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6D410EB35;
	Fri, 23 Feb 2024 08:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="uiGUC3PN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECAE10EB35
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 08:33:43 +0000 (UTC)
Received: from [192.168.42.20] (pd9e59c8a.dip0.t-ipconnect.de
 [217.229.156.138]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id D55A92FC0048;
 Fri, 23 Feb 2024 09:33:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1708677222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hyg/6mIbbTS+jgvBpDapIOM2QZ8XaLynxTsM3xRcdr0=;
 b=uiGUC3PNuqR8MRaR8BM4zMwX+uJOlh79kFVIufcDk4kXGjhe/w44A2tFFVubAtH+YXlD8i
 WXoK/JYaw9BqwItu0YEa6blEf3H8bn1cudUoBjecz7Jf1hTD/YVRKmZG8ur14Sx+onhp71
 Nxa8LUFPzUedZJHyTXFiJZi76cLcdTc=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <38b6998a-eb5c-44b6-95c9-260bd84046af@tuxedocomputers.com>
Date: Fri, 23 Feb 2024 09:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v2
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>
Cc: Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 21.02.24 um 23:17 schrieb Pavel Machek:
> Hi!
>
>> so after more feedback from the OpenRGB maintainers I came up with an even
>> more generic proposal:
>> https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916#note_1753072869
>>> evaluate-set-command ioctl taking:
>>> {
>>>      enum command                /* one of supported_commands */
>>>      union data
>>>      {
>>>          char raw[3072],
>>>          {
>>>              <input struct for command 0>
>>>          },
> Yeah, so ... this is not a interface. This is a backdoor to pass
> arbitrary data. That's not going to fly.
>
> For keyboards, we don't need complete new interface; we reasonable
> extensions over existing display APIs -- keyboards are clearly 2D.

Maybe we should look on this from a users perspective: Running custom Animation 
(i.e. where treating it as a display would be helpfull) is only >one< of the 
ways a user might want to use the keyboard backlight.

Equally viable are for example:
- Having it mono colored.
- Playing a hardware effect
- Playing a hardware effect on one side of the keyboard while having the other 
side of the keyboard playing a custom animation (As I learned from the OpenRGB 
maintainers: There are keyboards which allow this)

There is no reason to define a custom animation as the default and then just 
bolt the other options on top as it might not even be possible for some devices 
where the firmware is plainly to slow for custom animations.

Also I still think a 2*2, 1*3 or even 1*1 matrix is not a display, coming back 
aground to the earlier point where I want to implement this for keyboard first, 
but this discussion is also thought to find a way that works for all complex RGB 
devices. And I don't think it is a good idea find a way that works for keyboards 
and then introduce again something completely new for other device categories.

>
> Best regards,
> 								Pavel

Best regards,

Werner

