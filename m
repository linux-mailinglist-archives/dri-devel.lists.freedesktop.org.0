Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2291E74CE8B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D6A10E1F7;
	Mon, 10 Jul 2023 07:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1835010E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1688974556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pdykm1IEGXCNP+4KYVVXGZUNeBfIgSrmIH45XmqOIEc=;
 b=EoyDf5E+m+C9+A9pRywQm3MugVhoXsP+s6OymqrMQgX2OJhPMy6c+mVR6Bdm/caqBtQ3Df
 PLTlCC/mKX/bsqAStBFfYG0KQiinYLfOB+ass9vBA1M+zjXRcE1rsYw4YK3tv1ko4ZmWTi
 LDSwHW7aHmonwB2/BFY9bCz7Fw/BWrs=
Message-ID: <7672f0b65cf7d2a1bb81019417aa3fa98fbac5e3.camel@crapouillou.net>
Subject: Re: [PATCH v2 3/3] ARM: dts: exynos/i9100: Fix LCD screen's
 physical size
From: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Neil Armstrong <neil.armstrong@linaro.org>, Sam
 Ravnborg <sam@ravnborg.org>
Date: Mon, 10 Jul 2023 09:35:54 +0200
In-Reply-To: <98b39071-cbfa-bc58-032e-56f6e9dd5c2a@linaro.org>
References: <20230708084027.18352-1-paul@crapouillou.net>
 <20230708084027.18352-4-paul@crapouillou.net>
 <98b39071-cbfa-bc58-032e-56f6e9dd5c2a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Le lundi 10 juillet 2023 =C3=A0 08:59 +0200, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 08/07/2023 10:40, Paul Cercueil wrote:
> > The previous values were completely bogus, and resulted in the
> > computed
> > DPI ratio being much lower than reality, causing applications and
> > UIs to
> > misbehave.
> >=20
> > The new values were measured by myself with a ruler.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > Fixes: 8620cc2f99b7 ("ARM: dts: exynos: Add devicetree file for the
> > Galaxy S2")
> > Cc: <stable@vger.kernel.org> # v5.8+
> > ---
>=20
> This does not apply. You rebased your work on some older
> version/tree,
> without new layout. Please work on linux-next.

This patchset was based on drm-misc-next, because that's where I was
planning to apply it; and it was extremely unlikely (but not
impossible, apparently) that the i9100.dts would be modified in the
meantime.

I can rebase on linux-next, the problem then is that I then don't know
how/where to apply the patchset.

Cheers,
-Paul
