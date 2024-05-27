Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9378CFD5F
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D29D10F9DC;
	Mon, 27 May 2024 09:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="GZjfPuYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B186E10F9DC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1716803136; x=1717407936; i=markus.elfring@web.de;
 bh=b0hWRCQXVgCjXUi18BLPuJgUdQMZo6dOE/TxIyOa5qE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=GZjfPuYJWaALaaTQHYbcyIs00O6+Ji7r6Sx+7MHU7QwP/199r8reePOjg2nXJ9sV
 qsAHcxbKcEZuPo6NJRnjRQZUaSL11hHJ3zWh08BHZYV6qMzhY8dtvvzOozzo5oDjv
 5iiX9ZApyBvvehaD2femcX33EsUUMtcIMj7/9zS4xT7ZcNtgFSUrsKyuJfmEGxypZ
 NziUfLAh/+YKOeX+Cfm+JRDQU5O8ElpCBUawx1f2/EXFRhmhU+RX5hYE87/iW9D7r
 +JZSA8Tj3ycm+jdpOzDIUDz15wQE8a3U0g4aNs3bCc7WAOHClAxHijT2V3YEE2D49
 HnJ0HjpDBdKonqu92Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MODmV-1rrvjK41IP-00U476; Mon, 27
 May 2024 11:45:36 +0200
Message-ID: <568162b8-563e-4ec7-8f31-bd16f329b245@web.de>
Date: Mon, 27 May 2024 11:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/loongson: Add dummy gpu driver as a
 subcomponent
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240526195826.109008-1-sui.jingfeng@linux.dev>
 <20240526195826.109008-4-sui.jingfeng@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240526195826.109008-4-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QBWQBXE9g1+Sf2ppixiXzVQP3Rkay7qyHC4DgAIEj4DyWUs46yv
 wOIsyoWViQeITi8HOTwcOdse/1pCAu1/TbBlr7O+Ytl95ibvCbyJuYZ6VucOGA8qMmcqJeM
 GhsHUC3ej/dQQJu+/zwqtRlOT5OlSmlrbdR5hHbnoHO8p1Mnh2mM1FHgp1LjN3pqPtt7Dxg
 zrq1vYLhsdm2eAEC+2J2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NYLnz5L0av4=;5CfIPCZ4HKcxCI2iE3OBU+9r8Bt
 w5qKMdMZfB67NYxwP5F1YmER+TqhJqLpK6o3i50no16Ges0MRsRcxMC3HUhKeMiqgrnmZSHkk
 fHzHpaEk6Cr0yXYSuRgdicvOer7cIAJW91+8rgiQPqX0Ary0ci/LAHwxIllS5Z3NO/s2CufuP
 0iv4MwA2Uw4uFRU7az5H/dvVzI6MHe11dQ82PCD8ltsJuZ1wDAwdDapX4oALNzDrEuMrBWkvd
 uHi8d7AYgEwcmssD07f9MiiHUFwgcTb0iZ+ZI2eglFxqGR3UGAtUn3SBRy81Sy7+XYrPlZY6r
 w+n5GD+ZgiAS1f85rq/ABDBRdn2sIzIKebfQIEzmr6SHqX3n0HcD5izWZxne4MXNxDw8KqMIt
 0OS7gfL4nirEwf2ElcWKV5uPDgbpkHa530WofBRh+CSbcVqMTYAR+ljji8eWJ1atLmuz/fwza
 FWZtQUw3uikcg/Xd+05b5B+wO+9RKDg7/nz4umi1z1CL3MVm+bLZwGyy1rabDzGx6UwWWWp0A
 Euau3irXtpGFPwACV/ApUq/uqdljH+YyaBmmzRnNIfCOxHQe5RnQeqaUpyY/Qff31A/KWR1Ft
 LD1R2h7W4ApeREWynbYTfQGdck9Yo/aEUOskFLPLRO9dDliETE+4X3yMrrh0IYDGnHGVuQ4FI
 UJ97DTe2CbktgSf1nLFfh7jjhTDbx7chHyZrY1AtFN3r5VRf5DkuQCJifHnFW9Bc8sIqrYwTd
 Bd44se47iXPe/+dANwGYsL+/lb0C90+TpNG616vpjOD97T3DZMa0RUF9d78aJfahQeo0xWwnk
 71koy2ilJNryfj+61v34WbPNAM5lMEwA8Ozl77HYetsO8=
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

=E2=80=A6
> loose coupling, but still be able to works togather to provide a unified

  use loose?          should?          work together?            an?


=E2=80=A6
> Add a dummy driver for the GPU, it functional as a subcomponent as well.

                                     is?


Please improve your change descriptions considerably.


=E2=80=A6
> +++ b/drivers/gpu/drm/loongson/loongson_module.c
> @@ -29,8 +29,15 @@ static int __init loongson_module_init(void)
>  	if (ret)
>  		return ret;
>
> +	ret =3D pci_register_driver(&loong_gpu_pci_driver);
> +	if (ret) {
> +		platform_driver_unregister(&lsdc_output_port_platform_driver);
> +		return ret;
> +	}
> +
>  	ret =3D pci_register_driver(&lsdc_pci_driver);
>  	if (ret) {
> +		pci_unregister_driver(&loong_gpu_pci_driver);
>  		platform_driver_unregister(&lsdc_output_port_platform_driver);
>  		return ret;
>  	}

How do you think about to use another goto chain for common exception hand=
ling?
https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+go=
to+chain+when+leaving+a+function+on+error+when+using+and+releasing+resourc=
es

Would you become interested in the application of scope-based resource man=
agement here?


> @@ -43,6 +50,8 @@ static void __exit loongson_module_exit(void)
>  {
>  	pci_unregister_driver(&lsdc_pci_driver);
>
> +	pci_unregister_driver(&loong_gpu_pci_driver);
> +
>  	platform_driver_unregister(&lsdc_output_port_platform_driver);
>  }

I suggest to avoid blank lines for this function implementation.

Regards,
Markus
