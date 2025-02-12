Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D098CA32822
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4431B10E8BE;
	Wed, 12 Feb 2025 14:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DKS0Yhyv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD51810E8BE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:12:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05E5043301;
 Wed, 12 Feb 2025 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739369535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ki75aEwaKPg+vjIO3c7jVmDtL6dWRw+Ni2pLlMUzkK4=;
 b=DKS0YhyvoiPeQVAtyVO6UO/Al2VjzrcA1pYHh8k5RjjQOSs0hJm8HG9Tiz60BhofxhLQIx
 +PBieJWS/I4ex2RGjQ+ud2mxvoNLyu1om1dJSl8BmdRib8xiKmlX7L2JTDvfP1RM/n833o
 C5Lc7Y0EZSaGgrkjPZdJYDYDF/gTgdKAZ1VDifXKIokTHriRSF6fcHjdf3gKrDvuuNz3rz
 Wd7huKYLkZoOnY9FMcexF4YKeWIu7WVrk6HZellPkLA/IgqctxSn7ShNCv0kbS1R9j6dyA
 zd6imxMaNfNTIWx0tXixftULpnSEVwezv/lDAdwa3pDMBWtWy51zk2LTqIguMA==
Message-ID: <2466f201-2d2b-4626-a359-50f58c873c2c@bootlin.com>
Date: Wed, 12 Feb 2025 15:12:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] drm/vkms: Allow to configure multiple CRTCs
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-9-jose.exposito89@gmail.com>
 <Z5uDJFHnn1HzWOz4@louis-chauvet-laptop> <Z6sqFdvtwSxHD-FO@fedora>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 xsFNBGCG5KEBEAD1yQ5C7eS4rxD0Wj7JRYZ07UhWTbBpbSjHjYJQWx/qupQdzzxe6sdrxYSY
 5K81kIWbtQX91pD/wH5UapRF4kwMXTAqof8+m3XfYcEDVG31Kf8QkJTG/gLBi1UfJgGBahbY
 hjP40kuUR/mr7M7bKoBP9Uh0uaEM+DuKl6bSXMSrJ6fOtEPOtnfBY0xVPmqIKfLFEkjh800v
 jD1fdwWKtAIXf+cQtC9QWvcdzAmQIwmyFBmbg+ccqao1OIXTgu+qMAHfgKDjYctESvo+Szmb
 DFBZudPbyTAlf2mVKpoHKMGy3ndPZ19RboKUP0wjrF+Snif6zRFisHK7D/mqpgUftoV4HjEH
 bQO9bTJZXIoPJMSb+Lyds0m83/LYfjcWP8w889bNyD4Lzzzu+hWIu/OObJeGEQqY01etOLMh
 deuSuCG9tFr0DY6l37d4VK4dqq4Snmm87IRCb3AHAEMJ5SsO8WmRYF8ReLIk0tJJPrALv8DD
 lnLnwadBJ9H8djZMj24+GC6MJjN8dDNWctpBXgGZKuCM7Ggaex+RLHP/+14Vl+lSLdFiUb3U
 ljBXuc9v5/9+D8fWlH03q+NCa1dVgUtsP2lpolOV3EE85q1HdMyt5K91oB0hLNFdTFYwn1bW
 WJ2FaRhiC1yV4kn/z8g7fAp57VyIb6lQfS1Wwuj5/53XYjdipQARAQABzSlMb3VpcyBDaGF1
 dmV0IDxsb3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBItxBK6aJy1mk/Un8uwYg/VeC0ClBQJmlnw+BQkH8MsdAAoJEOwY
 g/VeC0ClyhwP/Ra6H+5F2NEW6/IMVHeXmhuly8CcZ3kyoKeGNowghIcTBo59dFh0atGCvr+y
 K9YD5Pyg9aX4Ropw1R1RVIMrWoUNZUKebRTu6iNHkE6tmURJaKLzR+9la+789jznQvbV+9gM
 YTBppX4/0cWY58jiDiDV4aJ77JDo7aWNK4hz8mZsB+Y7ezMuS4jy2r4b7dZ+YL/T9/k3/emO
 PkAuFkVhkNhytMEyOBsT7SjL4IUBeYWvOw9MIaXEl4qW/5HLGtMuNhS94NsviDXZquoOHOby
 2uuRAI0bLz1qcsnY90yyPlDJ0pMuJHbi0DBzPTIYkyuwoyplfWxnUPp1wfsjiy/B6mRKTbdE
 a/K6jNzdVC1LLjTD4EjwnCE8IZBRWH1NVC1suOkw3Sr1FYcHFSYqNDrrzO+RKtR1JMrIe8/3
 Xhe2/UNUhppsK3SaFaIsu98mVQY3bA/Xn9wYcuAAzRzhEHgrbp8LPzYdi6Qtlqpt4HcPV3Ya
 H9BkCacgyLHcdeQbBXaup9JbF5oqbdtwev3waAmNfhWhrQeqQ0tkrpJ46l9slEGEdao5Dcct
 QDRjmJz7Gx/rKJngQrbboOQz+rhiHPoJc/n75lgOqtHRePNEf9xmtteHYpiAXh/YNooXJvdA
 tgR1jAsCsxuXZnW2DpVClm1WSHNfLSWona8cTkcoSTeYCrnXzsFNBGCG6KUBEADZhvm9TZ25
 JZa7wbKMOpvSH36K8wl74FhuVuv7ykeFPKH2oC7zmP1oqs1IF1UXQQzNkCHsBpIZq+TSE74a
 mG4sEhZP0irrG/w3JQ9Vbxds7PzlQzDarJ1WJvS2KZ4AVnwc/ucirNuxinAuAmmNBUNF8w6o
 Y97sdgFuIZUP6h972Tby5bu7wmy1hWL3+2QV+LEKmRpr0D9jDtJrKfm25sLwoHIojdQtGv2g
 JbQ9Oh9+k3QG9Kh6tiQoOrzgJ9pNjamYsnti9M2XHhlX489eXq/E6bWOBRa0UmD0tuQKNgK1
 n8EDmFPW3L0vEnytAl4QyZEzPhO30GEcgtNkaJVQwiXtn4FMw4R5ncqXVvzR7rnEuXwyO9RF
 tjqhwxsfRlORo6vMKqvDxFfgIkVnlc2KBa563qDNARB6caG6kRaLVcy0pGVlCiHLjl6ygP+G
 GCNfoh/PADQz7gaobN2WZzXbsVS5LDb9w/TqskSRhkgXpxt6k2rqNgdfeyomlkQnruvkIIjs
 Sk2X68nwHJlCjze3IgSngS2Gc0NC/DDoUBMblP6a2LJwuF/nvaW+QzPquy5KjKUO2UqIO9y+
 movZqE777uayqmMeIy4cd/gg/yTBBcGvWVm0Dh7dE6G6WXJUhWIUtXCzxKMmkvSmZy+gt1rN
 OyCd65HgUXPBf+hioCzGVFSoqQARAQABwsOyBBgBCAAmAhsuFiEEi3EErponLWaT9Sfy7BiD
 9V4LQKUFAmaWfGYFCQfwx0ECQAkQ7BiD9V4LQKXBdCAEGQEIAB0WIQRPj7g/vng8MQxQWQQg
 rS7GWxAs4gUCYIbopQAKCRAgrS7GWxAs4gfGEACcA0XVNesbVIyvs5SJpJy+6csrH4yy233o
 GclX2P7pcCls55wiV6ywCtRaXWFjztYmklQieaZ/zq+pUuUDtBZo95rUP20E56gYV2XFB18W
 YeekTwH5d2d/j++60iHExWTB+sgMEv3CEGikUBj7iaMX2KtaB1k9K+3K6dx/s1KWxOClFkbJ
 EV/tmeq7Ta8LiytQM9b4yY550tzC0pEEeFcLFXo1m5KcJauYnAqrlOVY48NFpFUd9oAZf/Pz
 p3oEs+zn/8zK2PBrZZCD6AhrbotRy7irE5eimhxcsFm1+MG5ufnaQUWHrRYXVuFhvkSoqZ8j
 GPgPEpFor4NjRyX/PMLglQ7S5snkvKcr3Lun44aybXEHq/1FTzW2kOh6kFHFFOPbMv1voJKM
 IzrmDoDS+xANt/La7OwpCylCgF6t9oHHTTGfAfwtfYZbiepC66FDe/Jt/QLwkIXeIoeSS1O4
 6rJdGWG2kHthUM+uIbUbaRJW8AkJpzP1Mz7TieR/9jO4YPeUm9tGL5kP2yyNtzFilcoOeox1
 NSFNAPz+zPcovVmxAaSDGcSzhQVJVlk8xPib8g4fnI8qJ3Gj7xyw8D9dzxhCR2DIFmZL84En
 N7Rj+k4VIGY7M/cVvxL81jlbMGMERMmb96Cua9z1ROviGA1He2gbHOcp6qmLNu3nprleG8PL
 ZRNdEAC0iZapoyiXlVCKLFIwUPnxUz5iarqIfQU8sa1VXYYd/AAAFI6Wv3zfNtGicjgHP8rN
 CIegqm2Av1939XXGZJVI9f3hEoUn04rvxCgcDcUvn7I0WTZ4JB9G5qAGvQLXeXK6Byu77qTx
 eC7PUIIEKN3X47e8xTSj2reVTlanDr8yeqZhxpKHaS0laF8RbD85geZtAK67qEByX2KC9DUo
 eHBFuXpYMzGQnf2SG105ePI2f4h5iAfbTW9VWH989fx4f2hVlDwTe08/NhPdwq/Houov9f/+
 uPpYEMlHCNwE8GRV7aEjd/dvu87PQPm4zFtC3jgQaUKCbYYlHmYYRlrLQenX3QSorrQNPbfz
 uQkNLDVcjgD2fxBpemT7EhHYBz+ugsfbtdsH+4jVCo5WLb/HxE6o5zvSIkXknWh1DhFj/qe9
 Zb9PGmfp8T8Ty+c/hjE5x6SrkRCX8qPXIvfSWLlb8M0lpcpFK+tB+kZlu5I3ycQDNLTk3qmf
 PdjUMWb5Ld21PSyCrtGc/hTKwxMoHsOZPy6UB8YJ5omZdsavcjKMrDpybguOfxUmGYs2H3MJ
 ghIUQMMOe0267uQcmMNDPRueGWTLXcuyz0Tpe62Whekc3gNMl0JrNz6Gty8OBb/ETijfSHPE
 qGHYuyAZJo9A/IazHuJ+4n+gm4kQl1WLfxoRMzYHCA==
In-Reply-To: <Z6sqFdvtwSxHD-FO@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeivedtfeegtdekheethedttddtfefhhfegjeeljeejleduvdfhudegvdekheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmr
 ggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 11/02/2025 à 11:44, José Expósito a écrit :
> On Thu, Jan 30, 2025 at 02:48:20PM +0100, Louis Chauvet wrote:
>> On 29/01/25 - 12:00, José Expósito wrote:
>>> Add a list of CRTCs to vkms_config and helper functions to add and
>>> remove as many CRTCs as wanted.
>>>
>>> For backwards compatibility, add one CRTC to the default configuration.
>>>
>>> A future patch will allow to attach planes and CRTCs, but for the
>>> moment there are no changes in the way the output is configured.
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>
>> Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>
>> [...]
>>
>>> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
>>
>> [...]
>>
>>> +static void vkms_config_test_valid_crtc_number(struct kunit *test)
>>> +{
>>> +	struct vkms_config *config;
>>> +	struct vkms_config_crtc *crtc_cfg;
>>> +	int n;
>>> +
>>> +	config = vkms_config_default_create(false, false, false);
>>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
>>> +
>>> +	/* Invalid: No CRTCs */
>>> +	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
>>> +	vkms_config_destroy_crtc(config, crtc_cfg);
>>> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>>> +
>>> +	/* Invalid: Too many CRTCs */
>>> +	for (n = 0; n <= 32; n++)
>>> +		vkms_config_add_crtc(config);
>>> +
>>> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>>> +
>>> +	vkms_config_destroy(config);
>>> +}
>>
>> Same as before, can you rename the fonction to
>> vkms_config_test_invalid_crtc_number
>>
>> [...]
>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
>>
>> [...]
>>
>>> +struct vkms_config_crtc **vkms_config_get_crtcs(const struct vkms_config *config,
>>> +						size_t *out_length)
>>> +{
>>> +	struct vkms_config_crtc **array;
>>> +	struct vkms_config_crtc *crtc_cfg;
>>> +	size_t length;
>>> +	int n = 0;
>>> +
>>> +	length = list_count_nodes((struct list_head *)&config->crtcs);
>>> +	if (length == 0) {
>>> +		*out_length = length;
>>> +		return NULL;
>>> +	}
>>> +
>>> +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
>>> +	if (!array)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	list_for_each_entry(crtc_cfg, &config->crtcs, link) {
>>> +		array[n] = crtc_cfg;
>>> +		n++;
>>> +	}
>>> +
>>> +	*out_length = length;
>>> +	return array;
>>> +}
>>
>> Same as before, can't we use an iterator?
>>
>> [...]
>>
>>> +static bool valid_crtc_number(struct vkms_config *config)
>>> +{
>>> +	size_t n_crtcs;
>>> +
>>> +	n_crtcs = list_count_nodes(&config->crtcs);
>>> +	if (n_crtcs <= 0 || n_crtcs >= 32) {
>>> +		pr_err("The number of CRTCs must be between 1 and 31\n");
>>
>> I agree we need some logs, but I think pr_err is too agressive (i.e may
>> be considered as an error by some test tools).
>>
>> I think we should at least:
>> - lower to warn/notice/info
>> - use drm variants of the macro
>>
>>> +		return false;
>>> +	}
>>> +
>>> +	return true;
>>> +}
>>> +
>>
>> [...]
>>
>>> +struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config)
>>> +{
>>> +	struct vkms_config_crtc *crtc_cfg;
>>> +
>>> +	crtc_cfg = kzalloc(sizeof(*crtc_cfg), GFP_KERNEL);
>>> +	if (!crtc_cfg)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	vkms_config_crtc_set_writeback(crtc_cfg, false);
>>> +
>>> +	list_add_tail(&crtc_cfg->link, &config->crtcs);
>>> +
>>> +	return crtc_cfg;
>>> +}
>>> +
>>> +void vkms_config_destroy_crtc(struct vkms_config *config,
>>> +			      struct vkms_config_crtc *crtc_cfg)
>>> +{
>>> +	list_del(&crtc_cfg->link);
>>> +	kfree(crtc_cfg);
>>> +}
>>
>> Same as before, the pair add/destroy seems strange.
>>
>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>>> @@ -181,7 +181,8 @@ static int vkms_create(struct vkms_config *config)
>>>   		goto out_devres;
>>>   	}
>>>   
>>> -	ret = drm_vblank_init(&vkms_device->drm, 1);
>>> +	ret = drm_vblank_init(&vkms_device->drm,
>>> +			      vkms_config_get_num_crtcs(config));
>>
>> At this point we only create one crtc, can you move this change in the
>> commit where you create multiple crtc?
> 
> Since the code to add more than one CRTCs is unused but technically present, I
> think that this is the right patch to use this function.

I don't totally agree: you can create multiple vkms_config_crtc, but the 
code only creates one drm_crtc.

For me it is more logical to keep 1 here, as the rest of the code only 
creates one CRTC. With the next patch, the code will create more than 
one CRTC, so it makes sense to use vkms_config_get_num_crtcs.

It is not a strong blocking point, but if a v3 is needed, could you 
change it?

> Anyway, at the moment it'll always return 1, so it is a no-op.

The current user is only default_config, so yes I agree, it is always 1.

> I didn't change it in v2, let me know if it works for you.
> 
> Thanks,
> Jose
> 
>>>   	if (ret) {
>>>   		DRM_ERROR("Failed to vblank\n");
>>>   		goto out_devres;
>>> -- 
>>> 2.48.1
>>>

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

