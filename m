Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE17A4591
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 19:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF356E148;
	Sat, 31 Aug 2019 17:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47466E148
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 17:25:55 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id u17so5132685pgi.6
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 10:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=W+lYISWLd+dLXJ92WanX0SAmm2/oFeQWs1BfMT2py3w=;
 b=tzRB9ZWH+om5vs/FPmsjl0+yv1rSAQ1B0oVxWEkE1EMImVYojuU8fEgYc6ivdnQKnp
 ZvKZfgEvEHJDfgrh4gfqu4TSkc7T2h2vVIz5YTasCd0UYfZ5VKGA9O4Q1CY7uKWvjQuX
 CXMEcw7+/hewO9LqT7d90CRaoQFJmAS5rwW0C/xr/EmjVXR91eIBrDrUI81hqYudu0Lz
 GBrULqtb7jVAeqO49tPbxeNXm7BRiuNMbbBgUxVYJ6tgRKA5M4+NHWHNFITaW3AzJvti
 1swP+gbnRdcwRgJVk8GFfUaafNJ8vLo1TLZBFwdgtZWE7T8p+yQxRpBO6e9zv4ogkdd9
 PP6g==
X-Gm-Message-State: APjAAAWb2NuQFujL6umTCXZMd1OrTx/NVohxsGKlfdq9xGymLadyz8Kk
 q9N0IJ1qAqXqpS41t0ki+Ro=
X-Google-Smtp-Source: APXvYqxdoO9pFlTeP02tVUV36XLk12Ox0QdQ2UHgL0ppo691dkIMsMrSYKu0tKtaDl5y02Jj5/kgUg==
X-Received: by 2002:a17:90a:de0f:: with SMTP id
 m15mr4855206pjv.18.1567272355239; 
 Sat, 31 Aug 2019 10:25:55 -0700 (PDT)
Received: from raspberrypi ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id v8sm6151231pje.6.2019.08.31.10.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2019 10:25:54 -0700 (PDT)
Date: Sat, 31 Aug 2019 18:25:46 +0100
From: Sidong Yang <realwakka@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH] drm/vkms: Use alpha value to blend values.
Message-ID: <20190831172546.GA1972@raspberrypi>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=W+lYISWLd+dLXJ92WanX0SAmm2/oFeQWs1BfMT2py3w=;
 b=EnZ5tugQP34UeJgn4IKjljMkw6g/r2XQhYWuLXTTBrbhaKStb+RM0UVzzufhpp1qLv
 Ff8Ywjqj3au5uIP4uAbejFYh1DshxGMprh90esrq87mkg/MlR5mfIHwPLT1vOCXMZrYq
 u26RhYDgu8LqLRf6DrYGSGHXLgs6jjGIv3AGIrWuoQ3tMsU+WG4WFTtG7dudJQVTJxRb
 KXhMt6ktrAEKhhMHN/L3muV7uzKb83a/VxYfVsNltHbsPc0EKYfGdu962XXPRbJEjcOe
 x6loROZolOFlkaCR9Kapw0tT+ePPv4b1WsQ88b1gzFjlqvR9pJtoegxkY3AdX5OPoWrZ
 4vyQ==
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
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGFscGhhIHZhbHVlIHRvIGJsZW5kIHNvdXJjZSB2YWx1ZSBhbmQgZGVzdGluYXRpb24gdmFs
dWUgSW5zdGVhZCBvZgpqdXN0IG92ZXJ3cml0ZSB3aXRoIHNvdXJjZSB2YWx1ZS4KClNpZ25lZC1v
ZmYtYnk6IFNpZG9uZyBZYW5nIDxyZWFsd2Fra2FAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYyB8IDEzICsrKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3Zr
bXNfY29tcG9zZXIuYwppbmRleCBkNTU4NTY5NWM2NGQuLmI3NzYxODVlNWNiNSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYwpAQCAtNzUsNiArNzUsOSBAQCBzdGF0aWMgdm9pZCBi
bGVuZCh2b2lkICp2YWRkcl9kc3QsIHZvaWQgKnZhZGRyX3NyYywKIAlpbnQgeV9saW1pdCA9IHlf
c3JjICsgaF9kc3Q7CiAJaW50IHhfbGltaXQgPSB4X3NyYyArIHdfZHN0OwogCisJdTggKnNyYywg
KmRzdDsKKwl1MzIgYWxwaGEsIGludl9hbHBoYTsKKwogCWZvciAoaSA9IHlfc3JjLCBpX2RzdCA9
IHlfZHN0OyBpIDwgeV9saW1pdDsgKytpKSB7CiAJCWZvciAoaiA9IHhfc3JjLCBqX2RzdCA9IHhf
ZHN0OyBqIDwgeF9saW1pdDsgKytqKSB7CiAJCQlvZmZzZXRfZHN0ID0gZGVzdF9jb21wb3Nlci0+
b2Zmc2V0CkBAIC04NCw4ICs4NywxNCBAQCBzdGF0aWMgdm9pZCBibGVuZCh2b2lkICp2YWRkcl9k
c3QsIHZvaWQgKnZhZGRyX3NyYywKIAkJCQkgICAgICsgKGkgKiBzcmNfY29tcG9zZXItPnBpdGNo
KQogCQkJCSAgICAgKyAoaiAqIHNyY19jb21wb3Nlci0+Y3BwKTsKIAotCQkJbWVtY3B5KHZhZGRy
X2RzdCArIG9mZnNldF9kc3QsCi0JCQkgICAgICAgdmFkZHJfc3JjICsgb2Zmc2V0X3NyYywgc2l6
ZW9mKHUzMikpOworCQkJc3JjID0gdmFkZHJfc3JjICsgb2Zmc2V0X3NyYzsKKwkJCWRzdCA9IHZh
ZGRyX2RzdCArIG9mZnNldF9kc3Q7CisJCQlhbHBoYSA9IHNyY1szXSArIDE7CisJCQlpbnZfYWxw
aGEgPSAyNTYgLSBzcmNbM107CisJCQlkc3RbMF0gPSAoYWxwaGEgKiBzcmNbMF0gKyBpbnZfYWxw
aGEgKiBkc3RbMF0pID4+IDg7CisJCQlkc3RbMV0gPSAoYWxwaGEgKiBzcmNbMV0gKyBpbnZfYWxw
aGEgKiBkc3RbMV0pID4+IDg7CisJCQlkc3RbMl0gPSAoYWxwaGEgKiBzcmNbMl0gKyBpbnZfYWxw
aGEgKiBkc3RbMl0pID4+IDg7CisJCQlkc3RbM10gPSAweGZmOwogCQl9CiAJCWlfZHN0Kys7CiAJ
fQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
