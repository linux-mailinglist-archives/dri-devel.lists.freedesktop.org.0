Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8E3725856
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCB410E478;
	Wed,  7 Jun 2023 08:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F79610E13A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 13:21:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686057678; cv=none; d=zohomail.in; s=zohoarc; 
 b=IsleUbvHQKYA75512M57S2nWuNFv9ftsopRs9T9/NiYPKF3N9+ktrfd3C+adSZQlKrSIkhRXiqWikxtqSMkcAwwAOGEs5uhiUpDaxBjIhgF5y/b1ySUWb67iSVLb2iiSUZ5WpNJieOJJWwflIiwseo1KyMebw2aFNISUzPYzBFI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686057678;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ZeTAQnMstl6o6gzMB6r+R3fC0od+ep3sPbCDDY+xTuw=; 
 b=DYSPBvExNKK4Nmjk6tlXYnTepDs/K2/jsSUWyapusTjN8rmhUJ/T1GXRSwWLN4xB5ztp6uuDPy3kSSHy7njGVGICQZI1em0SXA+qW7oZs2psGlncRjNbOiTqXH4+BY7hQy1NUqf/drmZnZcINYsqj2bqAx+cR1kZIBHIj0kDeNU=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686057678; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ZeTAQnMstl6o6gzMB6r+R3fC0od+ep3sPbCDDY+xTuw=;
 b=vFrHNq3GboGmNcLzTkJE0HXoO2mAu9L5wiB6X8eml1h1VF8vLzI9KeSDk6IFkI/K
 E2TlZ/Jhix8yX4cALfb6fAtqeoSRi9UjF2uWoIwojIMWyyThYE0W8K/1P1EOOamG9HG
 9M9L57aTPelTmEwTFgklS+fQ1kkjowjmXrFGqNOs=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1686057665971364.0299014993585;
 Tue, 6 Jun 2023 18:51:05 +0530 (IST)
Date: Tue, 06 Jun 2023 18:51:05 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Message-ID: <18890de45a9.592cf481119039.6913148846210954357@siddh.me>
In-Reply-To: <20230606125537.GC25774@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <bff523677c65a4a6b1c06152b154cf5651f51d68.1686047727.git.code@siddh.me>
 <20230606125537.GC25774@pendragon.ideasonboard.com>
Subject: Re: [PATCH v9 1/8] Revert "drm: mipi-dsi: Convert logging to drm_*
 functions."
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:25 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Jun 2023 18:25:37 +0530, Laurent Pinchart wrote:
> Hi Siddh,
> 
> Thank you for the patch.

Anytime :)

> Any chance we could prevent this from happening by turning the macros
> into inline functions ?

The next patch in the series almost does that, with a function introduced
as Jani mentioned. The macros will call that function, so if the argument
is not drm_device there will be error.

Thanks,
Siddh
