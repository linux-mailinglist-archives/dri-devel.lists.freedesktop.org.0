Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 648DD26D2BA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 06:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5823A6E0D9;
	Thu, 17 Sep 2020 04:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A48D6E0C5;
 Thu, 17 Sep 2020 04:38:42 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id di5so346541qvb.13;
 Wed, 16 Sep 2020 21:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2D/1WhzNvWoKabTAwepIDsgCoP4x6FgESoVCal4I6yA=;
 b=cR56v3AdtP6haPoEl3KHMOiDem3ghaJKH/2xIN+nUqngzwQJW1g4HxUURlnVFRfbBQ
 iBXRiJ+eJB2c40Pr+EKJ6n5vm5hfWJVeDjKUO/sHP7XPk5F0djOtRq7tWmnLFCxiL3nu
 bvpKOfMwaTIGvDAGgV6nW/1jUccLUbBy/jBr7YDLCHKJd4APeUTpVK8OIKEVaBEr6GQr
 /FL+2rvjg6h/UKJ8h2aqMzGKZpr7Hsj8/gRLIiEJ6fk0RMPou5+qLFm5I+KvihfKWnYT
 NyhCAvNnmqsU85GwSF4a0tOcQIDHLN5JgSSU12Eh/RDkHCIYgDrZwoLKY9u2gxibU6AT
 aphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2D/1WhzNvWoKabTAwepIDsgCoP4x6FgESoVCal4I6yA=;
 b=NKCu8KAJYBr3UBvQ7ye6MJY0F68/3zn/91P2z/8yEEVPYSYtPXd7VKvPMMoZvOTj9L
 feAxugwz3CKSC1gICMciTKbezz6djEfl3JGvAZmB72SMjuHbY4OUR2HLxBa59NjW7aua
 swFIrw3OXFAzx3UZZROz1HvwrSZnx7marpOmbNgt70bb8xCt+YBfsdrV/pCBQwMTUYyh
 /21W54YgzWXa8BQ3hl0SK0c7Zk58F2TaFdLcksd82lJB3zCcKFHiyZy+xuLwHUHu9pB8
 fq00Fv7cEgpbAov18wR0Gss9VqDxMtvsD/BymrSA/Op8aFd70G6mygFnJ/jAa5HqiFCO
 /7Qw==
X-Gm-Message-State: AOAM532d0rOEoXb6kUgh8R/BcRwoKcLvCOSYnioflDI7qP2kKL8Gt8tz
 wEt5mwofpKzStgMQtpbhjYplTOlZfRA=
X-Google-Smtp-Source: ABdhPJyh88dagW+VaVF2Joox6nGD3EY5Q3u5E0PoKjCT9N24FQTVwj2KwVNPSBtmEoZYzZ7P2KuAJQ==
X-Received: by 2002:a05:6214:c2:: with SMTP id
 f2mr10257969qvs.44.1600317521127; 
 Wed, 16 Sep 2020 21:38:41 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id w6sm20474739qti.63.2020.09.16.21.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 21:38:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-5.9
Date: Thu, 17 Sep 2020 00:38:18 -0400
Message-Id: <20200917043818.3717-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuOS4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgN2Y3YTQ3OTUyYzBmOTgxZjljOWE2NDA5YzhjZjhkMDI1ZDU1YWY2NDoKCiAg
TWVyZ2UgdGFnICdkcm0tbWlzYy1maXhlcy0yMDIwLTA5LTA5JyBvZiBnaXQ6Ly9hbm9uZ2l0LmZy
ZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgaW50byBkcm0tZml4ZXMgKDIwMjAtMDktMTEgMDk6
NDk6MjMgKzEwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAg
Z2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXggdGFncy9hbWQtZHJtLWZp
eGVzLTUuOS0yMDIwLTA5LTE3Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gODc1ZDM2
OWQ4Zjc1Mjc1ZDMwZTU5NDIxNjAyZDkzNjY0MjZhYmZmNzoKCiAgZHJtL2FtZC9kaXNwbGF5OiBE
b24ndCBsb2cgaGRjcCBtb2R1bGUgd2FybmluZ3MgaW4gZG1lc2cgKDIwMjAtMDktMTcgMDA6MTM6
MzQgLTA0MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCmFtZC1kcm0tZml4ZXMtNS45LTIwMjAtMDktMTc6CgphbWRncHU6
Ci0gU2llbm5hIENpY2hsaWQgZml4ZXMKLSBOYXZ5IEZsb3VuZGVyIGZpeGVzCi0gREMgZml4ZXMK
CmFtZGtmZDoKLSBGaXggYSBHUFUgcmVzZXQgY3Jhc2gKLSBGaXggYSBtZW1vcnkgbGVhawoKcmFk
ZW9uOgotIFJldmVydCBhIFBMTCBmaXggdGhhdCBicm9rZSBvdGhlciBib2FyZHMKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
QW5kcmV5IEdyb2R6b3Zza3kgKDEpOgogICAgICBkcm0vYW1kZ3B1OiBJbmNsdWRlIHNpZW5uYV9j
aWNobGlkIGluIFVTQkMgUEQgRlcgc3VwcG9ydC4KCkJoYXdhbnByZWV0IExha2hhICgyKToKICAg
ICAgZHJtL2FtZC9kaXNwbGF5OiBEb24ndCB1c2UgRFJNX0VSUk9SKCkgZm9yIERUTSBhZGQgdG9w
b2xvZ3kKICAgICAgZHJtL2FtZC9kaXNwbGF5OiBEb24ndCBsb2cgaGRjcCBtb2R1bGUgd2Fybmlu
Z3MgaW4gZG1lc2cKCkNocmlzdGlhbiBLw7ZuaWcgKDEpOgogICAgICBkcm0vcmFkZW9uOiByZXZl
cnQgIlByZWZlciBsb3dlciBmZWVkYmFjayBkaXZpZGVycyIKCkRlbm5pcyBMaSAoMik6CiAgICAg
IGRybS9rZmQ6IGZpeCBhIHN5c3RlbSBjcmFzaCBpc3N1ZSBkdXJpbmcgR1BVIHJlY292ZXJ5CiAg
ICAgIGRybS9hbWRrZmQ6IGZpeCBhIG1lbW9yeSBsZWFrIGlzc3VlCgpKaWFuc29uZyBDaGVuICgy
KToKICAgICAgZHJtL2FtZC9wbTogc3VwcG9ydCBydW50aW1lIHBwdGFibGUgdXBkYXRlIGZvciBz
aWVubmFfY2ljaGxpZCBldGMuCiAgICAgIGRybS9hbWRncHU6IGRlY2xhcmUgdGEgZmlybXdhcmUg
Zm9yIG5hdnlfZmxvdW5kZXIKCkp1biBMZWkgKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IHVw
ZGF0ZSBudjF4IHN0dXR0ZXIgbGF0ZW5jaWVzCgpNaWNoZWwgRMOkbnplciAoMSk6CiAgICAgIGRy
bS9hbWRncHUvZGM6IFJlcXVpcmUgcHJpbWFyeSBwbGFuZSB0byBiZSBlbmFibGVkIHdoZW5ldmVy
IHRoZSBDUlRDIGlzCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jICAg
ICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMg
ICAgICAgICAgICAgfCAgMiArLQogLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1
ZXVlX21hbmFnZXIuYyAgfCAgNCArKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMgIHwgMzIgKysrKysrKy0tLS0tLS0tLS0tLS0tLQogLi4uL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyAgfCAgNCArLS0KIC4uLi9n
cHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX2xvZy5oICAgIHwgIDIgKy0KIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX3BzcC5jICAgIHwgIDIgKy0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICAgICAgIHwgMTIg
KysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYyAgICAgICAg
ICAgIHwgIDIgKy0KIDkgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRp
b25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
