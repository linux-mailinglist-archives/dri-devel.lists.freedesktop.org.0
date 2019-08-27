Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F79F080
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 18:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CA989BC2;
	Tue, 27 Aug 2019 16:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921E789BC2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 16:42:22 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q22so47824828iog.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t4/d9H3zPkehGO8WMS+e05TTbEwolWCKrpo3GXlSVME=;
 b=SKjBkecyRM1pD+IOUyYqfw1Yqt8CokrA67ieYqzvQ3/FDvB3S6sLqsfaoNKy46bTM7
 mneVpvPTyFx2AiXDnsFgDHWKzy/lKQi64ujOkn4bxJXly6ouR/hhQd8EIxAaxEy7DGUQ
 rMAj6GVje3lwSNYqztSCE8GkBE7E5hZNB8WbMvSMQAgpziAvGzLWlohf77sAnyyuo1aU
 teddthRpznXGaCgYvSnZTV3q+Qk8FHSIq8KjPtbZWZ5mcIvehT8xnV6zF3JFZ0TDp74V
 04YDvcZl6BJC0kHUGEOPYFNt1OkhX8tUNpgG2ExNy9Pt2M6g2JxATZPF7JJNALNWffh6
 8lSg==
X-Gm-Message-State: APjAAAW2IJj3CNtFyNak7KbgoRtmiCUufZITmfnjcISuXD8fEMLSNzas
 gzC5ccpplHJJ4itCVfd9AvCMynmlFiBrpKpmLJa9J+7c
X-Google-Smtp-Source: APXvYqyi2cOM6Eact6tIpG5HHBBQxrZq1Jezmt2L9lMrVOzSsV6IBQEOwioAbt80b/i/IBxMdWxMaXHUhAJQ4n/kxBg=
X-Received: by 2002:a6b:720e:: with SMTP id n14mr28333793ioc.139.1566924141570; 
 Tue, 27 Aug 2019 09:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190822094657.27483-1-kraxel@redhat.com>
 <CAPaKu7S_He9RYsxDi0Qco4u=Xnc3FjB5nvFT_Zh+o7pvFzCvRQ@mail.gmail.com>
 <20190827052154.etk4jbx45hsrl7z5@sirius.home.kraxel.org>
In-Reply-To: <20190827052154.etk4jbx45hsrl7z5@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 27 Aug 2019 09:42:10 -0700
Message-ID: <CAPaKu7TrPvsiy2EyC4a_tOyi7oAV-Npk+2fqkZwNUfjwNE3AeA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: add plane check
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=t4/d9H3zPkehGO8WMS+e05TTbEwolWCKrpo3GXlSVME=;
 b=E3nYAYtY8RBL7TmxP9S3fiLiAcsYg7WuNXOm+m9k8DduShri7h2su9ajoHi6oUGylN
 VZIfblgWGCzQwUbLfLOAbAZ4WRgIKwjB8AwkAPXJjXnj4SmfatFc0doTITMXScMYrK3s
 GyObWXB0qMDySutmj+YtBFWw27p9DjDkKoc7Z18/owXeKbazPgV0WP9DyUiJTp9pbWfW
 J7hGi47WdgAmeXKYkaMX0TOMT9VnJxUvsxgSnCJIJayVgzulry+kv4gNdCLD8k5FQ66O
 g2lcR7zSBGJc9xwMA2txLnLfLWLXIgZv3D4x6kPkxEFxuOwpNzUUQ8Ju687Z7TVcMUE9
 ZGrw==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMTA6MjEgUE0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDM6MzQ6NTZQTSAt
MDcwMCwgQ2hpYS1JIFd1IHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMjo0NyBB
TSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFVz
ZSBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19wbGFuZV9zdGF0ZSgpCj4gPiA+IHRvIHNhbml0eSBj
aGVjayB0aGUgcGxhbmUgc3RhdGUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9m
Zm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jIHwgMTcgKysrKysrKysrKysrKysrKy0KPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jCj4gPiA+IGluZGV4IGE0OTJhYzNm
NGE3ZS4uZmU1ZWZiMmRlOTBkIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfcGxhbmUuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfcGxhbmUuYwo+ID4gPiBAQCAtODQsNyArODQsMjIgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fcGxhbmVfZnVuY3MgdmlydGlvX2dwdV9wbGFuZV9mdW5jcyA9IHsKPiA+ID4gIHN0YXRp
YyBpbnQgdmlydGlvX2dwdV9wbGFuZV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUpCj4gPiA+ICB7Cj4gPiA+IC0gICAgICAgcmV0dXJuIDA7
Cj4gPiA+ICsgICAgICAgYm9vbCBpc19jdXJzb3IgPSBwbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVf
VFlQRV9DVVJTT1I7Cj4gPiA+ICsgICAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0
YXRlOwo+ID4gPiArICAgICAgIGludCByZXQ7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAoIXN0
YXRlLT5mYiB8fCAhc3RhdGUtPmNydGMpCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsK
PiA+ID4gKwo+ID4gPiArICAgICAgIGNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9jcnRjX3N0
YXRlKHN0YXRlLT5zdGF0ZSwgc3RhdGUtPmNydGMpOwo+ID4gPiArICAgICAgIGlmIChJU19FUlIo
Y3J0Y19zdGF0ZSkpCj4gPiA+ICsgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoY3J0Y19z
dGF0ZSk7Cj4gPiBJcyBkcm1fYXRvbWljX2dldF9uZXdfY3J0Y19zdGF0ZSBiZXR0ZXIgaGVyZT8K
Pgo+IFdlIGRvbid0IGhhdmUgdG8gd29ycnkgYWJvdXQgb2xkL25ldyBzdGF0ZSBoZXJlLiAgVGhl
IGRybV9wbGFuZV9zdGF0ZSB3ZQo+IGdldCBwYXNzZWQgaXMgdGhlIHN0YXRlIHdlIHNob3VsZCBj
aGVjayBpbiB0aGlzIGNhbGxiYWNrIChhbmQgSSB0aGluawo+IHRoaXMgYWx3YXlzIGlzIHRoZSBu
ZXcgc3RhdGUpLgpBY2tlZC1ieTogQ2hpYS1JIFd1IDxvbHZhZmZlQGdtYWlsLmNvbT4gKGJlY2F1
c2UgSSBhbSBub3QgZmFtaWxpYXIKd2l0aCB0aGUgYXRvbWljIGNvZGUgdG8gZ2l2ZSBhbiByLWIp
Cgo+Cj4gY2hlZXJzLAo+ICAgR2VyZAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
