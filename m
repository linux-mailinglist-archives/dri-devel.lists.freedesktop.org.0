Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IzjsNnK0rGn5tAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 00:27:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8AA22DFB7
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 00:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABA910E030;
	Sat,  7 Mar 2026 23:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wKJtZZKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12D610E030
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 23:27:41 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-4138136f02eso3988129fac.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 15:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772926060; x=1773530860;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0GnJdhG5dPcNKz/714FaQVTOCUr58X47IDgpYtPFows=;
 b=wKJtZZKcuAqiAxF1ghuEYAQ0U1Wk2WbyYrY+auI0cyyOt3B4Gl9UssKHxS0dJiI856
 u3VtF959uc9pbmta+F8II3ISUbWoRKVopmXqqkKUHNwzECZGaAxjYVSQSq4dCz0bDG1n
 P0uErrFRGSBhNFkKNOKr+QwXrxdCGac8BSikw1ZMIaM0EAMdsrMyN/TO9ACl8fuACEN3
 6RZ9HU8OVJLi7rjGPDU/dI4ZOQzq9fGQQsJA7ZmA0klGMcEpuRe9vtuA9qibs5aiGcao
 0VuisB8UfRXMKF/v9rc0hvNa5hhbbWjTFTXbLPyP+iXhwWgzXCpfuxAVkHOsC8zORPoL
 E77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772926060; x=1773530860;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0GnJdhG5dPcNKz/714FaQVTOCUr58X47IDgpYtPFows=;
 b=rQge7ppWlLkuNl4Rjq7hSE+i1ZUzoDN+KKrYZ6ROdMjgzte2zfUXPF1YF430Sx4VL7
 1rfZSAEA6lgqQmLriAA+vk9z0gdOyz6jM2ce8oD5US1UMQC4M5Gt0BlXnCQ1bNELxqpz
 Vj2v4+qKOI+fhb7RVcuLrcHMhlc0tNh7SDB8HmLGcSJ48dJLraas8ZtBrsMSj271nC01
 KU2Cx0OdoZnM1RtqeiljUXZkHOtcU+Mhmnb2byX0BBEPtFg6C9yu3RhL9w6Oc46Jdm0v
 qNekKEVW9OBSOoMa5qgaBoN7GWduaq70nkc6aMRDnONrV8wvEIs/uBlfFQy1t7sJqwBh
 eiIg==
X-Gm-Message-State: AOJu0YwoMhIHqBvVXt0wBnRSTZ/uoIL/viuZsP5ZI+WAI2LXHZUyf8KJ
 ApCNzqqjb15pjZlTFNwWzd/6jHwsCvBb1X4g+jiJXlqh4aWsGDyvyyJnQlQpdHwr+G4=
X-Gm-Gg: ATEYQzxRgB+vcPrTwipteJdMyGy+yk7CNOct5OC3ikw1kxIVPGQksiAqRFTu3pHhiCx
 IcLohK93bsYlRV0StR28k4iB4CXTtQxqwbx8TvZg/z74IVX3nQvC26FGnV4KL0i9auff+8jjHOV
 Af6H2zyg1SWfobCMJ+3r+yzFG3Qki31Y+G2YQE6MoeQkPCwwTXAvMQKjtcVFEh9qTPMz+xHsXZm
 2z9mpajP8cMJSsw5TAJ6Ln3l/fSTZsb6MDnZlu1D9nQBzG/txk1TcmX2jXv1VAArkEviX0R1DUb
 97nIP+y1xjevpadJCsbZ0Hltpu+MB3wlTR25Hvqt15lUK8TAGSBCG2dO5AA9ihX8K76eb140MAN
 pvay6Xwbkl/42ornPA0DW+MOwmqdDPkS0JUW3eruvRTyY4BhV+/Z3pe02bEWgxBv0ySROzdaNm5
 t3NXyP1e18QSa6pUAB1PxeeR/4q7cXYyB+V72b636RW2WpwxuxPFBgBGQdtnGzzUdN542QUotm2
 w==
X-Received: by 2002:a05:6871:5311:b0:417:1cd9:d382 with SMTP id
 586e51a60fabf-4171cd9d7acmr567580fac.4.1772926060371; 
 Sat, 07 Mar 2026 15:27:40 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:cccf:5174:fa72:c520?
 ([2600:8803:e7e4:500:cccf:5174:fa72:c520])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-416e67d9c9asm4800051fac.13.2026.03.07.15.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2026 15:27:38 -0800 (PST)
Message-ID: <ca862f40-1dbd-4056-9f70-8ec3d6789604@baylibre.com>
Date: Sat, 7 Mar 2026 17:27:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sitronix/st7586: fix bad pixel data due to byte swap
To: Javier Martinez Canillas <javierm@redhat.com>,
 David Lechner <david@lechnology.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260228-drm-mipi-dbi-fix-st7586-byte-swap-v1-1-e78f6c24cd28@baylibre.com>
 <87cy1iv9zb.fsf@ocarina.mail-host-address-is-not-set>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <87cy1iv9zb.fsf@ocarina.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 3C8AA22DFB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:david@lechnology.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:noralf@tronnes.org,m:lumag@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,lechnology.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,tronnes.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action

On 3/5/26 4:36 AM, Javier Martinez Canillas wrote:
> David Lechner <dlechner@baylibre.com> writes:
> 
>> Correctly set dbi->write_memory_bpw for the ST7586 driver. This driver
>> is for a monochrome display that has an unusual data format, so the
>> default value set in mipi_dbi_spi_init() is not correct simply because
>> this controller is non-standard.
>>
>> Previously, we were using dbi->swap_bytes to make the same sort of
>> workaround, but it was removed in the same commit that added
>> dbi->write_memory_bpw, so we need to use the latter now to have the
>> correct behavior.
>>
>> This fixes every 3 columns of pixels being swapped on the display. There
>> are 3 pixels per byte, so the byte swap caused this effect.
>>
>> Fixes: df3fb27a74a4 ("drm/mipi-dbi: Make bits per word configurable for pixel transfers")
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
> 
> The patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

I pushed this out with: dim push-branch drm-misc-fixes 

(It's been 5 years since I've done that, so hopefully I did it right - I followed
the docs and it all seemed OK to me).
