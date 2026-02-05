Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPdFMbjuhGkU6wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 20:25:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B02F6D3F
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 20:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62AE10E00C;
	Thu,  5 Feb 2026 19:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="ch7LSuH/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BED10E00C;
 Thu,  5 Feb 2026 19:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770319536; x=1770924336; i=natalie.vock@gmx.de;
 bh=beF5a/uSDQzIZnYTXkD3T6gtUU2c+LZC8+g7B4Wadfs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ch7LSuH/9tJR+i/PKJ33WcfWxTCT6oisUI6UQa0aoyEDQkxNWujXeC1z6b8aVYhN
 Ag/lrGU3YjtK5kd0nmGWQdr76VDcAR3skLI+RqCGzpAAblTuOO5W5/QsEwmQ5OitH
 DiAARi+85O1sBMaOLXXLTkpakRaaozuM+QuhOpnc9NFl8j7/34Rrrf7sSKO15zujm
 aY2nVrC2nOOEH3BGg3I5EEgYXdeMUivsMZkEqIT7wNIWmr+cSjdNwvixG9Puyci2v
 2n5c+b0GHrF+T2hiTeVkb1S/BoU0DOoIaQefHn9VXgPu4jqP4uAJxNWvqhTHKCUrI
 HaHnqQjrgJpdtgJEVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.3] ([88.133.252.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOzSu-1wB76x2aOC-00UKYa; Thu, 05
 Feb 2026 20:25:36 +0100
Message-ID: <4c5c0981-fa21-4d8c-b5ed-45ebaf4d713f@gmx.de>
Date: Thu, 5 Feb 2026 20:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Accelerator/GPU top
To: Alex Deucher <alexdeucher@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Francis <David.Francis@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <CADnq5_MTX8CifP25UvE5kdMbCYxgK+A+KGdd-_Ef1m4VYv+WRQ@mail.gmail.com>
Content-Language: en-US
From: Natalie Vock <natalie.vock@gmx.de>
In-Reply-To: <CADnq5_MTX8CifP25UvE5kdMbCYxgK+A+KGdd-_Ef1m4VYv+WRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8nmm5WmwzVEBHXphmHk1bSf6rWJut5B350cT322b32Up6bjOmDG
 z/Y7mNuwTsJjY2CjVSs9teOINEKPU4rD8yac9ahDMTVzVZx+8wKuex1um/LLckYxOV9TCfv
 9AgMhSfi8wqbYMcCJ7kcsverTufeKfoaZ/LOafAj2+6fErwI2C9wAec5VNCVHS/sHMBHHaL
 nku8RK3W7rYMZ1o95vV1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qCsd5KN+Eys=;UrIwE6xlGYekESZh/VFjmD4SBmg
 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
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,ffwll.ch];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: 24B02F6D3F
X-Rspamd-Action: no action

On 2/5/26 19:58, Alex Deucher wrote:
> Has anyone given any thought on how to support something like top for
> accelerators or GPUs?

top for accelerators/GPUs kind of exists already, see [1] or [2].
Clearly, this problem has some kind of solution (looking through the=20
code, it seems like they check every fd if it has a DRM fdinfo file=20
associated (which is indeed not particularly efficient)).

Maybe it's worth asking the authors of the respective tools for their=20
opinions here?

Natalie

[1] https://github.com/Umio-Yasuno/amdgpu_top
[2] https://github.com/Syllo/nvtop
> We have fdinfo, but using fdinfo requires extra
> privileges (CAP_SYS_PTRACE) and there is not a particularly efficient
> way to even discover what processes are using the GPU.  There is the
> clients list in debugfs, but that is also admin only.  Tools like ps
> and top use /proc/<pid>/stat and statm.  Do you think there would be
> an appetite for something like /proc/<pid>/drm/stat, statm, etc.?
> This would duplicate much of what is in fdinfo, but would be available
> to regular users.
>=20
> Thanks,
>=20
> Alex

