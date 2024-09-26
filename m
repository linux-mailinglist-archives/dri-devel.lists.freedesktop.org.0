Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5B9877B0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 18:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3235C10E07B;
	Thu, 26 Sep 2024 16:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="qBT3MSKZ";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="oG8IJdF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F2010E07B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 16:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727368722; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=HeLMFYRphIDQlLQy6w2FvAApBjHkLUZ7+12c9rb2mecFbtVDDPXJ0+9/wqCqSut0xk
 Vp7sOKlOrfPIu0BGSrwjhnfEW0C6zcHVOQN3Jh3HFLy8wh186Lc616QAaB+dNC6hPkbT
 QikhNkqNTkpoKtg8RidcUDyq0pQuGol0AXm7RIWGV4RUdtwKb1hXPgKl9LHdV5p/EB/A
 nhu3FFVrzgZMmYHYWyPFMnR9wzKPOAcPjJUZ3+qoHgiyRTYAbYa3dVUBqFFbDW3YR+yZ
 aL2HK9dLy1bDqy3L6c1g1Hb4yPS53leiux1pmePOZ0V+c6u0hbDxkUiDnLKmnvN5c5L9
 OY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727368722;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=t11H1dkaMkjymrzmv5CzFdAP4jjnNkRjUxD6o2bN2D4=;
 b=Mhqbae7yylHoDbReJ5fEAjSC5z7FXzG9solm8qFu/RVx9OzepbgdStTaJXjD+aD9Jk
 nnR3/27PxzW8/FqewUaahjXfl3dLnUHwZc5/7xVPbM5p+31t66cDD0BkwtRAcCO0GJwe
 ChH8FgMWAVQn5Y3UrNChH3oMQkK9qsmTnkvzEpX9vTx+zdNB1MRBEroaXFKlU0DTWLvG
 CN5SKjr7NSiOGP2dvySHysT3Qm+6sAv/DBFOkh2sx+uSeWkWRLqV7NFB2+LOH1eATmoQ
 e6d2zYl8XQMa9ye3gwg5dCHRYcooBvtgbHQvLuv26xYXywCja5GZCwKMNSoSTyOUVIwU
 NgaQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727368722;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=t11H1dkaMkjymrzmv5CzFdAP4jjnNkRjUxD6o2bN2D4=;
 b=qBT3MSKZWabggzMwT1V2H9bF8c/4DddjMeulrWPaUGyo1f2/brP9aVRccBbZjrFiau
 reQQGGu9GyWo3/wrg/nJDkqOO/2lQnemwSZcoe50iWkvGASBd2eUH5QWJxlszVWRsk4X
 0uU1PA0cfiPdPan+3x4W9z1/9/6hNijmRT0y82pYdDy2Qh1baUIVN+UMSuVUggQ8XhzH
 XG8guuJmbMRbBwauF48T9I0oO8FjVZJch0JpLxovb9/d7pleHLagfGG3j9R8xROYcEIS
 6broYoUDaZ36fAx8neauw+MwY9b4O0sl0h5EPbVgp8OyLcD7yGJUgeNfEA/U3IwXxrRu
 Hw7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727368722;
 s=strato-dkim-0003; d=xenosoft.de;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=t11H1dkaMkjymrzmv5CzFdAP4jjnNkRjUxD6o2bN2D4=;
 b=oG8IJdF119/bV762tYvvggF7NOADrr9JklNpmjpzq7te/FMfJYRqpgo4YUxz6K+Gyv
 +4NSzo2g64q6CCTsdFBw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7Vpizs3/MAXVWJADp16jJvHbemLv1Yx3Y4xLa/so="
Received: from smtpclient.apple by smtp.strato.de (RZmta 51.2.8 AUTH)
 with ESMTPSA id e0da1a08QGcgJn1
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 26 Sep 2024 18:38:42 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <CADnq5_MM6UYOwFSPkZRauAyckFaUjCRGT97cVhsK=xZ9CzuXVw@mail.gmail.com>
Date: Thu, 26 Sep 2024 18:38:31 +0200
Cc: Maling list DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 hypexed@yahoo.com.au
Message-Id: <396DA24A-85A6-419B-8E90-9A05EF608C41@xenosoft.de>
References: <CADnq5_MM6UYOwFSPkZRauAyckFaUjCRGT97cVhsK=xZ9CzuXVw@mail.gmail.com>
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

On 26 September 2024 at 5:50pm, Alex Deucher wrote:

Can you attach your dmesg output?  There was a regression in the dma
subsystem what was fixed by this commit:

commit b348b6d17fd1d5d89b86db602f02be
a54a754bd8
Author: Leon Romanovsky <leon@kernel.org>
Date:   Sun Sep 22 21:09:48 2024 +0300

   dma-mapping: report unlimited DMA addressing in IOMMU DMA path

Alex

=E2=80=94=E2=80=94=E2=80=94-

Hello Alex,

This issue is gone.=20

Thanks for the information,

Christian=

