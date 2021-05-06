Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7AA3752B7
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 13:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD466ECBF;
	Thu,  6 May 2021 11:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512D46ECC4;
 Thu,  6 May 2021 11:00:18 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c11so7144922lfi.9;
 Thu, 06 May 2021 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=YG0Wik7vCVlEPNPBs+I/+DdeQPewCO2NCWYBkcQbEVI=;
 b=sRfrXDMzv3JcpQYnLRVH9IgOPpqgu2IurpOv462AsEoJDZXFw8R6el1vspPjWQeVpa
 yOAdVFCNERkzbFFZTbHt23em65l8WEH8jxi7ibXztz8h0Wup1fCAad/IOnkPJ/sxwovN
 l4HJnqRiW4lOTmdKMH/HP6zV4PrbX8BdtDUvJalOuJr7tbD3+N0qv2hO8vBZAz9Al1aB
 5ImSiqS8h+slwquAuucnNafJ/mSkIfHtThgvGTKCPRf5Zi/Nn+OTb8dpAS7s6l44Td6I
 tzw8GCD0l1kFe0bgKC2GI/S7ULSzdfiCAoR/1P6z2+UK1V1IoOw/LkRTqeotilVJpmcD
 UWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=YG0Wik7vCVlEPNPBs+I/+DdeQPewCO2NCWYBkcQbEVI=;
 b=M6dApjjuPXoQQMB6ekKxJ6lO4yMIgmqnq0HbOlKSno30P/rOwtewU/P3K7q13oK0FY
 I9tSypYl2xPstr274hK1Oy+70Fw0KoPMoRonN9smimKS5zM7cM/is5GIn/zjBXTfFcei
 V5BQI9d3AF2Z1/Qlgvoe5ENZg3WuqeJhlAS9jFQGD4VYjl/j1tPT46oUTc38AFrE5kvx
 5+U+SjivWCOZGO3KuO4PhoEB/mT7V+FoN5/GB1hdNI5Wsf7YtsiOEbz1W537iDhCtl0g
 ca5SuSD8Vq+sYcrt4/2yya4UCPGAKimHpEMMXI4WRJkOJj30j6o+G4ncoUNthn/+ezY8
 1rJw==
X-Gm-Message-State: AOAM531AjHFhSkBMOzskrqpyLmRA9BzWNb/YEb+0JiodBi9hBuT7J+ch
 ta0yipFCgvASMuUxOcOHY/Y=
X-Google-Smtp-Source: ABdhPJxuNuVRIw5CLy3WnAOdZxc91G8YrQ5LGJQCFq7iUZMjOsI8AONkbaqqDY+9GOECs0Wav44ylg==
X-Received: by 2002:a05:6512:33c4:: with SMTP id
 d4mr2607760lfg.536.1620298816679; 
 Thu, 06 May 2021 04:00:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q5sm589077lfu.109.2021.05.06.04.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 04:00:16 -0700 (PDT)
Date: Thu, 6 May 2021 14:00:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Subject: Re: Independent EDID parsing library
Message-ID: <20210506140005.72db6d83@eldfell>
In-Reply-To: <20210429134958.446ef8c6@eldfell>
References: <BYAPR12MB31265E45A92C468AC1660EB6F25F9@BYAPR12MB3126.namprd12.prod.outlook.com>
 <20210429134958.446ef8c6@eldfell>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/W7FDa0tjSw1+cujpALB9tcc"; protocol="application/pgp-signature"
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
Cc: xorg-devel@lists.x.org, dri-devel@lists.freedesktop.org,
 "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/W7FDa0tjSw1+cujpALB9tcc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Apr 2021 13:49:58 +0300
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> Adding the previous list of CCs.
>=20
> On Thu, 29 Apr 2021 10:32:58 +0000
> "Sharma, Shashank" <Shashank.Sharma@amd.com> wrote:
>=20
> > Hello Pekka, Daniel
> >=20
> > As discussed over IRC, I have prepared the first version of the EDID pa=
rsing library, which is hosted here:
> > https://github.com/contactshashanksharma/libedid/tree/master
> >=20
> > This is a simple C library, and I have created this library keeping a c=
ompositor's context in mind, so its easy for a compositor to use it.
> > There are only 2 APIs in this library:
> >               - libedid_process_edid_info: Get EDID information from ra=
w_edid, returns filled struct edid_info ptr
> >               - libedid_destroy_edid_info: Free the EDID information
> >=20
> > I have provided much information in the README file, and have also adde=
d two simple test apps, with sample EDID, to test it.
> > Please have a look and let me know your opinion on this.

Hi,

I started a discussion on the API:
https://github.com/contactshashanksharma/libedid/issues/2


Thanks,
pq

--Sig_/W7FDa0tjSw1+cujpALB9tcc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCTzDUACgkQI1/ltBGq
qqcNrw//Zm5LchI+BE8lN105rRh/6pAaSCKQ2ZC8XIifMdAECpdQG6VqR5sXD/V2
P0Nr3QVrIy8vSFGdH9E+AAMaqQzO0AbA5PkkUOnwlRSsgXgokuexKEEmCLKnlRYA
zhKE/aKUtyFh91V3Pk8Eaw4ELR1YV/HqpEoSDue08HY0HML14DT85MECqEgh8uwb
BoT6HX9TN/8Ri9k3HSaqSQtzR64B4k8hdy3D0Kayq/LDjIi+WCCKqPs3qzn7TTwK
7vIB7nQrtSXb6fvCXG3oTK6LLCdkh9IAGrhr8yVkkBK4q1v6ys1S+a5cu5bbcfIR
TLubIyHR3c4NwQl24vlMeegkYnHbKJs/eEHHeJIzv7G9EHbuHOff3Y0Zm3nT6BA3
ph7gX+fI9mOHFnXu+wB5N7P42dnDwClskNYOgFN/kb0P2C4Dy2Uv29TI08IMP3st
NuUmXN8U7DIt5eg9d2iB5DnJuvfqIq6ncEV25hzaB15twoDNq8URF1UJWTTSKSmB
oCT5AFtBV4fYwMIzC2SpjCrgHdaOKLMpCPt7sZKu0d2DHr0eAJr8p6xwQ8eLCNdL
MPpigYe4/CZZWaOX7PtapLOFTyqlACvDRFHxCBpQSQligBk+tkKADovyxF+ug2rS
9+/iia/VUD3h1p+emI1emIk6M0lw80YAo4Lkx37Jy7+J+Vmmyqk=
=ReUL
-----END PGP SIGNATURE-----

--Sig_/W7FDa0tjSw1+cujpALB9tcc--
