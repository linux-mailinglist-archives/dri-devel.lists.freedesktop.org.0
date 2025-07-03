Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8783FAF7EDC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 19:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED2A10E023;
	Thu,  3 Jul 2025 17:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=spasswolf@web.de header.b="iTG2J1Rz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Thu, 03 Jul 2025 17:29:02 UTC
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3FF10E023
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 17:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1751563741; x=1752168541; i=spasswolf@web.de;
 bh=S1io0LIVsFQHZEpdQUfLbvR5j6Xpu074sP9c1cVQpAc=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iTG2J1RzYzZxfONW9KlCOZhhLtzz2tskNeSaY41nqHYmn5YSYe23fGiU76Ts7/eQ
 aJzkO0MYWvZSrkvZ3NbwRigk7hPPxiDqYjT5d0E7RscdXy1kgFExXRnOUh5Lvhxa/
 xrnDJ6jnOTJtlBSNNnwhHZGxtral7hDppjGXjyTufAJobcxxqHLz26tfRUCRY4MJz
 4/kpbXNmMN1aM6Vq340fqPOC36VvkoAQitW7pTA5v60Ec2xBCZ0d3hcShEII8t+Tf
 pJmhdRH53t8N2pCv/6/IWr/1+ExoP8vXdeFU/Eg08Hy+SmkSD37q7shzNCU2Cni2Z
 UEEyDakB2XDOlEmAJw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1McIkg-1v7WoV3U8y-00jZlM; Thu, 03
 Jul 2025 19:23:11 +0200
Message-ID: <7a56d95dc2b15fa2dac0c8a4dd20f0e253bf414f.camel@web.de>
Subject: Re: Warnings in next-20250703 caused by commit 582111e630f5
From: Bert Karwatzki <spasswolf@web.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Anusha
 Srivatsa	 <asrivats@redhat.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org, spasswolf@web.de
Date: Thu, 03 Jul 2025 19:23:09 +0200
In-Reply-To: <75abf5c1-aa1a-4405-aae4-a2efccbc3bcb@suse.de>
References: <20250703115915.3096-1-spasswolf@web.de>
 <75abf5c1-aa1a-4405-aae4-a2efccbc3bcb@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iKUObCwBfbAmFtuOCtyqlyfhBxYF2qyp4/I2Cs7/tmJrOtEbGP3
 vE/jBK3FWrD7o3XJLlN3LwzE16yAFjwLEV8eEJQkuNDji0HKOdqHB8aFb1u05krkNMRIn4F
 XUDUofPf8G7JuuOpRGJw702VM4uPUDBjGvatWhD92RFge3UVXD1t6VuAYs+U4KNuzPYS24X
 TJB8C4SpKb9xm93knN3Uw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XAKJctW+jyQ=;BtUetsNS+Q5IM+Ah8zngdQDkrmh
 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
 iHlMCUz0hcWBtJcDtCAg==
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

Am Donnerstag, dem 03.07.2025 um 18:09 +0200 schrieb Thomas Zimmermann:
> Hi,
>=20
> before I give up on the issue, could you please test the attached patch?
>=20
> Best regards
> Thomas
>=20
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

I applied the patch on top of next-20250703

$ git log --oneline
18ee3ed3cb60 (HEAD -> drm_gem_object_handle_put) drm/amdgpu: Provide custo=
m framebuffer destroy function
8d6c58332c7a (tag: next-20250703, origin/master, origin/HEAD, master) Add =
linux-next specific files for 20250703

and it solves the issue for me (i.e. no warnings).

Bert Karwatzki
