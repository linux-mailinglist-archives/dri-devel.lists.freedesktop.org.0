Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822AF2B1C2D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC9D6E51A;
	Fri, 13 Nov 2020 13:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71986E514
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:49:49 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a3so8545577wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6/SblzwLdOmJ9tWarQDFSbsr05Zj/WUad2ODh3SNdKc=;
 b=Y1p0NVuHUW4H9XgyeNEWCXTCVdtUlbV30yUCoYgsuqo4Y01RdEjka3nughIasrl1gp
 /eqiX+NbO1uIk+A3G8OtTbt0AwZXPnEaxkpnpoX0txhxN5lZMtgFsh2BUkU/LiDjdh36
 Ly8Ij7JoJsu4OIEFMhMk9bCFS5nA+jHJAv1qyMPRlaq1hSyddSb1ydx+hp1xs0J3hShO
 zbbnJdr/fBEncMp+JHcFJNpQqw0FQ5p88wQWyBocKZ+5TV7ehN7RQUtW07XFUDBVEgF8
 7dkkhHl5fRILzvVR8k65Yiax9xqCgRdFaUy/6BoiRrP+EWD61nsmY8gCMlxu2+ru4vjv
 k0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6/SblzwLdOmJ9tWarQDFSbsr05Zj/WUad2ODh3SNdKc=;
 b=FkLR5kRmZIM74CltjTjiVv0CWw3v7fP4bl/R++EL+NmmUMZ7Us3osXsoc3puri8DCt
 HoDm8tLfZSzzh3swpfZroDanwDXzI34AOSx3h8FCd1maxjaaVry0UCNgX64pyHy6qhk3
 1adtbKNlVaf5tMeks8FHNFtmyFJrX0QKBa2Eh0/jYHbkZ8bWJCDdkKpjKyggejTdbLEZ
 f8JEf7eaUBPN7jkahMZ1MnOBsprnWvcEmwSpQNwsQ6XeQPHH19KWUohS53evxRyvc9lC
 XDcpVS6nTvPcVPVdE7E5wKQ3HN/JfNzWASS2OtXb9Nb3eCJxpunS8VPCtpXfK+NJ0BUQ
 2omg==
X-Gm-Message-State: AOAM532Xhhxcn9JyW9tkg1+W16Vp9ZQXOnQ3VrDlmJ4dLFRTuz2hYYAr
 cjBz2z9Kb0FQ3DLkDe+jIVJ3qA==
X-Google-Smtp-Source: ABdhPJxrcuhGfoNe9QQTIoT/4z4aQpdapdF6KKqt0Msq0U2GXATSYUSIF5p6At39W9yFD+O2Ih7GmA==
X-Received: by 2002:a1c:c286:: with SMTP id s128mr2672526wmf.88.1605275388627; 
 Fri, 13 Nov 2020 05:49:48 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:48 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/40] drm/amd/amdgpu/amdgpu_ring: Fix misnaming of param
 'max_dw'
Date: Fri, 13 Nov 2020 13:49:03 +0000
Message-Id: <20201113134938.4004947-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuYzoxNjg6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ21heF9kdycgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3Jp
bmdfaW5pdCcKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmM6MTY4OiB3
YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdtYXhfbmR3JyBkZXNjcmlwdGlvbiBp
biAnYW1kZ3B1X3JpbmdfaW5pdCcKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5v
cmc+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5h
cm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmluZy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jpbmcu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMKaW5kZXggYTIzYjIw
Nzk2OTZhMS4uMWE2MTJmNTFlY2Q5ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3JpbmcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmluZy5jCkBAIC0xNTQsNyArMTU0LDcgQEAgdm9pZCBhbWRncHVfcmluZ191bmRvKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZykKICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVy
CiAgKiBAcmluZzogYW1kZ3B1X3Jpbmcgc3RydWN0dXJlIGhvbGRpbmcgcmluZyBpbmZvcm1hdGlv
bgotICogQG1heF9uZHc6IG1heGltdW0gbnVtYmVyIG9mIGR3IGZvciByaW5nIGFsbG9jCisgKiBA
bWF4X2R3OiBtYXhpbXVtIG51bWJlciBvZiBkdyBmb3IgcmluZyBhbGxvYwogICogQGlycV9zcmM6
IGludGVycnVwdCBzb3VyY2UgdG8gdXNlIGZvciB0aGlzIHJpbmcKICAqIEBpcnFfdHlwZTogaW50
ZXJydXB0IHR5cGUgdG8gdXNlIGZvciB0aGlzIHJpbmcKICAqIEBod19wcmlvOiByaW5nIHByaW9y
aXR5IChOT1JNQUwvSElHSCkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
