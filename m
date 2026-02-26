Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LetGFB+oGlgkQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 18:09:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA9F1ABD05
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 18:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E31110E091;
	Thu, 26 Feb 2026 17:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D0rrywSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800C710E091
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 17:09:30 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4398f8e2837so938389f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 09:09:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772125769; cv=none;
 d=google.com; s=arc-20240605;
 b=QhaedhnvhvFfdmKkxFnXVvUwU7ryJmxZgVJMxGB5qWolCZanmoSRMYr2jYbuXQKHY4
 0cCi2mTCoqU5ShVuRlFNMF9vCihW/z21dP/ngKlGV2Evr5m81Hz2XF7cDHlITYOrT9nC
 LcqQKEmWFlKGJMckUOtWL1oajU/PQghmlJrYwwcG5TIo9UlDnayL5F4xWzxrlTTR//MH
 eUnv4X3HXzF/LgaEkrcLXKTAHlQWUhifUEWEbMefVf/blPPcUy8fUlU2KFKM6GKQ/xgG
 o8TCkMJiZ72uxvzbKRzEYtSxFSjJHMtmRV/eW2wjsso3cw4h2dyrGFSSFqOkChpa2Fx/
 9xpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
 fh=DdbXAb3afKBeEdgBn/mfrOgJYw4a0IGgVVJ6oZLuAX8=;
 b=LFK6ZUr5HUR4Am3q/IU/5XcfkGEoZHOmHqWv1K4Lta1nycfe7L1taJv6X6qEL9S7KK
 gA50C7PwU+qFxspfz3z1deuPnxnQrg++xjA81FL+YGHx/8PqX6DCEnjXKJrJbttTnVUs
 DEKppzsx457ry0PrMIu+OuSEzVpWvsEfCLM+Rba97nhaCt3y0lzyUGBXeUpdL08HnqeB
 ZsL3SNt4R5NDnpcPrZguzo+t33wxDUCUido8G2s+bbNfajPVbjpQBbzsC0qXmguF4xU3
 b6qMmEMfhW6kqFSXyxVkZMl62F5OZCBRfDY0i/n0IkhFD+ih9mRZAmuMkz4DiBe1YHG1
 2cKg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772125769; x=1772730569; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
 b=D0rrywSfmncTqjSXLITMv8X2juIhcz0+JFBKAxVW61Kn6t5Ii8SrJYrPv/30W9fVGR
 z18asQUFjv70Ubi6chlJ+fwUJIr3Z5+CfnEXAPeYpGeY0o5E5pCz70jev9AePNvsU1Zx
 Wd6Ejzn986XXqJ1+h9XF9cvxVyTpBGfDMAUjbSjmz1pIK/JeKNSXz12+JgEDaC/HmLIO
 t0rFOU7lSn84Zkm396/TEyW2eSdSHssye/pJf+Bxx1BgwRnCf88Kx6yncNtZBpAMfJtA
 ly47ywmktP7nphzs6YCkagZwZS0dSpgjChawOh8XrSUIpNmank15faTkq2EMI7d1PBVy
 U6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772125769; x=1772730569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
 b=FQSp1prTA1Zrz3W2TojZn/dTXf/sHyNvZW5cmOMr9lhyMvXS4W4J4sFfILwgq0T2Zz
 6h1jP2jLH5qdSWvBoMhS/sJLj+Txet/1GvcW4mxhsDSdfQqjNbWPEXnQDPJuHmunfiyh
 O/ZwYdW5WPDwE387KqCmqKkKF0H8zgCN0FGqnMIFiEGc/bUXwPXmYXAQ/pfN7pECDtHF
 2PO/ofudH69dp2s5loD9z0F7ZMT5GVVwGZXlsuKFZ17gNKYPkqG6IxhFC+E3g1BGF3rh
 CksnvD096mjBbPi1X304CHNubmicEPkZDSbV/EpCD/o1BloY+nD4rdxhojlgz4dcDsfs
 sjJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWum4EUqkvMuJ8wQjkzKS2XoDxJ75yavF/JfzG6evp2sQ3ahdbuQ0FpJQe5xo/tJt9jO+iI649Vvkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+xto+aJDD68FhBKKMyu7cMc44XTrhmU+aw7L2lBlhEN+UGUCI
 B0rddIWBPy4HNA2SgYtPeZ7rhJLfsH9mb5l0bIw/NGLs47mEjsjn5/MsKwZ1UPvk8CfXo4AJYeH
 5zGBCAO1i5vkyWz28JwSOsV1eoKnzMaY=
X-Gm-Gg: ATEYQzxUoaULq07VHGyWRatUmC6OXY8f5huY+6/5jNwfuXx6nb1CaA38brXwTx6U2Nf
 J0VAe083BEdl5IOThdoV+YEGnHn764L7L1n7gnC1k1scmvgPIuRNEWJFjTv3zSohtu5F8T5UiPh
 NkaPLHZe3hHxR1zVeHjK6LM90EkEBwz1Z41fB03GU6gsnCGy31lgm4J6zilyu6LAJ2AQfXsFy0H
 ozmNAiWRtlOfU4HdEWXXkRo8GtcRsHmJsDLJYm8R800yDvFWJUzn3omFE6TMe6W4pbNRO0G5/Fz
 zmAapOfw4hhmVtVigvI=
X-Received: by 2002:a05:6000:250a:b0:431:c73:48a8 with SMTP id
 ffacd0b85a97d-4396f17b061mr36791168f8f.29.1772125768766; Thu, 26 Feb 2026
 09:09:28 -0800 (PST)
MIME-Version: 1.0
References: <20260130124932.351328-1-clamor95@gmail.com>
 <20260130124932.351328-6-clamor95@gmail.com>
 <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com>
In-Reply-To: <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Feb 2026 19:09:17 +0200
X-Gm-Features: AaiRm532NOiD6_qJCcwIyPfsUO4-fF-YWthyRveATlcMfJkzAmg60rnRqSw5Slk
Message-ID: <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] gpu: host1x: convert MIPI to use operation
 function pointers
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,ffwll.ch,kernel.org,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,bootlin.com:url,bootlin.com:email]
X-Rspamd-Queue-Id: 1EA9F1ABD05
X-Rspamd-Action: no action

=D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:52 Luca=
 Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Fri Jan 30, 2026 at 1:49 PM CET, Svyatoslav Ryhel wrote:
> > Convert existing MIPI code to use operation function pointers, a necess=
ary
> > step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
> > that is SoC-independent remains in mipi.c, while all SoC-specific code =
is
> > moved to tegra114-mipi.c (The naming matches the first SoC generation w=
ith
> > a dedicated calibration block). Shared structures and function calls ar=
e
> > placed into tegra-mipi-cal.h.
> >
> > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, paralle=
l camera
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
>
> I wanted to test this series on top of v7.0-rc1, but applying this patch
> fails (with b4 shazam). Can you rebase and send a new iteration?
>

kzalloc(sizeof(*mipidev), GFP_KERNEL) > kzalloc_obj(*mipidev)

> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
