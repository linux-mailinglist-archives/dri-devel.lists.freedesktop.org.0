Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514EE20EF99
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E024689E05;
	Tue, 30 Jun 2020 07:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA2D88E87
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 19:33:26 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d21so9821961lfb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fijArdkg3PluTiSpvPbRCQSTn0uwHiGsyvlvdEoKWZU=;
 b=ZOxDYNTX58fJ5orIul3Zgn9tpUCxUBsH7Zvp/h9xKXFwp8XS2qhZ6GL39Ydbq7tfdX
 V2aXtycfU4eyf/J/JhqhFESsfmZOhIRfj8/IZcpLvSHbH2XtsyPWxFAAq6sKERYFCJ2T
 Bcp0KGASHZ3NGZLW3EV+liwxhwDcvr1pQGrQJe4Bl+cZq+FhteWGEOZpNs4gqHgsc/mQ
 alnV5GQoWk0KiHgWHpx8aqfch8jYWC8Prs1qyYwTfIGkncY8rUBgePkZCNp9zA7JBDfU
 etfS3ZIbLhpP6pZYdE2epgupKJQvuBRhTFHLxLJpittZEnrjjIHOuRODDZ/axlgTHX1G
 wMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fijArdkg3PluTiSpvPbRCQSTn0uwHiGsyvlvdEoKWZU=;
 b=RtjeaaEev1NQVCeJ84+mP+bzLFa44CkXYKzo8fUBxk1CQ1M7W5FV8OoQAoBrZkKxyb
 EHg0Mgqm29i5avUzEVgDBbL4g74wmYubNlqhSOlXtD2mYZnRRcXupYzplct60dn4Pt9b
 9A4opAMFrVlFPRyqarXRsazOK3PHIska+Z6fSktvsF89tCT36AydLK0gjnBTNLtjD6Kz
 vt8ctfLGz9RNgREPlDo89Ouv+0xgHp8x7oG7/GcahqDTXPZiKnoMHmPCQcIwnv+AYfvm
 nMIXUTDTsWoYXhOHuBuK/z6DsbNa87Whe6/1kmLKbsG7R1NKpDwfdZcfSp32YgcKYhpx
 ID0A==
X-Gm-Message-State: AOAM533y8GeQigpfQMp9y5NhX2Zlr6Jp4ufGBapb1PExrNphN23SIyxN
 ORuil+EAqrgtEe7uXInbWs4=
X-Google-Smtp-Source: ABdhPJzu/VnkbGp2Xl09zjpTeaH0MKr8NGdzTKMOdCxZmHgDGU29lu5QoYD5cZPN/PjYm/BYNgZz1w==
X-Received: by 2002:a19:4209:: with SMTP id p9mr10172897lfa.198.1593459204904; 
 Mon, 29 Jun 2020 12:33:24 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id w4sm156488ljw.16.2020.06.29.12.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 12:33:24 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
 <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
 <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
 <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8e78c18a-59da-a72f-e04a-ef6c23a49830@gmail.com>
Date: Mon, 29 Jun 2020 22:33:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Erik Faye-Lund <kusmabite@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjkuMDYuMjAyMCAxMzoyNywgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+Pj4+IDMu
IFN5bmMgcG9pbnRzIHNob3VsZCBiZSBwcm9wZXJseSByZWZjb3VudGVkLiBKb2IncyBzeW5jIHBv
aW50cwo+Pj4+IHNob3VsZG4ndCBiZSByZS11c2VkIHdoaWxlIGpvYiBpcyBhbGl2ZS4KPj4+Pgo+
Pj4+IDQuIFRoZSBqb2IncyBzeW5jIHBvaW50IGNhbid0IGJlIHJlLXVzZWQgYWZ0ZXIgam9iJ3Mg
c3VibWlzc2lvbiAoVUFQSQo+Pj4+IGNvbnN0cmFpbnQhKS4gVXNlcnNwYWNlIG11c3QgZnJlZSBz
eW5jIHBvaW50IGFuZCBhbGxvY2F0ZSBhIG5ldyBvbmUgZm9yCj4+Pj4gdGhlIG5leHQgam9iIHN1
Ym1pc3Npb24uIEFuZCBub3cgd2U6Cj4+Pj4KPj4+PiDCoMKgwqAgLSBLbm93IHRoYXQgam9iJ3Mg
c3luYyBwb2ludCBpcyBhbHdheXMgaW4gYSBoZWFsdGh5IHN0YXRlIQo+Pj4+Cj4+Pj4gwqDCoMKg
IC0gV2UncmUgbm90IGxpbWl0ZWQgYnkgYSBudW1iZXIgb2YgcGh5c2ljYWxseSBhdmFpbGFibGUg
aGFyZHdhcmUKPj4+PiBzeW5jCj4+Pj4gcG9pbnRzISBBbGxvY2F0aW9uIHNob3VsZCBibG9jayB1
bnRpbCBmcmVlIHN5bmMgcG9pbnQgaXMgYXZhaWxhYmxlLgoKSXQgYWxzbyBvY2N1cnJlZCB0byBt
ZSB0aGF0IGlmIGFsbG9jYXRpb24gaXMgYmxvY2tpbmcgYW5kIGlmIHRoZXJlIGlzIGEKbmVlZCB0
byBhbGxvY2F0ZSBtdWx0aXBsZSBzeW5jIHBvaW50cyBmb3IgYSBqb2IsIHRoZW4gdGhlIElPQ1RM
IHNob3VsZApiZSBhYmxlIHRvIGFsbG9jYXRlIG11bHRpcGxlIHN5bmMgcG9pbnRzIGF0IG9uY2Uu
IFRoaXMgd2lsbCBwcmV2ZW50CmludGVybG9jayBzaXR1YXRpb24gd2hlcmUgdHdvIGNvbnRleHQg
Y291bGQgYmxvY2sgb24gZWFjaCBvdGhlci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
