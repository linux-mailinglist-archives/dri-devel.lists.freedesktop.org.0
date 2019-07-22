Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63910709DC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 21:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF0F89D9B;
	Mon, 22 Jul 2019 19:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0506F89D9B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 19:41:21 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id t8so29421308qkt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 12:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kB6s0LxixsUdrEoDyNjNyDSaMtTeJyCEhzBXfC3VQVI=;
 b=tl+xdjk5hw2bbnNl0AGXMoOn7cl5CwFmhn9wOsxwrhNqLmgZEOu1dpCm7f3Pu++bad
 FLLrqKInXxYqjenBdzy1I0voboD0syHSA2k3j9ykPUidZ8nGqPEiRg9tfaHziwyiXMnb
 UVjEy83hNHqxebe8USfVcvAX4Iqw+Wci+hXt64NsD5N2v5k/G5tzj7ShUC27f7K+T8iW
 QTMTzpnMcr5/xkmkUFFYx8Vp51vbt5dxmW1sfXkcLGb/L5vO1kNY5yaO8C79RV1d92k4
 WHcnXYHH1sq/P0rwuezk81asjj2DfvXkie0Zfl7FYHgqfn/7DXfZJy5v+Y/wCQZ2IQjk
 uCNw==
X-Gm-Message-State: APjAAAV5ueuO9U/99w8qjjgxHDQCln+D9oic874QbPjUHSWAFEa9886Z
 uzvpz+v9yQ9VtaQSSP3XM14=
X-Google-Smtp-Source: APXvYqze94Nv4jwC/mfEMKYWknXVZdc3zbN2x0iNmGz8i1Af55Eb2dUAG6b2M7kdr+OJxmRzaNG7lg==
X-Received: by 2002:a37:bf07:: with SMTP id p7mr45577987qkf.315.1563824479899; 
 Mon, 22 Jul 2019 12:41:19 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
 by smtp.gmail.com with ESMTPSA id
 h18sm16409342qkj.134.2019.07.22.12.41.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 12:41:19 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: a.hajda@samsung.com
Subject: [PATCH] drm/bridge: Improve the help text for DRM_ANALOGIX_ANX78XX
Date: Mon, 22 Jul 2019 16:40:49 -0300
Message-Id: <20190722194049.20761-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kB6s0LxixsUdrEoDyNjNyDSaMtTeJyCEhzBXfC3VQVI=;
 b=JQJ+4rIUNVHplXYIP481BRM5nD2op1KrenTkX5k/Zot3PP/wBUl13nVFxujUg6eID5
 gNhTm41iIx2oG830pt8PEy13qljsYFncePXydDrh1S71gclRog7BdvTIIfPYkuhRv5iF
 c5a297JPO/lUqO9dQ/BbjFPlLH38RRll1ktwHavwjBk5WslY/5eKVR4PtwBVFeV8JcMU
 mQjwXYVmWKjCY6v4afsPCYCe96/zKa+h8aHR+5Pt18yLeb3uCfLAWaLsfAdn4L/c2lIW
 VtLYzW42NBaOBezNI6PXh1feEf9hCUbMYzMN6EDDliv7eU/bOKdBBxd5OOSR10lETrCq
 7KFQ==
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
Cc: enric.balletbo@collabora.com, Laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW1wcm92ZSB0aGUgaGVscCB0ZXh0IGZvciBEUk1fQU5BTE9HSVhfQU5YNzhYWCBieSBhZGRpbmcg
dGhlIG1pc3NpbmcKInBvd2VyIiB3b3JkLgoKQWZ0ZXIgdGhpcyBjaGFuZ2UgdGhlIGhlbHAgdGV4
dCBtYXRjaGVzIHdpdGggdGhlIEFOWDc4MTQKcHJvZHVjdCBkZXNjcmlwdGlvbiBmcm9tIHRoZSBB
bmFsb2dpeCB3ZWJzaXRlOgoKaHR0cHM6Ly93d3cuYW5hbG9naXguY29tL2VuL3Byb2R1Y3RzL2Nv
bnZlcnRlcnNicmlkZ2VzL2FueDc4MTQKClNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZl
c3RldmFtQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL0tjb25maWcKaW5kZXggZWU3Nzc0NjkyOTNhLi5hNmVlYzkwOGM0M2UgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL0tjb25maWcKQEAgLTIxLDcgKzIxLDcgQEAgY29uZmlnIERSTV9BTkFMT0dJWF9BTlg3
OFhYCiAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAJc2VsZWN0IFJFR01BUF9JMkMKIAktLS1oZWxw
LS0tCi0JICBBTlg3OFhYIGlzIGFuIHVsdHJhLWxvdyBGdWxsLUhEIFNsaW1Qb3J0IHRyYW5zbWl0
dGVyCisJICBBTlg3OFhYIGlzIGFuIHVsdHJhLWxvdyBwb3dlciBGdWxsLUhEIFNsaW1Qb3J0IHRy
YW5zbWl0dGVyCiAJICBkZXNpZ25lZCBmb3IgcG9ydGFibGUgZGV2aWNlcy4gVGhlIEFOWDc4WFgg
dHJhbnNmb3JtcwogCSAgdGhlIEhETUkgb3V0cHV0IG9mIGFuIGFwcGxpY2F0aW9uIHByb2Nlc3Nv
ciB0byBNeURQCiAJICBvciBEaXNwbGF5UG9ydC4KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
