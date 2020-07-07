Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F5A218042
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1426E86A;
	Wed,  8 Jul 2020 07:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE166E212
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 16:37:37 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id x8so16065152plm.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tpEtStuuUNWaWcekpXbmRCYVDWUKEoN9UQEytlQoMNA=;
 b=QWRbvYtevNLOJmeGxBSDFY/eZo0dxB88Fw+NOjvbcuLjnb2aN8bcstBwmsWGU2QmT3
 bUIa+giaNRn/VH7kWiLSlRL8mgf53PrGeb60Sv0ItMCtzgI0iA6rMAD1lVELGSk8sb+O
 IerbrlsJ7wtoXca1DWg6hoGaR/fRhF3IsU3AioBIz7XCwp2rJ4uvdcUtw+ta4/GdpbOm
 k4HAltctMITLK/M/Iv+aF4VgWr3ft2YJrwRpZ9mN0DTZd/HmhPU26VBTpfEkcs/EroYf
 WpwkBjc7P/BRwmptWey+3u3JYXZh0z42Ep4hHXa3X4MYwynXAmzN0uKgyg7L5blw6XfS
 0Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tpEtStuuUNWaWcekpXbmRCYVDWUKEoN9UQEytlQoMNA=;
 b=WY5Ocz/5sl65nxylC5QfKD+EedbvFwOHRki0APJA8LjjRV6ecnqJOsZLpO81otDTvl
 63EiXqfkCYG807FvXQPy9CG/5zsQejIutdo9zEnM5LFIC+DTOiu3oCh/pT9WfVRDSu4M
 rvVk0vFjfWDsKDiz8gB5pbKmszHLGg/05z57F/qbtmkj8XC8pIRARWpSjRPzOTM6tLwk
 e0JFd5kWIdFAFUtw3stOmjna0pwS7t2Tdlr0sHtm7TAJ3PuovKwj08jiPFsD1Vsb4Gft
 XhrcxtFBJ10P+22e8GoqAvt2tyUAW0Wit4VqEJmh6JM3iXESjwuZfJYaSVeiU9aFKWe0
 xeyg==
X-Gm-Message-State: AOAM531E5Rxnte0NSB8Mc8XodhBx1i8DNt+QIUz5bky9lANBfRs6oONA
 9n+Z9RIzOdr4OJUlJINuyZ0=
X-Google-Smtp-Source: ABdhPJyKNjCHH0BDQw7FOxBdvPceKxDKXyVEYqxXgLDCOvH4AHh3me2dvG8A5G8TgIJzbm7tZKXHOQ==
X-Received: by 2002:a17:90b:388d:: with SMTP id
 mu13mr5007252pjb.187.1594139856893; 
 Tue, 07 Jul 2020 09:37:36 -0700 (PDT)
Received: from blackclown ([103.88.82.137])
 by smtp.gmail.com with ESMTPSA id q1sm23990690pfk.132.2020.07.07.09.37.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jul 2020 09:37:35 -0700 (PDT)
Date: Tue, 7 Jul 2020 22:07:21 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 4/4] drm: fb-helper: Convert logging to drm_* functions.
Message-ID: <0d37c7a614eb0885f0f0bed18e48a4d26b345a8e.1594136880.git.usuraj35@gmail.com>
References: <cover.1594136880.git.usuraj35@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1594136880.git.usuraj35@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2033934031=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2033934031==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Change logging information from dev_info() to drm_info().

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helpe=
r.c
index 5609e164805f..88146f7245c5 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1819,7 +1819,7 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_=
fb_helper *fb_helper,
 	if (ret < 0)
 		return ret;
=20
-	dev_info(dev->dev, "fb%d: %s frame buffer device\n",
+	drm_info(dev, "fb%d: %s frame buffer device\n",
 		 info->node, info->fix.id);
=20
 	mutex_lock(&kernel_fb_helper_lock);
--=20
2.17.1


--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8EpMEACgkQ+gRsbIfe
745CqhAAm5+jRz2BryGJAhQ63JjwoV23MMrHqFbdj/ZFEvf/ZHfS/f1byk7GNGng
geCq6RU5c4bzNhMTYMHcsk4A5RnY81v4Yi2HJQBlroPJW+j4lrQu7QGVot/0YUJc
SxL/WXNhkZz8tDt+IaWPSEuQGIR+u91Or0sMqJDS07qbmRc4tG9C8IWHdOVUV6fB
+9SJpq0OHj8BCEW7P4RPJe9kW0TSDpAQ6OMSIujzBlEQUYtdDIn1xOG6w1T0w9Ev
j6ltqMuuFhO+XTFTZSSQ3in/sL76/SwJcO5vS7YvhEWsXR6yJf60hRtviCosikgr
jiAjJNxX3VQdSM5rA4rlib9FKYD4tmOocNs+tGQ23rW597BfA4RfihYpgym0pTrt
tVoJV7M4W2NP3Js2uFljX7sfJSL/SMRtl0608KFzLH+3flop/RRsPDbMicbwpkbo
ekZYaNF7Bu4Atbd3G7yikBnPRg2h3HI1ZVKrl+kVgkForjCn5lvlEJgMWHQe73Po
8bK1a7bFdYJ9j9cMxiLkdFIQNBtVMuBYeLwcJIZymzMoNkT0CqgQaY8YH4lz2pMH
IL+cY3wIWdWIoXdpHNlSi0eTZxRd1D4SaqVuT/qtnIZfSXYErBeA/UjuoLBOpyN5
5MgWkGZejTCYt3eiMJNNWIuqnbAI/kIv3zH0wppbJF2A5kAKRng=
=P6hX
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--

--===============2033934031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2033934031==--
