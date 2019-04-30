Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C051F5B0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 13:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D58891AD;
	Tue, 30 Apr 2019 11:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54912891AD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 11:32:57 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b67so2131188wmg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 04:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Zhe25rA+/mYo1iLYVKgZD3xBPryqXo4EDNInx/XjdAg=;
 b=n73C5Icd2qaDtIXJHe7qKPTjiwHy5jAe9a09NofhwXuyb71i+fJcTbhBUG33TG3/Vq
 3NUHAVdTp0lj4UnTz4k7K3iVZ8v4poMiSR9jKtn0IRrZmvRybRs8WfmestmO8FF1kb9F
 m5+efKnpA+EV3645ssT3I91Pj8ow7B5KM8ylHjjPmrX/jjH/iv5NPiJr26EkAmr0dNhh
 vWQ1y7UcoEL5hSOKYE1tru7qWHVVO31D5lkEhTuSDggx1yC+Wa4VqjK0PQVK/u6F4ogO
 o/Kz9iG5M2+uzItr4VeSFq9oLQYU9uX5B3kYi2eIHv0WLaMylDxc7POdQKF8eLJBm2hP
 jFXQ==
X-Gm-Message-State: APjAAAWlYud9W4BGNc1cg7oZltvD3GjuLfg2Yf1nZgFtOVHfUeNe6wcx
 qXDis4Y+w+GpCSSjnS/bCbrGyqD0
X-Google-Smtp-Source: APXvYqxz8Rl+IyZdKk7jKs6GP3MRp/AVeET+LLf04agJ4pMErU3MyWjmqJterK99bEdeFpdGSHxraA==
X-Received: by 2002:a1c:4102:: with SMTP id o2mr2646209wma.91.1556623976012;
 Tue, 30 Apr 2019 04:32:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id y70sm3664685wmc.8.2019.04.30.04.32.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 04:32:55 -0700 (PDT)
Subject: Re: [PATCH] amdgpu: Query uvd handles info
To: "Sahu, Satyajit" <Satyajit.Sahu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190430104904.23140-1-satyajit.sahu@amd.com>
 <ce0c18ac-0ca5-cbc3-1478-491cc93ddda5@gmail.com>
 <a3cfa926-0a85-373d-1d64-2167ede73412@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3d4ef984-0f81-f7fd-da28-0a1943252af4@gmail.com>
Date: Tue, 30 Apr 2019 13:32:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a3cfa926-0a85-373d-1d64-2167ede73412@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Zhe25rA+/mYo1iLYVKgZD3xBPryqXo4EDNInx/XjdAg=;
 b=FGWf1l6ieFpJXP5ocEARlhwg18gOdDnMU9BNEdm0fLj58ObeyXg8ndXbzaVXFpNejg
 qRb0QEHb8Zn/Esg5h6dnSH/UvNztJ45k40F1uZUvkQ4E9fhA90td9tSwlJxQRUrHcxRt
 xCIamGOIpidC/V160NVal/CLudrhqrqlE09jWo+fGvoGraRYKk43PalOJHGJnpSbA3qn
 PMTQdwNzpV+bDfE5zrBQ4U8m52QLXSXY8MjGDEzdqFDlhPgxfkCyHCM5kgTGUDuoEXe8
 q5ZMBYWXNyXrjSk0rdAl8Mjsn+/9pY51dSg+idOi2180ITK02VBKVE4j5oEzO71H/TwZ
 o33g==
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
Reply-To: christian.koenig@amd.com
Cc: "Sharma, Deepak" <Deepak.Sharma@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMTkgdW0gMTM6MTIgc2NocmllYiBTYWh1LCBTYXR5YWppdDoKPiBPbiA0LzMwLzIw
MTkgNDoyOSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gW0NBVVRJT046IEV4dGVybmFs
IEVtYWlsXQo+Pgo+PiBBbSAzMC4wNC4xOSB1bSAxMjo1MSBzY2hyaWViIFNhaHUsIFNhdHlhaml0
Ogo+Pj4gUXVlcnkgdGhlIG1heCB1dmQgaGFuZGxlcyBhbmQgdXNlZCB1dmQgaGFuZGxlcy4KPj4g
TkFLLCBwbGVhc2UgdXNlIHRoZSBnZW5lcmljIGFtZGdwdV9xdWVyeV9pbmZvKCkgZnVuY3Rpb24g
Zm9yIHRoaXMuCj4+Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4KPiBDdXJyZW50bHkgYW1kZ3B1
X3F1ZXJ5X2luZm8gZG9lcyBub3QgcHJvdmlkZSBhbiBvcHRpb24gdG8gc3BlY2lmeSB0aGUKPiBo
d19pcF90eXBlLiBGb3IgQU1ER1BVX0lORk9fTlVNX0hBTkRMRVMgdGhlIGh3X2lwX3R5cGUgbmVl
ZHMgdG8gYmUKPiBBTURHUFVfSFdfSVBfVVZELCBvdGhlcndpc2UgdGhlIGtlcm5lbCByZXR1cm5z
IGVycm9yLgoKT2ssIHRoYXQgbWFrZXMgc2Vuc2UuCgpCdXQgcGxlYXNlIHN0aWxsIGFkZCBhIGdl
bmVyaWMgcXVlcnkgZnVuY3Rpb24gd2hpY2ggdGFrZXMgcXVlcnkgYW5kIApod19pcF90eXBlIGlu
c3RlYWQgb2YgaGFyZCBjb2RpbmcgdGhvc2UgdmFsdWVzLgoKQlRXOiBXaGF0IGRvIHlvdSBuZWVk
IHRoaXMgZm9yPyBUaGUgbnVtYmVyIHJldHVybmVkIGlzIHByZXR0eSB1c2VsZXNzIG9uIApuZXdl
ciBoYXJkd2FyZS4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBSZWdhcmRzLAo+Cj4gU2F0eWFq
aXQKPgo+Pj4gU2lnbmVkLW9mZi1ieTogU2F0eWFqaXQgU2FodSA8c2F0eWFqaXQuc2FodUBhbWQu
Y29tPgo+Pj4gLS0tCj4+PiAgwqAgYW1kZ3B1L2FtZGdwdS5owqDCoMKgwqDCoMKgwqDCoMKgIHwg
MTQgKysrKysrKysrKysrKysKPj4+ICDCoCBhbWRncHUvYW1kZ3B1X2dwdV9pbmZvLmMgfCAxNSAr
KysrKysrKysrKysrKysKPj4+ICDCoCAyIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykK
Pj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYW1kZ3B1L2FtZGdwdS5oIGIvYW1kZ3B1L2FtZGdwdS5oCj4+
PiBpbmRleCBjNDRhNDk1YS4uNDA3YjVmYWUgMTAwNjQ0Cj4+PiAtLS0gYS9hbWRncHUvYW1kZ3B1
LmgKPj4+ICsrKyBiL2FtZGdwdS9hbWRncHUuaAo+Pj4gQEAgLTExNzQsNiArMTE3NCwyMCBAQCBp
bnQgYW1kZ3B1X3F1ZXJ5X2dwdV9pbmZvKGFtZGdwdV9kZXZpY2VfaGFuZGxlCj4+PiBkZXYsCj4+
PiAgwqAgaW50IGFtZGdwdV9xdWVyeV9pbmZvKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwgdW5z
aWduZWQgaW5mb19pZCwKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1bnNpZ25lZCBzaXplLCB2b2lkICp2YWx1ZSk7Cj4+Pgo+Pj4gKy8qKgo+Pj4gKyAqIFF1ZXJ5
IHV2ZCBoYW5kbGVzIGluZm8uCj4+PiArICoKPj4+ICsgKgo+Pj4gKyAqIFxwYXJhbcKgwqAgZGV2
wqDCoMKgwqAgLSBcYyBbaW5dIERldmljZSBoYW5kbGUuIFNlZQo+Pj4gI2FtZGdwdV9kZXZpY2Vf
aW5pdGlhbGl6ZSgpCj4+PiArICogXHBhcmFtwqDCoCBzaXplwqDCoMKgIC0gXGMgW2luXSBTaXpl
IG9mIHRoZSByZXR1cm5lZCB2YWx1ZS4KPj4+ICsgKiBccGFyYW3CoMKgIHZhbHVlwqDCoCAtIFxj
IFtvdXRdIFBvaW50ZXIgdG8gdGhlIHJldHVybiB2YWx1ZS4KPj4+ICsgKgo+Pj4gKyAqIFxyZXR1
cm7CoMKgIDAgb24gc3VjY2Vzc1xuCj4+PiArICrCoMKgwqDCoMKgwqDCoMKgwqAgPDAgLSBOZWdh
dGl2ZSBQT1NJWCBlcnJvciBjb2RlCj4+PiArICoKPj4+ICsqLwo+Pj4gK2ludCBhbWRncHVfcXVl
cnlfdXZkX2hhbmRsZXMoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LAo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBzaXplLCB2b2lkICp2YWx1
ZSk7Cj4+PiAgwqAgLyoqCj4+PiAgwqDCoCAqIFF1ZXJ5IGhhcmR3YXJlIG9yIGRyaXZlciBpbmZv
cm1hdGlvbi4KPj4+ICDCoMKgICoKPj4+IGRpZmYgLS1naXQgYS9hbWRncHUvYW1kZ3B1X2dwdV9p
bmZvLmMgYi9hbWRncHUvYW1kZ3B1X2dwdV9pbmZvLmMKPj4+IGluZGV4IDc3NzA4N2YyLi4yNTNj
NGRhNyAxMDA2NDQKPj4+IC0tLSBhL2FtZGdwdS9hbWRncHVfZ3B1X2luZm8uYwo+Pj4gKysrIGIv
YW1kZ3B1L2FtZGdwdV9ncHVfaW5mby5jCj4+PiBAQCAtNDQsNiArNDQsMjEgQEAgZHJtX3B1Ymxp
YyBpbnQKPj4+IGFtZGdwdV9xdWVyeV9pbmZvKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwgdW5z
aWduZWQgaW5mb19pZCwKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2Yoc3RydWN0IGRybV9hbWRncHVfaW5mbykpOwo+Pj4g
IMKgIH0KPj4+Cj4+PiArZHJtX3B1YmxpYyBpbnQgYW1kZ3B1X3F1ZXJ5X3V2ZF9oYW5kbGVzKGFt
ZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgc2l6ZSwgdm9pZCAqdmFsdWUpCj4+PiArewo+Pj4gK8KgwqDCoMKgIHN0cnVjdCBkcm1fYW1k
Z3B1X2luZm8gcmVxdWVzdDsKPj4+ICsKPj4+ICvCoMKgwqDCoCBtZW1zZXQoJnJlcXVlc3QsIDAs
IHNpemVvZihyZXF1ZXN0KSk7Cj4+PiArwqDCoMKgwqAgcmVxdWVzdC5yZXR1cm5fcG9pbnRlciA9
ICh1aW50cHRyX3QpdmFsdWU7Cj4+PiArwqDCoMKgwqAgcmVxdWVzdC5yZXR1cm5fc2l6ZSA9IHNp
emU7Cj4+PiArwqDCoMKgwqAgcmVxdWVzdC5xdWVyeSA9IEFNREdQVV9JTkZPX05VTV9IQU5ETEVT
Owo+Pj4gK8KgwqDCoMKgIHJlcXVlc3QucXVlcnlfaHdfaXAudHlwZSA9IEFNREdQVV9IV19JUF9V
VkQ7Cj4+PiArCj4+PiArwqDCoMKgwqAgcmV0dXJuIGRybUNvbW1hbmRXcml0ZShkZXYtPmZkLCBE
Uk1fQU1ER1BVX0lORk8sICZyZXF1ZXN0LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2Yoc3RydWN0IGRybV9hbWRncHVfaW5m
bykpOwo+Pj4gK30KPj4+ICsKPj4+ICDCoCBkcm1fcHVibGljIGludCBhbWRncHVfcXVlcnlfY3J0
Y19mcm9tX2lkKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKPj4+IHVuc2lnbmVkIGlkLAo+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50MzJfdCAqcmVzdWx0KQo+Pj4gIMKgIHsKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
