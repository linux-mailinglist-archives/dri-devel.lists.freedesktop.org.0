Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMlUGcpeqGmZtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:33:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C0A204545
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DC410EA5F;
	Wed,  4 Mar 2026 16:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ShGzyH9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3231E10EA5F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:33:10 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2bd5658b901so403636eec.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:33:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772641989; cv=none;
 d=google.com; s=arc-20240605;
 b=FWn77ZTT3dSeqbdO0f5NNYxEEnQlHiZZUOWkv06WkWDH5v2LhCB79dkgQ0Yq0TlWj5
 Tp6jqjWh38wu3CRJOaAvB2SkDI6QLMDjxph1PH92niTocg0Aw563Ge1oxNx5SwjohMyR
 SaE+CwA/qM8E+km6ISsy75sve6Q/naKKRB/jm/vYCZV2iB+jqfeYtdnpokWU975zWzTW
 YgBcKEBN30VlNWdLhnLnGcYm6m+xGW/Mxr/mKFU/F92W/XFmp7qhKGOmy20X1VbGDLIB
 NVLxW1F67qiYZWUWh6gEN8OzERRvouKdbAzUXrO8WXBFiBYvmIRbVbomjs+mdxAHoDJE
 da0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=j/giy9beQVz+/rScwRdpnZMgd2sdf7gAoO/VOU+Yy1M=;
 fh=/Kc9VFFUwb6ijx3Fe13Kh/NswGFkc+n8zUo9Pq8KVfM=;
 b=Dyz9asoh2Gs3zansPfXEmKz9EMARtzaeLzdqj2YSN0YjlgtxmyCmwRm3yFpbAH0hok
 chsAkIpXZDlBx8i6yptfGowmtJ+KUrsBXWui1EmxNA1suAS7FAcL/C91nc4SqlPFDWrq
 BVuIiqt6wbV834QRCGfA62f0IrI17nXhZesnadN+Juzf6a9o/emvvfgroU1wZBo+P79l
 1z863jA+jQdmO3pfS7cv+BU6j8gL86BPhyCITVfAic9Lo2oCwLVRs8KoRafB0A/9pfG4
 T6/ljXFj5m/mikGujYN4IPqT1+IXjznJiVSMTjwmFDELpZjPmAkGppnF+U8QQ6lCHn0b
 O6Eg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772641989; x=1773246789; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/giy9beQVz+/rScwRdpnZMgd2sdf7gAoO/VOU+Yy1M=;
 b=ShGzyH9tZGIPrB5bp0TSu9SWOpZeLNx0Imq0cA7e5aTDvs85JOEGaqeGJ6poqZh4t1
 BjPEsjI0mHf+qUc9ZPRpg8lx/CJoYav7aNmt6CadQ2T2LF//mQ+/8xBr3LbZZFmMMPbj
 4az01wTp6rW+ILFmNZivKdl1eH8iJt07eEJPrx3avZlPzETWQJiPBieFXklVtQrQl8UK
 GQIbtF33aRIB5KmRvotDWj6IcLaMhKEHtOpxN7vWU/DDyPqKZkFve+ZRCLvEyMc3tgbr
 k397FP/Kx470UW7CR5DjpqxGOIz3KRT6XfzHmMYEYBQLUZUW+ghjeiiI6u3yntLEVS1G
 GBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772641989; x=1773246789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j/giy9beQVz+/rScwRdpnZMgd2sdf7gAoO/VOU+Yy1M=;
 b=dZvWrR42ABPcLD91NSknifdXCVPsqufx+3q/jjmX/KLJcDQZWf064OAyOIMRUlnfPX
 4ZkM1DURi06BdukJlY4lpJVngm6G7sI8m+YMU9FXlknWDSAuHgeTRuWGhZu0EeHoMO44
 aTpm6ybPZCPW8zZRnYMS44m1+ioqKSqTQvRaQFOE8iyixcj1Z+CzOPI6Qxs40Hx+v12T
 4ORRDHb6IFCXzcOVnYA/v1rRegppj8M2XNStDVo8FIcmcw7ISu9OZIlCjHQPYJm8PGUU
 4KQfMU/sOU+nQ/qMqSXrIUVq4v/f4Q5YKZqNNEgUwErsB5QhBmoZpiUgv0WoMBQDqtYO
 rNIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhk0fAY+eVDufzisA51rb9ijyB7NvTfQjDHefibW9ny0vsS8PqHma2sPOC8ssgC+stfd3iqEG05bM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQPK2GMHSCL53PpQlM2LCRW/QzWg5AJnXECvpBc/Dtwcu3WNtJ
 PBTcsvqgJQGC5Jzz2ohPo9jhN/bD8mJQnV4zWGSa3kPqd2VaFPdzKDTJOxEGnwrBMhCfuRW4mRe
 yQXqMLoCE3lQd6FALyU/6uuyRJrKXUW4=
X-Gm-Gg: ATEYQzyrxk2WHN96DPvfbI5pP+kXgSH2cMcTRQcG3ItQ9kYG9VoG2EhY9VoK6lXD1Y7
 yFse414sJXvlZH+w9VmcGHzFJlSIFEQIdk53LkXnK6bu4peYJOkacRluOl8anSSVqpXc48ITG/H
 FdrEUz+XIMJeqLA89FkXRXNWP4mzYX7027k51RuzMJjISAPLGcJsSdNOwXXD22N5BYDrVrTDSnL
 QK5Sf/aNm/UYE7z7D1gWV4nrP14TncfsQZLmhREwnAKK9AuH+nwhncDgfK9J+Z2zHIua8Pse8jV
 oe4s02iz1JxIHnuEBMyA2lBgAnWbOIyThZYEAum5cvGB/PbtrUHjUUWAVf9fbukerOnHyihnMap
 UKHeD
X-Received: by 2002:a05:7022:68a8:b0:11a:2020:ac85 with SMTP id
 a92af1059eb24-128b70bad39mr594783c88.4.1772641989260; Wed, 04 Mar 2026
 08:33:09 -0800 (PST)
MIME-Version: 1.0
References: <DGQ49PK0QE7U.3O1AQPSD6NI7I@rcpassos.me>
 <DGTZWNGLPVI3.108P2EKGFCO2R@rcpassos.me>
In-Reply-To: <DGTZWNGLPVI3.108P2EKGFCO2R@rcpassos.me>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Mar 2026 11:32:57 -0500
X-Gm-Features: AaiRm534Q6doSjPpf0QK4yrPoiBJU1oTbMFooDJnGdR_5oZDeZtS9L4TkUxGtUQ
Message-ID: <CADnq5_Msmohg3T5KLrqPwvJGbXPOMKeNN-ZcqgTS2pHb+GjuYQ@mail.gmail.com>
Subject: Re: [bug report] 7.0-rc1 flip_done timed out: amd igpu off when
 resuming in laptop (regression)
To: Rafael Passos <rafael@rcpassos.me>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>, 
 Bhuvana Chandra Pinninti <BhuvanaChandra.Pinninti@amd.com>
Cc: amd-gfx@lists.freedesktop.org, siqueira@igalia.com, 
 linux-kernel@vger.kernel.org, Martin Leung <Martin.Leung@amd.com>, 
 Ray Wu <ray.wu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Rafael Passos <rcpassos@ime.usp.br>, 
 davidbtadokoro@ime.usp.br, dri-devel@lists.freedesktop.org
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
X-Rspamd-Queue-Id: 07C0A204545
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:rafael@rcpassos.me,m:Harry.Wentland@amd.com,m:Sunpeng.Li@amd.com,m:BhuvanaChandra.Pinninti@amd.com,m:amd-gfx@lists.freedesktop.org,m:siqueira@igalia.com,m:linux-kernel@vger.kernel.org,m:Martin.Leung@amd.com,m:ray.wu@amd.com,m:daniel.wheeler@amd.com,m:alexander.deucher@amd.com,m:rcpassos@ime.usp.br,m:davidbtadokoro@ime.usp.br,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,rcpassos.me:email]
X-Rspamd-Action: no action

+ Harry, Leo, Bhuvana

On Wed, Mar 4, 2026 at 8:42=E2=80=AFAM Rafael Passos <rafael@rcpassos.me> w=
rote:
>
> I found the issue, but I'm still not sure how to proceed.
> I would like some guidance in fixing this regression.
>
> The issue is the where a Register is being read from.
> Before this change, the MICROSECOND_TIME_BASE_DIV reg wa read from
> dce_hwseq_registers (dce_hwseq.h) and now from dccg_registers (dcn20_dccg=
.h)
>
> The bisection lead me to this commit: 4c595e75110ece20af3a68c1ebef8ed4c1b=
69afe
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D4c595e75110ece20af3a68c1ebef8ed4c1b69afe
>
> After lot of debugging, I traced the issue to this file:
> drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/d=
rivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c?id=3D4c595e75110ece2=
0af3a68c1ebef8ed4c1b69afe
>
> This card is dcn21, but it uses most of the dcn20 implementation.
> For easy comparison, the following block contains the function with the o=
riginal path
> commented out (from dcn21), and the function it calls from dcn20:
>
> ```
> bool dcn21_s0i3_golden_init_wa(struct dc *dc)
> {
>         if (dc->res_pool->dccg && dc->res_pool->dccg->funcs && dc->res_po=
ol->dccg->funcs->is_s0i3_golden_init_wa_done){
>
>                 printk(KERN_CRIT "AUYER in %s", __func__);
>                 return !dc->res_pool->dccg->funcs->is_s0i3_golden_init_wa=
_done(dc->res_pool->dccg);
>         }
>
>         printk(KERN_CRIT "AUYER in %s", __func__);
>
>         return false;
>
>         // original flow:
>         // struct dce_hwseq *hws =3D dc->hwseq;
>         // uint32_t value =3D 0;
>         // value =3D REG_READ(MICROSECOND_TIME_BASE_DIV);
>
>         // return value !=3D 0x00120464;
> }
>
> // is_s0i3_golden_init_wa_done -> dccg2_is_s0i3_golden_init_wa_done
> bool dccg2_is_s0i3_golden_init_wa_done(struct dccg *dccg)
> {
>         struct dcn_dccg *dccg_dcn =3D TO_DCN_DCCG(dccg);
>
>         return REG_READ(MICROSECOND_TIME_BASE_DIV) =3D=3D 0x00120464;
> }
> ```
>
> I instrumented this code to compare the values.
> On boot, the value is the same. When resuming from s3 sleep, different.
> If using the output of this codepath before this commit, the screen works=
.
> At the end of this email is my "debugging patch", and the logs comparing =
what shows
> up on boot vs on resuming from sleep.
>
> I am attempting to implement a `dccg21_is_s0i3_golden_init_wa_done` to
> replace the `dccg2_is_s0i3_golden_init_wa_done` that is used in dcn21_dcc=
g.c.
> Maybe dcn21 needs a separate register page, (insted of using dcn20_dccg.h=
)?
>
>
> Note the difference between log line 2 and 5
> [    4.956404] [    T316] AUYER PATCHED in dcn21_s0i3_golden_init_wa, val=
ues compared to 0x00120464
> [    4.956407] [    T316] AUYER in dcn21_s0i3_golden_init_wa, original fl=
ow value: 1180208, bool: 1
> [    4.956411] [    T316] AUYER in dcn21_s0i3_golden_init_wa: MICROSECOND=
_TIME_BASE_DIV reg: 13b value: 1180208
> [    4.956412] [    T316] AUYER in dccg21_is_s0i3_golden_init_wa_done
> [    4.956415] [    T316] AUYER in dccg21_is_s0i3_golden_init_wa_done: MI=
CROSECOND_TIME_BASE_DIV reg: 0, value: 1148576
> [    4.956418] [    T316] AUYER in dcn21_s0i3_golden_init_wa, NEW flow va=
lue as bool 1
>
>
> 1 [    4.942660] [    T343] AUYER PATCHED in dcn21_s0i3_golden_init_wa
> 2 [    4.942662] [    T343] AUYER in dcn21_s0i3_golden_init_wa, original =
flow value: 1180208, comparing to 0x00120464 bool: 1
> 3 [    4.942665] [    T343] AUYER in dcn21_s0i3_golden_init_wa: MICROSECO=
ND_TIME_BASE_DIV reg: 13b value: 1180208
> 4 [    4.942668] [    T343] AUYER in dccg2_is_s0i3_golden_init_wa_done: M=
ICROSECOND_TIME_BASE_DIV reg: 0, value: 1148576
> 5 [    4.942671] [    T343] AUYER in dcn21_s0i3_golden_init_wa, NEW flow =
value as is: bool 1
>
> On wake from S3:
>
> 1 [  279.431636] [   T5497] AUYER PATCHED in dcn21_s0i3_golden_init_wa
> 2 [  279.431638] [   T5497] AUYER in dcn21_s0i3_golden_init_wa, original =
flow value: 1180772, comparing to 0x00120464 bool: 0
> 3 [  279.431640] [   T5497] AUYER in dcn21_s0i3_golden_init_wa: MICROSECO=
ND_TIME_BASE_DIV reg: 13b value: 1180772
> 4 [  279.431641] [   T5497] AUYER in dccg2_is_s0i3_golden_init_wa_done: M=
ICROSECOND_TIME_BASE_DIV reg: 0, value: 1148576
> 5 [  279.431642] [   T5497] AUYER in dcn21_s0i3_golden_init_wa, NEW flow =
value as is: bool 1
>
>
> The "patch" (just a test lab), to understad where these logs came from.
> I applies cleanly to amddrm drm-next, and mainline.
>
> ---
>  .../amd/display/dc/dccg/dcn20/dcn20_dccg.c    |  3 +++
>  .../amd/display/dc/hwss/dcn21/dcn21_hwseq.c   | 25 ++++++++++++++++---
>  2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c b/dri=
vers/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c
> index 13ba7f5ce13e..0ba20c7969ed 100644
> --- a/drivers/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c
> +++ b/drivers/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c
> @@ -158,6 +158,9 @@ bool dccg2_is_s0i3_golden_init_wa_done(struct dccg *d=
ccg)
>  {
>         struct dcn_dccg *dccg_dcn =3D TO_DCN_DCCG(dccg);
>
> +       printk(KERN_CRIT "AUYER in %s: MICROSECOND_TIME_BASE_DIV reg: %x,=
 value: %d",
> +               __func__, dccg_dcn->regs->MICROSECOND_TIME_BASE_DIV, REG_=
READ(MICROSECOND_TIME_BASE_DIV));
> +
>         return REG_READ(MICROSECOND_TIME_BASE_DIV) =3D=3D 0x00120464;
>  }
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c b/dr=
ivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
> index 062745389d9a..143c552e0fa9 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
> @@ -88,10 +88,28 @@ int dcn21_init_sys_ctx(struct dce_hwseq *hws, struct =
dc *dc, struct dc_phy_addr_
>
>  bool dcn21_s0i3_golden_init_wa(struct dc *dc)
>  {
> -       if (dc->res_pool->dccg && dc->res_pool->dccg->funcs && dc->res_po=
ol->dccg->funcs->is_s0i3_golden_init_wa_done)
> -               return !dc->res_pool->dccg->funcs->is_s0i3_golden_init_wa=
_done(dc->res_pool->dccg);
>
> -       return false;
> +       printk(KERN_CRIT "AUYER PATCHED in %s, values compared to 0x00120=
464", __func__);
> +
> +       // original flow
> +       struct dce_hwseq *hws =3D dc->hwseq;
> +       uint32_t value =3D 0;
> +       value =3D REG_READ(MICROSECOND_TIME_BASE_DIV);
> +
> +       printk(KERN_CRIT "AUYER in %s, original flow value: %d, bool: %d"=
,
> +               __func__, value, value !=3D 0x00120464);
> +
> +       printk(KERN_CRIT "AUYER in %s: MICROSECOND_TIME_BASE_DIV reg: %x =
value: %d",
> +               __func__, hws->regs->MICROSECOND_TIME_BASE_DIV, REG_READ(=
MICROSECOND_TIME_BASE_DIV));
> +
> +       if (dc->res_pool->dccg && dc->res_pool->dccg->funcs && dc->res_po=
ol->dccg->funcs->is_s0i3_golden_init_wa_done) {
> +               // new flow
> +               bool v2 =3D 0;
> +               v2 =3D !dc->res_pool->dccg->funcs->is_s0i3_golden_init_wa=
_done(dc->res_pool->dccg);
> +               printk(KERN_CRIT "AUYER in %s, NEW flow value as bool %d"=
, __func__,  v2);
> +       }
> +
> +       return value !=3D 0x00120464;
>  }
>
>  void dcn21_exit_optimized_pwr_state(
> @@ -298,4 +316,3 @@ bool dcn21_is_abm_supported(struct dc *dc,
>         }
>         return false;
>  }
> -
> --
> 2.53.0
>
>
