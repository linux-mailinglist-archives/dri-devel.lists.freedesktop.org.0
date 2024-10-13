Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1DE99B9EE
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 17:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F341C10E377;
	Sun, 13 Oct 2024 15:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="UzinH7BK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6127 seconds by postgrey-1.36 at gabe;
 Sun, 13 Oct 2024 15:16:53 UTC
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEB310E35E
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1728832612; x=1729091812;
 bh=4Ka4WXN0N5d5+vx51WtE9dkbDZkLmYxFPeUK4Fs1qMs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=UzinH7BKzhKhZGDcIkpc76lWyZYjnJx+ni3eWRNOAVTGKGdCM5xa301TSYI4YXsuO
 E5EYqdd4TbrwMrZ2+JKhafr2ne1OyBX6AvKtPTVjyLNbeJ9fwykbTl1ZIl/3pKeGr/
 APVrHe8irIfQxuQc54cxG2ROAenRrHTERGMMVCTU/x8Ok/uj+DvvUdzjh3dJ/sQ1/H
 KEpyiGywaHFhWkJf92vsdotGu+7O3kihfx9h6z1ej1puMzEJHXDQ/nreeQVaexu0vt
 2IGJGgwVUDFIctJEipwDtGwpFJM2wXQn1INo4CETm2Kb05MEZUl913QQzGZJQ2QNUe
 TfZdvfHZf+lJw==
Date: Sun, 13 Oct 2024 15:16:47 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 13/44] drm/colorop: Add NEXT to colorop state print
Message-ID: <Ni2okIqR4shuoln4Q2B0dSc6dC0W5rDdZ0g8SPbIRMm22zMPU8hsQrnM1eb6G_ZB-Lke9R8VSR4mpg_NKiIu7yyMWyUlUjBgeFWjDZFOAN0=@emersion.fr>
In-Reply-To: <20241003200129.1732122-14-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-14-harry.wentland@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 5461abcf7c839d07f99384da82d65c0fc7a08bea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think this can be folded into "drm/colorop: Add atomic state print for
drm_colorop".
