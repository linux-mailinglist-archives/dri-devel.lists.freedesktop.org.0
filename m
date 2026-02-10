Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAx6IkyEi2neVAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 20:17:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3811E927
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 20:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9C910E04E;
	Tue, 10 Feb 2026 19:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W/8Auz55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D566910E079
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 19:17:28 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-124b07e5fe4so450966c88.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 11:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770751048; cv=none;
 d=google.com; s=arc-20240605;
 b=GzsG7yE04SKKEFYR74KvjtC8Q+9CRoOqNECmwchLrEBdNXj0bH+r0DMXlaeSTdj+Kd
 3KofbhL9O73yeFrWlzTvnXbFONywZZ3knUXGHAYTTAPVf57zICAad0g8JWW0yFx77lN0
 efKy9Xw7tW4WYAJG3YekARf7MtrLNfo2kFleRoKKXzGByCCh2hOLiG8ggHiwhwQceBb+
 NGMZhXJ3qpRViQ8auxDswQKYM1jgUPkcl6iLL6x62tUBaqagGEEU0kmmgd/KcZb1ccDu
 tf8+vAXm1q5vdWMRUNJEqb8+M5CF4NlppnHiQwbklVfge+IS2nvpyulfYRT9MQ0ed6YN
 7XXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qkTmjGRqOjouXcxynJDTcMNXeIorXeHUOIvClnb8AXo=;
 fh=JGnzKHDoUwBrOcgoaBIKmM/sigLfipKBU6wDOL4AqqI=;
 b=HqwFWHb6UX2eio5ne43qKdHP8gghidks3qtTNRrElWLTB7CuQnbf0GM6N3YVAY2vUj
 Lkz6CnhXN+3gWyNcid28s4EnWwpYoGMKd+nSQkqOWZ5vhzFPrEK4V9n8O3E0sqbcX8W9
 UT4LXbtTDLQthkupvKbVpJ5ChIRowLr3nIa/hg4f/SyQUhoBjQ7Sv/SNL09wCqCf0MC7
 48a/n9MGI8Yx4mELPrsg3mKyUtaoKvxbV02JF/NpulPWl1A8y3WJi/pisqWZwrZtEkhB
 z7mBrcyJQQ1j8bVfS/B67suywWswpEYnZ7W1soUf1j94b9OtytGOSlTg+qWUrkG1s9Gk
 qqhA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770751048; x=1771355848; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qkTmjGRqOjouXcxynJDTcMNXeIorXeHUOIvClnb8AXo=;
 b=W/8Auz55yKCaoz4FOl5ook2fi+A52GXtt/gTaZh4hnOC349C4hEG9ybNBSYMOrkTpK
 cZS0xWx5L57dfOUDLFYm4eHb1W7AdooVPVpmsj18YTzaci5a+ocZ7rMfb83O77V6fWQT
 8F05YEARiLy3wCRZLqSzjhqFcmSWr28brYcHmm54Q5PIZEXtdugKoIMc2G/sQzeeEd0U
 UwcS8sGEXSdyjLl6HaCOCSJtpbB/rDQ5jbNrLG26lCeFN/NVxWLPGuiB3MZQ1dkRysh2
 EgnMPuBIQggpA16GirJ75UTCzIilbSYGBaLB6FVGyJnEhUJdWosVUYmPsoT0nUFJmDhT
 NTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770751048; x=1771355848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qkTmjGRqOjouXcxynJDTcMNXeIorXeHUOIvClnb8AXo=;
 b=AesB2GkVtAKBmcCfWvZh8zeSwJPR2U8KN+BJfrUHWaL723bH6FAXmaWVN4fDUooWUw
 REK+ezHPuJRODqARQea23qkc7UA91rRmgmgRYQOvC5/tOkZYsCU3FTf6N3d/BBBtOve0
 U2gHD77gBZnX6/GfQgrrjy/3SADcuDlPkE8L8pMgR2VNnjUprHl0+c2zqR3D9NaNQn7f
 0+R0F6vbsfijcRsVzMwHLvbR39xMCCuUKkLb3Da5SfdzjDQjq6T7B9bEu7K98QRd6yHu
 8gvQFqYvPQK9sxBqsVY9qTl0HYvwTLmr8e3q6i2nl8jxJlnlJbYb03IFAd6hzeJ1xglB
 UlQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdJySfG0NyekLXUmOyrVha9Unb6Mb0WOD/9vZnMa04W37b9l317iOdy25TyDoHerNIxQtEVUc1M/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH3jsCYIHO0rBM7rxhJjODK5GrlY3vtXf1WKMGeCEV1Xqljc9x
 K7L22BbSzBjMCE5zneTOiSLP0yawOzDbSiTD9+UmakLqUBVHBtD8wS2eh5eLyxEDbZ4JlbCt0pu
 hTWYR+3sAFvmaDmA/kLrR7PrHPc8irbE=
X-Gm-Gg: AZuq6aKZnYUbjfhdFmCclPRMSt38TNH6aM9ZuowHPpWfweifSk0eqxLISTLkoFboc+u
 koaTT8iFYB/SsBcY0DqzxNZNQeGrdNaYoy+AT9SClIQoygC8tq0Z4r9GnSAIoQYJ0+r9FqKdFgZ
 wTkYdEFsDutoCX/ABtFVUMfLn6oxl7XrnIt6Spr1O1hi0jG2ZujcjnDi4HiWdQj6+1/xbeqWwJ7
 AAXmRiZRIKFaCUVge7yEv6sQQTwbjbzhgvenskD22bx8gVD9dZKlFSc0QAYKU3b2bWt1JKO9U9m
 02AHTQ5O
X-Received: by 2002:a05:7022:a92:b0:11e:3e9:3e98 with SMTP id
 a92af1059eb24-1272494f67dmr620116c88.7.1770751047940; Tue, 10 Feb 2026
 11:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-17-tomasz.pakula.oficjalny@gmail.com>
 <f19af3c6-f865-4758-8c50-aba40ec1cf68@amd.com>
 <79264ab170e48e1372b3b847d75f4635dcc57aa6.camel@gmail.com>
 <CADnq5_PhcNPU=4s1P30OqbWY7qPD3dHmjEtoz4_Md41u=xaxFw@mail.gmail.com>
 <1002281ca27d58a47a47fb655a88637e49776706.camel@gmail.com>
In-Reply-To: <1002281ca27d58a47a47fb655a88637e49776706.camel@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Feb 2026 14:17:15 -0500
X-Gm-Features: AZwV_QgJB6v1nKXY2CnqRwBQYAE-sHXcGFH7dydSUxWcivhgCfgEW1B0ZDDvrLE
Message-ID: <CADnq5_Nrni6_Y7BCn9GH-aF2A1iOjgbr4Ebouf76Qogtb_v3zQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/19] drm/amd/display: Add parameter to control ALLM
 behavior
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, alexander.deucher@amd.com,
 sunpeng.li@amd.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, bernhard.berger@gmail.com, 
 michel.daenzer@mailbox.org, daniel@fooishbar.org, admin@ptr1337.dev
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomasz.pakula.oficjalny@gmail.com,m:harry.wentland@amd.com,m:alexander.deucher@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 00C3811E927
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 1:44=E2=80=AFPM Tomasz Paku=C5=82a
<tomasz.pakula.oficjalny@gmail.com> wrote:
>
> On Fri, 2026-02-06 at 17:04 -0500, Alex Deucher wrote:
> >
> > Also, maybe a per connector kms property would be preferable.  Then
> > you could change it per display.
> >
> > Alex
>
> I've dealt with all Harry's comments but wanted to make sure I
> understand properly. Do you mean, that the two settings should be a
> connector property like VRR_ENABLED? I understand the intent and I think
> in some time, it would be best to have these exposed in compositor
> settings but how would a user control this until then?
>
> Would it suffice to fire IOCTLs from a third-party tool like LACT where
> support for this could be added in a short time?
>
> I made it a module property in the first place, because I thought such
> settings are pretty set-and-forget and module properties are just easy
> to set :)
>
> Still, I think the defaults are sane. If I have to spend some more time
> to get the connector properties working, I could send the patches with
> the module properties ripped out for now.

My understanding is that these are something the compositor would like
to manage.  I'd like to avoid adding module parameters if we can help
it because they usually cause more trouble than they help due to
unforeseen interactions with other features or "conventional wisdom"
blindly followed which leads to a bad user experience.

Alex
