Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 178082EF8A5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72CF6E8D6;
	Fri,  8 Jan 2021 20:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3916E8D0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:24 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id y17so10129286wrr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ch2gYAE2vDuTmkFhr3daFGk6qkpCbvS5cnZ4t3WwTr8=;
 b=eWMH5So3djuul8qB47/3pj9n9lXtnPj8xRPt9BjaVXr7omscVJhIB4YxEbAeWG+kVU
 V523YJopK++IkvFlH40/ocBNKEE2KCzUFsXZ0acwbVrjjcZE+vmVs6wcpIwM+lUH/TWE
 UGvwUmNRSZ2SXHtSNNkw+HlzMeX1+JmaaOV7SXPjUcI9jfmdroTxKE9uyW52BcyHNRcr
 Fd1/Ewe7GlTTC+mkHhelgArACGCH3CX9bsBdJWFtx+AtspM2pDGmxvUQo5eNd9HRSfef
 O/sIm9IVFTencRTxkmeiCoxBIA/tlAeVeCAzhZr2WZiz43T+nJLkvEXeP2Ch9JztHmSa
 /pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ch2gYAE2vDuTmkFhr3daFGk6qkpCbvS5cnZ4t3WwTr8=;
 b=XEf50Ud0g45MIgq05wy9I95eNHU2Lra8C36LSDlgrFFG40GRoA1UwSwsU4Oy1MhqxG
 2SPsfsWhF9fzE9DU9jPCAsLD6kdqXGcVAcxVIHdcVhPSzMhUl2sbXdF3Mfae+PqfhwRq
 vKQYvXbuVV9lCirEYTeeGzqP2iCjaCpFGXBvcGNF4w3OzEKgNgX3jelIIVzlurpKmLRi
 X92EldxEK6lnvEY5pqvmj347EZ2Wk+xcW91rSLBuh6CLo4tfUG04uiVXP6DmnMGnSK7p
 fdyXVOL6aIEid+Fnuw/JvsrqEV+9UY/xaD96PVxY07w/5x73O9uapxv7D2UkgFXW6L3L
 nfaw==
X-Gm-Message-State: AOAM533LUVQmDwl+SVr71fyn23rKP0dNtabmvp6KpDPMQ2MW4qxeWYvl
 WM+UEG5UELL/WzhMCcuE8+P4xg==
X-Google-Smtp-Source: ABdhPJyWHXz1lvcQZIGRwW+Sx8oVGMph2zWCusorEAyZWKLb5aQ14ApYuk5uNjw20CEbFeXTCbxgnw==
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr5300851wrv.132.1610136922870; 
 Fri, 08 Jan 2021 12:15:22 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/40] drm/amd/display/dc/basics/conversion: Demote obvious
 kernel-doc abuse
Date: Fri,  8 Jan 2021 20:14:30 +0000
Message-Id: <20210108201457.3078600-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9iYXNpY3MvY29udmVyc2lvbi5jOjg2
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdtYXRyaXgnIG5vdCBkZXNj
cmliZWQgaW4gJ2NvbnZlcnRfZmxvYXRfbWF0cml4JwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9kYy9iYXNpY3MvY29udmVyc2lvbi5jOjg2OiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbHQnIG5vdCBkZXNjcmliZWQgaW4gJ2NvbnZlcnRfZmxv
YXRfbWF0cml4JwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9iYXNp
Y3MvY29udmVyc2lvbi5jOjg2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVy
ICdidWZmZXJfc2l6ZScgbm90IGRlc2NyaWJlZCBpbiAnY29udmVydF9mbG9hdF9tYXRyaXgnCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Jhc2ljcy9jb252ZXJzaW9u
LmM6ODY6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3BhcmFtJyBkZXNjcmlw
dGlvbiBpbiAnY29udmVydF9mbG9hdF9tYXRyaXgnCgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5
LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2Jhc2ljcy9jb252ZXJzaW9uLmMgfCA5ICsrKy0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmFzaWNzL2NvbnZlcnNpb24uYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9iYXNpY3MvY29udmVyc2lvbi5jCmluZGV4IDI0ZWQwM2Q4Y2Rh
NzQuLjY3NjdmYWI1NWMyNjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9iYXNpY3MvY29udmVyc2lvbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9iYXNpY3MvY29udmVyc2lvbi5jCkBAIC03MywxMiArNzMsOSBAQCB1aW50MTZfdCBmaXhl
ZF9wb2ludF90b19pbnRfZnJhYygKIAogCXJldHVybiByZXN1bHQ7CiB9Ci0vKioKLSogY29udmVy
dF9mbG9hdF9tYXRyaXgKLSogVGhpcyBjb252ZXJ0cyBhIGRvdWJsZSBpbnRvIEhXIHJlZ2lzdGVy
IHNwZWMgZGVmaW5lZCBmb3JtYXQgUzJEMTMuCi0qIEBwYXJhbSA6Ci0qIEByZXR1cm4gTm9uZQot
Ki8KKy8qCisgKiBjb252ZXJ0X2Zsb2F0X21hdHJpeCAtIFRoaXMgY29udmVydHMgYSBkb3VibGUg
aW50byBIVyByZWdpc3RlciBzcGVjIGRlZmluZWQgZm9ybWF0IFMyRDEzLgorICovCiB2b2lkIGNv
bnZlcnRfZmxvYXRfbWF0cml4KAogCXVpbnQxNl90ICptYXRyaXgsCiAJc3RydWN0IGZpeGVkMzFf
MzIgKmZsdCwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
