Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMKYDd5AqGl6rQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:25:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6862F201622
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C19D10E9E9;
	Wed,  4 Mar 2026 14:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rcpassos.me header.i=@rcpassos.me header.b="EYkN4gbz";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purelymail.com header.i=@purelymail.com header.b="jhSAJAGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1481410E163
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 12:27:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=EYkN4gbzuJMGrWpEDAGPsdfzFcLJf5OZaYAmIs8zNLT5S4tzHHoatEHWaQs1brOtTvkRobnN/RtOoYxfN13bTYBMBiMlp8MFL6lvFRtkGVC2bQjB5ljDoJB7pcJVJppgh5fR9DxDtVxWJxe/4tIz6jpHYVfjyrfP/fhyXuFmNEQOoqk/MpTxnqT45MYEyoibH6UnmbfV3C+TCR13/sGWR0AaZdk7jyd1cZMqYWXHV/6MRCLGx5fJvDm0cccPtZXP/+hne0DGET3qndUcRZaGJCbgxmpDdfeLHO/o5db2/mr7KE/UJAJlTP/Y2Q4CgutgFvIVA7wW3mkgygEZ6CMLBw==;
 s=purelymail1; d=rcpassos.me; v=1;
 bh=0dvJShcbjQxcyQfBOwzlQckvGtiDm2Cjtzv0f2nXCGg=;
 h=Received:Date:Subject:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=jhSAJAGWRn0aD2lgK9wQYdw3V1oYqNsO0PW+3E9ZHVXq9Wfrh4rBMRS+t7hETIrVIAMCogvbJhE7koAZ3l8jlYanBnEysgvtLouQNiqeakdPGbgzYIwV9l4doY5RIovcQcD/f0n5+khOkvSCHu/k/iipC5V4M9+AL2TpNXxwIjK89jYxeQB73+bgI5LbLHQRFw4cFlxarpVkDthfxgzpQE29IJgVY850unItM1+TS8lvFtu2tBC8eklGP0PrlhTNq5FmqpFnd3/q64ZyCoQ4TC/tdUayGZ8CVvmv8RVWfAOs64qEMeW1KyDlaIaQG05Nx2VkPotNqtywnMG6TzEuow==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=0dvJShcbjQxcyQfBOwzlQckvGtiDm2Cjtzv0f2nXCGg=;
 h=Feedback-ID:Received:Date:Subject:From:To; 
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: dri-devel@lists.freedesktop.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 620782028; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Mar 2026 12:27:04 +0000 (UTC)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 09:27:01 -0300
Message-Id: <DGTZWNGLPVI3.108P2EKGFCO2R@rcpassos.me>
Subject: Re: [bug report] 7.0-rc1 flip_done timed out: amd igpu off when
 resuming in laptop (regression)
From: "Rafael Passos" <rafael@rcpassos.me>
To: <amd-gfx@lists.freedesktop.org>, <siqueira@igalia.com>,
 <linux-kernel@vger.kernel.org>, "Martin Leung" <Martin.Leung@amd.com>,
 "Bhuvanachandra Pinninti" <BhuvanaChandra.Pinninti@amd.com>, "Ray Wu"
 <ray.wu@amd.com>, "Daniel Wheeler" <daniel.wheeler@amd.com>, "Alex Deucher"
 <alexander.deucher@amd.com>
Cc: "Rafael Passos" <rcpassos@ime.usp.br>, <davidbtadokoro@ime.usp.br>,
 <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Mailer: aerc 0.21.0
References: <DGQ49PK0QE7U.3O1AQPSD6NI7I@rcpassos.me>
In-Reply-To: <DGQ49PK0QE7U.3O1AQPSD6NI7I@rcpassos.me>
X-TUID: tZ4Zipe8Yo0F
X-Mailman-Approved-At: Wed, 04 Mar 2026 14:25:23 +0000
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
X-Rspamd-Queue-Id: 6862F201622
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	DMARC_POLICY_REJECT(2.00)[rcpassos.me : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[rcpassos.me:s=purelymail1,purelymail.com:s=purelymail1];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:siqueira@igalia.com,m:linux-kernel@vger.kernel.org,m:Martin.Leung@amd.com,m:BhuvanaChandra.Pinninti@amd.com,m:ray.wu@amd.com,m:daniel.wheeler@amd.com,m:alexander.deucher@amd.com,m:rcpassos@ime.usp.br,m:davidbtadokoro@ime.usp.br,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[rafael@rcpassos.me,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[rcpassos.me:-,purelymail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rafael@rcpassos.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

I found the issue, but I'm still not sure how to proceed.
I would like some guidance in fixing this regression.

The issue is the where a Register is being read from.
Before this change, the MICROSECOND_TIME_BASE_DIV reg wa read from
dce_hwseq_registers (dce_hwseq.h) and now from dccg_registers (dcn20_dccg.h=
)

The bisection lead me to this commit: 4c595e75110ece20af3a68c1ebef8ed4c1b69=
afe
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D4c595e75110ece20af3a68c1ebef8ed4c1b69afe

After lot of debugging, I traced the issue to this file:
drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/dri=
vers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c?id=3D4c595e75110ece20a=
f3a68c1ebef8ed4c1b69afe

This card is dcn21, but it uses most of the dcn20 implementation.
For easy comparison, the following block contains the function with the ori=
ginal path
commented out (from dcn21), and the function it calls from dcn20:

```
bool dcn21_s0i3_golden_init_wa(struct dc *dc)
{
	if (dc->res_pool->dccg && dc->res_pool->dccg->funcs && dc->res_pool->dccg-=
>funcs->is_s0i3_golden_init_wa_done){

		printk(KERN_CRIT "AUYER in %s", __func__);
		return !dc->res_pool->dccg->funcs->is_s0i3_golden_init_wa_done(dc->res_po=
ol->dccg);
	}

	printk(KERN_CRIT "AUYER in %s", __func__);

	return false;
=09
	// original flow:
	// struct dce_hwseq *hws =3D dc->hwseq;
	// uint32_t value =3D 0;
	// value =3D REG_READ(MICROSECOND_TIME_BASE_DIV);

	// return value !=3D 0x00120464;
}

// is_s0i3_golden_init_wa_done -> dccg2_is_s0i3_golden_init_wa_done
bool dccg2_is_s0i3_golden_init_wa_done(struct dccg *dccg)
{
	struct dcn_dccg *dccg_dcn =3D TO_DCN_DCCG(dccg);

	return REG_READ(MICROSECOND_TIME_BASE_DIV) =3D=3D 0x00120464;
}
```

I instrumented this code to compare the values.
On boot, the value is the same. When resuming from s3 sleep, different.
If using the output of this codepath before this commit, the screen works.
At the end of this email is my "debugging patch", and the logs comparing wh=
at shows
up on boot vs on resuming from sleep.

I am attempting to implement a `dccg21_is_s0i3_golden_init_wa_done` to
replace the `dccg2_is_s0i3_golden_init_wa_done` that is used in dcn21_dccg.=
c.
Maybe dcn21 needs a separate register page, (insted of using dcn20_dccg.h)?


Note the difference between log line 2 and 5
[    4.956404] [    T316] AUYER PATCHED in dcn21_s0i3_golden_init_wa, value=
s compared to 0x00120464
[    4.956407] [    T316] AUYER in dcn21_s0i3_golden_init_wa, original flow=
 value: 1180208, bool: 1
[    4.956411] [    T316] AUYER in dcn21_s0i3_golden_init_wa: MICROSECOND_T=
IME_BASE_DIV reg: 13b value: 1180208
[    4.956412] [    T316] AUYER in dccg21_is_s0i3_golden_init_wa_done
[    4.956415] [    T316] AUYER in dccg21_is_s0i3_golden_init_wa_done: MICR=
OSECOND_TIME_BASE_DIV reg: 0, value: 1148576
[    4.956418] [    T316] AUYER in dcn21_s0i3_golden_init_wa, NEW flow valu=
e as bool 1


1 [    4.942660] [    T343] AUYER PATCHED in dcn21_s0i3_golden_init_wa
2 [    4.942662] [    T343] AUYER in dcn21_s0i3_golden_init_wa, original fl=
ow value: 1180208, comparing to 0x00120464 bool: 1
3 [    4.942665] [    T343] AUYER in dcn21_s0i3_golden_init_wa: MICROSECOND=
_TIME_BASE_DIV reg: 13b value: 1180208
4 [    4.942668] [    T343] AUYER in dccg2_is_s0i3_golden_init_wa_done: MIC=
ROSECOND_TIME_BASE_DIV reg: 0, value: 1148576
5 [    4.942671] [    T343] AUYER in dcn21_s0i3_golden_init_wa, NEW flow va=
lue as is: bool 1

On wake from S3:

1 [  279.431636] [   T5497] AUYER PATCHED in dcn21_s0i3_golden_init_wa
2 [  279.431638] [   T5497] AUYER in dcn21_s0i3_golden_init_wa, original fl=
ow value: 1180772, comparing to 0x00120464 bool: 0
3 [  279.431640] [   T5497] AUYER in dcn21_s0i3_golden_init_wa: MICROSECOND=
_TIME_BASE_DIV reg: 13b value: 1180772
4 [  279.431641] [   T5497] AUYER in dccg2_is_s0i3_golden_init_wa_done: MIC=
ROSECOND_TIME_BASE_DIV reg: 0, value: 1148576
5 [  279.431642] [   T5497] AUYER in dcn21_s0i3_golden_init_wa, NEW flow va=
lue as is: bool 1


The "patch" (just a test lab), to understad where these logs came from.
I applies cleanly to amddrm drm-next, and mainline.

---
 .../amd/display/dc/dccg/dcn20/dcn20_dccg.c    |  3 +++
 .../amd/display/dc/hwss/dcn21/dcn21_hwseq.c   | 25 ++++++++++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c b/drive=
rs/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c
index 13ba7f5ce13e..0ba20c7969ed 100644
--- a/drivers/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c
@@ -158,6 +158,9 @@ bool dccg2_is_s0i3_golden_init_wa_done(struct dccg *dcc=
g)
 {
        struct dcn_dccg *dccg_dcn =3D TO_DCN_DCCG(dccg);
=20
+       printk(KERN_CRIT "AUYER in %s: MICROSECOND_TIME_BASE_DIV reg: %x, v=
alue: %d",
+               __func__, dccg_dcn->regs->MICROSECOND_TIME_BASE_DIV, REG_RE=
AD(MICROSECOND_TIME_BASE_DIV));
+
        return REG_READ(MICROSECOND_TIME_BASE_DIV) =3D=3D 0x00120464;
 }
=20
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c b/driv=
ers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
index 062745389d9a..143c552e0fa9 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
@@ -88,10 +88,28 @@ int dcn21_init_sys_ctx(struct dce_hwseq *hws, struct dc=
 *dc, struct dc_phy_addr_
=20
 bool dcn21_s0i3_golden_init_wa(struct dc *dc)
 {
-       if (dc->res_pool->dccg && dc->res_pool->dccg->funcs && dc->res_pool=
->dccg->funcs->is_s0i3_golden_init_wa_done)
-               return !dc->res_pool->dccg->funcs->is_s0i3_golden_init_wa_d=
one(dc->res_pool->dccg);
=20
-       return false;
+       printk(KERN_CRIT "AUYER PATCHED in %s, values compared to 0x0012046=
4", __func__);
+
+       // original flow
+       struct dce_hwseq *hws =3D dc->hwseq;
+       uint32_t value =3D 0;
+       value =3D REG_READ(MICROSECOND_TIME_BASE_DIV);
+
+       printk(KERN_CRIT "AUYER in %s, original flow value: %d, bool: %d",
+               __func__, value, value !=3D 0x00120464);
+
+       printk(KERN_CRIT "AUYER in %s: MICROSECOND_TIME_BASE_DIV reg: %x va=
lue: %d",
+               __func__, hws->regs->MICROSECOND_TIME_BASE_DIV, REG_READ(MI=
CROSECOND_TIME_BASE_DIV));
+
+       if (dc->res_pool->dccg && dc->res_pool->dccg->funcs && dc->res_pool=
->dccg->funcs->is_s0i3_golden_init_wa_done) {
+               // new flow
+               bool v2 =3D 0;
+               v2 =3D !dc->res_pool->dccg->funcs->is_s0i3_golden_init_wa_d=
one(dc->res_pool->dccg);
+               printk(KERN_CRIT "AUYER in %s, NEW flow value as bool %d", =
__func__,  v2);
+       }
+
+       return value !=3D 0x00120464;
 }
=20
 void dcn21_exit_optimized_pwr_state(
@@ -298,4 +316,3 @@ bool dcn21_is_abm_supported(struct dc *dc,
        }
        return false;
 }
-
--=20
2.53.0


