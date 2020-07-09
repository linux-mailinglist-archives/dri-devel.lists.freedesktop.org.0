Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D8F21A754
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 20:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6CC6EAD7;
	Thu,  9 Jul 2020 18:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B05B6EAD3;
 Thu,  9 Jul 2020 18:52:32 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id e11so2863627qkm.3;
 Thu, 09 Jul 2020 11:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VsRubMwkm5N8B9pGE1CMG+iqiqWg8gI0YSv0AW7qGVk=;
 b=CfkjGTp+/FvKKjjyGr+QjsI3PNkLNPral3Yq7WjZ0Qpb4KRW4CtNoRQ2e1Uv3R2YI7
 T7WBmXxiGBBnZobDZVcpcGU4ZxL1GFMY7mm3QDxoGAVdUp3em1/rmMru3pKDVtTiMydD
 5GvZ2su8f6zOM2E1pRFOOAtMckHLN2TfbkMwwmEd+S3X4+G73FPPVqhyjTkcrrlFexSl
 SCLsZeJOFudBuzafxypKJU1jQQvR3iC0ZEIQFjWP8QOf4h3gMr/Jm6d1OpCYf6nY/Xx2
 XIGTftc+UHHPX+WmrM12s6RoZUCkSHBs/PT4NORG9Q7LeIa7MTrlVHsRINYKh2+7vNHH
 oVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VsRubMwkm5N8B9pGE1CMG+iqiqWg8gI0YSv0AW7qGVk=;
 b=KNC6n+mJM0kJc6ciWMSY5/aAszZRceFICzmSaFee9wYOIDR0Vf4W0QXb6ZFJOKNDpE
 54nmM3wW/U86zIhI8+3IP+NuHEL4Gox/FLx2OS4jnuP3ZqHAPB8zv9fpAqq/F42bezUz
 GZLoYoY9Gad0h5cpPG3sndXXeQY/qPKrcNewc0DcgCsSdFQPzRj9o8csl793n9JW1KO6
 UiGAsrGrNLhHDothU2wWxy67xqzYCGxhcenjDE0M6SmwbmVMoKV/i5TDN/hwQ6IsbmxT
 04QqOm/yor258p8gC3IIQtyqgDDJi0LBkqPvRv+3/W4/7lrZnRNmnuoCnTJwrhnsBai0
 PUWg==
X-Gm-Message-State: AOAM532Ji1Hs8xpxAsNUcwG6vfFhdd87NrwMahjh581KixkFp+6B7mI5
 1aYtNQtyCmwEWefQZGFYnFkdAROp
X-Google-Smtp-Source: ABdhPJzA4kVMlidJPnTOF0BtF/0wCuvBYEuF+udGXm35197Z5eENJGZoxn7SuNVM6CW4Q7skWnwVfQ==
X-Received: by 2002:a37:6449:: with SMTP id y70mr65218847qkb.435.1594320751509; 
 Thu, 09 Jul 2020 11:52:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id g145sm4750036qke.17.2020.07.09.11.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 11:52:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu and radeon drm-fixes-5.8
Date: Thu,  9 Jul 2020 14:52:21 -0400
Message-Id: <20200709185221.44895-1-alexander.deucher@amd.com>
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

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuOC4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgZGNiN2ZkODJjNzVlZTJkNmU2ZjlkOGNjNzFjNTI1MTllZDUyZTI1ODoKCiAg
TGludXggNS44LXJjNCAoMjAyMC0wNy0wNSAxNjoyMDoyMiAtMDcwMCkKCmFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3Jn
L35hZ2Q1Zi9saW51eCB0YWdzL2FtZC1kcm0tZml4ZXMtNS44LTIwMjAtMDctMDkKCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBmNDg5MmMzMjdhOGU1ZGY3Y2UxNmNhYjQwODk3ZGFmOTBi
YWY2YmVjOgoKICBkcm0vYW1kZ3B1OiBkb24ndCBkbyBzb2Z0IHJlY292ZXJ5IGlmIGdwdV9yZWNv
dmVyeT0wICgyMDIwLTA3LTA5IDE0OjQyOjQ5IC0wNDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQphbWQtZHJtLWZpeGVz
LTUuOC0yMDIwLTA3LTA5OgoKYW1kZ3B1OgotIEZpeCBhIHN1c3BlbmQvcmVzdW1lIGlzc3VlIHdp
dGggUFNQCi0gQmFja2xpZ2h0IGZpeCBmb3IgUmVub2lyCi0gRml4IGZvciBncHUgcmVjb3Zlcnkg
ZGVidWdnaW5nCgpyYWRlb246Ci0gRml4IGEgZG91YmxlIGZyZWUgaW4gZXJyb3IgcGF0aAoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpBYXJvbiBNYSAoMSk6CiAgICAgIGRybS9hbWQvZGlzcGxheTogYWRkIGRtY3ViIGNoZWNr
IG9uIFJFTk9JUgoKSHVhbmcgUnVpICgyKToKICAgICAgZHJtL2FtZGdwdTogYXNkIGZ1bmN0aW9u
IG5lZWRzIHRvIGJlIHVubG9hZGVkIGluIHN1c3BlbmQgcGhhc2UKICAgICAgZHJtL2FtZGdwdTog
YWRkIFRNUiBkZXN0b3J5IGZ1bmN0aW9uIGZvciBwc3AKCk1hcmVrIE9sxaHDoWsgKDEpOgogICAg
ICBkcm0vYW1kZ3B1OiBkb24ndCBkbyBzb2Z0IHJlY292ZXJ5IGlmIGdwdV9yZWNvdmVyeT0wCgpU
b20gUml4ICgxKToKICAgICAgZHJtL3JhZGVvbjogZml4IGRvdWJsZSBmcmVlCgogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jICAgICAgICAgICB8ICAzICstCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgICAgICAgICAgIHwgNjMgKysrKysrKysr
KysrKysrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaV9kcG0uYyAgICAgICAg
ICAgICAgICAgICB8ICA3ICsrLQogNCBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
