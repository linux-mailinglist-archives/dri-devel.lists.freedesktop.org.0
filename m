Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF6tBT4xd2lVdAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:17:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AD085ED1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C783D10E1AB;
	Mon, 26 Jan 2026 09:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IHkj/0QZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6C610E38E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 09:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769419061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMBiMhMyr6xtgEfNyItwjSVfZSxrNBSXMIyD+OThTgQ=;
 b=IHkj/0QZra/DNwxzbfDsImcQ9XZws1fCcctj9YpvFraLzbDHE/gHMktpSmimN6TLA5xyNV
 kOiMSQFXzHXTHtObEWeiqwbmyvHtbIAvZntrCLX9d8QcBwdjj617LCyZUiU/Zj/d4jVtw1
 7qBFhIhNfQvsqvo3IcBVJfMuO/+7CsU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-fYzmBqlWMVu-UulFi1mCYQ-1; Mon, 26 Jan 2026 04:17:40 -0500
X-MC-Unique: fYzmBqlWMVu-UulFi1mCYQ-1
X-Mimecast-MFC-AGG-ID: fYzmBqlWMVu-UulFi1mCYQ_1769419059
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4779d8fd4ecso26030795e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 01:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769419059; x=1770023859;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cMBiMhMyr6xtgEfNyItwjSVfZSxrNBSXMIyD+OThTgQ=;
 b=khZhHcAZXJkOwWPoT8N7nNrQ6Iy0HYotCfyr/k5CVYKPy6oCPNKZlWD/43rueYdi7K
 w3FhgDGNkRj6Lu0VDUqYu1hLA+/zMxCd/rz9EFezLFOTh/Vhhz1UCvp8mncWTeQ+UILx
 dIh+M7sgkbW4oLs30kM/123DAvopFcc1nGM3P12xbqUEdxd6QZSoxeFsOQG406GbhlGU
 d2zzQqunq2mMaVvxEvqxFxr5zWiFuPsVbjUpYRf0eKorOJT8juqHwBt/ALoWlRFTf8TV
 vBXnKkhFNIqVSY4CdHY4gL3s9QXg7bODqao80AbkPSUAVT4A6TH1wuIwujk6aiRGcTiz
 KkzA==
X-Gm-Message-State: AOJu0Yw6SOMK7UFeVYCC0ubSB75PO6JXdYE7SihDfMs2zsb9CDBIshIr
 QO3VIhTxlYX6DbPx0srahJKW7retsUpgGNUNRtMKSJs7ljdHMo3XFGyuhvJyhHiaoyiPB/SSkAC
 pKzmnmC9q4C2gKvzuIKRu4b7PmlkEQcMMXAH+wxpWWjQchNeckeGfl4StdDCwP+4RZAGmyA==
X-Gm-Gg: AZuq6aKkCCiaRMM3DZjus15Kb4Szf159Vic9NJ6TLsorlKDctSClZO+3pS1fiuG9oAd
 JVZQ1bYMQU5EzyK+G3hMZ7OpTZT/CiEO+lD4GWHkt+RfTbpsBiuZGvUMKEruahL5ukE/CkhwmNy
 9n8Z3nR7Z0lyUKCTmYYMuzIgT1DhB9SZ7lDns4RYCdPsZuD8QRwfl5e2rIq5ogwmh1eI1uRyIT2
 hWoAGolZdWRhESxcDfixYHQU1yfDvq3BthB7svGVloars6epirmES4q3Fqjh2W0hzaGZ7YFRQKG
 WzByOpccDuPnr5qedcvX3vDiCddu/m3rUg8IqF6TkuYugKingMb1i098n2BgjA4C0MW0aSYnkSB
 5qEftv5L12y1eRrxn2JFFA80JKTe+3g+fw6jPZmKxY9CWnK9RgA==
X-Received: by 2002:a05:600d:6446:20b0:47d:7004:f488 with SMTP id
 5b1f17b1804b1-4805ce43947mr46320595e9.10.1769419058624; 
 Mon, 26 Jan 2026 01:17:38 -0800 (PST)
X-Received: by 2002:a05:600d:6446:20b0:47d:7004:f488 with SMTP id
 5b1f17b1804b1-4805ce43947mr46320285e9.10.1769419058249; 
 Mon, 26 Jan 2026 01:17:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470287c3sm354118945e9.3.2026.01.26.01.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 01:17:37 -0800 (PST)
Message-ID: <20d6d8d6-9150-4eca-9f18-65599e8ac5c0@redhat.com>
Date: Mon, 26 Jan 2026 10:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Fix the potential loop that causes kmsg to not
 display correctly
To: luyuantao01 <luyuantao01@163.com>, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, luyuantao <luyuantao@kylinos.cn>
References: <20260126054059.295-1-luyuantao01@163.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260126054059.295-1-luyuantao01@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GGYK87ORhs8JrGCIAVdT_Vo6hDx2xqjVDuKtE4M7iog_1769419059
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luyuantao01@163.com,m:javierm@redhat.com,m:luyuantao@kylinos.cn,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com,redhat.com];
	FORGED_SENDER(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 80AD085ED1
X-Rspamd-Action: no action

On 26/01/2026 06:40, luyuantao01 wrote:
> From: luyuantao <luyuantao@kylinos.cn>
> 
> When kmsg_buf completes drawing the screen and yoffset is less than 0,
> kmsg_dump_get_buffer continues to obtain the buffer. This potential loop may
> cause panic_flush not to be executed immediately or even not to be executed
> at all, resulting in a garbled screen display instead of normal logs
> 
> So, the loop should be exited immediately after drawing kmsg_buf

You're right, the loop should stop when the screen is filled.

I would prefer writing it like this:

while (yoffset >= 0 && kmsg_dump_get_buffer(&iter, false, kmsg_buf, 
sizeof(kmsg_buf), &kmsg_len)) {

Can you send a v2 with this changed?

Best regards,

-- 

Jocelyn

> 
> Signed-off-by: luyuantao <luyuantao@kylinos.cn>
> ---
>   drivers/gpu/drm/drm_panic.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index d4b6ea42db0f..4b44011b4be1 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -592,6 +592,9 @@ static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
>   			end = start;
>   			start--;
>   		}
> +
> +		if (yoffset < 0)
> +			break;
>   	}
>   }
>   

