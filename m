Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C4670D6E5
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD39310E3FF;
	Tue, 23 May 2023 08:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAEC10E228
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 18:48:20 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-773793070a4so76318139f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1684781300; x=1687373300;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Fds1Cng30+mjKQmgvo9yQzM73mfg393Nn6U4WHXCrGM=;
 b=RBLjhzSLszYUJnPPXHsnXeEjlUWNVvOXWC0QIsPgSUcA22NIRfDt40IKYSofA18Wes
 RDzBuO8DKrrPy30STc8erfIePI09tXnJUhudk4/p6YADFj3j5yipJdmrvF6I+e/lXfRw
 XwRd5twbvoxaVa71Cx2Gtt6Jeb4jqzqhqP9ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684781300; x=1687373300;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fds1Cng30+mjKQmgvo9yQzM73mfg393Nn6U4WHXCrGM=;
 b=D2hgnRqMX/khmUm74TXMW0u2dIobGTX7s+QCMIOWCx5/6ZOV8OQFipo7SeOifc6G0p
 98xElXTv8O+ikSz8kdWUg9ou6SY+T26G8dFoey6H3kOibWVr9dZ1y1T0urIX03fVTAt+
 +ROYbKhOSxS4HdXsWO+EU6kWDEU8QqTMK9TI3B91ArmwjSlpuA1+YBblgm/PJqFPW97+
 fmDHQQTFF9xCPzSJljBNS9298EUr4YsnflMOFMp8rZtdj2MrdnDubLISRw6vri/12JlO
 zO5jiHT7jkRfj95PRX4308afzmh/DntsqiPOleJMq1QGtK4ZaRwmKoNjToQsvwoQ4ghy
 Imvg==
X-Gm-Message-State: AC+VfDzH6Vu70WWhlTop7FkdlyXqQB8dsWtoAp/19iVxNKRf8hgB80pi
 kv8Nf2dKuikMcxI8oT6W7C3pES2rm4eEpO2su64/gNIkrOYlvYF3
X-Google-Smtp-Source: ACHHUZ5vHLY2Hi85sQaRp8S8sjfzRdNoFCMGRp3iFyQ4yXFmQ6fp0K6LNBuuBfFy0kfnjjfLRHr/QdaiDVcvc5KtJXc=
X-Received: by 2002:a6b:db04:0:b0:76f:f462:34d2 with SMTP id
 t4-20020a6bdb04000000b0076ff46234d2mr7467444ioc.14.1684781299839; Mon, 22 May
 2023 11:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <1684531184-14009-1-git-send-email-justin.chen@broadcom.com>
 <1684531184-14009-3-git-send-email-justin.chen@broadcom.com>
 <d56f205c-dae8-a191-f2af-fed6bea060ad@conchuod.ie>
In-Reply-To: <d56f205c-dae8-a191-f2af-fed6bea060ad@conchuod.ie>
From: Justin Chen <justin.chen@broadcom.com>
Date: Mon, 22 May 2023 11:48:08 -0700
Message-ID: <CALSSxFaJm2jiqQe54dbPTOaJyTOOCbW-yuhddO9wq1r_EHJONw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
To: Conor Dooley <mail@conchuod.ie>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000ec62b505fc4cb6f2"
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: andrew@lunn.ch, dri-devel@lists.freedesktop.org, edumazet@google.com,
 justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 sumit.semwal@linaro.org, f.fainelli@gmail.com, florian.fainelli@broadcom.com,
 linux@armlinux.org.uk, bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 pabeni@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 richardcochran@gmail.com, opendmb@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org,
 christian.koenig@amd.com, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000ec62b505fc4cb6f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 11:27=E2=80=AFAM Conor Dooley <mail@conchuod.ie> wr=
ote:
>
> On Fri, May 19, 2023 at 02:19:40PM -0700, Justin Chen wrote:
>  > From: Florian Fainelli <florian.fainelli@broadcom.com>
>  >
>  > Add a binding document for the Broadcom ASP 2.0 Ethernet controller.
>  >
>  > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>  > Signed-off-by: Justin Chen <justin.chen@broadcom.com>
>  > ---
>
> Same deal here, usual mailer is refusing to reply cos of:
> Problem signature from:
> 1.2.840.113549.1.9.1=3D#6A757374696E2E6368656E4062726F6164636F6D2E636F6D,=
CN=3DJustin
> Chen,O=3DBroadcom Inc.,L=3DBangalore,ST=3DKarnataka,C=3DIN
>                     aka: <justin.chen@broadcom.com>
>                 created: Fri 19 May 2023 10:19:57 PM IST
>                 expires: Wed 10 Sep 2025 01:39:50 PM IST
>
>  > v3
>  >         - Minor formatting issues
>  >         - Change channel prop to brcm,channel for vendor specific form=
at
>  >         - Removed redundant v2.0 from compat string
>  >         - Fix ranges field
>  >
>  > v2
>  >         - Minor formatting issues
>  >
>  >  .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 145
> +++++++++++++++++++++
>  >  1 file changed, 145 insertions(+)
>  >  create mode 100644
> Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
>  >
>  > diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
>  > new file mode 100644
>  > index 000000000000..a9fed957e1d6
>  > --- /dev/null
>  > +++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
>  > @@ -0,0 +1,145 @@
>  > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  > +%YAML 1.2
>  > +---
>  > +$id: http://devicetree.org/schemas/net/brcm,asp-v2.0.yaml#
>  > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  > +
>  > +title: Broadcom ASP 2.0 Ethernet controller
>  > +
>  > +maintainers:
>  > +  - Justin Chen <justin.chen@broadcom.com>
>  > +  - Florian Fainelli <florian.fainelli@broadcom.com>
>  > +
>  > +description: Broadcom Ethernet controller first introduced with 72165
>  > +
>  > +properties:
>  > +  '#address-cells':
>  > +    const: 1
>  > +  '#size-cells':
>  > +    const: 1
>  > +
>  > +  compatible:
>  > +    enum:
>  > +      - brcm,asp-v2.0
>  > +      - brcm,bcm72165-asp
>  > +      - brcm,asp-v2.1
>  > +      - brcm,bcm74165-asp
>
> One of Rob's questions on V(N-1) that seems to have been ignored/only
> partly implemented:
>  > You have 1 SoC per version, so what's the point of versions? If you ha=
ve
>  > more coming, then fine, but I'd expect it to be something like this:
>  >
>  > compatible =3D "brcm,bcm74165-asp-v2.1", "brcm,asp-v2.1";
>
> You did drop the -v2.1 that he requested from the SoC compatible, but I
> amn't sure why the above was not implemented (at least there's no
> explanation in the previous thread's version, nor in the changelog
> here...)

Will fix it. Didn't realize he was talking about the compat string in
the example below.

Thanks,
Justin

>
> Cheers,
> Conor

--000000000000ec62b505fc4cb6f2
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
NhTY3E+cXCB11wty89QStajwXdhGJTYEvUgvsq1h8CwJj9w/38ldAQf5WjhPmApYeJR2ewFrBMCM
4lHkdRJ6TDc9nXoEkypUfjJkJHe7Eal06tosh6JpAgMBAAGjggHZMIIB1TAOBgNVHQ8BAf8EBAMC
BaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJlLmdsb2JhbHNp
Z24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYIKwYBBQUHMAGG
NWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwME0G
A1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxz
aWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly9j
cmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3JsMCMGA1UdEQQc
MBqBGGp1c3Rpbi5jaGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSME
GDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUIWGeYuaTsnIada5Xx8TR3cheUbgw
DQYJKoZIhvcNAQELBQADggEBAHNQlMqQOFYPYFO71A+8t+qWMmtOdd2iGswSOvpSZ/pmGlfw8ZvY
dRTkl27m37la84AxRkiVMes14JyOZJoMh/g7fbgPlU14eBc6WQWkIA6AmNkduFWTr1pRezkjpeo6
xVmdBLM4VY1TFDYj7S8H2adPuypd62uHMY/MZi+BIUys4uAFA+N3NuUBNjcVZXYPplYxxKEuIFq6
sDL+OV16G+F9CkNMN3txsym8Nnx5WAYZb6+rBUIhMGz70V05xsHQfzvo2s7f0J1tJ5BoRlPPhL0h
VOnWA3h71u9TfSsv+PXVm3P21TfOS2uc1hbzEqyENCP4i5XQ0rv0TmPW42GZ0o4xggJtMIICaQIB
ATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhH
bG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwj8BKLXNpALfemdRAwDQYJ
YIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEID2iwiHjXLaFfOiGCEZhY6UyGGc8LIg5WkTw
T9oCstvVMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDUyMjE4
NDgyMFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATAN
BgkqhkiG9w0BAQEFAASCAQBszOHs+Q7oyvTL/a/YQi7CKCuYSQqjE4VdIos0qKN786xVt3ujJGrX
1BbJdlOyxbHXOmJ7PQChce6M7uvYPyOuCKyBLZdgqdipvMYiAFFiXQ1JPKTcY7cBQKBiSp7L+fCz
uXrV2PZWVe0hjoj524tXI6YMS+WXSSmLAWYPSSs2AxGSVlw1lbNUtsRk+ruCYfI7c54D0FjHnm1e
TzoypSTLhxj6CG7s7osh/jyIUx7uD1m/SfPuU47aU6J3qz0l8Us6o2bStfsa32Jw1c5OjnhKWGf8
jIBDSqt1B+jrQEYyjn7aUJTQaQ5xnD6gjprYBs90+cHNz9kD12R80U5VUn8c
--000000000000ec62b505fc4cb6f2--
