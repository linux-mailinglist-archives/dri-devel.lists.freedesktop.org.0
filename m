Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA807AB124
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 13:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B9A10E658;
	Fri, 22 Sep 2023 11:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DBC10E658
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 11:47:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1695383235; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=OAnEqqFpLxXsn+UpKHiKnCeVc+CWeG/ousQG2fSwtDeoJrW/TKTd2uuuBtnKK9G9Q1
 1FQC0Qqo4FjW8EbNOCAFJswJHZm7ySzLOo160ckAcLLLDjGldRZEKjGGAWW65erFjqvu
 8gYgJ7vlphmcO95DDR6/7MmHRKJOVY39aNRmWBWVj3PlpJCI6JL8slSfQluD6iyiX2LF
 JIKOp9nud9H2e18Dz4RS8PMMm8Eef9fcHb3dMPbfDaEvk6wVkIIkSFfmUaYAOjdR4+u3
 4KadPsdXdLe6n+lYN8cWY15cnuy5kaQrCRFJOQ2zO4uq/lDNOnAuGcdOek7xrAlcIOdI
 YiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1695383235;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=pky2Q9R3zh6uCAWY5ssBJbPa3KQrvYFhlknBDTUvhFM=;
 b=pp7eS64jiQuBg4psuEwEXMnKmeXiY0GNbneyk241ohjLW8W/ENqr8UpH47SjPt/9rB
 J+ZVRwoW39jhp+vb7fiNzXJjNTc3eV3HbMV4leoAzGM3gPAQkK+BQ4WjIQJDVXv2JViZ
 0EK4TbucF09tN/xeXVkGBEXIFL9TSafhzZCoDs0MoASznjcj6z0Q3bYU7kafB4P6iyca
 QHCfUUsNUU+LpbOG3DFcJZWSD70tvoKeqN4ngqY7iVTbHGHa2JJPJjZ8k0Khp80TCVAg
 WPAv+21il9GCZOKmOAjvwGGAvUjlj0VFkr3NVtKrwxACJEtemxEGjwxq4inrE7wlGY3J
 Z4cA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1695383235;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=pky2Q9R3zh6uCAWY5ssBJbPa3KQrvYFhlknBDTUvhFM=;
 b=rZ1i3+r5NOOPBts/+XHlqF/Kt3354eOx20aI+peVxNxHFXXeQS5QktknuhyCx+H/Xg
 jV2ZzaOEAiVdZ8cwpA+Eg2VCLJbPFEoWOwTGhtsY+Ad6K4ohdu20CgXWFqWGmDUoZj8P
 6N7bDohGVJRx9/ARbU8paI6yNRzhu1WP0+Yp9hcXF/8nJsxf9/j53jeknwJ0kKMAXsDp
 1tRtsm9fwSv10DE1pDccBZY9Dwl4R8+yfYgRsWrZLJyCGpMuHYCoiw5u+d/zhzi8hIGf
 vUCkfUhHrAFW68hj0m4jF+gHBwdwREc28fkN18IAVjAFugGG26jKzJ2kWFL8aGWuHD5K
 7NEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1695383235;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=pky2Q9R3zh6uCAWY5ssBJbPa3KQrvYFhlknBDTUvhFM=;
 b=8zl9g0XFFmf09EvCVbAOJlxz3DGAv+RiGxmqZuG50Z4rlFVOuBCpQ0yxYZkOui5K5d
 /el9Gi7TNoI5s+XYP9Ag==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGfpWU="
Received: from smtpclient.apple by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
 with ESMTPSA id Y04dd7z8MBlEvQs
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 22 Sep 2023 13:47:14 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.4\))
Subject: Re: [PATCH] drm/mipi-dsi: Fix detach call without attach
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20230921-dsi-detach-fix-v1-1-d0de2d1621d9@ideasonboard.com>
Date: Fri, 22 Sep 2023 13:47:14 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <0A1B6CA5-AB09-4A79-952E-D1B8EEE5C38A@goldelico.com>
References: <20230921-dsi-detach-fix-v1-1-d0de2d1621d9@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: Apple Mail (2.3696.120.41.1.4)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
I have tested this on an OMAP5 Pyra.

> Am 21.09.2023 um 12:50 schrieb Tomi Valkeinen =
<tomi.valkeinen@ideasonboard.com>:
>=20
> It's been reported that DSI host driver's detach can be called without
> the attach ever happening:
>=20
> https://lore.kernel.org/all/20230412073954.20601-1-tony@atomide.com/
>=20

This patch works equally well as my proposal and is indeed a better =
solution
(solving the issue and not just suppressing a warning).

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>

BR and thanks,
Nikolaus

