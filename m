Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDq9CKydqGmHwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:01:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F48207C87
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FCC10EABD;
	Wed,  4 Mar 2026 21:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fb+xGyvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F9710EAAF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 21:01:27 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-5fded42aa7cso4956700137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 13:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772658086; cv=none;
 d=google.com; s=arc-20240605;
 b=eQGb2V3I8nB3IIXAddyPb9eC/HPR5NznRJcVhLCH0O4VRQpoSE6Jsp78qG+FOI9XIc
 cJ2JpWES9Q3boM87nXoI6jpwotNrQdFngJUGlY2ocfE1HdGbyb2kdCgjuslejY4SjSDF
 osRPv67QUUsr998OTJfgAa3Wq9TUuXz22tQTIR1VHnMf/PT38m6Y+VxDUuG3O5tTsw9i
 D02M4O8liiwaq+985x8ekT4b3dzGiaiBhvPhDq2e0qA7SCbMu7l7WpB8ATKSCWK52mZQ
 IiMk3KmuBdyjDj+NgRNiMp1Qn98n+E30604nzzCobV1+UumxTyYJLuvj+Pmwi+b5DkG6
 YJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Y09idInqBqixvVwzIqzVBVDZtDpn5ULCjNjUhtbUWBE=;
 fh=OauwQ5X6s9C2+HIUYSeaB+uUVYP+PM83MoLL3nTLdKk=;
 b=NRI+rv53jPd3nu9utEp7MYHtBUoihawQKCSnh9rxIwf5PunBXDscm/WCkBBygs8hk9
 Kv0h7FjO7Ie/q3eicPkkmFtSsKT4AzDiOXyYwRLYSfBjsHrQO0C6SAx8bzE1P17rCKYD
 t8jerQzD9xGFx5dNeZ7+71Io4PKDTBNrCRs1ka+TVx3aob2oErM0H7iF17Tn5+//nLnb
 nozJXHQa2c5qr3EXxscJ1Ljv73ARM8zA4XZyfZqmgxUNSrGfOu7FvKJXkju8KH7bNfvb
 EFfQkl4KR8ZVhxcfEh51asujKNBPWq0gOXYd6TdNmoLmXgUjt+XfiN989ORud0/j9NbS
 85xQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772658086; x=1773262886; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y09idInqBqixvVwzIqzVBVDZtDpn5ULCjNjUhtbUWBE=;
 b=Fb+xGyvEnTe8Xb2bS0wKUQHLwehE71EgWZxilqxjcNjgZ5aG1TqqRUiCMTG0oMzm7f
 PjBoTuYP4DS9JlKOJzrFVdlfYzTlS7ul2UxW1WTNK4XVR5MYC1EcGLRyQoT1mgjz/fGW
 JubmkNhqK6fePSl9+P16cmLfKN51QkVJxIzXAqk5UJUWcyq0+s3Bw+ze3tsqlmqRjKJ2
 R631+AZssPOrgomr9b7UEVNN/x+yJHrU9pEyRqxdotF0VA/48XwOAl5EcOypmbWNj5rQ
 swLSetjzeSuKTdrDaPXf9gQ7cCuRHmg83vtLrkexKUdHqy40biD8lz6gKkfQs13s4mnV
 Numw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772658086; x=1773262886;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y09idInqBqixvVwzIqzVBVDZtDpn5ULCjNjUhtbUWBE=;
 b=JjaAK8lim2+sdL+/ariiJiztSQQyS0sgiJu7wtaxqv2tGxh8B5Ns/d5QKeiDXBaLKl
 +Cii1mFx5CmB9racFkJA/3wHPWlRuBxMa0p++ZAN7AwxXpK3+FEUaMzIdQ1TJ3TlYMe/
 NpZibYlKc1lPgd1OxLnhA5ptpyAbEfrKGrajKu+Hh+3t7F4hVpPkE8flwFMfUgwJ3K9C
 /05sLsF0nskZytF7G8PguMvM6CMxdKyT3zmtdGW/BPDKSVrATiz8gLst2F0IQBYTG6Yx
 a7qskp0un4c2Zlezd4bbZm+3fFNGlc9w1QznQ260bqTPWCzINcL37Eeh7iuIJAKjtR1k
 DJKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYnAMI7a+iTG4w64vbe/6EpHak4lFu/Yq0+oLmgiBkjYvijQqFXDq/+rwkbFOrknCY0FGq5/cXBCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/lFV2j9qU73xgt4yY3DzdKI8Ls/Pbg05j6dEDoTKIzAv5H1+1
 3W6gI4oG2m4vF20a1nexcqcYtV0CX9IjcvA2znwNxkBXEew0cUeIvHr1npZmIigZwTiTT8P0avJ
 mzulpGkYxRTCXqyU9L+n7g6PCoxPGhjU=
X-Gm-Gg: ATEYQzyoHkmG/gvOS07sbJXb7ajAG+XmGNW6I1jZVnUL5FqvBAfnWh9yneb7AoSPP7E
 OEjlFB8Vyp/EdmoVMZy5qdQCJSMJGjeINH7uiNR9S0KnbXJfhqg/L80VcjtUj46i/4K0Pl4OOFi
 tC5piyWxOi5YXR8cPvC2PETLFlJn4qVqDz++UVu8thFyEbcwynfZpA2A3fBEaExPUH+Vrs8pMPl
 reMYeldkqf4kFQQsJHjD69NRAXIsP5gevDV0MiDgUcbHMUQxx94okq8bHalHYZr1jehow2vM6QK
 uUMPcW08an4epimHCbz0rktgb6+ftseIBT88FI+LWGHSHzaHNsVxVr6vwh834hYTvWU=
X-Received: by 2002:a05:6102:370f:b0:5ed:a35:1985 with SMTP id
 ada2fe7eead31-5ffaaef3975mr1630295137.26.1772658086167; Wed, 04 Mar 2026
 13:01:26 -0800 (PST)
MIME-Version: 1.0
References: <25ca7b31-7fde-4259-8370-a28b4e459bad@nvidia.com>
 <CACO55tvHSASgp=T9Xos-mKomVN-atVF9=7AsDPi5k35wOx6GcA@mail.gmail.com>
In-Reply-To: <CACO55tvHSASgp=T9Xos-mKomVN-atVF9=7AsDPi5k35wOx6GcA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Mar 2026 07:01:14 +1000
X-Gm-Features: AaiRm51AalfcjZXGPiPl2HaI6GCMt2nnPiBV0bTZxH7nxpz0ershjDujJiuU6bk
Message-ID: <CAPM=9tw4xJk+bPEq_kCfkv2j2o2o_r8NtztdUyJRBFjX7t-NmQ@mail.gmail.com>
Subject: Re: nouveau mailing list is stripping Cc headers from relayed messages
To: Karol Herbst <kherbst@redhat.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>
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
X-Rspamd-Queue-Id: 88F48207C87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:kherbst@redhat.com,m:jhubbard@nvidia.com,m:lyude@redhat.com,m:dakr@kernel.org,m:acourbot@nvidia.com,m:ecourtney@nvidia.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 at 06:34, Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Mar 4, 2026 at 7:18=E2=80=AFPM John Hubbard <jhubbard@nvidia.com>=
 wrote:
> >
> > Hi,
> >
> > I'm worried about this because eventually Nova will have to use this
> > mailing list, at least according to the current plan.
> >
> > The nouveau@lists.freedesktop.org mailing list is stripping Cc recipien=
ts
> > from message headers when relaying posts. Recipients who are Cc'd on th=
e
> > original message but are not subscribed to the list get silently remove=
d
> > from the Cc header in the copy the list delivers.
> >
> > This breaks "reply all" workflows: anyone whose mail client picks up th=
e
> > Nouveau-delivered copy ends up replying without the original Cc recipie=
nts,
> > dropping them from the thread.
> >
> > Here is a concrete example. This message on lore shows me (jhubbard@nvi=
dia.com)
> > in Cc:
> >
> >     https://lore.kernel.org/DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com
> >
> > But the copy delivered through the Nouveau list has my address stripped=
 from
> > Cc. The rust-for-linux copy of the same message (same Message-Id) prese=
rves
> > the full Cc list correctly.
> >
> > Could the Mailman settings for the nouveau list be checked? The list ap=
pears
> > to be munging or filtering Cc headers on outgoing posts. Vger-hosted li=
sts
> > (like rust-for-linux and linux-kernel) do not do this.
> >
>
> fyi, the nouveau mailing list got migrated to mailman3, so this might
> be just fallout from that. I'll be checking the settings to see if I
> find anything there.

Please check in your personal mailman settings

Receive list copies (possible duplicates)  is set to yes.

Dave.
