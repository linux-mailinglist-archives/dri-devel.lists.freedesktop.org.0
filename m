Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7276FA43E82
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6CC10E652;
	Tue, 25 Feb 2025 11:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vXQI9//s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vsO1ypZr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vXQI9//s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vsO1ypZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1604E10E652
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:59:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9789F2116A;
 Tue, 25 Feb 2025 11:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740484784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ulZ455PIMbfE9cqopcfTAI64PTcJtYeUpNcHevWOWFQ=;
 b=vXQI9//sBOarQ+HrIaNRtjL0JIu4j15qZiJPWINujBs60uS7oeuBsnmIpjvUT5ObyXM9W/
 dKnV95o7evQX+H9OeZ+eIBjK+Pz/FedUgHZcBJsiGyejQqe759la3lE5GHOsPWOi4arvbC
 BtbUxMAyVWURhsRFrqaBEEkX/dptalE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740484784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ulZ455PIMbfE9cqopcfTAI64PTcJtYeUpNcHevWOWFQ=;
 b=vsO1ypZrXXy3l3LQqZfqLXdrVkcDMWnx/bs7N9v93tAYNIqfcZ2s8R0eXu0LADm0iokJ78
 /dq7FZ5OrwxuoGCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="vXQI9//s";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vsO1ypZr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740484784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ulZ455PIMbfE9cqopcfTAI64PTcJtYeUpNcHevWOWFQ=;
 b=vXQI9//sBOarQ+HrIaNRtjL0JIu4j15qZiJPWINujBs60uS7oeuBsnmIpjvUT5ObyXM9W/
 dKnV95o7evQX+H9OeZ+eIBjK+Pz/FedUgHZcBJsiGyejQqe759la3lE5GHOsPWOi4arvbC
 BtbUxMAyVWURhsRFrqaBEEkX/dptalE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740484784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ulZ455PIMbfE9cqopcfTAI64PTcJtYeUpNcHevWOWFQ=;
 b=vsO1ypZrXXy3l3LQqZfqLXdrVkcDMWnx/bs7N9v93tAYNIqfcZ2s8R0eXu0LADm0iokJ78
 /dq7FZ5OrwxuoGCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BF7D13888;
 Tue, 25 Feb 2025 11:59:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id imxkEbCwvWfYRgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Feb 2025 11:59:44 +0000
Message-ID: <9efdb233-2bca-4a5d-a6bc-de81fa96efb3@suse.de>
Date: Tue, 25 Feb 2025 12:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Aditya Garg <gargaditya08@live.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <PN3PR01MB9597BF95EC490951D75748F1B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z72foRL3diil9icd@smile.fi.intel.com>
 <PN3PR01MB9597B5ECF47B04E3201DD56BB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z72jHeCG6-ByMyhh@smile.fi.intel.com>
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
In-Reply-To: <Z72jHeCG6-ByMyhh@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9789F2116A
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,live.com]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_EQ_ADDR_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,kodeit.net,vger.kernel.org,lists.freedesktop.org];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; DKIM_TRACE(0.00)[suse.de:+];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid, intel.com:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
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

Am 25.02.25 um 12:01 schrieb andriy.shevchenko@linux.intel.com:
> On Tue, Feb 25, 2025 at 10:48:53AM +0000, Aditya Garg wrote:
>>> On 25 Feb 2025, at 4:17 PM, andriy.shevchenko@linux.intel.com wrote:
>>> On Tue, Feb 25, 2025 at 10:36:03AM +0000, Aditya Garg wrote:
>>>>>> On 25 Feb 2025, at 4:03 PM, andriy.shevchenko@linux.intel.com wrote:
>>>>> On Tue, Feb 25, 2025 at 10:09:42AM +0000, Aditya Garg wrote:
> ...
>
>>>>>> +static int appletbdrm_probe(struct usb_interface *intf,
>>>>>> +                const struct usb_device_id *id)
>>>>>> +{
>>>>>> +    struct usb_endpoint_descriptor *bulk_in, *bulk_out;
>>>>>> +    struct device *dev = &intf->dev;
>>>>>> +    struct appletbdrm_device *adev;
>>>>>> +    struct drm_device *drm;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
>>>>>> +    if (ret) {
>>>>>> +        drm_err(drm, "Failed to find bulk endpoints\n");
>>>>> This is simply wrong (and in this case even lead to crash in some circumstances).
>>>>> drm_err() may not be used here. That's my point in previous discussions.
>>>>> Independently on the subsystem the ->probe() for the sake of consistency and
>>>>> being informative should only rely on struct device *dev,
>>>> I'm not sure how drm_err works,
>>> It's a macro.
>>>
>>>> but struct drm_device does have a struct device *dev as well.
>>> Yes, but only when it's initialized.
>>>
>>>> Anyways, this is something I'll leave for Thomas to reply.
>>> The code above is wrong independently on his reply :-)
>> I'm kinda stuck between contrasting views of 2 kernel maintainers lol,
>> so I said let Thomas reply.
> Sure. I also want him to clarify my question about potential drm_err_probe().

These threads get a little lengthy. What is the question?

Best regards
Thomas

>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

