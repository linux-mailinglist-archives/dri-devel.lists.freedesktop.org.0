Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKHkBvZImWk+SgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 06:56:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A0F16C3B6
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 06:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BFD10E12D;
	Sat, 21 Feb 2026 05:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A1cMOCoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0CD10E12F
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 05:56:01 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8845cb5862so456082466b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 21:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771653360; cv=none;
 d=google.com; s=arc-20240605;
 b=XIulxt8eDscMo2UFGSzbmKy2Wtphu6LECTbgtEAIW4j/46fLz1p4VU3SKSjtKkGkCa
 8eclgsPrZnq/inSK9R8UNX1vpq+14UDOUOHDPUt4H37I2+n/3wh8TaMnPDSOXf+8p3rr
 NWqpQd8i3jkVse/eKOGrnoN/u1cLmSQAIHioHI15l+Isygps6PZqwPzNVMuNyPMwAzIi
 jMiHjDPQCsSHPbc6j/LZTOob0S3p20ELBFMI7Kb6KeeYO6LfO+71zpMSLBJ746go3XZR
 WkFUpD4dS5OtE1FsFukSsdAuSGHzdH1l+OVT5fx+pnQSDc4yMycjX5Y1ov2fGWUP4A31
 RB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ccv9mwt6mLX9xX+lxZglunKn+JwfoIDQEFEaLtcrLyQ=;
 fh=Z7O4r+lNe8Zwe+DFaR+JEgbJmf1BQoHWr/ddOqQphvk=;
 b=SQlwwwRpgLzuhXsJE8DLEJZ4MT0OSlkpP10Ttkye6n0OFd87WWXDSehK6aH7FFhigT
 Zlz/HFlwGFCZLY2vipK5ZKvw8u/d+2rKY5VTcdXybwArWgtvF4p0Lmt+XxV/dM0wjd7J
 AjDXYBTO9cCAcqzl/Nc7b53+qZc/861nDU4ofUXJMO7/hQL6vN68aq1cMXf25TfkeWxV
 dapcHZLmO06drZ8FGkPlLK+lO9hNmT3eVOe3fBqGnRQxv3z5UkjV2Rf7vQN0mHi8quR4
 eH+ol22/XA+2BWsitSFyfJRj2yV9K5rw/7r8DvAnNkQSzrQkOcgLE8gQQiy/t6d6CKAt
 N+7w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771653360; x=1772258160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ccv9mwt6mLX9xX+lxZglunKn+JwfoIDQEFEaLtcrLyQ=;
 b=A1cMOCoRjBnQsBmsQeR/sta1GgHoX5V7AV5+DHynhrx9By4p4p5T/8jyfUlc1lpCi9
 huiE85MBSarpYBcO59rkMM7YTviOo2EPyx4MT7svmLTFxT5Fp1e4naqAXvXYagi3qKsS
 T7yzvAVwU9R8nwESAG2rsB1uTv0Y3MmS2JC6nE0f5vHrEUd85JUdx+C0ID2HEdHGWWkO
 eGv6Be3WmutYTH9hjfbU691NDzM+xE5sYGzXil+CcWTLy1y5Smjo6Bf4qGOZryASAvcy
 U42WM3BlKtxxV6JazURouaLly7syrkU0X5I5nWzIwttClb8ZP2oIDu7bTg/Ey/z0xddq
 k66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771653360; x=1772258160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ccv9mwt6mLX9xX+lxZglunKn+JwfoIDQEFEaLtcrLyQ=;
 b=trVwZxltCrh+4Bn2CGMzUtE8KMwMokwkg/gVHaTeJL4nW2t4qBHPemi0wop7T2fjv9
 ys4Pa8UPezv4MuC7w5Yj8JKlv1YVgOPHa2TrDJ6/dEIAnifJDEhqHDZXjI5d34ep81rX
 bjvu5o3fErtfHwZjqIBNCuRu7GI7NXoH1tKVOoQUNFgPdXwdu8kf+NiSdE0jJGiohLS3
 znF8EhP5G3iP/Y7Q1GOj43Ys3xxdJjsCAwh0ZUfHR/WFWk8DUcFIJnDVsjFWoEB9KBD3
 dFmO4BknK+up70kPXu9A/z6CBCS+SMFF8UAwEn8Qw8WRQFh3Mr461xEY0d3/BaNJ+vee
 Ps3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvTlfM+Psgt1N7Xwlf2Nxyml2+Wmn4xR8d4b0YT8gWLFP/tHNlC6Km8i3Wz/NJASAerKO+Ff9A4kE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzjc2YXF57ksD84QxUFohLSC5XqGp4t524QzCqN6QsBYN5YMH8B
 xz/Qpow5z98eemsBbYj1nDrbqfgK8mk0rkq7SjnVfAALxQhDH8cZ+D1URJzOz7n4WTxzDexhMSe
 0UsJoajyjFr5QMoN9B1PMImcf2+aniRY=
X-Gm-Gg: AZuq6aI6wv6YMR2rEO4FoqOwHHbBmMZLqXQOoqsCsA5mSssGLZ6xmokwB+nJhjYGJ5B
 jcb7WYJt0zkB8Ve5YXYFiVBRxOvUCg8s2dMAvWVuoACilMZEdcz06BO8MzSPkhtexrTBSWeP9ct
 H0AxWKtjpvE4HgvaOWoDmlD+OynT/2NQO32YwdC+NX6qrso1yhkRzfGrdE4e13mu39nP9z2u5Au
 jEMgUsEZB4L7aur9E/1dwHenT7za5dmU8eRLTN/RBWbn4BFRM/HaoTZdk7chBof2xubbcd73njm
 AwMs7X5+Nwuwmk3V/oH7Pj4yLUs8xzkm/2R1EZYxbA5XwqJ/9+V7AXAp1JLIgQZCROXdl9JjyOv
 8qzyMZQ==
X-Received: by 2002:a17:906:fd85:b0:b86:f558:ecc0 with SMTP id
 a640c23a62f3a-b9081b4d0ecmr105154766b.29.1771653359889; Fri, 20 Feb 2026
 21:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20260221034402.69537-1-rosenp@gmail.com>
 <2026022126-calculate-matador-e7bd@gregkh>
In-Reply-To: <2026022126-calculate-matador-e7bd@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Feb 2026 21:55:48 -0800
X-Gm-Features: AaiRm52sd4wHVH4fvoty83VydXFtxyvYUG7iNjF0rTjocALxFyz7eMIIRUKgihM
Message-ID: <CAKxU2N_+88yrYYv6B+VMSkSgpVBBBFiHo1e_yXV6FWX-bLw9nQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] 6.12 and below: amdgpu: fix panic with SI and DC
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 71A0F16C3B6
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 9:41=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Feb 20, 2026 at 07:44:00PM -0800, Rosen Penev wrote:
> > The first commit is needed for the second one to be reverted cleanly.
> >
> > The second breaks DC support on my AMD 7750. Kernel panics and I get a
> > black screen on boot. With these two reverted, 6.12 is usable again.
> >
> > Tried to git cherry-pick the fixes but that proved to be difficult to
> > do cleanly.
> >
> > I see 6.6 also has these two commits.
> >
> > Not sure what the proper procedure is to request reverts on stable
> > kernels.
>
> Close, see my comments on the first patch.
OK. I'll wait a bit before resubmitting.
>
> thanks,
>
> greg k-h
