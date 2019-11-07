Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C951F25F2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 04:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578C36EE76;
	Thu,  7 Nov 2019 03:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBBB6E0D4;
 Thu,  7 Nov 2019 03:22:51 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id o3so824311qtj.8;
 Wed, 06 Nov 2019 19:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ke1ao0rXP611cThJ6+RDTJmTjzaU0MUYxMS+SYWvNWA=;
 b=U2QPGb4CbrJih2N5c4mJItKNsL0RG9jwlCh9oYqXwFRllAMXPeVP//5EB2tMYy+AMb
 GJIHX7sZUKX6ufybL1tqiUDeTag/PMhiiYL/Z0QTqJnsV/3rsbZYtYSzD9EdRZKdYnvt
 m38ViSkrMmyUjwYg8gykqY9sqyGLfz06eMfrYE6VsfcXp27iOsQPM/NglusUH9W6sQy6
 4jH6Burkdli6dHGaxyfWC3TYHNZpRKbyw0Tl/2A3vOqwhNnmTByhHx+JKD/MEJuFshnJ
 6eZUvmKTR1+hr/bQsuGn3k/fxfTLz1jEn/XH5pO/eXE5YuXrXn8Y1pSoINhN8wBOqYN5
 Cimg==
X-Gm-Message-State: APjAAAUCADR/3kKyFzL6h1nQTkBa8IQr5vapE80alaBn1/QufSzQ/bdE
 3vIXx+0jGdAj5bYoWC7wxVBGAvdp
X-Google-Smtp-Source: APXvYqz3gR+6onRD/X4DzTPBtGFAzqOC1cNO1jN7DfHnLc1aZnkrU8erEBRgvNS1DmBl5Lei79GG2Q==
X-Received: by 2002:ac8:6b07:: with SMTP id w7mr1619511qts.348.1573096970280; 
 Wed, 06 Nov 2019 19:22:50 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id a2sm431072qkb.82.2019.11.06.19.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 19:22:49 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, radeon drm-fixes-5.4
Date: Wed,  6 Nov 2019 22:22:41 -0500
Message-Id: <20191107032241.1021217-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ke1ao0rXP611cThJ6+RDTJmTjzaU0MUYxMS+SYWvNWA=;
 b=D7A7in/t98sakUW459ZN+ZjEwzO7ONGXWI8rgwIX0bLMr9QIE8USgkXsTjVDhvpPRv
 g1OtPjoNJNhrgAi7nPq2xPVjJhmDw45IC3BfC/vicKh3XIehe9ZAEusbsU1oFMdPdL/5
 fhMNuEzMPShsRnLSAOZmum0Jle1i7Y2ohlOMtWBGiIqX6er5o0bjK0tkgLUctPobs8Rp
 wZRPfbURZ1Bhp+caoOiV5RGnc+NdFSAVpXyHJaF0ci6dxuFn32SOdLuz0z5J/FJnMQTj
 izCJbZPpZnPu1A56phwqJCnpZ8vtgEEer41KFZeYA6ZjvR5GtIQ1uqSOcIZFYEv0cxqs
 ZP/A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuNC4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgYTk5ZDgwODBhYWYzNThkNWQyMzU4MTI0NGU1ZGEyM2IzNWUzNDBiOToKCiAg
TGludXggNS40LXJjNiAoMjAxOS0xMS0wMyAxNDowNzoyNiAtMDgwMCkKCmFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3Jn
L35hZ2Q1Zi9saW51eCB0YWdzL2RybS1maXhlcy01LjQtMjAxOS0xMS0wNgoKZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIDJjNDA5YmE4MWJlMjU1MTZhZmUwNWFlMjdhNGExNWRhMDE3NDBi
MDE6CgogIGRybS9yYWRlb246IGZpeCBzaV9lbmFibGVfc21jX2NhYygpIGZhaWxlZCBpc3N1ZSAo
MjAxOS0xMS0wNiAyMjowNjoyMyAtMDUwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtLWZpeGVzLTUuNC0yMDE5LTEx
LTA2OgoKYW1kZ3B1OgotIEZpeCBuYXZpMTQgZGlzcGxheSBpc3N1ZSByb290IGNhdXNlIGFuZCBy
ZXZlcnQgd29ya2Fyb3VuZAotIEdQVSByZXNldCBzY2hlZHVsZXIgaW50ZXJhY3Rpb24gZml4Ci0g
Rml4IGZhbiBib29zdCBvbiBtdWx0aS1HUFUKLSBHZngxMCBhbmQgc2RtYTUgZml4ZXMgZm9yIG5h
dmkKLSBHRlhPRkYgZml4IGZvciByZW5vaXIKLSBBZGQgbmF2aTE0IFBDSSBJRAotIEdQVVZNIGZp
eCBmb3IgYXJjdHVydXMKCnJhZGVvbjoKLSBQb3J0IGFuIFNJIHBvd2VyIGZpeCBmcm9tIGFtZGdw
dQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpBbGV4IERldWNoZXIgKDMpOgogICAgICBkcm0vYW1kZ3B1L2FyY3R1cnVzOiBw
cm9wZXJseSBzZXQgQkFOS19TRUxFQ1QgYW5kIEZSQUdNRU5UX1NJWkUKICAgICAgZHJtL2FtZGdw
dS9yZW5vaXI6IG1vdmUgZ2Z4b2ZmIGhhbmRsaW5nIGludG8gZ2Z4OSBtb2R1bGUKICAgICAgZHJt
L3JhZGVvbjogZml4IHNpX2VuYWJsZV9zbWNfY2FjKCkgZmFpbGVkIGlzc3VlCgpFdmFuIFF1YW4g
KDEpOgogICAgICBkcm0vYW1kZ3B1OiByZWdpc3RlciBncHUgaW5zdGFuY2UgYmVmb3JlIGZhbiBi
b29zdCBmZWF0dXJlIGVuYWJsbWVudAoKS2V2aW4gV2FuZyAoMSk6CiAgICAgIGRybS9hbWQvc3dT
TVU6IGZpeCBzbXUgd29ya2xvYWQgYml0IG1hcCBlcnJvcgoKU2hpcmlzaCBTICgxKToKICAgICAg
ZHJtL2FtZGdwdTogZG9udCBzY2hlZHVsZSBqb2JzIHdoaWxlIGluIHJlc2V0CgpUaWFuY2kuWWlu
ICgxKToKICAgICAgZHJtL2FtZGdwdTogYWRkIG5hdmkxNCBQQ0kgSUQKClpoYW4gTGl1ICgyKToK
ICAgICAgZHJtL2FtZC9kaXNwbGF5OiBBZGQgRU5HSU5FX0lEX0RJR0QgY29uZGl0aW9uIGNoZWNr
IGZvciBOYXZpMTQKICAgICAgUmV2ZXJ0ICJkcm0vYW1kL2Rpc3BsYXk6IHNldHRpbmcgdGhlIERJ
R19NT0RFIHRvIHRoZSBjb3JyZWN0IHZhbHVlLiIKCmNoYW5nemh1ICgyKToKICAgICAgZHJtL2Ft
ZGdwdTogYWRkIGR1bW15IHJlYWQgYnkgZW5naW5lcyBmb3Igc29tZSBHQ1ZNIHN0YXR1cyByZWdp
c3RlcnMgaW4gZ2Z4MTAKICAgICAgZHJtL2FtZGdwdTogYWRkIHdhcm5pbmcgZm9yIEdSQk0gMS1j
eWNsZSBkZWxheSBpc3N1ZSBpbiBnZng5CgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2N0eC5jICAgICAgICAgICAgfCAgNSArKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYyAgICAgICAgIHwgIDcgKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2Z4LmggICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgICAgICAgICAgICAgfCA0OCArKysrKysrKysrKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgICAgICAgICAg
ICB8IDEzICsrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgICAg
ICAgICAgICAgfCAgOCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80
LmMgICAgICAgICAgICB8ICA5ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFf
djVfMC5jICAgICAgICAgICAgIHwgMTMgKysrKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jICAgICAgICAgICAgICAgICB8ICA1IC0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfbGluay5jICAgICAgfCAgOSAtLS0tCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jICB8ICA1ICsrKwogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jICAgICAgICAgfCAgMiArLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYyAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAxNiBm
aWxlcyBjaGFuZ2VkLCAxMDYgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
