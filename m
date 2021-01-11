Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41732F0F56
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 10:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F856E086;
	Mon, 11 Jan 2021 09:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD85289E9E;
 Mon, 11 Jan 2021 09:43:48 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b2so18116258edm.3;
 Mon, 11 Jan 2021 01:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=I/C6ZR3fOBBDG/Ok39V2MFyy3zdoju5WFnnOc5zO3TU=;
 b=fzOZkdDPEiCEdeTYQwrbNm8I40lsrrvi07YYHRWPxvzwVfv8sx0FtUn64FUo6im7JT
 o6cq28oemkOCpn+/BYEM7QauoPzJLNnAzKV+IKEpeTF6bD16pf5Qq5Y6wUeV/hSEi/Mb
 iP4LaVAu9AoDglJi4fHhSNGa7njj228g3bUWchCNt9ybwRMziJR0GtkiwsJjNaZFUteC
 QTX5e/cIssnel1QnNPs0LZmpIZCkWMj5zyfz8yuvFzCJRuqyYbSYloPXDsFchFiycXsq
 2IfOfK+62eS/B/JLc11DSDPhyeTmq9CjG6ubFBewcodU9d1qaBu6jLK77Huq9Dy2HLfp
 CcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=I/C6ZR3fOBBDG/Ok39V2MFyy3zdoju5WFnnOc5zO3TU=;
 b=iD1ANqYInzE06h95R3nTa1q4/FY2Cth/LlB9e6feFMYjfHiqmWq5gQgwtF4TMfGngZ
 A8/F0IlsHienD65bYKUnTmQvu36AayUM+F8PL/lhrTu/zGByUA01C9uNjHtmDn8kNZQg
 tIexvnYNm3VnVMtC3V7wVZHcsI4dQZAYRxUgpvkEtr94smkISG/3VWkrDpMSax0bSuVj
 jCoYKQ+m1Ntd0WtcBPey4pxCHcAMXayCJ7BLZZT2aa7UzKkLFk5Zj/UWzqPY4UJwwt16
 0zqe1fPdtr1t0TIbQTRz8EGDWJOC4o7QkcuIgwRD7KpMw5bBgAX5IakR7ZHC/Bd4gw0i
 gVDQ==
X-Gm-Message-State: AOAM530Pa0l+rDZ83imWjVMklHX9O4KutYlHG9ZliMkk29hE++NcIZbV
 +Zdd2Doo6Ze3Ap7CIDe2Jb8fFMVFGns=
X-Google-Smtp-Source: ABdhPJwnW/EWf2fsQFUlXc90qouH3woy4KVPKdv+x255K8Q1CwS+UU0R34QEbBmpXLJx8dTujdv91g==
X-Received: by 2002:aa7:c151:: with SMTP id r17mr13346905edp.106.1610358227346; 
 Mon, 11 Jan 2021 01:43:47 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h15sm7398758edz.95.2021.01.11.01.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 01:43:46 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: update radeon/amdgpu/amdkfd git trees
To: Alex Deucher <alexdeucher@gmail.com>,
 "Abramov, Slava" <Slava.Abramov@amd.com>
References: <20210105201548.1374211-1-alexander.deucher@amd.com>
 <CADnq5_OSJQEOOF3N5Z3uX1LY=p0xHJYAukPNj7kGn06teJG5Gw@mail.gmail.com>
 <MWHPR12MB162977B49AF804C7BF339C0BFEAE0@MWHPR12MB1629.namprd12.prod.outlook.com>
 <CADnq5_MZ7PK2b35W_Y3vGtNLR+q9T=doZJGj=cKKnQOejqo+ww@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fb8bb2ee-6ed9-1e86-de29-f8f224e8b2ad@gmail.com>
Date: Mon, 11 Jan 2021 10:43:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_MZ7PK2b35W_Y3vGtNLR+q9T=doZJGj=cKKnQOejqo+ww@mail.gmail.com>
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
Reply-To: christian.koenig@amd.com
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDEuMjEgdW0gMjI6MzMgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gT24gRnJpLCBKYW4g
OCwgMjAyMSBhdCAzOjUyIFBNIEFicmFtb3YsIFNsYXZhIDxTbGF2YS5BYnJhbW92QGFtZC5jb20+
IHdyb3RlOgo+PiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gSW50ZXJuYWwgRGlzdHJpYnV0aW9u
IE9ubHldCj4+Cj4+Cj4+IFdoeSBub3QganVzdCBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvYWdkNWYvbGludXggPwo+IEkgZ3Vlc3MgdGhhdCB3b3JrcyB0b28uCgpFaXRoZXIgd29ya3Mg
Zm9yIG1lLgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KCkNocmlzdGlhbi4KCj4KPiBBbGV4Cj4KPj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz4gb24gYmVoYWxmIG9mIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwu
Y29tPgo+PiBTZW50OiBGcmlkYXksIEphbnVhcnkgOCwgMjAyMSAyOjMwIFBNCj4+IFRvOiBhbWQt
Z2Z4IGxpc3QgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgTWFsaW5nIGxpc3QgLSBE
UkkgZGV2ZWxvcGVycyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IERhdmUgQWly
bGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+Cj4+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5j
b20+Cj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIE1BSU5UQUlORVJTOiB1cGRhdGUgcmFkZW9uL2Ft
ZGdwdS9hbWRrZmQgZ2l0IHRyZWVzCj4+Cj4+IE9uIFR1ZSwgSmFuIDUsIDIwMjEgYXQgMzoxNSBQ
TSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4+PiBGRE8gaXMg
b3V0IG9mIHNwYWNlLCBzbyBtb3ZlIHRvIGdpdGxhYi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4+IFBpbmc/ICBBbnkgb2Jq
ZWN0aW9ucz8KPj4KPj4gQWxleAo+Pgo+Pj4gLS0tCj4+PiAgIE1BSU5UQUlORVJTIHwgNCArKy0t
Cj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPj4+IGluZGV4IGVi
MTg0NTljMWQxNi4uZTI4NzdiZTZiMTBkIDEwMDY0NAo+Pj4gLS0tIGEvTUFJTlRBSU5FUlMKPj4+
ICsrKyBiL01BSU5UQUlORVJTCj4+PiBAQCAtOTA3LDcgKzkwNyw3IEBAIEFNRCBLRkQKPj4+ICAg
TTogICAgIEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+Pj4gICBMOiAg
ICAgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+ICAgUzogICAgIFN1cHBvcnRlZAo+
Pj4gLVQ6ICAgICBnaXQgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXgK
Pj4+ICtUOiAgICAgZ2l0IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGxhYi5mcmVlZGVza3RvcC5vcmclMkZhZ2Q1ZiUy
RmxpbnV4LmdpdCZhbXA7ZGF0YT0wNCU3QzAxJTdDc2xhdmEuYWJyYW1vdiU0MGFtZC5jb20lN0Ni
NGU4YWRjNTM5M2M0YjA1MmQ2OTA4ZDhiNDBiZDVkYiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgy
ZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0NTczMTA2Nzc0OTY4NDYlN0NVbmtub3duJTdDVFdGcGJH
WnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3
aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCZhbXA7c2RhdGE9eEs0T284anVOJTJGb0YxalZuTGNsUHR0
OU1LTHpSUTNHUGllcmNkSDlvZ0ZFJTNEJmFtcDtyZXNlcnZlZD0wCj4+PiAgIEY6ICAgICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkKi5bY2hdCj4+PiAgIEY6ICAgICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC8KPj4+ICAgRjogICAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvaW5jbHVkZS9jaWtfc3RydWN0cy5oCj4+PiBAQCAtMTQ1OTYsNyArMTQ1OTYsNyBAQCBNOiAg
ICAgIEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPj4+ICAgTTogICAg
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+ICAgTDogICAg
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+PiAgIFM6ICAgICBTdXBwb3J0ZWQKPj4+
IC1UOiAgICAgZ2l0IGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4Cj4+
PiArVDogICAgIGdpdCBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRsYWIuZnJlZWRlc2t0b3Aub3JnJTJGYWdkNWYlMkZs
aW51eC5naXQmYW1wO2RhdGE9MDQlN0MwMSU3Q3NsYXZhLmFicmFtb3YlNDBhbWQuY29tJTdDYjRl
OGFkYzUzOTNjNGIwNTJkNjkwOGQ4YjQwYmQ1ZGIlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5
OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDU3MzEwNjc3NTA2ODQyJTdDVW5rbm93biU3Q1RXRnBiR1pz
YjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lM
Q0pYVkNJNk1uMCUzRCU3QzMwMDAmYW1wO3NkYXRhPUFOZXolMkJMSGFlcmdENkxhZThhcmNKRHlp
YmFmNXlQZ1J5ckJmekJwZDN2WSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Pj4gICBGOiAgICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC8KPj4+ICAgRjogICAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vCj4+PiAg
IEY6ICAgICBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAo+Pj4gLS0KPj4+IDIuMjkuMgo+
Pj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4g
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1k
LWdmeCZhbXA7ZGF0YT0wNCU3QzAxJTdDc2xhdmEuYWJyYW1vdiU0MGFtZC5jb20lN0NiNGU4YWRj
NTM5M2M0YjA1MmQ2OTA4ZDhiNDBiZDVkYiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUx
ODNkJTdDMCU3QzAlN0M2Mzc0NTczMTA2Nzc1MDY4NDIlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4
ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhW
Q0k2TW4wJTNEJTdDMzAwMCZhbXA7c2RhdGE9Z3lpd1RTYVpmaUFRcElJJTJCSlVwcm01d0lOejVR
RVdkUVlubTA1V29EYkQwJTNEJmFtcDtyZXNlcnZlZD0wCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
