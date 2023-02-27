Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DCA6A4630
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 16:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EDC10E426;
	Mon, 27 Feb 2023 15:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B58C10E426
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 15:38:00 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bx12so3525658wrb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 07:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8iPi5X24QTXkkpCSlIjxJGTxpv+NcI0Pnun45yeLmXE=;
 b=JO352TRl2K8+Hym1qiP/MLj7LZc8IblPvaQ/6ojC/1cd0ZOHuhweFYbR2yiUnjFjtr
 fS9SsCW/xfUTtoE3vcDxo9T7mtaDfImSJfSIPGj+uG1ru76KA1SD4A1+I2Z1m4jStAqy
 1GErc96ncs9MAp4BUaKAXxFs994GWp0Ljd6o8aQ7ZHg8RddPb0v87loajDATtz2jHFZh
 g69FYaR8wWAlFF2Kv5jYzNmZ7XW2E+nx5EcBMSxMVerVZsbim9Cnnf6sMZkM8ubu3mnz
 dt2++KHUwqWUeRCQXmHe6HXbqXwCuoVDfnDcaWhNOO+Wwm8Fv++Od2ZnoJdBT/J6Y9JB
 wBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8iPi5X24QTXkkpCSlIjxJGTxpv+NcI0Pnun45yeLmXE=;
 b=ZHBdqlDAeIUh1FMFfyeqNYsmSLMz6Fp+2IiBTtj3stwoKzQqU6FdYVZPqpB55t6X/w
 S5EwJrWLqmOhzwrXgeLJLpxhScZ6yvuTB0yrp4u5mGY3f3KJQo4hx9xP3+7EVy2u+xUk
 dxzDVvivD9jvgku9C0B8GVeTQablnAdP7lNs1BSDQrAOkLfYHRSR26Un+QVEwWhbkJKc
 Ls7sjOA052lif2JqbcLpIwAHtvzLVR1Wx4keDEWz8tfGYdufRG6UxGDax4UTonU/WKKG
 V1SnrNb3Cko7WFbMBevwqMDc8UTQ1/waXktCrkWS38D+HNO6KwZm/Lu5D8kwFyM/T8ax
 /wsA==
X-Gm-Message-State: AO0yUKWazVLaCXRos2nb576Bt743eEP8ARRLFc8BGXPOO9UybinmDKXC
 KC62sqFWhTeP1HP/fbsDw7s=
X-Google-Smtp-Source: AK7set+gzfKP7nIhtlLHVfD/hwBndJB2UaNuHF+7c4cyFENoyzpEL44waBdq7UQclvB5/RiKpgrjZQ==
X-Received: by 2002:adf:f3ca:0:b0:2c7:832:8fc0 with SMTP id
 g10-20020adff3ca000000b002c708328fc0mr15915768wrp.3.1677512278977; 
 Mon, 27 Feb 2023 07:37:58 -0800 (PST)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 d18-20020adfe892000000b002c707b336c9sm7433562wrm.36.2023.02.27.07.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 07:37:57 -0800 (PST)
Date: Mon, 27 Feb 2023 16:37:55 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for DRM Panels
 drivers
Message-ID: <Y/zOU8cu29hOi9hk@orome>
References: <20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org>
 <Y+9awrqcQIOQNeaX@ravnborg.org>
 <45387999-a930-c03f-1acd-a02b9b4b3b3b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yUOMNC0qfpAxvPUR"
Content-Disposition: inline
In-Reply-To: <45387999-a930-c03f-1acd-a02b9b4b3b3b@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
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
Cc: linux-arm-msm@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yUOMNC0qfpAxvPUR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 09:22:02AM +0100, Neil Armstrong wrote:
> Hi Sam !
>=20
> On 17/02/2023 11:45, Sam Ravnborg wrote:
> > On Fri, Feb 17, 2023 at 10:58:15AM +0100, Neil Armstrong wrote:
> > > Add myself as co-maintainer for DRM Panel Drivers in order to help
> > > reviewing and getting new panels drivers merged.
> > >=20
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >=20
> > Thanks for stepping up!
> >=20
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> Thanks for you trust!
>=20
> Is there anybody else willing to ack ? Thierry ?

While at it, perhaps you want to remove me from the entry? I haven't
had much time to look at these drivers for a while now and Sam has been
doing a much better job than I ever have, so looks all in good hands.

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--yUOMNC0qfpAxvPUR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmP8zlEACgkQ3SOs138+
s6EoXQ//fx/b2TspW3plTFqmmm7ZdxDRNWPShZgH07yU4Us9KxNmsCABmuwxZxeT
uyL05JiX1xlPGeRxnZHW9PywXPPAIJlFGjYW2zrepjYRhdvVhfirNlMhw5YQuce3
ASnfcYx68BbOLfeTJma0+5/ZxkWklBn/Fbqki/b/cL8oSUCinUBEgVHGVrp2CyRi
dWiny3jHQWDUdySpVBCZAJfOboi7V8IGfviRKz/PrJ0rMlNyGuISNCpsMF4P/ChO
G9CKmN/qQlY3WE0S80TaBBBK420h7Ie7C31XgIkU/Ca6jXD3GilzeVQfjdfLiiQF
MI379JWCwjP4S9urZgamJpukXR2ebEf/nZqz05hws7rRXjnbs+Ao78NnFyt6WfLs
NIPCOsnzLu1nQiNgmNIqP0AFvm8NvWPz8hXTN3Z55/kKd0T8ukuNde+S8ET1jY02
HnrMBdqWHfdMbaGFfuT7dYdB64/pcMJOyrXArYthwYj2xyh2stjZSFsvMPSSAr7L
a8kEDl0299OP6HnYVFfRDNv04VY4lLe31Og2zfP+9q7+d5MCP35+7tjn2BvYEXP0
tJuZcSlFXYWTxBTESFFheoWBKoWDhuH8MfFXOADXyyGhIv9m+HraWXLCGUTs2vPi
wI1QUZxVsJSLZ4AQyxAZhxQJbSJolCIRHoDqiXFaGpSE6liRV2s=
=h4Q5
-----END PGP SIGNATURE-----

--yUOMNC0qfpAxvPUR--
