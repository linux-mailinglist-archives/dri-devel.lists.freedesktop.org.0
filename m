Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F4210A43
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 13:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AFD6E892;
	Wed,  1 Jul 2020 11:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F876E892
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 11:26:02 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id dp18so24180872ejc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 04:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lZj26CwH+3KxgC+hP0OazVEBLvLFOKJxYzi5I45O0dE=;
 b=le6GV5f/dGAjJq8wQz68W89CxKq+Q499yJDPo1FZ34phrSQRPK38GppEy7phsx2bGc
 rHa3s3sNxHuIqvMyxEIn7rBiHjCYnqMEElkXl5Q435p8Qu8jFWEh4clqHHstOyw/4T4u
 fX9xBpxMuTRIp9wGoV5hmtQ7feG3BLYChxDkr2YrIpZb7FvYVNejZEQDXJXXtO+InpL9
 ve63FzYwHFg5b6FvyVflElf/sD5c0WrUC1p88FjvtE4gCW50lupvFVoCDBzUfMOaZnEK
 k/U766DpT4UBHFsNfVIMA6yixTqqxdz+/CsyAw0rHkf1RvNIWj+VlBY3KALoMtnpxZAg
 1WzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lZj26CwH+3KxgC+hP0OazVEBLvLFOKJxYzi5I45O0dE=;
 b=HZA8HsPqjNKTUx7vRYkqbSAAeQOT7AdX5SnjV3Em4Qe7Wa3uw/PV7EpDti14iqCXML
 bbTNhWhnj6eOc1JJjefOB71MAPUuFTS/+2oVNPyDJq1dmQppZJ9JUNQT+AQA5cTxvyx/
 2iVXZFP1Wi55crsjSZ8aq4aZZSbs65F8hS9KxqGQiOJtacsRY2rWZEBBUEEdNjDMQtA1
 BrdxWGiMnxM0omzVfygXl13BGyk3pt1FXIbXoIhWsXByTy1V2uf3mE4FUtvCT2GCDJVk
 DhNkJ2HYZkLdHoPdGNAIvoOoWE/d7QCk/OvosS+4g+OpB5ckcJjoRWArg/CEyWS+jQMF
 749Q==
X-Gm-Message-State: AOAM532ODyITuKL9vdMOT/bzyRQdcnrnwK4D7DeTJC0N2kpozr7h2njN
 PbpD6yzt14pPElUPWdDEJwo=
X-Google-Smtp-Source: ABdhPJzyUDA2eZqbagHduFxDpj4PTq6ecxrv60hEWjOpDLWCm4e25kYYhpQDiE4dzu7g49qScmSbEw==
X-Received: by 2002:a17:906:774d:: with SMTP id
 o13mr17128257ejn.373.1593602761308; 
 Wed, 01 Jul 2020 04:26:01 -0700 (PDT)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e3sm6290442edm.14.2020.07.01.04.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 04:26:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add myself as DMA-buf maintainer
Date: Wed,  1 Jul 2020 13:25:59 +0200
Message-Id: <20200701112559.22669-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgZGlzY3Vzc2VkIG9uIHRoZSBsaXN0LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIE1BSU5UQUlORVJTIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTCmluZGV4IDQwNDc0OTgyYTIxZC4uNWQ3MTMwZjhkMzQyIDEwMDY0NAotLS0gYS9N
QUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtNTA4OSw2ICs1MDg5LDcgQEAgRjoJZnMv
ZGxtLwogCiBETUEgQlVGRkVSIFNIQVJJTkcgRlJBTUVXT1JLCiBNOglTdW1pdCBTZW13YWwgPHN1
bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgorTToJQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgogTDoJbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCiBMOglkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCiBMOglsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5v
cmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmliZXJzKQotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
