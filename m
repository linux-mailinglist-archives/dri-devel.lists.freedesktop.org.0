Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHO/Ly2ohWnUEgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:37:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBB8FB95F
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C12110E09C;
	Fri,  6 Feb 2026 08:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UHhrVouM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDBC10E09C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 08:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770367016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3lQpYEFf4qKduBMlQY0cApAO9JMrwUhcUNBWSEwShaE=;
 b=UHhrVouMUL+ulPQKC6H3n1HXEv6YurU6OvV4+vgkuDnoMRM55MABbcaVhUL/Ap+wzJskeI
 g9CzIwKUST99gAuooW2SlIpnqs8hL+2mdJ/5meZDc/gydJXWIdGS9uZ1zziJK5QQgC6vLR
 FYQQk8a294YOG8wPDotKvuk1pllFMqk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-BpaDuKN2MAGw_Ijvk3woWw-1; Fri, 06 Feb 2026 03:36:55 -0500
X-MC-Unique: BpaDuKN2MAGw_Ijvk3woWw-1
X-Mimecast-MFC-AGG-ID: BpaDuKN2MAGw_Ijvk3woWw_1770367014
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-43065ad16a8so1317942f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 00:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770367014; x=1770971814;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3lQpYEFf4qKduBMlQY0cApAO9JMrwUhcUNBWSEwShaE=;
 b=LYkCCZt058hqjaWZ9p+HaDvFcVrbPu3+hSy/RgglBru41X+jX+3Fv/1Jz+n9jZ5Jyu
 HzLrQePybPvFS7vrsQZSWxzwM6zxtHKSj1UdnIdsR+DlQYHak3TeN0R/1Qtq2FGFgc6P
 abIA27/vPgCzLwWMwd7/+xlf4KsISNo5tkQ6PmG7hwX5iGKoUZlLVLyLVBV87DeIGPI4
 WHVXy8evBXKzMeUPvX1Oi8W5r6fOA9y7tUonW9St4gVTB0Axh9JUi7Myzf2IMQZwUdwQ
 SR3Jj6ECjehsbZG+aEBY1FOk/M8FZVPXHAPSKVot7cjsf1GT0ENFZ+3/j/zxKdDOy5pr
 s6+Q==
X-Gm-Message-State: AOJu0Yx70ZxGummet3gt73ZOoTqfI6zVAnYPYlwqLckplgY9UcUh5YQR
 HS6Xlp0I/46BNxMHGhVrMb/8l+4VJ9pGLVzUVrIVRyEg/6S8w3XMaloI67o4y9w2FImEnQA9fJ7
 GXfHS1YfpleUg92YCrMQpDkFjWi7XVAFad+MXkbAxFQPd7pHt+gSlVFJLSIYjgFs95YGbcA==
X-Gm-Gg: AZuq6aKxRgiAjgz4V1yzB96EH7qOR5ZKxnNkvTPZ2YXSN56jqt9BZ7LuUeD7Nsll3uV
 J4dEGpebdrjwQ8VjEDZEjE7wOfUc7jFKliqtqCAmcet6fZii9HCPWNBUZiSo3Ep5FykQP61Gdhq
 jKOZjxlsISo0nTO/lWenKU1EIN8ywwfl0yLy38yYoX5G8BNTHOD8AGTMiBlOgWfkthyk+a+4nhL
 BjXhcQfqXEiHbKaz4D6hNUDCxjjctZ2dVMpa5Xs661+DlhXyIEA4YVyvCwap5BVj1FG9BQ5TvQ7
 fyw1nlhFIgkGg8OvrNKS8HIfhXJ3zo3No1sp/JwSwv2VowH9OyHuIoM16n6toQZfgMI90MX8C9o
 pAhgwP7qqsD0i/lpId1RVuQByaqSqdgrt2rV3iPefSKa6p8piJtFSuNBr5oy455MtcXIL
X-Received: by 2002:a05:600c:5488:b0:480:1e8f:d15f with SMTP id
 5b1f17b1804b1-483201d5fa2mr26643235e9.2.1770367014022; 
 Fri, 06 Feb 2026 00:36:54 -0800 (PST)
X-Received: by 2002:a05:600c:5488:b0:480:1e8f:d15f with SMTP id
 5b1f17b1804b1-483201d5fa2mr26643025e9.2.1770367013705; 
 Fri, 06 Feb 2026 00:36:53 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bd4desm4471225f8f.18.2026.02.06.00.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:36:53 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fbdev-emulation: Remove empty placeholders
In-Reply-To: <20260205141142.412048-1-tzimmermann@suse.de>
References: <20260205141142.412048-1-tzimmermann@suse.de>
Date: Fri, 06 Feb 2026 09:36:51 +0100
Message-ID: <87pl6igtek.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NwrnsJr0pX4FlHumI75Q5z44BgiEl2GFZgi0XB1TkNw_1770367014
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:jfalempe@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4CBB8FB95F
X-Rspamd-Action: no action

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Only DRM clients for fbdev emulation invoke fbdev helpers. Hence remove
> the empty placeholders for non-fbdev builds, as they are unused.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

