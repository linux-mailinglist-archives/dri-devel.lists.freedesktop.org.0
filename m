Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A32FD1921C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 14:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7FA10E4E6;
	Tue, 13 Jan 2026 13:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="fNBMci8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792E610E4EE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768311742; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g2PjH7R8qmNDP49tCuXVrZN+SkVmuHZZs6r1O4BU1uPv0JOS+Td500xvDzzUdwccmmzgb+YjcpLS5jCYUjqxevFHnbpMH9LgDCNQCUOer2b7osBTn12ubC6XpFzccz3O/MQ79yzqfmdnqsihS/AFwmVZ7Q1J2n1qXvuQa567JyY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768311742;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Ja6rzcL5U+W48IVxZgkBg4dYiV270NXq5gOCylNcInY=; 
 b=HNFlQVHvg0OTUHPDV2/8wbGxoLx8qcjV5dYJ+Mu5YowreGPkJuuIKYB8bHZQdfBskiHsJGqpRNWZZyu1PW0ZLD+8hrar5AxqjOKblr1FQAsFhZJF9XAMfjt5zaJHBGsCCbULhAND8DZkzaqnVvmV/onVVbzZ+ueyQJEPIZOtD28=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768311742; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=Ja6rzcL5U+W48IVxZgkBg4dYiV270NXq5gOCylNcInY=;
 b=fNBMci8C2AOnEYzhfrW9nYTKlSeuDWWCs/ZLm5M4MmQ8uw9D9SSTe9NwRHZiPXC/
 uqr/y4oGpn42ku4jfGyylfAcC9e+Z34IcqU6L2nUSJ4HWk6QjQZ/rdzBteCbfvH8yv4
 hQcT35s+ECKdKHPonNsbgPM3WVTjoD+eY8zYJRMtTkH6mgfD+5ikoKRcPQ7Qf8lRInY
 N3ZOugHFtIJQPfSO9udKLBwTJMpYA2zGH3Hpq1gmWuxxeu+q1X2JdY99CfrszbaQvlz
 dtTOMtpVzvajWWMMsELjmWvMuIJak86byibZkUffWJj5+CGl1MnWL2vvL96WjqepoQP
 mBDTIA8bog==
Received: by mx.zohomail.com with SMTPS id 1768311704204117.21744879657183;
 Tue, 13 Jan 2026 05:41:44 -0800 (PST)
Message-ID: <ba505a137370377e55316605827b51a2454b023e.camel@icenowy.me>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini
 <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao
 Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Tue, 13 Jan 2026 21:41:30 +0800
In-Reply-To: <CAL_JsqKC6FaJZubvxQaX-uQBhWFNs2EHuTG8JK1FJaD1tPOaSw@mail.gmail.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
 <20260105154656.GA2585570-robh@kernel.org>
 <a838dc0f8bd39c6d9da95f5fd137eba8c131c58a.camel@icenowy.me>
 <CAL_JsqKC6FaJZubvxQaX-uQBhWFNs2EHuTG8JK1FJaD1tPOaSw@mail.gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2026-01-05=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 10:20 -0600=EF=BC=
=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ports:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - port@0
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 - port@1
> > >=20
> > > It is valid to omit these if the output is present, but unused.
> >=20
> > Well this sounds reasonable, although my driver does not play well
> > if
> > only a port@1 is defined w/o port@0 .
>=20
> Sounds like your driver should be fixed.

After this requirement is dropped, should the unconnected port@0 also
be removed from the DT example?

>=20
> > Considering the previous two snippets, should I just remove this if
> > part?
>=20
> I would, yes.
>=20
> Rob

