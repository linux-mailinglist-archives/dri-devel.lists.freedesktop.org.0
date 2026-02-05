Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLlLE5AehGn7zAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 05:37:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88005EE8C4
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 05:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A1F10E7C4;
	Thu,  5 Feb 2026 04:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HWCUgqYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9A510E7C1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 04:37:31 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4ffbea7fdf1so5489981cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 20:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770266250; cv=none;
 d=google.com; s=arc-20240605;
 b=hjwWuUThAIqJUegA2egvfkUvpJgCeNYZEDY5rhbCCsn8UcCKYsIoAcEzqxsMj4U0BP
 hHwPdOYhWQ3Xksf90Fli2YG5h2Zgy4SRP57RUBPkDVOJVxkoDPpjbeCvvokGBl8IN/hH
 g57N1pWhH5BBKwJldZootlFvKSFv/5DduGfRw5Gxmw5lfP2/d7NMZv4A16C3SbQN+VSM
 lLTamoDX5N4x/IZBZea6ynMdHyYqCQyJqBv+vgSAV8DgqpeJwRrUI3vqfifSxwq1rvWD
 buqMyFUjDbiANcD0wLXmk5xc4EAqsEsPgXz8NpucjsPOgAoPCvGlO9uAOvoAVDAamvAL
 wWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Uo053AiR3s2wxdxNS+5lzt8uGB6Lo16NeV4FrfS11LA=;
 fh=xKJSIE71yvETh87AiIq+JvJQ9RdrzpM69nd6fXxSXv0=;
 b=Tb8FAu3IgQkwMO41TgdnjGHlaomi4dam0S6Eutu8sNhYZwrAEo2xo8DT3HnU9oNEmI
 GdWB81Blhrn05G8uWUn0chjXqnE7uj0FHQTsddnu+PXOmyn8Gn8vZjkoeEhlO14Mh4E3
 b5jHxBmfMjkzWpwHiNdac9o4XK3D6rmYOrKWiq+6jiS0plO85RPD+AUJjVvrjYi/i1QP
 fBcq/NZjRrSJrSH5EGRFB6JcdVlw2w0k87/5wwS1VHdzuvcYcT9gIOERVl81sPxk48kq
 fJuqLYApXzTXS6HuXocNGfS47+q/ju8A+2opsXZlIVNGkad/RLb8WdG0M2FSJyo68R8P
 qOBQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770266250; x=1770871050; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uo053AiR3s2wxdxNS+5lzt8uGB6Lo16NeV4FrfS11LA=;
 b=HWCUgqYihBMHJsqIqAgyr4GVpY/76speEqiSgW9gz8cmvHRCRRlwYn50WP79vN3uv5
 hckPPapl7yOii85XXalXZCZD3PTwpXQbTtNGaErq/WgDFmf/k9Y+42YI+IUYCp1wKWmp
 RD230IGm/0t2/HaNw/s9OpRV2m0hO2cA9X+4TWiMBpmBwI6OFPtsFzymBhOsU/M4FQTw
 iLuMf5acirhpqFFIB+Iq6R37L93bmiPRGiVme9waWDXDAlA67hJQdKwD9qL1FZ58mELj
 SA7icSzG5XEubtXjn2gq16y4xJjbzJvIeKtQXTFEnogzcJuGpnJk54JX/n+YuGdgdBsm
 a+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770266250; x=1770871050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uo053AiR3s2wxdxNS+5lzt8uGB6Lo16NeV4FrfS11LA=;
 b=P4ka8dvdmRcrTgfoV0xFVlTCepKiX8MH5feLvWj1NHePPRe8+nd/imhlxB1U1hIGF5
 xhvPP3iA6/yjYmV9XPpr+VGuvRiPuRrtZv+PYkn9ohqnYqXIWjRN4yKiQherxZc6tOz/
 hf1XWNgH6tg55CfOUJ6QSAau8sDFS0DpgglO847QaDZU/2Ab9esSUuxXVbzHzX/QKEfA
 pcMO+kfs/U46RqVGjm5ebBYNw4it75pZ5bsLGJ1ri2N61MSPunLwtBVxAjOBRwjcSIMM
 gRG1G6F84BDsEWXp1HrBX3Z7DDd2CpMwvVi6XWCOcEmRar0TgbL1YznpHupLNIHq0VX2
 of1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj5OBBA8oqDjgo1E+U6xJyp2ZS2BM7WmVe9vjw6HwH3C5CzatjkrRvmlj+T398EJ8TpARj8Vtx2R8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLMVazq4Ie/FJsSkzDoiXxfdr7ycT5YKWQJhOTN97K77gS3ADM
 I0Q0EKYwIuZTTc6wVzsANUbaMpG+pSnKc8lvZvm38zhR3+xiNHyW2u7+bD1benMGGYkox/ukKFK
 VYrvKskS+L3rhAcaRm2WbtPamdnCTiJA=
X-Gm-Gg: AZuq6aJu6JdEyIBAKHSmjRMo3E6hh6Yo47i/WBMSZscqpLh7u0NpSQrgv+5mje2wBiU
 di2GCUNI0IQD3UeYksiEfMfxqw5pUI/GP9uyAdxlrUv57OFdXPCoefsnc4vZm4cmVM+ezhRNv5l
 8gBPEkkgEAZv85xj5tWLCrCRr2V3mNe2q5mn8Ekf2ghp5M49FtWW5sLP2WJ62hQ4gML35Xl1CXx
 F8hLh/l8dVgltxR1f0H6efxjVScOUddnsk62FzPQkp6Y8rCXhrLS3nR0QXQnyZ2fmT/w8YBZ5pe
 H8Pn1mmLKBxv0A4fd4RGuhYEQnr0RTQ7mDQwfp6yo3zrm9ESf+wLG58=
X-Received: by 2002:ac8:574a:0:b0:502:ba2c:b492 with SMTP id
 d75a77b69052e-5061c1d1edbmr67846641cf.77.1770266250183; Wed, 04 Feb 2026
 20:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20260203052431.2219998-1-airlied@gmail.com>
 <20260203052431.2219998-2-airlied@gmail.com>
 <d8a40e5c65e4aa51636a42fc613b223dfeb001a6.camel@nvidia.com>
 <CAPM=9twKuyo2afqR3qM7LMkyuOue_t_eCm3EcnU4CkKPOyxcRQ@mail.gmail.com>
 <4409e252-4778-4e9a-961a-647cc99b9455@nvidia.com>
In-Reply-To: <4409e252-4778-4e9a-961a-647cc99b9455@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Feb 2026 14:37:18 +1000
X-Gm-Features: AZwV_QipD-8x040Gduwk0SFHBVkKNJ-_Ajyan_mUmpzusq5cHndi7LXXckN_WY0
Message-ID: <CAPM=9twGHsH=SKvfuuqCuQ=eQw3+qKhFWtQ8WFm0Ut_2WhwZxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] nouveau/gsp: use rpc sequence numbers properly.
To: John Hubbard <jhubbard@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Eliot Courtney <ecourtney@nvidia.com>, 
 Maneet Singh <mmaneetsingh@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jhubbard@nvidia.com,m:ttabi@nvidia.com,m:nouveau@lists.freedesktop.org,m:ecourtney@nvidia.com,m:mmaneetsingh@nvidia.com,m:acourbot@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 88005EE8C4
X-Rspamd-Action: no action

On Thu, 5 Feb 2026 at 13:01, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 2/4/26 1:56 PM, Dave Airlie wrote:
> > On Thu, 5 Feb 2026 at 07:36, Timur Tabi <ttabi@nvidia.com> wrote:
> ...
> >> So are you saying that some RPC commands need to have a sequence number set, and some do not?
> >
> > I'm copying the behaviour of opengpu here,
> > src/kernel/gpu/gsp/kernel_gsp.c
> > if (pSequence)
> >         vgpu_rpc_message_header_v->sequence = *pSequence = pRpc->sequence++;
> >     else
> >         vgpu_rpc_message_header_v->sequence = 0;
> >
> > src/kernel/vgpu/rpc.c:_issueRpcAsync
> > doesn't pass pSequence
> > _issueRpcAndWait does pass it.
> >
> > The SetSystemInfo and SetRegistry are the two async calls in nouveau.
> >
> > So I'm not saying some RPC commands need to have a sequence number and
> > some don't, that would be up to someone who can access GSP source
> > code, I'm saying that opengpu does this and I'm copying it :-)
> >
>
> lol I love it. If only someone here had access to the GSP code and
> the GSP team! :)
>
> OK, then, I just had a very enlightening call with one of our GSP
> RPC experts, in order to learn what the sequence number story really
> is. The notes below are sort of Nova-centric, but it should apply
> equally to Nouveau.
>
> Let me Cc Eliot, because he was also fixing up other aspects
> of GSP RPC calls on Nova, in case this overlaps.
>
> ==========================================================
> Background
> ==========
>
> Today there are some loose ends and inconsistencies even in the
> Open RM + GSP scenario, for how sequence numbers are used. And these
> are being cleaned up and fixed. In fact, I was even able to request,
> and receive some nice clean behavior, which will be implemented in
> GSP soon (we'll get it when we upgrade, likely sometime this year).
>
> Today, there are 2+ sequence number spaces, one for send-receive pairs
> (command + response) RPC calls, and another for GSP-initiated ("async")
> messages to the CPU.
>
> The "2+" is because there is an inconsistency (it will be fixed in
> GSP), leading to the first two very early RPC calls being in yet another
> unaccounted for number space. These:
>
> NovaCore 0000:01:00.0: GSP RPC: send: seq# 0, function=GSP_SET_SYSTEM_INFO, length=0x3f0
> NovaCore 0000:01:00.0: GSP RPC: send: seq# 1, function=SET_REGISTRY, length=0xc5
>
> ...are not included in the counting, by GSP.
>
> The GSP finally starts counting up when it gets the first "non-async"
> (command/response) message, here:
>
> NovaCore 0000:01:00.0: GSP RPC: send: seq# 2, function=GET_GSP_STATIC_INFO, length=0x6c8
> NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(GetGspStaticInfo), length=0x6c8
>
>
> But even here, it's not what I think we want, because we want the CPU to
> get back the same seq num that it sent, for command/response pairs. But
> that's not what actually happens (at least not directly).
>
> So for now, seq numbers on Nova and Nouveau are generally "do what
> you want, it will work ok". But actually, we will soon be able to
> use them for
>
>     a) debugging aids,
>     b) detecting missing messages, and
>     c) recovering from "CPU sent a message, timed out waiting for
>        a response" cases.
>
> ==========================================================
> Next steps for Nova (and maybe Nouveau, if not already done)
> ============================================================
>
> a) Change debug output to print the seq number numeric space,
> which is either "async message from GSP" or "command response
> from GSP".
>
> b) Put a comment in the code to indicate that GSP_SET_SYSTEM_INFO
> and SET_REGISTRY do not yet participate in the incrementing seq
> number system, but will in future GSP versions.
>
> I'll send patches for Nova soon, to do the above.

So just FYI nova gets this wrong as well.

There are two sequence numbers:

the one in GSP_MSG_QUEUE_ELEMENT and the one in rpc_message_header_v

The rules for the first seem to be just increment, the rules for the
2nd seems to be along the lines above, two msgs get 0, then start from
0.

Currently we never init the rpc message header sequence to anything but 0.

Dave.
