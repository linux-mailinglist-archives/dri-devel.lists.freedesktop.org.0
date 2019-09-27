Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B97C1936
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 21:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98566E328;
	Sun, 29 Sep 2019 19:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6336E198
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 17:42:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d17so2527142lfa.7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 10:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=R2dWFPB086+p8xJ/thjxb6g8VFmjwb9hHyVKeU6WZ/0=;
 b=ao9RmTgPt5vC1XfoEuBJoxinNOQZonDrRYQxNmSn6ph4gqeqOnTjmdiHIInCzZzYjU
 wqCOkxIVbbv5mv3UDHBaUKkpyqDPuVS6v0VbPLgXj1japVGuYRiB6feYK1UBHGwlthBQ
 lYA/buWEEPnSFFkMaB0jssFswtTSb5bzTPbZAJxKKKusDgCrQPjlFQcPO8q9JVMNGg+9
 PkedsVa9z2nKEK19uoWvUThYItOWi6IpRo9o5PMMOVkPKm/Ddcpg2dB9WoshHtQKn2Tm
 LDfDTX+fcoDk5Cz6i3Rm/YsrjJFiwKg5Lcu3rVzfskUi+G3W2QRnealRXIEWEImBmhOv
 Dlwg==
X-Gm-Message-State: APjAAAWRrEGaXfE8CtWUfXC0glIMFQcRjlCGFjkBmApb0qKNtqyhhNgh
 +RGI8BeCFoVr2h0xu7ElC34=
X-Google-Smtp-Source: APXvYqwGr8bV/GXzdC57sgkSs7LFXCZslMzPQlxL9Rrsc5AoXYXN3FwkcvWhOTriaNZpytJdaCRwiQ==
X-Received: by 2002:ac2:50c5:: with SMTP id h5mr3557274lfm.105.1569606162813; 
 Fri, 27 Sep 2019 10:42:42 -0700 (PDT)
Received: from huvuddator (132-228.soderhamn.com. [80.245.228.132])
 by smtp.gmail.com with ESMTPSA id g27sm578026lja.33.2019.09.27.10.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 10:42:41 -0700 (PDT)
Date: Fri, 27 Sep 2019 19:42:32 +0200
From: Ulf Magnusson <ulfalizer@gmail.com>
To: linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com
Subject: [PATCH] drm/tiny: Kconfig: Remove always-y THERMAL dep. from
 TINYDRM_REPAPER
Message-ID: <20190927174218.GA32085@huvuddator>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 29 Sep 2019 19:47:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=R2dWFPB086+p8xJ/thjxb6g8VFmjwb9hHyVKeU6WZ/0=;
 b=Sy1Htyq5XwwO9o5yPUeSrTq7Dh7gibf4TrUuEOuXgqrIeKy/zx6N84M0Fl98VqBhE6
 724CVD4qRV7BymXYazp+pyZBZxXyyyKGWZvi8nRI2K8CC/ClKQvsD3WmOns1f/wsPx3K
 6Y7bSANa18K1yRjHsaZ/l/HPIpGdss2SAKj6UBf7phbE8uJMQsuL4A3B6sC6YEcD9vpO
 xmrl9MasDD+8SgnNaLuXe/HHQyGIF+u1wBGPKJ8lQHQHjRNzmw72qocRGWhlwKgJH6MV
 WQJ2Cdzz4p5aCc5XacVTjoT41/RJ8ud/YGTIbq7ZOu4Pfd2ri74EiHHpXasNWQhcZsGu
 jZIQ==
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
Cc: david@lechnology.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com, tglx@linutronix.de,
 sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IDU1NGIzNTI5ZmUwMSAoInRoZXJtYWwvZHJpdmVycy9jb3JlOiBSZW1vdmUgdGhlIG1v
ZHVsZSBLY29uZmlnJ3MKb3B0aW9uIikgY2hhbmdlZCB0aGUgdHlwZSBvZiBUSEVSTUFMIGZyb20g
dHJpc3RhdGUgdG8gYm9vbCwgc28KVEhFUk1BTCB8fCAhVEhFUk1BTCBpcyBub3cgYWx3YXlzIHku
IFJlbW92ZSB0aGUgcmVkdW5kYW50IGRlcGVuZGVuY3kuCgpEaXNjb3ZlcmVkIHRocm91Z2ggS2Nv
bmZpZ2xpYiBkZXRlY3RpbmcgYSBkZXBlbmRlbmN5IGxvb3AuIFRoZSBDIHRvb2xzCnNpbXBsaWZ5
IHRoZSBleHByZXNzaW9uIHRvIHkgYmVmb3JlIHJ1bm5pbmcgZGVwZW5kZW5jeSBsb29wIGRldGVj
dGlvbiwKYW5kIHNvIGRvbid0IHNlZSBpdC4gQ2hhbmdpbmcgdGhlIHR5cGUgb2YgVEhFUk1BTCBi
YWNrIHRvIHRyaXN0YXRlIG1ha2VzCnRoZSBDIHRvb2xzIGRldGVjdCB0aGUgc2FtZSBsb29wLgoK
Tm90IHN1cmUgaWYgcnVubmluZyBkZXAuIGxvb3AgZGV0ZWN0aW9uIGFmdGVyIHNpbXBsaWZpY2F0
aW9uIGNhbiBiZQpjYWxsZWQgYSBidWcuIEZpeGluZyB0aGlzIG5pdCB1bmJyZWFrcyBLY29uZmln
bGliIG9uIHRoZSBrZXJuZWwgYXQKbGVhc3QuCgpTaWduZWQtb2ZmLWJ5OiBVbGYgTWFnbnVzc29u
IDx1bGZhbGl6ZXJAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L0tjb25maWcg
fCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3RpbnkvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L0tjb25maWcKaW5k
ZXggNTA0NzYzNDIzZDQ2Li5hNDZhYzI4NGRkNWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90aW55L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvS2NvbmZpZwpAQCAtNjMs
NyArNjMsNiBAQCBjb25maWcgVElOWURSTV9SRVBBUEVSCiAJZGVwZW5kcyBvbiBEUk0gJiYgU1BJ
CiAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAJc2VsZWN0IERSTV9LTVNfQ01BX0hFTFBFUgotCWRl
cGVuZHMgb24gVEhFUk1BTCB8fCAhVEhFUk1BTAogCWhlbHAKIAkgIERSTSBkcml2ZXIgZm9yIHRo
ZSBmb2xsb3dpbmcgUGVydmFzaXZlIERpc3BsYXlzIHBhbmVsczoKIAkgIDEuNDQiIFRGVCBFUEQg
UGFuZWwgKEUxMTQ0Q1MwMjEpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
