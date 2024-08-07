Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709EA94A69E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 13:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC06410E4AA;
	Wed,  7 Aug 2024 11:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="W35P9PGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B3B10E4AA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 11:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1723028817; x=1723633617; i=markus.elfring@web.de;
 bh=P9f5JhF5QX/KW3GdX2o9fsJ93F1Bd6JEYTRl89FKqAY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=W35P9PGG7ZWsQVbLwamHBG09pan21IEfuFK68epnaQRuHGU/2ey8NCS2kVuw+2zZ
 iWAwZEhT3DaV0elKoyRaq/jlz56q2TyTtwFqLb77Atx0XJ1em/6KVwj2IGTsIwi2Q
 cU6LUlaCCsyUtPV3sqhq/friXBM5Hl+la/xe62C4I9tljjvaaNtBsZHS0mj6BQjPQ
 iv6Kw8aCx8VcVkcdqz8AM9iT2j8IMLqvrr3hbAHir1BhhzMYoVFpGqmE3lLa/lF4F
 SJT8NRYuAexkYkRX3Z23kSio4TBWG7n4cCvDnHAwOv6CwavqpdDeISaUWPlpq4eLa
 VUMc7aTMNN+Jzddh/g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2gkl-1se8HW264F-005YAy; Wed, 07
 Aug 2024 13:06:57 +0200
Message-ID: <d7b4ea8a-74c5-40db-bf11-f8345f570ef5@web.de>
Date: Wed, 7 Aug 2024 13:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, George Yang <George.Yang@amd.com>,
 king.tam@amd.com, Max Zhen <max.zhen@amd.com>, Min Ma <min.ma@amd.com>,
 Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 Sonal Santan <sonal.santan@amd.com>
References: <20240805173959.3181199-2-lizhi.hou@amd.com>
Subject: Re: [PATCH V2 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240805173959.3181199-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dPQzK6nuAq+WHCYIPbb7mHsmd1leSWJwLf5CRrW/N6LJYR8Tv6Z
 Xl5xwBc6meBYyFSOCT5fD6pyf2ucKvDEOuu/DhfWzq0RH8hzrL1gSJkhtXx2t4QcSEZaiID
 gwP7zPWI3zV5zacaXSQ/8iDjgx9fqlYdG+CNnD6s+hLAxQ/yHCCXMSsQkoHaL8kbERjcWHu
 26AdwifNcTgYBYcNsdD+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N+7wopy3sno=;JGL25eDSvLuu5NT7TWaBH5KpPUd
 ubtdRdc5AGfIhaH0oOWt+Rqzkp+Rg1Xt0D1IL9QoRiJoJRfj5bgU8dfNUZVCse2ZW3Ar3Z4qH
 4dSivU9hWzyMscmOXzdk9JX2L9bCvMk5mXmU+bafww358sa17u7Zc0xtOvoz/b8lIlwpIGfgd
 JlqGCC8Bb8JqDD8HstXPyqpVRABaXh5HHV5wIX/K9FFGR+rdzgfvMvrmcxDuK/ZIcxXelHqVy
 VsU59bRt7KJTU8j7kHTbusCFmPrT6nii7eP20YRKObT5EeY4oZG7JTl0avofJrpHIl99eRRVk
 ayN+V+lkuM6fnfwwbqBp9rpdxcMefWn1x3mBISMtmTsHR5vT23FErz4mIfJSNp0lk0NGmi+ev
 6Wu4EU5CJT/8LGAcVOOAeVrXbiX/6sTpQ8HyNxlmSwrtPSao08VY8Zcv0J/OfuPAfTiswJPve
 y17eckJl6nwsYJo2DRpx2uewszqRBmwisrbduhicUMFzr0gLMskZbmMU5iXQLScARSZMQvkaU
 bmAkwQ0LnEIDyHopfP4++Ugge7HlroC8c9ci80n6muQ6lYjkWp5tjulGvUjzKPqxww929k8iS
 XrwjUYgEyM+YJ5xwuO2D99l5yonQT55Je3wFDnv72j1riNX8ykM+zf9y+xt05nGbYyhTNX36r
 P0b/KGzzRffeal9CgDU82gtkvrMsq0qXYKaFn6lBftfBnwR8rqmPzRO1jn9ceZTKSIJwQhsZV
 o2dVA1qgYk/gQ71Rj9vdDUbcSCdcj41ScPZI6tDceEbf7N4luG56CYIz+Hu3HLj6l11MNh2J2
 XeN+8XdFEg30gBMYi6+J9WJw==
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

If you temporarily find the circumstances too challenging for applications
of scope-based resource management, I suggest to use the following stateme=
nts instead
(so that a bit of redundant code can be avoided).



=E2=80=A6
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -0,0 +1,182 @@
=E2=80=A6
> +static int aie2_init(struct amdxdna_dev *xdna)
> +{
=E2=80=A6
> +	release_firmware(fw);
> +	return 0;

	ret =3D 0;
	goto release_fw;

=E2=80=A6
> +release_fw:
> +	release_firmware(fw);
> +
> +	return ret;
> +}
=E2=80=A6


Otherwise (in case further collateral evolution will become more desirable=
):
=E2=80=A6
> +static int aie2_init(struct amdxdna_dev *xdna)
> +{
=E2=80=A6
> +	const struct firmware *fw;

I propose to take another software design option better into account.

* You may reduce the scope of such a local variable.

* How do you think about to use the attribute =E2=80=9C__free(firmware)=E2=
=80=9D?
  https://elixir.bootlin.com/linux/v6.11-rc2/source/include/linux/firmware=
.h#L214

=E2=80=A6
> +	ret =3D request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
=E2=80=A6


Regards,
Markus
