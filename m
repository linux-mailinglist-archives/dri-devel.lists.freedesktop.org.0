Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E90A76530
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 13:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EEC10E3DF;
	Mon, 31 Mar 2025 11:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="U2/7PLMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2C510E3DF
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1743421837; x=1744026637; i=markus.elfring@web.de;
 bh=TVPznMmgvtOTQGHG9dQFnDWblNXq5SWHs7cRlxqIIBU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=U2/7PLMNWMiVZLnqu+F2Sf/pnzUEuI7Geuuw0K9YAlHpoyQRIqyqo5ZC4k5DFYOX
 nM3Y8O0VwdZ5dtX05bDLYZK2CBu2VwFcub6Eph7hlvBft/Y7gbNzcsW5BmOrNMfk8
 zrVxX6bLoUxdCni83DiC9mK6v/6lrAdGG5ucfkc83lyJ3V2UvzX1y3hsNHr78Q8W0
 we0kLgj1v/V07SyzigLAXj2cvR+c8vesal0C8Db60xgtXR5in4ThQ4JTqWKzBW9cY
 a97Dn+C55XjxsTQE0uHKhtT2gE5iCWd9uGExq3pU3dv3j4OvFuhdw1iP9Jse8UATq
 WnQrbw+CZt37Pxsd3w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Ma0Pm-1teRhJ1r6q-00LO3i; Mon, 31
 Mar 2025 13:50:37 +0200
Message-ID: <1ec61529-09f2-44d8-9324-b94da82158c4@web.de>
Date: Mon, 31 Mar 2025 13:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Daniel Thompson
 <danielt@kernel.org>, Daniel Thompson <daniel@riscstar.com>,
 Helge Deller <deller@gmx.de>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>
References: <20250331091245.6668-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] backlight: qcom-wled: Add NULL check in the wled_configure
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250331091245.6668-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7SsMn2wJgXRiuoievwieoWQ0ugNrKUFxHLUISgQYGEL/GdYBhn2
 K7mDW8JkYzDHDMR4tahn4hOeh3vuMGcWYhK5N15fPjf8jk9jHVjXHNbwO6lzen945JMJhUi
 Xt7Wz1zwYCzSQthYpiEfOro20w6QF36Z6i9RPc68m9mRNF8nLhokA2ye0A/bNmf+IPBnKZV
 BsSCJ4DfntREhAwDNyRzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TX2hSyP+jTg=;di9CvYZZ/LcOKQJzTwOxYTaVrj7
 H5cwQX0UaVtv0z0YCQwTciZbUxOF8z/ej01KbQFdZ42CU45JdS3yq8NOVi9BJsu8qLda6kwVT
 +AW5eC3GtUqB8THB4qA3XADVz0GPs/+tB/NX4W9GNee4nPodH3CNGQRqDPKdp05clgRQPTR0d
 FXME1sWL8Muzo1+kiuTYr+sqhfOuWOsVj7ZWGRO6P7eqsj/CKQFNJ6t9PLq0OJSsr+9jXls0Z
 csAJsxEqM67AnuPKe5mJ6Jjq2NA72Ta8vKnxe2hFUCFpLwUZbtEGMaZTNekxOAexCheHEbtRw
 KWLnQysIXesHiP6A7yGFV38aDUmtXAlrabGTUWGkWBKJEBvQj4lfRITsR3rZTds5XdCuG6MtV
 VcrFUZKakY5gPTv85sn/x3HhXIbp/EVlx9xvfiCW4kNd7UzPF1D4oGRCjBh5VcfdOq4Le3XJT
 XnJrxeyMy7Ro76msigt27AOS+wEbSdIDpR3r/NuUbJjzE8J2KapfN8+pQyA+lj+WS/Z+Hck15
 nYx8Wmdr3LJGCfe07gnpFqVPtGzqIVkAEmmRsNA5Fpjg2rHuqfhji1NJUmti9VQb94igPWmW+
 nWis8EGwkSsdhPSUKw9a6LlC09vYdTx9ddejYB9xydDnWMOZWGQfBfGrSZTTOKJdAUs+49GFY
 0j8WdS1MZMJ1rJ8sOs43W4ytdF3CHAIb/zb5Kj6/uirOl3Igwt+5tKTPLih4hNjBdWblALz4B
 cIh0X6vvwDMaaKQVWFq+VWYWy1CLupDI9Wr2PIE8KU3OHN0aoOvpcBj0W0fIMmMWnlfs/cDhj
 0D6a7IEVNRH8AewjgDxDw7R14h5DyV6Ur96c7DvP0yuLUf3FSvE/1ULtDg7adlxnHlTEjqFD4
 O0AVxzTpu8X5huFeCwNPo1DJG5CTrawWaj3RpXwx20AgvkMXULrIQFqZs2Ro+Q8ME7e3fDPfQ
 B5N9ZtDwpC5l+E/J+485YQmJdSlxJ+rkNoKXqePhQC3dpl6LpS2XG6mWiwcjNE6dYQdwwGuSu
 MaLvadAuU7KJOVdkmwOT4lpTOmgjbPHJngWf/r4hiorGY3qZ4oRFeJK7Kw/5H7oSV+WLxjfkz
 yCoH0i7HsB4xBYVeh8Vumz/aiBUYP5zNkbwOKTaq/v737QBzBTzzvUITXpDtOBrx79z+e+ELC
 q0DZX2rvV/7HnshQv6RrJy84ljqY8Y1CgQ8BCJWiifgODchmda7YkvoMzCzyIAy2OGbaZfjEK
 SAp/cAlnok2pf2Q02AGk4irOFClvLqCP+BJV9ZcolqG5lQXFahLFtBiTxEPIoe8RxVNUlhBKG
 vrjwleLbEVLhRWWuv1MC74uycJK7Jb9M4V6W/nA57Y5AmjK1y9asEhgPf14tZnEQKm0fNwOHs
 AIxXSDloN7lR0CaNgYuatQ9ZcCBBkfcUCUeVX03pN4x/oIU1weR3zebgnDc0PkwvxCTIbXOeb
 eS07o3LzjXH8Y3HHfqy5sO/1nrY1RB/ou7dNBcWz6HzS/UVwZuJR7ZOjvsc4MZI3nRvVDMg==
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

> When devm_kasprintf() fails, it returns a NULL pointer. However, this re=
turn value is not properly checked in the function wled_configure.
>
> A NULL check should be added after the devm_kasprintf call to prevent po=
tential NULL pointer dereference error.

* Please adhere to word wrapping preferences around 75 characters per text=
 line.

* How do you think about to choose the imperative mood for an improved cha=
nge description?
  https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n94


=E2=80=A6
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1406,8 +1406,14 @@ static int wled_configure(struct wled *wled)
>  	wled->ctrl_addr =3D be32_to_cpu(*prop_addr);
>
>  	rc =3D of_property_read_string(dev->of_node, "label", &wled->name);
> -	if (rc)
> +	if (rc) {
>  		wled->name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node)=
;
> +		if (!wled->name) {
> +			dev_err(dev, "Failed to allocate memory for wled name\n");
> +			return -ENOMEM;
> +		}
> +	}
=E2=80=A6

An extra error messages for a failed memory allocation may occasionally be=
 omitted.

Regards,
Markus
