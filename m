Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F05A325BD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 02:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF92E89179;
	Mon,  3 Jun 2019 00:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B71689179
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 00:40:32 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so7550390qto.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 17:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/qqj0h+CJDx/iXGnddF9PrbfGue2/uZ3W4VUzaUVLgM=;
 b=XtgNyn1nhAATYi0GMax22//KBlCw/L9COJqFyAJFZmyLyb7YLzSd0mOhebFnc6BDWb
 Y+ivl50W8+bR7UriDzH2Ztxib8HqW/Yc/zVyjjwZpo8KPG/DDCmSzffT++dH+KSI6Sgc
 bca8k9czcjKX9raY5dT/5mlFz8ayVKAWJ3pM0aQeNFuzj1ssFV+vKaeRn4cBVIxXG2/g
 fYq2L4f2irQVjkB+1CuwC36pc2EROT96oV7HcJRb/T2EUnY5CExQ75hC1B1OX8htYl68
 jnOucsFyGAziMdwK9H6BK0f9LCtP1I7EvpgHsgPpBgwAUU80ueNx34lTn0coaJ76kGI5
 vpkw==
X-Gm-Message-State: APjAAAUnZ+ixd8fRfatTz747G0s0Qrc6XLASkAv7h+ILAf0HcUHBpxmc
 kYFUhiuhuWdvc5TNs1VFNVVaJDYuXrg=
X-Google-Smtp-Source: APXvYqx93DDKX9/PNXf6txNmTBFL2AZOUiZBTLm6EXmSLQFLwGH0I06+/Xi6dxJLuFNTTnqts537WA==
X-Received: by 2002:ac8:19d8:: with SMTP id s24mr20714452qtk.44.1559522430847; 
 Sun, 02 Jun 2019 17:40:30 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id t8sm1432609qtc.80.2019.06.02.17.40.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 17:40:30 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 06/10] modetest: don't pretend that atomic mode
 includes a format
Date: Sun,  2 Jun 2019 20:40:14 -0400
Message-Id: <20190603004017.7114-7-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603004017.7114-1-imirkin@alum.mit.edu>
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/qqj0h+CJDx/iXGnddF9PrbfGue2/uZ3W4VUzaUVLgM=;
 b=FABnQR/smP5+5h5dK2DnbFZi2mHjcKFtmjy+dWMqnrxn6Rumff8NWQpFozhaXp5Dv+
 ue+MOxZ637B5wfqcy+Hfk09vRWXGTANhegOX0AR4Sz+aPwE80LhhdmUk4dHwEg4Mxmec
 0vNhkK+3WTNIDQ/iKQICRlCc+X3bHGBBoyy/mr3Cif2GzdmixMaw7XnbuIF2suDpfJq4
 qkMW0BiZiI9tx6zZ7rhdcwQHLErErJHLjGOVPRygADDGhHPlCp8ttl47FfNBpyBcU5pU
 MSf9aljZ3nTfCUmVj18QKgkiicMbE2kVEZa9rAW5/IVQmkCFFXjA8oIrePUZPBhLCg0b
 K4cQ==
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

U2lnbmVkLW9mZi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgotLS0KIHRl
c3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvbW9kZXRlc3QvbW9k
ZXRlc3QuYyBiL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMKaW5kZXggOWM4NWMwN2IuLmExYzgx
ZjZjIDEwMDY0NAotLS0gYS90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCisrKyBiL3Rlc3RzL21v
ZGV0ZXN0L21vZGV0ZXN0LmMKQEAgLTEzMzUsOCArMTMzNSw4IEBAIHN0YXRpYyB2b2lkIGF0b21p
Y19zZXRfbW9kZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwaXBlX2FyZyAqcGlwZXMsIHVu
c2lnbmVkCiAJCWlmIChwaXBlLT5tb2RlID09IE5VTEwpCiAJCQljb250aW51ZTsKIAotCQlwcmlu
dGYoInNldHRpbmcgbW9kZSAlcy0lZEh6QCVzIG9uIGNvbm5lY3RvcnMgIiwKLQkJICAgICAgIHBp
cGUtPm1vZGVfc3RyLCBwaXBlLT5tb2RlLT52cmVmcmVzaCwgcGlwZS0+Zm9ybWF0X3N0cik7CisJ
CXByaW50Zigic2V0dGluZyBtb2RlICVzLSVkSHogb24gY29ubmVjdG9ycyAiLAorCQkgICAgICAg
cGlwZS0+bW9kZV9zdHIsIHBpcGUtPm1vZGUtPnZyZWZyZXNoKTsKIAkJZm9yIChqID0gMDsgaiA8
IHBpcGUtPm51bV9jb25zOyArK2opIHsKIAkJCXByaW50ZigiJXMsICIsIHBpcGUtPmNvbnNbal0p
OwogCQkJYWRkX3Byb3BlcnR5KGRldiwgcGlwZS0+Y29uX2lkc1tqXSwgIkNSVENfSUQiLCBwaXBl
LT5jcnRjLT5jcnRjLT5jcnRjX2lkKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
