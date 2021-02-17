Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E1731DA44
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 14:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302D46E0F4;
	Wed, 17 Feb 2021 13:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9876E0F4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 13:23:13 +0000 (UTC)
Date: Wed, 17 Feb 2021 13:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1613568190;
 bh=kihUeknw7T3cBMLdji0A3QX3xelfw0VfedYTqbAucZw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=qxAOlepGHO1QIZ0m4ucWRvCBzFopBiN7XtvMYErWQZlNAQ89Zy3YhJoXj4eKujNJ3
 gdWC+bGpjgKhxJEmFzPM8pDv0+o53/t31rWdM+yGsV3LV1uhdS83RewrUMRmModm7C
 r/2MQgFYIGx/MLulhRAUh7iQ/8+rJKZCgxhS709gcEMikmRJ6DHrz7mICJ/z12Odt6
 w1irnflwwPV/E1Fouk5CYP+R9JV5B07ZaOz1FarwHfUUgt41DH5+ySqIUT1e6VsfcF
 rDwT96ApM8okFXdP1alFL9jCRwe4XVvFTvESHSoKqBIKPvFYucgLLCkTtSbd8CweEa
 YQadmcJ7HWeMA==
To: Deepak Rawat <drawat.floss@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Message-ID: <RTH7ReroyaiuwV4na7jvXgaUVHZydoksEf6N1fD_5baGD33auW8TAqtfhOE9WquzDFooXhdGQLZfd5CxgIDRbq7OoM67dtutwHp1SrNRLVA=@emersion.fr>
In-Reply-To: <20210216003959.802492-1-drawat.floss@gmail.com>
References: <20210216003959.802492-1-drawat.floss@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: linux-hyperv@vger.kernel.org, Wei Hu <weh@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, February 16th, 2021 at 1:39 AM, Deepak Rawat <drawat.floss@gmail.com> wrote:

> +static int hyperv_conn_init(struct hyperv_drm_device *hv)
> +{
> +	drm_connector_helper_add(&hv->connector, &hyperv_connector_helper_funcs);
> +	return drm_connector_init(&hv->dev, &hv->connector,
> +				  &hyperv_connector_funcs,
> +				  DRM_MODE_CONNECTOR_VGA);
> +}

Nit: shouldn't this be DRM_MODE_CONNECTOR_Virtual?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
