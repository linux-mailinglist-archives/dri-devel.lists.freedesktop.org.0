Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CC4A9213B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA46110E1B8;
	Thu, 17 Apr 2025 15:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="ECa2YThC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch
 [109.224.244.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9647710E1B8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1744903198; x=1745162398;
 bh=aft/1xY2+akXq/oImkS/iXgcEees3G5xD7ihA02ccpQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=ECa2YThC5nrbUGluMM0PVCMkArEzjAvWO2FcCE7Un/myrmgVd/VVSjteMKkeOqbmX
 6vVBK6YXw8zZVSCSDiWkowmdQeJWp+WhluPJ3TehpT+z1rKFfXzFNHKI3+rqzyWYoL
 qfewRvY61Vcv5nIMolgRDH2L1Y6t/WFSqU1CYgR7YWrTWORhR91ZQJL4JM4neRXGcZ
 kJDC+BrOAN1790xWbMsqRwqnrkszA4uK/Co+xo6NAyBHuWzf6sj6Oezt0e2e804XYj
 aLWI04wXfPYhW72UH9V0XrMenibwnydNeTVNCgu7tbLXrDvau3tW/2XGJfBMoK3Rgh
 t+JfMVKh5+muQ==
Date: Thu, 17 Apr 2025 15:19:45 +0000
To: Pekka Paalanen <pekka.paalanen@collabora.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2] drm/doc: document front-buffer rendering
Message-ID: <q0ezd1X8PHW2dfDHoBBZWxXpLIljcrPxQhYOB8p_N0lL0KTvolylcEJUAFlvlNn_S0gKtlkkp4dKfTOdx-O5Q84oX65BwNYMgNpHzXhKRQk=@emersion.fr>
In-Reply-To: <20250414140638.49fa3f08@eldfell>
References: <20250414085652.43904-1-contact@emersion.fr>
 <20250414140638.49fa3f08@eldfell>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 78f7120ab74be140232b4f838db92ffecc1ca8da
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

On Monday, April 14th, 2025 at 13:06, Pekka Paalanen <pekka.paalanen@collab=
ora.com> wrote:

> Looking good, but given the new wording is 100% mine, not sure I can
> give reviewed-by?
>=20
> Co-authored-by maybe?

Since it's 100% yours, probably you should be the commit author? Would
you mind giving a S-o-b as well?

But I wonder, would I be able to drop a R-b tag, meaning I agree with
your new wording?
