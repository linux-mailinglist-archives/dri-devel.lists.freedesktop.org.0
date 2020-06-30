Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F2921049D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D246E828;
	Wed,  1 Jul 2020 07:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31A089BF5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 17:02:08 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t25so18866234lji.12
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 10:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zm73/VCv6D7tyjxlDYUvUqi434b/awSj205uGGSiY5E=;
 b=tqjQx/HFMAKT91zIH/bwqIcsxDgnE+o7tj9C36qUiMT6LNlS/MRbarOXOhAjo05SoQ
 42fTsD0Bbk4bFkjSL/DeMJM1UVylpbSuBvlr1nF/qHCagwxzJ6dQLIUvvgqbJxLp18pv
 3LWb9GK2CNPoyF1sPNibc8ZYqqCmfOH0Xnk28lzC8Ct4OyESOg2brOSo2eMj2siUijDX
 Ivn+g/tGC1mkwx1GjiVqPpprQ6Up/09PXknZPXh0nlVUcLsCiMEYAzYS3Aj5GgaDi6Fp
 R0jkzp/RRyeUbxxpJmjJsJIiUR+11UuIhdigZDR4eYY8I+3d304tk+pC4kvx5942gepY
 dLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zm73/VCv6D7tyjxlDYUvUqi434b/awSj205uGGSiY5E=;
 b=kdp+AVhbpMsNTfm8IWkuk+FwxlZcSUfUBLpbwWzhJBg4nMSoCNWvbEnju44hhj2vhL
 iT+RG83LdHeb9RHW9zYzmKvheqS0Pq/TNDpPUe6AAXMRhQbExZJ0DY/J0WaZg4oAaiDZ
 QY20/xs2PdqQ9mHWQoHEJAFardKo8o+XWFUnEGEqrrjboXXKnwBZGmapNfH6lKJbzufQ
 sPUrc+IFZ/3UXhw72i8ujJJSmyGcZ5pGOZcbvmDxnO3C1/bBmFYmlp/58oO19T92QKAz
 s8pOPtHsRwrhLcxYfrJU2EoVIWQlsu6b2D4QdETh6ZgwiYpCEe6+xiPfet5P/RqDILdx
 1wSQ==
X-Gm-Message-State: AOAM53013+YLeKK3CYDjm1MsuSI4OBIJAZR6+UjPDfBk47USCD4cx175
 CLUeiSemI8Bg4LXFjiviBZ+Lz/SEpds=
X-Google-Smtp-Source: ABdhPJySlQU/MvAcD940eAO4I0jczbnnGO6YWZ/sb/tciNiEsQmajGFLUIMqC2ALxjQA7vqNRzlD3A==
X-Received: by 2002:a2e:b8c2:: with SMTP id s2mr11668004ljp.368.1593536527151; 
 Tue, 30 Jun 2020 10:02:07 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id d21sm587797ljo.85.2020.06.30.10.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 10:02:06 -0700 (PDT)
Subject: Re: [PATCH v8 1/7] of_graph: add of_graph_presents()
To: Rob Herring <robh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-2-digetx@gmail.com> <20200629231211.GA3142766@bogus>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1ef25775-1f37-25ce-f534-54cc995a5658@gmail.com>
Date: Tue, 30 Jun 2020 20:02:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200629231211.GA3142766@bogus>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MzAuMDYuMjAyMCAwMjoxMiwgUm9iIEhlcnJpbmcg0L/QuNGI0LXRgjoKPiBPbiBUaHUsIEp1biAx
OCwgMjAyMCBhdCAwMToyNjo1N0FNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IElu
IHNvbWUgY2FzZSwgbGlrZSBhIERSTSBkaXNwbGF5IGNvZGUgZm9yIGV4YW1wbGUsIGl0J3MgdXNl
ZnVsIHRvIHNpbGVudGx5Cj4+IGNoZWNrIHdoZXRoZXIgcG9ydCBub2RlIGV4aXN0cyBhdCBhbGwg
aW4gYSBkZXZpY2UtdHJlZSBiZWZvcmUgcHJvY2VlZGluZwo+PiB3aXRoIHBhcnNpbmcgb2YgdGhl
IGdyYXBoLgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgb2ZfZ3JhcGhfcHJlc2VudHMoKSB0aGF0IHJl
dHVybnMgdHJ1ZSBpZiBnaXZlbiBkZXZpY2UtdHJlZQo+PiBub2RlIGNvbnRhaW5zIE9GIGdyYXBo
IHBvcnQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWls
LmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL29mL3Byb3BlcnR5LmMgICAgfCA1MiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4+ICBpbmNsdWRlL2xpbnV4L29mX2dyYXBo
LmggfCAgNiArKysrKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jIGIvZHJp
dmVycy9vZi9wcm9wZXJ0eS5jCj4+IGluZGV4IDFmMjA4NmY0ZTdjZS4uYjg0ZWQ2YTdjZjUwIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPj4gKysrIGIvZHJpdmVycy9vZi9w
cm9wZXJ0eS5jCj4+IEBAIC0yOSw2ICsyOSw0OCBAQAo+PiAgCj4+ICAjaW5jbHVkZSAib2ZfcHJp
dmF0ZS5oIgo+PiAgCj4+ICsvKioKPj4gKyAqIG9mX2dyYXBoX2dldF9maXJzdF9sb2NhbF9wb3J0
KCkgLSBnZXQgZmlyc3QgbG9jYWwgcG9ydCBub2RlCj4+ICsgKiBAbm9kZTogcG9pbnRlciB0byBh
IGxvY2FsIGVuZHBvaW50IGRldmljZV9ub2RlCj4+ICsgKgo+PiArICogUmV0dXJuOiBGaXJzdCBs
b2NhbCBwb3J0IG5vZGUgYXNzb2NpYXRlZCB3aXRoIGxvY2FsIGVuZHBvaW50IG5vZGUgbGlua2Vk
Cj4+ICsgKgkgICB0byBAbm9kZS4gVXNlIG9mX25vZGVfcHV0KCkgb24gaXQgd2hlbiBkb25lLgo+
PiArICovCj4+ICtzdGF0aWMgc3RydWN0IGRldmljZV9ub2RlICoKPj4gK29mX2dyYXBoX2dldF9m
aXJzdF9sb2NhbF9wb3J0KGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKPj4gK3sKPj4g
KwlzdHJ1Y3QgZGV2aWNlX25vZGUgKnBvcnRzLCAqcG9ydDsKPj4gKwo+PiArCXBvcnRzID0gb2Zf
Z2V0X2NoaWxkX2J5X25hbWUobm9kZSwgInBvcnRzIik7Cj4+ICsJaWYgKHBvcnRzKQo+PiArCQlu
b2RlID0gcG9ydHM7Cj4+ICsKPj4gKwlwb3J0ID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUobm9kZSwg
InBvcnQiKTsKPj4gKwlvZl9ub2RlX3B1dChwb3J0cyk7Cj4+ICsKPj4gKwlyZXR1cm4gcG9ydDsK
Pj4gK30KPj4gKwo+PiArLyoqCj4+ICsgKiBvZl9ncmFwaF9wcmVzZW50cygpIC0gY2hlY2sgZ3Jh
cGgncyBwcmVzZW5jZQo+PiArICogQG5vZGU6IHBvaW50ZXIgdG8gYSBkZXZpY2Vfbm9kZSBjaGVj
a2VkIGZvciB0aGUgZ3JhcGgncyBwcmVzZW5jZQo+PiArICoKPj4gKyAqIFJldHVybjogVHJ1ZSBp
ZiBAbm9kZSBoYXMgYSBwb3J0IG9yIHBvcnRzIHN1Yi1ub2RlLCBmYWxzZSBvdGhlcndpc2UuCj4+
ICsgKi8KPj4gK2Jvb2wgb2ZfZ3JhcGhfcHJlc2VudHMoY29uc3Qgc3RydWN0IGRldmljZV9ub2Rl
ICpub2RlKQo+IAo+IG9mX2dyYXBoX2lzX3ByZXNlbnQKPiAKPiBPdGhlcndpc2UsCj4gCj4gUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gCgpUaGFua3MhCgpJJ2xs
IGFkZHJlc3MgdGhlIGNvbW1lbnQgYW5kIHRoZW4gZmFjdG9yIG91dCB0aGlzIGFuZCB0aGUKZHJt
X29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCkgY2hhbmdlcyBpbnRvIGEgc2VwYXJhdGUgc2VyaWVz
IGluIHY5LApzaW5jZSB0aGUgVGVncmEgRFJNIHBhdGNoZXMgY291bGQgYmUgYXBwbGllZCBzZXBh
cmF0ZWx5IGJ5IFRoaWVycnkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
