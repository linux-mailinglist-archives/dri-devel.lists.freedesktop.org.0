Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B5B3854E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68B089A59;
	Fri,  7 Jun 2019 07:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF01B89709
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:47:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m15so1345092ljg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 02:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rKGTOfiJLhxkK5DAGNPwC06vm8bKZwP8i9X7cgh9zRA=;
 b=tQ3i77/Dhnzuhw1LDgxW/9PzaFZgCH42xSTCgZaQ8838IghxbCI/nVktxXUv5AYCde
 Brpv1D1XQ+Ra9OuEAcaf/0n9E5n+TOpN3oVyuAOhXdokCjnRwhhYZliNMbbL06uDNTMu
 8bcNOda4EpoO8hWh23MYbWIv/IDBsaOKtOTq3aE4yA1N/kLFpMDokeVJh8OVwV+f6f2U
 Oi67wNXo/6HqChzV0m1WwdNygh22FtaY/vrYMF1wzn1Rae/zzlNqz3WwJfiBUqvJRHKj
 w0FNuLN1PcxsEXfqMhyCzKoxZLWa8Kcoms3pIYMJ8D+3dGlZyYTB0HaVsDMV5+WTfdPR
 8BPw==
X-Gm-Message-State: APjAAAUaz2VLWD2hDcxF3o9JfXeAH7Rolji6DZNMc9VriAahHOCLWSQC
 CraIE7z/v8xsBuDue/jyIJDrDA==
X-Google-Smtp-Source: APXvYqxPlKZHL9CiyClyWDvutiKzyHn6nhVbMEAw7QIESvJ4dLD6VWjiINM1rxgc+VbZYV5LMX8zug==
X-Received: by 2002:a2e:9284:: with SMTP id d4mr24398129ljh.26.1559814442103; 
 Thu, 06 Jun 2019 02:47:22 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.54.28])
 by smtp.gmail.com with ESMTPSA id r24sm124610ljb.72.2019.06.06.02.47.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 02:47:21 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, a.hajda@samsung.com, mchehab@kernel.org
Subject: [PATCH 4/8] drivers: media: i2c: fix warning same module names
Date: Thu,  6 Jun 2019 11:47:17 +0200
Message-Id: <20190606094717.23766-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rKGTOfiJLhxkK5DAGNPwC06vm8bKZwP8i9X7cgh9zRA=;
 b=K+PqH70Mt8b5TNW5xvyKMCLzJtovkyWC4zw7/gWft90LGfZ2cANg/5W/zie4WCakja
 iqBzR6M/vddI7/EJkTSwFeHsH6hRt4shQeumyR/ZYmDdgkZiqc5Wm6oLzCIacG4Q0Mqv
 lvJIBpKkC+6yMDO0x90jeibFkzrw1QpAao7YTIOOadlwLYolHX6oIJ4WCgLM2CD/yUgl
 ePdQIpZw28df1WlqwFUyJoe6wpBHUCyVK64DdRONB0FcZyGGFE9EMlKystWQFaI1LAzr
 Lg6zc7EfV2TgzfWHFK+Ug4ER7oXkMFTR73mMQVaH3VMxJUeutxA+xdU/7CS1ix1hp2qW
 ig2w==
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
Cc: marex@denx.de, andrew@lunn.ch, linux-fbdev@vger.kernel.org,
 f.fainelli@gmail.com, Anders Roxell <anders.roxell@linaro.org>,
 linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com,
 lee.jones@linaro.org, lgirdwood@gmail.com, davem@davemloft.net,
 broonie@kernel.org, dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, shawnguo@kernel.org, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBidWlsZGluZyB3aXRoIENPTkZJR19WSURFT19BRFY3NTExIGFuZCBDT05GSUdfRFJNX0ky
Q19BRFY3NTExCmVuYWJsZWQgYXMgbG9hZGFibGUgbW9kdWxlcywgd2Ugc2VlIHRoZSBmb2xsb3dp
bmcgd2FybmluZzoKCndhcm5pbmc6IHNhbWUgbW9kdWxlIG5hbWVzIGZvdW5kOgogIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmtvCiAgZHJpdmVycy9tZWRpYS9pMmMvYWR2
NzUxMS5rbwoKUmV3b3JrIHNvIHRoZSBuYW1lcyBtYXRjaGVzIHRoZSBjb25maWcgZnJhZ21lbnQu
CgpTaWduZWQtb2ZmLWJ5OiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+
Ci0tLQpUaGlzIGlzIG9ubHkgb25lIGlzc3VlIHRoYXQgaGF2ZSBiZWVuIGFkZHJlc3NlZC4KVGhl
IG90aGVyIGlzc3VlIGlzIHRoYXQgaXRzZWVtcyB0byByZWZlciB0byB0aGUgc2FtZSBkZXZpY2Ug
bmFtZSBpbgppMmNfZGV2aWNlX2lkLCBhbnkgZ3VpZGFuY2UgaG93IHRoYXQgc2hvdWxkIGJlIHNv
bHZlZD8KCgpDaGVlcnMsCkFuZGVycwoKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9N
YWtlZmlsZSB8IDEwICsrKysrLS0tLS0KIGRyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlICAgICAg
ICAgICAgICB8ICAzICsrLQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL01h
a2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL01ha2VmaWxlCmluZGV4IGI0
NmViZWIzNWZkNC4uZTM2NzQyNmJkNzNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTEx
L01ha2VmaWxlCkBAIC0xLDYgKzEsNiBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5Ci1hZHY3NTExLXkgOj0gYWR2NzUxMV9kcnYubwotYWR2NzUxMS0kKENPTkZJR19E
Uk1fSTJDX0FEVjc1MTFfQVVESU8pICs9IGFkdjc1MTFfYXVkaW8ubwotYWR2NzUxMS0kKENPTkZJ
R19EUk1fSTJDX0FEVjc1MTFfQ0VDKSArPSBhZHY3NTExX2NlYy5vCi1hZHY3NTExLSQoQ09ORklH
X0RSTV9JMkNfQURWNzUzMykgKz0gYWR2NzUzMy5vCi1vYmotJChDT05GSUdfRFJNX0kyQ19BRFY3
NTExKSArPSBhZHY3NTExLm8KK2RybS1pMmMtYWR2NzUxMS15IDo9IGFkdjc1MTFfZHJ2Lm8KK2Ry
bS1pMmMtYWR2NzUxMS0kKENPTkZJR19EUk1fSTJDX0FEVjc1MTFfQVVESU8pICs9IGFkdjc1MTFf
YXVkaW8ubworZHJtLWkyYy1hZHY3NTExLSQoQ09ORklHX0RSTV9JMkNfQURWNzUxMV9DRUMpICs9
IGFkdjc1MTFfY2VjLm8KK2RybS1pMmMtYWR2NzUxMS0kKENPTkZJR19EUk1fSTJDX0FEVjc1MzMp
ICs9IGFkdjc1MzMubworb2JqLSQoQ09ORklHX0RSTV9JMkNfQURWNzUxMSkgKz0gZHJtLWkyYy1h
ZHY3NTExLm8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlIGIvZHJpdmVy
cy9tZWRpYS9pMmMvTWFrZWZpbGUKaW5kZXggZDhhZDlkYWQ0OTVkLi5iNzFhNDI3YTg5ZmQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvbWVkaWEv
aTJjL01ha2VmaWxlCkBAIC0zNSw3ICszNSw4IEBAIG9iai0kKENPTkZJR19WSURFT19BRFY3NDhY
KSArPSBhZHY3NDh4Lwogb2JqLSQoQ09ORklHX1ZJREVPX0FEVjc2MDQpICs9IGFkdjc2MDQubwog
b2JqLSQoQ09ORklHX1ZJREVPX0FEVjc4NDIpICs9IGFkdjc4NDIubwogb2JqLSQoQ09ORklHX1ZJ
REVPX0FEOTM4OUIpICs9IGFkOTM4OWIubwotb2JqLSQoQ09ORklHX1ZJREVPX0FEVjc1MTEpICs9
IGFkdjc1MTEubworb2JqLSQoQ09ORklHX1ZJREVPX0FEVjc1MTEpICs9IHZpZGVvLWFkdjc1MTEu
bwordmlkZW8tYWR2NzUxMS1vYmpzICAgICAgICAgIDo9IGFkdjc1MTEubwogb2JqLSQoQ09ORklH
X1ZJREVPX1ZQWDMyMjApICs9IHZweDMyMjAubwogb2JqLSQoQ09ORklHX1ZJREVPX1ZTNjYyNCkg
ICs9IHZzNjYyNC5vCiBvYmotJChDT05GSUdfVklERU9fQlQ4MTkpICs9IGJ0ODE5Lm8KLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
