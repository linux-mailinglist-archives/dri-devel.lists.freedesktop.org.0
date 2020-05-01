Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D701C2405
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3166E0D3;
	Sat,  2 May 2020 08:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD24C6ED4A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 20:48:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x18so12967183wrq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 13:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gfGOLfXaLulVw5WVuYJtit1hU0mFqdh6Ro95VIBdKw0=;
 b=bEuI4RV8Xn99q3VEtbMvLgV+yoUkaQi8FdtjmYYvgirP8J77thzXg/rItG4SaSEP+Y
 SPoULqwYp3st7sNCJ3iyN9iuy5jhLkHYxWAgrr18Wn1hrOOQZxtCKcWTOi4Vchr/PMG/
 mxBSkiki4bSDpchrdkJgu3WMF3NKvIJq84HFSs86mwtrD/Vr7O2ZTX3glbtDDI/0by6S
 +R3YrO5fagE3Q/8JsSx3NIni0tfeRzb9YKZ60G20EctIjUUUrWizaRsf88zhNMB4Q9Ox
 lwnZbhkbzsjXmtlEM1VWA9DhGhyMtmXHXeutU2Xk5NCckjqA4tPgg37QyNDRWEla5OtK
 rKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gfGOLfXaLulVw5WVuYJtit1hU0mFqdh6Ro95VIBdKw0=;
 b=DLV0rZsipE3CkJJ46ftsr8rcJvPpOC+Tb4N8isAPtTdyECahEXrZHBwakmUXRji3mC
 qBC6Wv1pRKuEGpO9O3Ab5hZkvsrYCu5CJb1sYM+1zfCpOQrwIgRQjMedzk+G4dFOlFl3
 m1hley4BMuZAfHZ96rOujqYHkLrrAbJZnfESZxwGnug/8+FoUIjofVD2LLkyQ9PxHBPA
 z3TW90OFJxErK0AfVYPL8yLKgngVsmnc77PHab3qUpQqbTYdaXa3dRI0xl0j3e9XUMtl
 MsMxfv7HWXUL5gKsaeNSnuKASZL5IvZgXBCskUb/EZYl8w1HiU8g2pMq2O2WulwEhsdN
 0GPw==
X-Gm-Message-State: AGi0Pua3GG85SxSoGfa/dl0EA9qG6aSgIeXWvnBDYFLOgqmNO3vxb+Yn
 o26OL1klID2opXokCJr6Jiw=
X-Google-Smtp-Source: APiQypKe5x7InGxR58MMHp7xlHWWep8tKBWq1/0SVqVCutd9ZGsDvmietKRkily1TWE3N6OusrXeEQ==
X-Received: by 2002:adf:9793:: with SMTP id s19mr5470974wrb.147.1588366126534; 
 Fri, 01 May 2020 13:48:46 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl.
 [83.6.170.125])
 by smtp.googlemail.com with ESMTPSA id w12sm5938623wrk.56.2020.05.01.13.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 13:48:46 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: skrzynka@konradybcio.pl
Subject: [PATCH 2/2] dt-bindings: display: Document TM5P5 NT35596 panel
 compatible
Date: Fri,  1 May 2020 22:48:23 +0200
Message-Id: <20200501204825.146424-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200501204825.146424-1-konradybcio@gmail.com>
References: <20200501204825.146424-1-konradybcio@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konradybcio@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogS29ucmFkIER5YmNpbyA8a29ucmFkeWJjaW9AZ21haWwuY29tPgotLS0K
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdG01cDUsbnQzNTU5Ni50eHQg
ICAgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC90bTVwNSxudDM1NTk2LnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3RtNXA1LG50MzU1OTYudHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdG01cDUsbnQzNTU5Ni50eHQKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMC4uNmJlNTY5ODM0ODJiZgotLS0g
L2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL3RtNXA1LG50MzU1OTYudHh0CkBAIC0wLDAgKzEsNyBAQAorVE01UDUgTlQzNTU5NiA1
LjUiIDEwODDDlzE5MjAgTENEIFBhbmVsCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CisgIC0gY29t
cGF0aWJsZTogInRtNXA1LG50MzU1OTYiCisgIC0gcmVzZXQtZ3Bpb3M6IEdQSU8gc3BlYyBmb3Ig
cmVzZXQgcGluCisgIC0gdmRkLXN1cHBseTogVkREIHJlZ3VsYXRvcgorICAtIHZkZGlvLXN1cHBs
eTogVkRESU8gcmVndWxhdG9yCi0tIAoyLjI2LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
