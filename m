Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F9829CECE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397906EC65;
	Wed, 28 Oct 2020 08:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD0E6EC18
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:06:26 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 126so3727879lfi.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uRlQdiPyqIVACGreVVac0hKZ/L2Mx9OoeKVoaCDbckg=;
 b=fT1sI8aRh8els2lSjB9NG56qsDXOHqjgvZG7jl84B70XsY250lA/ZZPDcJ26Bvvhmm
 D5v5gI4oPi5F64q3s4D2cKexvgU65i0WJDQfMTZGkf3vpLECRzjUAVKauIjYb2jK5s4n
 bLBTmTXdjirfJkg/ZjIFCDrIPxfnvnWZpTvRpnZTf3iEQrF2sA7PdTArfG/wssbYfOpw
 ubpA+QMgHnjSfXpfjDgMmQ50uSxfE53dIROzDWsvXeUBRW4rrTy6jkz2JMYTANeDnCP8
 qIPUvENvvF+2e1uOyJZLaxlOM0Wx+IlQWCFc/wmm45Fsn7h9szRbJUnrpD1WsyF44OjK
 zl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uRlQdiPyqIVACGreVVac0hKZ/L2Mx9OoeKVoaCDbckg=;
 b=QWsDxCaeSUN9BgKn+OohxYtj2ds1qGShezHBDTsvH9RnjO4EID85esIPvj0ZHEcl9Q
 J2qMlvJWmO6fG5dRnoXIRAjaEytFoLTvHVamp/MVgXTavLxScjjv4R/FKphZ90iUr3Q1
 X0HedUxIH4SpKFGkQ5dMV6ohr9NA5+V3z+LkL5ckAGiCghbJnXHM3s2txtx/8l6ccjKB
 IAkxe5j0VYWpBxg/3F6pMKmEuDsc3qfIFcB1fAZ7fEaLl1Ft3ExoUp6n4rshqOHKY7xj
 vaPONGLKO4UFBGLdmImv6qb5IFIJ6aJF0WqF4yLPkaP9wkBZnccOn3voYTt3VcgrTbyC
 t0fw==
X-Gm-Message-State: AOAM532fIT5e5LpUcUUyJ07rgsjyQgUQNf7+j0Csmk8u9EDLKicz9k8l
 wrtF9EUMzHclmJJZZYufIEg=
X-Google-Smtp-Source: ABdhPJz0gCcf3UTaYDzzfTa9qKTX+r+Wgg+YztUN4gkGYgxnE2DHSDGASimrfrCREtxkJ0y8oOCpzg==
X-Received: by 2002:a05:6512:3691:: with SMTP id
 d17mr1275642lfs.243.1603825585246; 
 Tue, 27 Oct 2020 12:06:25 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id a17sm283239ljp.129.2020.10.27.12.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 12:06:24 -0700 (PDT)
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
 <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
 <48f5bbac-3955-c227-dbe1-d987b4ec5bd0@gmail.com>
 <414b4943-265d-3735-c115-d54469018d8c@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e8afd710-de37-f1c5-f61c-ed97c07370bf@gmail.com>
Date: Tue, 27 Oct 2020 22:06:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <414b4943-265d-3735-c115-d54469018d8c@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjYuMTAuMjAyMCAxMjoxMSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+Cj4+IFRoZSBm
aXJzdCBwYXRjaGVzIHNob3VsZCBiZSB0aGUgb25lcyB0aGF0IGFyZSByZWxldmFudCB0byB0aGUg
ZXhpc3RpbmcKPj4gdXNlcnNwYWNlIGNvZGUsIGxpa2Ugc3VwcG9ydCBmb3IgdGhlIHdhaXRzLgo+
IAo+IENhbiB5b3UgZWxhYm9yYXRlIHdoYXQgeW91IG1lYW4gYnkgdGhpcz8KCkFsbCBmZWF0dXJl
cyB0aGF0IGRvbid0IGhhdmUgYW4gaW1tZWRpYXRlIHJlYWwgdXNlLWNhc2Ugc2hvdWxkIGJlIHBs
YWNlZApsYXRlciBpbiB0aGUgc2VyaWVzIGJlY2F1c2Ugd2UgbWF5IGRlZmVyIG1lcmdpbmcgb2Yg
dGhvc2UgcGF0Y2hlcyB1bnRpbAp3ZSB3aWxsIHNlZSB1c2Vyc3BhY2UgdGhhdCB1c2VzIHRob3Nl
IGZlYXR1cmVzIHNpbmNlIHdlIGNhbid0IHJlYWxseQpkZWNpZGUgd2hldGhlciB0aGVzZSBhcmUg
ZGVjaXNpb25zIHRoYXQgd2Ugd29uJ3QgcmVncmV0IGxhdGVyIG9uLCBvbmx5CnByYWN0aWNhbCBh
cHBsaWNhdGlvbiBjYW4gY29uZmlybSB0aGUgY29ycmVjdG5lc3MuCgo+PiBQYXJ0aWFsIG1hcHBp
bmdzIHNob3VsZCBiZSBhIHNlcGFyYXRlIGZlYXR1cmUgYmVjYXVzZSBpdCdzIGEKPj4gcXVlc3Rp
b25hYmxlIGZlYXR1cmUgdGhhdCBuZWVkcyB0byBiZSBwcm92ZWQgYnkgYSByZWFsIHVzZXJzcGFj
ZSBmaXJzdC4KPj4gTWF5YmUgaXQgd291bGQgYmUgZXZlbiBiZXR0ZXIgdG8gZHJvcCBpdCBmb3Ig
dGhlIHN0YXJ0ZXIsIHRvIGVhc2UKPj4gcmV2aWV3aW5nLgo+IAo+IENvbnNpZGVyaW5nIHRoYXQg
dGhlICJuby1vcCIgc3VwcG9ydCBmb3IgaXQgKG1hcCB0aGUgd2hvbGUgYnVmZmVyIGJ1dAo+IGp1
c3Qga2VlcCB0cmFjayBvZiB0aGUgc3RhcnRpbmcgb2Zmc2V0KSBpcyBvbmx5IGEgY291cGxlIG9m
IGxpbmVzLCBJJ2QKPiBsaWtlIHRvIGtlZXAgaXQgaW4uCgpUaGVyZSBpcyBubyB0cmFja2luZyBp
biB0aGUgY3VycmVudCBjb2RlIHdoaWNoIHByZXZlbnRzIHRoZSBkdXBsaWNhdGVkCm1hcHBpbmdz
LCB3aWxsIHdlIG5lZWQgdG8gY2FyZSBhYm91dCBpdD8gVGhpcyBhIGJpdCB0b28gcXVlc3Rpb25h
YmxlCmZlYXR1cmUgZm9yIG5vdywgSU1PLiBJJ2QgbGlrZSB0byBzZWUgaXQgYXMgYSBzZXBhcmF0
ZSBwYXRjaC4KCi4uLgo+PiBJJ2QgbGlrZSB0byBzZWUgdGhlIERSTV9TQ0hFRCBhbmQgc3luY29i
aiBzdXBwb3J0LiBJIGNhbiBoZWxwIHlvdSB3aXRoCj4+IGl0IGlmIGl0J3Mgb3V0IG9mIHlvdXJz
IHNjb3BlIGZvciBub3cuCj4+Cj4gCj4gSSBhbHJlYWR5IHdyb3RlIHNvbWUgY29kZSBmb3Igc3lu
Y29iaiBJIGNhbiBwcm9iYWJseSBwdWxsIGluLiBSZWdhcmRpbmcKPiBEUk1fU0NIRUQsIGhlbHAg
aXMgYWNjZXB0ZWQuIEhvd2V2ZXIsIHdlIHNob3VsZCBrZWVwIHVzaW5nIHRoZSBoYXJkd2FyZQo+
IHNjaGVkdWxlciwgYW5kIGNvbnNpZGVyaW5nIGl0J3MgYSBiaWdnZXIgcGllY2Ugb2Ygd29yaywg
bGV0J3Mgbm90IGJsb2NrCj4gdGhpcyBzZXJpZXMgb24gaXQuCgpJJ2QgbGlrZSB0byBzZWUgYWxs
IHRoZSBjdXN0b20gSU9DVExzIHRvIGJlIGRlcHJlY2F0ZWQgYW5kIHJlcGxhY2VkIHdpdGgKdGhl
IGdlbmVyaWMgRFJNIEFQSSB3aGVyZXZlciBwb3NzaWJsZS4gSGVuY2UsIEkgdGhpbmsgaXQgc2hv
dWxkIGJlIGEKbWFuZGF0b3J5IGZlYXR1cmVzIHRoYXQgd2UgbmVlZCB0byBmb2N1cyBvbi4gVGhl
IGN1cnJlbnQgV0lQIHVzZXJzcGFjZQphbHJlYWR5IHVzZXMgYW5kIHJlbGllcyBvbiBEUk1fU0NI
RUQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
