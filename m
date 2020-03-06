Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC517C473
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 18:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075946E4D4;
	Fri,  6 Mar 2020 17:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B92B6E4D4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 17:32:16 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g12so1141118plo.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 09:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=G1RDgxBiyV6Kk2G6RLMWzGPree6/YVdm0hvb7UeIEqk=;
 b=eJ5c87ziTXTK+rhDA6QRlgfcRU/IdlKxZshAQM2TCEltwHmpXlDjzbuPMRXbX/7SGS
 X6IcuBDDareaY/S6mEVT0sTK3myUJL+cptTI+1dD6SVbdEuCtEJVaWp1SEPjhfBDYtPO
 VnfXAUQrEMFY0Nar8GnvXCEnkpF1wckCT89A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=G1RDgxBiyV6Kk2G6RLMWzGPree6/YVdm0hvb7UeIEqk=;
 b=liW0CEuYyMCovnDdxVXUmJEzcXYI8dW/5NbVsIM62iLE86RrxhXehLWoK0u0+5FCrF
 o8152D0KyB+K3ZYGVjAvc8QYnY4kj5SAK9nOKdn/NFIdF0UIf1TI3wS6PgM+F33EBUs+
 7C8Jq+LAUYwbqjvT2huD0PhmxiH9FWSqwN7J380+GYi/E+hFelWCpjSKI382mJScByhP
 HtHPWQ/QwJa9me+LNmFTO0aQm3GFvPdZkiEkI27Zkyrkpwp6LFibj7O7V5/sJ/3bDzuz
 amu+o4IYMiRSTpH+jJRFZgDUBH0/RwQCsnJa6nC2pHVMVsaB89MFb6QUnVIAtxFbLXUl
 c+nQ==
X-Gm-Message-State: ANhLgQ05EowEn2cFWjUFR9aNcKtWMaHZCOdffJmrJU9t7KXIN9GODzN2
 kbdqbHJx+jZhp/5fJ5mpZyK3Vg==
X-Google-Smtp-Source: ADFU+vu76IOA+FPbi+9Jw1089IGoAuLPRcbDWWPgxaDXV5HF6U2+lYzFPU/z9i6aSOe5cIMfsSEKHg==
X-Received: by 2002:a17:902:342:: with SMTP id
 60mr3878637pld.206.1583515935302; 
 Fri, 06 Mar 2020 09:32:15 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x190sm37154310pfb.96.2020.03.06.09.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 09:32:14 -0800 (PST)
Date: Fri, 6 Mar 2020 09:32:13 -0800
From: Kees Cook <keescook@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/edid: Distribute switch variables for initialization
Message-ID: <202003060930.DDCCB6659@keescook>
MIME-Version: 1.0
Content-Disposition: inline
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
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VmFyaWFibGVzIGRlY2xhcmVkIGluIGEgc3dpdGNoIHN0YXRlbWVudCBiZWZvcmUgYW55IGNhc2Ug
c3RhdGVtZW50cwpjYW5ub3QgYmUgYXV0b21hdGljYWxseSBpbml0aWFsaXplZCB3aXRoIGNvbXBp
bGVyIGluc3RydW1lbnRhdGlvbiAoYXMKdGhleSBhcmUgbm90IHBhcnQgb2YgYW55IGV4ZWN1dGlv
biBmbG93KS4gV2l0aCBHQ0MncyBwcm9wb3NlZCBhdXRvbWF0aWMKc3RhY2sgdmFyaWFibGUgaW5p
dGlhbGl6YXRpb24gZmVhdHVyZSwgdGhpcyB0cmlnZ2VycyBhIHdhcm5pbmcgKGFuZCB0aGV5CmRv
bid0IGdldCBpbml0aWFsaXplZCkuIENsYW5nJ3MgYXV0b21hdGljIHN0YWNrIHZhcmlhYmxlIGlu
aXRpYWxpemF0aW9uCih2aWEgQ09ORklHX0lOSVRfU1RBQ0tfQUxMPXkpIGRvZXNuJ3QgdGhyb3cg
YSB3YXJuaW5nLCBidXQgaXQgYWxzbwpkb2Vzbid0IGluaXRpYWxpemUgc3VjaCB2YXJpYWJsZXNb
MV0uIE5vdGUgdGhhdCB0aGVzZSB3YXJuaW5ncyAob3Igc2lsZW50CnNraXBwaW5nKSBoYXBwZW4g
YmVmb3JlIHRoZSBkZWFkLXN0b3JlIGVsaW1pbmF0aW9uIG9wdGltaXphdGlvbiBwaGFzZSwKc28g
ZXZlbiB3aGVuIHRoZSBhdXRvbWF0aWMgaW5pdGlhbGl6YXRpb25zIGFyZSBsYXRlciBlbGlkZWQg
aW4gZmF2b3Igb2YKZGlyZWN0IGluaXRpYWxpemF0aW9ucywgdGhlIHdhcm5pbmdzIHJlbWFpbi4K
ClRvIGF2b2lkIHRoZXNlIHByb2JsZW1zLCBsaWZ0IHN1Y2ggdmFyaWFibGVzIHVwIGludG8gdGhl
IG5leHQgY29kZQpibG9jay4KCmRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jOiBJbiBmdW5jdGlv
biDigJhkcm1fZWRpZF90b19lbGTigJk6CmRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jOjQzOTU6
OTogd2FybmluZzogc3RhdGVtZW50IHdpbGwgbmV2ZXIgYmUKZXhlY3V0ZWQgWy1Xc3dpdGNoLXVu
cmVhY2hhYmxlXQogNDM5NSB8ICAgICBpbnQgc2FkX2NvdW50OwogICAgICB8ICAgICAgICAgXn5+
fn5+fn5+CgpbMV0gaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD00NDkxNgoK
U2lnbmVkLW9mZi1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Ci0tLQp2Mjog
bW92ZSBpbnRvIGZ1bmN0aW9uIGJsb2NrIGluc3RlYWQgYmVpbmcgc3dpdGNoLWxvY2FsIChWaWxs
ZSBTeXJqw6Rsw6QpCi0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAzICstLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMK
aW5kZXggODA1ZmIwMDRjOGViLi40NmNlZTc4YmMxNzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC00Mzgx
LDYgKzQzODEsNyBAQCBzdGF0aWMgdm9pZCBkcm1fZWRpZF90b19lbGQoc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0IGVkaWQgKmVkaWQpCiAKIAlpZiAoY2VhX3JldmlzaW9u
KGNlYSkgPj0gMykgewogCQlpbnQgaSwgc3RhcnQsIGVuZDsKKwkJaW50IHNhZF9jb3VudDsKIAog
CQlpZiAoY2VhX2RiX29mZnNldHMoY2VhLCAmc3RhcnQsICZlbmQpKSB7CiAJCQlzdGFydCA9IDA7
CkBAIC00MzkyLDggKzQzOTMsNiBAQCBzdGF0aWMgdm9pZCBkcm1fZWRpZF90b19lbGQoc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0IGVkaWQgKmVkaWQpCiAJCQlkYmwgPSBj
ZWFfZGJfcGF5bG9hZF9sZW4oZGIpOwogCiAJCQlzd2l0Y2ggKGNlYV9kYl90YWcoZGIpKSB7Ci0J
CQkJaW50IHNhZF9jb3VudDsKLQogCQkJY2FzZSBBVURJT19CTE9DSzoKIAkJCQkvKiBBdWRpbyBE
YXRhIEJsb2NrLCBjb250YWlucyBTQURzICovCiAJCQkJc2FkX2NvdW50ID0gbWluKGRibCAvIDMs
IDE1IC0gdG90YWxfc2FkX2NvdW50KTsKLS0gCjIuMjAuMQoKCi0tIApLZWVzIENvb2sKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
