Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77388A428E7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E045B10E486;
	Mon, 24 Feb 2025 17:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="Sio8wCHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10D610E4D2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:07:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740416861; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cQsG9W64Zk2OKPd85hxSBf3MoJiTODMBTu4S6CnPlWuor7IGgJIcWNndNYTukQzzy5BIS7ko8YZuDAuCpYJal2IXzhCTBaWol/+/qQWufRn4WPQ3FoxqUTMqRthnnunXMY1EDYsQ8Ni6IH0bH9RmjXJ9VJ1ZuwMHsguCwu5Lhv8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740416861;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sEPEAsu37A1qIiTQHKAj9euGoglZkXFnn7bkzdjcrRE=; 
 b=foLWPn7DIDy5HLGjNjLotNo9FeEe+uTIuAE0AjTgPX0e3wNcpU2CZSVQ+/Zn5+0V8pQkjdAozQeO9kl+ZXiYapXqxsRO/XcfP63G8q6yGydmhZue7i7pZGXZucZvt3Q/OBFQJbuWCyKqFQbJVdslHBIIzEzcXuNdG2hefJhxmqw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740416861; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=sEPEAsu37A1qIiTQHKAj9euGoglZkXFnn7bkzdjcrRE=;
 b=Sio8wCHUmuVQl6YhlW1D/0pbEkzPpmY28SSltsg2poGIlD72ugcjNeHS5lZoUKZd
 QvtXgPe3rWf/YjlVpGqgYacgKRrF0vd5WXdwYWJ5j2AJntdbB83gK8shcCflxeOwNMU
 rjwmLAt4nqsVMBGOEy+2FNQqstP3/I8o5MKOondc=
Received: by mx.zohomail.com with SMTPS id 17404168592031017.3373094891671;
 Mon, 24 Feb 2025 09:07:39 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
 id AC79518067D; Mon, 24 Feb 2025 18:07:34 +0100 (CET)
Date: Mon, 24 Feb 2025 18:07:34 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Yan <andyshrk@163.com>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/2] Rockchip W552793DBA-V10 panel support
Message-ID: <psmfw2znti3luu6pjyi5g22bgvylcb5lms22yakfkshnol4v4y@bhzvqjbgzhep>
References: <20250207-raydium-rm67200-v2-0-1fdc927aae82@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250207-raydium-rm67200-v2-0-1fdc927aae82@kernel.org>
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Fri, Feb 07, 2025 at 05:21:46PM +0100, Sebastian Reichel wrote:
> This has been tested in combination with the series from Heiko St=FCbne=
r
> enabling DSI support for the RK3588 [0] (DSI controller support has bee=
n
> merged already, only the PHY support is missing) on the RK3588 EVB1.
>=20
> [0] https://lore.kernel.org/linux-rockchip/20241203164934.1500616-1-hei=
ko@sntech.de/
>=20
> Changes since PATCHv1:
>  * https://lore.kernel.org/all/20241210164333.121253-1-sebastian.reiche=
l@collabora.com/
>  * move additionalProperties below required in the DT binding
>  * collect Reviewed-by from Krzysztof Kozlowski, Andy Yan and Jessica Z=
hang
>  * improve Kconfig help text
>=20
> Thanks for having a look.

I believe this has all necessary Reviewed-by tags. Can somebody
merge it please? :)

Greetings,

-- Sebastian
