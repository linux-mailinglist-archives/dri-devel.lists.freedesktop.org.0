Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N55KolImWklSgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 06:54:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B2D16C39D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 06:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AD710E122;
	Sat, 21 Feb 2026 05:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hlViucer";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D396110E122
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 05:54:14 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-65a2fea1a1eso6103684a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 21:54:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771653253; cv=none;
 d=google.com; s=arc-20240605;
 b=hmrUHKENAz4wYyk2+wpdvxcQQb5uisTnt+asiVMNc90/8h8tHb0ws5kKZbX2JGjcgm
 QTHV/wXZ0+WTTlYPswRqcaPE0SRQVk5/aQQiznZt0sEhdFDz5CPJAqYA90FWYL5ltiio
 FyeEvpD+zqvyLoiszAgpvIrnxU6VXg5kol46VBrspeYRKbeROgjBN5Q4YZCnKTJrqeE7
 NYiOBLj+k0G+43mSKFuTcFRVMZag0ocV2FKfXVOQMmYGGUnC0jf23TkJtaj2cnh2PswX
 D7dawn8tWJ2Q4WDDkDgOwB1v5j2ZlM+XTr/jb+vks4J/cLxB5tvI1UbLqNyWYyhFhSGq
 SDIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+tgY/mGK3l60LP3OprA602wtr51m0b3f7apbXmR/PtQ=;
 fh=BuIq5nVURTQoKlMsUlshzRGw7yaU9LHEL/jVTWBFLWQ=;
 b=X3xZEPvy7fasCZmZvBeIVcvc/VSizocNZgnImX86wFhsZpVkr3YVGsjUcV7dYvIpEB
 34Pa6Hghg+RFdYmVhFkK0+pK9KnyiRRRIDb0WVyGaafI5P06tgfyt75wYaKVpB/cPwdc
 BvYqVAjxB1gh4ZUJq8FC4qb3QIr6D+CIF0oMii0ipdek6AEmC2R72HiYGb9GbJ0GeSGh
 3THJzFHfnp89WCzJOoEs9BdulIe0sXPd0+u0LyWsHOst9yvf6b6Xzn1menWkMzZEfHH7
 NF0SKjvO0XB3DyDOTYOMJjx3lDjACK01JPTMoRwof94aBoEpTQ8+tVh/57n9QH/6BPRF
 vN7A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771653253; x=1772258053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+tgY/mGK3l60LP3OprA602wtr51m0b3f7apbXmR/PtQ=;
 b=hlViucerc0uSByJ3zYHnh701eKX1M8CB/pdL8drrX71B+IYIndKuMzbA0QgHqhU28n
 MYYRSIr76F+QVsyz4N/AcfhctuceUwoj5GMEtnMquOPpqpnUrnMuHfR1zrI/p9LbFnTw
 xzeKmHMG+DG7it8ztLPY4QvQ4g+mB9asT0T1n+D5k79EusK/C2k/Ns1dyLT0HX4gmjUF
 3gLq8FZCZAaY3R6m8EaAUZGCAEZCMg/sYttl/aieEG6q9AsJEnTysvdOhzniIsuASGj7
 iYzeMEapPuP0OR9EdrPp5X2qJ3vMPDPQfj0IxhuWax5ct7CklLmfMBVn8aRnr9GycFYN
 jvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771653253; x=1772258053;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+tgY/mGK3l60LP3OprA602wtr51m0b3f7apbXmR/PtQ=;
 b=KQ0w2ci+xhR2LtQuA2w5/+SXFKSQxYr7LFiVlh7VKBEEQIK3glwx1c9N0o2PS1EkR6
 8Wx8qtxRhQUa7em6okMLmUJdhFzPX4gEbJKsV/SYpH3wgV4wJ2eZC2CxB1O2LdJWFKit
 TjcYz5THOWA7EJNCo0EKrILc/vUpuTFZO3h6cb17xr5VRdmvOWXGpGLenneHZnArSzJz
 NLFhAKqptDBadexb5p9HpG73/0tWdisSvD1GCJv8IVjoZw941TnTiXLYPRHWjzxU8m8i
 acE0nRO0N3LZmOI9iS9RPtfcmsL+tWtl63BriZmMEdbY1WliqdNmYogmALWy+WgMTwZY
 P0Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqV6Kw9feTAOotWpvMSy8vR87I49uqcYl68Ys6Q4h+GwxKsK7FgowWtpt+YAPoQjGIj8LYajG3beM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyn/EhJRSBjQVlTw4TKU4/tYyvPD7OQCVrDxEarhYkgARTe7YJ4
 yPhTEUndxixrDPGOz+/wuGZptuPc8FZb9jS67YORcotR5o7ETtSbTdwM7nGEFX9L0ZMsfFef19l
 afQG7a1gz2vAZCSSwtDTwA5EatDh0Tt4=
X-Gm-Gg: AZuq6aK8UpaQK1GBXV94w6X+pvlWdBE9oDIb/sxaFA8+UXowmRFAqvFAwMtwuUNxIi9
 fdQ/7NEGXRJv3XP+YMWoC7JYxOrZrjGo2gG/D4Prw3dnj5XXenbNmm3DzANmYNRq1XPWzsD1iPm
 /rDnzvrlWO3gkMm+zr0rpiROKumPgfy0J0ZX/q9KVGij0yf9mNz0BMAwBYZLK58qMP8AYp9/KEe
 l7530JDKxI7kxDO75p5M5J/zRq8nmbTlAOORmwt/7W2MXxkn2667SWVJEUgXVlGLmKOOUOLqUsQ
 YaWosjaWyjt814CaBqEMMugJLwk5pyNFY2J3OiOv9AsU/SYXIGcR67dLty+VjTNRHKC1m2Coh3t
 H7JnnfQ==
X-Received: by 2002:a17:907:728e:b0:b8a:e013:9c5b with SMTP id
 a640c23a62f3a-b9080ec254fmr125502166b.4.1771653253038; Fri, 20 Feb 2026
 21:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20260221034402.69537-1-rosenp@gmail.com>
 <20260221034402.69537-2-rosenp@gmail.com>
 <2026022132-gem-stylishly-2c49@gregkh>
In-Reply-To: <2026022132-gem-stylishly-2c49@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Feb 2026 21:54:02 -0800
X-Gm-Features: AaiRm51WLD1sxY9MNhXBFSAsYS9PctRSAkLeekgnCI2YpU7VawQg_l6hW2FQy2s
Message-ID: <CAKxU2N8g+BRzyZ=5dWjrL3Eb4zRz-_yfv29tfJL2uvJpZWZUcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "drm/amd/pm: Disable MCLK switching on SI at
 high pixel clocks"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Kenneth Feng <kenneth.feng@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 "open list:AMD POWERPLAY AND SWSMU" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:stable@vger.kernel.org,m:kenneth.feng@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linuxfoundation.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 16B2D16C39D
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 9:40=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Feb 20, 2026 at 07:44:01PM -0800, Rosen Penev wrote:
> > This reverts commit d033e8cf4e8f6395102cdbc3cb00dc7cb9542f53.
>
> Why?  You need to explain why you do something, not just what you are
> doing.
Not sure how to specify that it's a requirement for the second patch
so that git revert works without problems.
>
> And this is a 6.12.59 commit, explain, in detail why you aren't wanting
> it reverted anywhere else INCLUDING upstream.
>
> thanks,
>
> greg k-h
