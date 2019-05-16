Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733BF214F0
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F617898CE;
	Fri, 17 May 2019 07:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FEE89745
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 15:26:02 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q17so2022701pfq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 08:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:to:cc:subject:mime-version
 :content-disposition:user-agent;
 bh=vIQF8u3sZo2Bokqjd92RxldddXdBrsm+Bpa1o3oiahw=;
 b=ShaRKx14sCIfoE+vKekKW/05W8hhvH0fGh9SwLKjq9Rf1n2QV/ah5FKGeoS9Y0mwTS
 4Zh3K/R6z2/Ksc+NSve0Exrq0h2SzR/1wI3mcHYz6JMudv2wIRy7CA6nC5uIc9NRBg70
 JQdrnDeN9e4No6slRFzo+SwZOx4ssu3ABX5zNqcx7R2lFRAn/TdPfsa3164mfXcugbx8
 3SbJaLQ9EnbFlRUVDkCZ1t6ePsCpvHcvBle9PmRmk+c+UWGcxhoJXGig7+R1cs4GUnCX
 LELm9UzibEMtxPSjFqnqZNMqfsFNwDmYiw5qlLMhUm88kBipm5H7xYOUM1ZM8oXGTFTh
 Y9Vw==
X-Gm-Message-State: APjAAAVKzFsgCriNsnLr8ZiA1DlBnVv6h9/2uFbHwLZE8/RbWkwmCcUU
 qC/baUh6CSBYOL2TpaILCYo=
X-Google-Smtp-Source: APXvYqz72dew1ToMOg5F8RliET5tFWucXwzWX7IAcySJmTaous3XrKM27Vpe+r64itfI0uYjOFs1Zw==
X-Received: by 2002:a63:e43:: with SMTP id 3mr8094389pgo.253.1558020361972;
 Thu, 16 May 2019 08:26:01 -0700 (PDT)
Received: from sabyasachi ([2405:205:6486:db74:e0d2:7d60:25b1:4824])
 by smtp.gmail.com with ESMTPSA id 79sm10944464pfz.144.2019.05.16.08.26.00
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 May 2019 08:26:01 -0700 (PDT)
Message-ID: <5cdd8109.1c69fb81.6e003.b84b@mx.google.com>
X-Google-Original-Message-ID: <20190516152556.GA10079@sabyasachi.linux@gmail.com>
Date: Thu, 16 May 2019 20:55:56 +0530
From: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
To: architt@codeaurora.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, airlied@linux.ie
Subject: [PATCH v2] drm/bridge: Remove duplicate header
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:date:from:to:cc:subject:mime-version:content-disposition
 :user-agent;
 bh=vIQF8u3sZo2Bokqjd92RxldddXdBrsm+Bpa1o3oiahw=;
 b=IDAE0MkQ0jC55/yjj5oRUaa00DdXxU/xZUKnuZxDdjqQjUPFhuKUUtbsbJHIHMhJG3
 5ZQhvJovZWRnZvPp+R24lXk2ZchxecmHuTkVB7fr2awQn3teq1kTTxteEDhoYp/v72cO
 cM/qSdG808ffBbxz1gs6FV9ofuYpEZhGoRxvx8PhPdnJ79zMklDGNkiVWoZIdBzZC1kg
 KR0aphYsg8QYpaAH7SxcFohmatmUUmaAWTdQHK5ZSa9R4pnGzrJSM121skkGNfuNbeyx
 RgkFNTe4ooMHNYTP6may6kxgjQT0JgGRNi7QpUm3KHGK74oz7YOXGLQ8DqZHp10YQpNa
 QBXg==
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
Cc: jrdr.linux@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIGR1cGxpY2F0ZSBoZWFkZXIgd2hpY2ggaXMgaW5jbHVkZWQgdHdpY2UKClNpZ25lZC1v
ZmYtYnk6IFNhYnlhc2FjaGkgR3VwdGEgPHNhYnlhc2FjaGkubGludXhAZ21haWwuY29tPgotLS0K
djI6IHJlYmFzZWQgdGhlIGNvZGUgYWdhaW5zdCBkcm0gLW5leHQgYW5kIGFycmFuZ2VkIHRoZSBo
ZWFkZXJzIGFscGhhYmV0aWNhbGx5CgogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jIHwg
MyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3BhbmVsLmMKaW5kZXggMzhlZWFmOC4uMDAwYmE3YyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
cGFuZWwuYwpAQCAtOSwxMyArOSwxMiBAQAogICovCiAKICNpbmNsdWRlIDxkcm0vZHJtUC5oPgot
I2luY2x1ZGUgPGRybS9kcm1fcGFuZWwuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxw
ZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2Nvbm5lY3Rvci5oPgogI2luY2x1ZGUgPGRybS9kcm1f
ZW5jb2Rlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oPgot
I2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wYW5l
bC5oPgorI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+CiAKIHN0cnVjdCBwYW5lbF9i
cmlkZ2UgewogCXN0cnVjdCBkcm1fYnJpZGdlIGJyaWRnZTsKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
