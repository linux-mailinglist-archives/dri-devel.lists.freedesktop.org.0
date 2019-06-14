Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193E147501
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96FE8925A;
	Sun, 16 Jun 2019 14:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9A98909C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:31:51 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id a93so1450055pla.7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8o+2bmk3JHw3bcscvg5i4csgQd4Cy57o3YZ91vrIQhk=;
 b=qKblR8sn31R7SuUrcBMTMeX54vmNe6DD9OtY+QSTtoT/GekgGi65XJcpR9wQ/v/WMz
 EVDDCmpwU+WeUb1fCWdRu5W2THMuzH8ZpoGmhc/aawzK/EjdAoCkcRXLjpu+uOLl9srf
 QMxgbIPnY+lu6gYbVg7uUlqkInWMLOm4+jNhlNq5ielZEzE+aujCe5o6s1l73VRbcUdX
 l4KCjj9nyfVXhkZsAFbyX89I2ezi4sNZ8EO24Y6eTVpDl969SiBXGiVNgC0sJYSmiReH
 gp/gp6zwz4YKPkZ4o+NH2eSU9LiH6/xi28bKH3GCMLGKmxRcF/1VdZOWF2igP5ISym0K
 OFVA==
X-Gm-Message-State: APjAAAVhnL/63gYIo5ppaWfxarztRaaBAvAZ+FwzGFmY7kZMlF7WABNL
 wlPvMVyXkDOciUnfPuz9pbQ=
X-Google-Smtp-Source: APXvYqz8fXZMHh678m38GXZ7cOMf9Jew7ASJ24aKHKsv3zkzKPKgQG0N0NmX7eCgd61B1rxu1Qc+Kg==
X-Received: by 2002:a17:902:8203:: with SMTP id
 x3mr11439487pln.304.1560544311481; 
 Fri, 14 Jun 2019 13:31:51 -0700 (PDT)
Received: from localhost.localdomain ([162.251.69.147])
 by smtp.gmail.com with ESMTPSA id 188sm5189016pfe.30.2019.06.14.13.31.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:31:50 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org
Subject: [PATCH 1/2] dt-bindings: gpu: add Exynos Mali vendor specifics
Date: Fri, 14 Jun 2019 13:31:43 -0700
Message-Id: <20190614203144.3850-1-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8o+2bmk3JHw3bcscvg5i4csgQd4Cy57o3YZ91vrIQhk=;
 b=fmawliYbYe9RXgjYQw83JcEt3qnDc3a9Nr/dyRNlHVBsgPGykJOXH3w4C6Eu8DUyrl
 CrVaRFJv6oVjd8TD6dc/eUa7oEIvf83UPAFA5Q4p1A3H4Wds8oD+aKkPZAZ4GAloWSXF
 lkcOfoeKV9tkQsnV6TZGx4twjlJ657SfhMJThGkxwoqTmSl42l3+NQmlYoAwVd6LQCPI
 H310JzrVEUHkQYzmyWSIsaIQQrQdSBYWq3oxxJz4A54WeHv/5W2NdVQQByL9alDO0mVr
 DOsXQMJrpoV352/sQafvE8ReOUVpCrOQxC7VUWjKJbQC9TYzmOxWI8JDfDcweI/Lbyqq
 1p1g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9jdW1lbnQgdmVuZG9yIHNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5nIGZvciBNYWxpIGdwdXMg
b24gRXh5bm9zIFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBKb3NlcGggS29ndXQgPGpvc2VwaC5rb2d1
dEBnbWFpbC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9h
cm0sbWFsaS1taWRnYXJkLnR4dCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0s
bWFsaS1taWRnYXJkLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUv
YXJtLG1hbGktbWlkZ2FyZC50eHQKaW5kZXggMWIxYTc0MTI5MTQxLi5hOTcwNGM3MzZkMDcgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGkt
bWlkZ2FyZC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9h
cm0sbWFsaS1taWRnYXJkLnR4dApAQCAtMTgsNiArMTgsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVz
OgogICAgICsgImFtbG9naWMsbWVzb24tZ3htLW1hbGkiCiAgICAgKyAicm9ja2NoaXAscmszMjg4
LW1hbGkiCiAgICAgKyAicm9ja2NoaXAscmszMzk5LW1hbGkiCisgICAgKyAic2Ftc3VuZyxleHlu
b3MtbWFsaSIKIAogLSByZWcgOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3Mgb2YgdGhlIGRldmljZSBh
bmQgbGVuZ3RoIG9mIHRoZSByZWdpc3RlciBhcmVhLgogCi0tIAoyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
