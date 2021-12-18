Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7262D479BBE
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 17:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3CF112CBB;
	Sat, 18 Dec 2021 16:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3327112CBB
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 16:23:08 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id u22so8326259lju.7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 08:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gWn22fXOuEnn2iUrKfi6JSwo3KZCMItgt+VDCxqYlDk=;
 b=pN3l/7YvdgFNcwD45Yo6TXFyHaOyeJJL3JkPfyo8yoyxjmjVZtLZ/xktMrXVZg8KDt
 EkKRN0BWOiG6pH3wvxkIgiBJ1kSmpi+DioWWciADXk3cWcGtmSzDfyDSd4U0KiBhLEEm
 5pZMimjgsmDYuirWXaq50sVSElQBFlJfZ3NykrblylQRWklSiga6HAxLjy5T9YGEl0z4
 ssUzgqNwx6kfaR+d3r/F6Quv6XUBVLLX8jzKq5CMbw6YKOTFb0kPe4X/mVcT4at+uO45
 05/Qru6ZgobaWNGKyW04dYgqp2Sg9z4ho64C9WQJWZQ3ZQmz4oo7wWnLclpOZ+Rj0KUK
 +bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gWn22fXOuEnn2iUrKfi6JSwo3KZCMItgt+VDCxqYlDk=;
 b=TXDzYADJVdg9PoKtVYyGQNoL8Ld8mxc52LaUFQZpmlOO+IVKII5VM1Vy8PxtcccHyN
 sVxsc8yPnshAp6DvjDgTiAIDupVQIYQkHCyWyIscZRbCVV/l/xtp0Tt97kp38ArRr/Dx
 MWNO+1GT77DNULP1PZ/IWam/EpjbB3WR7NNu7YaomvWR9DJTDZ+CX41T2H4kW/dS3WdF
 PGDdlCCunCc6KZbxqPvN0XIpx6QlXUKGP+Rg9D8jOmn2+JtXnMqUtr2gkb9atRSTHl6a
 wKnUYuSPG1mjsDg95HITQJdr0uawLd6486PC//iXfneo5iqN4rRwVmyCV6X/cCszXMDN
 h0ag==
X-Gm-Message-State: AOAM530NsbWFTAf83JUIvJ+z12KsofpJtcxbXSBtLugzlGHnZceuhWRz
 1sr+wxZtXXyzcsOga7BHWxj794euO3+CSqPKSf8=
X-Google-Smtp-Source: ABdhPJyFW9Kv72POB0bPetSFC6QouzNIO3fGbjtAnjFYUOgKPEIuIsMfCdYLvXI50S9Em4ITBQQUIYWx/IvGmlwpjbs=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr7633896ljj.395.1639844586800; 
 Sat, 18 Dec 2021 08:23:06 -0800 (PST)
MIME-Version: 1.0
References: <20211215113204.GA14552@kili>
In-Reply-To: <20211215113204.GA14552@kili>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Sun, 19 Dec 2021 00:22:49 +0800
Message-ID: <CAFPSGXYktJNsGpeiE_ZfeyUUMNB99sREmCF-kTXkCuEunornsw@mail.gmail.com>
Subject: Re: [bug report] drm/sprd: add Unisoc's drm kms master
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Dan,
Thank you for your notice. I have received it. I will be fix it later.

Best wishes

Dan Carpenter <dan.carpenter@oracle.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=881=
5=E6=97=A5=E5=91=A8=E4=B8=89 19:32=E5=86=99=E9=81=93=EF=BC=9A
>
> Hello Kevin Tang,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch 43531edd53f0: "drm/sprd: add Unisoc's drm kms master" from
> Dec 7, 2021, leads to the following Smatch complaint:
>
>     drivers/gpu/drm/sprd/sprd_drm.c:158 sprd_drm_shutdown()
>     error: we previously assumed 'drm' could be null (see line 157)
>
> drivers/gpu/drm/sprd/sprd_drm.c
>    153        static void sprd_drm_shutdown(struct platform_device *pdev)
>    154        {
>    155                struct drm_device *drm =3D platform_get_drvdata(pde=
v);
>    156
>    157                if (!drm) {
>                           ^^^^
> "drm" is NULL
>
>    158                        drm_warn(drm, "drm device is not available,=
 no shutdown\n");
>                                        ^^^
> This dereferences it.  drm is set in bind().
>
>    159                        return;
>    160                }
>    161
>    162                drm_atomic_helper_shutdown(drm);
>    163        }
>
> regards,
> dan carpenter
