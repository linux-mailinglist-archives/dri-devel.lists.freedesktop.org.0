Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E564B88A08B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B7210E2E8;
	Mon, 25 Mar 2024 12:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=g.clemson.edu header.i=@g.clemson.edu header.b="wHXIVkIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83F010E1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:58:01 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-60a0a54869bso34678627b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=g.clemson.edu; s=google; t=1711371480; x=1711976280;
 darn=lists.freedesktop.org; 
 h=mime-version:references:in-reply-to:message-id:date:subject:to:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eMQfXtIqVS/OIi7oM+IRMIhVPPKoKmf2XqobljSQq3U=;
 b=wHXIVkIn63xjg3c7scSQoo13sFOJSod2ancuDT+FJfU5v2/Dt7NSzb2tK7PAb/O68o
 5vIk63nr2dsPhPUSZUelQsUiMPg/UcLXjPCkcNawiSyjEfnKx2NmjE6zwWiAxjmqt4uy
 iNSFwgF9zM/2KqF9QMpgqjWLiWCMH7t6o4vRK6+uUlFXRUUhiCgEKKEbGlhBp/tyGxZ6
 bhhmJHiYgN89bdEKklwJr0NbgL5H2A6Ts4l35pc/QgfyCIEQ+1oK7VynJg0ETNYqfCj2
 RuljtRscnOXMM0wyaVfZd4A3JRGTRUV3xCLSY2ZZ/OQevttpya14DLv0055SehnAh2xO
 D4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711371480; x=1711976280;
 h=mime-version:references:in-reply-to:message-id:date:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eMQfXtIqVS/OIi7oM+IRMIhVPPKoKmf2XqobljSQq3U=;
 b=WUqH9XL4p+h/wdAtUgZ5IJNqv8XKYWXidQfY1UcMMGCrN3nmV9xNgFEprt9Xur+fxD
 YKXfKnle09rwOAF8CvI98ptchJquHxEumtOoCy47MJTYFHPY+67x+DyNa14Rv1TM6POz
 QuEWTBmJ1ypf7j/ZqnQSGjpPzzU+qKfODcyeS/MyKxN0eZLyNeCMCRSY+rLtb+8yrmb4
 n5xf/hGRRWAHhblOWr3a78WysJK/IPP/JShEhLpBJYvgbpDHEgNGwstJXR19rQIwThxy
 9pElKx1T4L8sT2zFFdiOJms6d1lnLrry+bri6qzpYg9Eyn7AZzsXa2dSpNsUahow/C/+
 kDkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtUGzobLWA7h02QaWeYAM7H/iPUEi8O4yaxeXOJD52y6NB0EuRcMrqacEWBMtY4v76XFo8NyiwKm300ur006/IvzicTMVcyorROEQvFkjk
X-Gm-Message-State: AOJu0Yz7RXo457e/iDsRt+WOuB4fpBl5NrIxTx2O1HvqwZKr/0aCHVe7
 ApYW2RcjpgaHn+efq+SA4/e5TF1sOQVISISyKpejz+PZ9LuOiVcOQ3qovoB8yA==
X-Google-Smtp-Source: AGHT+IFfODCE2okzJ0vPa5cn4qJeVHB9Ae+diOJbKfyd4XdyvwQoc+pXmNnBaMsgdpG+d9wZFVbs9A==
X-Received: by 2002:a81:8903:0:b0:611:967e:1d45 with SMTP id
 z3-20020a818903000000b00611967e1d45mr570030ywf.15.1711371480503; 
 Mon, 25 Mar 2024 05:58:00 -0700 (PDT)
Received: from mephi-laptop.localnet
 (47.177.21.198.tigernet.wifi.dyn.clemson.edu. [198.21.177.47])
 by smtp.gmail.com with ESMTPSA id
 ep18-20020a05690c2c9200b00610c63ce18dsm998924ywb.65.2024.03.25.05.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 05:58:00 -0700 (PDT)
From: Emilio Mendoza Reyes <emendoz@g.clemson.edu>
To: neil.armstrong@linaro.org, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/panel: Promote warn_dev to WARN for invalid calls
 in drm_panel.c
Date: Mon, 25 Mar 2024 08:46:16 -0400
Message-ID: <4878769.GXAFRqVoOG@mephi-laptop>
In-Reply-To: <87jzlqk5xr.fsf@intel.com>
References: <2388112.ElGaqSPkdT@mephi-laptop> <87jzlqk5xr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1881631.tdWV9SEqCh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
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

--nextPart1881631.tdWV9SEqCh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Emilio Mendoza Reyes <emendoz@g.clemson.edu>
Date: Mon, 25 Mar 2024 08:46:16 -0400
Message-ID: <4878769.GXAFRqVoOG@mephi-laptop>
In-Reply-To: <87jzlqk5xr.fsf@intel.com>
MIME-Version: 1.0

On Monday, March 25, 2024 5:37:52=E2=80=AFAM EDT Jani Nikula wrote:
> Please use git format-patch and/or send-email to send patches, without
> the inline PGP.
Yeah, sorry about that. I only noticed it was inline PGP after I sent the
patches. I didn't know if it would be okay to resend right after since I
didn't want to email spam. Sorry!

> Please use dev_WARN() which will handle the device specific warns for
> you, including dev_name().
Alright I changed my patch to use dev_WARN. The new version is at the
end of this email. Thank you for your time. Let me know if I there is
anything else to change.

Thanks,
EMR


Subject: [PATCH] drm/panel: Promote warn_dev to dev_WARN for invalid calls =
in
 drm_panel.c

Partially solve todo in kernel doc by promoting dev_warn calls to
dev_WARN.
Link: https://www.kernel.org/doc/html/v6.8/gpu/todo.html#clean-up-checks-fo=
r-already-prepared-enabled-in-panels

Signed-off-by: Emilio Mendoza Reyes <emendoz@clemson.edu>
=2D--
 drivers/gpu/drm/drm_panel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index cfbe020de54e..4459f4f5fe66 100644
=2D-- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -114,7 +114,7 @@ int drm_panel_prepare(struct drm_panel *panel)
 		return -EINVAL;
=20
 	if (panel->prepared) {
=2D		dev_warn(panel->dev, "Skipping prepare of already prepared panel\n");
+		dev_WARN(panel->dev, "Unexpected attempt to prepare an already prepared =
panel\n");
 		return 0;
 	}
=20
@@ -162,7 +162,7 @@ int drm_panel_unprepare(struct drm_panel *panel)
 		return -EINVAL;
=20
 	if (!panel->prepared) {
=2D		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n=
");
+		dev_WARN(panel->dev, "Unexpected attempt to unprepare an already unprepa=
red panel\n");
 		return 0;
 	}
=20
@@ -208,7 +208,7 @@ int drm_panel_enable(struct drm_panel *panel)
 		return -EINVAL;
=20
 	if (panel->enabled) {
=2D		dev_warn(panel->dev, "Skipping enable of already enabled panel\n");
+		dev_WARN(panel->dev, "Unexpected attempt to enable an already enabled pa=
nel\n");
 		return 0;
 	}
=20
@@ -246,7 +246,7 @@ int drm_panel_disable(struct drm_panel *panel)
 		return -EINVAL;
=20
 	if (!panel->enabled) {
=2D		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
+		dev_WARN(panel->dev, "Unexpected attempt to disable an already disabled =
panel\n");
 		return 0;
 	}
=20
=2D-=20
2.44.0


--nextPart1881631.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTcaZbABwnECYA0cZI0LAN3EqikFgUCZgFyGAAKCRA0LAN3Eqik
FpFuAP4/1QuAz/TJZuulntE7Vh0B9fC++3b8IMjZjxBRd369WwEAxeqpvHwRFFmN
3W4H7asKnWDJeQl2nAz8RswSfucKgg4=
=Lpy8
-----END PGP SIGNATURE-----

--nextPart1881631.tdWV9SEqCh--



