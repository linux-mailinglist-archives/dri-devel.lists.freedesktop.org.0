Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABA56DD610
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 10:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A72E10E4F9;
	Tue, 11 Apr 2023 08:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B18810E507
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 08:58:35 +0000 (UTC)
Date: Tue, 11 Apr 2023 08:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1681203511; x=1681462711;
 bh=hI+4Bv/fxhLw+i3kOzKkNs5Uckfc3Tr8LxD+E+2bjfI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=MNz6k+RUX/QRRHr8X4TsnAlJ4Tpb7lIhVztZ1yp9EXUxGFBRo2lTuCOBMgGVR2+DY
 6cjb2r7CDVoGIDMEm2jOO4Ov66je+IuUOP8CFVGVMhojb+P23TsrUyov5C1OXbjC0i
 t3l1d1SE9Ymx8AVKoLHqMIGY8qc58hKHdlvj5phsZU58pAY4u5b2QpfBiuE6FjkgqK
 IlpJZASMavmFuNh+YGPcG3xnqmziM5HNU22vIk1qigwRRtXyEz/oU6ZWx3mjv/9Mt2
 te75UBvch6yJtiSOLye/t1qEk4KpZoysaLIK4spDshaqEPF1cioENq1xbKAdzVStGQ
 kH2uWcbEGcrhQ==
To: Melissa Wen <mwen@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/vkms: add module parameter to set background color
Message-ID: <86KSXjLyx61ozmy_5grAFQ5XGxnysnSnGRCD6FQsgzrUc2xnXQpv06rcPu9FWkXNo7PLu7dEMTmsX9uWVvEMSKYW62ELEjloEfHGCZUqob8=@emersion.fr>
In-Reply-To: <20230410175036.tqjbwrd4ldcnnqlf@mail.igalia.com>
References: <20230410125435.128689-1-mcanal@igalia.com>
 <gY5DtUoeqVhT1HdJU8yjHSqwe9gTIbV6Q2yVDYRyI_JGHS6Lo73Ivjs2G8d_5T_qL2q7pOhjC6O_aPk2Pnn3npdhzh2Y-_nrD98r3ONMrWc=@emersion.fr>
 <20230410175036.tqjbwrd4ldcnnqlf@mail.igalia.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Monday, April 10th, 2023 at 19:50, Melissa Wen <mwen@igalia.com> wrote:

> On 04/10, Simon Ser wrote:
>=20
> > I think this should be a KMS property instead of a module parameter.
> > Is there a reason why this patch uses a module parameter? It breaks
> > user-space expectations.
>=20
> a KMS property is what we have on vkms TODO [1] and the module parameter
> was Ma=C3=ADra's first step to open a discussion for this property [2].
> AFAIK, we would need to create the KMS property first, but it seems
> there isn't an userspace case/need to support this API change.
> Do you know any valid use cases to support a bkg color property?

There have been previous attempts for msm [1] and i915 [2].

From user-space PoV, a KMS property would be useful, for instance to
render single color background images. I can type some user-space code
if that helps.

If this is a module parameter instead of a KMS property, what purpose
does this achieve? What is the use-case? Just trying to understand the
motivation here.

Thanks,

Simon

[1]: https://lore.kernel.org/dri-devel/20221028225952.160-1-quic_jesszhan@q=
uicinc.com/
[2]: https://lore.kernel.org/dri-devel/20190930224707.14904-1-matthew.d.rop=
er@intel.com/
