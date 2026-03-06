Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN2eKD1qqmlORAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:46:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A521BCB8
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DE610E0F0;
	Fri,  6 Mar 2026 05:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LAmke10L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com
 [74.125.224.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF80E10E35D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 05:46:33 +0000 (UTC)
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-64ae222d87dso8063235d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 21:46:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772775992; cv=none;
 d=google.com; s=arc-20240605;
 b=VSq9NP0bmID91dvZ/GmEtC0oU+Yy1j1fy2z/1vLhgXfPhr1Sp3DHuqg0Nik6Wy89mp
 yfr7xIaVVlE3yVSNV6xUswzx7/VRTKdGQwcNH1gLDr1glM1dylnsxR0hzcYXDwkb7OFh
 sZetq+xqIGbHkWeaZsYcLoDHuRf28Q7l8vtGzg8T2kCS8b50poKuzS/xwrVny7Ly3GpF
 8DYhix9hVRoU9eed4HR07idNaPjFJYo9KHFlPKwCRcaVU29oD3r3gl8W1A2PGrlmJ0eY
 +npZam+6Oa3KzPV8O7Kpwzf/A6AGHcMRavs1Yu8jmXZhxZXnqNhftpd4tP2NB3GVZTBU
 RQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gySPSmwSpyr/gGsudI7ZuhMGELf9TNwJtCU3S8Eju9Q=;
 fh=/6ztQegWvUfWRL30YUuchdQZMS6wDwXkTuE1heGE030=;
 b=LzVBUg1TQolneJbTGkE8GiGHwXsbdXZ9kSs6z0c9JePzVn9C+FrcS3RRvOaPT/1PHC
 s8S324CgXeShBpD+O7upXqTkzlsBDGO2xDsBaAotL9c58iLXkdWFZWZMINIbzznCwe0i
 AUqNoO90P5GuKKHevOEgmdJYEqFm+Ra+iEkuRNG8oj/tbHotoyBKtcMhV/yPZso5dMzJ
 OaJ+2lAQNvoGgZKq0EYNwBPbKHUOTWd4KkOXvn6xkHr7AkX2KjkZ0baS4xt2uVfi3QFM
 cti5ALucsw1krvNQp+eMEUbiUUDYPONk2uZMbKaNjDYS4r83h66Le9cl9YJEq9v2Des9
 dJEQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772775992; x=1773380792; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gySPSmwSpyr/gGsudI7ZuhMGELf9TNwJtCU3S8Eju9Q=;
 b=LAmke10Lqo0xtdbzuw45IGXQ7kZCXCXHhYCE8o5NpClnQ//eyfxNXdSJru2t7VOmJ7
 IQOZCnTJD2tbxwsyi2WrWf5dY/Gx6nngk5GbdxM37DIRDvxJyK2fOVwTRQl41/hUS8O9
 B7+BJ3M4dGJo+9mN1HqYQktEP27iL4neoORoL/TUqawuXPiEqUJK66GW5EyuIOZXZ4mI
 z9NRvJ7XaVnDxlqnUwWyVHhU3fY0shimNbTM5XC5gYo+/vc3ythWQgPOQ0cJZihGhUvM
 zew8RBc6SLnLckja7wlKHlsFWkskvvUsaJsJNa3JGbaKk23usiTd6Bpg6yZO6bNWucV4
 nPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772775992; x=1773380792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gySPSmwSpyr/gGsudI7ZuhMGELf9TNwJtCU3S8Eju9Q=;
 b=ZLnwg3JP6SjjaMP8Yjk4EUqXhiI4nAGsUjNXHYeWPNTFwL1783FCnRbFL4ZHV0GyRO
 oc5nU5V7zpIBzunl60K/tFcYVNl4tLIwWy69iGMKbs5sYh+7+rKWbyomUdPVz7NQeE+1
 7LpQPD5UCS2ZGB223xp6j3SQHzkv+aPcmMdye1wHjsSm9WjIwrdBrXeexKApvv8xhOUa
 dF9MqdaMbesEbFCHeaFCwTivh9wvOc5YAEaPJhOOm+Ql5nMk5sZNHpX/xm80JdRXbq0k
 tMKQj04CTSuT/vMggeMr1XQ/RbrYPDVzk/nzh2k9bN7A/oElYm2sC3dAOoywAa7bSg1z
 YbOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxu9UOXrdAOcPnoKp1D7qC3IhMvpHWlaEr2w+J/wKBUEcBvWiSfIJdf7bk4NZu3ESjdNO3/JYTEGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvtyNQufaWW+Mgn8mAvyMdLZjcf/6WSbIrsW9MF/tla33wNdSZ
 4utZHz/COIh+6M3BB6LbTqbHpPQmSU9AFiyonXQPDytZbZqzItZIUbFZBbMdAi+PL4sBhcwWokS
 H5tCj8fvdG0vmMusAbXOu5uWzH0Qcy/iReRfWaBg=
X-Gm-Gg: ATEYQzz6mcSEka5qqjuaDfGgAW1D3o2qVReZhUXGTIx5FGvG8a7XzI4rAWGHEbBaC3y
 niuhlOlj9J+MR6XYliBy6/M2f9IQ/NqQ2OWS8EJPgKFYJlOMa8Pj9jL4Ue6C3ePWWpEV5gTvZEa
 J92UcllP2S5pxiNNUR3uos3tjkhdBm/1U6bYOlivf6CI7alLDSWcMjj2DCEuyP5bG2LN3q/XxaQ
 5dm8mfRstOAVCidLJmqi65STHD57S8Q9FXgs3vBScyBHh27xoxN/8GcOVAXnKmD0kinwHifOXb+
 HW4AhAo/DJ9HZJi4INViaZngr9D/48R2GAL53wmORrlREbZ1JBqwkgBjnep1Cm/0/exiHQO0
X-Received: by 2002:a05:690e:e11:b0:64c:9af7:6f42 with SMTP id
 956f58d0204a3-64d1406eb11mr825686d50.7.1772775992454; Thu, 05 Mar 2026
 21:46:32 -0800 (PST)
MIME-Version: 1.0
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <20260305230948.679-1-hdanton@sina.com>
In-Reply-To: <20260305230948.679-1-hdanton@sina.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 5 Mar 2026 21:46:21 -0800
X-Gm-Features: AaiRm52M38enSoQxpr3rvVDWJo4N9JWznrpB91YzTCfq16i8XIPMihDOEZCRuS8
Message-ID: <CAPaKu7RBw9mzvQVznX7UWhMTXLVU+tcaOVHtNP2FmoT5-D+daA@mail.gmail.com>
Subject: Re: drm_sched run_job and scheduling latency
To: Hillf Danton <hdanton@sina.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 DRI <dri-devel@lists.freedesktop.org>, 
 intel-xe@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 LKML <linux-kernel@vger.kernel.org>
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
X-Rspamd-Queue-Id: 069A521BCB8
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
	FORGED_RECIPIENTS(0.00)[m:hdanton@sina.com,m:matthew.brost@intel.com,m:intel-xe@lists.freedesktop.org,m:dakr@kernel.org,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[olvaffe@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 3:10=E2=80=AFPM Hillf Danton <hdanton@sina.com> wrot=
e:
>
> On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> > Hi,
> >
> > Our system compositor (surfaceflinger on android) submits gpu jobs
> > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> > to run_job can sometimes cause frame misses. We are seeing this on
> > panthor and xe, but the issue should be common to all drm_sched users.
> >
> > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> > meet future android requirements). It seems either workqueue needs to
> > gain RT support, or drm_sched needs to support kthread_worker.
> >
> As RT means (in general) to some extent that the game of eevdf is played =
in
> __userspace__, but you are not PeterZ, so any issue like frame miss is
> understandably expected.
> Who made the workqueue worker a victim if the CPU cycles are not tight?
> Who is the new victim of a RT kthread worker?
> As RT is not free, what did you pay for it, given fewer RT success on mar=
ket?
That is a deliberate decision for android, that avoiding frame misses
is a top priority.

Also, I think most drm drivers already signal their fences from irq
handlers or rt threads for a similar reason. And the reasoning applies
to submissions as well.
