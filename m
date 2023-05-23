Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF970E812
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 23:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BE910E4E8;
	Tue, 23 May 2023 21:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ED510E4E8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 21:53:55 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-53487355877so106642a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 14:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1684878835; x=1687470835;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIo67rNy3M6AcITrSzNuKt4/stsfWpBWpPOu7EKWytw=;
 b=Y3FU2zxHqlNeOFaIQJ3AbrQMTa3yQaxVCY5Vgz+mJ7ornarDwVDQqMbfmA8xock80R
 xzlHDHeJpU64VoIE9l2G6dwzHM1ARKaCSMaSD6rmaOiwzYYq0cOgVACef4j5r39J4ViP
 4yV31z6iXWQKlUkik2amaRSMj4wcTxLLY2JH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684878835; x=1687470835;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qIo67rNy3M6AcITrSzNuKt4/stsfWpBWpPOu7EKWytw=;
 b=OV7e604juXRAJfNJGd1WVj7wFgUZ32mEGtkREu+1nY+jhn7TN88ObEB3JG+hk2qGfN
 KUyX2lTsJJjgxNCdXwXYNqUVEx8NgZTyG5Owkfnzbo6/spMsEcmz1YZmP6vOLqAWVgmk
 dR/rYbRYUOUS8LdOEcKNV2i1Gqn3n7TDv4hHn0bz19e0n2Hxiwny3ztO8/juV1ZzfCjS
 6mNN1S/LHVLngnsd0PjaHJrLpC0UDgJdpX+MCrqkgNsxfJpeTL4+c569oVl0nTyq8Lar
 uYFQhMhwSZ3e8ULdXVXtSVa+ngopPJL4RW6OP83sU7zGsxXiNJBybd58MsGB+2r8Ip9w
 xWJg==
X-Gm-Message-State: AC+VfDyJTujma5biPbh6A3NZRkihnh0MeHH2K2v1LFzpih67tsR2xcJN
 Ze/vZ8RSwhFeXyidRsT1/dw23Q==
X-Google-Smtp-Source: ACHHUZ42Wkb7sV+bguY1Xo090DTdbHI6p7/Omrv6xI+efSK5ORV8yUPh73qX2xrlph6y6k6/HVgVow==
X-Received: by 2002:a17:902:db07:b0:1ac:8dae:d842 with SMTP id
 m7-20020a170902db0700b001ac8daed842mr18135225plx.46.1684878834685; 
 Tue, 23 May 2023 14:53:54 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902744400b001ae62d7cb2bsm7189820plt.199.2023.05.23.14.53.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 May 2023 14:53:53 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH net-next v4 0/6] Brcm ASP 2.0 Ethernet Controller
Date: Tue, 23 May 2023 14:53:41 -0700
Message-Id: <1684878827-40672-1-git-send-email-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.7.4
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000075da9e05fc636c15"
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, simon.horman@corigine.com, richardcochran@gmail.com,
 linux@armlinux.org.uk, conor@kernel.org, justin.chen@broadcom.com,
 edumazet@google.com, robh+dt@kernel.org, justinpopo6@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 sumit.semwal@linaro.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000075da9e05fc636c15

Add support for the Broadcom ASP 2.0 Ethernet controller which is first
introduced with 72165.

Add support for 74165 10/100 integrated Ethernet PHY which also uses
the ASP 2.0 Ethernet controller.

Florian Fainelli (2):
  dt-bindings: net: Brcm ASP 2.0 Ethernet controller
  net: phy: bcm7xxx: Add EPHY entry for 74165

Justin Chen (4):
  dt-bindings: net: brcm,unimac-mdio: Add asp-v2.0
  net: bcmasp: Add support for ASP2.0 Ethernet controller
  net: phy: mdio-bcm-unimac: Add asp v2.0 support
  MAINTAINERS: ASP 2.0 Ethernet driver maintainers

 .../devicetree/bindings/net/brcm,asp-v2.0.yaml     |  145 ++
 .../devicetree/bindings/net/brcm,unimac-mdio.yaml  |    2 +
 MAINTAINERS                                        |    9 +
 drivers/net/ethernet/broadcom/Kconfig              |   11 +
 drivers/net/ethernet/broadcom/Makefile             |    1 +
 drivers/net/ethernet/broadcom/asp2/Makefile        |    2 +
 drivers/net/ethernet/broadcom/asp2/bcmasp.c        | 1462 ++++++++++++++++++++
 drivers/net/ethernet/broadcom/asp2/bcmasp.h        |  637 +++++++++
 .../net/ethernet/broadcom/asp2/bcmasp_ethtool.c    |  568 ++++++++
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c   | 1425 +++++++++++++++++++
 .../net/ethernet/broadcom/asp2/bcmasp_intf_defs.h  |  238 ++++
 drivers/net/mdio/mdio-bcm-unimac.c                 |    2 +
 drivers/net/phy/bcm7xxx.c                          |    1 +
 include/linux/brcmphy.h                            |    1 +
 14 files changed, 4504 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
 create mode 100644 drivers/net/ethernet/broadcom/asp2/Makefile
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp.h
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_intf_defs.h

-- 
2.7.4


--00000000000075da9e05fc636c15
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
YIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEICKCvITRo6VMYxGq8bAFRF9mtCCW+T+n+HW9
woaC7ZZ5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDUyMzIx
NTM1NVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATAN
BgkqhkiG9w0BAQEFAASCAQB/k5fLUZGp8/fbzikg+KJsMmROXeI67gvMO7w8NaQ8suz7Blp1eTlx
JF+5tpmzMROIDuCIV64E5kevPSDphovubihx2MYT9u07ROVI28FpYmGcL5IDI7DvniQFehCGnDOh
QjANLXkr6Lt6QsF/pDIV/IAYECEjxl+IS1XZ/JQ+JxGB0gF4vQDOMbpyqySy6aTLAv4go0vcg9Wn
TTGnNEJceoSNCPnw0/is5nrurD9FULAViU9gf7CB/ZbXxYBjejjXw4UkRssj/9xfGwnhXRm25SEl
l+mqLWZ5let5MmSzBLsYoH+ktZCeqZdHm8wiG7yUpy9jqy8L0MS/9cJtLuLf
--00000000000075da9e05fc636c15--
