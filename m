Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKIeK9gge2lPBgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DE3ADD9B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A48410E823;
	Thu, 29 Jan 2026 08:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dp3GQtTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9BB10E7C4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 04:43:14 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-8947e17968eso7187706d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 20:43:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769661793; cv=none;
 d=google.com; s=arc-20240605;
 b=eK5Hq3kbT8VJ/vXpiOKmh+qbZVD9V9VR0jmJUxAFCJLZvAOktWFPVx84DQl6qdg87v
 hLzv2PpyAqQg27ykjmL1FpKv8p0KBIvdOi61HxP9xjoqspesnpva6+p/jTGeUhUlBJXa
 lEBleFQbtCi9RFhZ5wcY8mo2gv/Lrmy/0PNkU/sNe2POiSGy+LeJckkiIMF5v+4XZ2Ah
 O5PxmJCIucPKz63xrIEeNBlEH/kMTEcyHs6nhUhgIzsJNoPTQ4G8KMCR7w05X3M3KVUq
 UT/zhBJUbfdk8J4M8BSrhNa72tPsp1VO2fUP/ncRu0qPaIQ0xmxMG6lxR4yT5/fP6SXG
 mHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=XfUYf7LLB2K5abp4d0ZkiqnHMi+g4gzW4547TspPJyk=;
 fh=QPZyrfuxYlwAsDK/pI/YFArPA/DsgGs7qAp3+T8BWAM=;
 b=EZbYfigCreC1o1d0lJscKpBiY33R4cxoqFcYKoiQHoD18M02wAJiyzq9kn3S1FkDxr
 wXDP8GaIRos+yZbvc8Xp+zFAxQh3OXgrAk4VkKepXL1PYS3gz7z7W6sQD9JlAfra/fNK
 cGNGJEteFYUHFFmviJkwHdDRwMWeL5fUTgfSX2WMCGL/XBiFwkRh84nooLlp+9NP5ivu
 xOY8/g51JVpFei57JWZ1sRG9Ip6DjSZbOtSkWsAjTotKwZ/PW+Wjcny7O//EX/5lw8Mj
 eE7beUO+YjkrJtHx7naHZli7J9B+HgU8vdxGJwJWHRureUeeXokv0mq0FamDXQiSKNye
 20kQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769661793; x=1770266593; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XfUYf7LLB2K5abp4d0ZkiqnHMi+g4gzW4547TspPJyk=;
 b=Dp3GQtTYHzRExF03nvUeUI73c5ixuUmFwKR2A9wLoChlu0ypbSkbMf/+SRrSd+Hjew
 aF8T007OSnHtnQYg0PIk4ZxD2Yrze6Y2ZHtyBHm3haSY8BRd8w3eyI7ihTqqdw+WlPU1
 vkENQloJ6nmCInsRbFksDUQcUjrIveEC7OnJuXsdxV1seEl2Ye/DLz0D2l2zIlTgeGFZ
 IB+bIxpVmcKoE4Sn1ldoLXDC7BsRlodPI+DVpFLxrq+LbocSgWoW8XiuhGiyEDN5ZkmF
 3mrhfwf9nK7NXbHqaO7/hj58y9cbtUpGuVHWBkzxk1KYedCJS6RUbPxgkoSENxYwYevQ
 LANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769661793; x=1770266593;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XfUYf7LLB2K5abp4d0ZkiqnHMi+g4gzW4547TspPJyk=;
 b=unUz9PX9gnEJx5uze57jzVkYe33cyLU0Ig1a+F/ySr+RqYrqisxLcTjCRMKeo/6aNB
 S0qFQsnioOtYwiR0yx9IuoQY7PGsRnBwu3XqVDYz/RuXUA+GD3d0wjzH7nh0gwUYSdIu
 BNAkpYexKGtJfLY0Ydfg+02kGDE5dZbkBNtFozjhjOFTNQWm4eyIAWdxlxVUnlBD+6zT
 t5xH9oqt+SPrRwimsN7LU+oteiKh+LDEdvZ8F+qFcGOK5ECziWzvwnFOY7FZhKrtWu2m
 tGPg+OpsgBGM1kH2FQl2vN4ZxzvtwwTgvdMhEO1P+3GbR76xA4WdOz3dIe7vn5XUuPKr
 y8EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHaaI8zWe6Udm5S9Zu5mIYooOyeeNzQlY9iM/qCF539aFkO1rh2PBH2waoJh7DFMkFknCMYEfTSuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsbUg1ozo9DePfRPpgjIsWlPllb4NC4U6lE1ijuk+EX9IySbZ+
 V6WDmPeUNxtrHi2P5vOWsLe78GYmN1HrewNbzhu5kCNI0wzLD3tKru5dVZNtr6V7lLyXD2iAr5M
 uQjUt1ixPNsljI21XALFkjLj7PSy3X5g=
X-Gm-Gg: AZuq6aL+bYnmjynaasO+V7Yi4w+6J6vvquAZnv//FAKzIkwSCygcvNmvAu1GmUMzqtI
 YnhheXWJcBUgv7LBlp/90l+N9z12OnTjFkmEAi1LhmmI2O70ZMBqTCYZwy/1MeNJ9cpK1MIe43j
 tGJXSKOz+Uan9UURYo1gWAYtrH0XGZwUSoIxPJN3pPokxjUBC7NNcZDF9m4AaRKOmZy3tfcNDWL
 sG+NQCeQcetwlAIUcQmTay61056+ORQFukur/PXtl/HH7nIOuPwX1GYxq1kCAhy9LpGX7jJjVoy
 7dJj+hw=
X-Received: by 2002:ad4:5ce9:0:b0:894:76f1:b6f7 with SMTP id
 6a1803df08f44-894cc7d6692mr105516946d6.14.1769661793551; Wed, 28 Jan 2026
 20:43:13 -0800 (PST)
MIME-Version: 1.0
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Wed, 28 Jan 2026 20:43:03 -0800
X-Gm-Features: AZwV_QhJADNnN-iMG1xRqtxKpv-vDGdJQLQowzzj1lIuQQOoldmCcgn1e1slovo
Message-ID: <CAFqHKTnSUndwTs-cc8SZxST48UBj6_oKf0Bzt_mMSsj6=g-xww@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm: Introduce drm_crtc_vblank_prepare()
To: sunpeng.li@amd.com
Cc: Harry.Wentland@amd.com, airlied@gmail.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com,
 simona@ffwll.ch, 
 Mario Limonciello <superm1@kernel.org>, ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 29 Jan 2026 08:56:34 +0000
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
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunpeng.li@amd.com,m:Harry.Wentland@amd.com,m:airlied@gmail.com,m:amd-gfx@lists.freedesktop.org,m:jani.nikula@linux.intel.com,m:simona@ffwll.ch,m:superm1@kernel.org,m:ville.syrjala@linux.intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[derekjohnclark@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,linux.intel.com,ffwll.ch,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[derekjohnclark@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 44DE3ADD9B
X-Rspamd-Action: no action

>From: Leo Li <sunpeng.li@amd.com>
>
>Some drivers need to perform sleepable operations prior to enabling
>vblank interrupts. A display hardware spin-up from a low-power state
>that requires synchronization with the rest of the driver, for example.
>
>To support this, introduce a DRM-internal drm_crtc_vblank_prepare()
>helper that calls back into the driver -- if implemented -- for DRM to
>do such preparation work before enabling vblank.
>
>v3:
>* Unexport drm_crtc_vblank_prepare() and make it DRM internal
>* Drop warnings in drm core for vblank_prepare(), drivers can do so in
>  their implementations
>* Drop unnecessary crtc null checks
>* Check for drm_dev_has_vblank()
>* Rebase on latest drm-misc-next
>
>v4:
>* EXPORT function to fix build error on DRM_KMS_HELPER=m
>
>Signed-off-by: Leo Li <sunpeng.li@amd.com>

Hi Leo.

I wanted to know what branch this series applies to. I'm trying to
troubleshoot a possible vblank issue on the Legion Go 2 and was
pointed towards this patch series. Unfortunately I can't get it to
apply cleanly to drm/drm-fixes, drm/drm-next or stable/linux-6.18.y


From commit 15392f76405ecb953216b437bed76ffa49cefb7b (HEAD,
drm/drm-next, drm/HEAD):
$ b4 shazam https://lore.kernel.org/dri-devel/20260127194143.176248-1-sunpeng.li@amd.com/
Grabbing thread from
lore.kernel.org/all/20260127194143.176248-1-sunpeng.li@amd.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 2 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  [PATCH v4 1/2] drm: Introduce drm_crtc_vblank_prepare()
  [PATCH v4 2/2] drm/amd/display: Implement prepare_vblank_enable callback
  ---
  NOTE: install dkimpy for DKIM signature verification
---
Total patches: 2
---
Applying: drm: Introduce drm_crtc_vblank_prepare()
Applying: drm/amd/display: Implement prepare_vblank_enable callback
Patch failed at 0002 drm/amd/display: Implement prepare_vblank_enable callback
error: patch failed: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c:277
error: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c: patch
does not apply


Thanks,
Derek
