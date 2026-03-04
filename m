Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNN/MsP8p2mlnAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:34:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3361FDAE8
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1137510E985;
	Wed,  4 Mar 2026 09:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="MzUI3pks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D5210E985;
 Wed,  4 Mar 2026 09:34:55 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fQnZM6RTyz9thg;
 Wed,  4 Mar 2026 10:34:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1772616892; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Oe9401DBCvKIiHFYmHlgLHvDPTLC3JVcl6jLL9T73Y=;
 b=MzUI3pksF3PsvYUOVG83Ri+Jkq5sy2Ll+XWkXTyPsugd8O/9u19EAF2/hq4gW14GDofskP
 +bqBlG/SL+vn13uny7pkewlIneohrgutJFTUv8pNwwDjt01Pl8F6hViJD0GbT5X5vW7DyJ
 DI9TZ2Marz5rfUwnNflyHbqgHxD6GIDqTicNiAsV9iL+Nf6PgnSLaclB4F3CKzUiOReKLz
 QYVIg8Y/r2db4j6eKyF5c/I5NdFifhORY71dxtMT/q+58lZDY5IIBHTFfwB3UJMSKh6T+C
 Qs7SmWHkRRmvzS67uhwaF9mtjPxPPXes98c8ExnDfZMPt19A8PCx7vpdV/ICSQ==
Message-ID: <76e69151fe679658d8816dcce1011cea20633252.camel@mailbox.org>
Subject: Re: [PATCH v3] drm/scheduler: fix kernel-doc warning for
 drm_sched_job_done()
From: Philipp Stanner <phasta@mailbox.org>
To: Yujie Liu <yujie.liu@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Alex Deucher
 <Alexander.Deucher@amd.com>,  Philipp Stanner <phasta@kernel.org>,
 amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 04 Mar 2026 10:34:48 +0100
In-Reply-To: <20260227082452.1802922-1-yujie.liu@intel.com>
References: <20260227082452.1802922-1-yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: fb8c6319aac857a1eb0
X-MBO-RS-META: r7jswgrmditj5fjfw6ez3hixr65d8cz8
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
X-Rspamd-Queue-Id: 5E3361FDAE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,amd.com,kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Action: no action

On Fri, 2026-02-27 at 16:24 +0800, Yujie Liu wrote:
> Warning: drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'r=
esult' not described in 'drm_sched_job_done'
>=20
> Fixes: 539f9ee4b52a ("drm/scheduler: properly forward fence errors")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>

Pushed to drm-misc-fixes.

Thank you

P.

PS:
for the future, scripts/get_maintainer provides a list of all recipents
a patch should go to (two maintainers were missing). And a sentence or
two in commit messages to describe what is being done are desirable. I
added them for now, so no big deal. Just as a tip for the future :]

> ---
> Changes in v2:
> - Split from the original patch set
> =C2=A0 https://lore.kernel.org/all/20260226030038.1182961-1-yujie.liu@int=
el.com/
> - Rebase onto latest drm-tip
>=20
> Changes in v3:
> - Change "errno" to uppercase "ERRNO" (suggested by Philipp)
>=20
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index e6ee35406165..2d5cb21a05b6 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -361,6 +361,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_s=
cheduler *sched)
> =C2=A0/**
> =C2=A0 * drm_sched_job_done - complete a job
> =C2=A0 * @s_job: pointer to the job which is done
> + * @result: 0 on success, -ERRNO on error
> =C2=A0 *
> =C2=A0 * Finish the job's fence and resubmit the work items.
> =C2=A0 */

