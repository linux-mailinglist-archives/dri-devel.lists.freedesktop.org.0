Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC97FAED607
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 09:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0516F10E3A2;
	Mon, 30 Jun 2025 07:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nvI/uvA0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W7a9Q0kG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nvI/uvA0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W7a9Q0kG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9503710E3A2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 07:46:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B2301F397;
 Mon, 30 Jun 2025 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751269605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/JzfVyUo+u/H1SCo8yk5lWhlhy/dzknXmhZMMQY+SiU=;
 b=nvI/uvA0+ILj9dSg/zfidR+t6uY5UprDb9VCBc06WtSDr+yHgXwK3rfyKPn0X5Ydpz6lU1
 BHlULXNRQsFkdD23lWB5GJYUWX5RRDWwS5ry+kVGFTXfBXibOFtyOpBZdRzIrBylI6s1aH
 6HwUJfQRPzW+s0o4hbLAvYf6bHZLFIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751269605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/JzfVyUo+u/H1SCo8yk5lWhlhy/dzknXmhZMMQY+SiU=;
 b=W7a9Q0kGm2mf2pRGGPelsJmmV/Q81Ukrlj6L69QT7+wcvOHzbPiVyWyn5Et6JInx/rrO6r
 xDfJV5RNsWJzmbAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="nvI/uvA0";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=W7a9Q0kG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751269605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/JzfVyUo+u/H1SCo8yk5lWhlhy/dzknXmhZMMQY+SiU=;
 b=nvI/uvA0+ILj9dSg/zfidR+t6uY5UprDb9VCBc06WtSDr+yHgXwK3rfyKPn0X5Ydpz6lU1
 BHlULXNRQsFkdD23lWB5GJYUWX5RRDWwS5ry+kVGFTXfBXibOFtyOpBZdRzIrBylI6s1aH
 6HwUJfQRPzW+s0o4hbLAvYf6bHZLFIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751269605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/JzfVyUo+u/H1SCo8yk5lWhlhy/dzknXmhZMMQY+SiU=;
 b=W7a9Q0kGm2mf2pRGGPelsJmmV/Q81Ukrlj6L69QT7+wcvOHzbPiVyWyn5Et6JInx/rrO6r
 xDfJV5RNsWJzmbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 903C013983;
 Mon, 30 Jun 2025 07:46:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ru7HIeRAYmjJbAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 30 Jun 2025 07:46:44 +0000
Message-ID: <fd06aed1-bbb5-4b63-80e2-6b7465a45dae@suse.de>
Date: Mon, 30 Jun 2025 09:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
To: Hans de Goede <hdegoede@redhat.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <d8d85415-efc4-4a11-842e-23272cae29f7@suse.de>
 <b94b752c-d7f7-41d6-ac79-d21427f20964@kernel.org>
 <f15a775d-d82f-4ac9-9d88-159ffcf7e81c@suse.de>
 <72aab355-263c-4f63-8818-3d76bd3f6826@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <72aab355-263c-4f63-8818-3d76bd3f6826@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0B2301F397
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,gmx.de,vger.kernel.org,lists.freedesktop.org];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[dt];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01
X-Spam-Level: 
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

Hi

Am 30.06.25 um 09:26 schrieb Hans de Goede:
> Hi,
>
> On 30-Jun-25 8:34 AM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 28.06.25 um 13:50 schrieb Krzysztof Kozlowski:
>>> On 27/06/2025 13:34, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 27.06.25 um 10:08 schrieb Krzysztof Kozlowski:
>>>>> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
>>>>>> Document the interconnects property which is a list of interconnect
>>>>>> paths that is used by the framebuffer and therefore needs to be kept
>>>>>> alive when the framebuffer is being used.
>>>>>>
>>>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>>     Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
>>>>>>     1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
>>>>>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>> @@ -79,6 +79,9 @@ properties:
>>>>>>       power-domains:
>>>>>>         description: List of power domains used by the framebuffer.
>>>>>>     +  interconnects:
>>>>>> +    description: List of interconnect paths used by the framebuffer.
>>>>>> +
>>>>> maxItems: 1, or this is not a simple FB anymore. Anything which needs
>>>>> some sort of resources in unknown way is not simple anymore. You need
>>>>> device specific bindings.
>>>> In this context, 'simple' means that this device cannot change display
>>>> modes or do graphics acceleration. The hardware itself is not
>>>> necessarily simple. As Javier pointed out, it's initialized by firmware
>>> If hardware is not simple, then it needs specific bindings.
>>>
>>>> on the actual hardware. Think of 'VGA-for-ARM'. We need these resources
>>>> to keep the display working.
>>> I don't claim you do not need these resources. I claim device is not
>>> simple thus does not suit rules for generic bindings. Generic bindings
>>> are in general not allowed and we have them only for very, very simple
>>> devices.
>>>
>>> You say this is not simple device, so there you go - specific binding
>>> for this complex (not-simple) device.
>> No, I didn't. I said that the device is simple. I did not say that the device's hardware is simple. Sounds nonsensical, but makes sense here. The simple-framebuffer is just the range of display memory that the firmware configured for printing boot-up messages. We use it for the kernel's output as well.  Being generic and simple is the exact raison d'etre for simple-framebuffer.  (The display property points to the actual hardware, but we don't need it.)
> I believe part of the problem here is the simple part of the simplefb
> name in hindsight that is a mistake and we should have called the thing
> firmware-framebuffer since its goal is to pass along a firmware setup
> framebuffer to the OS for displaying stuff.

I totally feel you. In DRM land, we've also been upset about the naming. 
But well...


>
> As for the argument for having a firmware-framebuffer not being allowed
> because framebuffers are to complex to have a generic binding, that
> ship has long sailed since we already have the simplefb binding.
>
> And since we already have the binding I do not find this not being
> simple a valid technical argument. That is an argument to allow
> having a generic binding at all or to not have it at all, but here
> we already have the binding and this is just about evolving the binding
> with changing hw needs.

Exactly my point.

>
> And again this reminds me very much of the whole clocks / regulators
> addition to simplefb discussion we had over a decade ago. Back then
> we had a huge thread, almost a flamefest with in my memory over
> a 100 emails and back then the only argument against adding them
> was also "it is not simple", which IMHO really is a non argument for
> an already existing binding. Certainly it is not a good technical
> argument.
>
> During the last decade, after clocks and regulators were added to
> the binding. simplefb has been used successfully on millions (billions?)
> handover the firmware framebuffer to the OS for bootsplash use,
> replacing various vendor hacks for this. Disallowing the addition of
> interconnect support to the simplefb binding will only result in
> various vendor hacks appearing in vendor kernels for this, which
> I believe is something which we should try to avoid.

Exactly. And I'd also add that the current way of handling the situation 
is the only feasible one. Simple-framebuffer needs to be generic and 
compatible with existing and future hardware at minimal cost. The way of 
doing so, is to have a few properties, such as clocks, regulators and 
now interconnects, that the firmware clearly tells us about.  If we go 
with per-hardware/per-vendor nodes, simple-framebuffer loses its usefulness.


>
> So as the maintainer of the simplefb kernel driver for over a decade
> I strongly advice the DT maintainers to accept this bindings patch

As the maintainer of the simpledrm driver, I second this.

Best regards
Thomas

> and from my my side this still is:
>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
>
> Regards,
>
> Hans
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

