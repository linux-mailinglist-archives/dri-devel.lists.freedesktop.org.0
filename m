Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F0528AFB2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 10:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785926E037;
	Mon, 12 Oct 2020 08:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99CF6E037
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 08:11:34 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id u8so21977652ejg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=M1NhPSK8WcpTtZeyW8ggYwirkBLqPyAO/qcKCJS3Ci0=;
 b=hooBfwk+2I80d0Ms8XxtPp3CfKDIx3enCApEOuuytF3Anb8bHKoLNqZfbtlJbU56Hb
 yNwF7zdbzJAkZQVna9Si5mcidbKO5VoSKaNZpmIZIrXhFaGg0IHkXmRwRBHAoGB1ddD9
 ZKw3QjFBs+o7tQRDviU6aBtv/ckgsVeO558kbxdQAJXW1toWHTWlxDplYsvVyD2f/odt
 i/g0Botby3AkC2oTpABiBaKl/jcVCDz9nRj9CqvSQ8rBj7gVuIpkRNy85vuRePFfd4Rp
 cBlY/IUcu4KNrcgO3at/VEVS6tfMIxZ6VUZRaJBSrNxFxh53vobe1uI/OhZJbjdkg32x
 Y+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=M1NhPSK8WcpTtZeyW8ggYwirkBLqPyAO/qcKCJS3Ci0=;
 b=nsuxx/uDbM9c9H7ikjtNQ8fkwb8uPGsSId4Avo8QGdxTG9FTt60oq8ef0Tyh4blkti
 YECMVtPWd5kYk5gk+mlLWfkUMQQddm8cAVhyhOcEFZ5kU5s+n7EUiere4g+1C9r3lxG1
 W0sGrbqsKYV2oNaYwRcMi5Y7Qs/umuJI6D+7ACIAVRRNwcmTXTEgTW86wcL6yIuHD48S
 WAq5e5YWwsl2JCgDwDpjNpab5ba/MeQnMBaCFqc5TZpEQ9HRzg7qrDs4v8n2hXV5a7UL
 p9fJFDzOmq55L2hKkOmHIdFNavpahXPS0DYO1hLdpKitGg1NSksnucpSaFscRs8mEuYG
 b28A==
X-Gm-Message-State: AOAM532yvbPMyJ5HNIz1KKrLB2nnV7Dq63JuHnKmD3o4YR2ABavrCcku
 7ss2UPDsvQcnIAvNDPMnI8Q=
X-Google-Smtp-Source: ABdhPJweeE2yP6VxtQZod6lD2VKbJ5vhzDztVRMAHk7/HnG5S/RU3E8nwHmSCPtcnJZtER6cRV0qzw==
X-Received: by 2002:a17:906:53d7:: with SMTP id
 p23mr26383911ejo.232.1602490293318; 
 Mon, 12 Oct 2020 01:11:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j18sm10177649ejc.111.2020.10.12.01.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 01:11:32 -0700 (PDT)
Subject: Re: [PATCH 2/6] mm: introduce vma_set_file function v3
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20201009150342.1979-1-christian.koenig@amd.com>
 <20201009150342.1979-2-christian.koenig@amd.com>
 <20201009151418.GW5177@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9592e3da-a105-b0ec-3fb2-be349c464c2c@gmail.com>
Date: Mon, 12 Oct 2020 10:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009151418.GW5177@ziepe.ca>
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
Cc: jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, willy@infradead.org,
 airlied@redhat.com, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMTAuMjAgdW0gMTc6MTQgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gRnJpLCBP
Y3QgMDksIDIwMjAgYXQgMDU6MDM6MzhQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gKy8qCj4+ICsgKiBDaGFuZ2UgYmFja2luZyBmaWxlLCBvbmx5IHZhbGlkIHRvIHVzZSBkdXJp
bmcgaW5pdGlhbCBWTUEgc2V0dXAuCj4+ICsgKi8KPj4gK3ZvaWQgdm1hX3NldF9maWxlKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3QgZmlsZSAqZmlsZSkKPj4gK3sKPj4gKwlpZiAo
ZmlsZSkKPj4gKwkgICAgICAgIGdldF9maWxlKGZpbGUpOwo+PiArCj4+ICsJc3dhcCh2bWEtPnZt
X2ZpbGUsIGZpbGUpOwo+PiArCj4+ICsJaWYgKGZpbGUpCj4+ICsJCWZwdXQoZmlsZSk7Cj4+ICt9
Cj4gZnB1dCBjcmFzaGVzIHdoZW4gZmlsZSBpcyBOVUxMIHNvIHRoZSBlcnJvciBoYW5kbGluZyBh
ZnRlcgo+IHVubWFwX2FuZF9mcmVlX3ZtYTogY2FuJ3QgaGFuZGxlIHRoaXMgY2FzZSwgc2ltaWxh
cmx5IHZtX2ZpbGUgY2FuJ3QgYmUKPiBOVUxMIGVpdGhlci4KPgo+IFNvIGp1c3Qgc2ltcGx5Ogo+
Cj4gICBzd2FwKHZtYS0+dm1fZmlsZSwgZmlsZSk7Cj4gICBnZXRfZmlsZSh2bWEtPnZtX2ZpbGUp
Owo+ICAgZnB1dChmaWxlKTsKPiAgIAo+IFdpbGwgZG8/CgpJIHdhcyBjb25zaWRlcmluZyB0aGlz
IGFzIHdlbGwsIHllcy4KCj4gSnVzdCBsZXQgaXQgY3Jhc2ggaWYgYW55IG9mIHRoZW0gYXJlIHdy
b25nbHkgTlVMTC4KCk1obSwgY2hhbmdpbmcgZnJvbSBhbm9ueW1vdXMgdG8gZmlsZSBiYWNrZWQg
b3IgcmV2ZXJzZSBpcyBwcm9iYWJseSBub3QgCnN1Y2ggYSBnb29kIGlkZWEuCgpTbyB5ZXMgY2F0
Y2hpbmcgdGhvc2UgcHJvYmxlbXMgZWFybHkgaXMgcHJvYmFibHkgdGhlIGJlc3QgYXBwcm9hY2gg
d2UgCmNvdWxkIGRvLgoKR29pbmcgdG8gZG8gdGhpcyBpbiB2NCBpZiBub2JvZHkgb2JqZWN0cy4K
ClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
