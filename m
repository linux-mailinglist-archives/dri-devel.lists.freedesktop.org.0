Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E0062C4E2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 17:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C448A10E4E0;
	Wed, 16 Nov 2022 16:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E9A10E4DB
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 16:41:02 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4NC81p1MxPzDqQJ;
 Wed, 16 Nov 2022 16:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1668616862; bh=hwhPxQ+N1GwIenXL4LAvTaCUbrrAaZZZ+q6uX0DHLfk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q9VOp6b9Mrelqx0RspqzvQaKoU81Ct3cDxxmatVieJPO07z95DCf6GVJPBC0Qt0yN
 vBiPUuq9oI1BE8xKe60OcBr6qZOl96m1woW+EyPXiZnhpOTghfogGYrbfRsCoH3YO4
 NgBmn/IxgMBeI9QCv8d3nnNa7OG4snCsz41PQedg=
X-Riseup-User-ID: FCBC604DC51F9033169ABE60C7640C2114AFDA2A148F26F3D6C452C39808535C
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4NC81m0VNPz1xx2;
 Wed, 16 Nov 2022 16:40:59 +0000 (UTC)
Message-ID: <0a1c18d7-21d0-2070-866c-65c4d8080289@riseup.net>
Date: Wed, 16 Nov 2022 13:40:56 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm/tests: client: Remove extra blank lines
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221116151833.1679379-1-maxime@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20221116151833.1679379-1-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 11/16/22 12:18, Maxime Ripard wrote:
> Some extra blank lines slipped through, remove them.
> 
> Fixes: 8fc0380f6ba7 ("drm/client: Add some tests for drm_connector_pick_cmdline_mode()")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> index 558c098b0384..362a5fbd82f5 100644
> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> @@ -53,7 +53,6 @@ static int drm_client_modeset_test_init(struct kunit *test)
>  	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_helper_funcs);
>  
>  	return 0;
> -
>  }
>  
>  static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
> @@ -85,7 +84,6 @@ static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
>  	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
>  }
>  
> -
>  static struct kunit_case drm_test_pick_cmdline_tests[] = {
>  	KUNIT_CASE(drm_test_pick_cmdline_res_1920_1080_60),
>  	{}
