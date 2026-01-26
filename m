Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGwtAfXDd2nckgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:43:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A398CB46
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F1F10E47A;
	Mon, 26 Jan 2026 19:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K6oAUhRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D74510E47A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:43:45 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so54599955e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 11:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769456623; x=1770061423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PP34zip0q8gk27TkCvRw7z7MtmFir2U2vp8I+qSycPQ=;
 b=K6oAUhRUdlGL7E50Ms3FgH5Fw3WAjEn+coD0K1fC2qSc7YD6o3EpIehW2So+z4t4J+
 tefr8+q/Z31olEQ7wB6npVKEyP9UoV/Xap2PNYEHhIA2ZiARD0D9hJL27D8wlJekeBuk
 /3K6gxx6dvilE+kwdSSe9A6ZqTR0V07jhFvObVLR54WoZsf0CYwD1AXxplrHLiny7SOV
 IRHH6Lwcl0mnduYto+M1o4qgaDgEOkyDNPnYS6mqxfM99VUugRbrLQHR3TV4beUjsLjt
 +egGZobbRATiVp4PcH4Q19nRg5q8c1/jcryNwExiYq5nk8jtbdp7Je1E2t63yuc78kgb
 e9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769456623; x=1770061423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PP34zip0q8gk27TkCvRw7z7MtmFir2U2vp8I+qSycPQ=;
 b=F7D8JuFf42r8W7/dI5Wk4FnyyM3cUnvjeJuy7vBLgnsygPKgf+9LQkcaifVjhwiUpG
 mwlPuwtpcfuG3aVEus0OEDLeRJyHyeVMyL/P2x1mANfBL7PVLoWCT4EsiH5W5xa+nCEn
 TRsWbEM+VDZ4sDlOVVJ20e/6+qJ0oiQPuSYWYZesfQgCRBIuZIzY8bpbrCvAUOOafUOi
 DmaZOAIlVNosN1bjg+PN8boqB0oTNkoZMgKz8EGIIcowGOL0um038ZVrSpElqLRq2ubh
 b+GgygWbm2dVuq0OuWY3o9vOOYdYxLNpLS4gVarobwg06yjvAw4QrB4ZXEgHTs8F2Q13
 XGXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ3GF0xXZxJ53PZz8a/e4kGqBsTwVi3+lcmMeFKGybYp6nxL3zg27sVFnA4g+MOvhuRipY7nB9Nwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxXVVmAavwY+0LBoRN3l2s9Ohx9JRxFlwWT+54M9QgTfItEWHp
 /aNbd+wwJZd3UqTR506vc60XOzlAigKRmEU3lkzPpubvTumC8OrYQix6
X-Gm-Gg: AZuq6aKn5prTaEPojOWTQhGuRkc+A0rvQqb7yyVtZVU95MNqzY/lZJ7wCSySEvyhO+K
 UBqtpZXhpbcQk6bGLUTLHOaIRMTzA8fki+jSyffCA2FlnQKcnqDOLU3yd7lyTyy2F6+Hw0zucnO
 QdfjG6yxUkxxn63ejAburpXZXtIPKqlArV6NeUxcQShblja2x/TxhjYvYyG68ljHRNmzZmy8gkA
 IsnfmF0acDcl5uLlV1Nnq1xjytGVZF1V32g56G6FrBBYYaeQ5QEguOny128ek1V/iTlaAfRUeaW
 gxlbR8haLacxgKn7E7hcifkhcSlmEIuXzKbHpL6LLH5rdkNLttRzkJCwSejvfH2MOnnnMYy5Xmm
 H200bvjUVUOBDyX9gM0PJIwm0plgVQki5cWDi+TIn4HoHL5v9dvCLB78a+gnRMj7XVyKAhkCh3k
 0laDe7KYLmPdELggiAkBbg3sODWvTLnIhMXmWaTw==
X-Received: by 2002:a05:6000:2912:b0:435:9691:d525 with SMTP id
 ffacd0b85a97d-435ca0ecc77mr8258197f8f.13.1769456623344; 
 Mon, 26 Jan 2026 11:43:43 -0800 (PST)
Received: from ionutnechita-arz2022.local
 ([2a02:2f0e:c30b:500:c472:222f:bc60:d893])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c02cd8sm30838006f8f.8.2026.01.26.11.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 11:43:42 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: christian.koenig@amd.com
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ionut_n2001@yahoo.com,
 linux-kernel@vger.kernel.org, sunlightlinux@gmail.com, superm1@kernel.org
Subject: Re: [PATCH 1/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
Date: Mon, 26 Jan 2026 21:40:48 +0200
Message-ID: <20260126194057.7376-2-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <77fa0344-3507-420e-9d77-d454ace55cfd@amd.com>
References: <20260106125929.25214-6-sunlightlinux@gmail.com>
 <77fa0344-3507-420e-9d77-d454ace55cfd@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,yahoo.com,vger.kernel.org,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sunlightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:amd-gfx@lists.freedesktop.org,m:ionut_n2001@yahoo.com,m:linux-kernel@vger.kernel.org,m:sunlightlinux@gmail.com,m:superm1@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sunlightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 62A398CB46
X-Rspamd-Action: no action

From: Ionut Nechita <sunlightlinux@gmail.com>

On Thu, Jan 8 2026 at 13:36, Christian König wrote:

> Question is why the KIQ is not up and running before we do anything with it?

Thank you for the feedback. I completely understand that my patch is
just a workaround and not proper engineering - you're absolutely right
that the real issue is KIQ being marked as ready before it's actually
functional.

I don't have experience with GPU drivers and video subsystems, so I'm
not familiar with the proper initialization sequence for KIQ. I'd prefer
not to keep a workaround for this issue in my tree.

Is there a proper fix available, or could you point me in the right
direction? I'm happy to test any patches on my AMD Cezanne (Renoir)
hardware where I can reliably reproduce the issue after hibernation.

Also, regarding hibernation support: you mentioned that hibernation is
not generally supported with the driver. Should I expect other issues
beyond this TLB flush problem, or is this the main blocker?

Thanks for your time,
Ionut
