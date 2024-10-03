Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16E998E93D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 06:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F7210E141;
	Thu,  3 Oct 2024 04:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="TgsjA3bS";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="aOB85KKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB6610E141
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 04:58:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727931440; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=pRKAbmJz4NNmb6lgSF+3VhXm1I3kNUN5HQO+T/HvZgaKgPC+0C41risYjTo734mm2X
 mSrO/ViSt6+1Q6wCc/I7EZPgbTven8yQC6O/CPoHLX0Tder81nyk7t2kEo9CgDGNGPN+
 rF29Yd6vKvreGzzVqkY1uVbUIMdOUcGIoJ92GkkqE8L89Irdd7o3gWcx/Pjqd9+J550a
 43hwtMSo8nX+2EWS2UTxdjhSyUCWQw2oehqvk7DaYVFm0tM/u4YoPPn/WYCc9eL32xSV
 JSwNfxZmzDoRy3wGdl5ICI0FGGSb31UO+LPrtz096xIF5MrhiZ9faTp1JnsZ3IMupNVQ
 2tCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727931440;
 s=strato-dkim-0002; d=strato.com;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=l8tXRBXvq41KufaBrKD82QFLwhAfyIDLTI0IxsQBBBw=;
 b=oGaPXTlQxAQ+BWByRVkf2XWz/Fki+tSPt4jxPo5T0vYMmEvtbhKdarZl8Y5aUB/713
 53NFWhUna1iy7ZNheZPzVZUmvF60zhzZXPsL94o6Tm2MoJjwBe5CBbvZlz3zf6WFo3uG
 RyP7ZTYJa8NVj65xtihKXizf7bnsdHXzJUOdQC0VyuW/CCfjU9Iv8IISdSndb5P8wxg7
 zcIId/37dIOAyadwDYadVWxTA6kKu4p8oCNBDSOlsFtpvUbJmaK9IBdLhZfovyexHVxE
 Cbzln7jW9cHQyM5cZIrFxAawXCV8XFWmANK61Im4mb2Vt7hTFw76JDn2Gd7tCzQ35veG
 acGw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727931440;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=l8tXRBXvq41KufaBrKD82QFLwhAfyIDLTI0IxsQBBBw=;
 b=TgsjA3bSyXahREKbnk822n+dOa7HnbM6e0epgpYw+KD35VC/5xJvbMlCnQdXxAoYUY
 vZZaYSISb+5sLVJbRfsf+k89yG+am7RK2f73QtN97K/YLWk6NZfIQttH0+qPeRV5qShM
 4DZONs3gl+xuW9m9CQpLymqpHEpAzQ3rMQGgUao9II/gGnKlWuv4YSfqZ8pnf3aJ3Z9G
 n9n8LpBUC5uu0dhMcVarWmcWEIboeQbpB4FIkW5AJ4CzZt27rFeTtj3MaC4+dAZnQWtW
 tLDZBabr4JSbYBZFmI/4jtQ+8+f5bwnJH0iuszj/8GCvQ845g/HCeaJUrKekXe4oyXoX
 4Exw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727931440;
 s=strato-dkim-0003; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=l8tXRBXvq41KufaBrKD82QFLwhAfyIDLTI0IxsQBBBw=;
 b=aOB85KKRXobXBhx1VKHrUp9bS0d7IvOGR1YTAt7pH/kweX437ZU/ZqJ63HG4j0rbNg
 Z8gye9AMfp4ThVccZMCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7Vpi0syjFWi9m9O3sgA3QTEOTx6CJ56Dq+2Tx0kA="
Received: from smtpclient.apple by smtp.strato.de (RZmta 51.2.8 AUTH)
 with ESMTPSA id e0da1a0934vKbnE
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 3 Oct 2024 06:57:20 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
Date: Thu, 3 Oct 2024 06:57:09 +0200
Message-Id: <F25FEC33-B662-43B0-9BAC-99482CD8115C@xenosoft.de>
References: <CANyH0kD1Q8PvRaMkBr=0x7QHzkUFheaMfL5LVeDaaj3FrBm5XA@mail.gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexdeucher@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 developers DRI <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <CANyH0kD1Q8PvRaMkBr=0x7QHzkUFheaMfL5LVeDaaj3FrBm5XA@mail.gmail.com>
To: Hoi Pok Wu <wuhoipok@gmail.com>
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

On 02 October 2024 at 3:43pm, Hoi Pok Wu <wuhoipok@gmail.com> wrote:

=EF=BB=BFThanks to Christophe.
I have figured out what happened.
The connector is registered before the device,
where drm_connector_register() states that,
drm_dev_register() has to be called before it.

Assuming this is the fix, I will send the patch for testing soon.

- - -

Hi Hoi Pok Wu,

Many thanks for your help! I am looking forward to your patch.
I could try it out tomorrow.

Thanks,
Christian=

