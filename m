Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5512732E340
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 08:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C7A6EB0A;
	Fri,  5 Mar 2021 07:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7436EB09;
 Fri,  5 Mar 2021 07:56:42 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id e19so1657548ejt.3;
 Thu, 04 Mar 2021 23:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=UvZKJAhEYZDSOh+YQjmelWPAgRKRYYnv5wTPYE9mJkM=;
 b=jZFaTOIfx1y4vjy/v8tdTvqV5eKQXJTDMJGiTmvjy3f5P3BnE5c3r4nYaUIKqjTGyi
 0esKj0ZOMfW4qwkoBswnRun4CepREYO/ZyYxM+i4KXNgnIYDSFP6RnSTvOruYFrMXurt
 P/N57m23xkDu/AyW4wqZZghVLSabteRQ/kxoaY/OrhxDoBDb7zQOlbtZtiKZA3KhcyJf
 SmRgoF0GFuNsvHzZVwijZDxpnrVlqpgRi2LA+/4N8nasJV9483Qw5ZVM80k+3uCDLNTq
 ygUjZHR2UAqfnGuU05xt/ptpM5xBlGWelkdUXt0HES2wXhfChAbxI/iuhuiZD6gm+f6k
 Lt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UvZKJAhEYZDSOh+YQjmelWPAgRKRYYnv5wTPYE9mJkM=;
 b=d1jLSO9Lj5mLKsN0ByGooUBWeWAHXQrhl4SxrIdAcyNFKuzB1qWW8OPvZYQOd5cP+t
 rRqJzCn2iY+kvCY8vO7DmW/laJ1YCDKX2nbZqyGz+27m9KOpalDGgtYWeyfKnP5Sk6sj
 MN404InnjJKYhq/WLN62fJA5/rpdKtPuDvfbxO7K13bXIwF2SrzjzngTPWHw8QPzeBEH
 7oKlo0KLIEx+SiduhDqb9qXNXXzX24SPTcbDY7jh4Oq30nTU3UfKYWhHsTLGl+NGlckT
 wTezT2nIaDpbQ7utCj7QPgvVgwt7tt2hKFBHWkDX86JKcBj9ztuDP+HKCUapaik+qQOQ
 yDWQ==
X-Gm-Message-State: AOAM532vDMWfJMu1DxSyBp4DzbqogqrhSx2uIsPOiZmJaSOg1NcLwjlg
 J0TD9Cf3GG+UBRpvJ2n2quq4DjTvUgn7IQ==
X-Google-Smtp-Source: ABdhPJy3JuU0OC/t0Z9vtb3rH41uoj7pzLdZxhM4iIki3uy14HwH274tTe4vq6CFBfDOtBW0YeHq4g==
X-Received: by 2002:a17:907:78d9:: with SMTP id
 kv25mr1229314ejc.415.1614931000804; 
 Thu, 04 Mar 2021 23:56:40 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:9f0d:d59a:6448:4a90?
 ([2a02:908:1252:fb60:9f0d:d59a:6448:4a90])
 by smtp.gmail.com with ESMTPSA id t15sm1033621edw.84.2021.03.04.23.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 23:56:40 -0800 (PST)
Subject: Re: [PATCH 1/1] drm/ttm: Ignore signaled move fences
To: Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20210227034524.21763-1-Felix.Kuehling@amd.com>
 <c66e10a6-b5e1-b096-3c59-c107e1e12312@gmail.com>
 <482d3b8f-27dc-6815-b6f6-4987fe5ed21c@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <db49503a-236e-b4a1-e90d-da8ee21d11b4@gmail.com>
Date: Fri, 5 Mar 2021 08:56:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <482d3b8f-27dc-6815-b6f6-4987fe5ed21c@amd.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwNS4wMy4yMSB1bSAwMjoyMSBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+IEFtIDIwMjEt
MDMtMDEgdW0gMTA6MDkgYS5tLiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+IEFtIDI3LjAy
LjIxIHVtIDA0OjQ1IHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6Cj4+PiBNb3ZlIGZlbmNlcyB0aGF0
IGhhdmUgYWxyZWFkeSBzaWduYWxlZCBzaG91bGQgbm90IHByZXZlbnQgbWVtb3J5Cj4+PiBhbGxv
Y2F0aW9ucyB3aXRoIG5vX3dhaXRfZ3B1Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IEkgd29yayBvbiB0aGlzIG9uIEFs
ZXgncyByZWJhc2VkIGFtZC1zdGFnaW5nLWRybS1uZXh0LiBTaG91bGQgdGhpcyBnbwo+IGludG8g
YW55IG90aGVyIGJyYW5jaGVzPwoKSSBoYXZlIGEgYnJhbmNoIHdpdGggc3R1ZmYgZm9yIDUuMTMg
d2hpY2ggSSB3YW50IHRvIHB1c2ggdG8gCmRybS1taXNjLW5leHQgYXMgc29vbiBhcyA1LjEyLXJj
MSBpcyBvdXQuCgpHb2luZyB0byBhZGQgdGhpcyBvbmUgaGVyZSB0byB0aGF0IGNvbGxlY3Rpb24g
YXMgd2VsbCB1bmxlc3MgeW91IHNheSAKdGhhdCB0aGlzIGlzIHJlYWxseSBhIGJ1ZyBmaXggYW5k
IHdlIG5lZWQgaXQgZWFybGllci4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBUaGFua3MsCj4g
IMKgIEZlbGl4Cj4KPgo+Pj4gLS0tCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YyB8IDMgKystCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4gaW5kZXggM2ExMGJlYmI3NWQ2Li5k
ZTFlYzgzOGNmOGIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
Cj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+PiBAQCAtNzMwLDggKzcz
MCw5IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2FkZF9tb3ZlX2ZlbmNlKHN0cnVjdAo+Pj4gdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+ICDC
oCDCoMKgwqDCoMKgIGlmIChub193YWl0X2dwdSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9
IGRtYV9mZW5jZV9pc19zaWduYWxlZChmZW5jZSkgPyAwIDogLUVCVVNZOwo+Pj4gIMKgwqDCoMKg
wqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1
cm4gLUVCVVNZOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+PiAgwqDCoMKgwqDC
oCB9Cj4+PiAgwqAgwqDCoMKgwqDCoCBkbWFfcmVzdl9hZGRfc2hhcmVkX2ZlbmNlKGJvLT5iYXNl
LnJlc3YsIGZlbmNlKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
