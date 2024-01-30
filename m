Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF8842C68
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 20:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31057113451;
	Tue, 30 Jan 2024 19:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF1B113451
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 19:08:44 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 23BFC2FC004A;
 Tue, 30 Jan 2024 20:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1706641722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LbhUeHVixZ6fHRGYU1VVwvcn9Vo4T6Wzvv+6eidxVh0=;
 b=eblZUCnpERjN7epF9d579T4ea980hdkcfbiNS7lWSKcEn66+MJOtJ9uQNaJZvn5qfRt4X9
 1Z6fJamdKuUtzJ7grIAplzCNz/t9/k6nP5gEunaN544POJRg62gA93IRcMfyAWqWRrCyKx
 H+dD1Gh4Ul1iX0LWZj4tlRq4K2g+z9Y=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
Date: Tue, 30 Jan 2024 20:08:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>
References: <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
 <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 30.01.24 um 19:35 schrieb Hans de Goede:
> Hi,
>
> On 1/30/24 19:09, Werner Sembach wrote:
>> Hi Hans,
>>
>> resend because Thunderbird htmlified the mail :/
> I use thunderbird too. If you right click on the server name
> and then go to "Settings" -> "Composition & Addressing"
> and then uncheck "Compose messages in HTML format"
> I think that should do the trick.
Can't set this globally or other people will complain that my replies delete 
company logos in signatures xD. But usually the auto detection of Thunderbird works.
>
>> Am 30.01.24 um 18:10 schrieb Hans de Goede:
>>> Hi Werner,
>>>
>>> On 1/30/24 12:12, Werner Sembach wrote:
>>>> Hi Hans,
>>>>
>>>> Am 29.01.24 um 14:24 schrieb Hans de Goede:
>> <snip>
>>>> I think that are mostly external keyboards, so in theory a possible cut could also between built-in and external devices.
>>> IMHO it would be better to limit /dev/rgbledstring use to only
>>> cases where direct userspace control is not possible and thus
>>> have the cut be based on whether direct userspace control
>>> (e.g. /dev/hidraw access) is possible or not.
>> Ack
>>
>> <snip>
>>
>>>> So also no basic driver? Or still the concept from before with a basic 1 zone only driver via leds subsystem to have something working, but it is unregistered by userspace, if open rgb wants to take over for fine granular support?
>>> Ah good point, no I think that a basic driver just for kbd backlight
>>> brightness support which works with the standard desktop environment
>>> controls for this makes sense.
>>>
>>> Combined with some mechanism for e.g. openrgb to fully take over
>>> control as discussed. It is probably a good idea to file a separate
>>> issue with the openrgb project to discuss the takeover API.
>> I think the OpenRGB maintainers are pretty flexible at that point, after all it's similar to enable commands a lot of rgb devices need anyway. I would include it in a full api proposal.
> Ack.
>
>> On this note: Any particular reason you suggested an ioctl interface instead of a sysfs one? (Open question as, for example, I have no idea what performance implications both have)
> sysfs APIs typically have a one file per setting approach,
> so for effects with speed and multiple-color settings you
> would need a whole bunch of different files and then you
> would either need to immediately apply every setting,
> needing multiple writes to the hw for a single effect
> update, or have some sort of "commit" sysfs attribute.
>
> With ioctls you can simply provide all the settings
> in one call, which is why I suggested using ioctls.

Ack

If the static mode update is fast enough to have userspace controlled 
animations, OpenRGB is calling that direct mode. Is it feasible to send 30 or 
more ioctls per second for such an direct mode? Or should this spawn a special 
purpose sysfs file that is kept open by userspace to continuously update the 
keyboard?

>
> Regards,
>
> Hans
>
>
>
Regards,

Werner

