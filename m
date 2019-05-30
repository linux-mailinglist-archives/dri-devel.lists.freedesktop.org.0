Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7206930057
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 18:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F95A6E3BB;
	Thu, 30 May 2019 16:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10A76E39E;
 Thu, 30 May 2019 16:00:26 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id h17so2289524pgv.0;
 Thu, 30 May 2019 09:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JlasCBadKVSsXNr9CWB0njdLgCAXoVvqrNuDEFbuiAk=;
 b=k93bVW/CtB7ThBU6nlEky41z8K83yxfUjOLuHmcchJjMfpaivvZFNJd6rPdkmXKMpw
 4ppqxnG0x2Gj1l/goab66G8kiOSqp8ake0L/11d+o12NZa5Fww1+VFNP/PHHmzs9VX/O
 1KqUpOwlTroaRYCjHl/Oxo7O2cYJoRioiTFOcfk3kbONIMKsaJZ0ELG3VHcFHUcrwveH
 m/0RLfxVYiKSUT+zBWoeLIaKZLz+sBjpu18wxxb3JsYdx6p6F/PGfnzAggkHJl/kG9FQ
 7iEmLekt0YX20/UsVD+q93EOlq3MSwreOa4BxQeY4a6/fZdPoJ4Zwq0rbkO4iMbGLLS+
 dp1Q==
X-Gm-Message-State: APjAAAUrq1PXpfdt2UIELnI9Vj+1PQZ6OcKMGZdLCClAegvkwW58P/rs
 8B0MQMSiLh+o0A9qXoHrGIM=
X-Google-Smtp-Source: APXvYqx7uR82rclJSLO1W53P8kcXMQFQ/il2D/p+aY+ksKPDcfYRXob0yFz/gBQQ+NFgXCTSJZ1kog==
X-Received: by 2002:a62:bd11:: with SMTP id a17mr4504182pff.126.1559232026423; 
 Thu, 30 May 2019 09:00:26 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id a69sm4022560pfa.81.2019.05.30.09.00.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 09:00:25 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH 1/4] dt-bindings: msm/dsi: Add 10nm phy for msm8998 compatible
Date: Thu, 30 May 2019 09:00:23 -0700
Message-Id: <20190530160023.2773-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Thu, 30 May 2019 16:46:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JlasCBadKVSsXNr9CWB0njdLgCAXoVvqrNuDEFbuiAk=;
 b=GGmvQfnjEYqg8qQyb2/5A1vSa5dD9qVfe8yOwyW2rD/Y8VqE6iaViUCuy/BFehmPVJ
 PjpbhjyrSODquqB6uzFDXx8DgOgey45RoPlY2fqhz80ezGwluIbikPcA104eRL/U3p0O
 s7cELqrWxaZedQ99dD3wcl3EUVZyWX5l7N6FwYcxRkEfxy1jUWvObhPB9WPCcD0v94S3
 uWr5tHcjTcD3TG3nnSoRFhlHTWakjZPLtwZkPI5ayGWTRxuAomVKxg1dWzRt+vmnwbVX
 1mTYq/EfeuLTBXoihmdBHQBnNUWIeNG579eMNQmArE8MU7SCGIQtFF4FkP/CVLYe6Avq
 cb5A==
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
Cc: devicetree@vger.kernel.org, marc.w.gonzalez@free.fr,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org, sibis@codeaurora.org,
 freedreno@lists.freedesktop.org, chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERTSSBwaHkgb24gTVNNODk5OCBpcyBhIDEwbm0gZGVzaWduIGxpa2UgU0RNODQ1LCBob3dl
dmVyIGl0IGhhcyBzb21lCnNsaWdodGx5IGRpZmZlcmVudCBxdWlya3Mgd2hpY2ggbmVlZCB0byBi
ZSBoYW5kbGVkIGJ5IGRyaXZlcnMuICBQcm92aWRlCmEgc2VwYXJhdGUgY29tcGF0aWJsZSB0byBh
c3Npc3QgaW4gaGFuZGxpbmcgdGhlIHNwZWNpZmljcy4KClNpZ25lZC1vZmYtYnk6IEplZmZyZXkg
SHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2kudHh0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21zbS9kc2kudHh0CmluZGV4IDlhZTk0Njk0MjcyMC4uYWY5NTU4NmM4OThm
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
c20vZHNpLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tc20vZHNpLnR4dApAQCAtODgsNiArODgsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAq
ICJxY29tLGRzaS1waHktMjhubS04OTYwIgogICAqICJxY29tLGRzaS1waHktMTRubSIKICAgKiAi
cWNvbSxkc2ktcGh5LTEwbm0iCisgICogInFjb20sZHNpLXBoeS0xMG5tLTg5OTgiCiAtIHJlZzog
UGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIHJlZ2lzdGVycyBvZiBQTEws
IFBIWS4gU29tZQogICByZXZpc2lvbnMgcmVxdWlyZSB0aGUgUEhZIHJlZ3VsYXRvciBiYXNlIGFk
ZHJlc3MsIHdoZXJlYXMgb3RoZXJzIHJlcXVpcmUgdGhlCiAgIFBIWSBsYW5lIGJhc2UgYWRkcmVz
cy4gU2VlIGJlbG93IGZvciBlYWNoIFBIWSByZXZpc2lvbi4KLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
