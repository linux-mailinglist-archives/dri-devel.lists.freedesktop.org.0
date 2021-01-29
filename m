Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AB93094BF
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BB96EC98;
	Sat, 30 Jan 2021 11:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0692A6EB98
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 17:30:12 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id r14so11401100ljc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 09:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZDj5Zd17VeIJsrPXYNhev0hV+6mgMniB3E2FshOdbyc=;
 b=Wemd7WC7dfiHsTC195al2zRYGaaYcj0e6irZj7qVUVoCa9pn/kidMabOQ5pSwu8s1/
 1wfvVbVyqmkCXd0butDfPvZ5DTsm0Vt2XPRn5wap6AFHThgjQOYspDdORej5h0SDCq0Y
 Z4m2rH6TIXLnIkDSjU99Qzc7P/54FKLDqzIZ+T6SsnrZmKHmWoziQAQWcqtq8qTVsY+A
 YJvgzO+Zit9qWd3ybLTJ5WL6WrSgUp+91FHrep2lOyJno+0qVHPs8QpR7q9BFl+CCfm9
 Io+zuPmhnhkkEa1loNdRsiGqEwmJ5ms8rUwAc06DHFV9iuovxFyEX060UAi0+a7RnBXp
 gTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZDj5Zd17VeIJsrPXYNhev0hV+6mgMniB3E2FshOdbyc=;
 b=lg11V3ZHpW5c6JFHLlL57bEqgOrH13TYd5qJfGkrPFgUOn+ayU7CQdOWwCPRR8EDi9
 Ir93EeCwj+bzJmcnoBQtbTnAh5Dep4YJtdUC2uMayHMYWG87DZUuti2Xs3ItuCOrh5C2
 Fu0m1QiJTVW1N6uh4TKnGw62msKNKhI+Rpqw8Jq9zk+p8sRYkhrkkiQ/PqWDA9EBhyDB
 O/SwVkjicKjZCaOEXWX2rni3TM4gqhuEUx5B61uFzRPuMsovgygJmiJ+GC0T8jqIJX0D
 Ph05iCfv8yspoOcje5dx4GotrOXplJwwSRLjHoztRgkY3qggaNdwsx0dR1E+OSBeBKLk
 META==
X-Gm-Message-State: AOAM5337xOBHLqWkEtJ82tRE8Z/q3LZlPv7+sTXKuo18HepF0erI7Ic5
 9lp/75Om+ClyKIOovphbI0E=
X-Google-Smtp-Source: ABdhPJxx8aN8jAZEEFTgcJWKXPnTAMlks4CbTke3y3rQny5gMMUsrvv3Nur2CZYZ0Di8v/KNpCABcQ==
X-Received: by 2002:a2e:9b42:: with SMTP id o2mr2849606ljj.99.1611941409221;
 Fri, 29 Jan 2021 09:30:09 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id 71sm2077043lfd.202.2021.01.29.09.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 09:30:08 -0800 (PST)
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <cyndis@kapsi.fi>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
 <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi> <YBLtPv/1mGXwtibX@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1ff922b2-161d-c8b9-7b08-4454ff7329f8@gmail.com>
Date: Fri, 29 Jan 2021 20:30:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <YBLtPv/1mGXwtibX@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjguMDEuMjAyMSAxOTo1OCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBUaHUsIEph
biAyOCwgMjAyMSBhdCAwMTowODo1NFBNICswMjAwLCBNaWtrbyBQZXJ0dHVuZW4gd3JvdGU6Cj4+
IE9uIDEvMjcvMjEgMTE6MjAgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDI2LjAxLjIw
MjEgMDU6NDUsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4+PiAyLiBXZSB3aWxsIHBy
b2JhYmx5IG5lZWQgYSBkZWRpY2F0ZWQgZHJtX3RlZ3JhX3N1Ym1pdF9jbWQgZm9yIHN5bmMgcG9p
bnQKPj4+Pj4gaW5jcmVtZW50cy7CoCBUaGUgam9iJ3Mgc3luYyBwb2ludCB3aWxsIGJlIGFsbG9j
YXRlZCBkeW5hbWljYWxseSB3aGVuIGpvYgo+Pj4+PiBpcyBzdWJtaXR0ZWQuwqAgV2Ugd2lsbCBu
ZWVkIGEgZmFnIGZvciB0aGUgc3luY19pbmNyIGFuZCB3YWl0X3N5bmNwdAo+Pj4+PiBjb21tYW5k
cywgc2F5aW5nICJpdCdzIGEgam9iJ3Mgc3luYyBwb2ludCBpbmNyZW1lbnQvd2FpdCIKPj4+Pgo+
Pj4+IE5lZ2F0aXZlLiBMaWtlIEkgaGF2ZSBleHBsYWluZWQgaW4gcHJldmlvdXMgZGlzY3Vzc2lv
bnMsIHdpdGggdGhlCj4+Pj4gY3VycmVudCB3YXkgdGhlIHVzYWdlIG9mIGhhcmR3YXJlIHJlc291
cmNlcyBpcyBtdWNoIG1vcmUgZGV0ZXJtaW5pc3RpYwo+Pj4+IGFuZCBvYnZpb3VzLiBJIGRpc2Fn
cmVlIG9uIHRoZSBwb2ludCB0aGF0IHRoaXMgaXMgbXVjaCBtb3JlIGNvbXBsaWNhdGVkCj4+Pj4g
Zm9yIHRoZSB1c2Vyc3BhY2UuIFNlcGFyYXRpbmcgc3luY3BvaW50IGFuZCBjaGFubmVsIGFsbG9j
YXRpb24gaXMgb25lIG9mCj4+Pj4gdGhlIHByaW1hcnkgbW90aXZhdGlvbnMgb2YgdGhpcyBzZXJp
ZXMgZm9yIG1lLgo+Pj4KPj4+IFN5bmMgcG9pbnRzIGFyZSBhIGxpbWl0ZWQgcmVzb3VyY2UuIFRo
ZSBtb3N0IHNlbnNpYmxlIHdheSB0byB3b3JrIGFyb3VuZAo+Pj4gaXQgaXMgdG8ga2VlcCBzeW5j
IHBvaW50cyB3aXRoaW4ga2VybmVsIGFzIG11Y2ggYXMgcG9zc2libGUuIFRoaXMgaXMgbm90Cj4+
PiBvbmx5IG11Y2ggc2ltcGxlciBmb3IgdXNlciBzcGFjZSwgYnV0IGFsc28gYWxsb3dzIHRvIHV0
aWxpemUgRFJNIEFQSQo+Pj4gcHJvcGVybHkgd2l0aG91dCByZS1pbnZlbnRpbmcgd2hhdCBhbHJl
YWR5IGV4aXN0cyBhbmQgaXQncyBlYXNpZXIgdG8KPj4+IG1haW50YWluIGhhcmR3YXJlIGluIGEg
Z29vZCBzdGF0ZS4KPj4KPj4gSSd2ZSBzcGVudCB0aGUgbGFzdCBmZXcgeWVhcnMgZGVzaWduaW5n
IGZvciBhdXRvbW90aXZlIGFuZCBpbmR1c3RyaWFsCj4+IHByb2R1Y3RzLCB3aGVyZSB3ZSBkb24n
dCB3YW50IHRvIGF0IHJ1bnRpbWUgbm90aWNlIHRoYXQgdGhlIHN5c3RlbSBpcyBvdXQgb2YKPj4g
ZnJlZSBzeW5jcG9pbnRzIGFuZCBiZWNhdXNlIG9mIHRoYXQgd2UgY2FuIG9ubHkgcHJvY2VzcyB0
aGUgbmV4dCBjYW1lcmEKPj4gZnJhbWUgaW4gYSBzZWNvbmQgb3IgdHdvIGluc3RlYWQgb2YgMTYg
bWlsbGlzZWNvbmRzLiBXZSBuZWVkIHRvIGtub3cgdGhhdAo+PiBvbmNlIHdlIGhhdmUgYWxsb2Nh
dGVkIHRoZSByZXNvdXJjZSwgaXQgaXMgdGhlcmUuIFRoZSBuZXdlciBjaGlwcyBhcmUgYWxzbwo+
PiBkZXNpZ25lZCB0byBzdXBwb3J0IHRoaXMuCj4+Cj4+IENvbnNpZGVyaW5nIExpbnV4IGlzIGlu
Y3JlYXNpbmdseSBiZWluZyB1c2VkIGZvciBzdWNoIGFwcGxpY2F0aW9ucywgYW5kIHRoZXkKPj4g
YXJlIGltcG9ydGFudCB0YXJnZXQgbWFya2V0cyBmb3IgTlZJRElBLCB0aGVzZSBuZWVkIHRvIGJl
IHN1cHBvcnRlZC4KPj4KPj4gQmVjYXVzZSBvZiB0aGUgYWJvdmUgZGVzaWduIGNvbnN0cmFpbnQg
dGhlIHVzZXJzcGFjZSBzb2Z0d2FyZSB0aGF0IHJ1bnMgaW4KPj4gdGhlc2UgZW52aXJvbm1lbnRz
IGFsc28gZXhwZWN0cyByZXNvdXJjZXMgdG8gYmUgYWxsb2NhdGVkIHVwIGZyb250LiBUaGlzCj4+
IGlzbid0IGEgbWF0dGVyIG9mIGhhdmluZyB0byBkZXNpZ24gdGhhdCBzb2Z0d2FyZSBhY2NvcmRp
bmcgdG8gd2hhdCBraW5kIG9mCj4+IGFsbG9jYXRpb24gQVBJIHdlIGRlY2lkZSBkbyBhdCBMaW51
eCBsZXZlbCAtLSBpdCdzIG5vIHVzZSBkZXNpZ25pbmcgZm9yCj4+IGR5bmFtaWMgYWxsb2NhdGlv
biBpZiBpdCBsZWFkcyB0byB5b3Ugbm90IG1lZXRpbmcgdGhlIHNhZmV0eSByZXF1aXJlbWVudCBv
Zgo+PiBuZWVkaW5nIHRvIGVuc3VyZSB5b3UgaGF2ZSBhbGwgcmVzb3VyY2VzIGFsbG9jYXRlZCB1
cCBmcm9udC4KPj4KPj4gVGhpcyBpc24ndCBhIGdvb2QgZGVzaWduIGZlYXR1cmUganVzdCBpbiBh
IGNhciwgYnV0IGluIGFueXRoaW5nIHRoYXQgbmVlZHMKPj4gdG8gYmUgcmVsaWFibGUuIEhvd2V2
ZXIsIGl0IGRvZXMgcG9zZSBzb21lIHRyYWRlb2ZmcywgYW5kIGlmIHlvdSB0aGluayB0aGF0Cj4+
IHJ1bm5pbmcgb3V0IG9mIHN5bmNwb2ludHMgb24gVDIwLVQxMTQgYmVjYXVzZSBvZiB1cGZyb250
IGFsbG9jYXRpb24gaXMgYW4KPj4gYWN0dWFsIHByb2JsZW0sIEknbSBub3Qgb3Bwb3NlZCB0byBo
YXZpbmcgYm90aCBvcHRpb25zIGF2YWlsYWJsZS4KClRoZSB3b3JkICJyZWxpYWJsZSIgY29udHJh
ZGljdHMgdG8gdGhlIGVycm9yLXByb25lIGFwcHJvYWNoLiBPbiB0aGUKb3RoZXIgaGFuZCwgaXQg
c2hvdWxkIGJlIHZlcnkgZGlmZmljdWx0IHRvIGNoYW5nZSB0aGUgc3R1YmJvcm4KZG93bnN0cmVh
bSBmaXJtd2FyZSBhbmQgd2Ugd2FudCBkcml2ZXIgdG8gYmUgdXNhYmxlIGFzIG11Y2ggYXMgcG9z
c2libGUsCnNvIGluIHJlYWxpdHkgbm90IG11Y2ggY2FuIGJlIGRvbmUgYWJvdXQgaXQuCgo+IEkg
dGhpbmsgdGhhdCdzIGEgZmFpciBwb2ludC4gSSBkb24ndCBzZWUgd2h5IHdlIGNhbid0IHN1cHBv
cnQgYm90aAo+IGltcGxpY2l0IGFuZCBleHBsaWNpdCBzeW5jcG9pbnQgcmVxdWVzdHMuIElmIG1v
c3Qgb2YgdGhlIHVzZS1jYXNlcyBjYW4KPiB3b3JrIHdpdGggaW1wbGljaXQgc3luY3BvaW50cyBh
bmQgbGV0IHRoZSBrZXJuZWwgaGFuZGxlIGFsbCBhc3BlY3RzIG9mCj4gaXQsIHRoYXQncyBncmVh
dC4gQnV0IHRoZXJlJ3Mgbm8gcmVhc29uIHdlIGNhbid0IHByb3ZpZGUgbW9yZSBleHBsaWNpdAo+
IGNvbnRyb2xzIGZvciBjYXNlcyB3aGVyZSBpdCdzIHJlYWxseSBpbXBvcnRhbnQgdGhhdCBhbGwg
dGhlIHJlc291cmNlcwo+IGFyZSBhbGxvY2F0ZWQgdXBmcm9udC4KPiAKPiBVbHRpbWF0ZWx5IHRo
aXMgaXMgdmVyeSBzcGVjaWZpYyB0byBlYWNoIHVzZS1jYXNlLCBzbyBJIHRoaW5rIGhhdmluZwo+
IGJvdGggb3B0aW9ucyB3aWxsIHByb3ZpZGUgdXMgd2l0aCB0aGUgbW9zdCBmbGV4aWJpbGl0eS4K
SXQgc2hvdWxkIGJlIGZpbmUgdG8gc3VwcG9ydCBib3RoLiBUaGlzIHdpbGwgYWRkIGNvbXBsZXhp
dHkgdG8gdGhlCmRyaXZlciwgdGh1cyBpdCBuZWVkcyB0byBiZSBkb25lIHdpc2VseS4KCkknbGwg
bmVlZCBtb3JlIHRpbWUgdG8gdGhpbmsgYWJvdXQgaXQuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
