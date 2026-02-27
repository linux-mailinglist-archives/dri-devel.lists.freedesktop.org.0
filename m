Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCi+GyM+oWnsrQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 07:48:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED511B377E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 07:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C93B10E615;
	Fri, 27 Feb 2026 06:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="gohzbNVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2142610E615;
 Fri, 27 Feb 2026 06:47:57 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fMf6166hsz9tSP;
 Fri, 27 Feb 2026 07:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1772174873; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ba3c1gXGQy+o5rD2JlqzieKSqhaLlsBOFfFLgEvtwYw=;
 b=gohzbNVpnfS7gMzYQ8WBzmO5pJ+i4s1RNC0StxgUNEqhVz9DYQCyQ7vzCrMH0nP9mq3mxm
 0napB2rLwwX/chsnmYDjpLw70M7RM3VDFrzlG4MW+UtQsoqnWaE/y3LDXSH+o85aIrdtJ0
 OL3eTS6zqE3ObLdRIeqFPNh9W9kNGTnZVjydUHHVN1JPGzbm0LqKOQy5Fd1ePJFSni/XsG
 oue1vGiPBecEClCgWdG2G6XBZyaLoQMpocY1tqTBH6CL+n6/VOyTSsyYvywnS6T5PFpuXk
 MI6iqkYoxzAergs5rbT71pDBYZXgCEuTi3+BWrtjC9kj7liI+zGlxec0ADno+g==
Message-ID: <baa2d0b7c15687e153cac6d00c546a547feb2340.camel@mailbox.org>
Subject: Re: [PATCH 2/7] drm/scheduler: fix kernel-doc warning for
 drm_sched_job_done()
From: Philipp Stanner <phasta@mailbox.org>
To: Yujie Liu <yujie.liu@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Sunil Khatri <sunil.khatri@amd.com>, Lijo
 Lazar <lijo.lazar@amd.com>, Asad Kamal <asad.kamal@amd.com>, Yang Wang
 <kevinyang.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou
 <tao.zhou1@amd.com>, Gangliang Xie <ganglxie@amd.com>, Candice Li
 <candice.li@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Luben Tuikov <luben.tuikov@amd.com>, Ville
 =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Michal
 Wajdeczko <michal.wajdeczko@intel.com>,  amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Date: Fri, 27 Feb 2026 07:47:42 +0100
In-Reply-To: <20260226030038.1182961-3-yujie.liu@intel.com>
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-3-yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 7f64d465d2b58537bfb
X-MBO-RS-META: yswx9ra8z6mx41t598aw6gzhe1ftcf6h
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: CED511B377E
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 11:00 +0800, Yujie Liu wrote:
> Warning: drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'r=
esult' not described in 'drm_sched_job_done'
>=20
> Fixes: 539f9ee4b52a ("drm/scheduler: properly forward fence errors")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>

Thanks for fixing this!

Acked-by: Philipp Stanner <phasta@kernel.org>

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index e6ee35406165..fe4c1017734b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -361,6 +361,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_s=
cheduler *sched)
> =C2=A0/**
> =C2=A0 * drm_sched_job_done - complete a job
> =C2=A0 * @s_job: pointer to the job which is done
> + * @result: 0 on success; -errno on failure

nit: shouldn't it be -ERRNO? But idk.

> =C2=A0 *
> =C2=A0 * Finish the job's fence and resubmit the work items.
> =C2=A0 */

