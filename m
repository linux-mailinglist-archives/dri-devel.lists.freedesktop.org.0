Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OQzKvewqGkzwgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:23:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD07E208793
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFF010EABE;
	Wed,  4 Mar 2026 22:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BdkV6JO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B59A10EABE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 22:23:46 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-660be63279bso2844627a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 14:23:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772663025; cv=none;
 d=google.com; s=arc-20240605;
 b=ceMJZZOA2FAEleOp9MpZWxk5aZDl1Hm3I2v5NNn1PsH6VNjLcMRWbpHkKycdgtzwlV
 cWYYF31Iqw37eG9eamoq2FW7ulKJU6PF+ioVlkBVozIJEWrIHH3biATdgUydnH7fMndm
 xD7eFKomIgt6PxyJtBeQjlYWWdV5edUctacn4i+6UdV+JDnEQUnTg3QX0i3+6okVkIhq
 VRDeZbaWWjRcnmptaT9ds9i0ATiY4bbUEfjoa1PY6UcpYmV0ImF1KoajAS1UzijDhVcI
 j57mf9KsjmllQ4Uxe7b+O9WmmT30RfDLXJw1owaiNhq1ZZMZe/YNaUmyQYBSGInczinA
 Cp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6SzQXrMu6157NmI8m7MFrfeo16+um+qkfnMEtnr1Qaw=;
 fh=QWUD6+a55dyLu+snuwZ6mF4jNbzdw/2zTqdOxadlM+E=;
 b=RN1bZEyrFUGpZgi6gHPEPDfE8FP4Lfp/LgQU6hVcXmXalyJIC7LaQQmo4BqUQ4GXx4
 5mkASRApHfHZF1gaR56jXenlPWrOFLO503RHNOPiyKxTn1wCqInnqM1VbfFDMIcEjVy4
 /MkAkdYgJOgD5ayt7UcAclrInmEyeLjc3hH/jPp+CopsgBmRTRRjgapJB2gdgXDdNwfH
 UO5hYNQC0gFMvxIgqrz7d7eRVbbKnfKPlJ8xR/1/T8hxIRBVU1aHQFBPBX+gGhvocvxf
 i4cYA0ttPXQLFPd+zlv5lB5YVNZ3z/TmWGcA1QvKBOfC7K5ZhkJkEU9fG9LhrXAUm8A5
 lYAQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772663025; x=1773267825; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SzQXrMu6157NmI8m7MFrfeo16+um+qkfnMEtnr1Qaw=;
 b=BdkV6JO813tHrwVJo+H+mZ3cLVgAa6K9/rPNS/MBWnjw01NvLlMhsG6kQ50iiMvN3t
 RzZh4a9xT8SgR6TOhG7ji59BmwQwWYNcjG7An2+9DB9N5mRONfkyy4kMOqRSzpjHVILD
 UmtyoRS8NVpQAfZXK7Da1epVV45AxwTt8Dj4bZIqt3pWBSzZ6lXoC53Z2cZb7eS14NUK
 xwRsRYcG6USX5UX/mfX6sDkBRGAGTuyBOUq7ryLyUHegek9KLqtaTFQl+womrXA4Nx78
 DWSOYHxox65T5ZN/G/WYhg340I7WiB1rp0D8tPN+QCwmwut6XA9A6pznPkF0My7CsfUS
 5xVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772663025; x=1773267825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6SzQXrMu6157NmI8m7MFrfeo16+um+qkfnMEtnr1Qaw=;
 b=wrLK19ZJazMb0mYF4/ubTxbeoCEAwCXw/07rtG4URRAPlJUNaRgjrwkUxTOlBFNHhU
 Lq3yuklT5epk5EqNgOk41ypkbIzpTOIx/qLsU9DF2S+OjYq1exG7bdKpu4YUwtRSM9V/
 jNvE7fb8y8ltz2r5bqGTS+hsm9SGvXalPcbZsPRdlHFB6bl3psSsowKTUG1v22hu+DWb
 4ulVTia9nRR+u7PJAOSoiozVhTcZSHmi0M1ZTor+bi9jeDoP/4jjpGlvCn6yOrj4BmXT
 PCPMvMk8vR1H9LwkuBl9HIns7pOrBZYAhTZDjjV381TP8kIiC+qJUwChjrR3HitmJlwc
 cbYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2ycvoCiFDfw983Q6DvieqX1RibGvO1jbi/qFRjHuADDcVCGOCn3MGHOZ7fRJhi8Uf77z7/IEtCrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy75dJZk+3EdG0K5n3iOHzbyZxCK9KU3pd2umQep1XRTWU1VgoU
 O1x+OtG5tlro6tmgw5JJ/182k51e5AaZihqASNdXhFH+kow+lGAyRH+7VKR+h8n+iZ4HHjFDQDq
 uKwRVuoEYdMPGdJS/MYkOc/gakQhE60U=
X-Gm-Gg: ATEYQzxSFDHltFOM9uW0XF5txoONAdpCCf3DWY5BnAw62vsLNfnsiNG0B6P+00HAeDW
 DAAB+a59oHqFOdm+IFaMSRk0FGnNRgwBj7Dn6xm5MTt8m5LeQyw6NLnbojFqxr0H527BqYylvuw
 TbOC8bFZGDDQCd4ZrPkq6cGfxy6MY/cghDue4yBnla+TwQbpZN5cCP6AMFjaMiryS+V3H6ihAHw
 uEiHvouuwrkH6Y+OjSfK9PF3RiBNBXLdPSDiUDZIwPoNwyxG6ogtZSFVuLOyB3RL9urIX5b6C5b
 wKJg2QAYyJ6tQkoaamBaqQb0yyr76WD7N3DdG4ezr37JpnTEhlv5oYUo6kCnpu/qJmXfVghBVbD
 bg++mCA==
X-Received: by 2002:a17:907:971a:b0:b90:77bb:5aa3 with SMTP id
 a640c23a62f3a-b9409d99535mr11282366b.16.1772663024812; Wed, 04 Mar 2026
 14:23:44 -0800 (PST)
MIME-Version: 1.0
References: <20260228045356.3561-1-rosenp@gmail.com>
 <2596902.XAFRqVoOGU@timur-hyperion>
 <4d00945c-f439-4460-9f8b-12e7e498fb20@amd.com>
 <5828571.IbC2pHGDlb@timur-hyperion>
In-Reply-To: <5828571.IbC2pHGDlb@timur-hyperion>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 4 Mar 2026 14:23:33 -0800
X-Gm-Features: AaiRm52dSio9iCYsE9GD2Rplzjp2tDUV5pP5zcsLpbimyZ1W4JLCk1ijysOQt9o
Message-ID: <CAKxU2N9MHp+m3A0w38pfGEJUkLKCCsLgvmgAG3sfSn-Rhc0sgA@mail.gmail.com>
Subject: Re: [PATCHv2 for 6.112 and 6.6 0/2] amdgpu: fix panic on old GPUs
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Alex Hung <alex.hung@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 "chr[]" <chris@rudorff.com>, Sasha Levin <sashal@kernel.org>,
 Wentao Liang <vulab@iscas.ac.cn>, 
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>, 
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
X-Rspamd-Queue-Id: CD07E208793
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:christian.koenig@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:alex.hung@amd.com,m:gregkh@linuxfoundation.org,m:lijo.lazar@amd.com,m:chris@rudorff.com,m:sashal@kernel.org,m:vulab@iscas.ac.cn,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linuxfoundation.org,rudorff.com,kernel.org,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 4:44=E2=80=AFAM Timur Krist=C3=B3f <timur.kristof@gm=
ail.com> wrote:
>
> On Wednesday, March 4, 2026 11:06:53=E2=80=AFAM Central European Standard=
 Time
> Christian K=C3=B6nig wrote:
> > >
> > > Hi Everyone,
> > >
> > > The patches actually come from a branch of mine:
> > > https://gitlab.freedesktop.org/Venemo/linux/-/commits/v6.12.74_si_dc_=
fixes
> > >
> > > For context:
> > >
> > > The crash comes from a patch that I wrote for 6.18 that fixes some is=
sues
> > > on the default, non-DC code path, that was backported to stable kerne=
ls.
> > > DC was not the default code path before Linux 6.19, so I didn't mark =
the
> > > patches that also fix DC for backporting, because I had assumed nobod=
y
> > > uses the DC code path on these kernel versions.
The DC code path just works bettter. So what if suspend is broken. I
would much rather a working system. Hyprsunset for example doesn't
work without DC. No idea why.

Speaking of suspend, the fixes for it are fairly trivial to backport
to 6.12 as well.
> > >
> > > After a user reported to me that this causes issues for him with DC o=
n
> > > 6.17
> > > and older kernels,
That was me.
> > > I sent a backported series to Greg and Sasha, in an
> > > email thread with the subject line "Fixing an amdgpu crash caused by =
a
> > > backported patch". The fixes were backported to 6.17 then.
> > >
> > > I assumed that the stable maintainers would backport the fixes to all
> > > older
> > > kernels that were also affected, but Rosen brought it to my attention=
 that
> > > it didn't happen. So I made the backports in the above branch. Rosen =
then
> > > decided to send them to the mailing list.
> > >
> > > > Hope that helps clear up the situation.
> >
>
> Hi Christian,
>
> > In theory Harry an Leo should take care of stuff like this
>
> I don't blame them for this. It is my fault for breaking it in the first =
place,
> and I didn't think there was any interest in using DC on older kernels.
>
> > pretty much everybody is overworked.
>
> Yeah. We all are.
>
> >
> > In that case guys feel free to go ahead and ping the stable maintainers=
 that
> > something is missing.
> >
> > Just make sure that when a patch passes through your hands that you add=
 a
> > Signed-off-by tag.
>
> Thanks! Probably I should have sent the patches myself, then they already
> would have had all the necessary tags. Sorry for the confusion.
>
> Now that the situation is cleared up, is there anything else we need to d=
o for
> these two patches here?
Speaking of which, it's probably best to take over here. It's not fun
dealing with stable. I also didn't author these patches.
>
> Best regards,
> Timur
>
>
>
