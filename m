Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOYWBvicqWnGAwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:10:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F0A214392
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9190A10E2AB;
	Thu,  5 Mar 2026 15:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="BmSS3awL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB6410E2AB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 15:10:43 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-59e4989dacdso2699257e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 07:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772723442; cv=none;
 d=google.com; s=arc-20240605;
 b=jLVjyLrO7WoEEZvlUCBtWpjRq90sA5K0LpBU1vg7p57PQPahHTHgkI7berxg0kGaxJ
 OABoNoDdKrkjctrgnNHsKKNFeRVZQXxeklmcnQikOAdnU8AfvJ/sYXpTbT07PaFyh1nP
 aHtWR1uiBO/AD3RqTXD8ZNYUNYr2XDPb0KZ0DSdHad9IuQoFlCgtg6Dp7ISBrC4qtAqf
 LPdJ2IrF+N/V1LMkCcE3+tQWeOid7wiut4QGoXQSYq9ikcYN/7cP25E/BFqAOI5IXkB2
 pH6jlwFrYoRYdmKd8IXvZmsDiqSYl6JugU2UI8Aa9gDi7UzozqjVuIWI/h2Jy7anYFmF
 s9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=u82NxCxMOoHokl6CWFUxRda+nqKiH6ew72AuZPbDCik=;
 fh=WZ+86AjHETnDC04aVDL6XBP0NhmwqQeYcFedU9FL68g=;
 b=iXaBBBNiH7cc+8vVU3iwfcpuPBbN0uM7cIea0SAW5dNGhVVpYqc8buzp//eYUIFy/b
 YrUjt/yVaV+zpTO4wDjWUD3e4DsbLzw5Vm8YwBBQH6rdPyMMAnXfw6Il2uq4gDPfyyB9
 c9KchW58yl8Ho4fItRQzO8twvESZNqKIgxpocLPtHGSdBsWpFAjSs/xlp/OIuvCE+xQy
 IA40H0U3YnzN3CEnL48IjfaSnCPHIUPcwUfhHWtoJSZdxRHflKEAadBsKF/8LMXeJOPN
 ppoWcjLbV71utI65CeENxDm8himqCXAV9gkvjvwq4MMKCXwKxeIwYWJSK9WVsW0BfJO3
 970w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772723442; x=1773328242; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u82NxCxMOoHokl6CWFUxRda+nqKiH6ew72AuZPbDCik=;
 b=BmSS3awLfKUs1YbgobuzZa+MG1wX9lRyOVnX9lQ130fxzgW+hDK6+74PSP7TW3Vg3E
 TufbsNIvca7b83OTyAJf0zVccjFSrZfxSGAbt8BPTrwhrnc0YW3WG+72eOUvhDaeEdrq
 gfAl51BOyvQQ4Mtq2b5/swgOLDH512aT+TKO+sE8/YDwTG4tta8OFtM0viK45k3OWj3m
 E6tNrhQavTGr9abefqRi0c66G7CkmkaPBU8sa4yvh8Bdf14+GGPrWy1ETUDnYDibbwhr
 MOK09PgpbyVXkxbpRB5tSTsR91sDbK9aa4VtDTlW8PVuNRMMUHUfkkg1Jsx3Ko19vkTK
 GUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772723442; x=1773328242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u82NxCxMOoHokl6CWFUxRda+nqKiH6ew72AuZPbDCik=;
 b=I9Lpok9Z8FSG3QsAEhkPVdW9rL7yCKDAPRJwB4m7JiXdCqJQiZ2AFuht/XfD3zV1gF
 5m/8lnn6iChXIZvLk3bqrH4au4pcZcY9L84XUWhQxtKjIo+FFJq4WT15px7n+Do2+1pD
 LNiuVwJnaQfx7twAjesUUilNW32fZCp02mhH97OUSNpJci5H2RmeKoJ2TQEIDhJXUQZn
 6J3do3ze5YIgJJWkPZXWp8fiUnFx0EgJNCTuq2JT2J+9hxsJxpY5kQIVGsCLasjSNiOn
 vAeRKn1LNFbqEfdQ5YezLRepOcooA1GBLs8wQ2MD/bf0AFsk37nRx8qbLe3qcn31Pddn
 rhqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUESHowpfl3ueR8hOgv3JZWaCNlE6cwfvnPcoSM3Sjb4sYEmpsF+HecozStBiP/siWRSJeaSUSq4X0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQf5O5gGmI0DsN0iVUHfqP/v1f6TwTwd87WnscD93LN8V72yKn
 w9wMqlYZmnvGCPdry/xxdGRfm7i8ZikYCosqkEiOBNBbmuy2yxTo9NKPId7hS/pBQM6+ZorT3FT
 Z2S932hRqQisf0Pf0CSPcZCozoRo5NbgMda1IZh7YXQ==
X-Gm-Gg: ATEYQzzWOgcM6gdYji2408Ul090ds2pMJ+rYIE6Es2gHRN/mNHctmfYkKrKtQQMoGnK
 XkQqexzTn05sh1xhnnqz/vtLZ9FH3ILHPJOZ84YNTRSdj3V+cKdw+ub1tEC6buBGaFhiCB34vnJ
 qbMRS0te0c2DT94WwKLypYW62vH/26PrQTrVVufctljR/vxc+HXoEXQZIDNkvMnXAvVdLywTf50
 TWC5DMk0B0e1/1Xkbc1e2gydLJPl0cdcXIUGgXIaijqYZFClq4Mz4CxSOOKx+AMGllGeqnG3Q7r
 L7TCAesSk8PLizn+Dvx4ns46YwDpvJwkaptGvg9r
X-Received: by 2002:a05:6512:3e12:b0:5a1:1da2:24b with SMTP id
 2adb3069b0e04-5a12c2816acmr1053014e87.13.1772723442127; Thu, 05 Mar 2026
 07:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20251031102020.95349-1-marco.crivellari@suse.com>
In-Reply-To: <20251031102020.95349-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 5 Mar 2026 16:10:31 +0100
X-Gm-Features: AaiRm52evNzWnBtnAD_gcyRavCdB7Lu4vnujQaOXLWgRass72odpOCItfms1g_Q
Message-ID: <CAAofZF6i2+4oppY3Ga_hAppAe1sVOnEYu6Yq4iAe0WTpbVcXjQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] replaced old wq name,
 added WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
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
X-Rspamd-Queue-Id: A0F0A214392
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:lyude@redhat.com,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,redhat.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi,

On Fri, Oct 31, 2025 at 11:20=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> Marco Crivellari (2):
>   drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
>   drm/nouveau: WQ_PERCPU added to alloc_workqueue users
>
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
