Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AAC8E6A0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0286E916;
	Thu, 15 Aug 2019 08:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E166E0AF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:07:04 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id g2so51238963pfq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 02:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TtNu/nLiU2TdzmuEu+Rilo9sUZ9xkv/wApPk0SKUGzE=;
 b=mlRvAtRKYAYE3Rq0sMZVDWanf+vEQ7QdxlB6VRwyxvCwXNZd1mNU2GyNogpAkLXkrL
 ocQSClnX7/Lv/80PaRNOWv6YOA6fCKxJipe6RcuXQlSU7hPpMC+B+8eC2tfohYtZei/K
 /y5pgvoeOLAWBZ41CTHO5zilZRhI7i9X82EXPpz11LBD1BiBJVH9LTA2SVHavtevxkxs
 4FdHDnizn/ZXw5uEZ8Bt6TIEeMYqgVb0WRIZcRNLSXussdQqh7CC1pFeTdATpt+xK3u6
 f04f1Aezmi9I0TlfuuQw9yjcYquw4qU7HCnYsDUt4pm9LpqfJLvIVB90iTRqqZquUVih
 tYGA==
X-Gm-Message-State: APjAAAXHW+Wrz1tMejipM/c72AOb6KPIOV+iViVN2ejdKI5rZZZ28TXv
 AMP1yw+MjNPI7SmXm6Q2V94=
X-Google-Smtp-Source: APXvYqyNxnQrxnuNoJYgIDMLoMN8Lcvp08NEpiuPJvOp07UiD8blw9G5/cvkrORh5jO2YcyuraATiQ==
X-Received: by 2002:a17:90a:fd8c:: with SMTP id
 cx12mr1257999pjb.95.1565687224589; 
 Tue, 13 Aug 2019 02:07:04 -0700 (PDT)
Received: from localhost.localdomain ([122.163.110.75])
 by smtp.gmail.com with ESMTPSA id j15sm106688226pfr.146.2019.08.13.02.07.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 02:07:04 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, laurent.pinchart@ideasonboard.com
Subject: [PATCH] drm: dw-hdmi-i2s: Make structure dw_hdmi_i2s_ops constant
Date: Tue, 13 Aug 2019 14:36:50 +0530
Message-Id: <20190813090650.9292-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TtNu/nLiU2TdzmuEu+Rilo9sUZ9xkv/wApPk0SKUGzE=;
 b=mFyhkAkT4/M1HF4agR81ypnkQt9tKspQHRjoMj+dWQxa8TnxNjp8jZ40LWkuGG5rA5
 5w4fmIwkvHcczYGH48iwCGlGOHEHdSazIgcKSfv0MoP8nstCkyXxldZwDupA8x7WYfqD
 x59DomVJWy2Ld0U9qfc7g6noRvNnV6E4co20jto4fRxJZuOBE0UaUqB8uzv3vJoEbq9X
 1ET+0PdX38o1GsyRx/zAyKgp54g+bOXNagCGsekRmT0ZP6UHI/14tB7LZOx/yho5tpli
 WC57Zl9zI+Hshqi1kqGyp1jLRtR6qRm2j2quhQrMNVV4G33ic6IEwx/CyMtb69kB/h0X
 Fzfg==
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RhdGljIHN0cnVjdHVyZSBkd19oZG1pX2kyc19vcHMsIG9mIHR5cGUgaGRtaV9jb2RlY19vcHMs
IGlzIHVzZWQgb25seQp3aGVuIGFzc2lnbmVkIGFzIGEgdmFsdWUgdG8gZmllbGQgb3BzIG9mIHZh
cmlhYmxlIHBkYXRhLCB3aGljaCBoYXMgdHlwZQpoZG1pX2NvZGVjX3BkYXRhLiBGaWVsZCBvcHMg
b2YgaGRtaV9jb2RlY19wZGF0YSBpcyBkZWNsYXJlZCBhcyBhIGNvbnN0OwpoZW5jZSBtYWtlIGR3
X2hkbWlfaTJzX29wcyBjb25zdGFudCBhcyB3ZWxsLgpJc3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVs
bGUuCgpTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEgPG5pc2hrYWRnLmxpbnV4QGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1
ZGlvLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkt
aTJzLWF1ZGlvLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJz
LWF1ZGlvLmMKaW5kZXggNWNiYjcxYTg2NmQ1Li4zNWRhZjlhMjE3MDggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKQEAgLTEw
NCw3ICsxMDQsNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2dldF9kYWlfaWQoc3RydWN0IHNu
ZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsCiAJcmV0dXJuIC1FSU5WQUw7CiB9CiAKLXN0YXRp
YyBzdHJ1Y3QgaGRtaV9jb2RlY19vcHMgZHdfaGRtaV9pMnNfb3BzID0geworc3RhdGljIGNvbnN0
IHN0cnVjdCBoZG1pX2NvZGVjX29wcyBkd19oZG1pX2kyc19vcHMgPSB7CiAJLmh3X3BhcmFtcwk9
IGR3X2hkbWlfaTJzX2h3X3BhcmFtcywKIAkuYXVkaW9fc2h1dGRvd24JPSBkd19oZG1pX2kyc19h
dWRpb19zaHV0ZG93biwKIAkuZ2V0X2RhaV9pZAk9IGR3X2hkbWlfaTJzX2dldF9kYWlfaWQsCi0t
IAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
