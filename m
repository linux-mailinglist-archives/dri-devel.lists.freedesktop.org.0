Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IzuIm+XqGkLvwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:34:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5535207A20
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FC110EAA4;
	Wed,  4 Mar 2026 20:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JdjeDIQj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5857E10EAA4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 20:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772656490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IgCLKpYYBwlRpmyNNlr1rhtk6e2ix/eEL8yi8XVh/Pc=;
 b=JdjeDIQjIeD2IBjlbmQBDe31lLTcQzroKzApM7ZNnACW0TASZ/YAfq1tpYK8/E1jHNisFy
 zUTp8ZERTn09fgX1sLcEgny1ZjR4mmUlJ1o5ImhpPJgQ6IDp3euD+lRybjay87++/KtsZZ
 NUl3dAO3pqrIEivdIndQCV2XULVeDUk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-ciLaICLoP0S8M31S5HyWhg-1; Wed, 04 Mar 2026 15:34:49 -0500
X-MC-Unique: ciLaICLoP0S8M31S5HyWhg-1
X-Mimecast-MFC-AGG-ID: ciLaICLoP0S8M31S5HyWhg_1772656488
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-660fa747a8aso753942a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 12:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772656488; x=1773261288;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IgCLKpYYBwlRpmyNNlr1rhtk6e2ix/eEL8yi8XVh/Pc=;
 b=ShXrnNyu0fqimOohhgf4vM1Dq5VZTDdkdRD1LavXIkkMik8otweU2yGxwZpmjy9q5B
 EbXmiovHtW+sjvi23lyVas4YaoHaee1QUu++LVgpviYx6cPbnWo4z9JO1cOAQcARv3lC
 8xicb39gT+tzAI/N6fyWDcxVvGOpPKd9I5KI+xpuEiemz5vJlIVxlR6J+udF4wI1lw0H
 fjqrnZRJ/zlY43r4BsyeqlAkEX0zQk2cZ91uWbJY9TCd9sgBl4LDzB3KE/ZMD77P0bpV
 HTYnwwMjxwKMSWimEfUUJq7yjOAejkouvGFRi9N2vILjr4Y9XLu/J+Gx3HBOup39BQ7/
 lQ+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwv07NQYumoncxN05T+r/dTDRaOZzw4zbiq/eL2Kin9Zs+ONyTA5W/Rjr5VWbEEsN6OdP/+6mshzo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwToeb7mV9chZqqjYK7D9tO19FP5SOM5gAZy+MEGHVdrFO26fse
 LQxJ50htPiRoF5HTjBWXFdIAX/+uYHupyWE7aNr2dD4moqkY0Kuf+2NDiirCkSerT7njF4qmhng
 sEm9IizLWDKEWq7vmIdXiy6o6SwioPx8uOOMRhJGzHo41vmYdlH1iaUhb9IBnXvvmQlSuLFKolM
 ZT4zu2F25p9j0vsqrCx2o7hAjkZG+BOeYtnoxAKyyf3uMr
X-Gm-Gg: ATEYQzyKy0ToC6/nxXZ9BBNhWTcmdY9+j3EfGTNV3UhlLehGgqgkP75gnBj9j/ePdxF
 Q2sZN+Png4G4BhL/1o4rWbjDHEx0O/5cnJygktVdKFeQ7Xb2Qmsbcil4NH15imCdq6k5T+RU1m2
 3mNEXwxblEVxFeZBYeKbOoFUDPo4BDu0erV3VdM8VwBlIs9iIKfQc8MjQ0gkaOOpOHx0RmKs4bT
 mdZVPE=
X-Received: by 2002:a05:6402:f25:b0:65b:dca2:a59 with SMTP id
 4fb4d7f45d1cf-660efc9bdffmr1199807a12.8.1772656487808; 
 Wed, 04 Mar 2026 12:34:47 -0800 (PST)
X-Received: by 2002:a05:6402:f25:b0:65b:dca2:a59 with SMTP id
 4fb4d7f45d1cf-660efc9bdffmr1199794a12.8.1772656487390; Wed, 04 Mar 2026
 12:34:47 -0800 (PST)
MIME-Version: 1.0
References: <25ca7b31-7fde-4259-8370-a28b4e459bad@nvidia.com>
In-Reply-To: <25ca7b31-7fde-4259-8370-a28b4e459bad@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 4 Mar 2026 21:34:11 +0100
X-Gm-Features: AaiRm52PNe8O9EuBmGzikhwUQrrjF1N2u5qkOmWrSgqOBDAJs_eITTc9lLnZe90
Message-ID: <CACO55tvHSASgp=T9Xos-mKomVN-atVF9=7AsDPi5k35wOx6GcA@mail.gmail.com>
Subject: Re: nouveau mailing list is stripping Cc headers from relayed messages
To: John Hubbard <jhubbard@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v_Bo_DeKp-GTz7N94qyaftXhbjhFwYm_pbqQipVLzA0_1772656488
X-Mimecast-Originator: redhat.com
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
X-Rspamd-Queue-Id: E5535207A20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jhubbard@nvidia.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:acourbot@nvidia.com,m:ecourtney@nvidia.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,gmail.com,lists.freedesktop.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kherbst@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[kherbst@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 7:18=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> Hi,
>
> I'm worried about this because eventually Nova will have to use this
> mailing list, at least according to the current plan.
>
> The nouveau@lists.freedesktop.org mailing list is stripping Cc recipients
> from message headers when relaying posts. Recipients who are Cc'd on the
> original message but are not subscribed to the list get silently removed
> from the Cc header in the copy the list delivers.
>
> This breaks "reply all" workflows: anyone whose mail client picks up the
> Nouveau-delivered copy ends up replying without the original Cc recipient=
s,
> dropping them from the thread.
>
> Here is a concrete example. This message on lore shows me (jhubbard@nvidi=
a.com)
> in Cc:
>
>     https://lore.kernel.org/DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com
>
> But the copy delivered through the Nouveau list has my address stripped f=
rom
> Cc. The rust-for-linux copy of the same message (same Message-Id) preserv=
es
> the full Cc list correctly.
>
> Could the Mailman settings for the nouveau list be checked? The list appe=
ars
> to be munging or filtering Cc headers on outgoing posts. Vger-hosted list=
s
> (like rust-for-linux and linux-kernel) do not do this.
>

fyi, the nouveau mailing list got migrated to mailman3, so this might
be just fallout from that. I'll be checking the settings to see if I
find anything there.

> thanks,
> --
> John Hubbard
>

