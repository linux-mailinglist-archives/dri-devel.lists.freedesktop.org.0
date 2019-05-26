Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B72B43B
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C53889CF3;
	Mon, 27 May 2019 12:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B6C6E1AA;
 Sun, 26 May 2019 07:45:19 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id p15so5826693pll.4;
 Sun, 26 May 2019 00:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=VAt6DbC3uyBoi5PZNxE9OjYXPKcKQXfx3l8tLzBYq0A=;
 b=tGNCwkke5zSNynE6/5Ii5/aPbzZp++fDcz+q21u5FYEvREqal82Y/jV3rWxns/CyBw
 o0LSrtDxwqSe3DmzTG0ztF22QYuthnCSNTSJCiMjnyStZQt2CQj6EjhGHGXiI2VbyXTl
 YXKSMNGN0CSDM2690jqHi9h2wRYgFdrDQ88wkpuQ2kIckVBDgPdRLjYv6DbHRAXi7SFf
 j6mn7gOs58Nr2Na9pIM5PRiqT5sFulX4MUA27mDkmkRG7NTixPOT+fsqa1jL6Al6QbTd
 Q4DVl2DPTSBRbFDNKgwFlaelA9wvwt/jUBdPF7B1P1n+mZTusatN3OoK9zk1OIFlnbu2
 0gNQ==
X-Gm-Message-State: APjAAAW4Z3o/g/ZOkVCkyYCG1IceYxRVhsfKkMRvMzErLuY9daEEcpW9
 ZR9NzIejDfTByQWztho8bTw=
X-Google-Smtp-Source: APXvYqwF+Idy7jy5iz6AKlK772bSslul00wZ+DlZb0hnUsu3daL1oin71nd1enm5WhMSMNalHw67XA==
X-Received: by 2002:a17:902:a982:: with SMTP id
 bh2mr14751046plb.224.1558856719110; 
 Sun, 26 May 2019 00:45:19 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
 by smtp.gmail.com with ESMTPSA id u5sm6243039pgp.19.2019.05.26.00.45.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 00:45:18 -0700 (PDT)
Date: Sun, 26 May 2019 13:15:12 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu/powerplay: remove duplicate entry of
 nbio_6_1_offset.h
Message-ID: <20190526074512.GA8744@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=VAt6DbC3uyBoi5PZNxE9OjYXPKcKQXfx3l8tLzBYq0A=;
 b=FiWGnqRaC5yqdshGwYibL2AFl+2M1swCOkLAPTwvquRcU9beRVqKVBmHKQ0jk0DZzp
 pW30AQ3ott+f2zJn/FhyhCiiLD58UEYDCEKyc93IxsTCw94EzezXGOdY7XKIYqHCx7Gg
 Kb/vaBkvpK6D46slJB+tpvZZETF19r5ojI5hp3snaszXqRtQ+1YfVrs1MJu7ghN4WVkU
 IPm6A6XCAlLAx3F8Xsaccdb6bwRJMVy0k0zFhFwkECAIX+i981whj3Mr+fZ6yu+lS1gM
 P8c3FU5ebIaahoVF+cbsII4wwrPiiq0u+1MD0DZisKrscD7EWDCE6DwGx0QZt8evmvKJ
 Gnkg==
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

YXNpY19yZWcvbmJpby9uYmlvXzZfMV9vZmZzZXQuaCBpcyBpbmNsdWRlZCB0d2ljZS4KCklzc3Vl
IGlkZW50aWZpZWQgYnkgaW5jbHVkZWNoZWNrCgpTaWduZWQtb2ZmLWJ5OiBIYXJpcHJhc2FkIEtl
bGFtIDxoYXJpcHJhc2FkLmtlbGFtQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci92ZWdhMTJfaW5jLmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdt
Z3IvdmVnYTEyX2luYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTEyX2luYy5oCmluZGV4IGU2ZDllODQuLjBkMDhjNTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9pbmMuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaW5jLmgKQEAgLTM1LDcgKzM1LDYgQEAKICNp
bmNsdWRlICJhc2ljX3JlZy9nYy9nY185XzJfMV9zaF9tYXNrLmgiCiAKICNpbmNsdWRlICJhc2lj
X3JlZy9uYmlvL25iaW9fNl8xX29mZnNldC5oIgotI2luY2x1ZGUgImFzaWNfcmVnL25iaW8vbmJp
b182XzFfb2Zmc2V0LmgiCiAjaW5jbHVkZSAiYXNpY19yZWcvbmJpby9uYmlvXzZfMV9zaF9tYXNr
LmgiCiAKICNlbmRpZgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
