Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC101605BA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 14:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C4C6E126;
	Fri,  5 Jul 2019 12:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48866E126
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 12:10:18 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id d4so8045553edr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 05:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDI/QmKfFwa7vf3pFQrFOD6rYnWSEBaDryZM87eKKm4=;
 b=MSttOjfePa+GjecPsn+WmhN8Gn5nKExLHmn8DZ0UL5CztBFK5DzYPg91ppOkZN26Wm
 YQNhd9ofAvbSiVJijWnKsMfsvmQ7XXztl+TC4dmm0k8IeLWFcWqq/9ZxCj6A0ofSea8w
 jPkJEssz0nYk8vT11kagQHOtJfPs8fm2hmwusZEy1/+Kh70vJW9jzV5dq820rzp10Rfv
 dZySRQtHzEGtJnYJwYpJZKMFF1KPfKb6UsMupVGb5VWTKeCHdWYfcnGQ7aVRsDDe6aIz
 gKyW4ourFXanfg3uNwFeIiyQVXmZPhB+uauFy66CYZ3BmKksPIQjXKV/lLPQa7+cqSdz
 084g==
X-Gm-Message-State: APjAAAUntuAyty69Hqv89pMGJl9f7G5Oh8xWwPLs4grfYuxWjObOvRtq
 ZL6GKNrv2ZOLL+CEeX+tGL8xfAVvOeM=
X-Google-Smtp-Source: APXvYqw0vDJCLC/dW2rNwk3tFmbhLxghxfUi9P5U7cV29TE47ZSE6IvQYwZRv90ota9/BbBzlNQApg==
X-Received: by 2002:aa7:c692:: with SMTP id n18mr4035139edq.220.1562328617019; 
 Fri, 05 Jul 2019 05:10:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 5sm1524350ejx.58.2019.07.05.05.10.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 05:10:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/5] RFC: MAINTAINERS: maintain drm/arm drivers in drm-misc
 for now
Date: Fri,  5 Jul 2019 14:10:06 +0200
Message-Id: <20190705121006.26085-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705121006.26085-1-daniel.vetter@ffwll.ch>
References: <20190705121006.26085-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDI/QmKfFwa7vf3pFQrFOD6rYnWSEBaDryZM87eKKm4=;
 b=PWXcqongrs6pmrmORJu2aKSFZaY7sYyYmxdsPqHl5IAmkalxvFuWkuKEzR3VIigAPH
 qj000y237N+grbB8kMAYFr7snLWvmoCfkC/YLh6ftvVjR5SOsHNX4bMWYLfMfGoYTtvh
 qkVr1NT7RZjXoOmkRWwDCxRMxVZuWPQvDIVPo=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 James Qian Wang <james.qian.wang@arm.com>, Dave Airlie <airlied@redhat.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, Lowry Li <lowry.li@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbSBkaXNjdXNzaW9ucyB3aXRoIExpdml1IGl0IHNvdW5kZWQgbGlrZSB0aGUga29tZWRhIHRl
YW0gd291bGQKYmVuZWZpdCBhIGJpdCBmcm9tIG1vcmUgY3Jvc3MtcmV2aWV3IHdpdGggb3RoZXIg
ZHJpdmVycy4gVG8gbWFrZSBzdXJlCmtvbWVkYSBpcyBhbGlnbmVkIHdpdGggaG93IHNpbWlsYXIg
cHJvYmxlbXMgYXJlIHNvbHZlZCBpbiBvdGhlcgpkcml2ZXJzIChpbiB0aGUgZW5kIGV2ZXJ5b25l
IGVuZHMgdXAgd2l0aCBzaW1pbGFyIGlkZWFzIG9uIGhvdyB0bwpzb2x2ZSB2YXJpb3VzIGRpc3Bs
YXkgZW5naW5lIGRlc2lnbiBpc3N1ZXMpLgoKQW4gb3B0aW9uIHdvdWxkIGJlIHRvIHVzZSBkcm0t
bWlzYyBhcyBhbiBpbmN1YmF0b3IgZm9yIGEgZmV3IGtlcm5lbApyZWxlYXNlcywgYXQgbGVhc3Qg
dW50aWwgdGhlIGJpZyBkZXNpZ24gaXRlbXMgaGF2ZSBiZWVuIHRhY2tsZWQ6IEFzaWRlCmZyb20g
dGhlIGZvdXIga21zIHByb3BlcnRpZXMgYWxyZWFkeSBsYW5kZWQgdGhhdCB3ZSBuZWVkIHRvIHRh
a2Ugb3V0CmFnYWluIHRoZXJlJ3MgYWxzbyBhIHBpbGUgb2YgbmV3IG9uZXMgcHJvcG9zZWQgYWxy
ZWFkeSBmb3Iga29tZWRhLgpkcm0tbWlzYyBzZWVtcyB0byB3b3JrIGZhaXJseSB3ZWxsIGF0IGVu
Y291cmFnaW5nIHRoZXNlIGtpbmQgb2YKY3Jvc3MtZHJpdmVyIHJldmlld3MgYW5kIHdvcmtpbmcg
b24gY3Jvc3MtZHJpdmVyIGluZnJhc3RydWN0dXJlIGluIGRybQpjb3JlLiBMYXRlciBvbiB3ZSBj
YW4gbW92ZSBhbGwgdGhlIGRyaXZlcnMgb3V0IHRvIGEgZGVkaWNhdGVkIGFybSB0cmVlCmFnYWlu
IChpZiB0aGF0J3MgZGVzaXJlZCkuCgpPZiBjb3VyZXMgdGhhdCB3b3VsZCBtZWFuIExvd3J5IGFu
ZCBKYW1lcyBuZWVkIGRybS1taXNjIGNvbW1pdCByaWdodHMKKGFsbCBvdGhlciBhcm0gY29udHJp
YnV0b3JzIGhhdmUgaXQgYWxyZWFkeSBJIHRoaW5rKS4KCkNjOiBMb3dyeSBMaSAoQXJtIFRlY2hu
b2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgpDYzogSmFtZXMgUWlhbiBXYW5nIChBcm0g
VGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgpDYzogTGl2aXUgRHVk
YXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CkNjOiBNYWxpIERQIE1haW50YWluZXJzIDxtYWxpZHBA
Zm9zcy5hcm0uY29tPgpDYzogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgpD
YzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxt
YXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+
ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgot
LS0KIE1BSU5UQUlORVJTIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMK
aW5kZXggZDExOWQ1M2U0OGRlLi5hNTMxOWVkZGNlZTEgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJT
CisrKyBiL01BSU5UQUlORVJTCkBAIC0xMjAzLDcgKzEyMDMsNyBAQCBNOglKYW1lcyAoUWlhbikg
V2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CiBNOglMaXZpdSBEdWRhdSA8bGl2aXUuZHVk
YXVAYXJtLmNvbT4KIEw6CU1hbGkgRFAgTWFpbnRhaW5lcnMgPG1hbGlkcEBmb3NzLmFybS5jb20+
CiBTOglTdXBwb3J0ZWQKLVQ6CWdpdCBnaXQ6Ly9saW51eC1hcm0ub3JnL2xpbnV4LWxkLmdpdCBm
b3ItdXBzdHJlYW0vbWFsaS1kcAorVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3Jn
L2RybS9kcm0tbWlzYwogRjoJZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvCiBG
Oglkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhLwogRjoJRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLGtvbWVkYS50eHQKQEAgLTEyMTQsNyArMTIx
NCw3IEBAIE06CUxpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgogTToJQnJpYW4gU3Rh
cmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgogTDoJTWFsaSBEUCBNYWludGFpbmVycyA8bWFs
aWRwQGZvc3MuYXJtLmNvbT4KIFM6CVN1cHBvcnRlZAotVDoJZ2l0IGdpdDovL2xpbnV4LWFybS5v
cmcvbGludXgtbGQuZ2l0IGZvci11cHN0cmVhbS9tYWxpLWRwCitUOglnaXQgZ2l0Oi8vYW5vbmdp
dC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjCiBGOglkcml2ZXJzL2dwdS9kcm0vYXJtLwog
RjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLG1hbGlkcC50
eHQKIEY6CURvY3VtZW50YXRpb24vZ3B1L2FmYmMucnN0Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
