Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33690A28E14
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 15:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D6210E7C3;
	Wed,  5 Feb 2025 14:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="JtXlN03T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57EA10E7C3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 14:08:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738764519; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MUVgO7yDZ0TPz+1FF/7QJnFsEw0Gxf1wbkmk8MzRP1URAUJBHHIQ7uWRJb/Z6J7TwZ28COd1N+pIdinpfmAqQiUpd1pdjOOt5nVF9/qeHgANWPp0aeVvhserWZDyNblvP7wN4xLKxySTrZ/LG3ZqXrcBmmTNB17MosCjsh4K7bQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738764519;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8QhVksKP31M/mhgIrezkDfGC+gnRXHKNBZuxcvDojTQ=; 
 b=Etkwqygbw2iuuXVTc9DLdGIxnpjbTmf05fBGhoUbpYJrcjo2IOq8Lgrzol1Ma7SttjDVN5uR+muiAkB8QzZmbD+pVnhYkF4+0DSeESC5xa+DP218gCi8oka0fI7NedSfeJYOoHpuGBIeEROyOlSPkBBcSC5c23azHl+FhcIDWTw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738764519; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=8QhVksKP31M/mhgIrezkDfGC+gnRXHKNBZuxcvDojTQ=;
 b=JtXlN03TYCew8qivotfDzhSe61agm228G49/11GtUxBfwnlD4KT6Fa1Qix9BAZO1
 hMGsTo7xF+WBY/qI6n7bEjolzymlT2ow0EDp19YzPbturIxiXu+3xP3k/WEplS2I5G/
 c5HhDCr8lXGMGYLLl+L1kFYwUh5WZX8FeWrtGfds=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1738764517374344.8499195824269;
 Wed, 5 Feb 2025 06:08:37 -0800 (PST)
Date: Wed, 05 Feb 2025 11:08:37 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "simona.vetter" <simona.vetter@ffwll.ch>,
 "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "valentine.burley" <valentine.burley@collabora.com>,
 "jani.nikula" <jani.nikula@linux.intel.com>,
 "dmitry.baryshkov" <dmitry.baryshkov@linaro.org>,
 "mripard" <mripard@kernel.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <194d670ffb4.cfbdc70e672095.6844821701442540179@collabora.com>
In-Reply-To: <20250205134811.2002718-1-vignesh.raman@collabora.com>
References: <20250205134811.2002718-1-vignesh.raman@collabora.com>
Subject: Re: [PATCH v1] MAINTAINERS: Update drm/ci maintainers
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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





---- On Wed, 05 Feb 2025 10:47:47 -0300 Vignesh Raman  wrote ---

 > Update drm/ci maintainer entries:=20
 > =20
 > * Add myself as drm/ci maintainer.=20
 > * Update Helen's email address.=20
 > =20
 > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com>=20
 > ---=20
 >  MAINTAINERS | 3 ++-=20
 >  1 file changed, 2 insertions(+), 1 deletion(-)=20
 > =20
 > diff --git a/MAINTAINERS b/MAINTAINERS=20
 > index b256bb4f6d3f..2b4e08c7e119 100644=20
 > --- a/MAINTAINERS=20
 > +++ b/MAINTAINERS=20
 > @@ -7940,7 +7940,8 @@ F:=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/ttm/=20
 >  F:=C2=A0=C2=A0=C2=A0=C2=A0include/drm/ttm/=20
 > =20
 >  DRM AUTOMATED TESTING=20
 > -M:=C2=A0=C2=A0=C2=A0=C2=A0Helen Koike helen.koike@collabora.com>=20
 > +M:=C2=A0=C2=A0=C2=A0=C2=A0Helen Koike helen.fornazier@gmail.com>=20
 > +M:=C2=A0=C2=A0=C2=A0=C2=A0Vignesh Raman vignesh.raman@collabora.com>=20
 >  L:=C2=A0=C2=A0=C2=A0=C2=A0dri-devel@lists.freedesktop.org=20
 >  S:=C2=A0=C2=A0=C2=A0=C2=A0Maintained=20
 >  T:=C2=A0=C2=A0=C2=A0=C2=A0git https://gitlab.freedesktop.org/drm/misc/k=
ernel.git=20
 > --=20
 > 2.43.0=20
 > =20
 >=20


Acked-by: Helen Koike <helen.fornazier@gmail.com>
