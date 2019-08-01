Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E57D3D5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D426E33E;
	Thu,  1 Aug 2019 03:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55706E33E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:44:55 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id c14so31424714plo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sbuPXH3VdFgx7EyiYaXP+7dzAxv9Alyn24o+MicDc3g=;
 b=ZtU9wxNvGFX4YX04Dp9U/tHmKrK0F9VTb5uwJ/ujdcdXtr7TOm4vlvBFrjXtouKuZG
 vFBQoLzxofdYmW6aov5TFky8cB6ENVsoHa15X/Hh+qy7wFa+cpu3Sv1Otz16gu2yvBGW
 9fUKsxk2vU1pb/UwHzYEx6+1N6vwoWfGU/nyvtynvknWlP24hUYgmQlKMBjFTjfQ5hE3
 TkEKVvZVU17Ln4SShx6aoO2mrrLgcWsB81cCfVHqDRm7iook2KBn1r6ixgmYTo2iZdsP
 jzOE0jOBGsC2jByYWI6Jem9gB+ngWaOesGRAb4N7KSf9y+qj0ExXbN05DcnRZgUjn88T
 UoHg==
X-Gm-Message-State: APjAAAWl3m9XUY4BQzZ0WRmhkKLnFXQ9p6MVN3/1YMK/chJUBmbTfgD9
 00ha+sgsABfmlBBddEf9lfwC5JCO+pU=
X-Google-Smtp-Source: APXvYqzmcmx5lYagz1N9Qyr8XCKv26OVvf3N44AMBU0z4Wll3KHYXMUEXbb/sT/a1R0ggUgnTgQ42w==
X-Received: by 2002:a17:902:2987:: with SMTP id
 h7mr29146186plb.37.1564631094884; 
 Wed, 31 Jul 2019 20:44:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.44.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:44:54 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 06/26] drm: kirin: Remove out_format from ade_crtc
Date: Thu,  1 Aug 2019 03:44:19 +0000
Message-Id: <20190801034439.98227-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sbuPXH3VdFgx7EyiYaXP+7dzAxv9Alyn24o+MicDc3g=;
 b=PNeeTf6CHxZtmleLM42uzK+kmr5gR/nqDqqSxXjOubaNccBQf+PsluK79zu0fwrSK+
 YoHl+OQVP6HivC2BNict9dp1CyvV92P83bB6AWsTC3CVograuwWVb4kcT+hlEYaNy6wp
 Yg/bNu/6r4VSnp4z3mHIFpPe/vpNDSgp8eAFPSm7pvHCtjSSaluDT8aj4GyXeKcucv22
 b/HWFxXZrbLewuFpZLwasAJcrr/89VT07i0bFvV/kmgWDbyAlQZpk95AIWRCHzN/U6cg
 Y30/O1WPhktFVgstl5QrhZ1km8wStdhadRCk3VhyfPuerwjrQZ7GLJaeMMhq5xXAv976
 oF7w==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgb3V0X2Zvcm1hdApmaWVsZCBp
biB0aGUgc3RydWN0IGFkZV9jcnRjLCB3aGljaCB3YXMgb25seSBldmVyIHNldCB0bwpMRElfT1VU
X1JHQl84ODguCgpUaHVzIHRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgZmllbGQgYW5kIGluc3RlYWQg
ZGlyZWN0bHkgdXNlcwpMRElfT1VUX1JHQl84ODguCgpDYzogUm9uZ3JvbmcgWm91IDx6b3Vyb25n
cm9uZ0BnbWFpbC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYt
Ynk6IFh1IFlpUGluZyA8eHV5aXBpbmdAaGlzaWxpY29uLmNvbT4KW2pzdHVsdHo6IHJld29yZGVk
IGNvbW1pdCBtZXNzYWdlXQpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2Ry
bV9hZGUuYyB8IDkgKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2ly
aW4va2lyaW5fZHJtX2FkZS5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJp
bl9kcm1fYWRlLmMKaW5kZXggNzU2YWVmZDViY2ZmLi43M2RmZjIxYmVkNmEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCkBAIC02MCw3ICs2
MCw2IEBAIHN0cnVjdCBhZGVfY3J0YyB7CiAJc3RydWN0IGFkZV9od19jdHggKmN0eDsKIAlzdHJ1
Y3Qgd29ya19zdHJ1Y3QgZGlzcGxheV9yZXNldF93cTsKIAlib29sIGVuYWJsZTsKLQl1MzIgb3V0
X2Zvcm1hdDsKIH07CiAKIHN0cnVjdCBhZGVfcGxhbmUgewpAQCAtMzgzLDExICszODIsMTAgQEAg
c3RhdGljIGlycXJldHVybl90IGFkZV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQog
CXJldHVybiBJUlFfSEFORExFRDsKIH0KIAotc3RhdGljIHZvaWQgYWRlX2Rpc3BsYXlfZW5hYmxl
KHN0cnVjdCBhZGVfY3J0YyAqYWNydGMpCitzdGF0aWMgdm9pZCBhZGVfZGlzcGxheV9lbmFibGUo
c3RydWN0IGFkZV9od19jdHggKmN0eCkKIHsKLQlzdHJ1Y3QgYWRlX2h3X2N0eCAqY3R4ID0gYWNy
dGMtPmN0eDsKIAl2b2lkIF9faW9tZW0gKmJhc2UgPSBjdHgtPmJhc2U7Ci0JdTMyIG91dF9mbXQg
PSBhY3J0Yy0+b3V0X2Zvcm1hdDsKKwl1MzIgb3V0X2ZtdCA9IExESV9PVVRfUkdCXzg4ODsKIAog
CS8qIGVuYWJsZSBvdXRwdXQgb3ZlcmxheSBjb21wb3NpdG9yICovCiAJd3JpdGVsKEFERV9FTkFC
TEUsIGJhc2UgKyBBREVfT1ZMWVhfQ1RMKE9VVF9PVkxZKSk7CkBAIC01MTQsNyArNTEyLDcgQEAg
c3RhdGljIHZvaWQgYWRlX2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
CiAJfQogCiAJYWRlX3NldF9tZWRpYW5vY19xb3MoY3R4KTsKLQlhZGVfZGlzcGxheV9lbmFibGUo
YWNydGMpOworCWFkZV9kaXNwbGF5X2VuYWJsZShjdHgpOwogCWFkZV9kdW1wX3JlZ3MoY3R4LT5i
YXNlKTsKIAlkcm1fY3J0Y192Ymxhbmtfb24oY3J0Yyk7CiAJYWNydGMtPmVuYWJsZSA9IHRydWU7
CkBAIC0xMDI0LDcgKzEwMjIsNiBAQCBzdGF0aWMgaW50IGFkZV9kcm1faW5pdChzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCWN0eCA9ICZhZGUtPmN0eDsKIAlhY3J0YyA9ICZhZGUtPmFj
cnRjOwogCWFjcnRjLT5jdHggPSBjdHg7Ci0JYWNydGMtPm91dF9mb3JtYXQgPSBMRElfT1VUX1JH
Ql84ODg7CiAKIAlyZXQgPSBhZGVfZHRzX3BhcnNlKHBkZXYsIGN0eCk7CiAJaWYgKHJldCkKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
