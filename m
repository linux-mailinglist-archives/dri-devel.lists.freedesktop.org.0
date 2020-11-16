Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B864D2B4D11
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADCD6E045;
	Mon, 16 Nov 2020 17:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8AC6E039
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:34:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c9so661wml.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wySX8cNvv9NUCsmEXsR0JBc7XJM0MHUH49ItqBshbVE=;
 b=fyqsAvQsjtZPgnLlNYuAqgjvLAD2KEzD8fnpw7ksi4Au1TwwXYnRVrsBR/kFuKwr8T
 ay5r44BEiVO6rwJ7s46T5efTy1mn+/E3CdpPp4wq1sdrJ8SItiqm8ofCZVWmE1NUqlJM
 v46lkfvxWS2ekQ5Iua6EGzvtlGIopUbuL6qRgPHdhxTnXuQ8DJr2rqgLDJ2dFJpfcym/
 0J7ykIgHqeohEh1o0dXfzfgUCPb6i2O3o79f5Dake/7UTZhmgEjvFhyW70iMUjct1gm7
 4wn0jmAsn+wN8vfwj2vEvz+ulBbhMT6lQ2ErhB/VWJpnfR8iA5zwaBp4yz5udBx1ZgKS
 oxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wySX8cNvv9NUCsmEXsR0JBc7XJM0MHUH49ItqBshbVE=;
 b=Rpgt0XR+nlwmGsvTq7dNtLmhC4JQP4z/3HD7kYVIsQ9kpScWkIZY0Z24gx1ee5laBL
 gBQLe2IoJQ4liYj3SXY4ERdVjTEYhxyMJsL4KBdJmzUfSF5hap+scduU44dPe2TK5jI3
 SWRUdRi+k3T8vvLUfBB5ByJ2DLxN453RdHRxoG6g5u1UD96J4bjjyIXMN5wmO33CoKNR
 H8UacQil5GuFDfdqkicVnm5jZKbl2gW7jcGdDYP34rpG1BM0iMJoH0+mHmBj5D/J4IWO
 8aHD35393rT9frbbbMJufosveHuL7WRa1gtUvahwF/pn0qanBhlJDjR3FRaCulbMo/vl
 oTdw==
X-Gm-Message-State: AOAM532K2+J/c8fJsPeeZWhWm4s1mbYV+3I9Ee6DZ30cxW/C2vx4Uo9u
 EmVs2RliQ+PC53arlux7SpVuTbDudIbEkg+f
X-Google-Smtp-Source: ABdhPJwSX5AFzZorGf6TwH8mchOVYCT4UcKyoCG6+NQSYnaL2OmELGrklnOK+Vc4wmNeKr0PCqQOrA==
X-Received: by 2002:a1c:5605:: with SMTP id k5mr15783540wmb.99.1605548044818; 
 Mon, 16 Nov 2020 09:34:04 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k22sm20178562wmi.34.2020.11.16.09.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:34:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/42] drm/armada/armada_overlay: Staticify local function
 'armada_overlay_duplicate_state'
Date: Mon, 16 Nov 2020 17:33:16 +0000
Message-Id: <20201116173356.1828478-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173356.1828478-1-lee.jones@linaro.org>
References: <20201116173356.1828478-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfb3ZlcmxheS5jOjMyOToxOiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmGFybWFkYV9vdmVybGF5X2R1cGxpY2F0ZV9zdGF0ZeKAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5v
cmcudWs+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfb3ZlcmxheS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybWFkYS9hcm1hZGFfb3ZlcmxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9h
cm1hZGFfb3ZlcmxheS5jCmluZGV4IDMwZTAxMTAxZjU5ZWQuLjYzNDZiODkwMjc5YTAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX292ZXJsYXkuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9vdmVybGF5LmMKQEAgLTMyNSw3ICszMjUsNyBAQCBz
dGF0aWMgdm9pZCBhcm1hZGFfb3ZlcmxheV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkK
IAl9CiB9CiAKLXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKgorc3RhdGljIHN0cnVjdCBkcm1fcGxh
bmVfc3RhdGUgKgogYXJtYWRhX292ZXJsYXlfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lKQogewogCXN0cnVjdCBhcm1hZGFfb3ZlcmxheV9zdGF0ZSAqc3RhdGU7Ci0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
