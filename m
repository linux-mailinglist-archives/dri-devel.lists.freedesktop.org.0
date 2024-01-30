Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC0842B69
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 19:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2547510F949;
	Tue, 30 Jan 2024 18:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B669010F949
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 18:01:40 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id D9DA42FC004A;
 Tue, 30 Jan 2024 19:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1706637698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m5sfuQILfLOerVrtTWYmRWOZtGUV/i0IVy5okLktJNQ=;
 b=jWxqjecsCc51V0CVLAPDNVUKU8noC1gbY5tzweRyrXOIgEhwniLxUpSfUZNaYLP+pEbtzx
 2OMRX5EV/VgO+x363083Q+BCh6soKsbHIuUHpiMmIn6jV+mpbmldUdRG1mMTZu21nQIpmy
 YU9qh5xlY1EuVzbbLKxuz5xBS/FsqKY=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Content-Type: multipart/alternative;
 boundary="------------fyo0y9Nj9WkAr2V0zf77Mk2j"
Message-ID: <d7933cbf-28c0-45cd-8c98-2eec915f46ba@tuxedocomputers.com>
Date: Tue, 30 Jan 2024 19:01:37 +0100
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
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
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

This is a multi-part message in MIME format.
--------------fyo0y9Nj9WkAr2V0zf77Mk2j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans,

Am 30.01.24 um 18:10 schrieb Hans de Goede:
> Hi Werner,
>
> On 1/30/24 12:12, Werner Sembach wrote:
>> Hi Hans,
>>
>> Am 29.01.24 um 14:24 schrieb Hans de Goede:
<snip>
>> I think that are mostly external keyboards, so in theory a possible cut could also between built-in and external devices.
> IMHO it would be better to limit /dev/rgbledstring use to only
> cases where direct userspace control is not possible and thus
> have the cut be based on whether direct userspace control
> (e.g. /dev/hidraw access) is possible or not.

Ack

<snip>

>> So also no basic driver? Or still the concept from before with a basic 1 zone only driver via leds subsystem to have something working, but it is unregistered by userspace, if open rgb wants to take over for fine granular support?
> Ah good point, no I think that a basic driver just for kbd backlight
> brightness support which works with the standard desktop environment
> controls for this makes sense.
>
> Combined with some mechanism for e.g. openrgb to fully take over
> control as discussed. It is probably a good idea to file a separate
> issue with the openrgb project to discuss the takeover API.

I think the OpenRGB maintainers are pretty flexible at that point, after all 
it's similar to enable commands a lot of rgb devices need anyway. I would 
include it in a full api proposal.

On this note: Any particular reason you suggested an ioctl interface instead of 
a sysfs one? (Open question as, for example, I have no idea what performance 
implications both have)

<snip>

>> I opened an issue regarding this:https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916
> Great, thank you.
First replies are in.
> Regards,
>
> Hans

Kind regards,

Werner

--------------fyo0y9Nj9WkAr2V0zf77Mk2j
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Hans,<br>
    </p>
    <div class="moz-cite-prefix">Am 30.01.24 um 18:10 schrieb Hans de
      Goede:<br>
    </div>
    <blockquote type="cite"
      cite="mid:952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com">
      <pre class="moz-quote-pre" wrap="">Hi Werner,

On 1/30/24 12:12, Werner Sembach wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Hans,

Am 29.01.24 um 14:24 schrieb Hans de Goede:
</pre>
      </blockquote>
    </blockquote>
    &lt;snip&gt;<br>
    <blockquote type="cite"
      cite="mid:952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I think that are mostly external keyboards, so in theory a possible cut could also between built-in and external devices.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
IMHO it would be better to limit /dev/rgbledstring use to only
cases where direct userspace control is not possible and thus
have the cut be based on whether direct userspace control
(e.g. /dev/hidraw access) is possible or not.</pre>
    </blockquote>
    <p>Ack</p>
    <p><span style="white-space: pre-wrap">&lt;snip&gt;</span></p>
    <blockquote type="cite"
      cite="mid:952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">So also no basic driver? Or still the concept from before with a basic 1 zone only driver via leds subsystem to have something working, but it is unregistered by userspace, if open rgb wants to take over for fine granular support?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ah good point, no I think that a basic driver just for kbd backlight
brightness support which works with the standard desktop environment
controls for this makes sense.

Combined with some mechanism for e.g. openrgb to fully take over
control as discussed. It is probably a good idea to file a separate
issue with the openrgb project to discuss the takeover API.</pre>
    </blockquote>
    <p>I think the OpenRGB maintainers are pretty flexible at that
      point, after all it's similar to enable commands a lot of rgb
      devices need anyway. I would include it in a full api proposal.</p>
    <p>On this note: Any particular reason you suggested an ioctl
      interface instead of a sysfs one? (Open question as, for example,
      I have no idea what performance implications both have)</p>
    <p><span style="white-space: pre-wrap">&lt;snip&gt;
</span></p>
    <blockquote type="cite"
      cite="mid:952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I opened an issue regarding this: <a class="moz-txt-link-freetext" href="https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916">https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Great, thank you.</pre>
    </blockquote>
    First replies are in.<span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com">
      <pre class="moz-quote-pre" wrap="">Regards,

Hans</pre>
    </blockquote>
    <p>Kind regards,</p>
    <p>Werner<span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------fyo0y9Nj9WkAr2V0zf77Mk2j--
