Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C29325BE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 02:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0FF89247;
	Mon,  3 Jun 2019 00:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124F989191
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 00:40:33 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z24so375476qtj.10
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 17:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ATWiCr8lL4fTBAk1C1cfAB0esHAAvcQDcst3yVIin4s=;
 b=iXoNdMrQhgKoE4WsbAFiQb3jxAeAGCFTyjjAK0iNjPbzhpeUt3CYUuhAsnzHBebDNh
 /JG1EuFV8OdngMZuhwEZidNaCx1y6ZaJdtXldUP4/Ss5wmoQnlrrcUAyQK4c0ZvAE65V
 sAm4iD4fESVQ0vPwlFM4A1oKC3fM1Pe8Bdn+AjJki9dQS08RSQLW82RYIxuA97E6iEAW
 CzhKWwrRtfR2RAk/+RtrIcYpnc4uiyn2991WZ914FjzYgJKYuna0rmtQuIN3nePTA3wy
 LBRIXZkhuBzKhxy9zxb++bjPc4EwIolwbqf7v06YQmt7X9dZpsLiZ8ABzQtpz2FHjXJ8
 nWxQ==
X-Gm-Message-State: APjAAAUoRIn3PsNUmTfoNbwcLdHZPvQY/gPWgHxMtdTO+70CNKv3vJg+
 XSS6TftVblJd/RP/+PEYtGqmuDDPbP0=
X-Google-Smtp-Source: APXvYqyzACUPR7Clco4dekYjpFQJbxhdd1JBtX5hjwADJBD562x61O/Jbs14DPv0YEmuZnBC8zXg8A==
X-Received: by 2002:ac8:1018:: with SMTP id z24mr20248871qti.206.1559522431921; 
 Sun, 02 Jun 2019 17:40:31 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id t8sm1432609qtc.80.2019.06.02.17.40.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 17:40:31 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 07/10] modetest: add an add_property_optional variant
 that does not print errors
Date: Sun,  2 Jun 2019 20:40:15 -0400
Message-Id: <20190603004017.7114-8-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603004017.7114-1-imirkin@alum.mit.edu>
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ATWiCr8lL4fTBAk1C1cfAB0esHAAvcQDcst3yVIin4s=;
 b=sy0hDuxR+fyW1cz43WbymETqZgaKrj3XDPyUB1kJCTX0MqWq4bkEaz1E1LEmRAHnGz
 6RIqOONbQ5v+yRWIEUUjvehD97u+1a9FWiNzl3Hkcj5siwsrvItHbHUldqyO3ZJqzhgR
 BzZO9hdpv0Jufd4WOOY3PNOvh4hz4gSVp95zANsxMf1OpEOpnnS+5e1AAIbT1+NvSRPW
 03TBUxg/epCnxqAMF/UE3DrKdblc7qCdgb2fkEN3i0/iL/ad3jkbN9ynRob16wuoqf87
 IIgX0N1DlIzBcs2BJlSIzMJXhuOGxNLJ77y94/eP7tX8VmYiKkNMFk1Q1/RGc2AMo//x
 mS2A==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgbmV3IGZlYXR1cmVzIGFyZSBhZGRlZCBhbmQgb3RoZXJzIGFyZSBkZWNsYXJlZCB0byBiZSBs
ZWdhY3ksIGl0J3MKbmljZSB0byBiZSBhYmxlIHRvIGltcGxlbWVudCBmYWxsYmFja3MuIEFzIHN1
Y2gsIGNyZWF0ZSBhCnByb3BlcnR5LXNldHRpbmcgdmFyaWFudCB0aGF0IGRvZXMgbm90IGdlbmVy
YXRlIGVycm9ycyB3aGljaCBjYW4gdmVyeQp3ZWxsIGJlIGVudGlyZWx5IGV4cGVjdGVkLgoKV2ls
bCBiZSB1c2VkIGZvciBnYW1tYSBjb250cm9sIGluIGEgZnV0dXJlIGNoYW5nZS4KClNpZ25lZC1v
ZmYtYnk6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4KLS0tCiB0ZXN0cy9tb2Rl
dGVzdC9tb2RldGVzdC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCmlu
ZGV4IGExYzgxZjZjLi43MWRkYzg2MSAxMDA2NDQKLS0tIGEvdGVzdHMvbW9kZXRlc3QvbW9kZXRl
c3QuYworKysgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCkBAIC05NDgsOSArOTQ4LDEwIEBA
IHN0cnVjdCBwcm9wZXJ0eV9hcmcgewogCWNoYXIgbmFtZVtEUk1fUFJPUF9OQU1FX0xFTisxXTsK
IAl1aW50MzJfdCBwcm9wX2lkOwogCXVpbnQ2NF90IHZhbHVlOworCWJvb2wgb3B0aW9uYWw7CiB9
OwogCi1zdGF0aWMgdm9pZCBzZXRfcHJvcGVydHkoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
cHJvcGVydHlfYXJnICpwKQorc3RhdGljIGJvb2wgc2V0X3Byb3BlcnR5KHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IHByb3BlcnR5X2FyZyAqcCkKIHsKIAlkcm1Nb2RlT2JqZWN0UHJvcGVydGll
cyAqcHJvcHMgPSBOVUxMOwogCWRybU1vZGVQcm9wZXJ0eVJlcyAqKnByb3BzX2luZm8gPSBOVUxM
OwpAQCAtOTgyLDEzICs5ODMsMTMgQEAgc3RhdGljIHZvaWQgc2V0X3Byb3BlcnR5KHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IHByb3BlcnR5X2FyZyAqcCkKIAlpZiAocC0+b2JqX3R5cGUgPT0g
MCkgewogCQlmcHJpbnRmKHN0ZGVyciwgIk9iamVjdCAlaSBub3QgZm91bmQsIGNhbid0IHNldCBw
cm9wZXJ0eVxuIiwKIAkJCXAtPm9ial9pZCk7Ci0JCQlyZXR1cm47CisJCXJldHVybiBmYWxzZTsK
IAl9CiAKIAlpZiAoIXByb3BzKSB7CiAJCWZwcmludGYoc3RkZXJyLCAiJXMgJWkgaGFzIG5vIHBy
b3BlcnRpZXNcbiIsCiAJCQlvYmpfdHlwZSwgcC0+b2JqX2lkKTsKLQkJcmV0dXJuOworCQlyZXR1
cm4gZmFsc2U7CiAJfQogCiAJZm9yIChpID0gMDsgaSA8IChpbnQpcHJvcHMtPmNvdW50X3Byb3Bz
OyArK2kpIHsKQEAgLTk5OSw5ICsxMDAwLDEwIEBAIHN0YXRpYyB2b2lkIHNldF9wcm9wZXJ0eShz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwcm9wZXJ0eV9hcmcgKnApCiAJfQogCiAJaWYgKGkg
PT0gKGludClwcm9wcy0+Y291bnRfcHJvcHMpIHsKLQkJZnByaW50ZihzdGRlcnIsICIlcyAlaSBo
YXMgbm8gJXMgcHJvcGVydHlcbiIsCi0JCQlvYmpfdHlwZSwgcC0+b2JqX2lkLCBwLT5uYW1lKTsK
LQkJcmV0dXJuOworCQlpZiAoIXAtPm9wdGlvbmFsKQorCQkJZnByaW50ZihzdGRlcnIsICIlcyAl
aSBoYXMgbm8gJXMgcHJvcGVydHlcbiIsCisJCQkJb2JqX3R5cGUsIHAtPm9ial9pZCwgcC0+bmFt
ZSk7CisJCXJldHVybiBmYWxzZTsKIAl9CiAKIAlwLT5wcm9wX2lkID0gcHJvcHMtPnByb3BzW2ld
OwpAQCAtMTAxNSw2ICsxMDE3LDggQEAgc3RhdGljIHZvaWQgc2V0X3Byb3BlcnR5KHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IHByb3BlcnR5X2FyZyAqcCkKIAlpZiAocmV0IDwgMCkKIAkJZnBy
aW50ZihzdGRlcnIsICJmYWlsZWQgdG8gc2V0ICVzICVpIHByb3BlcnR5ICVzIHRvICUiIFBSSXU2
NCAiOiAlc1xuIiwKIAkJCW9ial90eXBlLCBwLT5vYmpfaWQsIHAtPm5hbWUsIHAtPnZhbHVlLCBz
dHJlcnJvcihlcnJubykpOworCisJcmV0dXJuIHRydWU7CiB9CiAKIC8qIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tICovCkBAIC0xMDcyLDYgKzEwNzYsMTkgQEAgc3RhdGljIHZvaWQgYWRkX3Byb3BlcnR5KHN0
cnVjdCBkZXZpY2UgKmRldiwgdWludDMyX3Qgb2JqX2lkLAogCXNldF9wcm9wZXJ0eShkZXYsICZw
KTsKIH0KIAorc3RhdGljIGJvb2wgYWRkX3Byb3BlcnR5X29wdGlvbmFsKHN0cnVjdCBkZXZpY2Ug
KmRldiwgdWludDMyX3Qgb2JqX2lkLAorCQkJCSAgY29uc3QgY2hhciAqbmFtZSwgdWludDY0X3Qg
dmFsdWUpCit7CisJc3RydWN0IHByb3BlcnR5X2FyZyBwOworCisJcC5vYmpfaWQgPSBvYmpfaWQ7
CisJc3RyY3B5KHAubmFtZSwgbmFtZSk7CisJcC52YWx1ZSA9IHZhbHVlOworCXAub3B0aW9uYWwg
PSB0cnVlOworCisJcmV0dXJuIHNldF9wcm9wZXJ0eShkZXYsICZwKTsKK30KKwogc3RhdGljIGlu
dCBhdG9taWNfc2V0X3BsYW5lKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBsYW5lX2FyZyAq
cCwKIAkJCQkJCQlpbnQgcGF0dGVybiwgYm9vbCB1cGRhdGUpCiB7Ci0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
