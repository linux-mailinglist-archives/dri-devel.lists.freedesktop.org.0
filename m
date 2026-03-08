Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLklLcVyrWlq3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 13:59:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B30F230518
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 13:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9E610E060;
	Sun,  8 Mar 2026 12:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SdSvCNSF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3225E10E060
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 12:59:45 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-439b7a87fb5so4558290f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772974784; x=1773579584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pCcvTZODN6sqyoYdkdvVRxc4wALvjVCgUO6jSwYiCpc=;
 b=SdSvCNSF5HGbmIbCZrjV+nwxT6tVijagxjQxR0yglPgMDd1ld5kMTerHpV077gwPOK
 B+CAi/ePiknVvI4XqaDlsrC8l89IBjmSUmfdXFzP1NzIoKtqLUAFpB4rjhZvsg1Iaj4H
 RZsGD/FSUrDFEpFeV5bL9xEGNQvtYk1jeMz4pUD2uERxnzOCnP4iYEeSvR7h9O83aGE5
 TtlR5xmthFgMnSIzsMOY4woawZ4wquKMYFDmF0lgjCtpJat72AZhxifr3xsWEAdPCwc3
 hcRGc67WmTWYxzVy6ATX23FPruYu8LqdjtmSmjB+SXRVNmNoNHQ8OPcG3dpRxJ7705EY
 UsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772974784; x=1773579584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pCcvTZODN6sqyoYdkdvVRxc4wALvjVCgUO6jSwYiCpc=;
 b=rIdG1epjSq8KLBbhwQJMgvuJDHi8V/VCe03L2YvKor982DsHA2rpoAPhbVT/JhCi0U
 d6UYq28UA4FOMoQO/kfthbqb/xp374uCCKidtMPERivXfjtweARch4wt3NRfBOxSSkF7
 MeNibWCmjTv38OWMH+GtdZYXHWOSPKeJ/i3Xeu4w3Qw1IU3IQFKgZlQn8satzMIHfF+l
 x41TdTb51HlFYTQvWRvqr37tZp2BoCtZhP3bvJY/RLriay1OQSWtb4zrOEBWQo77nxVZ
 hQHrzvfr1wCoNXOnip35Ao++WNX+U70Ralp2GJ0X/zizcy3cU0fGuNPhhVUS7pUCyrW1
 V++w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr54mgrU1NZCnkraCGXTUSyfJfRrZIA2RHygw2hhYtQvmNxtRHMgXqIGlBqx5JsWF4xPsC43xXD6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxjx/i39eG0LbORygZnkiilpX3QnmHFP8RZHZx54HxnrPOMYg62
 AB16JooMxaWhi1bKsnbD6xVA5DgP5y1018uYcGVM3vrGrrGxnfVeIGnq
X-Gm-Gg: ATEYQzyQMNaHz6wWN1zM0InlUimx8YDmAro/C4f8b8yxcggsbl5YqlfbVsMCfsmRJzy
 h1bd6YCC1PoVB2LhO8pA+Kk6ji97gVZzXENI4sOfp1exVvwJhGoFFuQN0yUf/xvuCGMU81smNPp
 Q1V3v1qKSbxpnfwhmg128RcYeKOM1AAbUTyq3mfkjrJLfu0lijOUUlyiuyVKrnUCai/KXxUvdBP
 z6XQ1pWG7pKecthrFWjD0Ecznznig4F+c8P45E6eNIuET8GYOmw3GkILSSZJs9jJHle9j39XqdX
 I/ETm3TMBKgcjZCHBQe90iWCr3fUi9ZtgprGFNlFD+N+cIeKCFIdHrrh6eUfYwGjmKZ6eDuGKuW
 2Rlnlf66Qkp/w86eD1YW1WZNfHK+vFZDqiqV/277GgpfAfyuX7smGtmppQfX9K0O+ymX27yzwz1
 kM2SAJ9c/q1q6FHpJGkZbOtzczKxDtER9BxSaqP0UszL+ns/ati0KOQ0YR+w47/G+Q2MQnKwbMk
 j/31nINFMk=
X-Received: by 2002:a05:6000:2911:b0:439:beee:43aa with SMTP id
 ffacd0b85a97d-439da351b41mr14651067f8f.16.1772974783363; 
 Sun, 08 Mar 2026 05:59:43 -0700 (PDT)
Received: from timur-hyperion.localnet (5E1B97DE.dsl.pool.telekom.hu.
 [94.27.151.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8dbb3sm16332342f8f.4.2026.03.08.05.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 05:59:42 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: events@lists.x.org, xorg-devel@lists.x.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org,
 xorg@lists.freedesktop.org
Cc: Mark Filion <mark.filion@collabora.com>
Subject: Re: Reminder: Deadline to renew X.Org memberships for 2026 is March
 16.
Date: Sun, 08 Mar 2026 13:59:41 +0100
Message-ID: <5818436.IbC2pHGDlb@timur-hyperion>
In-Reply-To: <77e280436ec5b54973a11303dd0446e9f3ab2ba1.camel@collabora.com>
References: <0070f3dd-a521-40ee-b6e7-8b1f82e48b66@amd.com>
 <77e280436ec5b54973a11303dd0446e9f3ab2ba1.camel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Queue-Id: 1B30F230518
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:events@lists.x.org,m:xorg-devel@lists.x.org,m:wayland-devel@lists.freedesktop.org,m:mesa-dev@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:libre-soc-dev@lists.libre-soc.org,m:elections@x.org,m:members@x.org,m:xorg@lists.freedesktop.org,m:mark.filion@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[x.org:url,x.org:email]
X-Rspamd-Action: no action

Hi,

This seems to be not working. I am not getting the confirmation email (yes,=
 I=20
checked the spam folder and it isn't there either).

Is this a known issue?

Thanks,
Tim

On Wednesday, March 4, 2026 5:12:37=E2=80=AFPM Central European Standard Ti=
me Mark=20
=46ilion wrote:
> Hi everyone,
>=20
> Just a friendly reminder that the deadline to renew X.Org memberships
> for 2026 is March 16.
>=20
> Membership renewal ensures you maintain your voting rights in the
> upcoming foundation elections, but also helps strengthen the foundation
> by giving it more credibility.
>=20
> https://members.x.org/
>=20
> Thank you for your continued support of the X.Org Foundation.
>=20
> Best,
>=20
> Mark
>=20
> On Wed, 2026-02-04 at 16:22 -0500, Harry Wentland wrote:
> > Hi all,
> >=20
> > it's a new year and with that a new X.Org Board of Directors
> > election. Please take the time to log in to members.x.org
> > and renew your membership for the new period or sign up for
> > the first time.
> >=20
> > These board members' periods will end this year:
> > - Mark Filion
> > - Erik Faye-Lund
> > - Simon Ser
> > - Neal Gompa
> >=20
> > The election dates will be as follows:
> >     Nomination period Start: Mon February 9th
> >     Nomination period End: Mon March 9th
> >     Publication of Candidates & start of Candidate QA: Mon March 16th
> >     Deadline of X.Org membership application or renewal: Mon March
> > 16th
> >     Election Planned Start: Mon March 23rd
> >     Election Planned End: Mon April 13th
> >=20
> > If you have questions or encounter issues don't hesitate
> > to reach out the Elections Committee at elections@x.org.
> >=20
> > Best Regards,
> > Harry




