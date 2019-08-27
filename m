Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6409E7E9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 14:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B9F89762;
	Tue, 27 Aug 2019 12:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A94489762
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 12:30:16 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id p23so14287018oto.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 05:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=aQgUrji3JLkWxgHqWnOkvsVYptayYJD4EEVcvouCxbo=;
 b=kb0tG0spCIg6IAz6hw//PVzx15QZkyLmxABT3Oo9aYbS4xi/IGXg8AjPpI7Ru3uh4J
 VUIwSSpjy9u3PbWtyuufZynPn/8NDaWJnFQdqg3CicnSfW+5JNa4XHROVwr+pAUrXqHx
 GhAMK2AzXGnbEb214NzVgdmtCvmpK6Et5qe0mDxvMoksjzjZfGL9EkMu9I8Crfdju+HW
 FbhnRu3JnrtAQyN5WQl6i6ONwvkgyn2co8RYaIfS7QRTh0zRfFiqZaTEjBgyCk70m/aF
 PI7d+mfhyoLSFxowZfYhCYwfBoqjaAzrHZcbYurZxo6oVnE1f7s5asr07Cr1WD7sNr5x
 XWfA==
X-Gm-Message-State: APjAAAWcuTpEovxtJsbS1zqiNbv09u8jbX7XGDA5kDd1bpLqChVXnBuu
 nKdBHBZMEmdrBBG0H2sqngdh0XpwRoNF3wzhy+06NPu+
X-Google-Smtp-Source: APXvYqwDLK91nxUQtfrupsXHNL40ooDa0Xmq08hAP8hA9d+dDHMLcXvtPb/j/0H7WP45CRJV0yHH9X1Mu10Yr2XLcGI=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr19835500otn.297.1566909015712; 
 Tue, 27 Aug 2019 05:30:15 -0700 (PDT)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2019 14:30:04 +0200
Message-ID: <CAMuHMdUk9G22rDfUrX3CZ=st3_bSehyaW_URtCk0ZfJqFTmLuQ@mail.gmail.com>
Subject: Re: dma-buf: Add selftests for dma-fence
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXMsCgpXaGVuIHJ1bm5pbmcgdGhlIG5ldyBkbWFidWYtc2VsZnRlc3RzIG9uIHR3byBk
aWZmZXJlbnQgc3lzdGVtcywgSSBnZXQ6CgogICAgZG1hLWJ1ZjogUnVubmluZyBzYW5pdHljaGVj
awogICAgZG1hLWJ1ZjogUnVubmluZyBkbWFfZmVuY2UKICAgIHNpemVvZihkbWFfZmVuY2UpPTQ4
CiAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9mZW5jZS9zYW5pdHljaGVjawogICAgZG1hLWJ1Zjog
UnVubmluZyBkbWFfZmVuY2UvdGVzdF9zaWduYWxpbmcKICAgIGRtYS1idWY6IFJ1bm5pbmcgZG1h
X2ZlbmNlL3Rlc3RfYWRkX2NhbGxiYWNrCiAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9mZW5jZS90
ZXN0X2xhdGVfYWRkX2NhbGxiYWNrCiAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9mZW5jZS90ZXN0
X3JtX2NhbGxiYWNrCiAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9mZW5jZS90ZXN0X2xhdGVfcm1f
Y2FsbGJhY2sKICAgIGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlL3Rlc3Rfc3RhdHVzCiAgICBk
bWEtYnVmOiBSdW5uaW5nIGRtYV9mZW5jZS90ZXN0X2Vycm9yCiAgICBkbWEtYnVmOiBSdW5uaW5n
IGRtYV9mZW5jZS90ZXN0X3dhaXQKICAgIGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlL3Rlc3Rf
d2FpdF90aW1lb3V0CiAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9mZW5jZS90ZXN0X3N0dWIKICAg
IGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlL3JhY2Vfc2lnbmFsX2NhbGxiYWNrCiAgICB0aHJl
YWRfc2lnbmFsX2NhbGxiYWNrWzBdIGNvbXBsZXRlZCAyODg1NSBwYXNzZXMsIDM5MjkgbWlzc2Vz
CiAgICB0aHJlYWRfc2lnbmFsX2NhbGxiYWNrWzFdIGNvbXBsZXRlZCAyODg0NiBwYXNzZXMsIDM5
MTggbWlzc2VzCiAgICB0aHJlYWRfc2lnbmFsX2NhbGxiYWNrWzBdIGNvbXBsZXRlZCAzNzE3OSBw
YXNzZXMsIDM3MTc5IG1pc3NlcwogICAgdGhyZWFkX3NpZ25hbF9jYWxsYmFja1sxXSBjb21wbGV0
ZWQgMzcxODQgcGFzc2VzLCAzNzE4MyBtaXNzZXMKCmFuZAoKICAgIGRtYS1idWY6IFJ1bm5pbmcg
c2FuaXR5Y2hlY2sKICAgIGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlCiAgICBzaXplb2YoZG1h
X2ZlbmNlKT02NAogICAgZG1hLWJ1ZjogUnVubmluZyBkbWFfZmVuY2Uvc2FuaXR5Y2hlY2sKICAg
IGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlL3Rlc3Rfc2lnbmFsaW5nCiAgICBkbWEtYnVmOiBS
dW5uaW5nIGRtYV9mZW5jZS90ZXN0X2FkZF9jYWxsYmFjawogICAgZG1hLWJ1ZjogUnVubmluZyBk
bWFfZmVuY2UvdGVzdF9sYXRlX2FkZF9jYWxsYmFjawogICAgZG1hLWJ1ZjogUnVubmluZyBkbWFf
ZmVuY2UvdGVzdF9ybV9jYWxsYmFjawogICAgZG1hLWJ1ZjogUnVubmluZyBkbWFfZmVuY2UvdGVz
dF9sYXRlX3JtX2NhbGxiYWNrCiAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9mZW5jZS90ZXN0X3N0
YXR1cwogICAgZG1hLWJ1ZjogUnVubmluZyBkbWFfZmVuY2UvdGVzdF9lcnJvcgogICAgZG1hLWJ1
ZjogUnVubmluZyBkbWFfZmVuY2UvdGVzdF93YWl0CiAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9m
ZW5jZS90ZXN0X3dhaXRfdGltZW91dAogICAgZG1hLWJ1ZjogUnVubmluZyBkbWFfZmVuY2UvdGVz
dF9zdHViCiAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9mZW5jZS9yYWNlX3NpZ25hbF9jYWxsYmFj
awogICAgdGhyZWFkX3NpZ25hbF9jYWxsYmFja1swXSBjb21wbGV0ZWQgMzQyMyBwYXNzZXMsIDIx
NDggbWlzc2VzCiAgICB0aHJlYWRfc2lnbmFsX2NhbGxiYWNrWzFdIGNvbXBsZXRlZCAyMzYwIHBh
c3NlcywgOSBtaXNzZXMKICAgIHRocmVhZF9zaWduYWxfY2FsbGJhY2tbMF0gY29tcGxldGVkIDQw
MjggcGFzc2VzLCA0MDI4IG1pc3NlcwogICAgdGhyZWFkX3NpZ25hbF9jYWxsYmFja1sxXSBjb21w
bGV0ZWQgODA4MCBwYXNzZXMsIDgwNzkgbWlzc2VzCgpVbmZvcnR1bmF0ZWx5IGl0IGlzIG5vdCBj
bGVhciB0byBtZSBpZiB0aGlzIGlzIGdvb2Qgb3IgYmFkPwpQZXJoYXBzIHRoZSB0ZXN0IG91dHB1
dCBjYW4gYmUgaW1wcm92ZWQsIGUuZy4gd2l0aCBhIGNsZWFyIFBBU1MvRkFJTCBvdXRwdXQ/CgpU
aGFua3MhCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
