Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E383CAD8C2F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 14:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8591F10E1C6;
	Fri, 13 Jun 2025 12:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VkWAgdOw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cOS0/wOu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VkWAgdOw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cOS0/wOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D2810E1C6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 12:33:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2B3391F78E;
 Fri, 13 Jun 2025 12:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749818017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UY8/ryiGqwkfdxxEcA7a07H/iwmQeNiCx3y9XQts/Hs=;
 b=VkWAgdOwurhw8KzQCumj6T4g1t3fElA1Ece16xomGu+GV0gERmaUg59qM9pNGcgKypM30R
 bcfIpPm2urj/99pKwmlnxy75ewKP1x9r9cIRd2fu221Ld2vN0DnJ9nV8ASs7CPzrD7eVu2
 KL719btKCBnlQxnGrHkv4IWVokcv8hI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749818017;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UY8/ryiGqwkfdxxEcA7a07H/iwmQeNiCx3y9XQts/Hs=;
 b=cOS0/wOudHmAo0K8CvYlH9sKOzJ9/0uVeO3PfeqPmrKApurXLt4r23X7HObfmPwFEuroKa
 ndtmtU6a1ly+A6Aw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VkWAgdOw;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="cOS0/wOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749818017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UY8/ryiGqwkfdxxEcA7a07H/iwmQeNiCx3y9XQts/Hs=;
 b=VkWAgdOwurhw8KzQCumj6T4g1t3fElA1Ece16xomGu+GV0gERmaUg59qM9pNGcgKypM30R
 bcfIpPm2urj/99pKwmlnxy75ewKP1x9r9cIRd2fu221Ld2vN0DnJ9nV8ASs7CPzrD7eVu2
 KL719btKCBnlQxnGrHkv4IWVokcv8hI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749818017;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UY8/ryiGqwkfdxxEcA7a07H/iwmQeNiCx3y9XQts/Hs=;
 b=cOS0/wOudHmAo0K8CvYlH9sKOzJ9/0uVeO3PfeqPmrKApurXLt4r23X7HObfmPwFEuroKa
 ndtmtU6a1ly+A6Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D1B813782;
 Fri, 13 Jun 2025 12:33:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EiAXGaAaTGj/cQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 12:33:36 +0000
Message-ID: <1a1cf578-2d27-486d-8418-737a99c9ebca@suse.de>
Date: Fri, 13 Jun 2025 14:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, Jonathan.Cameron@huawei.com,
 airlied@gmail.com, aleksander.lobakin@intel.com,
 andriy.shevchenko@linux.intel.com, bhelgaas@google.com, broonie@kernel.org,
 dakr@kernel.org, dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, louis.chauvet@bootlin.com, lukas@wunner.de,
 lyude@redhat.com, maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, quic_zijuhu@quicinc.com,
 rafael@kernel.org, robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 simona@ffwll.ch
References: <2025022643-scouting-petticoat-492b@gregkh>
 <20250311172054.2903-1-jose.exposito89@gmail.com>
 <2025031218-oxidize-backing-e278@gregkh>
 <Z9LqHcj4n7Dd8A-H@phenom.ffwll.local> <Z9MT23hgX2c21xNA@fedora>
 <fa5f9e9c-09f6-4f92-8f6d-4e057f9fc5a9@suse.de> <aEwRqrqn4M32ScxN@fedora>
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
In-Reply-To: <aEwRqrqn4M32ScxN@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2B3391F78E
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[27];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FREEMAIL_TO(0.00)[gmail.com];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,linuxfoundation.org,huawei.com,gmail.com,intel.com,linux.intel.com,google.com,kernel.org,lists.freedesktop.org,vger.kernel.org,bootlin.com,wunner.de,redhat.com,riseup.net,quicinc.com,arm.com];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 TAGGED_RCPT(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 MID_RHS_MATCH_FROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLj8h91xihsixaeeztgm33n4sq)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, ffwll.ch:url, ffwll.ch:email, intel.com:email,
 bootlin.com:url, bootlin.com:email, lists.freedesktop.org:email, suse.de:mid,
 suse.de:dkim, suse.de:email]
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

Am 13.06.25 um 13:55 schrieb José Expósito:
> Hi Thomas,
>
> Thanks for the heads up, this issue fall through the cracks.
>
> On Fri, Jun 13, 2025 at 10:15:05AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 13.03.25 um 18:20 schrieb José Expósito:
>>> On Thu, Mar 13, 2025 at 03:22:21PM +0100, Simona Vetter wrote:
>>>> On Wed, Mar 12, 2025 at 07:22:07AM +0100, Greg KH wrote:
>>>>> On Tue, Mar 11, 2025 at 06:20:53PM +0100, José Expósito wrote:
>>>>>> Hi everyone,
>>>>>>
>>>>>>> On Tue, Feb 25, 2025 at 02:51:40PM +0100, Louis Chauvet wrote:
>>>>>>>> Le 25/02/2025 à 12:41, Thomas Zimmermann a écrit :
>>>>>>>>> Hi
>>>>>>>>>
>>>>>>>>> Am 10.02.25 um 15:37 schrieb Louis Chauvet:
>>>>>>>>>> On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
>>>>>>>>>>> The vkms driver does not need to create a platform device, as there is
>>>>>>>>>>> no real platform resources associated it,  it only did so because it was
>>>>>>>>>>> simple to do that in order to get a device to use for resource
>>>>>>>>>>> management of drm resources.  Change the driver to use the faux device
>>>>>>>>>>> instead as this is NOT a real platform device.
>>>>>>>>>>>
>>>>>>>>>>> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>>>>>>>> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
>>>>>>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>>>>>>> Cc: Melissa Wen <melissa.srw@gmail.com>
>>>>>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>>>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>>>>>>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>>>>>>>>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>>>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>>>
>>>>>>>>>> Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>>>>>>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>>>>>>>
>>>>>>>>>> Thanks for the modification, it seems to work.
>>>>>>>>> Should this patch be merged through DRM trees? drm-misc-next is at
>>>>>>>>> v6.14-rc4 and has struct faux_device.
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I was not aware the faux-device was merged, as it is a new feature, I
>>>>>>>> expected it to reach drm-misc-next on 6.15-rc1.
>>>>>>> I added it to Linus's tree just so that DRM could get these changes into
>>>>>>> their tree now :)
>>>>>>>
>>>>>>>> I plan to merge [1] today/tomorrow (well tested with platform_device), and
>>>>>>>> then I will submit an updated version of this patch (only trivial conflicts,
>>>>>>>> but never tested with multiple VKMS devices).
>>>>>>>>
>>>>>>>> [1]:https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
>>>>>>> Great, thanks!
>>>>>>>
>>>>>>> greg k-h
>>>>>> Testing this patch again as part of some IGT tests I'm working on,
>>>>>> I noticed that, applying this patch on top of the latest drm-misc-next
>>>>>> triggers a warning at drivers/gpu/drm/drm_gem.c:571, in
>>>>>> drm_gem_get_pages():
>>>>>>
>>>>>>       if (WARN_ON(!obj->filp))
>>>>>>               return ERR_PTR(-EINVAL);
>>>>> I don't see how the faux bus change would have anything to do with a
>>>>> filp as that's not related as far as I can tell.  But I don't know the
>>>>> drm layer at all, where does that filp come from?
>>>> Yeah that filp is the shmem file that backs gem bo. That's very far away
>>>> from anything device/driver related datastrctures. If this is a new
>>>> failure due to the aux bux conversion then it would be really surprising.
>>> Agreed, I find it surprising, but reverting the patch removes the warning.
>>>
>>> It's most likely an issue on my side, but I decided to double check just
>>> in case someone else is also seeing this warning.
>> Any news on this issue?
> I tested again with drm-misc-next. At the moment of writing this, the last
> commit is 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe
> access rules") and I still see a similar warning. The stack trace changed,
> but the warning is still present.
>
> I'm going to detail the exact steps I followed. Let's see if someone else is
> able to reproduce the issue:
>
> I started by applying the patches from this series that are not already merged:
>
>   - [PATCH v4 4/9] x86/microcode: move away from using a fake platform
>   - [PATCH v4 5/9] wifi: cfg80211: move away from using a fake
>   - [PATCH v4 8/9] drm/vgem/vgem_drv convert to use faux_device
>   - [PATCH v4 9/9] drm/vkms: convert to use faux_device
>
> The last patch has small conflict in vkms_drv.h that I solved like this:
>
> 	struct vkms_device {
> 		struct drm_device drm;
> 		struct faux_device *faux_dev;
> 		const struct vkms_config *config;
> 	};
>
> And in vkms_drv.c:
>
> 	static int vkms_create(struct vkms_config *config)
> 	{
> 		int ret;
> 		struct faux_device *fdev;
> 		struct vkms_device *vkms_device;
> 		const char *dev_name;
>
> 		dev_name = vkms_config_get_device_name(config);
> 		fdev = faux_device_create(dev_name, NULL, NULL);
> 		if (!fdev)
> 			return -ENODEV;
>
> Next, I installed the new kernel in a QEMU virtual machine running Fedora 41.
> There is nothing special about my Fedora, it is the regular desktop version.
>
> After a reboot, "sudo modprobe vkms" shows a similar warning in dmesg.
> For reference, the warning is at the end of my email.
>
> Am I the only one sawing this warning?
>
> Jose
>
> ---
>
> [   69.417850] [drm] Initialized vkms 1.0.0 for vkms on minor 1
> [   69.419446] faux_driver vkms: [drm] fb1: vkmsdrmfb frame buffer device
> [   69.520944] ------------[ cut here ]------------
> [   69.520954] WARNING: CPU: 2 PID: 1015 at drivers/dma-buf/dma-buf.c:1518 dma_buf_vmap+0x212/0x540
> [   69.520992] Modules linked in: vkms snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables rfkill qrtr sunrpc binfmt_misc ppdev pktcdvd parport_pc parport pcspkr i2c_piix4 e1000 i2c_smbus joydev loop nfnetlink vsock_loopback zram vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vmw_vmci vsock bochs serio_raw ata_generic pata_acpi fuse qemu_fw_cfg
> [   69.521082] CPU: 2 UID: 42 PID: 1015 Comm: KMS thread Not tainted 6.16.0-rc1+ #3 PREEMPT(voluntary)
> [   69.521092] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-4.fc42 04/01/2014
> [   69.521095] RIP: 0010:dma_buf_vmap+0x212/0x540

That's dmabuf. could be related to the fact that there's no real DMA 
possible with the faux_device. We now have support for 
dmabuf-without-DMA, sort of. Could you please replace 
DRM_GEM_SHMEM_DRIVER_OPS with the new 
DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT at [1]. That would avoid any actual 
hardware-DMA functionality.

[1] 
https://elixir.bootlin.com/linux/v6.15.1/source/drivers/gpu/drm/vkms/vkms_drv.c#L104

Best regards
Thomas


> [   69.521105] Code: 7c 41 ff 03 0f 85 0a 02 00 00 c9 e9 c8 47 0c 01 80 3c 06 00 0f 85 c4 01 00 00 48 c7 01 00 00 00 00 48 85 d2 0f 85 bd fe ff ff <0f> 0b b8 ea ff ff ff eb af 48 85 f6 0f 85 cf 01 00 00 48 89 4c 24
> [   69.521112] RSP: 0018:ffffc90006a5f690 EFLAGS: 00010246
> [   69.521125] RAX: dffffc0000000000 RBX: 1ffff92000d4beea RCX: ffff88811467dcc8
> [   69.521128] RDX: 0000000000000000 RSI: 1ffff110228cfb99 RDI: ffff88811467dcd0
> [   69.521131] RBP: ffffc90006a5f728 R08: 1ffff92000d4bed9 R09: fffff52000d4bef1
> [   69.521162] R10: fffff52000d4bef2 R11: ffff8881017f4e28 R12: ffff8881149594f0
> [   69.521165] R13: ffff888114959400 R14: 1ffff11023146b29 R15: ffff88811467dcc8
> [   69.521168] FS:  00007fbbdd1ff6c0(0000) GS:ffff888417580000(0000) knlGS:0000000000000000
> [   69.521172] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   69.521174] CR2: 00007fbbcc0345c8 CR3: 000000011ec5a000 CR4: 00000000000006f0
> [   69.521179] Call Trace:
> [   69.521182]  <TASK>
> [   69.521185]  ? __pfx_dma_buf_vmap+0x10/0x10
> [   69.521193]  ? dma_resv_get_singleton+0x9a/0x2a0
> [   69.521197]  drm_gem_shmem_vmap_locked+0xc2/0x5f0
> [   69.521208]  ? __pfx_drm_gem_shmem_vmap_locked+0x10/0x10
> [   69.521212]  ? __pfx_ww_mutex_lock+0x10/0x10
> [   69.521225]  ? sched_clock_noinstr+0xd/0x20
> [   69.521230]  ? local_clock_noinstr+0x13/0xf0
> [   69.521233]  drm_gem_shmem_object_vmap+0xd/0x20
> [   69.521237]  drm_gem_vmap_locked+0x70/0xf0
> [   69.521247]  drm_gem_vmap+0x4c/0xa0
> [   69.521250]  drm_gem_fb_vmap+0xb2/0x3b0
> [   69.521255]  vkms_prepare_fb+0x6f/0x90 [vkms]
> [   69.521264]  ? drm_atomic_helper_setup_commit+0xb7b/0x1320
> [   69.521268]  drm_atomic_helper_prepare_planes+0x19f/0xb90
> [   69.521272]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
> [   69.521276]  drm_atomic_helper_commit+0x126/0x2d0
> [   69.521279]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
> [   69.521282]  drm_atomic_commit+0x205/0x2d0
> [   69.521290]  ? _raw_spin_lock_irqsave+0x97/0xf0
> [   69.521295]  ? __pfx_drm_atomic_commit+0x10/0x10
> [   69.521299]  ? __pfx___drm_printfn_info+0x10/0x10
> [   69.521313]  ? drm_event_reserve_init+0x1cd/0x260
> [   69.521318]  drm_mode_atomic_ioctl+0x1c79/0x2d30
> [   69.521323]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [   69.521326]  ? __kasan_check_write+0x18/0x20
> [   69.521339]  drm_ioctl_kernel+0x17b/0x2f0
> [   69.521343]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [   69.521349]  ? __pfx_drm_ioctl_kernel+0x10/0x10
> [   69.521353]  ? __pfx_do_vfs_ioctl+0x10/0x10
> [   69.521361]  ? __kasan_check_write+0x18/0x20
> [   69.521365]  drm_ioctl+0x51b/0xbd0
> [   69.521369]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [   69.521373]  ? __pfx_drm_ioctl+0x10/0x10
> [   69.521378]  ? selinux_file_ioctl+0xfc/0x260
> [   69.521390]  __x64_sys_ioctl+0x143/0x1d0
> [   69.521394]  x64_sys_call+0xf4b/0x1d70
> [   69.521404]  do_syscall_64+0x82/0x2a0
> [   69.521408]  ? __kasan_check_write+0x18/0x20
> [   69.521411]  ? do_user_addr_fault+0x491/0xa60
> [   69.521420]  ? irqentry_exit+0x3f/0x50
> [   69.521423]  ? exc_page_fault+0x8b/0xe0
> [   69.521426]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   69.521430] RIP: 0033:0x7fbc078fd8ed
> [   69.521441] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> [   69.521444] RSP: 002b:00007fbbdd1fd9b0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [   69.521449] RAX: ffffffffffffffda RBX: 00007fbbcc02af60 RCX: 00007fbc078fd8ed
> [   69.521452] RDX: 00007fbbdd1fda50 RSI: 00000000c03864bc RDI: 0000000000000035
> [   69.521455] RBP: 00007fbbdd1fda00 R08: 00000000000000e0 R09: 0000000000000001
> [   69.521457] R10: 0000000000000003 R11: 0000000000000246 R12: 00007fbbdd1fda50
> [   69.521459] R13: 00000000c03864bc R14: 0000000000000035 R15: 00007fbbcc02acf0
> [   69.521464]  </TASK>
> [   69.521466] ---[ end trace 0000000000000000 ]---
>
>
>
>> Best regards
>> Thomas
>>
>>> Jose
>>>
>>>> -Sima
>>>>
>>>> -- 
>>>> Simona Vetter
>>>> Software Engineer, Intel Corporation
>>>> http://blog.ffwll.ch
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

