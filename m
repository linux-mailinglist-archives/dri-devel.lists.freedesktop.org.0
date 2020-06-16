Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796E71FC72A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FE26E250;
	Wed, 17 Jun 2020 07:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43CE6E8D7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 14:42:51 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n23so23825472ljh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7P3LB8iTbLRgQbcq6lDOMzujkFPYmAYJeuZvysUa6f8=;
 b=ADu0zGoccAnnbS99Om04LkeJDNXA9DWDossI9TySgkmvs4J+DKTT+JIKZhXaNnLmzb
 WYkPFt34tOPuseJUbTM9ZtB0PVi2e8Lg5Vq+I+SmmjoIEWeoJ/ENydWUc+3MRck84qBS
 Mt47n2z23tQ7aa4Auo68bD0WRYVpc3d6gO9WJVuDK3/npnE7AjX2H6H+QXUq0uKZbQkS
 au8u0ny2N/inXli/Z62DboR5qtqj22jwvK4fsmPI4aw51bGA9i+PqxLh8yktJbNQeZ58
 hqSnFS8KIvknbjw6c2d6jiBFYnqKFnRjTgHBxEZrbSAPQ0v0nfaj/+i5M2JRPYzGM9ZR
 dMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7P3LB8iTbLRgQbcq6lDOMzujkFPYmAYJeuZvysUa6f8=;
 b=jvBNxT+lX4+6kzadYoB185mOs1AzgtuiaK2QBlRJv13/K+uVVCfFiN7O8gl6Z84fJ/
 8xLnSdNCG4XNJnZZyR11eubUrnfywcoHyV/wmzLZ8lUP+1Dkt0twwh+DQ0y+q3nEQq4l
 zj6Ddf5AuLxqE+zapzzBhArKknwOzxA+/VDx/lGMinVZT4ScsoQ3RaxoT4Ryp9NW3uPc
 /oTCVGPMpl0r9IAA2fCawCgi/szp/FCFdj6fm9BUiKQZH38t/7qQdvXB46VYA0GeMb0Z
 D/niZJW/q9qgXYNM7FfFC2EUclYZbrDwihZaQEAM1gN1Sa/erXTKq8UdiVT5cfxsHq9i
 CFSQ==
X-Gm-Message-State: AOAM532XylwWFtMMld57xSM1Tx0ZAqc4Y3bswVPc75+f/f86pf+R55dm
 aOVTuyNP7q33f/4LXc5Ujgs=
X-Google-Smtp-Source: ABdhPJzHbxcWgrsUxt3jCoFrHkDiV/PhurwVcFvaIIZXLxdiCSoHFpT/VAaQTPgjgct7v0/18fPXbQ==
X-Received: by 2002:a2e:b892:: with SMTP id r18mr1720077ljp.319.1592318570363; 
 Tue, 16 Jun 2020 07:42:50 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id z15sm4451503ljo.102.2020.06.16.07.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 07:42:49 -0700 (PDT)
Subject: Re: [PATCH v7 2/6] drm/of: Make drm_of_find_panel_or_bridge() to
 check graph's presence
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200614172234.8856-1-digetx@gmail.com>
 <20200614172234.8856-3-digetx@gmail.com>
 <20200616012652.GG1629@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4f0bb2e8-3522-4a3e-4ebd-32f9d5bc2da5@gmail.com>
Date: Tue, 16 Jun 2020 17:42:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616012652.GG1629@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDYuMjAyMCAwNDoyNiwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IEhpIERtaXRy
eSwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiBTdW4sIEp1biAxNCwgMjAy
MCBhdCAwODoyMjozMFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFdoZW4gZ3Jh
cGggaXNuJ3QgZGVmaW5lZCBpbiBhIGRldmljZS10cmVlLCB0aGUgb2ZfZ3JhcGhfZ2V0X3JlbW90
ZV9ub2RlKCkKPj4gcHJpbnRzIGEgbm9pc3kgZXJyb3IgbWVzc2FnZSwgdGVsbGluZyB0aGF0IHBv
cnQgbm9kZSBpcyBub3QgZm91bmQuIFRoaXMgaXMKPj4gdW5kZXNpcmFibGUgYmVoYXZpb3VyIGlu
IG91ciBjYXNlIGJlY2F1c2UgYWJzZW5jZSBvZiBhIHBhbmVsL2JyaWRnZSBncmFwaAo+PiBpcyBh
IHZhbGlkIGNhc2UuIExldCdzIGNoZWNrIHByZXNlbmNlIG9mIHRoZSBsb2NhbCBwb3J0IGluIGEg
ZGV2aWNlLXRyZWUKPj4gYmVmb3JlIHByb2NlZWRpbmcgd2l0aCBwYXJzaW5nIHRoZSBncmFwaC4K
Pj4KPj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4gU2ln
bmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYyB8IDEzICsrKysrKysrKysrKy0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMKPj4g
aW5kZXggYjUwYjQ0ZTc2Mjc5Li5lMDY1MmMzOGYzNTcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fb2YuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMKPj4gQEAg
LTIzOSwxMyArMjM5LDI0IEBAIGludCBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoY29uc3Qg
c3RydWN0IGRldmljZV9ub2RlICpucCwKPj4gIAkJCQlzdHJ1Y3QgZHJtX2JyaWRnZSAqKmJyaWRn
ZSkKPj4gIHsKPj4gIAlpbnQgcmV0ID0gLUVQUk9CRV9ERUZFUjsKPj4gLQlzdHJ1Y3QgZGV2aWNl
X25vZGUgKnJlbW90ZTsKPj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKmxvY2FsLCAqcmVtb3RlOwo+
PiAgCj4+ICAJaWYgKCFwYW5lbCAmJiAhYnJpZGdlKQo+PiAgCQlyZXR1cm4gLUVJTlZBTDsKPj4g
IAlpZiAocGFuZWwpCj4+ICAJCSpwYW5lbCA9IE5VTEw7Cj4+ICAKPj4gKwkvKgo+PiArCSAqIG9m
X2dyYXBoX2dldF9yZW1vdGVfbm9kZSgpIHByb2R1Y2VzIGEgbm9pc3kgZXJyb3IgbWVzc2FnZSBp
ZiBwb3J0Cj4+ICsJICogbm9kZSBpc24ndCBmb3VuZCBhbmQgdGhlIGFic2VuY2Ugb2YgdGhlIHBv
cnQgaXMgYSBsZWdpdCBjYXNlIGhlcmUsCj4+ICsJICogc28gYXQgZmlyc3Qgd2Ugc2lsZW50bHkg
Y2hlY2sgcHJlc2VuY2Ugb2YgdGhlIGxvY2FsIHBvcnQuCj4+ICsJICovCj4+ICsJbG9jYWwgPSBv
Zl9ncmFwaF9nZXRfbG9jYWxfcG9ydChucCk7Cj4+ICsJaWYgKCFsb2NhbCkKPj4gKwkJcmV0dXJu
IC1FTk9ERVY7Cj4+ICsKPj4gKwlvZl9ub2RlX3B1dChsb2NhbCk7Cj4+ICsKPiAKPiBUaGUgY29k
ZSBsb29rcyBmaW5lLCBidXQgeW91IG1heSB3YW50IHRvIHRha2UgaW50byBhY2NvdW50IG15IHBy
b3Bvc2FsCj4gaW4gMS83IHRvIGluc3RlYWQgY3JlYXRlIGEgb2ZfZ3JhcGhfaGFzX3BvcnQoKSBm
dW5jdGlvbi4gVGhlIGNvdWxkIHdvdWxkCj4gYmUgc2ltcGxlciBoZXJlLgo+IAo+PiAgCXJlbW90
ZSA9IG9mX2dyYXBoX2dldF9yZW1vdGVfbm9kZShucCwgcG9ydCwgZW5kcG9pbnQpOwo+PiAgCWlm
ICghcmVtb3RlKQo+PiAgCQlyZXR1cm4gLUVOT0RFVjsKPiAKCkkgbGlrZSB5b3VycyBwcm9wb3Nh
bHMgYW5kIHdpbGwgcHJlcGFyZSB2OCBiYXNlZCBvbiB0aGVtLCB0aGFua3MhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
