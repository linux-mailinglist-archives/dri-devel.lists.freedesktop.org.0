Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8474532B84B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A959F6E988;
	Wed,  3 Mar 2021 13:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567596E986
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u14so23751031wri.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9a8uG82AXGJJSEoRJJovLig/Ib2BpsFPbqufrjPoPFE=;
 b=HffZHJVgQU5P83AadrIRV6kXhbhGJisP4W7b8otP0l/09h8RopTD8AL57+IPoMuxWH
 js+ROx/MDvMANLCUB9CyNR/x2FKJwnDELJQnh4+ac0bXc31jeBOfT3ewtZg/8yvpnmDp
 qIE4t59LPglLuXZo0+53Y3BK7gkBowNzY8yiDgfrBlnm91X9JixLzZFxO9uFBR1I/kj5
 OvOsE1aUyrTuj4+Amvtt+mc8m6dfwxBPwty2SEvO6mACifZA+bcWDtAPiHK9hKVipUrs
 HzzmA9SYmLPC2T+qee/iCGuZNUkVVyeADeW1TA86UxlHyJ5EOoQLVC2KdYPFG7Whf7td
 inwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9a8uG82AXGJJSEoRJJovLig/Ib2BpsFPbqufrjPoPFE=;
 b=auCqlhDlf4MrG7MUG/q7CYkn83Rk4t80pi+5D+KhHkTpZShhzI3DgrUMRRzH1lYy+Q
 wnv3fCPGNs7kpvwhcoHEpKvutEih2dkzgckrlapHXlmQGJyLNdYjzWWc36fpjQhf3OOQ
 m3wekoQAKzZyiJU6HqTMsnyvgS7i/SyZNxFk6+C3WxK8BvbsCDDYonfpWaIrdmfVi1kF
 wz90nZYqi4DtNdffL83d/iIP4Ksxq07pOq5pxbgpdkgVnehj7Db8oFUE+LZOZdhhgALu
 yQCtwqUppU/PPQJ4rocN2Aj52VKJOSvICfFYG2yWwR6RX76nnfZ9biGci9kfjkGlzlK3
 kjJg==
X-Gm-Message-State: AOAM532c/5sBOjtQfVCMewpyTSFzsYm3oY73OEpdE/93zpot4mK2o9uo
 uVNoPVk/Zow+IyMoAMQzFfEwTA==
X-Google-Smtp-Source: ABdhPJzonK3MB46SdxZ8jVQFWi3OAvLxvQxNMnEt1RFxnv9c3LrkIa/7bpy0cvq/azCvtaXzAfKT4g==
X-Received: by 2002:adf:9bcf:: with SMTP id e15mr26672762wrc.276.1614779067956; 
 Wed, 03 Mar 2021 05:44:27 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:27 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 51/53] drm/vmwgfx/ttm_object: Demote half-assed headers and
 fix-up another
Date: Wed,  3 Mar 2021 13:43:17 +0000
Message-Id: <20210303134319.3160762-52-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>, Rob Clark <rob.clark@linaro.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC90dG1fb2JqZWN0LmM6NjA6IGVycm9yOiBDYW5ub3QgcGFyc2Ugc3Ry
dWN0IG9yIHVuaW9uIQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1fb2JqZWN0LmM6OTc6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ21lbV9nbG9iJyBub3QgZGVzY3Jp
YmVkIGluICd0dG1fb2JqZWN0X2RldmljZScKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdHRtX29i
amVjdC5jOjk3OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdvcHMnIG5v
dCBkZXNjcmliZWQgaW4gJ3R0bV9vYmplY3RfZGV2aWNlJwogZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC90dG1fb2JqZWN0LmM6OTc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIg
J2RtYWJ1Zl9yZWxlYXNlJyBub3QgZGVzY3JpYmVkIGluICd0dG1fb2JqZWN0X2RldmljZScKIGRy
aXZlcnMvZ3B1L2RybS92bXdnZngvdHRtX29iamVjdC5jOjk3OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdkbWFfYnVmX3NpemUnIG5vdCBkZXNjcmliZWQgaW4gJ3R0bV9v
YmplY3RfZGV2aWNlJwogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1fb2JqZWN0LmM6OTc6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2lkcicgbm90IGRlc2NyaWJlZCBp
biAndHRtX29iamVjdF9kZXZpY2UnCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3Qu
YzoxMjg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3JjdV9oZWFkJyBu
b3QgZGVzY3JpYmVkIGluICd0dG1fcmVmX29iamVjdCcKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dHRtX29iamVjdC5jOjEyODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAn
dGZpbGUnIG5vdCBkZXNjcmliZWQgaW4gJ3R0bV9yZWZfb2JqZWN0JwogZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC90dG1fb2JqZWN0LmM6NTgyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Ig
bWVtYmVyICdkbWFidWYnIG5vdCBkZXNjcmliZWQgaW4gJ2dldF9kbWFfYnVmX3VubGVzc19kb29t
ZWQnCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuYzo1ODI6IHdhcm5pbmc6IEV4
Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2RtYV9idWYnIGRlc2NyaXB0aW9uIGluICdnZXRfZG1h
X2J1Zl91bmxlc3NfZG9vbWVkJwoKQ2M6IFZNd2FyZSBHcmFwaGljcyA8bGludXgtZ3JhcGhpY3Mt
bWFpbnRhaW5lckB2bXdhcmUuY29tPgpDYzogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZt
d2FyZS5jb20+CkNjOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2ZSBBaXJsaWUgPGFp
cmxpZWRAcmVkaGF0LmNvbT4KQ2M6IFJvYiBDbGFyayA8cm9iLmNsYXJrQGxpbmFyby5vcmc+CkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5
OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBaYWNrIFJ1
c2luIDx6YWNrckB2bXdhcmUuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvcGF0Y2gvbXNnaWQvMjAyMTAxMTUxODE2MDEuMzQzMjU5OS0xMC1sZWUuam9uZXNAbGlu
YXJvLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdHRtX29iamVjdC5jIHwgNiArKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1fb2JqZWN0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuYwppbmRleCAwZmU4NjlkMGZhZDEyLi5iM2ZkYzYzMDQ5
N2NiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuYwpAQCAtNzMsNyArNzMsNyBAQCBz
dHJ1Y3QgdHRtX29iamVjdF9maWxlIHsKIAlzdHJ1Y3Qga3JlZiByZWZjb3VudDsKIH07CiAKLS8q
KgorLyoKICAqIHN0cnVjdCB0dG1fb2JqZWN0X2RldmljZQogICoKICAqIEBvYmplY3RfbG9jazog
bG9jayB0aGF0IHByb3RlY3RzIHRoZSBvYmplY3RfaGFzaCBoYXNoIHRhYmxlLgpAQCAtOTYsNyAr
OTYsNyBAQCBzdHJ1Y3QgdHRtX29iamVjdF9kZXZpY2UgewogCXN0cnVjdCBpZHIgaWRyOwogfTsK
IAotLyoqCisvKgogICogc3RydWN0IHR0bV9yZWZfb2JqZWN0CiAgKgogICogQGhhc2g6IEhhc2gg
ZW50cnkgZm9yIHRoZSBwZXItZmlsZSBvYmplY3QgcmVmZXJlbmNlIGhhc2guCkBAIC01NjgsNyAr
NTY4LDcgQEAgdm9pZCB0dG1fb2JqZWN0X2RldmljZV9yZWxlYXNlKHN0cnVjdCB0dG1fb2JqZWN0
X2RldmljZSAqKnBfdGRldikKIC8qKgogICogZ2V0X2RtYV9idWZfdW5sZXNzX2Rvb21lZCAtIGdl
dCBhIGRtYV9idWYgcmVmZXJlbmNlIGlmIHBvc3NpYmxlLgogICoKLSAqIEBkbWFfYnVmOiBOb24t
cmVmY291bnRlZCBwb2ludGVyIHRvIGEgc3RydWN0IGRtYS1idWYuCisgKiBAZG1hYnVmOiBOb24t
cmVmY291bnRlZCBwb2ludGVyIHRvIGEgc3RydWN0IGRtYS1idWYuCiAgKgogICogT2J0YWluIGEg
ZmlsZSByZWZlcmVuY2UgZnJvbSBhIGxvb2t1cCBzdHJ1Y3R1cmUgdGhhdCBkb2Vzbid0IHJlZmNv
dW50CiAgKiB0aGUgZmlsZSwgYnV0IHN5bmNocm9uaXplcyB3aXRoIGl0cyByZWxlYXNlIG1ldGhv
ZCB0byBtYWtlIHN1cmUgaXQgaGFzCi0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
