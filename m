Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEAABFAE8F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 10:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B218510E6EF;
	Wed, 22 Oct 2025 08:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KZptGFF6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bvWp0e0o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tutbzA4d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T3BquWdg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D1A10E6EF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 08:33:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE7A821172;
 Wed, 22 Oct 2025 08:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761121999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SMQjjMr/KzUzfuQ8alIXImdFpC7+hiPIngqCCEJPxBs=;
 b=KZptGFF68XkjfC/KVxekoJdZEwwXCb8u0g58IBR8ANkf6p0xWczsfpvAeeE2/U/uwhUZfI
 ZK41s9NMl3UJoSF7JC8tniKH6+z3i0Tmpp76A5zjl8J/dy4xbYH2XOHFblT/BjThVM1Fmx
 oEHxtpPs2qC66u6csNd+xVJL3C2Fw60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761121999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SMQjjMr/KzUzfuQ8alIXImdFpC7+hiPIngqCCEJPxBs=;
 b=bvWp0e0olLDQWYbMlm8ITtBB7+0GEG5GHddjd6QDvAeolWFNL0f6zkqaWFVCVObOXP7B3z
 jyRQdRHp3dkfxTCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tutbzA4d;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=T3BquWdg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761121994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SMQjjMr/KzUzfuQ8alIXImdFpC7+hiPIngqCCEJPxBs=;
 b=tutbzA4dPbXuMD4LTPP8cYBc+RU1lGhyE+j8a1KbFZRkWxTDTqPgMfI2rWuad0al6wVH+j
 h+LUz9N0j9fsyorGIpPFNwNR2x6SnCoLvTA0M7A2h8hhV2wjxwguVhqgmZikWy2ZY6JixE
 6yxRz5ycfDeKjVgnhM7iXzq+DG1pQyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761121994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SMQjjMr/KzUzfuQ8alIXImdFpC7+hiPIngqCCEJPxBs=;
 b=T3BquWdgqebqrUXIzz830Rb+AHJ5Nuhtk0cDQacSMDl1RaMAQgYvjrDQkuOfvSKKnaEyxZ
 B1kC7DbbQLH4YYCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A38E913A29;
 Wed, 22 Oct 2025 08:33:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lWh7JsqW+Gj2TwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Oct 2025 08:33:14 +0000
Content-Type: multipart/mixed; boundary="------------lqR1kLKkoMG2JIq9MZ0qfWUG"
Message-ID: <84de3c82-638a-412c-8e25-9ff507d59400@suse.de>
Date: Wed, 22 Oct 2025 10:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
 <afc6ba14-cd95-49b9-89f5-e90fd19c8927@collabora.com>
 <a2afbc13-0be6-46ef-a6da-9461fd30376b@collabora.com>
 <126a0b10-a550-430c-a1b3-7e144461a0ff@suse.de>
 <IA0PR11MB71850CA585D6E42C1E7217DDF8F3A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <c6b44524-4e44-46e8-89b4-8f90e074431b@collabora.com>
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
In-Reply-To: <c6b44524-4e44-46e8-89b4-8f90e074431b@collabora.com>
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: DE7A821172
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.41 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_BASE64_TEXT(0.10)[];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_EQ_ADDR_SOME(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 HAS_ATTACHMENT(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.41
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
--------------lqR1kLKkoMG2JIq9MZ0qfWUG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Am 22.10.25 um 07:37 schrieb Dmitry Osipenko:
> On 10/22/25 08:02, Kasireddy, Vivek wrote:
>> Hi Thomas,
>>
>>> Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on
>>> the host resource
>>>
>>>>> On 10/17/25 10:38, Thomas Zimmermann wrote:
>>>>> ...
>>>>>> There's little difference between the current event handling and the
>>> one
>>>>>> where no vblanks have been set up. I suspect that the vblank timer
>>>>>> callback interferes with the locking in atomic_flush. That would also
>>>>>> explain why the fps drop at no clear pattern.
>>>>>>
>>>>>> Could you please test the attached patch? It enables/disables the
>>> vblank
>>>>>> timer depending on the buffer resources; as you suggested
>>> before.  Does
>>>>>> this make a difference?
>>>>> The attached patch doesn't work, please see the trace below.
>>>>>
>>>>> @Vivek Please clarify whether you only see frames drop with your
>>>>> multi-gpu guest-blob setup or with a usual virgl too. I haven't noticed
>>>>> problem with frames pacing for virgl and nctx modes yesterday, will
>>>>> check again.
>>>> On a second look, I now see that this RFC (not the attached) patch
>>>> doesn't work properly with host blobs.
>>>>
>>>> I'm getting 100-150fps with this patch applied instead of expected
>>>> 60fps. Without this RFC patch I'm getting constant 60fps with native
>>>> context displaying host blobs.
>>>>
>>>> Not sure why guest blob would behave differently from the host blob.
>>>> Suspect something if off with the prime sharing that Vivek uses in the
>>>> vfio testing setup. I'd suggest to disable vblank timer only for guest
>>>> blobs if no quick solution will be found.
>>> After reading your reply and Vivek's new results, I'm confused now. Does
>>> it work or is there another patch needed?
>> Considering my use-case and Dmitry's virgl/venus/native context use-cases
>> and the benefits offered by vblank timer in these different scenarios, I think
>> the following patch should be sufficient for now:
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
>> index e972d9b015a9..c1a8f88f0a20 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
>> @@ -102,7 +102,11 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
>>   static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
>>                                            struct drm_atomic_state *state)
>>   {
>> -       drm_crtc_vblank_on(crtc);
>> +       struct drm_device *dev = crtc->dev;
>> +       struct virtio_gpu_device *vgdev = dev->dev_private;
>> +
>> +       if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
>> +               drm_crtc_vblank_on(crtc);
>>   }
>>   
>>   static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
>> @@ -112,7 +116,8 @@ static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
>>          struct virtio_gpu_device *vgdev = dev->dev_private;
>>          struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
>>   
>> -       drm_crtc_vblank_off(crtc);
>> +       if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
>> +               drm_crtc_vblank_off(crtc);
> I'm fine with this change. Will need a clarifying comment in the code.
>
> On the other hand, I tried with "-device virtio-vga,blob=true" and still
> don't see problem with the incorrect frame rate.
>
> Vivek, could you please clarify whether you only seeing problem when
> using prime sharing? I.e. whether you can reproduce the wrong fps by
> running qemu casually without using vfio.
>
> Might test the vfio setup myself sometime later. It's a bit cumbersome
> to set it up, will need to re-plug GPUs and etc, currently busy with
> other stuff.

Here's another variant of the patch for you to test. This should resolve 
the warning.

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


--------------lqR1kLKkoMG2JIq9MZ0qfWUG
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-virtgpu-Make-vblank-event-dependent-on-the-host-.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-virtgpu-Make-vblank-event-dependent-on-the-host-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA5Y2EwZWNkM2YwODE1NDc0YTNlY2I3OThhZGEzYmUzYWYzN2JiOGNkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAxNiBPY3QgMjAyNSAxNTowMToyMyArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIGRybS92aXJ0Z3B1OiBNYWtlIHZibGFuayBldmVudCBkZXBlbmRlbnQgb24g
dGhlIGhvc3QgcmVzb3VyY2UKCkZvciBlYWNoIHBsYW5lLCBzdG9yZSB0aGUgYnVmZmVyIG9i
amVjdCdzIGhvc3QgYmFja2luZyBpbiB0aGUgc3RhdGUKb2YgdGhlIHBsYW5lJ3MgcmVzcGVj
dGl2ZSBDUlRDLiBUaGUgaG9zdCBzeW5jaHJvbml6ZXMgb3V0cHV0IG9mIGJ1ZmZlcgpvYmpl
Y3RzIHdpdGggYSBob3N0IHJlc291cmNlIHRvIGl0cyBvd24gcmVmcmVzaCBjeWNsZTsgdGh1
cyBhdm9pZGluZwp0ZWFyaW5nLiBEdXJpbmcgdGhlIENSVEMncyBhdG9taWMgZmx1c2gsIGln
bm9yZSB0aGUgdmJsYW5rIHRpbWVyIGlmCmFueSBvZiB0aGUgQ1JUQydzIHBsYW5lJ3MgYnVm
ZmVyIG9iamVjdCBoYXMgYSBob3N0IHJlc291cmNlLiBJbnN0ZWFkCnNlbmQgdGhlIHZibGFu
ayBldmVudCBpbW1kaWF0ZWxseS4gQXZvaWRzIGNvcm5lciBjYXNlcyB3aGVyZSBhIHZibGFu
awpldmVudCBoYXBwZW5zIHRvbyBsYXRlIGZvciB0aGUgbmV4dCBmcmFtZSB0byBiZSBwYWdl
IGZsaXBwZWQgaW4gdGltZS4KClRoZSBob3N0IHN5bmNocm9uaXplcyBhIHBsYW5lJ3Mgb3V0
cHV0IHRvIHRoZSBob3N0IHJlcGFpbnQgY3ljbGUgaWYKdGhlIHBsYW5lJ3MgYnVmZmVyIG9i
amVjdCBoYXMgYW4gYXNzb2NpYXRlZCBob3N0IHJlc291cmNlLiBBbiBhdG9taWMKY29tbWl0
IGJsb2NrcyB1bnRpbCB0aGUgaG9zdCBjeWNsZSBjb21wbGV0ZXMgYW5kIHRoZW4gYXJtcyB0
aGUgdmJsYW5rCmV2ZW50LiBUaGUgZ3Vlc3QgY29tcG9zaXRvciBpcyB0aGVyZWJ5IHN5bmNo
cm9uaXplZCB0byB0aGUgaG9zdCdzCm91dHB1dCByYXRlLgoKVG8gYXZvaWQgZGVsYXlzLCBz
ZW5kIG91dCB0aGUgdmJsYW5rIGV2ZW50IGltbWVkaWF0ZWx5IGluc3RlYWQgb2YKanVzdCBh
cm1pbmcgaXQuIE90aGVyd2lzZSB0aGUgZXZlbnQgbWlnaHQgYmUgdG9vIGxhdGUgdG8gcGFn
ZSBmbGlwCnRoZSBjb21wb3NpdG9yJ3MgbmV4dCBmcmFtZS4KClRoZSB2YmxhbmsgdGltZXIg
aXMgc3RpbGwgYWN0aXZlIGFuZCBmaXJlcyBpbiByZWd1bGFyIGludGVydmFscwphY2NvcmRp
bmcgdG8gdGhlIGd1ZXN0IGRpc3BsYXkgcmVmcmVzaC4gVGhpcyByYXRlIGxpbWl0cyBjbGll
bnRzCnRoYXQgb25seSB3YWl0IGZvciB0aGUgbmV4dCB2YmxhbmsgdG8gb2NjdXIsIHN1Y2gg
YXMgZmJjb24uIFRoZXNlCmNsaWVudHMgd291bGQgb3RoZXJ3aXNlIHByb2R1Y2UgYSB2ZXJ5
IGhpZ2ggbnVtYmVyIG9mIGZyYW1lcyBwZXIKc2Vjb25kLgoKRm9yIGNvbW1pdHMgd2l0aG91
dCBob3N0IHJlc291cmNlLCB0aGUgdmJsYW5rIHRpbWVyIHJhdGUtbGltaXRzIHRoZQpndWVz
dCBvdXRwdXQgYnkgZ2VuZXJhdGluZyB2YmxhbmsgZXZlbnRzIGF0IHRoZSBndWVzdCBkaXNw
bGF5IHJlZnJlc2gKcmF0ZSBhcyBiZWZvcmUuCgp2MzoKLSBkaXNhYmxlIHZibGFuayB1bmNv
bmRpdGlvbmFsbHkKLSBjb21wdXRlIHN0YXR1cyBvbiBlYWNoIGNvbW1pdAp2MjoKLSBlbmFi
bGUvZGlzYWJsZSB2YmxhbmsgdGltZXIgYWNjb3JkaW5nIHRvIGJ1ZmZlciBzZXR1cAoKU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rpc3BsYXkuYyB8IDg4ICsrKysr
KysrKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Ry
di5oICAgICB8IDE0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFu
ZS5jICAgfCAyMiArKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNw
bGF5LmMKaW5kZXggZTk3MmQ5YjAxNWE5Li5jMzgxYTIwY2EzYzggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rpc3BsYXkuYwpAQCAtNDksMTQgKzQ5LDc0IEBACiAj
ZGVmaW5lIGRybV9jb25uZWN0b3JfdG9fdmlydGlvX2dwdV9vdXRwdXQoeCkgXAogCWNvbnRh
aW5lcl9vZih4LCBzdHJ1Y3QgdmlydGlvX2dwdV9vdXRwdXQsIGNvbm4pCiAKK3N0YXRpYyB2
b2lkIHZpcnRpb19ncHVfY3J0Y19zdGF0ZV9kZXN0cm95KHN0cnVjdCB2aXJ0aW9fZ3B1X2Ny
dGNfc3RhdGUgKnZnY3J0Y19zdGF0ZSkKK3sKKwlfX2RybV9hdG9taWNfaGVscGVyX2NydGNf
ZGVzdHJveV9zdGF0ZSgmdmdjcnRjX3N0YXRlLT5iYXNlKTsKKworCWtmcmVlKHZnY3J0Y19z
dGF0ZSk7Cit9CisKK3N0YXRpYyBib29sIHZpcnRpb19ncHVfY3J0Y19zdGF0ZV9zZW5kX2V2
ZW50X29uX2ZsdXNoKHN0cnVjdCB2aXJ0aW9fZ3B1X2NydGNfc3RhdGUgKnZnY3J0Y19zdGF0
ZSkKK3sKKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUgPSAmdmdjcnRjX3N0
YXRlLT5iYXNlOworCisJLyoKKwkgKiBUaGUgQ1JUQydzIG91dHB1dCBpcyB2c3luYydlZCBp
ZiBhdCBsZWFzdCBvbmUgcGxhbmUncyBvdXRwdXQgaXMKKwkgKiBzeW5jJ2VkIHRvIHRoZSBo
b3N0IHJlZnJlc2guCisJICovCisJcmV0dXJuIHZnY3J0Y19zdGF0ZS0+cGxhbmVfc3luY2Vk
X3RvX2hvc3QgJiBjcnRjX3N0YXRlLT5wbGFuZV9tYXNrOworfQorCitzdGF0aWMgdm9pZCB2
aXJ0aW9fZ3B1X2NydGNfcmVzZXQoc3RydWN0IGRybV9jcnRjICpjcnRjKQoreworCXN0cnVj
dCB2aXJ0aW9fZ3B1X2NydGNfc3RhdGUgKnZnY3J0Y19zdGF0ZTsKKworCWlmIChjcnRjLT5z
dGF0ZSkKKwkJdmlydGlvX2dwdV9jcnRjX3N0YXRlX2Rlc3Ryb3kodG9fdmlydGlvX2dwdV9j
cnRjX3N0YXRlKGNydGMtPnN0YXRlKSk7CisKKwl2Z2NydGNfc3RhdGUgPSBremFsbG9jKHNp
emVvZigqdmdjcnRjX3N0YXRlKSwgR0ZQX0tFUk5FTCk7CisJaWYgKHZnY3J0Y19zdGF0ZSkg
eworCQlfX2RybV9hdG9taWNfaGVscGVyX2NydGNfcmVzZXQoY3J0YywgJnZnY3J0Y19zdGF0
ZS0+YmFzZSk7CisJfSBlbHNlIHsKKwkJX19kcm1fYXRvbWljX2hlbHBlcl9jcnRjX3Jlc2V0
KGNydGMsIE5VTEwpOworCX0KK30KKworc3RhdGljIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
dmlydGlvX2dwdV9jcnRjX2F0b21pY19kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGRybV9jcnRj
ICpjcnRjKQoreworCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBjcnRjLT5kZXY7CisJc3Ry
dWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlID0gY3J0Yy0+c3RhdGU7CisJc3RydWN0
IHZpcnRpb19ncHVfY3J0Y19zdGF0ZSAqbmV3X3ZnY3J0Y19zdGF0ZTsKKwlzdHJ1Y3Qgdmly
dGlvX2dwdV9jcnRjX3N0YXRlICp2Z2NydGNfc3RhdGU7CisKKwlpZiAoZHJtX1dBUk5fT04o
ZGV2LCAhY3J0Y19zdGF0ZSkpCisJCXJldHVybiBOVUxMOworCisJbmV3X3ZnY3J0Y19zdGF0
ZSA9IGt6YWxsb2Moc2l6ZW9mKCpuZXdfdmdjcnRjX3N0YXRlKSwgR0ZQX0tFUk5FTCk7CisJ
aWYgKCFuZXdfdmdjcnRjX3N0YXRlKQorCQlyZXR1cm4gTlVMTDsKKworCXZnY3J0Y19zdGF0
ZSA9IHRvX3ZpcnRpb19ncHVfY3J0Y19zdGF0ZShjcnRjX3N0YXRlKTsKKworCV9fZHJtX2F0
b21pY19oZWxwZXJfY3J0Y19kdXBsaWNhdGVfc3RhdGUoY3J0YywgJm5ld192Z2NydGNfc3Rh
dGUtPmJhc2UpOworCisJcmV0dXJuICZuZXdfdmdjcnRjX3N0YXRlLT5iYXNlOworfQorCitz
dGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2NydGNfYXRvbWljX2Rlc3Ryb3lfc3RhdGUoc3RydWN0
IGRybV9jcnRjICpjcnRjLAorCQkJCQkJIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19z
dGF0ZSkKK3sKKwl2aXJ0aW9fZ3B1X2NydGNfc3RhdGVfZGVzdHJveSh0b192aXJ0aW9fZ3B1
X2NydGNfc3RhdGUoY3J0Y19zdGF0ZSkpOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9jcnRjX2Z1bmNzIHZpcnRpb19ncHVfY3J0Y19mdW5jcyA9IHsKIAkuc2V0X2NvbmZpZyAg
ICAgICAgICAgICA9IGRybV9hdG9taWNfaGVscGVyX3NldF9jb25maWcsCiAJLmRlc3Ryb3kg
ICAgICAgICAgICAgICAgPSBkcm1fY3J0Y19jbGVhbnVwLAogCiAJLnBhZ2VfZmxpcCAgICAg
ICAgICAgICAgPSBkcm1fYXRvbWljX2hlbHBlcl9wYWdlX2ZsaXAsCi0JLnJlc2V0ICAgICAg
ICAgICAgICAgICAgPSBkcm1fYXRvbWljX2hlbHBlcl9jcnRjX3Jlc2V0LAotCS5hdG9taWNf
ZHVwbGljYXRlX3N0YXRlID0gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19kdXBsaWNhdGVfc3Rh
dGUsCi0JLmF0b21pY19kZXN0cm95X3N0YXRlICAgPSBkcm1fYXRvbWljX2hlbHBlcl9jcnRj
X2Rlc3Ryb3lfc3RhdGUsCisJLnJlc2V0ICAgICAgICAgICAgICAgICAgPSB2aXJ0aW9fZ3B1
X2NydGNfcmVzZXQsCisJLmF0b21pY19kdXBsaWNhdGVfc3RhdGUgPSB2aXJ0aW9fZ3B1X2Ny
dGNfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSwKKwkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgICA9
IHZpcnRpb19ncHVfY3J0Y19hdG9taWNfZGVzdHJveV9zdGF0ZSwKIAlEUk1fQ1JUQ19WQkxB
TktfVElNRVJfRlVOQ1MsCiB9OwogCkBAIC0xMDIsNyArMTYyLDEwIEBAIHN0YXRpYyB2b2lk
IHZpcnRpb19ncHVfY3J0Y19tb2RlX3NldF9ub2ZiKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykK
IHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKIAkJCQkJICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpCiB7
Ci0JZHJtX2NydGNfdmJsYW5rX29uKGNydGMpOworCXN0cnVjdCB2aXJ0aW9fZ3B1X2NydGNf
c3RhdGUgKnZnY3J0Y19zdGF0ZSA9IHRvX3ZpcnRpb19ncHVfY3J0Y19zdGF0ZShjcnRjLT5z
dGF0ZSk7CisKKwlpZiAoIXZpcnRpb19ncHVfY3J0Y19zdGF0ZV9zZW5kX2V2ZW50X29uX2Zs
dXNoKHZnY3J0Y19zdGF0ZSkpCisJCWRybV9jcnRjX3ZibGFua19vbihjcnRjKTsKIH0KIAog
c3RhdGljIHZvaWQgdmlydGlvX2dwdV9jcnRjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKQEAgLTEyMSw2ICsxODQsMTkgQEAgc3RhdGljIHZvaWQgdmlydGlvX2dw
dV9jcnRjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIHN0YXRpYyBp
bnQgdmlydGlvX2dwdV9jcnRjX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
CiAJCQkJCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKIHsKKwlzdHJ1Y3QgZHJt
X2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X2NydGNf
c3RhdGUoc3RhdGUsIGNydGMpOworCXN0cnVjdCB2aXJ0aW9fZ3B1X2NydGNfc3RhdGUgKm5l
d192Z2NydGNfc3RhdGUgPSB0b192aXJ0aW9fZ3B1X2NydGNfc3RhdGUobmV3X2NydGNfc3Rh
dGUpOworCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUgPSBkcm1fYXRv
bWljX2dldF9vbGRfY3J0Y19zdGF0ZShzdGF0ZSwgY3J0Yyk7CisJc3RydWN0IHZpcnRpb19n
cHVfY3J0Y19zdGF0ZSAqb2xkX3ZnY3J0Y19zdGF0ZSA9IHRvX3ZpcnRpb19ncHVfY3J0Y19z
dGF0ZShvbGRfY3J0Y19zdGF0ZSk7CisKKwkvKgorCSAqIEhhbmRsaW5nIG9mIHZibGFuayBl
dmVudHMgY2hhbmdlcyBhY3Jvc3MgdXBkYXRlcy4gRG8gYSBmdWxsIG1vZGVzZXQKKwkgKiB0
byBlbmFibGUvZGlzYWJsZSB0aGUgdmJsYW5rIHRpbWVyLgorCSAqLworCWlmICh2aXJ0aW9f
Z3B1X2NydGNfc3RhdGVfc2VuZF9ldmVudF9vbl9mbHVzaChuZXdfdmdjcnRjX3N0YXRlKSAh
PQorCSAgICB2aXJ0aW9fZ3B1X2NydGNfc3RhdGVfc2VuZF9ldmVudF9vbl9mbHVzaChvbGRf
dmdjcnRjX3N0YXRlKSkKKwkJbmV3X2NydGNfc3RhdGUtPm1vZGVfY2hhbmdlZCA9IHRydWU7
CisKIAlyZXR1cm4gMDsKIH0KIApAQCAtMTI5LDcgKzIwNSw5IEBAIHN0YXRpYyB2b2lkIHZp
cnRpb19ncHVfY3J0Y19hdG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjLAogewog
CXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBjcnRjLT5kZXY7CiAJc3RydWN0IGRybV9jcnRj
X3N0YXRlICpjcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X2NydGNfc3RhdGUoc3Rh
dGUsIGNydGMpOworCXN0cnVjdCB2aXJ0aW9fZ3B1X2NydGNfc3RhdGUgKnZnY3J0Y19zdGF0
ZSA9IHRvX3ZpcnRpb19ncHVfY3J0Y19zdGF0ZShjcnRjX3N0YXRlKTsKIAlzdHJ1Y3Qgdmly
dGlvX2dwdV9vdXRwdXQgKm91dHB1dCA9IGRybV9jcnRjX3RvX3ZpcnRpb19ncHVfb3V0cHV0
KGNydGMpOworCWJvb2wgc2VuZF9ldmVudF9vbl9mbHVzaCA9IHZpcnRpb19ncHVfY3J0Y19z
dGF0ZV9zZW5kX2V2ZW50X29uX2ZsdXNoKHZnY3J0Y19zdGF0ZSk7CiAJc3RydWN0IGRybV9w
ZW5kaW5nX3ZibGFua19ldmVudCAqZXZlbnQ7CiAKIAkvKgpAQCAtMTQ3LDcgKzIyNSw3IEBA
IHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfY3J0Y19hdG9taWNfZmx1c2goc3RydWN0IGRybV9j
cnRjICpjcnRjLAogCWNydGNfc3RhdGUtPmV2ZW50ID0gTlVMTDsKIAogCWlmIChldmVudCkg
ewotCQlpZiAoZHJtX2NydGNfdmJsYW5rX2dldChjcnRjKSA9PSAwKQorCQlpZiAoIXNlbmRf
ZXZlbnRfb25fZmx1c2ggJiYgZHJtX2NydGNfdmJsYW5rX2dldChjcnRjKSA9PSAwKQogCQkJ
ZHJtX2NydGNfYXJtX3ZibGFua19ldmVudChjcnRjLCBldmVudCk7CiAJCWVsc2UKIAkJCWRy
bV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50KGNydGMsIGV2ZW50KTsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9kcnYuaAppbmRleCBmMTc2NjBhNzFhM2UuLmJhMWMxNTBiNmExMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaApAQCAtMTk1LDYgKzE5NSwy
MCBAQCBzdHJ1Y3QgdmlydGlvX2dwdV9mcmFtZWJ1ZmZlciB7CiAjZGVmaW5lIHRvX3ZpcnRp
b19ncHVfZnJhbWVidWZmZXIoeCkgXAogCWNvbnRhaW5lcl9vZih4LCBzdHJ1Y3QgdmlydGlv
X2dwdV9mcmFtZWJ1ZmZlciwgYmFzZSkKIAorc3RydWN0IHZpcnRpb19ncHVfY3J0Y19zdGF0
ZSB7CisJc3RydWN0IGRybV9jcnRjX3N0YXRlIGJhc2U7CisKKwkvKgorCSAqIFNldCBmcm9t
IGVhY2ggcGxhbmUncyBhdG9taWMgY2hlY2sgYW5kIGRlcGVuZHMgb24gdGhlIHBsYW5lJ3Mg
YnVmZmVyCisJICogb2JqZWN0cy4gQnVmZmVycyB3aXRoIGhvc3QgcmVzb3VyY2VzIGFyZSB2
c3luYydkIGFscmVhZHkuIFVzZWQgYnkgdGhlCisJICogQ1JUQyBmb3IgdmJsYW5rIGhhbmRs
aW5nLiBPbmx5IHZhbGlkIGR1cmluZyBtb2RlIHNldHRpbmcuCisJICovCisJdTMyIHBsYW5l
X3N5bmNlZF90b19ob3N0OworfTsKKworI2RlZmluZSB0b192aXJ0aW9fZ3B1X2NydGNfc3Rh
dGUoeCkgXAorCWNvbnRhaW5lcl9vZih4LCBzdHJ1Y3QgdmlydGlvX2dwdV9jcnRjX3N0YXRl
LCBiYXNlKQorCiBzdHJ1Y3QgdmlydGlvX2dwdV9wbGFuZV9zdGF0ZSB7CiAJc3RydWN0IGRy
bV9wbGFuZV9zdGF0ZSBiYXNlOwogCXN0cnVjdCB2aXJ0aW9fZ3B1X2ZlbmNlICpmZW5jZTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMKaW5kZXggMjllNGI0NThh
ZTU3Li4zMWY2NTQ4ZWYwZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9wbGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9w
bGFuZS5jCkBAIC0xMDQsNyArMTA0LDggQEAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X3BsYW5l
X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAkJCQkJCQkJCQkgcGxh
bmUpOwogCWJvb2wgaXNfY3Vyc29yID0gcGxhbmUtPnR5cGUgPT0gRFJNX1BMQU5FX1RZUEVf
Q1VSU09SOwogCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZTsKLQlpbnQgcmV0
OworCXN0cnVjdCB2aXJ0aW9fZ3B1X2NydGNfc3RhdGUgKnZnY3J0Y19zdGF0ZTsKKwlpbnQg
cmV0LCBpOwogCiAJaWYgKCFuZXdfcGxhbmVfc3RhdGUtPmZiIHx8IFdBUk5fT04oIW5ld19w
bGFuZV9zdGF0ZS0+Y3J0YykpCiAJCXJldHVybiAwOwpAQCAtMTI2LDcgKzEyNywyNCBAQCBz
dGF0aWMgaW50IHZpcnRpb19ncHVfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLAogCQkJCQkJICBEUk1fUExBTkVfTk9fU0NBTElORywKIAkJCQkJCSAgRFJN
X1BMQU5FX05PX1NDQUxJTkcsCiAJCQkJCQkgIGlzX2N1cnNvciwgdHJ1ZSk7Ci0JcmV0dXJu
IHJldDsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCWVsc2UgaWYgKG5ld19wbGFuZV9z
dGF0ZS0+dmlzaWJsZSkKKwkJcmV0dXJuIDA7CisKKwl2Z2NydGNfc3RhdGUgPSB0b192aXJ0
aW9fZ3B1X2NydGNfc3RhdGUoY3J0Y19zdGF0ZSk7CisJdmdjcnRjX3N0YXRlLT5wbGFuZV9z
eW5jZWRfdG9faG9zdCAmPSB+ZHJtX3BsYW5lX21hc2socGxhbmUpOworCisJZm9yIChpID0g
MDsgaSA8IG5ld19wbGFuZV9zdGF0ZS0+ZmItPmZvcm1hdC0+bnVtX3BsYW5lczsgKytpKSB7
CisJCXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8gPSBnZW1fdG9fdmlydGlvX2dwdV9v
YmoobmV3X3BsYW5lX3N0YXRlLT5mYi0+b2JqW2ldKTsKKworCQlpZiAoYm8tPmhvc3QzZF9i
bG9iIHx8IGJvLT5ndWVzdF9ibG9iKSB7CisJCQl2Z2NydGNfc3RhdGUtPnBsYW5lX3N5bmNl
ZF90b19ob3N0IHw9IGRybV9wbGFuZV9tYXNrKHBsYW5lKTsKKwkJCWJyZWFrOyAvKiBvbmx5
IG5lZWQgdG8gZmluZCBvbmUgKi8KKwkJfQorCX0KKworCXJldHVybiAwOwogfQogCiAvKiBG
b3IgZHJtIHBhbmljICovCi0tIAoyLjUxLjAKCg==

--------------lqR1kLKkoMG2JIq9MZ0qfWUG--
