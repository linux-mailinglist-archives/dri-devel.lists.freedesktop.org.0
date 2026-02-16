Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBU9JBjxkmlA0QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:27:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2A114256B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C058410E219;
	Mon, 16 Feb 2026 10:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QoVCZpcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7627910E219
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771237651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hk8CBoYpz3dwO5PhoMkU68RAZD40pLAZOBfvpSAMLv0=;
 b=QoVCZpcxkMpHDDTySVYhoYfW9ukq81DXHgQr/qIMQI1yTkY9imYFzHZcRuiUc70WQn9PqP
 buBhLLmNY3D2G/Eq2/zClJxw4PpOXu0kbZ7E11yGpFq4NBoOxkwoDURxOxvmDIYuhD9qdl
 0aZRw97x6Tpxro3z5KfNaCb4E5Fjipk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-e657c8ayNPenjbL-KO-NLg-1; Mon, 16 Feb 2026 05:27:30 -0500
X-MC-Unique: e657c8ayNPenjbL-KO-NLg-1
X-Mimecast-MFC-AGG-ID: e657c8ayNPenjbL-KO-NLg_1771237649
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-437700715ddso3073283f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 02:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771237649; x=1771842449;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hk8CBoYpz3dwO5PhoMkU68RAZD40pLAZOBfvpSAMLv0=;
 b=BET9stja+ZHwVWTxOBMvIT8mOD/7ZiBwqiqZ0CBSZ5HLcFvyLQZsfsi2esLFrjS1UA
 TYcXe33Gd61l9vaQzpcIq8ThbB0rhpdCmaKJqRugwSR9zzId4avRVhtr6N5UO/fhqVcp
 Besqef3hlq00fAV+YDiDaBYoQr/d+LImXfOg+O09ZZj5E+pJtvM/pd3oVjQ8mwb4el4m
 hz71pnLLxT8TH4mc6Cnyg4UibK54PDp/epbI8UEzYh+4aNUQNA3Xez0FD8gS+cOLcxQf
 p9SN6FX77Pgv8WQNp0PLI+iJPJMipyuepLOgk/VZbGpapKdsqg7/Z204afcNUFv/nIBr
 JSVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyAi28AVs/+GFlvhF5Jfd+1sEiOMnnkC4jvvQFTNNacnMhufyF0c0ZFjXtKTSaAdquMw/sO/fpD2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5Y/FQSQEvA+wt/GcucoscTRAQLuYnSo1U3X+hpIeAlrsHk1Q3
 RFTMP3yOMgdQa4KExsDwGYyG0m/x+Z0puFIEXNTI2Zg/KJCcJ2w1KannHc+R7eV02Wzwm4T2AmF
 UYBSjQRaS695ns/Wo18DlCRjIaSyGVznwlh6VKplyyR4N1UJNOJ16eIAzeLuWvnl87FxlXQ==
X-Gm-Gg: AZuq6aIIqF3YlkqWol8cGJLPAwh6M62+aeBBsH06bZPIXuo7NLERoxHyOiE4ZcwB8ot
 kngqGT7ooz0MCMxZCSSJFMpSYJqSJvYm0hxsUumvRggjk0WdVqekmXZqEu4OonSt0rJiqtnw2+G
 W2ADeOTFxXtAe/+4TD7j2swaes+ylAL3q3DEW0fAhFsjy2KaUt2p8QOeHHVoQYB9L3xslvS5u9X
 Np/jpeAPVkhiAgMMi42F7KwMi51epDAUa50PHKiZqkDnIVappXr/fepewApD7RE7fYWbU03CXDq
 Rsv6r7C1zajX8HDNH7ZluYGq0MT8wf5k80NekVHfTjdlA3csrZQl2znFwazWJJg+cN/f2642w86
 qYLSp98xCiXDsjd1iCLTlISP7149KNsZ/AAFtSqWmoTOUgQmkVyapDht9Fud8AStI27heSf1oFw
 PQqw91
X-Received: by 2002:a05:600c:8b4c:b0:480:5678:1fdd with SMTP id
 5b1f17b1804b1-4837105240amr173558745e9.12.1771237648686; 
 Mon, 16 Feb 2026 02:27:28 -0800 (PST)
X-Received: by 2002:a05:600c:8b4c:b0:480:5678:1fdd with SMTP id
 5b1f17b1804b1-4837105240amr173558365e9.12.1771237648269; 
 Mon, 16 Feb 2026 02:27:28 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483719b8e71sm236692635e9.2.2026.02.16.02.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 02:27:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org, samuel@sholland.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 12/12] drm/sysfb: corebootdrm: Support panel orientation
In-Reply-To: <20260203135519.417931-13-tzimmermann@suse.de>
References: <20260203135519.417931-1-tzimmermann@suse.de>
 <20260203135519.417931-13-tzimmermann@suse.de>
Date: Mon, 16 Feb 2026 11:27:26 +0100
Message-ID: <87bjhp6l0x.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RYAzeOO2c597q4lXzDP_1SRewdTMmeb74mqp3PNOwFo_1771237649
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:tzungbi@kernel.org,m:briannorris@chromium.org,m:jwerner@chromium.org,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,chromium.org,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ocarina.mail-host-address-is-not-set:mid,chromium.org:email,suse.de:email]
X-Rspamd-Queue-Id: DF2A114256B
X-Rspamd-Action: no action

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add fields and constants for coreboot framebuffer orientation. Set
> corebootdrm's DRM connector state from the values. Not all firmware
> provides orientation, so make it optional. Systems without, continue
> to use unknown orientation.
>
> v3:
> - comment on _HAS_ORIENTATION semantics (Tzung-Bi)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Julius Werner <jwerner@chromium.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

