Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEaRNBo/d2mMdQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:16:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297C86A2B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C5410E3EA;
	Mon, 26 Jan 2026 10:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y29ILug6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967B110E3EA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769422614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOPeWltKvwqpkHvBqU7aJP4B6QY+1Ti24SFT6tUdBZ4=;
 b=Y29ILug6W4YqhJjHT7MBKpgXb6APRBEtABgkoPeoSGP4SsuWhbVr+nVG864gkGLB8dUkgW
 IxhNF1szdFnTUX+dEhlGmmM3pe78csrQFmG5juC4Ssap6lwn+znnyeCmTqm5QD9KCJOSfJ
 oCPCBCixZveymx42bBPT+s2to0ETbic=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-2zLhzKz0MkinyDKPKoRdWg-1; Mon, 26 Jan 2026 05:16:53 -0500
X-MC-Unique: 2zLhzKz0MkinyDKPKoRdWg-1
X-Mimecast-MFC-AGG-ID: 2zLhzKz0MkinyDKPKoRdWg_1769422612
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-480600391e2so7598285e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 02:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769422612; x=1770027412;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FOPeWltKvwqpkHvBqU7aJP4B6QY+1Ti24SFT6tUdBZ4=;
 b=GdpLATEVH30daYV1V2hkDR3IEkKASsyst7d6BQguy6ZwSEenrz8unccK058I5/sbk6
 mcQzrXzflDjzmNJqmjtL6W06jUPxXNXf3fJrmgw4UujN3meTipb0d5TjHHd0nx+XU5cY
 gpeHPgijk75TqXWlLKz+WjoTuGZP8ep7PbVj9kaDxNnlwbBkX+QbvV5MmGBMjU2SLRfZ
 YOmLoEuSG/6W5JuF86f3JwA4umx5gDB1W4bA0H2cFcze9Fd2h1818aJd2rt5uhN7IFge
 a0JPspw8W77dFrOJsl326uLV6QGXZ3n++vQvCn190HDroK3rdst+q/jYrhVBeyLXgv36
 xyOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2BI2s6dzLN2nnbFnhKCe6aljFWlFL9W1P2UUPw2600xrQKxT9goArzZhK++zw/yRGMnOR1ctrDUQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzugYS0d4htDxha6T/GSuM99FjVa2gybcZX5PNLSFJ9nFtQkb6O
 QWINK3K2UW3aawbncF4sK3DKhL8gjSza283625X4bkKCduSmjR/KSkkuw+7Md675Rf3A5yTVUTX
 mpcpzAhS8njSKc7s3DzgF8sIDxz41u2fySpjzCDyLw0QPebxSZQZy79tOhx7Spf4lHKPMig==
X-Gm-Gg: AZuq6aJhz1ZR/XTE4hyQVxet7JHg2QUOlz1V9SYKdL/ydogmCwsWMNqXJPMa3EP03Nr
 +IUkSlARGiMabsAqLnj9bRrZtOfwIcxWXglH+oA14bb9roSq2GWKLJ3KFbCp/rEMgKEDkepuQZN
 OQuF7gGbpXiEyf9Iy25EXCgVH94tFh74/yxRZNOc+CBAHxKfzVxyac6di3zES/XTo1OcAv/z0aG
 0ZaH7Ew54vk1DMkANZLRJbszrbzezQGWnNwf5P67GIpEibLSvEKKXdDoQpMt7nBEuU8tQhr87T0
 DxLduMGVgiHERMw348413ZetvuSu4eQC453fQ8al5KVNOocpSm7Z5lvVB+YZvE83MF0fIqmk/ET
 tPeI7JQo5H+gl45MQrGBF4WDxFpGd9oBv5LsFpHz8YIeF2KBmWQ==
X-Received: by 2002:a05:600c:3ba0:b0:47d:5d27:2a7f with SMTP id
 5b1f17b1804b1-4805d064554mr66480065e9.26.1769422611662; 
 Mon, 26 Jan 2026 02:16:51 -0800 (PST)
X-Received: by 2002:a05:600c:3ba0:b0:47d:5d27:2a7f with SMTP id
 5b1f17b1804b1-4805d064554mr66479665e9.26.1769422611215; 
 Mon, 26 Jan 2026 02:16:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470dc21bsm321546145e9.15.2026.01.26.02.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:16:50 -0800 (PST)
Message-ID: <ae82b144-7f95-41d7-be8c-7c76a0c79d91@redhat.com>
Date: Mon, 26 Jan 2026 11:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: Fix the potential loop that causes kmsg to
 not display correctly
To: luyuantao01 <luyuantao01@163.com>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 luyuantao <luyuantao@kylinos.cn>
References: <20260126054059.295-1-luyuantao01@163.com>
 <20260126100732.365-1-luyuantao01@163.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260126100732.365-1-luyuantao01@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j0XR6NyueVIEzsLP9heTp7_R-h9jVlQfNbeD2sDYrhA_1769422612
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luyuantao01@163.com,m:javierm@redhat.com,m:luyuantao@kylinos.cn,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email]
X-Rspamd-Queue-Id: 0297C86A2B
X-Rspamd-Action: no action

On 26/01/2026 11:07, luyuantao01 wrote:
> From: luyuantao <luyuantao@kylinos.cn>
> 
> When kmsg_buf completes drawing the screen and yoffset is less than 0,
> kmsg_dump_get_buffer continues to obtain the buffer. This potential loop may
> cause panic_flush not to be executed immediately or even not to be executed
> at all, resulting in a garbled screen display instead of normal logs
> 
> So, the loop should be exited immediately after drawing kmsg_buf

Thanks, for sending a v2.
I will push it to drm-misc-next in a few days if no other comment.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: luyuantao <luyuantao@kylinos.cn>
> ---
>   drivers/gpu/drm/drm_panic.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index d4b6ea42db0f..f7289dbf2ef9 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -574,7 +574,8 @@ static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
>   	drm_panic_fill(sb, &r_screen, bg_color);
>   
>   	kmsg_dump_rewind(&iter);
> -	while (kmsg_dump_get_buffer(&iter, false, kmsg_buf, sizeof(kmsg_buf), &kmsg_len)) {
> +	while (yoffset >= 0 && kmsg_dump_get_buffer(&iter, false, kmsg_buf,
> +				sizeof(kmsg_buf), &kmsg_len)) {
>   		char *start;
>   		char *end;
>   

