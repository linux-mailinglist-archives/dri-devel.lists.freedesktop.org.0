Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F5239CFB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 01:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F7C89DBD;
	Sun,  2 Aug 2020 23:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C124D89DBD
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 23:38:30 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BD0C2083B
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 23:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596411509;
 bh=AbG/PXAqhgPVuIkQmoLq+95PIZjq2tZT6mMRiYuDpWA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EanpZdFeb8rYupCfIPn6Fs/UavWempboc9Wa9k0ebsXRsV2H9jeABwmXiYO6CnaYH
 gyz8NtTLsPx94fS5ljo9Z1mH1kGafsh3r2+NXKbLtPuckKFideuy0iXvdqQ3tHuz8f
 jsOo28LALgxXoVrxFp4UU+SlG+lfPQ3VJHVWCpDQ=
Received: by mail-ed1-f41.google.com with SMTP id df16so9629112edb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 16:38:29 -0700 (PDT)
X-Gm-Message-State: AOAM531PE85hK8W7KSKqx4fjeY19OmWOH27kwu6We6pIyYvfloKKaggP
 q3tSS/mLmc6NyzpqAZzEP1HdVfHaqLdFOmNamg==
X-Google-Smtp-Source: ABdhPJyFe20LlQFIDpRDCTfuWW+wEB+O/g/9f02O9oqUGPkMHjgGv4vDDhGCFULSLVE//K2Ox0J9Smx9kWnqwXl3DME=
X-Received: by 2002:aa7:c606:: with SMTP id h6mr713213edq.288.1596411507931;
 Sun, 02 Aug 2020 16:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-3-frank-w@public-files.de>
 <CAAOTY__7wCeTm0OY0P1VKZp-r7+d7yj=LLb79Nzr1pVVkOjy2g@mail.gmail.com>
 <6F0FD8AA-A582-45FC-BE1A-06B3812B3DEF@public-files.de>
In-Reply-To: <6F0FD8AA-A582-45FC-BE1A-06B3812B3DEF@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Aug 2020 07:38:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PZQLNFNfOPVL-YnvPNG6WjY7pcwK+wO0vEFkR=19txA@mail.gmail.com>
Message-ID: <CAAOTY_9PZQLNFNfOPVL-YnvPNG6WjY7pcwK+wO0vEFkR=19txA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/mediatek: fix boot up for 720 and 480 but 1080
To: Frank Wunderlich <frank-w@public-files.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0OOaciDLml6Ug6YCx5pelIOS4i+WNiDEyOjQ05a+r6YGT77yaCj4KPiBIaSwKPgo+
IEFtIDIuIEF1Z3VzdCAyMDIwIDAyOjA4OjQ0IE1FU1ogc2NocmllYiBDaHVuLUt1YW5nIEh1IDxj
aHVua3VhbmcuaHVAa2VybmVsLm9yZz46Cj4gPkhpLCBGcmFuazoKPiA+PiAtIGRpc2FibGUgdG1k
cyBvbiBwaHkgb24gbXQyNzAxCj4gPj4gLSBzdXBwb3J0IG90aGVyIHJlc29sdXRpb25zIGxpa2Ug
MTI4MHgxMDI0Cj4gPgo+ID5JZiB0aGlzIHBhdGNoIGRvZXMgdHdvIHRoaW5ncywgaXQgc2hvdWxk
IGJlIGJyb2tlbiBpbnRvIHR3byBwYXRjaGVzLgo+IEFzIGZhciBhcyBpIHNlZSxpdCBvbmx5IGRp
c2FibGUgdG1kcyBhbmQgc28gZml4IHNwZWNpZmljIHJlc29sdXRpb25zIGxpa2UgdGhlIHRoZSBv
bmUgYmVsb3cuc29tZSBvdGhlciAobGlrZSAxMDgwcCkgZG9lcyBub3QgaGF2ZSB0aGlzIFByb2Js
ZW0uCgpPSywgdGhpcyBpcyBvbmUgdGhpbmcsICJkaXNhYmxlIHRtZHMgb24gcGh5IG9uIG10Mjcw
MSB0byBzdXBwb3J0IG90aGVyCnJlc29sdXRpb25zIGxpa2UgMTI4MHgxMDI0IgoKPgo+ID4gSSB0
aGluayBldmVyeSBwbGwgaXMgZGVmYXVsdCBvZmYsIHNvIHlvdSBzaG91bGQgdHVybiBvbiBwbGwg
cmF0aGVyCj4gPiB0aGFuIGRpc2FibGUgdG1kcwo+Cj4gSXMgZGlzYWJsaW5nIHRtZHMgd3Jvbmcg
aGVyZT8gV2hpY2ggcGxsIGlzIG5lZWRlZCBoZXJlPyBXaGF0IGRvZXMgdG1kcz8gSSBnb3Qgb25s
eSB0aGUgUGF0Y2hlcyBmb3IgdGVzdGluZy4uLi4KCkkgZG9uJ3Qga25vdyBob3cgZG9lcyB0aGlz
IHBsbCBhbmQgdG1kcyB3b3JrLiBJIHRoaW5rIHlvdSBhbmQgbWUgYXJlCmJvdGggbm90IGZhbWls
aWFyIHdpdGggdGhpcyBoZG1pIHBoeS4gSSBhZ3JlZSB0aGlzIG1vZGlmaWNhdGlvbiBjb3VsZApm
aXggc29tZSBwcm9ibGVtLCBidXQgZG9lcyB0aGlzIHBhdGNoIGhhdmUgc2lkZSBlZmZlY3Qgd2hp
Y2ggdHJpZ2dlcgphbm90aGVyIHByb2JsZW0/IEkgbmVlZCBzb21lIHJlYXNvbmFibGUgZGVzY3Jp
cHRpb24gc28gSSBjb3VsZCBoYXZlCmNvbmZpZGVuY2Ugb24gdGhpcyBwYXRjaC4gdG1kcyBpcyBh
IGZ1bmN0aW9uIGluIG10MjcwMSBidXQgeW91IGRpc2FibGUKaXQuIFRoaXMgbWVhbiB5b3UgZGlz
YWJsZSBzb21lIGZ1bmN0aW9uIG9mIHRoaXMgaGFyZHdhcmUuIFdoeSBtdDI3MDEKZG9lcyBub3Qg
bmVlZCBpdD8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gPj4gd2l0aG91dCB0aGlzIFBhdGNo
IGkgc2VlIGZsaWNrZXJpbmcgb24gbXkgVEZUICgxMjgweDEwMjQpLAo+ID4+IHNvIGkgZ3Vlc3Mg
Y2xvY2sgaXMgd3JvbmcuCj4KPiByZWdhcmRzIEZyYW5rCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
