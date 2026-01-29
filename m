Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDmjLsSee2nOGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 18:54:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4EFB3464
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 18:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B299E10E253;
	Thu, 29 Jan 2026 17:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M89UFxJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B12110E253
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 17:54:08 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-352e2c59264so779305a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 09:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769709248; x=1770314048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRBeS4+WQmZOEFMKUG8W1VxyeXhFlcnz8q11qIvwb5g=;
 b=M89UFxJhHI6qbcUc9gyaDKKcgns+oBNp1sXgGbs/+cZ8rOxn7q3KrpvXeJDV5cT4mT
 3vnOx8p8ykM4/8l4hAbOJD5k9fe/RJtLTn3xhE+2KGUrp5dqT4rZggDP7rWLvl0+Bhk5
 QuCYgJ11M+wyCimScqaqbrMNsFdA/jtdL0qR30rWyBc+Z9TJ2Y2Ar/SdfVJIBaDDb3Vq
 GUh2+82xnnPWIxksc42RO6XhGtRpDYCynjZkdT70SMsxwvDDcVw/AEYbRYT9EqpvLhSB
 j4nCGiHC/tz/jYT7I7+p8WvNYMmpKLj8jy0lu3eOC/9NCu9ug0lRTNCDlsQ3ugq9ybzl
 I8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769709248; x=1770314048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pRBeS4+WQmZOEFMKUG8W1VxyeXhFlcnz8q11qIvwb5g=;
 b=t67w1XEFl4c9957YF43KklfT8q8B9HEcwmXt9l53vRRbrbwlTXoBeFD6ztYz/890Tq
 EAo6BWQVLTR3MWImiCz1FeBFC1ke3s22cEVO/IvBnp6fKBEmlQ5ehoBAwSHU3cts3/f0
 Vjy3jvG2gko83Cn1mKPlgCQ+wegVQeLObzB683aUFWSZAc+4j+1P/tFgnvNa4MsQLNWa
 0jqIhaFGxYSiW40JRcv+3dcANd4B7WgDMxdKvnd9HWthv2/AC+jaXJnGohAOzqhk8YIR
 W1q7ChmffX9xLKvWNMTW1Yxlmk6fyhtqDlopGPqrpoLzbMCfdIvV+TyroViX/Ey4kD3l
 JTUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXey9BljFid1oiUCkkxCiu9DRGLew+yGWxbQJR9gAe4It0fYeNLZMCcLVzbZiVzwrXfZr6uInsoTwA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX50SjjH6N4yj0fUNJJbXVf0sU4Tde/OsN/M0L5mXcnQokP4tZ
 +EBpMGIAqooTRsQ6pP7gNzIw7wUvHzj9RFtCHDWY9zpni43ph37I3hQ=
X-Gm-Gg: AZuq6aKDGAax4Q2qwNncV4pd9bE4+yoaBWmJju7MG9g6Opfry0eRpK4VXJfB8Y6HPhe
 N3/tebsiDi3kjC0iPKfnjXl32IKc+kihJnc59SD0M7CBa133emwjZA22dkrXA4tYQEIUwY3CS5w
 ID26CuMsTJG9twcV9wFl1O+ZmnbprvGX63WvJ4X8NOj7OdD0opJQ4YLVCgw5Bl/TLeyxHWbwgbC
 B+iM2mx/f6KaXJFNDhTNXI3r+e8ML49d5X6s+yNi7SFbYZ7G6ybG+w6WWaCwXf+i3/+nW7bnz1j
 /3v3keEshFCSyqcFtPxaQwR1y6JeMMNeveKZneZy+WmJvNd3gs5FWe98dFuNArRvz7tiJunZ1wW
 D7hF1mlXlkT5VVqok/9a9rL2sWX3qTHTGoc1fmavWTSiVJW9l+YP0RRpmgYVazafgOfVpr1rXO9
 FWwQMOednmNLVM
X-Received: by 2002:a17:90a:d60d:b0:32e:38b0:15f4 with SMTP id
 98e67ed59e1d1-3543b2dc1c9mr291029a91.7.1769709247945; 
 Thu, 29 Jan 2026 09:54:07 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3540f2cb5adsm5952303a91.3.2026.01.29.09.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 09:54:07 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: airlied@gmail.com, ardb@kernel.org, atharvatiwarilinuxdev@gmail.com,
 bp@alien8.de, dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple
 devices
Date: Thu, 29 Jan 2026 17:53:58 +0000
Message-ID: <20260129175358.1100-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXs3XOYucVna8eGH@wunner.de>
References: <aXs3XOYucVna8eGH@wunner.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,alien8.de,lists.freedesktop.org,linux.intel.com,redhat.com,vger.kernel.org,intel.com,ffwll.ch,ursulin.net,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:airlied@gmail.com,m:ardb@kernel.org,m:atharvatiwarilinuxdev@gmail.com,m:bp@alien8.de,m:francescopompo2@gmail.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:jani.nikula@linux.intel.com,m:javierm@redhat.com,m:joonas.lahtinen@linux.intel.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lszubowi@redhat.com,m:rodrigo.vivi@intel.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4D4EFB3464
X-Rspamd-Action: no action

> I don't quite follow.  The patch counts the number of GPUs and
> uses the set_os protocol if there are at least 2 of them.
> One dGPU + one eGPU = 2, so the protocol is used.
> 
> Am I missing something?

Well your not, and it was a mistake of me, which i apologize for.

but i still think a MacBookAir dmi check would be better, as
theoretically you can connect a eGPU to a 2013/2014 MacBookAir,
which would enable set-os, and will cause problems in applespi.c
