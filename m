Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328BD606EA2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 06:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FE310E583;
	Fri, 21 Oct 2022 04:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B262810E583
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 04:02:09 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id f140so1478581pfa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 21:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1RpcIZo66JMtewPhjTBMsb5uhNiT3sGHHU564md5F9U=;
 b=iGeYQwtgCrVsBH5053B8wrlKozKfbx++/XyczKFcCboda7l5fSQuFEBoiWZd7X6nwx
 GRdGIjvhoY7jVgHKiEaraet5U5pCK3ZxNrwEIld3mNa8s0nO+ETRUexTgJ/9NO8PZMnN
 e9eSDRy5E/uK3Q3Uh0EqZ7uNh5APrXdfeP/xAbgJdxQ4PqnNogI07TeUG0pn/iRyepnf
 92E5dwe5k55w71+kKeWPUD4DHwDRLHB/1QKvuSxua3bnFMHs4xTz6TUIFEDsG+j8RiAY
 wnKBZ8nzSdTomRUNHCapZqR81k1cDWh+Bh7nME5IDGE83fFqltdU1Bw6PNc2PiKf2+Ar
 t5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1RpcIZo66JMtewPhjTBMsb5uhNiT3sGHHU564md5F9U=;
 b=rWh6vXIhU7Fo9rzV+wCMxFbob/2R1yu+e3SY80diYeoqdiOmRDTijDmuLpRMEXrp3I
 eM6ED/19vrXDYwvXhKET4iDx58hiup4uWLOKE9hYWAJxLsSRAivgpn7KNzNyQraIvt9N
 4amojKTEY/2jHKkhyM1T/UgE+u+d3I7Dp4LngmIg5LKREubHucGp+3oPGk0RgIP0dZEb
 9VpgjwkClXmi6nZ+J9q8Evu/ZcrA3JjcohvRL8A0pXw8a6bx+HmXZTzTnobPqubbchl9
 UGYxGsO/yfbfMU2SL5mAU5q8xhP4uELlwJ+2AAzhrnp9j1zNeVGv2glhUDyWR1dlcXY0
 lPZg==
X-Gm-Message-State: ACrzQf3Yk3ce4Za+YVy7Sjk//+zmiTVAm1vOWS4oblXO/DX3cLNrBjEC
 4wFOYdHYS6eNJ1SYF7RE57s=
X-Google-Smtp-Source: AMsMyM61LeaaEl78jhPAxT3RI0G+K6iMAgxIz6dw1EEg90qQOr18ygLimrLNS0+2tCYRw/tquK/DNA==
X-Received: by 2002:a63:1b5d:0:b0:461:7362:e8b5 with SMTP id
 b29-20020a631b5d000000b004617362e8b5mr14402119pgm.83.1666324929036; 
 Thu, 20 Oct 2022 21:02:09 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-47.three.co.id. [116.206.12.47])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a17090a3d4300b0020ddea12227sm653907pjf.55.2022.10.20.21.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 21:02:08 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 9261C103AB4; Fri, 21 Oct 2022 11:02:05 +0700 (WIB)
Date: Fri, 21 Oct 2022 11:02:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Subject: Re: [PATCH v5 01/10] gna: add PCI driver module
Message-ID: <Y1IZvWFE5kRSLYCc@debian.me>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e6A21joJI11IlZjq"
Content-Disposition: inline
In-Reply-To: <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--e6A21joJI11IlZjq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 07:53:25PM +0200, Maciej Kwapulinski wrote:
> +IOCTL
> +-----
> +Intel(R) GNA driver controls the device through IOCTL interfaces.
> +Following IOCTL commands - handled by DRM framework - are supported:
> +
> +GNA_GET_PARAMETER gets driver and device capabilities.
> +
> +GNA_GEM_NEW acquires new 4KB page aligned memory region ready for DMA op=
erations.
> +
> +GNA_GEM_FREE frees memory region back to system.
> +
> +GNA_COMPUTE submits a request to the device queue.
> +            Memory regions acquired by GNA_GEM_NEW are part of request.
> +
> +GNA_WAIT blocks and waits on the submitted request.
> +

Use bullet lists for ioctl list above (with minor wording improv on
the whole section):

---- >8 ----

diff --git a/Documentation/gpu/gna.rst b/Documentation/gpu/gna.rst
index 7f3b7ce7e8f722..9a896664a3c29f 100644
--- a/Documentation/gpu/gna.rst
+++ b/Documentation/gpu/gna.rst
@@ -32,21 +32,22 @@ Multiple processes can independently file many requests=
 to the driver. These req
 processed in a FIFO manner. The hardware can process one request at a time=
 by using a FIFO
 queue.
=20
-IOCTL
+ioctl
 -----
-Intel(R) GNA driver controls the device through IOCTL interfaces.
-Following IOCTL commands - handled by DRM framework - are supported:
+Intel(R) GNA driver controls the device through ioctl interfaces.
+The following commands (handled by DRM framework) are supported:
=20
-GNA_GET_PARAMETER gets driver and device capabilities.
+  * GNA_GET_PARAMETER gets driver and device capabilities.
=20
-GNA_GEM_NEW acquires new 4KB page aligned memory region ready for DMA oper=
ations.
+  * GNA_GEM_NEW allocates new 4KB page of aligned memory region ready for =
DMA
+    operations.
=20
-GNA_GEM_FREE frees memory region back to system.
+  * GNA_GEM_FREE frees memory region back to system.
=20
-GNA_COMPUTE submits a request to the device queue.
-            Memory regions acquired by GNA_GEM_NEW are part of request.
+  * GNA_COMPUTE submits a request to the device queue. Memory regions allo=
cated
+    by GNA_GEM_NEW become part of the request payload.
=20
-GNA_WAIT blocks and waits on the submitted request.
+  * GNA_WAIT blocks and waits on the submitted request.
=20
 GNA MMU
 -------

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--e6A21joJI11IlZjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1IZvQAKCRD2uYlJVVFO
o3SoAP45nF2ujb/ow1o/K//SEOHtVdUg5ZvP0rUgUsOQM0+ieQD+P/aRDnjlcuh0
1qJ1v7sm8amaCXdaL+Bqhug38QR9LQ0=
=BFyj
-----END PGP SIGNATURE-----

--e6A21joJI11IlZjq--
