Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD5gI4TAg2k6uAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:56:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D96ECE45
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEC310E239;
	Wed,  4 Feb 2026 21:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LNIaeZEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0B610E239
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 21:56:14 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-88a2e3bd3cdso4869036d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 13:56:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770242173; cv=none;
 d=google.com; s=arc-20240605;
 b=CE5Iz66JqcSQ2XSmJhttc3YLsOB53J+8sD7uF1kMnvjB9FhxmurHo1v9ig3EcwAWok
 6mJK8dGGi7CFPg2Aa6lujYDTft/tIT5NhF4R3NTxeQtmUqbj0y8oiYB3PdKqIg+ClJKz
 UhDsuVHo/wNzd9lUVPbgxT2gEe2hVL74837HCqLwiVQYakgutTiYM6e+Su8TbUyj4vnR
 VK3nNz4fsX9A7fURcwLdZpuzko2QMlYAoCJAuXR3GFW8ObVsKdgxg+zdwo0rczWQzJau
 U1xsH0umqyuhUfvSJWpilIuWAJj6wraxi9wRa34w8nE7t50oor2mf6N47S0J2HGj/GZH
 XKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SNgA5Wz8nDRToqsfMmsxCGaF0aaiJF5fUSumT/TSrIg=;
 fh=lbKnrl/lCnTWneSg6/yKA/x0zYtuLVzFJ30sZNQ4dn4=;
 b=STvYI3o8peNnBKh/ihe3SpPp/1IaomVoBpBoTpuyq7QQStnbx/GuSItPn38jb6UfKs
 0OrW/+NcXWZWTj0NzDfq75ZOMgV3SLq87CLhyspYfm6RKv5ezHATwb5CXOHsrJTIm2so
 TlfUfhqT7mCh/98R+K1Z2eWu0weyR62qUg62uqOY3Vx1AWWS9VNUA4Gy1py7QkZ/B2f0
 c44/U9XgJP6jOl9692rryZsFFfSKYv7VLb79VQ7D+JkYAY9EszO/Fjyw4asIp0MDOze5
 EGPMJ7YIwjFFiRFIOrqe92PM+ZQwUjhZcUNbWWr1bKjfRvTK7CvssP3fVQSEYVxjXQHL
 Iyvw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770242173; x=1770846973; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SNgA5Wz8nDRToqsfMmsxCGaF0aaiJF5fUSumT/TSrIg=;
 b=LNIaeZEj6RtUroKTrX8D6/o57MhscL32GegCue8QVdoK0ytjg9G7mYlnCY8Xigg17C
 vpurBYuV4kLXtUwXIMTnJFNowiURwHjY87FKR8QGr3z6B2kjns4StGCTK6y0vQXSwGgG
 Z87JnFO+SVR9I/ElefEfWRli7OumBAPgKEH1d/WLsb2Iae2riwqX+TrR/98b4dnmkb3o
 FPPjxrdBdYzTiSPrVJySUgCPcHlWHr2YC/mbcKNBuL5F4cy+IUWB7r1zkV4RQSCwkvEJ
 TVl22Y+J5Q7S1ZBAcnWnpTfDxn7RN0q1zFCeSjkUvWJMROMCIxvrFJdUuVWIH2EdfIf4
 /ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770242173; x=1770846973;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SNgA5Wz8nDRToqsfMmsxCGaF0aaiJF5fUSumT/TSrIg=;
 b=UwfSE6DwCMRLtHEnZLUr50Rhd43sz6QkkU/gxLQNpZQFjUP6HwcNN2S0FrqWFwxEzW
 T8A/mWOHlhypUyn/gE7k8YGpPSq+H3R+mu2awmnOLefs4q3axOkg6DxW8tgqavWqTUzJ
 jv6064VapZFMtMCSCU4z4VMDPbucNmcuBiMfUkZ29Rn+BR2ebqLOG/jk4mAGiTeoCmuc
 uG3qU9U/kUtgxmCNRKo6NIAW/SPX9HPzvyPYLRaJlJeh6/xSzm+ApE4P+Sqp6kvf+i8Z
 U1b5ggUpuYjhhsRfIGhzwYWaiycXUDY9nEn44ISE73+YqdU1pQdzRncRlXfLBPSHEjEC
 zk0A==
X-Gm-Message-State: AOJu0Yzyf5RKE/rnH4HlzUV9ykdghI0l62RDTmlyyujVf0KMUsxL4KO/
 KD+bQngWtQ0qTG1J9KmsV4+ax0igN6KhVvia24qZSXjoUt7nqHiZ8W6jF5F53ZZS02yKdCQ1m9r
 wlNt2BMjmTdqlNVCf4TYFyai8VwAHIZE=
X-Gm-Gg: AZuq6aIwC0XYHOa5qJBA8Uor2t99bSzztftofY00KjrjKslXmw5kxAIOU+/dlyp7Jke
 I+PBYRXGjtWnvwdkJYtgLvIwXaktguGBAOzJujFTq5rOtY7QB2nrSOuyse8o2e1dC6bcgO82DQb
 VfE6DESFRc96DI0knpoDvepNa4rbN1FK+oUn2t9Td+oIQadWfi8k1BrtMFyqYSbAGxcVspxDPLD
 A63g5S7rta0MOjzAW+XvDmo9uZTZEQbAXwtFMkYACmZNel7RPOF5YqG5uEslqhRp1W9UzBH35Gu
 AlwEipE0WjNXK7b3nsgxpPriDYGoUVAkXRofcEj7ivXcndxYWu4MyUA=
X-Received: by 2002:ad4:5ba2:0:b0:894:63ec:39f1 with SMTP id
 6a1803df08f44-895303119f3mr11104986d6.24.1770242173088; Wed, 04 Feb 2026
 13:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20260203052431.2219998-1-airlied@gmail.com>
 <20260203052431.2219998-2-airlied@gmail.com>
 <d8a40e5c65e4aa51636a42fc613b223dfeb001a6.camel@nvidia.com>
In-Reply-To: <d8a40e5c65e4aa51636a42fc613b223dfeb001a6.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Feb 2026 07:56:01 +1000
X-Gm-Features: AZwV_QgANaijiyKJ95xPWzuwwUZNnVlnifj1C2-bThNwafmm05E87VdoEN1UqwQ
Message-ID: <CAPM=9twKuyo2afqR3qM7LMkyuOue_t_eCm3EcnU4CkKPOyxcRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] nouveau/gsp: use rpc sequence numbers properly.
To: Timur Tabi <ttabi@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ttabi@nvidia.com,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E2D96ECE45
X-Rspamd-Action: no action

On Thu, 5 Feb 2026 at 07:36, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Tue, 2026-02-03 at 15:21 +1000, Dave Airlie wrote:
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > index 2a7e80c6d70f..6e7af2f737b7 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> > @@ -704,7 +704,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
> >
> >       build_registry(gsp, rpc);
> >
> > -     return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_NOWAIT);
> > +     return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_NOSEQ);
> >
> >  fail:
> >       clean_registry(gsp);
>
> So are you saying that some RPC commands need to have a sequence number set, and some do not?

I'm copying the behaviour of opengpu here,
src/kernel/gpu/gsp/kernel_gsp.c
if (pSequence)
        vgpu_rpc_message_header_v->sequence = *pSequence = pRpc->sequence++;
    else
        vgpu_rpc_message_header_v->sequence = 0;

src/kernel/vgpu/rpc.c:_issueRpcAsync
doesn't pass pSequence
_issueRpcAndWait does pass it.

The SetSystemInfo and SetRegistry are the two async calls in nouveau.

So I'm not saying some RPC commands need to have a sequence number and
some don't, that would be up to someone who can access GSP source
code, I'm saying that opengpu does this and I'm copying it :-)

Dave.
