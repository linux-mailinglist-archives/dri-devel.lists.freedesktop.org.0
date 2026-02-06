Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHyhEnPvhWkPIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:41:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EB2FE4E4
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA49A10E74B;
	Fri,  6 Feb 2026 13:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zrQVBB8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE3010E74F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:41:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so25711355e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 05:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770385262; x=1770990062; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=L4wcUhQ3FNh4u/EXh+x6aUXh5+ro8iD671/61i0x1bc=;
 b=zrQVBB8QgKLorGDoQ2MHfcMEnFQzUq9JnmnL8JaGMTGvg2AlyZK6yIEv9N3uw5Q9vN
 C9Rfm7qbtga81V1DNHt56bY5+gqQXB2Ggc9ISkLb/JaVvwskA62cpXvlaaf60o6c0HMi
 aGUzMV9g8XjfVYUI3KpQRs90ewvV0fOLJgLCBI7iFLVBPD6eH3HmHzKKIZzPb9bu/T4S
 Zvyr/oNjRswUoLS9Ypy5JCOtyrSxYm8VQnQbPcGsOjjdGqP1cNC4Oq3L31cwhKSYVhHv
 LL7EW2YVTHz5eQV0xbZnVSrWFxHDdG1lNfk98djfBKD657cWXQiW8YEwIHP8tR2+09y0
 8oRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770385262; x=1770990062;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L4wcUhQ3FNh4u/EXh+x6aUXh5+ro8iD671/61i0x1bc=;
 b=QvvIixwgQ3hPwslC+QbQIBUNwuXMogR9D7xi2cwoEk4tcr/k95HNVCkTf5CmEp+2o0
 ASVUeD02+cRosmIhUWwyN7VMsUDAjsKRuMp3yO9GKkIOZriTzpaETRrOz1Ae/wweAnlM
 IAZvQGs2jXqEUZLYhWn6xV2sRqSDgRcbOrHbtSlE53IndwzK59G8wI6pwTAAzUt4p4+p
 4VZeIiMWQvTLkxizP1QzU97PKAU5+abC+p9leb8n7y7gKp8NP8RsZJMcgcWv146tYyPM
 km2b+fpj4KHzofB9Xbeuo6XHKU5tAgisF9QRQslSZtrJOgbTEFycgOoRpN5xtTsmT2Jx
 h/Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi7qBMZYA32sRFGSWQJp7KPvMiHeVQYzPPUrDYoKpXASIOaV2z4DCb3AmqkPd1bH6l+66iPZ6mmPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1AvncRc3snWFo4nxdNTcIJbLNT6+qoqK1/IZA9XCiWrcE7/XF
 hFvR4+qFJALuyzevA7NPlwZkCaV97NSP3rrjZnjoTS/cqIqtkauUTaE/mmbWpoAsi9bXpnnrJCm
 I0zC1UeA=
X-Gm-Gg: AZuq6aL8urJ1EMTWS1k/plHrhLvZbuE+bTzT4y5GNZHsSdQ22DigfhJqhfvcY0DaWYU
 bqK3QNHSwCf+lwnVqPRq/IdpQyvs+LtIoO+fHffHiUcoGNVuarCWNcYSlms/yCmTdUFTUiI/ICx
 SORUY9+KX7FdSk3KRGaTgy3M4iqjgLPBlrepZQZpUx/y65u56WON6+wcmT+jsZOXMGrMSHE1v9C
 HDyYzLOqEOHlKo+2O2ZmCpVfc3QR9tjRs+VfExuT+SB4heHEN1GHGtqTsp1aMmPQr2vF2T7llTb
 XmHMSu35ip0hb3fbVx2fm2qOWvaHqjx6HphuqFWYhRNpwm6AFxSBKsg9+aBD+hFWt0r7bz5VWNb
 vNsRp/nc/mGowZXhtqFqy1BqB0dGI4Ni7h7p/rkL9qhGD4qg5yAQC8NhxTDwgxnl6cPJRVExNdk
 eOaKHYdk7EoPZUf7OY
X-Received: by 2002:a05:600c:4444:b0:471:1717:411 with SMTP id
 5b1f17b1804b1-48320216ccemr42226725e9.24.1770385262076; 
 Fri, 06 Feb 2026 05:41:02 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d835f0sm127113025e9.14.2026.02.06.05.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 05:41:01 -0800 (PST)
Date: Fri, 6 Feb 2026 16:40:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] drm/amd/display: Only poll analog connectors
Message-ID: <aYXva0vNgvjdwvk2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:amd-gfx@lists.freedesktop.org,m:SRINIVASAN.SHANMUGAM@amd.com,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.961];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,stanley.mountain:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 99EB2FE4E4
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Timur Kristóf,

Commit f6cc7f1c11a7 ("drm/amd/display: Only poll analog connectors")
from Jan 18, 2026 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:940 amdgpu_dm_hpd_init()
	error: we previously assumed 'dc_link' could be null (see line 931)

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c
    923                 /*
    924                  * Analog connectors may be hot-plugged unlike other connector
    925                  * types that don't support HPD. Only poll analog connectors.
    926                  */
    927                 use_polling |=
    928                         amdgpu_dm_connector->dc_link &&
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The patch adds this NULL check but hopefully it can be removed

    929                         dc_connector_supports_analog(amdgpu_dm_connector->dc_link->link_id.id);
    930 
    931                 dc_link = amdgpu_dm_connector->dc_link;

dc_link assigned here.

    932 
    933                 /*
    934                  * Get a base driver irq reference for hpd ints for the lifetime
    935                  * of dm. Note that only hpd interrupt types are registered with
    936                  * base driver; hpd_rx types aren't. IOW, amdgpu_irq_get/put on
    937                  * hpd_rx isn't available. DM currently controls hpd_rx
    938                  * explicitly with dc_interrupt_set()
    939                  */
--> 940                 if (dc_link->irq_source_hpd != DC_IRQ_SOURCE_INVALID) {
                            ^^^^^^^^^^^^^^^^^^^^^^^
If it's NULL then we are trouble because we dereference it here.

    941                         irq_type = dc_link->irq_source_hpd - DC_IRQ_SOURCE_HPD1;
    942                         /*
    943                          * TODO: There's a mismatch between mode_info.num_hpd
    944                          * and what bios reports as the # of connectors with hpd

regards,
dan carpenter
