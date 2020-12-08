Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AAE2D2B5A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C048B6E0CF;
	Tue,  8 Dec 2020 12:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0756E0CF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:48:01 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id x16so24396918ejj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 04:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NgHihUTd+8szXhbah4UFbE+y3fSYCEd9zdqGCjkaDzw=;
 b=WFWOF3V9cRyu2nIq5NK9+VZ+FAiNCr+N9FyT+rua3G5wp+KPE363LLgBXKWAbuBool
 ed13CAEv7+wQTsfNOZ5jct4HFDIFAGWV95iwrqMYEyBnHphDaNL31lVycYKizreIGeNX
 lgMW+nxZAICYvevTAUExrsFQp/gSP7GaCLmkpjNYgUqScbeP/ABa21DS+fooUWRaEiBY
 AOcBKNcXOUuFaN+Ux0i3Ghj8Wm+1DJXBWJk/YArCKyU4UwK+ovhzo4acyJ95k+NYpz5X
 1DE5yUHzEoKCoUSSlJLMpiudN1A0ulWS1aowxrBmH6KTV8ke3oY2TFe4uR/OD0iGSOI0
 9YPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NgHihUTd+8szXhbah4UFbE+y3fSYCEd9zdqGCjkaDzw=;
 b=bFifwWjT68o2xhI39Kr3sVAKVcE4FlXj/rv1kvEL+NPOxPcZlFO8SZ2kIU8Exy9bEZ
 328+B11H8on/T/M3NVgpNxsU2l5dpHG8XQ301J0v9BslL8f7bh6/MVPylOmf2e2IDtAv
 m0lwwq3u1W7Sjw9LwyXPiLD0hap9cUTaWr0KEBANIlgT6MyhEIFogTFwnY4KHcYbls0G
 8Njst9e2zo/oZVUpQbtUYVJ+RPCXdK7qeVV/qUfVbeMIL9s+Z30L++8nVbUVQ5tjqbwM
 c9Pxv7mQq51XQrGklw6tk+BAjGvzuPy2XSNMFEDs8Z33RW0wLcrgS2JLCJCiVlPdoue4
 aamg==
X-Gm-Message-State: AOAM530+oTHHq/S8yxKWfGi3Ll9fUmtI+aZdaUvMYEQaRYn1tfLGa5i0
 XEXfTn0J0knH7aj3Up8O5qU=
X-Google-Smtp-Source: ABdhPJyfRsTDgoBEjiOtdymI2Zjr+9e60XqlWbIrOscHO+pCAfyo6AOUmP5fQApLQ03obglVJVhJsg==
X-Received: by 2002:a17:906:c51:: with SMTP id
 t17mr23796267ejf.523.1607431679728; 
 Tue, 08 Dec 2020 04:47:59 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id pv24sm12507494ejb.101.2020.12.08.04.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 04:47:58 -0800 (PST)
Date: Tue, 8 Dec 2020 13:47:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC PATCH] drm/panel: Make backlight attachment lazy
Message-ID: <X891/LvEJT1bLtjH@ulmo>
References: <20201208044446.973238-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201208044446.973238-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/2.0.2 (d9268908) (2020-11-20)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1627552010=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1627552010==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q/F3zxIokLeqOpPH"
Content-Disposition: inline


--q/F3zxIokLeqOpPH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2020 at 10:44:46PM -0600, Bjorn Andersson wrote:
> Some bridge chips, such as the TI SN65DSI86 DSI/eDP bridge, provides
> means of generating a PWM signal for backlight control of the attached
> panel. The provided PWM chip is typically controlled by the
> pwm-backlight driver, which if tied to the panel will provide DPMS.
>=20
> But with the current implementation the panel will refuse to probe
> because the bridge driver has yet to probe and register the PWM chip,
> and the bridge driver will refuse to probe because it's unable to find
> the panel.

What you're describing is basically a circular dependency. Can't we get
rid of that in some other way? Why exactly does the bridge driver refuse
to probe if the panel can't be found?

In other words, I see how the bridge would /use/ the panel in that it
forward a video stream to it. But how does the panel /use/ the bridge?

Thierry

--q/F3zxIokLeqOpPH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/PdfoACgkQ3SOs138+
s6EFeQ/7BAokHQ30+o814DNtowr9AuLiWatODNQMti31IRlmkHjiTufMsqzMIdyc
QEs6lj2pyv9pLS3kq7QVwsrViuPkRix+Fvn6BxN9aWeEqI5pbDMb3Jp4oGdCTt11
AvvA2bNXfgYKKXqVIOA36G/U/AKpAMvXSGsl8raUgar0pRp2Mp5G+y4tiLUCfJFN
E1jLSBRJz0VnhazWFifRzCsAAOkZcirgZgcTOkOIxRoI3YjtpaMOkHfa1gPIpGJq
DOJFXcFRasj6BocWtowGQn12fMyO+NFG6IrXzYZ1BNlCe5/ZCKgWXdXGOPexTfhn
xMm4J0Ppshqr1pradhF3Hil7zRW65HrS1Ea8WcKuAjJOLFm3svYjR7Cwgd5TyPhD
DIJlvWcFqmpgOxqbYMkemFLvBAVN5BPDhwpiu7w3Kg/1IRGRvMgp5JvbbRas2mvO
Ddeths3bMPCX3yzVc6q65R9jcUNw5mMW60vy5TVbjguBgPt+4nYgDHUmSMEykPD5
vGL84/6DVzXwwKmKKq4BNJmWqcVbMW7DxlYJ51xZsW/NGrjgLStm/kThSMp0wB1y
WmQM3sS1+DxUlPZuAUtAbUB6IyjXMqatDda0M5ySZ88HuCYebOYXV/rrnr8mIAiC
IjSI6dzAANnqUt2KGNMP69MD4wZjS1qTND90QIM3ZlekbUk3Kqk=
=BoBp
-----END PGP SIGNATURE-----

--q/F3zxIokLeqOpPH--

--===============1627552010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1627552010==--
