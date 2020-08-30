Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 705F9257630
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6B289C1F;
	Mon, 31 Aug 2020 09:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DD789DED
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 19:44:42 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h19so4289736ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 12:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w2b3uQ3grQuHzLpPQOfEHno6ki6zY9r+UONQurulOvI=;
 b=fhzf3GQjA1EtS/4zAwotNBVfEP5BgQC/vHh7NlqVuoqdj7ROn0tVvewLZVBzxTj4Pv
 4uAEsVCRdvMO7MN38yRhvjx55DRhviVUp+DeySquLtSENxd8LUNUq5mIKtUDp7268hWj
 EiAUYpoHBSpKqaW7iOB+cqshvXFhudBmVbsI7vuQfku+8lEdvR++g+KmaUBIrqUudFxn
 W8bUy8KkEXDCgYhxAAGz+7w9KmUMEitnB8JF5nbRsi/deNwUInd6AYGqmk3s0Ib8ljbl
 l0EyB1+767rr0k5EB5hEav1tXcXzg8p3RaCj4yuxNRG9oCWCo1/o1xG6lEcvfnnZFy/d
 3pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w2b3uQ3grQuHzLpPQOfEHno6ki6zY9r+UONQurulOvI=;
 b=hfcSOLecR7SU4mwa+eH5/LWzwkaNOS/6fvrhPPJBCKPITYICbZ+Y6N4G25w/ZCxgp6
 SlNRAR/uMekGuxup+X6F0SN1WS5y4RYII2SkR4N4hhe4PWJ4RdLzLOza+ye8icWiivs2
 rtoTJT08QP7apMJVcCOisK86jpPLh4Xadi3uupKWbnrvcLk8mm5Wfg3gDowMlvO1J2za
 GTDQhwNmVUy2JSkJwALwMLpmpO3bj0CmrxQWTWLd6QIaFFLCGH6H6nvbf+P9SSWubyhz
 wUvSWHePW5WveFfV+iyTCtOwX0hMtZFynx70vf/+hgj/H0iigejnI6lb5AeNk8nfmw/o
 iGHw==
X-Gm-Message-State: AOAM532TK4V5gwtu2WHiJCoD9ArtEllfLFEMQm6MmtHrLiNbsJJlezSk
 7obb6n9p0d2jOPEN5V5NImU=
X-Google-Smtp-Source: ABdhPJz59TfkPi8wlRB5m8RE5yjEcxQe68Z6X9P8P2LdznriMOncqOezMDUqioFbPNx1FbZLjJi8TA==
X-Received: by 2002:a05:651c:11c5:: with SMTP id
 z5mr3132694ljo.74.1598816680601; 
 Sun, 30 Aug 2020 12:44:40 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id e8sm1114886lja.93.2020.08.30.12.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 12:44:39 -0700 (PDT)
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
To: Thierry Reding <thierry.reding@gmail.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
 <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
 <cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com>
 <62a72187-442b-2103-46c3-39d3cd999f54@gmail.com>
 <affe2cfb-19e8-8e55-acd0-7170e274ab34@arm.com>
 <f1923a53-e799-e63c-fd22-4a6cca3b8212@gmail.com>
 <20200827155446.GB1660457@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f6240633-feed-70b7-2fe8-49fcee687676@gmail.com>
Date: Sun, 30 Aug 2020 22:44:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827155446.GB1660457@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, s-anna@ti.com, will@kernel.org, hch@lst.de,
 m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org, joro@8bytes.org,
 magnus.damm@gmail.com, linux@armlinux.org.uk, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, kyungmin.park@samsung.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMDguMjAyMCAxODo1NCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKLi4uCj4+IFRoZSBU
ZWdyYSBEUk0gaGFzIGEgdmVyeSBzcGVjaWFsIHF1aXJrIGZvciBBUk0zMiB0aGF0IHdhcyBhZGRl
ZCBpbiB0aGlzCj4+IGNvbW1pdCBbMl0gYW5kIGRyaXZlciByZWxpZXMgb24gY2hlY2tpbmcgb2Yg
d2hldGhlciBleHBsaWNpdCBvciBpbXBsaWNpdAo+PiBJT01NVSBpcyB1c2VkIGluIG9yZGVyIHRv
IGFjdGl2YXRlIHRoZSBxdWlyay4KPj4KPj4gWzJdCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9pZD0y
NzNkYTVhMDQ2OTY1Y2NmMGVjNzllYjYzZjJkNTE3MzQ2N2UyMGZhCj4+Cj4+IE9uY2UgdGhlIGlt
cGxpY2l0IElPTU1VIGlzIHVzZWQgZm9yIHRoZSBEUk0gZHJpdmVyLCB0aGUgcXVpcmsgbm8gbG9u
Z2VyCj4+IHdvcmtzIChpZiBJJ20gbm90IG1pc3Npbmcgc29tZXRoaW5nKS4gVGhpcyBwcm9ibGVt
IG5lZWRzIHRvIGJlIHJlc29sdmVkCj4+IGJlZm9yZSBpbXBsaWNpdCBJT01NVSBjb3VsZCBiZSB1
c2VkIGJ5IHRoZSBUZWdyYSBEUk0gb24gQVJNMzIuCi4uLgo+IEkgZG8gaGF2ZSBhIHBhdGNoIGx5
aW5nIGFyb3VuZCBzb21ld2hlcmUgdGhhdCBpbXBsZW1lbnRzIHRoZSBtYXBwaW5nCj4gY2FjaGUg
dGhhdCB3YXMgcmVmZXJlbmNlZCBpbiB0aGUgYWJvdmUgY29tbWl0LiBMZXQgbWUga25vdyBpZiBJ
IHNob3VsZAo+IGRpZyB0aGF0IHVwIGFuZCBzZW5kIGl0IG91dC4KCkhlbGxvLCBUaGllcnJ5ISBJ
dCBjZXJ0YWlubHkgd2lsbCBiZSBpbnRlcmVzdGluZyB0byB0YWtlIGEgbG9vayBhdCB5b3Vycwpw
YXRjaCEKCkkgdGhpbmsgdGhhdCB0aGUgY2FjaGluZyBzaG91bGRuJ3QgYmUgc3RyaWN0bHkgbmVj
ZXNzYXJ5IGZvciBrZWVwaW5nIHRoZQpjdXJyZW50IHdvcmthcm91bmQgd29ya2luZyBhbmQgaXQg
c2hvdWxkIGJlIHBvc3NpYmxlIHRvIGtlZXAgdGhlIGNvZGUKYXMtaXMgYnkgcmVwbGFjaW5nIHRo
ZSBkb21haW4tdHlwZSBjaGVja2luZyB3aXRoIHRoZSBTb0MtZ2VuZXJhdGlvbgpjaGVjayBpbiB0
aGUgVGVncmEgRFJNIGRyaXZlci4KCkluIGdlbmVyYWwsIElNTyBpdCBzaG91bGQgYmUgYmV0dGVy
IHRvIHN0YXNoIHRoZSBjb21wbGV4IGNoYW5nZXMgdW50aWwKd2UnbGwgZ2V0IGNsb3NlciB0byBh
ZG9wdGluZyB0aGUgbmV3IFVBUEkgYXMgaXQgd2lsbCBjZXJ0YWlubHkgdG91Y2ggdGhlCmFzcGVj
dCBvZiB0aGUgcGVyLWRldmljZSBtYXBwaW5ncy4gQnV0IGlmIHlvdXJzIHBhdGNoIGlzIGxlc3Mg
dGhhbiAxMDAKTE9DLCB0aGVuIG1heWJlIHdlIGNvdWxkIGNvbnNpZGVyIGFwcGx5aW5nIGl0IHJp
Z2h0IG5vdyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
