Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AABHCcR3hGk23AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 11:58:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0FEF18CE
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 11:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240CA10E10F;
	Thu,  5 Feb 2026 10:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a1QnteEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1F910E10F;
 Thu,  5 Feb 2026 10:58:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AD82543E16;
 Thu,  5 Feb 2026 10:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1F7C4CEF7;
 Thu,  5 Feb 2026 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770289086;
 bh=2mhGR53KWj8SmcJdwgB83Qri0SzSlGnIgc3bFpwdCcE=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=a1QnteEwPbwXYvoI7dJrXlNUEybHmWgN2djLYcVzMbqMeZLHe808HeUV9SBzw2Y8x
 cP5pkwH+D4qYAUi2E5DLy49JTUsld4pRSb0bq9vvBiPsAwgoiAPuQ4N3c75l4j/EWs
 RQshuYu0xYVGGhh+S2JdnLzUOozceMDNlr2tdaD/i+705Tt4tq308/Md5GHjguJFbV
 TywyCpDTnBko9SzKF4VYojsIyMhtzff/ZfXWy8DdvhfSbr+ChLe7vTtKN52rZJ4xUE
 k/VgvbLzFcyQuoKmbPhxsB73I9AOY70C4G3qDgvol5YXUASOYeYg+chew100q9DtdZ
 YxohHONlxVpYA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 11:58:03 +0100
Message-Id: <DG6Z3TV6WX2I.17RY4HGCSP6TD@kernel.org>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
Cc: "M Henning" <mhenning@darkrefraction.com>, "Karol Herbst"
 <kherbst@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Faith Ekstrand"
 <faith.ekstrand@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux> <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com>
 <Z9x0NLY6HHsvxOFD@pollux>
 <CAAgWFh1VzRnt9QdCR9xOVhar7vEYAGPBcMHfqXGq_QHm0A6H8Q@mail.gmail.com>
 <Z-VK8eeA_7BURiBy@cassiopeiae>
 <CAAgWFh1yGZkEi+Fr9htOp+iXJjLo6Q1B+rszKKAcxgw4Y0D1RQ@mail.gmail.com>
 <Z-aCVZYcEkxJHBle@pollux>
 <CAPM=9txDN8NtX2UFfo8KtkaqW_rgM7oE-nLC+XyaOEAS6sj-qg@mail.gmail.com>
In-Reply-To: <CAPM=9txDN8NtX2UFfo8KtkaqW_rgM7oE-nLC+XyaOEAS6sj-qg@mail.gmail.com>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8B0FEF18CE
X-Rspamd-Action: no action

On Thu Feb 5, 2026 at 1:43 AM CET, Dave Airlie wrote:
> I don't think we need to go through NVIF, or at least we could do it,
> but there is no gr object exposed through it now and adding a whole
> load of gr code to nvif would be a nightmare,

I mean, we can bypass it, but it would be yet another inconsistency. Though=
, I
do fully agree that there is not much value in adding the required code. An=
d
similar to the other thread, things have changed a bit and we may be able t=
o
afford being a bit more relaxed about those things.

> I'd rather we merged the kill nvif patches.

Maybe we should just do that?
