Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70F02DAFAF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 16:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8AB6E3AC;
	Tue, 15 Dec 2020 15:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9976E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608044773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n33BH0JIpwfiII+0rJOgiNcurtN16qylVgIcObIawoA=;
 b=Ix0QSeKsfpy4h7/nQvQwzfsEBQSBaKwauyG6EO+E9575Km/WsxJh9zBM79/WcYuCCxdPi1
 HkM0AUTzq/no5xOHlXBioX/hV0vNI5JRfeVLsMK6w497JDAjJBd0v9AhAvFDk+hwmRxJRC
 5FGykcGusH8fV6WFMeb3GoM5hNMWfYQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-0ohLAbaoMHSKEC6gl8S7sw-1; Tue, 15 Dec 2020 10:06:11 -0500
X-MC-Unique: 0ohLAbaoMHSKEC6gl8S7sw-1
Received: by mail-qv1-f70.google.com with SMTP id l7so14414440qvp.15
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 07:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=n33BH0JIpwfiII+0rJOgiNcurtN16qylVgIcObIawoA=;
 b=MVzhDM3nCOR3IkrTIQsEFwy9eMXOu9UNgZUrwOgrb7hzZ4Sa07g4qwG11hBg4FVmbt
 Ws2aevE4Wv3AkdCXD3WUpkPAoFUZjO7KmVHUBu5f2Rv6YAy6oqeQti7ecPHiRqVgSgfn
 hI1ui3x0sQcKtP35PGRC6kb3vEwe/Xey1u2LAx/MquX3pLMNASlRPeG8EvAjVd1hEZJI
 2tdn1WxFQY1KAzaPln4F1FrkNUSTmFr0f/+Zj7cJl54WYMc9Bd/0V1J3+2daoKuYkKr+
 YmjkBiZIn/XI9r40tcOjANDUAxPsEyhuTNvNX/jIgXf0UKfNQzdIfn/J2X0IUoAVVzlx
 MXLQ==
X-Gm-Message-State: AOAM530amobA9KOuMXzDqcbjjl9KOHpcuxmlg2CRM9+EGQGECL5scK9U
 AoTgTp14r8W6P5obXDSVilx4KRP+/a7A8yW3o864uoLKPcE06SHjTlp4KP+DqtSW8v/CTFcAapz
 KDt42shJpdH9BxCAW1Y5WoenmRgFf
X-Received: by 2002:ac8:7b38:: with SMTP id l24mr39525677qtu.136.1608044770767; 
 Tue, 15 Dec 2020 07:06:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFWLICLYxp/LajEPgP+Bc0xGN7GikJoY2NZ3c7YmeWN2ZadsxKAo+IZFmpbsdTfwGwLgskfw==
X-Received: by 2002:ac8:7b38:: with SMTP id l24mr39525658qtu.136.1608044770554; 
 Tue, 15 Dec 2020 07:06:10 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id a25sm13343088qtg.20.2020.12.15.07.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 07:06:09 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: remove h from printk format specifier
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 lee.jones@linaro.org, Felix.Kuehling@amd.com, nirmoy.das@amd.com,
 sonny.jiang@amd.com, xinhui.pan@amd.com, colin.king@canonical.com,
 James.Zhu@amd.com, leo.liu@amd.com, thong.thai@amd.com, vegopala@amd.com,
 boyuan.zhang@amd.com, Monk.Liu@amd.com, mh12gx2825@gmail.com
References: <20201215143835.1874487-1-trix@redhat.com>
 <e71eb9ef-d5f9-0829-670f-d5c2c644a493@amd.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <a741836e-7f33-dcbb-d2bd-603091b9a2ad@redhat.com>
Date: Tue, 15 Dec 2020 07:06:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e71eb9ef-d5f9-0829-670f-d5c2c644a493@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzE1LzIwIDY6NDcgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTUuMTIu
MjAgdW0gMTU6Mzggc2NocmllYiB0cml4QHJlZGhhdC5jb206Cj4+IEZyb206IFRvbSBSaXggPHRy
aXhAcmVkaGF0LmNvbT4KPj4KPj4gU2VlIERvY3VtZW50YXRpb24vY29yZS1hcGkvcHJpbnRrLWZv
cm1hdHMucnN0Lgo+PiBoIHNob3VsZCBubyBsb25nZXIgYmUgdXNlZCBpbiB0aGUgZm9ybWF0IHNw
ZWNpZmllciBmb3IgcHJpbnRrLgo+Cj4gSW4gZ2VuZXJhbCBsb29rcyB2YWxpZCB0byBtZSwgYnV0
IG15IHF1ZXN0aW9uIGlzIGhvdyBkb2VzIHRoYXQgd29yaz8KPgo+IEkgbWVhbiB3ZSBzcGVjaWZ5
IGggaGVyZSBiZWNhdXNlIGl0IGlzIGEgc2hvcnQgaW50LiBBcmUgaW50cyBhbHdheXMgMzJiaXQg
b24gdGhlIHN0YWNrPwoKVGhlIHR5cGUgb2YgdGhlIGFyZ3VtZW50IGlzIHByb21vdGVkIHRvIGlu
dC7CoCBUaGlzIHdhcyBkaXNjdXNzZWQgZWFybGllciBoZXJlCgpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sL2E2ODExNGFmYjEzNGI4NjMzOTA1ZjVhMjVhZTdjNGU2Nzk5Y2U4ZjEuY2FtZWxA
cGVyY2hlcy5jb20vCgpUb20KCj4KPiBUaGFua3MsCj4gQ2hyaXN0aWFuLgo+Cj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFRvbSBSaXggPHRyaXhAcmVkaGF0LmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYyB8IDQgKystLQo+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgfCAyICstCj4+IMKgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8IDQgKystLQo+PiDCoCAzIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV91dmQuYwo+PiBpbmRleCA3YzViNjBlNTM0ODIuLjhiOTg5NjcwZWQ2NiAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYwo+PiBAQCAtMjQw
LDcgKzI0MCw3IEBAIGludCBhbWRncHVfdXZkX3N3X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCB2ZXJzaW9uX21ham9yID0gKGxlMzJfdG9f
Y3B1KGhkci0+dWNvZGVfdmVyc2lvbikgPj4gMjQpICYgMHhmZjsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHZlcnNpb25fbWlub3IgPSAobGUzMl90b19jcHUoaGRyLT51Y29kZV92ZXJzaW9uKSA+PiA4
KSAmIDB4ZmY7Cj4+IC3CoMKgwqDCoMKgwqDCoCBEUk1fSU5GTygiRm91bmQgVVZEIGZpcm13YXJl
IFZlcnNpb246ICVodS4laHUgRmFtaWx5IElEOiAlaHVcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoCBE
Uk1fSU5GTygiRm91bmQgVVZEIGZpcm13YXJlIFZlcnNpb246ICV1LiV1IEZhbWlseSBJRDogJXVc
biIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZlcnNpb25fbWFqb3IsIHZlcnNpb25f
bWlub3IsIGZhbWlseV9pZCk7Cj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+PiBAQCAtMjY3
LDcgKzI2Nyw3IEBAIGludCBhbWRncHVfdXZkX3N3X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZWNfbWlub3IgPSAobGUzMl90b19jcHUoaGRy
LT51Y29kZV92ZXJzaW9uKSA+PiA4KSAmIDB4ZmY7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBlbmNf
bWlub3IgPSAobGUzMl90b19jcHUoaGRyLT51Y29kZV92ZXJzaW9uKSA+PiAyNCkgJiAweDNmOwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgZW5jX21ham9yID0gKGxlMzJfdG9fY3B1KGhkci0+dWNvZGVf
dmVyc2lvbikgPj4gMzApICYgMHgzOwo+PiAtwqDCoMKgwqDCoMKgwqAgRFJNX0lORk8oIkZvdW5k
IFVWRCBmaXJtd2FyZSBFTkM6ICVodS4laHUgREVDOiAuJWh1IEZhbWlseSBJRDogJWh1XG4iLAo+
PiArwqDCoMKgwqDCoMKgwqAgRFJNX0lORk8oIkZvdW5kIFVWRCBmaXJtd2FyZSBFTkM6ICV1LiV1
IERFQzogLiV1IEZhbWlseSBJRDogJXVcbiIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGVuY19tYWpvciwgZW5jX21pbm9yLCBkZWNfbWlub3IsIGZhbWlseV9pZCk7Cj4+IMKgIMKgwqDC
oMKgwqDCoMKgwqDCoCBhZGV2LT51dmQubWF4X2hhbmRsZXMgPSBBTURHUFVfTUFYX1VWRF9IQU5E
TEVTOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jCj4+IGluZGV4IDQ4
NjFmOGRkYzFiNS4uZWE2YTYyZjY3ZTM4IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdmNlLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZjZS5jCj4+IEBAIC0xNzksNyArMTc5LDcgQEAgaW50IGFtZGdwdV92Y2Vfc3df
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgbG9uZyBzaXplKQo+PiDC
oMKgwqDCoMKgIHZlcnNpb25fbWFqb3IgPSAodWNvZGVfdmVyc2lvbiA+PiAyMCkgJiAweGZmZjsK
Pj4gwqDCoMKgwqDCoCB2ZXJzaW9uX21pbm9yID0gKHVjb2RlX3ZlcnNpb24gPj4gOCkgJiAweGZm
ZjsKPj4gwqDCoMKgwqDCoCBiaW5hcnlfaWQgPSB1Y29kZV92ZXJzaW9uICYgMHhmZjsKPj4gLcKg
wqDCoCBEUk1fSU5GTygiRm91bmQgVkNFIGZpcm13YXJlIFZlcnNpb246ICVoaGQuJWhoZCBCaW5h
cnkgSUQ6ICVoaGRcbiIsCj4+ICvCoMKgwqAgRFJNX0lORk8oIkZvdW5kIFZDRSBmaXJtd2FyZSBW
ZXJzaW9uOiAlZC4lZCBCaW5hcnkgSUQ6ICVkXG4iLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdmVy
c2lvbl9tYWpvciwgdmVyc2lvbl9taW5vciwgYmluYXJ5X2lkKTsKPj4gwqDCoMKgwqDCoCBhZGV2
LT52Y2UuZndfdmVyc2lvbiA9ICgodmVyc2lvbl9tYWpvciA8PCAyNCkgfCAodmVyc2lvbl9taW5v
ciA8PCAxNikgfAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChiaW5hcnlf
aWQgPDwgOCkpOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Zjbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCj4+IGlu
ZGV4IDFlNzU2MTg2ZTNmOC4uOTliODJmM2MyNjE3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCj4+IEBAIC0xODEsNyArMTgxLDcgQEAgaW50IGFtZGdwdV92
Y25fc3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGVuY19tYWpvciA9IGZ3X2NoZWNrOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGVjX3ZlciA9
IChsZTMyX3RvX2NwdShoZHItPnVjb2RlX3ZlcnNpb24pID4+IDI0KSAmIDB4ZjsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHZlcCA9IChsZTMyX3RvX2NwdShoZHItPnVjb2RlX3ZlcnNpb24pID4+IDI4
KSAmIDB4ZjsKPj4gLcKgwqDCoMKgwqDCoMKgIERSTV9JTkZPKCJGb3VuZCBWQ04gZmlybXdhcmUg
VmVyc2lvbiBFTkM6ICVodS4laHUgREVDOiAlaHUgVkVQOiAlaHUgUmV2aXNpb246ICVodVxuIiwK
Pj4gK8KgwqDCoMKgwqDCoMKgIERSTV9JTkZPKCJGb3VuZCBWQ04gZmlybXdhcmUgVmVyc2lvbiBF
TkM6ICV1LiV1IERFQzogJXUgVkVQOiAldSBSZXZpc2lvbjogJXVcbiIsCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGVuY19tYWpvciwgZW5jX21pbm9yLCBkZWNfdmVyLCB2ZXAsIGZ3X3Jl
dik7Cj4+IMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVk
IGludCB2ZXJzaW9uX21ham9yLCB2ZXJzaW9uX21pbm9yLCBmYW1pbHlfaWQ7Cj4+IEBAIC0xODks
NyArMTg5LDcgQEAgaW50IGFtZGdwdV92Y25fc3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGZhbWlseV9pZCA9IGxlMzJfdG9fY3B1KGhkci0+
dWNvZGVfdmVyc2lvbikgJiAweGZmOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdmVyc2lvbl9tYWpv
ciA9IChsZTMyX3RvX2NwdShoZHItPnVjb2RlX3ZlcnNpb24pID4+IDI0KSAmIDB4ZmY7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCB2ZXJzaW9uX21pbm9yID0gKGxlMzJfdG9fY3B1KGhkci0+dWNvZGVf
dmVyc2lvbikgPj4gOCkgJiAweGZmOwo+PiAtwqDCoMKgwqDCoMKgwqAgRFJNX0lORk8oIkZvdW5k
IFZDTiBmaXJtd2FyZSBWZXJzaW9uOiAlaHUuJWh1IEZhbWlseSBJRDogJWh1XG4iLAo+PiArwqDC
oMKgwqDCoMKgwqAgRFJNX0lORk8oIkZvdW5kIFZDTiBmaXJtd2FyZSBWZXJzaW9uOiAldS4ldSBG
YW1pbHkgSUQ6ICV1XG4iLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2ZXJzaW9uX21h
am9yLCB2ZXJzaW9uX21pbm9yLCBmYW1pbHlfaWQpOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
