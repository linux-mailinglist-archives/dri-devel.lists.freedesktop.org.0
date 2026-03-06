Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKDGIJ7eqmlqXwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:03:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CB72223E6
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421CC10ED4B;
	Fri,  6 Mar 2026 14:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qau6CML+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BD910ED2E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 14:03:05 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-7985ce90542so92044617b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 06:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772805784; cv=none;
 d=google.com; s=arc-20240605;
 b=a2rBsxJpyPB7/xqvpw2XVE10sxP8N5IKqmWgrej4FSXJdCg14pdKw7NslDXZixJ1xU
 9mDNadqJ5FH+CCMc2F7x8zT7IaAtPQByP9cD7syDGqJQ0Wkm1qXA0Ud7tMQ4zJU7ikwj
 wpA+hhzOd+L9rdKxFMNNrySaEobSNNqvssKz59rjcVRs+Dcct8lyo7q8gZfGtJq8seII
 bB4N60JaVAiz2C4ck5xUf2NedH/hvk88tHmQKlH1EAGhDqRT1sR1UhfeNk3vM/VUst42
 GsVHyYvd3I6zGwpOGZD1307cAsOgjlxZRhnE2sMCWkbEdwOBOXvZRhjZEdm8OsZcudKW
 iLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mKF5k211NtUeIcGa6uptRsEXiW/hV471fc5S/IDch2A=;
 fh=RLR0vsRaYU32M+ZCFdFbUtIVKZ/2BvkZoS/Sm0I9R3k=;
 b=gUAh9CKEvud1f+Tppi52CX6S0GuxjCbZ6fCPhtthVoEyDMUBwmIqn3G0R2XElaQYwI
 br103EjlXhH9CaIFgsSN1v/i/952c34U7oethttXugYr+19Pzwjgy+z3tQsxTWVo0i5Z
 oTF3A3fEzUOcGcqjka4pmGl4YF+f1+Los1GmarEi7AE+HbqMJ8d1kESqfTHWWgOKm2iJ
 ObMiwPTeGZRV1iijciQZp1msXnFL48Lxm5yCQZBtGTISSerRe8MXraABOJNzGe5zfr2m
 HSCM84a/ZLBFqVgep61F08uxlpJRAtfLwr/U59roe9OCPptmj0X1hrC+Io+btb9RixcP
 crlQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772805784; x=1773410584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKF5k211NtUeIcGa6uptRsEXiW/hV471fc5S/IDch2A=;
 b=Qau6CML+yiU/U6ticC0YdY0ouic7E2IKjUeEDRDWliaeooXqgKBXwRJrv3CNiI0rnk
 523FzqmDHYkI5SD3TK32EoRpOQYDdQQ/0fXnFTBMqVwNPaZsEIf0k8RPYxdELFEiWh+P
 yOd1VBsksRR1FmxGt+PjwmLAmOMoX3j6IUl1cpa1geHk1VlXuOWUavX0JpkaDoIvdQI+
 NOk0r+ch64Go68HTXDhS9d28kxGlaie2JnBsy+rtQEe9ozuMJQcLJ2IURGodeRl7B+oT
 yBKgYWfMeihQIU35h3n6v5Z54s3ZrNN1eLazHlonLBNncGXtK9JE70sg6eSgBwZtWKzX
 e0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772805784; x=1773410584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mKF5k211NtUeIcGa6uptRsEXiW/hV471fc5S/IDch2A=;
 b=sDLw6qH8v2+C/r2LglP+Zjcs19ulvKe+lgQpJ+vhX4lVv6wpjZ1kCRiMYJ+lR3gLL2
 uuYVNYkccvnHPNfQa3CLlmAOwWoS046y1Ip6u9dwvbBEbQf/jvi+eGKV8+ycM3/EAb3U
 lXEj+41/vPCAzCUd+Exj+0J5y1s8JXccgW+1U/zAUNtnyir4bFpvXiY0vAZJSpztpWh0
 40xGKceDK3B317V/HeayBHAVxACjfN7Fjb2ZadSzZ/f9A4K+MCi7pth1c7iOkhWLyEkf
 SGXXlB6MWqhG6eZ7OGPXHKTQoQwWqts89Atwha3FwEhkUfddH3O+sNNhik4uPPyydwrp
 HJfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU57ZPpfYJsZjzpHM8luQp4SbKM9oEkjjaQqDEsNnt/BeyU9AQ1St6XZTlgQHTorYYxTXk22KBEujM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwstozLj4283iqgAA1pFMG272iMlpd/DTuIpGsRQM4fpW/yxIUB
 GIMH3WS4TTiZx4jiobrhRFJBGdbKbmVEZrOUqsmx45x6qNfoTxaRSfcT3DjwdZPxYmOIPZD/yrd
 muqoOD0Ka91uIsfnCds+zEaCs7qtIalE=
X-Gm-Gg: ATEYQzw6H5xOVgg4FO2WlI5jBvqUCSGIH/3kVXb16FEDD8XczQFZAPp/pFFCcNWGTgX
 E6zn94iS8xKz3mcPS9MjghU5T4v1DJ/93U4WpZi/NpH6iFEfcYCOnqQjEJAMersFuV7fr8JGGMW
 oOSajBpkHVphdU1qy3/xvxaJscjS6VJLteX04QH9GAr6szsyMr5qHAjj95742VI4C7hILJANMA7
 1XK2hAm1t6SXiKFLet9Ve1loKZGKK0WJKey37IEUSbVshm3qi2j4YbbwyMrVosmPh2X44G6avnh
 n4Kl
X-Received: by 2002:a05:690c:f03:b0:798:740f:6af1 with SMTP id
 00721157ae682-798dd6e9b55mr17942317b3.24.1772805784050; Fri, 06 Mar 2026
 06:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
 <20260306015022.1940986-4-jim.cromie@gmail.com>
 <51fed793-869b-4a5b-b90f-2ba80c13d773@kernel.org>
In-Reply-To: <51fed793-869b-4a5b-b90f-2ba80c13d773@kernel.org>
From: jim.cromie@gmail.com
Date: Fri, 6 Mar 2026 07:02:38 -0700
X-Gm-Features: AaiRm51wLCC9Sug6nG1UgnDvIstzQQFHwne8N2p7gQVCpTt4Mc1sv69X0Jjm7fU
Message-ID: <CAJfuBxxe5uJc0=nLC45JMp1dcQhyiyyyNuv06jZJX++YJaN58g@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] drivers/tty/serial/serial_core: ratelimit
 uart_wait_until_sent
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Joseph Tilahun <jtilahun@astranis.com>, linux-serial@vger.kernel.org
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
X-Rspamd-Queue-Id: 24CB72223E6
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
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:jirislaby@kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:intel-gvt-dev@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:gregkh@linuxfoundation.org,m:pmladek@suse.com,m:ilpo.jarvinen@linux.intel.com,m:linux@treblig.org,m:jtilahun@astranis.com,m:linux-serial@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 11:32=E2=80=AFPM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 06. 03. 26, 2:50, Jim Cromie wrote:
> > Ratelimiting these pr_debug()s can reduce the console flood during
> > bulk dynamic-debug activation, in environments where a serial console
> > is used.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >   drivers/tty/serial/serial_core.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/seri=
al_core.c
> > index 487756947a96..6db465619c70 100644
> > --- a/drivers/tty/serial/serial_core.c
> > +++ b/drivers/tty/serial/serial_core.c
> > @@ -1790,8 +1790,8 @@ static void uart_wait_until_sent(struct tty_struc=
t *tty, int timeout)
> >
> >       expire =3D jiffies + timeout;
> >
> > -     pr_debug("uart_wait_until_sent(%u), jiffies=3D%lu, expire=3D%lu..=
.\n",
> > -             port->line, jiffies, expire);
> > +     pr_debug_ratelimited("waiting on (%u) jiffies=3D%lu, expire=3D%lu=
...\n",
> > +                          port->line, jiffies, expire);
>
> The changed message does not make any sense.
>

Ackn.  Given the narrow rate-limiting purpose,
I should have ignored the checkpatch warning
and kept the message as is.

In any case, my test setup didnt actually use serio,
and didnt get flooded by it, so I dont know that this
single change would be enough to fix it.

I withdraw this particular patch.

>
> --
> js
> suse labs
