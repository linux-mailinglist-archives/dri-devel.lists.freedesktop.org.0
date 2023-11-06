Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EACAC7E1D6F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 10:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831E810E051;
	Mon,  6 Nov 2023 09:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9577E10E051;
 Mon,  6 Nov 2023 09:48:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 55D9FCE0AD4;
 Mon,  6 Nov 2023 09:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4153DC433C7;
 Mon,  6 Nov 2023 09:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699264100;
 bh=h+NSCPSwlpTiwPS/t/qXHGHCzH25S5Gk5v0x2k5LBkU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UYgfyXoKhcRw7fX2jwEFhlsk36VUopg/olpvjv+aIv6xKPdXk+tD6n6fRDQuEcQI4
 K1rQntb/DrNvBP1wBahGsHLn+QBgq5jyUhlhYI0kHsu+RMWMagZ1OC4ytqNcxzRDS3
 WNSGDxHS9zcPiy8ByzgU2yWBTkvwfwVTWq/kVyxn0KN5/oDD+/VVfKwMeSsAV21u+m
 xy2t9X8+oGMxjStITIzILXu5CwWUYyesF8T2+vbOceRau2lixoz+E24gInZRJPHNoF
 imCR3cW/nbBbRMCLHEaYscmjzrHpy0j4BOMFpE/R5LKcptNp5KLdalL/jOACNbLAg/
 o4W5099wqcK9w==
From: Maxime Ripard <mripard@kernel.org>
To: airlied@redhat.com, kraxel@redhat.com, airlied@gmail.com, 
 daniel@ffwll.ch, Zongmin Zhou <zhouzongmin@kylinos.cn>
In-Reply-To: <20230801025309.4049813-1-zhouzongmin@kylinos.cn>
References: <20230425014543.3448839-1-zhouzongmin@kylinos.cn>
 <20230801025309.4049813-1-zhouzongmin@kylinos.cn>
Subject: Re: [RESEND PATCH] drm/qxl: prevent memory leak
Message-Id: <169926409790.498855.8582421584361847884.b4-ty@kernel.org>
Date: Mon, 06 Nov 2023 10:48:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: spice-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 01 Aug 2023 10:53:09 +0800, Zongmin Zhou wrote:
> The allocated memory for qdev->dumb_heads should be released
> in qxl_destroy_monitors_object before qxl suspend.
> otherwise,qxl_create_monitors_object will be called to
> reallocate memory for qdev->dumb_heads after qxl resume,
> it will cause memory leak.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

