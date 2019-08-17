Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF6390F88
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 10:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7B66E221;
	Sat, 17 Aug 2019 08:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B884A6E221
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 08:40:56 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id s49so7099378edb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 01:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qRs++cUPWqE7h71iD/NyfIih5j7NXZt7bjbEdWqVzho=;
 b=lx7jvodZ/kh6d3zRGILfCEY/Q2OZp3d1YWh1I8AlaEKjGmlPu4J9DTG8FKxFStsO9Q
 ssFW0pj43AsOXi+2LV5KsX5E7LCCWQkE1Awr+JChlbY4jcDKWrR7et9vfzIHNAPflf+R
 pU9vm4uoRzhOdC8pS9OsotjnNb9tgFOv/u8adDUUEc2h4k5Ylx9i2ZoM5JBN5fxzeyMy
 xUAiuumbhssE92RBY1AXpZpdvRMDMnKnGQUXACzCsfjJAEgqOy9psEUXgah0zotXv8KG
 +76/ex5MI5meIIUD/JK4As1yM3pQjw0L4CGNw69erSGUC2WIh+vn1xx4ILNkWjAjAQ56
 JSmg==
X-Gm-Message-State: APjAAAVJhClBwYO5brZprXaDs4n6ujuVIPlrmMLsE+lkC1An7U4LNAwS
 xLtYm7QCp1zsNy0l3ufNi799uA==
X-Google-Smtp-Source: APXvYqyVeGWshlkAN3hcVFd4OniDjXvWk5lT+Wx1OL/j+MklrUymZoMYlJwTuyfs+e6TUmXM+MwbzQ==
X-Received: by 2002:a50:90c4:: with SMTP id d4mr15291715eda.107.1566031255204; 
 Sat, 17 Aug 2019 01:40:55 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id e24sm1136686ejb.53.2019.08.17.01.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Aug 2019 01:40:54 -0700 (PDT)
Subject: Re: [PATCH] efifb: BGRT: Improve efifb_bgrt_sanity_check
To: Peter Jones <pjones@redhat.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20190721131918.10115-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a94c96de-16a5-7b52-a964-f8974e867a65@redhat.com>
Date: Sat, 17 Aug 2019 10:40:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190721131918.10115-1-hdegoede@redhat.com>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyMS0wNy0xOSAxNToxOSwgSGFucyBkZSBHb2VkZSB3cm90ZToKPiBGb3IgdmFyaW91
cyByZWFzb25zLCBhdCBsZWFzdCB3aXRoIHg4NiBFRkkgZmlybXdhcmVzLCB0aGUgeG9mZnNldCBh
bmQKPiB5b2Zmc2V0IGluIHRoZSBCR1JUIGluZm8gYXJlIG5vdCBhbHdheXMgcmVsaWFibGUuCj4g
Cj4gRXh0ZW5zaXZlIHRlc3RpbmcgaGFzIHNob3duIHRoYXQgd2hlbiB0aGUgaW5mbyBpcyBjb3Jy
ZWN0LCB0aGUKPiBCR1JUIGltYWdlIGlzIGFsd2F5cyBleGFjdGx5IGNlbnRlcmVkIGhvcml6b250
YWxseSAodGhlIHlvZmZzZXQgdmFyaWFibGUKPiBpcyBtb3JlIHZhcmlhYmxlIGFuZCBub3QgYWx3
YXlzIHByZWRpY3RhYmxlKS4KPiAKPiBUaGlzIGNvbW1pdCBzaW1wbGlmaWVzIC8gaW1wcm92ZXMg
dGhlIGJncnRfc2FuaXR5X2NoZWNrIHRvIHNpbXBseQo+IGNoZWNrIHRoYXQgdGhlIEJHUlQgaW1h
Z2UgaXMgZXhhY3RseSBjZW50ZXJlZCBob3Jpem9udGFsbHkgYW5kIHNraXBzCj4gKHJlKWRyYXdp
bmcgaXQgd2hlbiBpdCBpcyBub3QuCj4gCj4gVGhpcyBmaXhlcyB0aGUgQkdSVCBpbWFnZSBzb21l
dGltZXMgYmVpbmcgZHJhd24gaW4gdGhlIHdyb25nIHBsYWNlLgo+IAo+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCj4gRml4ZXM6IDg4ZmU0Y2ViMjQ0NyAoImVmaWZiOiBCR1JUOiBEbyBub3Qg
Y29weSB0aGUgYm9vdCBncmFwaGljcyBmb3Igbm9uIG5hdGl2ZSByZXNvbHV0aW9ucyIpCj4gU2ln
bmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KCnBpbmc/IEkg
ZG8gbm90IHNlZSB0aGlzIG9uZSBpbiAtbmV4dCB5ZXQsIHdoYXQgaXMgdGhlIHN0YXR1cyBvZiB0
aGlzCnBhdGNoPwoKUmVnYXJkcywKCkhhbnMKCgoKCj4gLS0tCj4gICBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2VmaWZiLmMgfCAyNyArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZi
LmMKPiBpbmRleCBkZmE4ZGQ0N2QxOWQuLjViM2NlZjliZjc5NCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZi
LmMKPiBAQCAtMTIyLDI4ICsxMjIsMTMgQEAgc3RhdGljIHZvaWQgZWZpZmJfY29weV9ibXAodTgg
KnNyYywgdTMyICpkc3QsIGludCB3aWR0aCwgc3RydWN0IHNjcmVlbl9pbmZvICpzaSkKPiAgICAq
Lwo+ICAgc3RhdGljIGJvb2wgZWZpZmJfYmdydF9zYW5pdHlfY2hlY2soc3RydWN0IHNjcmVlbl9p
bmZvICpzaSwgdTMyIGJtcF93aWR0aCkKPiAgIHsKPiAtCXN0YXRpYyBjb25zdCBpbnQgZGVmYXVs
dF9yZXNvbHV0aW9uc1tdWzJdID0gewo+IC0JCXsgIDgwMCwgIDYwMCB9LAo+IC0JCXsgMTAyNCwg
IDc2OCB9LAo+IC0JCXsgMTI4MCwgMTAyNCB9LAo+IC0JfTsKPiAtCXUzMiBpLCByaWdodF9tYXJn
aW47Cj4gLQo+IC0JZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZGVmYXVsdF9yZXNvbHV0aW9u
cyk7IGkrKykgewo+IC0JCWlmIChkZWZhdWx0X3Jlc29sdXRpb25zW2ldWzBdID09IHNpLT5sZmJf
d2lkdGggJiYKPiAtCQkgICAgZGVmYXVsdF9yZXNvbHV0aW9uc1tpXVsxXSA9PSBzaS0+bGZiX2hl
aWdodCkKPiAtCQkJYnJlYWs7Cj4gLQl9Cj4gLQkvKiBJZiBub3QgYSBkZWZhdWx0IHJlc29sdXRp
b24gdXNlZCBmb3IgdGV4dG1vZGUsIHRoaXMgc2hvdWxkIGJlIGZpbmUgKi8KPiAtCWlmIChpID49
IEFSUkFZX1NJWkUoZGVmYXVsdF9yZXNvbHV0aW9ucykpCj4gLQkJcmV0dXJuIHRydWU7Cj4gLQo+
IC0JLyogSWYgdGhlIHJpZ2h0IG1hcmdpbiBpcyA1IHRpbWVzIHNtYWxsZXIgdGhlbiB0aGUgbGVm
dCBvbmUsIHJlamVjdCAqLwo+IC0JcmlnaHRfbWFyZ2luID0gc2ktPmxmYl93aWR0aCAtIChiZ3J0
X3RhYi5pbWFnZV9vZmZzZXRfeCArIGJtcF93aWR0aCk7Cj4gLQlpZiAocmlnaHRfbWFyZ2luIDwg
KGJncnRfdGFiLmltYWdlX29mZnNldF94IC8gNSkpCj4gLQkJcmV0dXJuIGZhbHNlOwo+ICsJLyoK
PiArCSAqIEFsbCB4ODYgZmlybXdhcmVzIGhvcml6b250YWxseSBjZW50ZXIgdGhlIGltYWdlICh0
aGUgeW9mZnNldAo+ICsJICogY2FsY3VsYXRpb25zIGRpZmZlciBiZXR3ZWVuIGJvYXJkcywgYnV0
IHhvZmZzZXQgaXMgcHJlZGljdGFibGUpLgo+ICsJICovCj4gKwl1MzIgZXhwZWN0ZWRfeG9mZnNl
dCA9IChzaS0+bGZiX3dpZHRoIC0gYm1wX3dpZHRoKSAvIDI7Cj4gICAKPiAtCXJldHVybiB0cnVl
Owo+ICsJcmV0dXJuIGJncnRfdGFiLmltYWdlX29mZnNldF94ID09IGV4cGVjdGVkX3hvZmZzZXQ7
Cj4gICB9Cj4gICAjZWxzZQo+ICAgc3RhdGljIGJvb2wgZWZpZmJfYmdydF9zYW5pdHlfY2hlY2so
c3RydWN0IHNjcmVlbl9pbmZvICpzaSwgdTMyIGJtcF93aWR0aCkKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
