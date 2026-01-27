Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEG9BBEheGk/oQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 03:21:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E60F8EF96
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 03:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B205610E0AA;
	Tue, 27 Jan 2026 02:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EUVOYikd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2684D10E0AA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 02:21:01 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-35305538592so4643222a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 18:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769480460; cv=none;
 d=google.com; s=arc-20240605;
 b=JzibTV2sPTe67JAf01U7O7tq/UrhPMmR6yEdYU0f31/IvjUoa4sYiBFnSFtGHAw4XW
 ujz0Ru8T4KieKW6kEGRftePSs5Crl9KckgDaSzCfyjSdcKwMHL6TwdyejFj+PUD4k00b
 VanWcThe9hVOZf8d3JHTG3YfyU4cl74q43BzBK3xKYHsA6FD7gr5moJtJDXuzeIFFBHq
 1XqXWOFefmw5Vt/JbSpuB+RisVWNplcIrKm6NS0jSwsy/6OWEsKcJw5Kj7JmFAhWEtgN
 V1Hl4msC4NifR8Z62oaVrYQobzS9Ro3oyNI6ZqKFvTY8Dyc2Eo8B4p0KtsaiYT+7VKdd
 u4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=Bs7nc3TMl9yGEQA4DcUMctl9Wo9oUUnAskd5ppfl7nQ=;
 fh=3M4u+UJ9LeU0/ANmDFF98h9STQI8FswpwRMIAgruOc4=;
 b=bcMY1xag8ou9C9iuvNoPLUmeWtrD47BfxSf/IP482OvuWFPbyN7dOlQAL1jIuBDW3S
 twn/Lsyo5xG9GOKdrZKnpByJ2AQUPT9k1OKb+jJgixM6N95fkiZmCe+X6taoBsoVx1EP
 Sue44mwo7HA2ThwvOQpuuuLLqDstR7sfQ0h28nGfvQ8b7iZNpB0tp7Dt3hZUVL8V0+1a
 Fw8owe13ZqwMx3B3ZnnI7zJbyadO6/AZIJQrEdVQBaSIQUnZFbKere/4/PbGahMPf75+
 7YhiF8paeJBsy2J9iEdBvdyz1XV/N58tk0o+Y9HWyTwdIwswczBJY/7AIQ8FRL9YPE40
 AuZw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769480460; x=1770085260; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Bs7nc3TMl9yGEQA4DcUMctl9Wo9oUUnAskd5ppfl7nQ=;
 b=EUVOYikdazZT4cy5CbIw5ckgRrAGUFhfuVA+d/pVy0HdOJotAZulfRowBJgkw+RrFe
 JMyLLIwHc8hxkYzxWVUuojnEk+gT6oSRIWdqUAijg1FPNpYSMBpow4JxU2zdU+v85xDZ
 dwTwhRLzR4/8+LP1OUSHxvlZMlM5HcHT7EAhQQfJZxlg3PZZMDb2Ckzov560xhnKmBNh
 ZwP/9D8eGO6Y60acUf0FRcRudYT+AxwM7V/GkamBeJqZ6Qgv3N8Ck55Khn6Ti5yQ+Tho
 mbYbfSK+ehFWMha3kEjZkp9YHwbU15irecChjG8tC/19PSy1xvOW0qe6agHab3bMIdFF
 OLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769480460; x=1770085260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bs7nc3TMl9yGEQA4DcUMctl9Wo9oUUnAskd5ppfl7nQ=;
 b=lS+zCh+kYfMJJuiYaNIBn+EIiMWtgig+v13I89C8BNl85p1wTD8sfrTsHCeiIAE0Jc
 W8BsgG2p2VyRraRCMFgh1+w0T2ZbMRu01yLfslq+UzCx+xoyojjtXrpR1jJecWUyln+9
 7jFFy0/LM8zjBXwPvIANYfde/OfYyF1rgHv0r+oxa1F8Ka7uRQCiZXEyF72Qgvmmr5cR
 rysBTw4vIi3/5yyO+MZ21t3ZjeOW6TBbcr+zmmgAItH7ZGK7b4UARSuxy3TrbA2o0/2H
 liTUtyrEknOUrBncO0Le/VyUfPCrMabiiiepGVad26yH0hAlJTrXEEsDOVK4+q4XnjmS
 5Jww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm6Kp8tLA58KoKfFmMu2a54X/j3eHbkCjkfrfxytRSqEaJRKf0kK5wpBcYEK4wSpIN1gmd3VCsXdA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk4ZCNTq97/2tEHXS8ur2PlkDhSSq7z7uxLs3AK0NQNy32AKtC
 GRJwEPZhsP2QPmIX0R0/5j7UaqOfTXgK9oXUyK65PAvHHQdTDDiVhZ45S2U6vXM6yBskCbd3glY
 iAWFKIli0IagS+NH3Dlchjdc2IVgX+jg=
X-Gm-Gg: AZuq6aLKMNy1yeJ6jCoO91gn0j2+W9IHjaHHAdMEx+OMNEfI7aijEtVuoxEmnkBQOu8
 ZNJ+XKRdu9phQnZSmPVX2E9KGYVdPSYnd/ZzC9VU06lzVoPpscCGK7xFn0G28ZZYkTMjRbET1/i
 fg8g3pSjR5qwaW64tucJR0TZ83zewnpfWnXFVESGolooFp6BFaPPidNBiHgCej/EhHZOsLT7RrE
 exdqjaHUgLcgFUJN04J3Wd7fOOxH/BMkZnjfWkMT5AH/UfHiaS7l7b7vFTDRLksINtsIQ==
X-Received: by 2002:a17:90b:1b03:b0:340:bfcd:6afa with SMTP id
 98e67ed59e1d1-353fecba606mr340592a91.8.1769480460426; Mon, 26 Jan 2026
 18:21:00 -0800 (PST)
MIME-Version: 1.0
References: <20260117140959.879035-1-xjdeng@buaa.edu.cn>
 <2026012641-snazzy-upstate-a815@gregkh>
In-Reply-To: <2026012641-snazzy-upstate-a815@gregkh>
From: Xingjing Deng <micro6947@gmail.com>
Date: Tue, 27 Jan 2026 10:19:50 +0800
X-Gm-Features: AZwV_QhVJwE7Qm7Ykz-J0iorTirPRq_UXa-XtAQxlc07yf4858cwfShGkNiGTLU
Message-ID: <CAK+ZN9r57ErbhCxX6hR8_G1G+eTh+UajdNftvKkUnyefYm3BhA@mail.gmail.com>
Subject: Re: [PATCH v3] misc: fastrpc: possible double-free of
 cctx->remote_heap
To: Greg KH <gregkh@linuxfoundation.org>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
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
Reply-To: micro6947@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
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
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[micro6947@gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6E60F8EF96
X-Rspamd-Action: no action

This issue was also identified through static program analysis and
subsequently verified via manual inspection. I believe I have
uncovered a potential risk of abnormal execution here, hence I=E2=80=99m
reporting this problem.

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8826=E6=
=97=A5=E5=91=A8=E4=B8=80 23:24=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Jan 17, 2026 at 10:09:59PM +0800, Xingjing Deng wrote:
> > fastrpc_init_create_static_process() may free cctx->remote_heap on the
> > err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remov=
e()
> > frees cctx->remote_heap again if it is non-NULL, which can lead to a
> > double-free if the INIT_CREATE_STATIC ioctl hits the error path and the=
 rpmsg
> > device is subsequently removed/unbound.
> > Clear cctx->remote_heap after freeing it in the error path to prevent t=
he
> > later cleanup from freeing it again.
> >
> > Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> > Cc: stable@vger.kernel.org # 6.2+
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> >
> > ---
> >
> > v3:
> > - Adjust the email format.
> > - Link to v2: https://lore.kernel.org/linux-arm-msm/2026011650-gravitat=
e-happily-5d0c@gregkh/T/#t
> >
> > v2:
> > - Add Fixes: and Cc: stable@vger.kernel.org.
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/2026011227-casualty=
-rephrase-9381@gregkh/T/#t
> >
> >  drivers/misc/fastrpc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index ee652ef01534..fb3b54e05928 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -1370,6 +1370,7 @@ static int fastrpc_init_create_static_process(str=
uct fastrpc_user *fl,
> >       }
> >  err_map:
> >       fastrpc_buf_free(fl->cctx->remote_heap);
> > +     fl->cctx->remote_heap =3D NULL;
> >  err_name:
> >       kfree(name);
> >  err:
> > --
> > 2.25.1
> >
> >
>
> How was this found and tested?
>
> And randomly setting a pointer to null doesn't really document what is
> happening here, what would you want to see here if you were to look at
> this code in 5 years?
>
> thanks,
>
> greg k-h
