Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77739788B5A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 16:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E9610E6A0;
	Fri, 25 Aug 2023 14:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019A710E6A0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 14:14:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4ACC061A1E;
 Fri, 25 Aug 2023 14:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A96DC433C8;
 Fri, 25 Aug 2023 14:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692972872;
 bh=Cw+bFqmzzs94DvrL5Dn0Tm7omS2AdYitUfsk3kbW2dY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Xv5UQYWS4RX2/13KhL16AS5heMmvfvfY4DLozbgF9Ab5oWpHWXJG9OQjMBNT/pSpg
 /baJsY/QEKVrW3MTAHluTDmwsJtQFScM+BnnYl9bYc2P7cVniivNddhCCow2hpMBIz
 w2bgOwe7TxxSh1nAprRmsROpIbXiR6f7UjeaMmTANjnjk4kY+ZxfI03X62/8G2ql1K
 VL1js7qjpR6YZplwroTA3fyUXJWohGDQWV8Bquug9Vv9RHB8g15Owao4wWTJXTwhzq
 XjgJgfTyUNent9iIJPtc4UFgmxlGY5gOqsg2/fUZrcxcqicDEIO0pLD+u2UcTzBLfx
 5QMid3qEEmrvA==
Message-ID: <4f8eda60484ec9dc41c2200ac936ea63.mripard@kernel.org>
Date: Fri, 25 Aug 2023 14:14:29 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
In-Reply-To: <20230825140434.182664-1-jfalempe@redhat.com>
References: <20230825140434.182664-1-jfalempe@redhat.com>
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
Cc: tzimmermann@suse.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 ppaalanen@gmail.com, mripard@kernel.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Aug 2023 16:04:18 +0200, Jocelyn Falempe wrote:
> After discussions on IRC, the consensus is that the DRM drivers should
> avoid software color conversion, and only advertise the formats supported
> by hardware.
> Update the doc accordingly so that the rule and exceptions are clear for
> everyone.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
