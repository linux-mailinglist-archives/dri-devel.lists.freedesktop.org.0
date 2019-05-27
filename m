Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B092AF3F
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 09:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E692289895;
	Mon, 27 May 2019 07:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D87889895
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 07:11:56 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id z11so9927129vsq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 00:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HkN7x4eb/PypDznC5R7PmCalLlRN9yjD6C/vHeN+jc8=;
 b=CZDIugoUIa24lcuAKkfYAt4QA0RDGpbd5EOQFSE3Nh+I1sQ0CInvdGXeEypI3HE6/+
 nH7rsD1DThUHfgZ3xcABEjO/HEb8sqj0ObP4kO0dBYVudTuvFvmp0jkLVjwxhVRZchWa
 yJpiG2PuY6nk64AY2M7lmn3zIfDHqerUxvun++aOTeAh1qh6QnNF1ncH481ZR8hnMHpt
 yB7EPFOURAmtip6dPjBUHj4IifpoqmXm6UUtC8zF4MfvE916lqe5xv2soC2/D3GNHgIm
 D5chN5gq4l2xVic9aSt/gAqi0o414R2J13zndtfMGjmK0vC/m2GLYi/qrs60d+7DX+lS
 7vBQ==
X-Gm-Message-State: APjAAAVnGilNXjjCs8Ja7lshTq6fYcXhH1dRysTaYXIMSSAYhxTVaJwN
 zp0zT3ltjTakehYvvvD3TWTBGDKqYlNAuYMmvPaKgDOdPII=
X-Google-Smtp-Source: APXvYqyhL9PG695yNGfYkXzMyqb/cDF2XT7OhtLCr95vxEO4pDQegFptfrhpQSs1cc7axn+7edaQTGuHhHK8n3quQtk=
X-Received: by 2002:a67:6046:: with SMTP id u67mr44581766vsb.106.1558941114821; 
 Mon, 27 May 2019 00:11:54 -0700 (PDT)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 27 May 2019 12:41:43 +0530
Message-ID: <CAOuPNLgUBDJ3qhD5mzQ6kYbpO7RHa7EhkfR668wtL6rkhY_s2g@mail.gmail.com>
Subject: dpms mode change with wayland on iMX.6
To: dri-devel@lists.freedesktop.org, paulo.r.zanoni@intel.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=HkN7x4eb/PypDznC5R7PmCalLlRN9yjD6C/vHeN+jc8=;
 b=COmWsixQ4PM0g+PITXewe8hF1m3CHbJ4nVcocYmbgQ4JlboV5N2S0zR+sIt/LZhmv7
 sCW1cJbawyLHdRncsvFG54YN/YBN72G+QYwN7MzAQJA2L9iZERSyEAA3zqHkuUluNEk0
 Gz4ogGjO2/ohf2//Gw+4lb38AFF0Rs6LT89bQv2rVIiuWvpUQhgSJV+eHAENNhySYUxm
 b/h8JQfDg8k8R/Q1Rtpsfi9MUuRD6hopfBmXc0Z62RIg8uwNWIm6HTdumdR8xSW2RVbn
 cNrYf8IVQKgGiVS8M9y+E5dma6HRXSiQv2EZxxVPPbrvoT/9U4OCze240Exrm+mv620/
 k3Zw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBBbGwsCgpJIGhhdmUgYSBpTVguNiAoYXJtIDMyKSBib2FyZCB3aXRoIExpbnV4IEtlcm5l
bCAzLjEwIGFuZCBkZWJpYW4KcGxhdGZvcm0gcnVubmluZy4KVGhlIGJvYXJkIGlzIGNvbm5lY3Rl
ZCB0byBvbmUgTENEIHNjcmVlbiBhbmQgb25lIEhETUkgbW9uaXRvci4KSXQgaGF2ZSBEUk0gKyBX
YXlsYW5kIHNldHVwIGZvciBkaXNwbGF5LgpBbHNvLCBJIG5vdGljZWQgdGhhdCBpdCBoYXZlIHR3
byBkcmkgaW50ZXJmYWNlOgovZGV2L2RyaS9jYXJkMAovZGV2L2RyaS9jYXJkMQoKSSBhbSBub3Qg
dmVyeSBmYW1pbGlhciB3aXRoIExpbnV4IEdyYXBoaWNzL0Rpc3BsYXkgc3Vic3lzdGVtLCBzbyBJ
IGFtCmxvb2tpbmcgZm9yIHNvbWUgaGVscCBoZXJlLgoKTXkgcmVxdWlyZW1lbnQgaXMgdGhhdCBJ
IGhhdmUgdHVybiBvZmYgSERNSSBkaXNwbGF5IHNjcmVlbiB1c2luZyBhCmNvbW1hbmQgbGluZSB1
dGlsaXR5IG9yIHRlc3QgcHJvZ3JhbS4KSSBsZWFybiB0aGF0IGZvciBYLXNlcnZlciB3ZSBjYW4g
dXNlIHhzZXQgOiB4c2V0IGRwbXMgZm9yY2Ugb2ZmIChhbmQKaXQgd29ya3Mgb24gbXkgdWJ1bnR1
IGRlc2t0b3Agd2l0aCAxNi4wNCkuCgpIb3dldmVyIHRoaXMgY29tbWFuZCBkb2VzIG5vdCBleGlz
dHMgb24gbXkgYm9hcmQuClNvLCBteSBxdWVzdGlvbiBpczoKSXMgdGhlcmUgYW55IGVxdWl2YWxl
bnQgRFBNUyBjb21tYW5kcyBmb3IgV2F5bGFuZC9XZXRzb24/CgotLS0tLS0tLS0KRnVydGhlciwg
aW4gb3JkZXIgdG8gZXhwbG9yZSBtb3JlLCBJIGNsb25lZCBsaWJkcm0gY29kZSBmcm9tIGhlcmU6
CnVybCA9IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2RybQoKVGhlbiBJIGZv
dW5kIHNvbWUgdGVzdCB1dGlsaXR5IHVuZGVyOiBkcm0vdGVzdHMgZm9sZGVyLgpBZnRlciBleHBs
b3JpbmcgbW9yZSwgYW5kIGZldyBtb2RpZmljYXRpb24sIHNvbWVob3cgSSBjb3VsZCBhYmxlIHRv
CmNyb3NzLWNvbXBpbGUgInByb3B0ZXN0IiBmb3IgbXkgYm9hcmQgdXNpbmcgYmVsb3c6CmFybS1s
aW51eC1nbnVlYWJpLWdjYyAtbyBwcm9wdGVzdC5vdXQgcHJvcHRlc3QuYwotSS4vdGFyZ2V0L2xp
YmRybV9pbmNsdWRlLyAtTC4vdGFyZ2V0L2xpYmRybV9saWIvIC1sZHJtCgpJIGZvdW5kIHRoYXQg
Ii9kZXYvZHJpL2NhcmQwIiBpcyBub3Qgd29ya2luZyB3aXRoIHRoaXMgdGVzdC4KU28sIEkgY2hh
bmdlZCB0aGUgdGVzdCB1dGlsaXR5IGxpa2UgdGhpczoKZmQgPSBkcm1PcGVuKCJpbXgtZHJtIiwg
TlVMTCk7Ck9SCmZkID0gb3BlbigiL2Rldi9kcmkvY2FyZDEiLCBPX1JEV1IpOwoKV2hlbiBJIGRl
ZmF1bHQgcnVuIGl0IG9uIG15IGJvYXJkLCBJIHNlZSB0aGF0ICJDb25uZWN0b3JfaWQ6IDI5IiBp
cwpzaG93aW5nIGZvciB0aGUgSERNSSBkaXNwbGF5IGFuZCBpdCBjYW4gc3VwcG9ydCBEUE1TIHBy
b3BlcnR5Lgp7e3sKQ29ubmVjdG9yIDI5ICgxMS0xKQogICAgICAgIDEgRURJRDoKICAgICAgICAg
ICAgICAgIGZsYWdzOiBpbW11dGFibGUgYmxvYgogICAgICAgICAgICAgICAgYmxvYnM6CgogICAg
ICAgICAgICAgICAgdmFsdWU6CiAgICAgICAgICAgICAgICAgICAgIFhYWFhYWFgKICAgICAgICAy
IERQTVM6CiAgICAgICAgICAgICAgICBmbGFnczogZW51bQogICAgICAgICAgICAgICAgZW51bXM6
IE9uPTAgU3RhbmRieT0xIFN1c3BlbmQ9MiBPZmY9MwogICAgICAgICAgICAgICAgdmFsdWU6IDAK
Q1JUQyAyNApDUlRDIDI3Cn19fQoKVGhlbiwgd2hlbiBJIHRyeSB0byBydW4gaXQgdXNpbmcgYmVs
b3cgY29tbWFuZDoKIyAuL3Byb3B0ZXN0Lm91dCAyOSBjb25uZWN0b3IgMiAzCgpUaGUgcHJvZ3Jh
bSBqdXN0IHJldHVybnMgc3VjY2Vzc2Z1bGx5IHdpdGhvdXQgYW55IGVycm9ycywgYnV0IG5vdGhp
bmcKaGFwcGVucy4gVGhlIGRpc3BsYXkgZG9lcyBub3QgdHVybnMgb2ZmLgpJIHNhdyB0aGF0IGlu
IG15IGtlcm5lbCAzLjEwIHRoZSBpb2N0bChEUk1fSU9DVExfTU9ERV9TRVRQUk9QRVJUWSkgaXMK
YWxyZWFkeSBzdXBwb3J0ZWQgdW5kZXIgRFJNLgoKU28sIEkgYW0gd29uZGVyaW5nIHdoYXQgaXMg
dGhlIHJpZ2h0IHdheSB0byB2ZXJpZnkgRFBNUyBtb2RlIHByb3BlcnR5Cm9uIHdheWxhbmQgPwoK
SWYgYW55Ym9keSBoYXZlIGFueSBzdWdnZXN0aW9ucywgcGxlYXNlIGhlbHAgbWUuCgoKVGhhbmtz
LApQaW50dQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
