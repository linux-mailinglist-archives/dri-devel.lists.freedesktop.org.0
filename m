Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F08F1A5EB9
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 15:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79156E3FE;
	Sun, 12 Apr 2020 13:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CAE6E3FE
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 13:21:47 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id q19so6269748ljp.9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 06:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4FIEUmcNoUoVbR0DONSm4/DJFIw8hJmUoiIwj3g7BiM=;
 b=Ucsmneav3qM7HcUiOrT+WYd6xRQ/Kk//dFsh3bGdC/nI592PW9PtN5+C4bgxYGUpQk
 bPmD5VVos41hqhsBNOBh5pLEAXKlxjOewgBPmbUQA9FxP+183wDiMz4jgVXgmKu4Ry0F
 +37/oj/GM6E+ruAK3V/8phP/H9W4TOucoZGWpF1IGIpznRroL7/HFzkdM/YQZ7if8mX1
 zafXVXsq0JILoaBLWJmUPKuQJT1FrPxVL4eTYNQeMMX8+ClNMYrSeiI8z88Q601FRkfG
 WfpYnj459nqRd/LruaS3CgvQC+7kvkfbEIZAKzNgPg56BHue/sNW6NAWUHikDN8U3uGt
 ZDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4FIEUmcNoUoVbR0DONSm4/DJFIw8hJmUoiIwj3g7BiM=;
 b=aVsL1OFxL7Cv1LVDdGqpZ4bBefyHnC2tWXL+D3W8biQ12WhZO2Ox2/am9k87xHJ57k
 fPBc+4kjUVetcsGp4xm6RBSW1jxaHQyZlxI+x4tL8f9S8XTjsgp9ZcxggLNAu1pyjHs9
 YwUtDF7F2ATdm2QoRF6km4T8cQ/vplpJusC5ayk82OhFndekSYfaeK2XVvCbQ4MQU3Jl
 sBXpmBm2iOWYozOVa/OilkPOZZCg7azwxhmo8aa3hSuCEdSSwQVRXUcdnUaGvBVF9xG3
 3itvfxHFXWjtFd7FrN/ZWJ7++F236Bo4MEPe1RdGVtMG8vf3ouyLkP9qGqkGpdT1yn9d
 57UQ==
X-Gm-Message-State: AGi0Pub6J0dFkJtTOmmAs2usZGboQspO+XbSJv4GWG8n4Jkk6sroZw2D
 TqsNW17HJE4jn947VedpoAOSfXQlSLo=
X-Google-Smtp-Source: APiQypJ+IYdNCOB+d88F408raxeoWj4QQGvyBIxPgHluADcUApULv9AYE2ADasxFiJIRFUeLbsqBXg==
X-Received: by 2002:a2e:7d09:: with SMTP id y9mr8008182ljc.146.1586697705718; 
 Sun, 12 Apr 2020 06:21:45 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 y29sm5330801ljd.26.2020.04.12.06.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 06:21:45 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 0/1] dt-bindings: fix warning in panel/advantech, idk-2121wr
Date: Sun, 12 Apr 2020 15:21:38 +0200
Message-Id: <20200412132139.11418-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The binding for the advantech,idk-2121wr uses an example
where a ports {} node is used.

The panel-lvds binding failed to support a ports node,
which the following patch fixes.

This fix was part of a longer series, but we need this fix
in upstream before -rc2.
So pull this out of the larger series.

	Sam
Sam Ravnborg (1):
      dt-bindings: display: allow port and ports in panel-lvds

 Documentation/devicetree/bindings/display/panel/lvds.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
