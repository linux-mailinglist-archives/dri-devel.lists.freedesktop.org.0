Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4728AF8B2B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FEE10E352;
	Fri,  4 Jul 2025 08:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=spasswolf@web.de header.b="ZavIZXmt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AED10E352
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1751617292; x=1752222092; i=spasswolf@web.de;
 bh=C39CAOss3qy24guk6Pk9qdKydSinnm2BWkFOQLmwFfo=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZavIZXmtXg/FQFT2xteQmlrDagQY6+wbWgfzTrIR29yXI3q5V0k1VrC6rdj7IiEq
 QxBGGfUIuehUaaCKxw7UbgMVOvQQoxRJfl5COPQ4Jp236yJ5et71wAhGgjkFTesf0
 0Rfdl2+h+XVa2LsjI+HNKBzn6QDnO+cfYgzdcwk2vRlLB+zek7V7H8g+IXX/SXUvV
 OvMyRBmhKIvMePJ09k05y1jtFCB9M4iEGmEokbfUXU3ZMTyPTOt+T4iR1+J4vEmNG
 Ya8YtC0L2ctZUNO2BlGWW4f5Jr0pN7tIdsAbQvLYa0DlxEoByFg1lV58vMcMjqaC/
 Zm56//83dAMhAQnEhA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M9ISr-1ua5iW3alz-00DeQV; Fri, 04
 Jul 2025 10:21:31 +0200
Message-ID: <7be4f337df6f882ac53a47db851ae92d7a2d1dc0.camel@web.de>
Subject: Re: Warnings in next-20250703 caused by commit 582111e630f5
From: Bert Karwatzki <spasswolf@web.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Anusha
 Srivatsa	 <asrivats@redhat.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	stable@vger.kernel.org, spasswolf@web.de
Date: Fri, 04 Jul 2025 10:21:30 +0200
In-Reply-To: <c17428b3-6f04-4eb7-9140-92c7f27eae4f@suse.de>
References: <20250703115915.3096-1-spasswolf@web.de>
 <75abf5c1-aa1a-4405-aae4-a2efccbc3bcb@suse.de>
 <7a56d95dc2b15fa2dac0c8a4dd20f0e253bf414f.camel@web.de>
 <c17428b3-6f04-4eb7-9140-92c7f27eae4f@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HfCm/7Fv8dgkG6loGeHxqXFrpz+KpHQw0Z465EklLVw/e1uNhkc
 vXCMGkYddY6JUPyPiPH3se8uq5m//yXK6DestbiLP7drF3HmPBILrZdwx2uH3DFj61hY3T7
 +AA9IyMyvKKfSjDD04iqL30eOrP83LMHkwTvoSzlRD7+W0fxg7hx80iAcD0TCfEhAq8Z7Yt
 o6Wj3wOamoLkGxI0NxRcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TZ/o5+bl1dU=;LZcyToSejdtbsXI4+pyo5epAmVM
 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
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

Am Freitag, dem 04.07.2025 um 09:51 +0200 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 03.07.25 um 19:23 schrieb Bert Karwatzki:
> > Am Donnerstag, dem 03.07.2025 um 18:09 +0200 schrieb Thomas Zimmermann=
:
> > > Hi,
> > >=20
> > > before I give up on the issue, could you please test the attached pa=
tch?
> > >=20
> > > Best regards
> > > Thomas
> > >=20
> > >=20
> > > --
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Frankenstrasse 146, 90461 Nuernberg, Germany
> > > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > > HRB 36809 (AG Nuernberg)
> > I applied the patch on top of next-20250703
> >=20
> > $ git log --oneline
> > 18ee3ed3cb60 (HEAD -> drm_gem_object_handle_put) drm/amdgpu: Provide c=
ustom framebuffer destroy function
> > 8d6c58332c7a (tag: next-20250703, origin/master, origin/HEAD, master) =
Add linux-next specific files for 20250703
> >=20
> > and it solves the issue for me (i.e. no warnings).
>=20
> Great, thanks for testing. If nothing else, that's the minimal workaroun=
d.
>=20
> Here's another patch, which should solve the problem for all drivers.=20
> Could you please revert the old fix and apply the new one and test again=
?
>=20
> Best regards
> Thomas
>=20
>=20
> >=20
> > Bert Karwatzki

Applied your patch after reverting:

$ git log --oneline
f4e557e3ae37 (HEAD -> drm_gem_object_handle_put) drm/framebuffer: Acquire =
internal references on GEM handles
49f9aa27dc15 Revert "drm/amdgpu: Provide custom framebuffer destroy functi=
on"
18ee3ed3cb60 drm/amdgpu: Provide custom framebuffer destroy function
8d6c58332c7a (tag: next-20250703, origin/master, origin/HEAD, master) Add =
linux-next specific files for 20250703

again everything works without warning.

Bert Karwatzki
