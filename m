Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF198B2FE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 06:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6B010E142;
	Tue,  1 Oct 2024 04:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="UZZMvhwZ";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="0TpTrP5s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B5F10E142
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 04:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727756773; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=sXrW5a4pU6aIPaRPCiVN26Y7740EfsAJtbL1BM5cXPUjyry65qBq+PSrJc+c/ZS7lc
 4b6flfhfJg+N/jm1jn1CtEG1K922llX5wIHh8PyoIO8rT78s3P2wz3HLZ5uIccxJ/4bN
 7IwSIBNf0WVsj9TzxZuVD7WXvWqAz8Csgq/12R2O5vKKmmt/GLgekSzal58rtpqP0VWU
 OXsSe6ZffWCm8k1Jb2EP36JHq860DCz247ZnuD1LX94KtFfd3ip+w9BewB/BaNNldi0K
 QPyS4cAi3LJDDixAzPAV6p9Q7SsPxCpDrgV6UXEzA2ePioUaOgA3HzHxulpOXGS4KoX8
 VEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727756773;
 s=strato-dkim-0002; d=strato.com;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=0WxRCpt9IJ3RwYa8CC9lm/lIsXtb+Z8TgGMIFsgKu+o=;
 b=MvPdYd997blvuZRuPSciWwLIzQ7hYfUU45JgOdNMldXJ7W9dehi1jrKQ/SmKghsv9Q
 5WqS0bHhGE4o8y9StthkLRqHPV1IRP/xs56PxOixcvRPpo/Y6kleGmDJL4Fk9X7JuT62
 nlJIrVw1tSgUHGo73dmQeqJse7Jh82IOZpazzTeXaV8iBa+5jO1p5/DzuqT3iIA7waQJ
 fmngxPVSlZB7BeBcNpYueYd9L0i3cB3hpf21qooDnGYEODnBFdTBSc9VEazkrHYGjUCd
 wx5SwUYATjiiLC060gsykVtmymGbEp17VEJrOfQ0Z0ZhcrGv+fzFRuaAL8EE8bcKBWhu
 yfuQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727756773;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=0WxRCpt9IJ3RwYa8CC9lm/lIsXtb+Z8TgGMIFsgKu+o=;
 b=UZZMvhwZQFT/lqAe1wURfytdubGY14ckUUdinUCj+SJObmRrwhN/nJCCDPJGCyfuoQ
 PUj7vztvnhOA/9Tw0nccpS0iLCKDZshhKptpfYNlZhQ9VIoO7kSwZlYR0adfICQwdc+j
 CXRPbNYreSERsaBX3MDwVttLe6/AjGTboaUCYUv8D7JtMHkxXdBV2jgcqu1fXWJ5mfFf
 RBAVlHxvGT0cd1cHYSRDNd4SliGruEWbJGpHo8CZlW9ktRNG0rhIupap86589EBVpN09
 mx8HhCAkAm51EQjAnhTaeqjolskcEtT9Bl6WqNdNiEeIETnGnTRW9P0QWrjg3viFRPWv
 62Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727756773;
 s=strato-dkim-0003; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=0WxRCpt9IJ3RwYa8CC9lm/lIsXtb+Z8TgGMIFsgKu+o=;
 b=0TpTrP5s+6kXRJtOL7pXJ1MLg71O6NkayswAwncB8+ZZ3CEysI2r50dj4d/59u53GF
 IoPM6BEw1xk1kaO/LhCQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7VpnmsymRC32nq4HIjc1UIPKKQHGR7Ea0yJ2oU7c="
Received: from smtpclient.apple by smtp.strato.de (RZmta 51.2.8 AUTH)
 with ESMTPSA id e0da1a0914QCTt0
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Oct 2024 06:26:12 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
Date: Tue, 1 Oct 2024 06:26:01 +0200
Message-Id: <D01B31B5-0609-4106-ABF4-B549CDBA362B@xenosoft.de>
References: <CADnq5_PB8zUfCN-NcNpgHqzAv8A55o2hsYHAdnSBhEy525NLfA@mail.gmail.com>
Cc: Wu Hoi Pok <wuhoipok@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alex Deucher <alexander.deucher@amd.com>,
 developers DRI <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <CADnq5_PB8zUfCN-NcNpgHqzAv8A55o2hsYHAdnSBhEy525NLfA@mail.gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailer: iPhone Mail (22A3354)
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

On 30 September 2024 3:27pm, Alex Deucher <alexdeucher@gmail.com> wrote:

=EF=BB=BF+ Wu Hoi Pok

This is likely related to the drm device rework.

Alex

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-

Hi All,

I was able to revert the drm-next-2024-09-19 updates for the RC1 of kernel 6=
.12.

This kernel works on all machines without any problems.

This means, the new Radeon DRM driver is unreliable after the DRM rework.

Please fix this issue because we can=E2=80=99t deliver the kernels with the n=
ew Radeon DRM driver.

Error log: https://www.xenosoft.de/PuTTY_P5040_U-Boot.log

Thanks,
Christian=

