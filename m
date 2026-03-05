Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEipEvPLqWl+FQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:31:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD61216F9B
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF6D10EC6F;
	Thu,  5 Mar 2026 18:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WUvOjVxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292E210EB6B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:48:28 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-64c9c8f8783so8364285d50.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 04:48:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772714907; cv=none;
 d=google.com; s=arc-20240605;
 b=PzOqfaMEomNoYlUekGTDWq7pn+rn84088S+F2r/Vug6nuusmYuoYK7opowsNoQV+jl
 DmlUmal4CXvCebEcoX1+51gh0gNVssB9xy/oJGP3oUSaXhu2TZGxXAJfKci5EfT+ehtx
 M1skBsBKZybqHJgKN26d3vbW6iNmtFs5zstNPWcykN7fkCRfCxopYl8Xx+ViI+AVcAzn
 WkNmYOnJqpMSlaOVz3l4IeL8Yw3x7iwEYVK6GZ6KdUMUVCCqB/w8/NGGe2x6nWLquHqu
 /JWEU/BYFTjhW/JQL2KvyNVyNLbrqiND7H6sAje98q92z8AQXz6zP6gft9OX3z3OxrNF
 OwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1lktPQKoQSBAfb3VN4Ge3cjP6qp5Dqrkk2aMRnMzmQU=;
 fh=b1kDuJNBZbegb5OjnPusfMUNG7rj6TgmpSxAAjA+Gss=;
 b=XxwvgJjq2WALiZAQPqTh42v5KXqN87K+oXqilNq9lZevMrlqueHymHtX0awPWDLxQ0
 jYb2eMvMsdsRCKw8LGxuk/8sQNX/S0RY8CN5avP8AgbGj0h5glmCpx+ipQmhLEvenHUd
 pSrGz0BXQfHzhUjQ+HpOOsPm7D/+CZ2Os/lVrCRHP9mLwyn8Jp00E+GHmwsykYH/G1BJ
 W47AdVe3V9tiLWM0DHaQ51IJ1dBqyDoqWZG9lPzj3N0zhwO8dK6EOWNy+/6gyMV/nK7Z
 rLzpJe5GfW4kzo/VipYNYYgV938NxIVX/40SphLtJr2Jwrel/imfGDYbcH64PlZc9geo
 wLDA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772714907; x=1773319707; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1lktPQKoQSBAfb3VN4Ge3cjP6qp5Dqrkk2aMRnMzmQU=;
 b=WUvOjVxVYmvlFCz2wLqGuLgfqDe/59F0g8Fv9fbhjOfJVmhZ5lCLC4qVNE3ZWG/ix9
 EH6o7JcU1heDnwx0a93PtJT8kvUuNHTDNpG3NnoHwefgdt9RP0vgVeLdYTHsK3aK7KQk
 BogJxpoQCRHTAdfu6Et3hjl3ZdO/cbWMJBDdcSkJdA1gJ5t+72RfFIyz/IgpVja9379A
 mxwwyMYfMnqGQJp8Wdrn/E81iQ4kt8hQZjVdu+UNksdBOjgY8ppAEcgioIyHTGXNOuuq
 FeB7lKBWeXdp+r6MdlGsYbiXzs2Ufd3JPZzeh2qH3kbmsQJwQd9rUzVLhwxhZGipsN6/
 UXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772714907; x=1773319707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1lktPQKoQSBAfb3VN4Ge3cjP6qp5Dqrkk2aMRnMzmQU=;
 b=KKMXrl3krmwuu+7wjDSh7GL9rY0RCciRA6RFGz++yzw2WTLcW6zfm5mNViEOnZ+1do
 tFTGh33JgFwqsZEz/+DoXrQMsbVtyVGOZeUQHdBzAYqvrC1/hQH7O3APwl1WMkFXpxfB
 xut6uuymPF9mxX8pDsvbj+PuqVWgi+wvD7ZiaA8dS9W0UPf8ITfWjy3sc9G29nYb9TVX
 xxkpDLBPD08TloMFipZ8dGH4dxqEg1AHByNntHb4Qp8fBnl4AmBO1HldXAttIksyQW/e
 xEmze3xRN9zOmBR5fkE8HuufopSg5kIZd91ixVGlq8qwaUIsWFbwzJU+uDz5zGR8AEN3
 9Izw==
X-Gm-Message-State: AOJu0YzzE06dlyJX1FijPQs44JsCsin6UQZHqMeMElTezl+On7Oh9BHq
 qmjRjLIYsP0fOVbsKalbZUDA2g6kVxqKmAY3sdLZ5RiVZZLPWkDeD4Py7/vLboqlP9J64hQUdjj
 PuWW99/3q9cRaL/bagTRDy7p/1R9S5C4=
X-Gm-Gg: ATEYQzx7NvuEIlVNc7j5ftsutsnWgDmqW50uqrA5JnI/pPezaLmqQkXukzKfSKKwKHz
 JB7takgwfZWsxQYxPjqpy1mQuis0ch3xcz0/FxIOo4R3Ffa3qSoGmN+UifRs66PlBS6JYyXHp3O
 UhGA1rqCzppsEVGE2OGnWhjp6nz3yXhzOTemRaOprQyjh4H8AhQPcQL5ZSAwuxY4WQitYjF8DnL
 +RtykvWD6dQMNdCvgj740FMaG6vFDr6MtyIWP5e4DXz0Bm+EJjlMfn5dOyY5PciyN7ciGnOxy1p
 GYrHOkbjBcACbIehQo0PgLobrruwHCFZviN7dGZjt7INE5cU4EpXrYfGk1Q=
X-Received: by 2002:a53:ee45:0:b0:644:4eec:22a with SMTP id
 956f58d0204a3-64d070e70c5mr1224522d50.2.1772714907019; Thu, 05 Mar 2026
 04:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20260305113734.1309238-1-dev@lankhorst.se>
 <CAHijbEWKN8EY0uy73XR2RRh1ScgarZTLibu5ECR08OeqTje54Q@mail.gmail.com>
 <fbf457b5-cec0-41c6-bd04-55b5aabe23f6@lankhorst.se>
In-Reply-To: <fbf457b5-cec0-41c6-bd04-55b5aabe23f6@lankhorst.se>
From: Julian Orth <ju.orth@gmail.com>
Date: Thu, 5 Mar 2026 13:48:15 +0100
X-Gm-Features: AaiRm518_BUJv0RyHHbOkpmnKK1VfGy9VBLZeNjusPjqMBC-hTsbeyACk-nSYN0
Message-ID: <CAHijbEUeCHhqKwhcTDu9v5S7K5KHC2pcSELD3P3ttqQcf0pRvQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty
 stack"
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 05 Mar 2026 18:31:06 +0000
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
X-Rspamd-Queue-Id: EDD61216F9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.19 / 15.00];
	URIBL_BLACK(7.50)[lankhorst.se:email];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	FORGED_RECIPIENTS(0.00)[m:dev@lankhorst.se,m:intel-xe@lists.freedesktop.org,m:robdclark@chromium.org,m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_RCPT(0.00)[dri-devel];
	ARC_ALLOW(0.00)[google.com:s=arc-20240605:i=1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	NEURAL_SPAM(0.00)[0.936];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: add header
X-Spam: Yes

On Thu, Mar 5, 2026 at 1:45=E2=80=AFPM Maarten Lankhorst <dev@lankhorst.se>=
 wrote:
>
> Hey,
>
> Den 2026-03-05 kl. 12:48, skrev Julian Orth:
> > On Thu, Mar 5, 2026 at 12:37=E2=80=AFPM Maarten Lankhorst <dev@lankhors=
t.se> wrote:
> >>
> >> This reverts commit 2e3649e237237258a08d75afef96648dd2b379f7.
> >>
> >> The problem occurs when userspace is compiled against new headers
> >> with new members, but don't correctly initialise those new members.
> >>
> >> This is not a kernel problem, and should be fixed in userspace by
> >> correctly zero'ing all members.
> >
> > I don't mind it being reverted since userspace rust code is not
> > affected by this failure mode.
> >
> > However, if you're committed to the idea that this is a userspace
> > issue, then I think the correct solution would be to instead apply the
> > patch you suggested. It clarifies the intention of the code in my
> > opinion.
>
> Thanks for having a better understanding of the issue now. :)
> I will resend the original patch I mentioned later. I just wanted to get
> this revert in drm/drm-fixes before it reaches a rc kernel.
>
> Can I read your reply as an acked-by?

Yes.

>
> Kind regards,
> ~Maarten Lankhorst
>
> >>
> >> Cc: Rob Clark <robdclark@chromium.org>
> >> Cc: Julian Orth <ju.orth@gmail.com>
> >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Cc: Michel D=C3=A4nzer <michel.daenzer@mailbox.org>
> >> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> >> ---
> >>  drivers/gpu/drm/drm_syncobj.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_synco=
bj.c
> >> index 49eccb43ce63d..250734dee928e 100644
> >> --- a/drivers/gpu/drm/drm_syncobj.c
> >> +++ b/drivers/gpu/drm/drm_syncobj.c
> >> @@ -875,7 +875,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *=
dev, void *data,
> >>                 return drm_syncobj_export_sync_file(file_private, args=
->handle,
> >>                                                     point, &args->fd);
> >>
> >> -       if (point)
> >> +       if (args->point)
> >>                 return -EINVAL;
> >>
> >>         return drm_syncobj_handle_to_fd(file_private, args->handle,
> >> @@ -909,7 +909,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *=
dev, void *data,
> >>                                                           args->handle=
,
> >>                                                           point);
> >>
> >> -       if (point)
> >> +       if (args->point)
> >>                 return -EINVAL;
> >>
> >>         return drm_syncobj_fd_to_handle(file_private, args->fd,
> >> --
> >> 2.51.0
> >>
>
