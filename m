Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7643D0BD39
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DB410E91C;
	Fri,  9 Jan 2026 18:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="TTq2WD53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B1110E91C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1767983273; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XTfBx+aumr4r26qEMS0RwjcPnj46PAfTi08A3JujHbeFikRRVTo1EPKJSc1Dzuc7kAKCVPMoR5UlHqVmL3gWIJkcSftyOpn7IJSgRadPHgaHw2RvlHEx2YwrgIN7ByHTT3AvEaqtJuGwMi8cQxtEoEUdxtm02eruFinn7lOnBe0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1767983273;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vf+18t1t2iJMep/ahqqAufx0XkAXBscr4g95xemYq98=; 
 b=hKMh2q5w0LGL936lnYAYGf/BrtTTYdMOn1o7pRh7IySWJk3IER6bA7bs5iOIxkWFY90VvWxUYnEGeKeszgw2RYrE3RwdzX8ZFJICihuHE0zH2gxes0MiCXU4IsqOI3QfjCQ8uBfk2FAGNALKDTE2SXRa8nsogWCsW3YHau0qA7k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767983273; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=vf+18t1t2iJMep/ahqqAufx0XkAXBscr4g95xemYq98=;
 b=TTq2WD53kIq8HjDxVYzDBy3cFCtsADCb9pmD9cI6BbKE2yn9UTm+uAWXHTwtwRvw
 Tsg5MuB+RIfbS7sbk9EsnBlXAoaF+WIZpX2RkfmNqLGoqTNeo6BCuD8BpRWzqHeCskC
 iPYvw7SwJVXYjavI8h+pmYGrJqLCRif/N2UOR5Ck=
Received: by mx.zohomail.com with SMTPS id 1767983272320533.4804385881307;
 Fri, 9 Jan 2026 10:27:52 -0800 (PST)
Message-ID: <cc128facb246d89408cf46aa7c9e250c56900940.camel@collabora.com>
Subject: Re: [PATCH RFC 0/6] AFBC fixes for MediaTek DRM
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel	
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter	
 <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Justin Green <greenjustin@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, ariel.dalessandro@collabora.com, 
 daniels@collabora.com, Nancy.Lin@mediatek.com, Jason-JH.Lin@mediatek.com
Date: Fri, 09 Jan 2026 15:27:43 -0300
In-Reply-To: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
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

On Tue, 2025-12-30 at 11:03 -0300, N=C3=ADcolas F. R. A. Prado wrote:
> This series contains a handful of fixes for AFBC support on the
> MediaTek
> DRM driver so that it can be re-enabled.
>=20
> This is sent as an RFC because there are still some issues to work
> out
> before the series can be merged:
>=20
> 1. Patch 4, 'drm/mediatek: ovl: Disallow AFBC buffers with width over
> =C2=A0=C2=A0 1920' did not behave well when tested with Weston, so a bett=
er
> =C2=A0=C2=A0 solution probably needs to be implemented before this can be
> merged.
>=20
> 2. Remaining AFBC issues:
> =C2=A0=C2=A0=20
> =C2=A0=C2=A0 a. The first 4 pixel rows are always skipped in the displaye=
d
> output,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that is, the first displayed pixel, on the=
 top-left corner,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 corresponds to 4x0. And below the end of t=
he displayed output,
> the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first 4x32 pixels are displayed.
>=20
> =C2=A0=C2=A0 b. On some resolutions, there are still artifacts that look =
like
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 misalignment issues, eg 1024x1080, 1080x10=
80.
>=20
> =C2=A0=C2=A0 c. On some resolutions, no output at all is displayed, eg
> 1920x1080.

I received a suggestion that the Lx_2ND_SUBBUF bit in OVL is not needed
when cropping is not enabled, and that removing it should fix the extra
pixels after the image described in 2.a., and perhaps even fix AFBC not
working with MT8188, though I haven't had time to test it.


--=20
Thanks,

N=C3=ADcolas
