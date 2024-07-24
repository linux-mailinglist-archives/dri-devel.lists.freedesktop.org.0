Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AAD93B86E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 23:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BFA10E189;
	Wed, 24 Jul 2024 21:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="mSsRWAn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Wed, 24 Jul 2024 21:12:58 UTC
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA5310E189
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 21:12:58 +0000 (UTC)
Received: from [192.168.42.20] (p5b16425b.dip0.t-ipconnect.de [91.22.66.91])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 79AEE2FC0085;
 Wed, 24 Jul 2024 23:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1721855135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSuBiC25Iv7WU33qExOepJU2hbMUkxekpHYojew0o54=;
 b=mSsRWAn1DBlFw4vKg7to6nJzuLFmfsZ0yAntXNPp2s1TgmzBQ/ppYnXYfGA2AwFPFB7boI
 mCnyxYXrfFsjhcpizYGfLOq4s3wUsSrbW3gnnnuyAI33aus9vzUJcCEgxCl0RQwIVvez+h
 0GHKH8e6GAFPE7F6e752fvM1wheRWes=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Content-Type: multipart/alternative;
 boundary="------------0BUnHBtI0zR3ri02bT90Habw"
Message-ID: <a349f850-2941-4182-b1c5-8db7c7e3a2e0@tuxedocomputers.com>
Date: Wed, 24 Jul 2024 23:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: In kernel virtual HID devices (was Future handling of complex RGB
 devices on Linux v3)
To: Pavel Machek <pavel@ucw.cz>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Gregor Riepl <onitake@gmail.com>
References: <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
 <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
 <siebkhaauocqkuox73q2e5p2mbsyc7j4gvpzfvt4c3gvncdpap@oxh5pp4gxpuo>
 <870cca8a-1a1b-4d17-874e-a26c30aca2bf@tuxedocomputers.com>
 <ZqE7sk0ZW0q8ueul@duo.ucw.cz>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <ZqE7sk0ZW0q8ueul@duo.ucw.cz>
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

This is a multi-part message in MIME format.
--------------0BUnHBtI0zR3ri02bT90Habw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Am 24.07.24 um 19:36 schrieb Pavel Machek:
> Hi!
>
>>> IMO working with the HID LampArray is the way forward. So I would
>>> suggest to convert any non-HID RGB "LED display" that we are talking
>>> about as a HID LampArray device through `hid_allocate_device()` in the
>>> kernel. Basically what you are suggesting Hans. It's just that you don't
>>> need a formal transport layer, just a child device that happens to be
>>> HID.
>>>
>>> The next question IMO is: do we want the kernel to handle such
>>> machinery? Wouldn't it be simpler to just export the HID device and let
>>> userspace talk to it through hidraw, like what OpenRGB does?
>> That's already part of my plan: The kernels main goal is to give devices a
>> LampArray interface that don't have one already (e.g. because they are no
>> HID devices to begin with).
>>
>> The actual handling of LampArray will happen in userspace.
>>
>> Exception is that maybe it could be useful to implement a small subset of
>> LampArray in a generic leds-subsystem driver for backwards compatibility to
>> userspace applications that only implement that (e.g. UPower). It would
>> treat the whole keyboard as a single led.

LampArray also gives the HID keycode, if applicable, for keyboard leds.

It's the InputBinding field in the LampAttributesResponseReport, see HID Usage 
Tables v1.5 -> 26.3 Lamp Attributes Report.

Kind regards,

Werner

(ps sorry for resend @pavel, hit reply instead of reply all the first time)

> Are you sure LampArray is good-enough interface? OpenRGB exposes
> keycode-to-LED interface, how will that work with LampArray?
>
> Best regards,
> 								Pavel
--------------0BUnHBtI0zR3ri02bT90Habw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi</p>
    <div class="moz-cite-prefix">Am 24.07.24 um 19:36 schrieb Pavel
      Machek:<br>
    </div>
    <blockquote type="cite" cite="mid:ZqE7sk0ZW0q8ueul@duo.ucw.cz">
      <pre class="moz-quote-pre" wrap="">Hi!

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">IMO working with the HID LampArray is the way forward. So I would
suggest to convert any non-HID RGB "LED display" that we are talking
about as a HID LampArray device through `hid_allocate_device()` in the
kernel. Basically what you are suggesting Hans. It's just that you don't
need a formal transport layer, just a child device that happens to be
HID.

The next question IMO is: do we want the kernel to handle such
machinery? Wouldn't it be simpler to just export the HID device and let
userspace talk to it through hidraw, like what OpenRGB does?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That's already part of my plan: The kernels main goal is to give devices a
LampArray interface that don't have one already (e.g. because they are no
HID devices to begin with).

The actual handling of LampArray will happen in userspace.

Exception is that maybe it could be useful to implement a small subset of
LampArray in a generic leds-subsystem driver for backwards compatibility to
userspace applications that only implement that (e.g. UPower). It would
treat the whole keyboard as a single led.</pre>
      </blockquote>
    </blockquote>
    <p>LampArray also gives the HID keycode, if applicable, for keyboard
      leds.<br>
    </p>
    <p>It's the InputBinding field in the LampAttributesResponseReport,
      see <span
style="left: 33.07%; top: 16.79%; font-size: calc(var(--scale-factor)*24.79px); font-family: sans-serif; transform: scaleX(0.959285);"
        role="presentation" dir="ltr">HID Usage Tables v1.5 -&gt; 26.3
        Lamp Attributes Report.</span></p>
    <p><span
style="left: 33.07%; top: 16.79%; font-size: calc(var(--scale-factor)*24.79px); font-family: sans-serif; transform: scaleX(0.959285);"
        role="presentation" dir="ltr">Kind regards,</span></p>
    <p><span
style="left: 33.07%; top: 16.79%; font-size: calc(var(--scale-factor)*24.79px); font-family: sans-serif; transform: scaleX(0.959285);"
        role="presentation" dir="ltr">Werner</span></p>
    <p><span
style="left: 33.07%; top: 16.79%; font-size: calc(var(--scale-factor)*24.79px); font-family: sans-serif; transform: scaleX(0.959285);"
        role="presentation" dir="ltr">(ps sorry for resend @pavel, hit
        reply instead of reply all the first time)<br>
      </span></p>
    <blockquote type="cite" cite="mid:ZqE7sk0ZW0q8ueul@duo.ucw.cz">
      <pre class="moz-quote-pre" wrap="">
Are you sure LampArray is good-enough interface? OpenRGB exposes
keycode-to-LED interface, how will that work with LampArray?

Best regards,
								Pavel
</pre>
    </blockquote>
  </body>
</html>

--------------0BUnHBtI0zR3ri02bT90Habw--
