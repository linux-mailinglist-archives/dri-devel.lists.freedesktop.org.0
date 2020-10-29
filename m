Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265F29E38D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 07:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF9D6E825;
	Thu, 29 Oct 2020 06:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43876E822;
 Thu, 29 Oct 2020 06:15:59 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id p15so2220327ioh.0;
 Wed, 28 Oct 2020 23:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3qoSxR6kLQaOI4U9m98Tp9zH6OthGewVdcEYzDzAXno=;
 b=fYU0xpfoYwkmldTFjfzc4AaWKS3FYsZYISfJdJ/QHWLFy5EIoNmGfnQk7at1z46INJ
 zO4HMmsiP2W0WAitkRzz7I4pGLh/E/Rcf2DcXSGggHMT97lcu/3solygd/vygUxO+vBB
 f2hk5LXi779CL2jJ2Igc9UiUHszgYi1Jyxbt1/T/HxAKeoYvci4nL4vCJSLd1crtg3vB
 eRT0UsNOPv4AVdKtTxqvlTTEPG+bHa/whG7i3uIBFL8DW+m0HtlzIhFDFYDvD0iPIezh
 hPCj1SEOKkTtb6046hfUwaJIAIjiaHr5K8h6+1rSOWj+wC44cRN0x1VoQTKXPkZJZjgq
 7/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3qoSxR6kLQaOI4U9m98Tp9zH6OthGewVdcEYzDzAXno=;
 b=WS5dNFHOW+CHmcVut+ytT2/jIKgXCfuKCN/aNz+hpG2L3b67rxatReeQLwKnuqfppi
 xx05XFjpME6DNtyWSx4k3lCByN3dZSvZ7+DvOtH/QVmJ1ek1QnRH9fe2o/9WFv0A0PZi
 ebGq4KwpetgyqzYR6qzYdvHVBW3Ln1FvMrsNmwblNZ4qwMRvyJC0BzXk4ZTm8ajdBc2l
 7+3mj/4kgypQz7cX8L9yx6KY26Z5jWxf0J+ZscR+Zh+zcxfgLfBZVZ9kXTbEwp8P7wo4
 2YLOqm73287/HNAOzVp3Djq0hpyDm6ajD6elGB8H20c5U8RKhfpkzcO2BK92mdz3ojMU
 C/Dg==
X-Gm-Message-State: AOAM533o5bbnMmz9EVgLaM7r085yhpY0rAaZHhEKMOaFh4uEiEGMcn2O
 3Z/gayBON9eGRkGxPBpE71b6YHAgr3c=
X-Google-Smtp-Source: ABdhPJwIxKHzRPH9dK5MFSSou4oh8I3hBAhTpFKjJEtXiMzSPGr/XroyHv4LkN5rNvgFVwJRJgi+PQ==
X-Received: by 2002:a02:94cd:: with SMTP id x71mr2239171jah.124.1603952158644; 
 Wed, 28 Oct 2020 23:15:58 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id z87sm1814585ilf.9.2020.10.28.23.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 23:15:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.10
Date: Thu, 29 Oct 2020 02:15:49 -0400
Message-Id: <20201029061549.4133-1-alexander.deucher@amd.com>
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

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuMTAuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMg
c2luY2UgY29tbWl0IDM2NTBiMjI4ZjgzYWRkYTdlNWVlNTMyZTJiOTA0MjljMDNmN2I5ZWM6Cgog
IExpbnV4IDUuMTAtcmMxICgyMDIwLTEwLTI1IDE1OjE0OjExIC0wNzAwKQoKYXJlIGF2YWlsYWJs
ZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5v
cmcvfmFnZDVmL2xpbnV4IHRhZ3MvYW1kLWRybS1maXhlcy01LjEwLTIwMjAtMTAtMjkKCmZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2NWQ0MzdiODNiMmI4ZWI5YWU0N2I2MTQ1Mzk5ZmM3
NjgzYjAyOGY3OgoKICBkcm0vYW1kZ3B1L3BtOiBmaXggdGhlIGZhbiBzcGVlZCBpbiBmYW4xX2lu
cHV0IGluIG1hbnVhbCBtb2RlIGZvciBuYXZpMXggKDIwMjAtMTAtMjcgMTQ6MDg6MDMgLTA0MDAp
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCmFtZC1kcm0tZml4ZXMtNS4xMC0yMDIwLTEwLTI5OgoKYW1kZ3B1OgotIEFkZCBu
ZXcgbmF2aTF4IFBDSSBJRAotIEdQVVZNIHJlc2VydmVkIGFyZWEgZml4ZXMKLSBNaXNjIGRpc3Bs
YXkgZml4ZXMKLSBGaXggYmFkIGludGVyYWN0aW9ucyBiZXR3ZWVuIGRpc3BsYXkgY29kZSBhbmQg
Q09ORklHX0tHREIKLSBGaXhlcyBmb3IgU01VIG1hbnVhbCBmYW4gY29udHJvbCBhbmQgaTJjCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCkFsZXggRGV1Y2hlciAoMyk6CiAgICAgIGRybS9hbWRncHUvZGlzcGxheTogdXNlIGt2
emFsbG9jIGFnYWluIGluIGRjX2NyZWF0ZV9zdGF0ZQogICAgICBkcm0vYW1kZ3B1L3N3c211OiBk
cm9wIHNtdSBpMmMgYnVzIG9uIG5hdmkxeAogICAgICBkcm0vYW1kZ3B1L3BtOiBmaXggdGhlIGZh
biBzcGVlZCBpbiBmYW4xX2lucHV0IGluIG1hbnVhbCBtb2RlIGZvciBuYXZpMXgKCkNocmlzdGlh
biBLw7ZuaWcgKDEpOgogICAgICBkcm0vYW1kZ3B1OiBpbmNyZWFzZSB0aGUgcmVzZXJ2ZWQgVk0g
c2l6ZSB0byAyTUIKCkRhdmlkIEdhbGlmZmkgKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IEZp
eGVkIHBhbmljIGR1cmluZyBzZWFtbGVzcyBib290LgoKRG15dHJvIExha3R5dXNoa2luICgxKToK
ICAgICAgZHJtL2FtZC9kaXNwbGF5OiBwcmV2ZW50IG51bGwgcG9pbnRlciBhY2Nlc3MKCktlbm5l
dGggRmVuZyAoMSk6CiAgICAgIGRybS9hbWQvcG06IGZpeCB0aGUgd3JvbmcgZmFuIHNwZWVkIGlu
IGZhbjFfaW5wdXQKCk1hZGhhdiBDaGF1aGFuICgxKToKICAgICAgZHJtL2FtZGdwdTogZG9uJ3Qg
bWFwIEJPIGluIHJlc2VydmVkIHJlZ2lvbgoKTWFydGluIExldW5nICgxKToKICAgICAgZHJtL2Ft
ZC9kaXNwbGF5OiBhZGRpbmcgZGRjX2dwaW9fdmdhX3JlZ19saXN0IHRvIGRkYyByZWcgZGVmJ25z
CgpUYWthc2hpIEl3YWkgKDMpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IEZpeCBrZXJuZWwgcGFu
aWMgYnkgZGFsX2dwaW9fb3BlbigpIGVycm9yCiAgICAgIGRybS9hbWQvZGlzcGxheTogRG9uJ3Qg
aW52b2tlIGtnZGJfYnJlYWtwb2ludCgpIHVuY29uZGl0aW9uYWxseQogICAgICBkcm0vYW1kL2Rp
c3BsYXk6IENsZWFuIHVwIGRlYnVnIG1hY3JvcwoKVGlhbmNpLllpbiAoMik6CiAgICAgIGRybS9h
bWRncHU6IGRpc2FibGUgRENOIGFuZCBWQ04gZm9yIG5hdmkxMCBibG9ja2NoYWluIFNLVSh2MykK
ICAgICAgZHJtL2FtZGdwdTogYWRkIERJRCBmb3IgbmF2aTEwIGJsb2NrY2hhaW4gU0tVCgogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgICAgICAgICAgfCAgMSArCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgICAgICAgICAgICB8IDEwICsr
KysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggICAgICAgICAgICAg
fCAgNCArLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgICAgICAgICAgICAgICAg
ICAgIHwgMTQgKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZyAg
ICAgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjLmMgICAgICAgICAgIHwgIDQgKy0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2Uv
ZGNlX2Nsb2NrX3NvdXJjZS5jICB8ICAzICstCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24zMC9kY24zMF9yZXNvdXJjZS5jICB8IDEyICsrKysrLS0tCiAuLi4vYW1kL2Rpc3BsYXkvZGMv
Z3Bpby9kY24zMC9od19mYWN0b3J5X2RjbjMwLmMgICB8IDEyICsrKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9ncGlvX2Jhc2UuYyAgICB8ICA0ICstLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL29zX3R5cGVzLmggICAgICAgICAgfCAzMyArKysrKysr
Ky0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS9uYXZpMTBf
cHB0LmMgICAgfCAzNiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vZHJtL2FtZC9wbS9zd3Nt
dS9zbXUxMS9zaWVubmFfY2ljaGxpZF9wcHQuYyAgICB8IDExICsrLS0tLS0KIDEzIGZpbGVzIGNo
YW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDc2IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
