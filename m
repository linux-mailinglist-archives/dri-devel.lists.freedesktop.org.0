Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAH6A2dchGmn2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:01:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C98F034A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22F010E7FC;
	Thu,  5 Feb 2026 09:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="KKIiZIt9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D866710E7FC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:01:18 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-386914b8e81so14209741fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 01:01:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770282077; cv=none;
 d=google.com; s=arc-20240605;
 b=Cxy40zGwDOzLAc/nhpFNuJ65/9JoDCXqhglZX+/hFHSwnND4nCT219qF2Zd3S84TNZ
 udYw+lYNYZd0TD7o69iDqOa+cYUshd0IM22mqgAbotQiWfrm5Vl/9piybkOX8dS1szVj
 n7hKMF3WNNfcAbA5UuLl1aT4B6mTWXo8DLTlw+mp9zu606wq+rsVbc2X9jl816Y3mWq2
 RGFiV4q428HgBAE0wBNdvADC9k6LFFEsELVG1SeiIMK8b5uxbzmodjn1dI0wyHZcYhJL
 AczcyfHj+V/XQXeTOSHMBEgUXQpFMFVRmvpm1ec5xhIq3b3gRSAKGYey0qWzhXZMxQcP
 tJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kOJiDHAUee3jnKQG1PcpakG6aCbdXHtzEp0GromjiP0=;
 fh=P8N+gZXgCMlmcVqgq1oWrUanmBlZ5U2IlmS+z9mbLOg=;
 b=lMMcKv+oWpo0iMdYQB1YbMbvkShSg7t40eSJjhcaG1YVXm3QWndb0mxrtpYVhIxygC
 k9DGlmxdn+NRNm0cZ148Lvl8+dvnSjDxkkcB03lO5SiX+uWrvxS7IWSUuDY5Yd7CA5+j
 nWbfNhaUFDyQAFDeOy9lzUFGF2IIo+60SLkbluuoVKdF0uRcz+XrSGhUwORjFOU5Y408
 63GY6YcDxm9w5MiwVdDVgc2qq0EPe26Q0qhxntvE6njJ8vl/G1snHnXoXXOI76pezTZ6
 UbpG2Us+pJ3VNwGuz1joWGlqsD5Oy7zwON4NcqfIVbIHp1rduPmk/2ndSHap99x2QWTn
 bdSA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770282077; x=1770886877; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kOJiDHAUee3jnKQG1PcpakG6aCbdXHtzEp0GromjiP0=;
 b=KKIiZIt96Xl6bYBgpkM05rb5S5FCGpDcVjqgrrRxtVPSDiJzUMKVjZRsG9dN+ixR85
 rl+LgXaHpNT/OZ94OE14XCzwQF/XLy+zMeb87sxLinl7HZUt0sj3iWyvYCmMhRE4YTI0
 3h1V8OSnHyMpiaMncXfEBzYN7QyqLWMQ/HrX3u8uWQi0rxKpBPFgNvF+gxaTJeEqo8oG
 8Yu9O+Fsx8/WAY9XbkdHWPckMOZtCrFhsQUcBI74jy426TWEp7tuRERqUQMTud3Uiqe5
 H6X178HSjFARtubOwanYTw0qXmwpFsId8CHR01tS9J9UyPrFWIhAa16AIZwfF4PuN6s1
 8Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770282077; x=1770886877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kOJiDHAUee3jnKQG1PcpakG6aCbdXHtzEp0GromjiP0=;
 b=rpGYG4V4OXBSddYyZEb5ABpKo+IUKwaBHzxc6Klhord4du+OQtWtkwuvLBIJBdavbz
 AxZjxK/PjxgTcLz6/qz2Q+mrTQ0bL11/AOUr2jm3K07mmlO1YDixySUh1tL7Asql5dSj
 XVFcdCbeI67cBb+VSz6PQ1/2gI91kxQ7TrHr0TmqKqZBEWxkBXBoAn0rONftX4RwcNSD
 PM/zQmK1yoV83agVeNEd8kPT7xCPy3QrjeuzF4qXuzEsIIaU7IpGwiqGR+qE7jhmHfoT
 QMp3cVwYrqs+Z4Rj6Nh4qyEhhAiXUneQ+2aot3M/+xTN67HgVz60KA8JOkP9ccD1LJQG
 blCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI+hpE5dP6Xk4NxjDidyQoMuOeZDr2OVPc3O23KtS9rFkV0nAT7UyyFZb/dcd8FPO5cUXaZJSYgLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO+A9frItf4oIDtAc94NN/SG27RphZmG6wYO32n1UGda57tqsX
 tf55vLvIC1L3sEUqpCasfWU/sW2SVConGgR7lAdivWKUfXHm6oPPMDdCHYsIDpUw+K4GWXFKZge
 yQAk7lcjkQSRaavoePuY+QZToCDw3iXBxluWqSerlWA==
X-Gm-Gg: AZuq6aI/W+aQuEAZML+nisW3XrsKVesUDkiPJ3G7L06ee/rrr44/46VsiSQN2xIOwRD
 fsxVqqRNqnOuBqz5d3hMj7GfjiD1U4W6bPYYp8+5feWiwQgR+rsFionMwhmk8bMayWjiPhtGDUd
 94La3rXrXL/+DZrrwxXQHP36vzQ+aYVBVnXDTcz1GRayVAkAIBGyCaaxSlgScBFufMXSl6QgYJA
 i3tMpheaiTC1XVnnNwPXh9PgeG06HSh7wefCw9CdTuGPH5sww1tsw3lcp/w3J0ukqkuptNa39Vs
 quUTyVMzKp+K6qh0Pu1mvWkyheOb
X-Received: by 2002:a05:6512:158b:b0:59e:3c79:fae6 with SMTP id
 2adb3069b0e04-59e3c7bb427mr798548e87.9.1770282076793; Thu, 05 Feb 2026
 01:01:16 -0800 (PST)
MIME-Version: 1.0
References: <20251030162043.292468-1-marco.crivellari@suse.com>
 <a68bac38-ac0e-4ad6-8b70-72b09811a21e@suse.de>
 <CAAofZF46ViRF6qv=AEf1mMW-58eTPE0bNvkN=FbL_4j_DMfjZA@mail.gmail.com>
 <0169d1e9-01ad-40f2-8789-cf795c52c47f@suse.de>
In-Reply-To: <0169d1e9-01ad-40f2-8789-cf795c52c47f@suse.de>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 5 Feb 2026 10:01:05 +0100
X-Gm-Features: AZwV_QiYdaD1xIYoE9NXsDWQSV7hY1H47nuRuUmGVYJPMO_cmxTmpqts6NPbJTg
Message-ID: <CAAofZF6XO5h+_8OkvPywHE+WqdaanXdK2LetSv78Gy2QkpZ6Cg@mail.gmail.com>
Subject: Re: [PATCH 0/3] replace system_unbound_wq and system_wq with the new
 wqs
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out,suse.de:query timed out];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[tzimmermann.suse.de:query timed out];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B5C98F034A
X-Rspamd-Action: no action

Hi,

On Thu, Feb 5, 2026 at 8:22=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>[...]
> These patches go through DRM trees, right? I can merge them if no other
> reviews come in. Ping me if they get lost again.

Yes, sure I will, thank you!


--=20

Marco Crivellari

L3 Support Engineer
