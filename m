Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B542144DD
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 12:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EB76E3F7;
	Sat,  4 Jul 2020 10:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FDE6E3FE
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:28:17 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id d17so25071383ljl.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dH3Z+kl6o2dfyL4qa34soh2RFGX0Yk+95gG53PZ+Qhc=;
 b=LbV/lzm9Up0Af/PHNmdJb1SKGNfb9UGu3e2qs9Di60vbsRUnOy0HPKp8LZ6Vjrkacd
 XMyEwV7tyMOozy4z2EaLghCwhIPGmciDcyI/OlC++BSPJhciHz1R6dez8cxfpKE/d122
 DMSWCBt7+epuwby5iA9Ur8WUK77oGH7zJCoQHWFHsmgQKsD+UzgTxjkM84GYgDCMyjlS
 72bBw4uipL+K68cA3zem3Y4gFq1YD2VH6h/R86tu3ogDpxT3h8igJdA/JXOAKRWEj+5g
 qDxvmca3pDcCCDAFCX9MBxJg0j7U9upwLiI/+xH+rVrCTabKv40FSk5oPkOUaGQD6pI6
 bdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dH3Z+kl6o2dfyL4qa34soh2RFGX0Yk+95gG53PZ+Qhc=;
 b=NpHP5jyvmgavSlZsYyIF4IKjmpkGE7rOWcjOjqBlBAIgo9w0S4h/YycrzGZAtWS+PU
 Qx0Gu/fCUzKxjzNUDa6KifslZdnpzK9MgxaqH/P12MnSGO80D+7iiZbYGUaERk+8EHIs
 QpMhjUbW4nTSum01b8VGV/el/cHj01FvIL2GYuHpM8VVXM7qiKF6f98kT5141dVV+5KZ
 DTT3uzAK9Ic/Y/44sm8LHOyRpxfutl0XS3SOyihcC/NcT2JF5XfpDpno3KHBS/1doYFE
 Lgi5UEPChOU/+GJgjg8j6yR6kzCauoZlXEmZuIPmc7TTf27a2JfqdCA8sqshJ+IxPElk
 dTug==
X-Gm-Message-State: AOAM5305ZvN3fGe4ia5arrtKIiz0Tf0uhLxSHSSttZEFcRTt5w39AUgj
 0stXT88OMvtG19boC4vaC02w4GoK8mM=
X-Google-Smtp-Source: ABdhPJzI3dJJQeiYqiDo0ihYX8hL5jZulRnJVw1oAb0UE5nqMPJFhton/eIHFX/lTwvHSYpTjKI5qA==
X-Received: by 2002:a2e:4812:: with SMTP id v18mr22742267lja.353.1593858495778; 
 Sat, 04 Jul 2020 03:28:15 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id z23sm5366913ljz.3.2020.07.04.03.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:28:15 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: display: convert innolux,
 p079zca to DT Schema
Date: Sat,  4 Jul 2020 12:28:04 +0200
Message-Id: <20200704102806.735713-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102806.735713-1-sam@ravnborg.org>
References: <20200704102806.735713-1-sam@ravnborg.org>
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
Cc: Chris Zhong <zyw@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgdGhlIGJpbmRpbmcgbWF0Y2hlcyBwYW5lbC1zaW1wbGUtZHNpLCBhZGRlZCB0aGUgY29tcGF0
aWJsZSB0byB0aGUKcGFuZWwtc2ltcGxlLWRzaSBsaXN0LgpXaXRoIHRoaXMgY2hhbmdlIGVuYWJs
ZS1ncGlvcyBpcyBub3cgb3B0aW9uYWwuCgp2MjoKICAtIEl0IGlzIGEgRFNJIHBhbmVsLCBhZGQg
aXQgdG8gcGFuZWwtc2ltcGxlLWRzaSAoUm9iKQoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KQ2M6
IENocmlzIFpob25nIDx6eXdAcm9jay1jaGlwcy5jb20+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhp
ZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PgotLS0KIC4uLi9kaXNwbGF5L3BhbmVsL2lubm9sdXgscDA3OXpjYS50eHQgICAgICAgICB8IDIy
IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS1kc2ku
eWFtbCAgICAgICB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjIg
ZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvaW5ub2x1eCxwMDc5emNhLnR4dAoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lubm9sdXgs
cDA3OXpjYS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9pbm5vbHV4LHAwNzl6Y2EudHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAz
YWI4Yzc0MTJjZjYuLjAwMDAwMDAwMDAwMAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LHAwNzl6Y2EudHh0CisrKyAvZGV2L251bGwK
QEAgLTEsMjIgKzAsMCBAQAotSW5ub2x1eCBQMDc5WkNBIDcuODUiIDc2OHgxMDI0IFRGVCBMQ0Qg
cGFuZWwKLQotUmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJp
bm5vbHV4LHAwNzl6Y2EiCi0tIHJlZzogRFNJIHZpcnR1YWwgY2hhbm5lbCBvZiB0aGUgcGVyaXBo
ZXJhbAotLSBwb3dlci1zdXBwbHk6IHBoYW5kbGUgb2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3Zp
ZGVzIHRoZSBzdXBwbHkgdm9sdGFnZQotLSBlbmFibGUtZ3Bpb3M6IHBhbmVsIGVuYWJsZSBncGlv
Ci0KLU9wdGlvbmFsIHByb3BlcnRpZXM6Ci0tIGJhY2tsaWdodDogcGhhbmRsZSBvZiB0aGUgYmFj
a2xpZ2h0IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKLQotRXhhbXBsZToKLQotCSZtaXBp
X2RzaSB7Ci0JCXBhbmVsQDAgewotCQkJY29tcGF0aWJsZSA9ICJpbm5vbHV4LHAwNzl6Y2EiOwot
CQkJcmVnID0gPDA+OwotCQkJcG93ZXItc3VwcGx5ID0gPC4uLj47Ci0JCQliYWNrbGlnaHQgPSA8
JmJhY2tsaWdodD47Ci0JCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW8xIDEzIEdQSU9fQUNUSVZFX0hJ
R0g+OwotCQl9OwotCX07CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUtZHNpLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUtZHNpLnlhbWwK
aW5kZXggMTY3NzhjZTc4MmZjLi5jMGRkOWZhMjlmMWQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS1kc2kueWFt
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9w
YW5lbC1zaW1wbGUtZHNpLnlhbWwKQEAgLTMzLDYgKzMzLDggQEAgcHJvcGVydGllczoKICAgICAg
IC0gYXVvLGIwODB1YW4wMQogICAgICAgICAjIEJvZSBDb3Jwb3JhdGlvbiA4LjAiIFdVWEdBIFRG
VCBMQ0QgcGFuZWwKICAgICAgIC0gYm9lLHR2MDgwd3VtLW5sMAorICAgICAgICAjIElubm9sdXgg
UDA3OVpDQSA3Ljg1IiA3Njh4MTAyNCBURlQgTENEIHBhbmVsCisgICAgICAtIGlubm9sdXgscDA3
OXpjYQogICAgICAgICAjIEtpbmdkaXNwbGF5IEtEMDk3RDA0IDkuNyIgMTUzNngyMDQ4IFRGVCBM
Q0QgcGFuZWwKICAgICAgIC0ga2luZ2Rpc3BsYXksa2QwOTdkMDQKICAgICAgICAgIyBMRyBBQ1g0
NjdBS00tNyA0Ljk1IiAxMDgww5cxOTIwIExDRCBQYW5lbAotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
