Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULKkNQ2gqGmZwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:11:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426E7207D57
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6699210EAB6;
	Wed,  4 Mar 2026 21:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IkWmtOz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329B210EAB6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 21:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772658696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dB/14PKykc0cgUIAhJh9A6y3p8FMTnS+Sf29Ilqfrs=;
 b=IkWmtOz40jJdSnJoEqMdwkfRjeOcpLSNbfGengX4Ec1PbzJ/YXNmzpC4mKad+72X/8Kf8i
 sJzQmaaOlC/lRHe2hWiKH7tt4yDPto8M942fi/Opr9qm8/kN6yYWbxQzzACXhrQ+VH3UOY
 27Alwpc9VrM9ra+CGUIsX1/8cEPwlKc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530--3CowS7KOcWekC5twaBQJQ-1; Wed, 04 Mar 2026 16:11:35 -0500
X-MC-Unique: -3CowS7KOcWekC5twaBQJQ-1
X-Mimecast-MFC-AGG-ID: -3CowS7KOcWekC5twaBQJQ_1772658693
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b936b6b4473so720622866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 13:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772658693; x=1773263493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3dB/14PKykc0cgUIAhJh9A6y3p8FMTnS+Sf29Ilqfrs=;
 b=J6Qk5K+OylpaLm+KVW/Mbod5X1hn+ZVptY5GkM9vz6u6pLXfUG8vQAxuNKTjAns3au
 8hf82S50unUYcDb66VC2vm6j9HGimxvgh+9BWQgpV7xbazWy8Bp1hYQFuyQ+O3Ycg8MG
 4ekOGa0Gf2Fcj9TBsOq1VCTrALM1CCgQpZ76hk9edLoubIDR/VPut73A7DclC0DJ+aWq
 aPsxNTGaZOr3lKT1zfBvwI1H8kTS4Ju9bu0wi2Hk/Ot0qMEz7a8faplU0YPUzTFBsoqU
 szpGig0L465RRv0BrkcTnYvnMmbLzqX3EUoaozHE/92XXRNrZJLYmem8/o6Ii9nowe0o
 9ppA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC9FmKDO8CsHhEGryMsKGIpMwmX6XtJvIsQNAdu2eQh7sfgk1bZjwVmmtxRAALj6D9pxS/shODo68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySJ9Maa0stPvvr9EHrVPqglm2lZDnPzHaS0LRZyu0XQj51ovHx
 wvkAA51chu6mSZNEtuQPq0zMcL8wqLWSziQ5UE6guiSWxxuKWMld78Z+ko1D+FCHmQ5YKvhhW7Z
 jYmAdjaWvOmYf4HWQo45lWn4AP6+fX+o1sQgth+Y1I8hJgMb4YC+PN886gptmsCJ5k8Q7RJzUeF
 Jg9Giasv/OjxeGJzgHp4MZbrkcU3QsNvehjkqBkvAiKzRd
X-Gm-Gg: ATEYQzz8seA2OT9Mrx+DsewUxANSNIXouAFCM9KYzTHIqKau79MJtW5OzZDMeKBn5kp
 4GJf8ANOlYtCDxcAcHdmEN3+e47ngx6LxLCFlXauA/kIREAZNxmtitoDWGJEuOFBEZdrShxTb8/
 3Eh3GsOuUhwQTcasRj2kJtfI98C6JYnX59ZB5D5Y73oCysMZahVyx1LO4DivPknY9ZhrEpQ2wmU
 0OBRWk=
X-Received: by 2002:a17:907:6e8d:b0:b93:81e7:8456 with SMTP id
 a640c23a62f3a-b93f1230d03mr225074166b.15.1772658692685; 
 Wed, 04 Mar 2026 13:11:32 -0800 (PST)
X-Received: by 2002:a17:907:6e8d:b0:b93:81e7:8456 with SMTP id
 a640c23a62f3a-b93f1230d03mr225071966b.15.1772658692225; Wed, 04 Mar 2026
 13:11:32 -0800 (PST)
MIME-Version: 1.0
References: <25ca7b31-7fde-4259-8370-a28b4e459bad@nvidia.com>
In-Reply-To: <25ca7b31-7fde-4259-8370-a28b4e459bad@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 4 Mar 2026 22:10:56 +0100
X-Gm-Features: AaiRm51TTsiec5kR8TxZx1X1uwlP5ETFw8lFmDLgku9uUXgfXBuK7RKqZSk6ZPo
Message-ID: <CACO55tvtLOkvSx9_4NzWHs=zC2AwwVo9=fLd51TBKFDTyLExpw@mail.gmail.com>
Subject: Re: nouveau mailing list is stripping Cc headers from relayed messages
To: John Hubbard <jhubbard@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DDbfAJBnwM0qzO8kzcHPMmyLCFE-bsnFJsLGJYPYIRY_1772658693
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
X-Rspamd-Queue-Id: 426E7207D57
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jhubbard@nvidia.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:acourbot@nvidia.com,m:ecourtney@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kherbst@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,gmail.com,lists.freedesktop.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:email,nvidia.com:email]
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

uhm.. I took a second look and your email address
"jhubbard@nvidia.com" doesn't seem to appear there either? Do you have
a link where it does?

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
> thanks,
> --
> John Hubbard
>

