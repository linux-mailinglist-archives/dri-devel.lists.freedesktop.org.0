Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF218C148
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 21:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE736EA6C;
	Thu, 19 Mar 2020 20:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E019C6EA6C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:24:57 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id n20so2746539lfl.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iYPokp6ZDeJn5siAujHp8DlAOcrFhNLT+dybpdV987Q=;
 b=QxS0XNGeITMF9SMPjKAyZROLcbpnM49oIZRjVHJHLTrZOE7tefnptXis14oV8TIokg
 TMFyFEwNYasjcrDwgZQIzqRYtzVaO00SKCbUq3+JfhcVT/ZALGHXAgDNHnfPZic4Nktl
 kcLkYfhcKDGC50FT3J8KkNt7F73+0rWRNiwdGXkbNyo7Vcg9OO8+PkjKb6HULC/VT+wJ
 DAKmT0x6za1vGKS/n1avUtz7NCNV6rx86hGsjPBeWt+NLrvZ7Juc+dmZJ8pDjXRINlrV
 ksEbs81tG5JCHJ1c2lokiGlGTB1yIqUDaFq52TV/7tg56034p9dc51JcYGUQ2jGxL6oT
 2d7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iYPokp6ZDeJn5siAujHp8DlAOcrFhNLT+dybpdV987Q=;
 b=O6ZWTtDrB7OUYwMqs8fYSbFx32XTUKsb8fjfNv3F3SVcr/sqKX8UGaoaxWhBzNptvp
 z9RJQb6lzCz+CPO7QVS7m0weIH7dEIxR6d3TD/IXJBF6/GhiQ1Tk8mlL72BgVGQUR97d
 Cf325HfknMURz1zShReKG0/MVfilEfGJHrcsSh1turg/sL4q+CaGZdrpTLFJFW0NOel+
 ofsLEc1cWppx+dg+imqdL0YGBHpv9CXRL213f2f0a46uVihzYqJxj3gFC+2gzkpLeLp0
 GG0vpTzltmAWChI9x26DIwPdOWaOZWy9zrdcFegpBpwFA902ZYETSgdsoCTyUCI5+6/0
 rmGA==
X-Gm-Message-State: ANhLgQ2V/AFY1nuqZQGQKbhGuwtQsErzbT05/Ewe7qkfTXT10R8NXRb6
 OGZVbUuj8EMv0lNR0r5lLuUpKD/AtdM=
X-Google-Smtp-Source: ADFU+vtRNOQbG6oi/MDMq/nNvPdkDe5wzueAaYj5gWSiYWlh7vPleFPcAUaVU+6CJiDTYyB/RfxUdQ==
X-Received: by 2002:a19:550e:: with SMTP id n14mr3093755lfe.141.1584649495763; 
 Thu, 19 Mar 2020 13:24:55 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id v3sm2074372lfp.8.2020.03.19.13.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:24:55 -0700 (PDT)
From: rscheidegger.oss@gmail.com
X-Google-Original-From: sroland@vmware.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/17] drm/vmwgfx: Add a new enum for SM5 graphics context
 capability
Date: Thu, 19 Mar 2020 21:24:03 +0100
Message-Id: <20200319202414.9296-7-sroland@vmware.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319202414.9296-1-sroland@vmware.com>
References: <20200319202414.9296-1-sroland@vmware.com>
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
Cc: linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGVlcGFrIFJhd2F0IDxkcmF3YXQuZmxvc3NAZ21haWwuY29tPgoKQSBuZXcgZW51bSB0
byByZXByZXNlbnQgbmV3IFNNNSBncmFwaGljcyBjb250ZXh0IGNhcGFiaWxpdHkgaW4gdm13Z2Z4
LgoKdjI6IHVzZSBuZXcgY29ycmVjdCBjYXAgYml0cyAobWVyZ2VkIHNldmVyYWwgbGF0ZXIgY29t
bWl0cyBpbnRvIGl0KS4KClNpZ25lZC1vZmYtYnk6IERlZXBhayBSYXdhdCA8ZHJhd2F0LmZsb3Nz
QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgPHRo
b21hc19vc0BzaGlwbWFpbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFJvbGFuZCBTY2hlaWRlZ2dlciAo
Vk13YXJlKSA8cnNjaGVpZGVnZ2VyLm9zc0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfZHJ2LmMgfCAxMSArKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfZHJ2LmggfCAxMyArKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCmluZGV4IGYxYzAw
Njk3YWE3Ni4uZTA3MjkyYTI5YzI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwpA
QCAtMjkwLDYgKzI5MCw4IEBAIHN0YXRpYyB2b2lkIHZtd19wcmludF9jYXBhYmlsaXRpZXMyKHVp
bnQzMl90IGNhcGFiaWxpdGllczIpCiAJCURSTV9JTkZPKCIgIEdyb3cgb1RhYmxlLlxuIik7CiAJ
aWYgKGNhcGFiaWxpdGllczIgJiBTVkdBX0NBUDJfSU5UUkFfU1VSRkFDRV9DT1BZKQogCQlEUk1f
SU5GTygiICBJbnRyYVN1cmZhY2UgY29weS5cbiIpOworCWlmIChjYXBhYmlsaXRpZXMyICYgU1ZH
QV9DQVAyX0RYMykKKwkJRFJNX0lORk8oIiAgRFgzLlxuIik7CiB9CiAKIHN0YXRpYyB2b2lkIHZt
d19wcmludF9jYXBhYmlsaXRpZXModWludDMyX3QgY2FwYWJpbGl0aWVzKQpAQCAtOTAwLDYgKzkw
MiwxMyBAQCBzdGF0aWMgaW50IHZtd19kcml2ZXJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB1bnNpZ25lZCBsb25nIGNoaXBzZXQpCiAKIAkJaWYgKHZtd19yZWFkKGRldl9wcml2LCBTVkdB
X1JFR19ERVZfQ0FQKSkKIAkJCWRldl9wcml2LT5zbV90eXBlID0gVk1XX1NNXzRfMTsKKworCQlp
ZiAoaGFzX3NtNF8xX2NvbnRleHQoZGV2X3ByaXYpICYmCisJCSAgICAoZGV2X3ByaXYtPmNhcGFi
aWxpdGllczIgJiBTVkdBX0NBUDJfRFgzKSkgeworCQkJdm13X3dyaXRlKGRldl9wcml2LCBTVkdB
X1JFR19ERVZfQ0FQLCBTVkdBM0RfREVWQ0FQX1NNNSk7CisJCQlpZiAodm13X3JlYWQoZGV2X3By
aXYsIFNWR0FfUkVHX0RFVl9DQVApKQorCQkJCWRldl9wcml2LT5zbV90eXBlID0gVk1XX1NNXzU7
CisJCX0KIAl9CiAKIAlyZXQgPSB2bXdfa21zX2luaXQoZGV2X3ByaXYpOwpAQCAtOTEzLDYgKzky
Miw4IEBAIHN0YXRpYyBpbnQgdm13X2RyaXZlcl9sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHVuc2lnbmVkIGxvbmcgY2hpcHNldCkKIAogCURSTV9JTkZPKCJBdG9taWM6ICVzXG4iLCAoZGV2
LT5kcml2ZXItPmRyaXZlcl9mZWF0dXJlcyAmIERSSVZFUl9BVE9NSUMpCiAJCSA/ICJ5ZXMuIiA6
ICJuby4iKTsKKwlpZiAoZGV2X3ByaXYtPnNtX3R5cGUgPT0gVk1XX1NNXzUpCisJCURSTV9JTkZP
KCJTTTUgc3VwcG9ydCBhdmFpbGFibGUuXG4iKTsKIAlpZiAoZGV2X3ByaXYtPnNtX3R5cGUgPT0g
Vk1XX1NNXzRfMSkKIAkJRFJNX0lORk8oIlNNNF8xIHN1cHBvcnQgYXZhaWxhYmxlLlxuIik7CiAJ
aWYgKGRldl9wcml2LT5zbV90eXBlID09IFZNV19TTV80KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9kcnYuaAppbmRleCA4ZTJjYjAzOTRmNGUuLjQxZTBkM2JkODVlZSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfZHJ2LmgKQEAgLTQ0NiwxMiArNDQ2LDE0IEBAIGVudW0gewogICogQFZNV19T
TV9MRUdBQ1k6IFByZSBEWCBjb250ZXh0LgogICogQFZNV19TTV80OiBDb250ZXh0IHN1cHBvcnQg
dXB0byBTTTQuCiAgKiBAVk1XX1NNXzRfMTogQ29udGV4dCBzdXBwb3J0IHVwdG8gU000XzEuCisg
KiBAVk1XX1NNXzU6IENvbnRleHQgc3VwcG9ydCB1cCB0byBTTTUuCiAgKiBAVk1XX1NNX01BWDog
U2hvdWxkIGJlIHRoZSBsYXN0LgogICovCiBlbnVtIHZtd19zbV90eXBlIHsKIAlWTVdfU01fTEVH
QUNZID0gMCwKIAlWTVdfU01fNCwKIAlWTVdfU01fNF8xLAorCVZNV19TTV81LAogCVZNV19TTV9N
QVgKIH07CiAKQEAgLTY5Nyw2ICs2OTksMTcgQEAgc3RhdGljIGlubGluZSBib29sIGhhc19zbTRf
MV9jb250ZXh0KGNvbnN0IHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYpCiAJcmV0dXJuIChk
ZXZfcHJpdi0+c21fdHlwZSA+PSBWTVdfU01fNF8xKTsKIH0KIAorLyoqCisgKiBoYXNfc201X2Nv
bnRleHQgLSBEb2VzIHRoZSBkZXZpY2Ugc3VwcG9ydCBTTTUgY29udGV4dC4KKyAqIEBkZXZfcHJp
djogRGV2aWNlIHByaXZhdGUuCisgKgorICogUmV0dXJuOiBCb29sIHZhbHVlIGlmIGRldmljZSBz
dXBwb3J0IFNNNSBjb250ZXh0IG9yIG5vdC4KKyAqLworc3RhdGljIGlubGluZSBib29sIGhhc19z
bTVfY29udGV4dChjb25zdCBzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2KQoreworCXJldHVy
biAoZGV2X3ByaXYtPnNtX3R5cGUgPj0gVk1XX1NNXzUpOworfQorCiBleHRlcm4gdm9pZCB2bXdf
c3ZnYV9lbmFibGUoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdik7CiBleHRlcm4gdm9pZCB2
bXdfc3ZnYV9kaXNhYmxlKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYpOwogCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
