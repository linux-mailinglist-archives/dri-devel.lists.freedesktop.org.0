Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B726DECE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D3A6E2C4;
	Thu, 17 Sep 2020 14:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C456E2C4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 14:54:47 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id o8so3680050ejb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=c1K4OLtO/JfamxhTGQNbBjJeRfDJiu5hBoeNqA7D5Kw=;
 b=g1TYV9VHVKwcz9nTafvKC8w4OmKAEUl0jCZSyHCZA9P8iZbSJXmpP8bs+WeLXftwic
 SsSOtx7TfoibshDaDI+iWUkXjtekOL341z3SkKwjky6y1+CopLdp9NTpae6LdJ4xJd3S
 EIwkv5bMttxj8+Ph0AW6CTHhIHU3xZ89YB2bXXIrZ7aA7UjoeU3gm8glWoZEj2BBxoGm
 WX0PALzCq5TM2R60gsrzrvsw8U7lBiwhCHUBsQR28yKpXBd/5mrouiAACCV5ba4955/l
 ZPSvqd+BQ8GyYTkNnG85JBg3qSBdQjX0XZfS2Fwvs8b9Ghl2xtJRrFnkE7eZEqOuhPuT
 Aouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=c1K4OLtO/JfamxhTGQNbBjJeRfDJiu5hBoeNqA7D5Kw=;
 b=hXMZdj07nbxNmzyKyF6v7Z+04oQ41OheA7aeNyEMkVfYt7YTd/iIsRlCmx+zE7Mqr5
 F3ABMFTDMO9LqteZ2FgpxVa1WCBVmPvyLwczyUVSBcjKUurqllGicCHHH1e4n7PKn/Ww
 Twuh3mD6ILF4AobbV5In0qqBMQH/pkti2o2ZBF4vtBE520P/02V0cnOisF5fBMBFdG7H
 6cJGpL5Ie8DiVqPsaVpmEU++vRwdnzGdaAvTaT2xEqEc6RL5w6bd1v/QNUh0vbZOwE9Y
 R/u2MpOMDvN88fhuIGz1XaLXGgEsNq51xYSG+6EpPIKa6IRbLF3/3aHYofHvVBJDTUsZ
 E8BQ==
X-Gm-Message-State: AOAM530rJqHY2MbCouPPV8jwzSYSoP/sCnD9yePVzZGRF/t6rBDTLn4b
 HsQ1Wz8RFSZi+lE4pz3MAY8=
X-Google-Smtp-Source: ABdhPJyRIXuxIHC4AEt2itGA+aidcLmov+Te1dwtEYl317M/Ql/irqZHREoF1KD7oRMw6129NC5jPQ==
X-Received: by 2002:a17:906:660f:: with SMTP id
 b15mr32495703ejp.333.1600354486253; 
 Thu, 17 Sep 2020 07:54:46 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j15sm114248ejs.5.2020.09.17.07.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 07:54:45 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To: Jason Gunthorpe <jgg@ziepe.ca>, christian.koenig@amd.com
References: <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
Date: Thu, 17 Sep 2020 16:54:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917143551.GG8409@ziepe.ca>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMjAgdW0gMTY6MzUgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gVGh1LCBT
ZXAgMTcsIDIwMjAgYXQgMDI6MjQ6MjlQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMTcuMDkuMjAgdW0gMTQ6MTggc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4+PiBPbiBU
aHUsIFNlcCAxNywgMjAyMCBhdCAwMjowMzo0OFBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+Pj4+IEFtIDE3LjA5LjIwIHVtIDEzOjMxIHNjaHJpZWIgSmFzb24gR3VudGhvcnBlOgo+
Pj4+PiBPbiBUaHUsIFNlcCAxNywgMjAyMCBhdCAxMDowOToxMkFNICswMjAwLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4gWWVhaCwgYnV0IGl0IGRvZXNuJ3Qgd29yayB3aGVuIGZv
cndhcmRpbmcgZnJvbSB0aGUgZHJtIGNoYXJkZXYgdG8gdGhlCj4+Pj4+PiBkbWEtYnVmIG9uIHRo
ZSBpbXBvcnRlciBzaWRlLCBzaW5jZSB5b3UnZCBuZWVkIGEgdG9uIG9mIGRpZmZlcmVudAo+Pj4+
Pj4gYWRkcmVzcyBzcGFjZXMuIEFuZCB5b3Ugc3RpbGwgcmVseSBvbiB0aGUgY29yZSBjb2RlIHBp
Y2tpbmcgdXAgeW91cgo+Pj4+Pj4gcGdvZmYgbWFuZ2xpbmcsIHdoaWNoIGZlZWxzIGFib3V0IGFz
IHJpc2t5IHRvIG1lIGFzIHRoZSB2bWEgZmlsZQo+Pj4+Pj4gcG9pbnRlciB3cmFuZ2xpbmcgLSBp
ZiBpdCdzIG5vdCBjb25zaXN0ZW50bHkgYXBwbGllZCB0aGUgcmV2ZXJzZSBtYXAKPj4+Pj4+IGlz
IHRvYXN0IGFuZCB1bm1hcF9tYXBwaW5nX3JhbmdlIGRvZXNuJ3Qgd29yayBjb3JyZWN0bHkgZm9y
IG91ciBuZWVkcy4KPj4+Pj4gSSB3b3VsZCB0aGluayB0aGUgcGdvZmYgaGFzIHRvIGJlIHRyYW5z
bGF0ZWQgYXQgdGhlIHNhbWUgdGltZSB0aGUKPj4+Pj4gdm0tPnZtX2ZpbGUgaXMgY2hhbmdlZD8K
Pj4+Pj4KPj4+Pj4gVGhlIG93bmVyIG9mIHRoZSBkbWFfYnVmIHNob3VsZCBoYXZlIG9uZSB2aXJ0
dWFsIGFkZHJlc3Mgc3BhY2UgYW5kIEZELAo+Pj4+PiBhbGwgaXRzIGRtYSBidWZzIHNob3VsZCBi
ZSBsaW5rZWQgdG8gaXQsIGFuZCBhbGwgcGdvZmZzIHRyYW5zbGF0ZWQgdG8KPj4+Pj4gdGhhdCBz
cGFjZS4KPj4+PiBZZWFoLCB0aGF0IGlzIGV4YWN0bHkgbGlrZSBhbWRncHUgaXMgZG9pbmcgaXQu
Cj4+Pj4KPj4+PiBHb2luZyB0byBkb2N1bWVudCB0aGF0IHNvbWVob3cgd2hlbiBJJ20gZG9uZSB3
aXRoIFRUTSBjbGVhbnVwcy4KPj4+IEJUVywgd2hpbGUgcGVvcGxlIGFyZSBsb29raW5nIGF0IHRo
aXMsIGlzIHRoZXJlIGEgd2F5IHRvIGdvIGZyb20gYSBWTUEKPj4+IHRvIGEgZG1hX2J1ZiB0aGF0
IG93bnMgaXQ/Cj4+IE9ubHkgYSBkcml2ZXIgc3BlY2lmaWMgb25lLgo+IFNvdW5kcyBPSwo+Cj4+
IEZvciBUVE0gZHJpdmVycyB2bWEtPnZtX3ByaXZhdGVfZGF0YSBwb2ludHMgdG8gdGhlIGJ1ZmZl
ciBvYmplY3QuIE5vdCBzdXJlCj4+IGFib3V0IHRoZSBkcml2ZXJzIHVzaW5nIEdFTSBvbmx5Lgo+
IFdoeSBhcmUgZHJpdmVycyBpbiBjb250cm9sIG9mIHRoZSB2bWE/IEkgd291bGQgdGhpbmsgZG1h
X2J1ZiBzaG91bGQgYmUKPiB0aGUgdm1hIG93bmVyLiBJSVJDIG1vZHVsZSBsaWZldGltZSBjb3Jy
ZWN0bmVzcyBlc3NlbnRpYWxseSBoaW5ncyBvbgo+IHRoZSBtb2R1bGUgb3duZXIgb2YgdGhlIHN0
cnVjdCBmaWxlCgpCZWNhdXNlIHRoZSBwYWdlIGZhdWx0IGhhbmRsaW5nIGlzIGNvbXBsZXRlbHkg
ZHJpdmVyIHNwZWNpZmljLgoKV2UgY291bGQgaW5zdGFsbCBzb21lIERNQS1idWYgdm1vcHMsIGJ1
dCB0aGF0IHdvdWxkIGp1c3QgYmUgYW5vdGhlciAKbGF5ZXIgb2YgcmVkaXJlY3Rpb24uCgo+PiBX
aHkgYXJlIHlvdSBhc2tpbmc/Cj4gSSdtIHRoaW5raW5nIGFib3V0IHVzaW5nIGZpbmRfdm1hIG9u
IHNvbWV0aGluZyB0aGF0IGlzIG5vdAo+IGdldF91c2VyX3BhZ2VzKCknYWJsZSB0byBnbyB0byB0
aGUgdW5kZXJseWluZyBvYmplY3QsIGluIHRoaXMgY2FzZSBkbWEKPiBidWYuCj4KPiBTbywgdXNl
ciBWQSAtPiBmaW5kX3ZtYSAtPiBkbWFfYnVmIG9iamVjdCAtPiBkbWFfYnVmIG9wZXJhdGlvbnMg
b24gdGhlCj4gbWVtb3J5IGl0IHJlcHJlc2VudHMKCkFoLCB5ZXMgd2UgYXJlIGFscmVhZHkgZG9p
bmcgdGhpcyBpbiBhbWRncHUgYXMgd2VsbC4gQnV0IG9ubHkgZm9yIApETUEtYnVmcyBvciBtb3Jl
IGdlbmVyYWxseSBidWZmZXJzIHdoaWNoIGFyZSBtbWFwZWQgYnkgdGhpcyBkcml2ZXIgaW5zdGFu
Y2UuCgpTb21lIGFwcGxpY2F0aW9ucyBhcmUgYnJhaW5kZWFkIGVub3VnaCB0byBtbWFwKCkgYSBi
dWZmZXIgYW5kIHRoZW4gZ2l2ZSAKdXMgYmFjayB0aGUgQ1BVIHBvaW50ZXIgYW5kIHJlcXVlc3Qg
dG8gbWFrZSBpdCBhIGhhbmRsZSAodXNlcnB0cikgYWdhaW4uCgpUaGF0IGlzIGNsZWFybHkgZm9y
YmlkZGVuIGJ5IE9wZW5HTCwgT3BlbkNMIGFuZCBWdWxrYW4sIGJ1dCB0aGV5IHVzZSBpdCAKYW55
d2F5LgoKQ2hyaXN0aWFuLgoKPgo+IEphc29uCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBMaW5hcm8tbW0tc2lnIG1haWxpbmcgbGlzdAo+IExpbmFy
by1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IGh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbmFyby1tbS1zaWcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
