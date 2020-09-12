Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D85268553
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2936E1E6;
	Mon, 14 Sep 2020 07:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2E96E042
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 21:51:04 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k25so15424435ljk.0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 14:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x7NtD2cqmVyAb0mvqEzYpWxVCY3t1I1LATgOhBQ2Smk=;
 b=SddZNpt6cKbqkDivdqi+qiv5AXVgdJ8qpaJns97YxglFowZBloOhrCiH74qgP+kUYb
 CBoW2wyg5TqQMwOlMrQtShVVmBhFV6Q/sURG8pfMrXthT/0965lGp4DvuRTuSOAcPyxa
 YPMVNtBLpZ15BCDjqLlEwZVc4M7MX+zGn6bKIUEIbYKsvbeNHODLE0FIy0LYLFJ783d2
 IkHpXWfktgscsQErCfbJMN+/rZSEG8kupUv5K48OvjgI0Ktl/tOTEtUDDonGB22gyaXY
 JfeJkdKJXDpQ3tlFn6huBuawB5WPwf/zlY3gSFAzS2FsWCM5EIuGxdXjDSF8TXuTagP2
 zi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x7NtD2cqmVyAb0mvqEzYpWxVCY3t1I1LATgOhBQ2Smk=;
 b=TzNw4JV9IJ9jk+o51gWPORrIvWnt0aQG7MQXA0mm7ITbkin+/B0noJWEsABvRWx3al
 s3xHvNfMxHcydZqnvtu76fPBwQrOq4UOpp/fm8acdBzo6xkINCqKsH9dSeD/47kNo5yg
 SyeQCXbfh2d9CV9wr+G8bcktDEXjOWGNLlkDtvYFc+vmRSWoLOZ648asl3W2pmCuZNuT
 VtkNTR4wibh2qXoNkv85XrcueVvCREjvGY6pL7q3qFDhSGvKLqCxpExKombaFStIUErS
 YaSxihOqRQfLfC+Bjd8NeXPyvoEvtTNw5RlS1RYnDy3Nhtlz9ojepgBK0T4irXjKuey/
 wMeA==
X-Gm-Message-State: AOAM532v458gBJdeazEBonmTDGxpOFsIBVABoYGKyiw0JqHmjvNwOma+
 V9Nuql05IYKsAm5jU3sUGFQ=
X-Google-Smtp-Source: ABdhPJw39OlgjMmz4lqL6T+rgdndiDsRzGiObFwyXkfYqPKxIRfleS1zXw3PNnFmnlobyxOIky7uMQ==
X-Received: by 2002:a2e:9b99:: with SMTP id z25mr3003635lji.403.1599947463050; 
 Sat, 12 Sep 2020 14:51:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id g30sm1816912lfj.74.2020.09.12.14.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2020 14:51:02 -0700 (PDT)
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
 <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
 <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
 <07f933b3-10d9-0318-e2f3-6dfd5b4903ac@gmail.com>
 <28f18a23-b588-004d-4945-91b7a593607a@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3f80aff2-23ce-9b1f-d242-e46e974fbeed@gmail.com>
Date: Sun, 13 Sep 2020 00:51:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <28f18a23-b588-004d-4945-91b7a593607a@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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

MTIuMDkuMjAyMCAxNjozMSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+PiBJJ20g
bm93IHRha2luZyBhIGNsb3NlciBsb29rIGF0IHRoaXMgcGF0Y2ggYW5kIGl0IHJhaXNlcyBzb21l
IG1vcmUKPj4gcXVlc3Rpb25zLCBsaWtlIGZvciBleGFtcGxlIGJ5IGxvb2tpbmcgYXQgdGhlICJP
biBqb2IgdGltZW91dCwgd2Ugc3RvcAo+PiB0aGUgY2hhbm5lbCwgTk9QIGFsbCBmdXR1cmUgam9i
cyBvbiB0aGUgY2hhbm5lbCB1c2luZyB0aGUgc2FtZSBzeW5jcG9pbnQKPj4gLi4uIiB0aHJvdWdo
IHRoZSBwcmlzbSBvZiBncmF0ZS1rZXJuZWwgZXhwZXJpZW5jZSwgSSdtIG5vdCBzdXJlIGhvdyBp
dAo+PiBjb3VsZCBjby1leGlzdCB3aXRoIHRoZSBkcm0tc2NoZWR1bGVyIGFuZCB3aHkgaXQncyBu
ZWVkZWQgYXQgYWxsLiBCdXQgSQo+PiB0aGluayB3ZSBuZWVkIGEgZmVhdHVyZS1jb21wbGV0ZSB2
ZXJzaW9uIChhdCBsZWFzdCBhIHJvdWdoIHZlcnNpb24pLCBzbwo+PiB0aGF0IHdlIGNvdWxkIHN0
YXJ0IHRoZSB0ZXN0aW5nLCBhbmQgdGhlbiBpdCBzaG91bGQgYmUgZWFzaWVyIHRvIHJldmlldwo+
PiBhbmQgZGlzY3VzcyBzdWNoIHRoaW5ncy4KPj4KPiAKPiBUaGUgcmVhc29uIHRoaXMgaXMgbmVl
ZGVkIGlzIHRoYXQgaWYgYSBqb2IgdGltZXMgb3V0IGFuZCB3ZSBkb24ndCBkbyBpdHMKPiBzeW5j
cG9pbnQgaW5jcmVtZW50cyBvbiB0aGUgQ1BVLCB0aGVuIGEgc3VjY2Vzc2l2ZSBqb2IgaW5jcmVt
ZW50aW5nIHRoYXQKPiBzYW1lIHN5bmNwb2ludCB3b3VsZCBjYXVzZSBmZW5jZXMgdG8gc2lnbmFs
IGluY29ycmVjdGx5LiBUaGUgam9iIHRoYXQKPiB3YXMgc3VwcG9zZWQgdG8gc2lnbmFsIHRob3Nl
IGZlbmNlcyBkaWRuJ3QgYWN0dWFsbHkgcnVuOyBhbmQgYW55IGRhdGEKPiB0aG9zZSBmZW5jZXMg
d2VyZSBwcm90ZWN0aW5nIHdvdWxkIHN0aWxsIGJlIGdhcmJhZ2UuCgpJJ2xsIG5lZWQgdG8gcmUt
cmVhZCB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbiBiZWNhdXNlIElJUkMsIEkgd2FzCnN1Z2dlc3Rp
bmcgdGhhdCBvbmNlIGpvYiBpcyBodW5nLCBhbGwgam9icyBzaG91bGQgYmUgcmVtb3ZlZCBmcm9t
CnF1ZXVlL1BCIGFuZCByZS1zdWJtaXR0ZWQsIHRoZW4gdGhlIHJlLXN1Ym1pdHRlZCBqb2JzIHdp
bGwgdXNlIHRoZQpuZXcvdXBkYXRlZCBzeW5jIHBvaW50IGJhc2UuCgpBbmQgd2UgcHJvYmFibHkg
c2hvdWxkIG5lZWQgYW5vdGhlciBkcm1fdGVncmFfc3VibWl0X2NtZCB0eXBlIHRoYXQgd2FpdHMK
Zm9yIGEgcmVsYXRpdmUgc3luYyBwb2ludCBpbmNyZW1lbnQuIFRoZQpkcm1fdGVncmFfc3VibWl0
X2NtZF93YWl0X3N5bmNwdCB1c2VzIGFic29sdXRlIHN5bmMgcG9pbnQgdmFsdWUgYW5kIGl0CnNo
b3VsZG4ndCBiZSB1c2VkIGZvciBzeW5jIHBvaW50IGluY3JlbWVudHMgdGhhdCBhcmUgaW50ZXJu
YWwgdG8gYSBqb2IKYmVjYXVzZSBpdCBjb21wbGljYXRlcyB0aGUgcmVjb3ZlcnkuCgpBbGwgd2Fp
dHMgdGhhdCBhcmUgaW50ZXJuYWwgdG8gYSBqb2Igc2hvdWxkIG9ubHkgd2FpdCBmb3IgcmVsYXRp
dmUgc3luYwpwb2ludCBpbmNyZW1lbnRzLgoKSW4gdGhlIGdyYXRlLWtlcm5lbCBldmVyeSBqb2Ig
dXNlcyB1bmlxdWUtYW5kLWNsZWFuIHN5bmMgcG9pbnQgKHdoaWNoIGlzCmFsc28gaW50ZXJuYWwg
dG8gdGhlIGtlcm5lbCBkcml2ZXIpIGFuZCBhIHJlbGF0aXZlIHdhaXQgWzFdIGlzIHVzZWQgZm9y
CnRoZSBqb2IncyBpbnRlcm5hbCBzeW5jIHBvaW50IGluY3JlbWVudHMgWzJdWzNdWzRdLCBhbmQg
dGh1cywga2VybmVsCmRyaXZlciBzaW1wbHkganVtcHMgb3ZlciBhIGh1bmcgam9iIGJ5IHVwZGF0
aW5nIERNQUdFVCB0byBwb2ludCBhdCB0aGUKc3RhcnQgb2YgYSBuZXh0IGpvYi4KClsxXQpodHRw
czovL2dpdGh1Yi5jb20vZ3JhdGUtZHJpdmVyL2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS91YXBpL3BhdGNoaW5nLmMjTDM2NwoKWzJdCmh0dHBzOi8vZ2l0aHViLmNvbS9n
cmF0ZS1kcml2ZXIveGY4Ni12aWRlby1vcGVudGVncmEvYmxvYi9tYXN0ZXIvc3JjL2dwdS9ncjNk
LmMjTDQ4NgpbM10KaHR0cHM6Ly9naXRodWIuY29tL2dyYXRlLWRyaXZlci94Zjg2LXZpZGVvLW9w
ZW50ZWdyYS9ibG9iL21hc3Rlci9zcmMvZXhhL2NvcHlfMmQuYyNMMzg5Cls0XQpodHRwczovL2dp
dGh1Yi5jb20vZ3JhdGUtZHJpdmVyL3hmODYtdmlkZW8tb3BlbnRlZ3JhL2Jsb2IvbWFzdGVyL3Ny
Yy9ncHUvdGVncmFfc3RyZWFtX3YyLmMjTDUzNgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
