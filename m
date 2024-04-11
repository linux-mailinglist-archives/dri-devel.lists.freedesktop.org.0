Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BF78A15DD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 15:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5887D10F0BC;
	Thu, 11 Apr 2024 13:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="pMkL0kd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35B310EB81
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:References:Cc:To:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8l8ozz2X3fWkqtawXFqJ+qV7I1V980lsCasglxgPUJk=; b=pMkL0kd0/jiMsfjIEO6Fbzz6Eo
 pTSfJ/6eU3AuJS2fEY3CYpVar4gi8CgE5pBNPQiZk1Ud5yXIjyka+1Q3xGiu6Km+3cRq/myENCE3l
 g+bkV1lnhPJ8ZXFwL0hr/WckbuqSMr8GPuVAVuVe2AxHSOS9s1KwKcI815qqO/8UxZta9mNBU5Apq
 fggnUIEwvvk7prZGbVK7lK0+mlP6m13xu1VjQ9js2Pt66FBYk1XW5PUQFF+t1tPdCtDlkh64AARcj
 serSkeC6KLZjOUtTBW5oK+6pR59yjj/a+ILpWwpehCG1k8VS3b3ZGtqOZel1cVFgD5fy65l2TIrNo
 0DoUmhQA==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jyri.sarha@iki.fi>) id 1ruuew-008bQE-0e;
 Thu, 11 Apr 2024 16:40:33 +0300
MIME-Version: 1.0
Date: Thu, 11 Apr 2024 13:40:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: jyri.sarha@iki.fi
Message-ID: <a4ebe0272e8cfad14d1d9a8f1a83a35e1b62b6c7@iki.fi>
To: "=?utf-8?B?VmlsbGUgU3lyasOkbMOk?=" <ville.syrjala@linux.intel.com>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, "Jyri Sarha" <jyri.sarha@iki.fi>
References: undefined <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-13-ville.syrjala@linux.intel.com>
 <b944eacf-e284-42ad-aeb6-e7aeb1aa01c1@ideasonboard.com>
 <ZhavXcFrgzw5UApH@intel.com>
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=4.0.0
Subject: Re: [PATCH 12/21] drm/tilcdc: Allow build without __iowmb()
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
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

April 10, 2024 at 8:04 PM, "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux=
.intel.com mailto:ville.syrjala@linux.intel.com?to=3D%22Ville%20Syrj%C3%A=
4l%C3%A4%22%20%3Cville.syrjala%40linux.intel.com%3E > wrote:
>=20
>=20What if someone tries to actually boot a kernel built
> with COMPILE_TEST=3Dy on a machine with this hardware?
>=20

I=20doubt there is am335x HW out there with enough memory to load COMPILE=
_TEST=3Dy kernel.

BR,
Jyri
