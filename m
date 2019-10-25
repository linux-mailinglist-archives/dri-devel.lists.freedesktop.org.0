Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C874EE6E0D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9356E456;
	Mon, 28 Oct 2019 08:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D736EB16
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 17:37:39 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id b1so1984249vsr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n3zRKKpWesI5grnDqHLULldb36AmyV6GudRJkSHNkk8=;
 b=XZyH/o1LCjiVGeYXbff+CX9dogR3bColjUrEKXX1VvZJ8WOq/SCGFQPt38QdsnA7xm
 bWU8Qti1rE+Exk6gVhmETmVVlfyirD1sb13ET0n9Mm9EVOGp0oa5sQQwZBdkcALH4wv2
 8vjnjnj2XmKps3kz6lNkt/MQG7oEd0aFhp5wTdFf6dfAqWgZzDHJqcRTjGauZOTdbJAf
 bEOrwh3Zwgg/6bE7e4hbaQROriaLqDlZ/sZ8Fkfoc0CpKCbhu4oJgxcQ102Y3maswHbv
 Xk9iYnj5c+3a3Urj9/7QncStzvwU/DtHGUYWfn1c1ptpjia61Q8aHH40ZjioUklqxKCe
 YwHA==
X-Gm-Message-State: APjAAAU7obGy6sm1fGW7S2svduCj16ahskWm8l8n5quxkdbHi0t0LQ+f
 XpRpFjJClKZtqEx0AYoiXBvADXVtTV+Ids0KtCx02g==
X-Google-Smtp-Source: APXvYqxAFat0lLdFxAPOHP3RbOBcD2GfRxM8sJOqGuiNrHiT22cN+EJiMlgJWFqfDNrCXaved5QLIhLLHRT7TynQ8oM=
X-Received: by 2002:a67:ba16:: with SMTP id l22mr2638481vsn.14.1572025057888; 
 Fri, 25 Oct 2019 10:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAKT=dD=vYi_41WBAZfcb7cU5SZUkj88OmhCSyfnNdT45qzhPwg@mail.gmail.com>
In-Reply-To: <CAKT=dD=vYi_41WBAZfcb7cU5SZUkj88OmhCSyfnNdT45qzhPwg@mail.gmail.com>
From: Alistair Delva <adelva@google.com>
Date: Fri, 25 Oct 2019 10:37:26 -0700
Message-ID: <CANDihLHCctmKC66=B6q8ATL5kASzhQ1Ei-_7949U85bv=UMqbw@mail.gmail.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs nodes
To: Yiwei Zhang <zzyiwei@google.com>
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n3zRKKpWesI5grnDqHLULldb36AmyV6GudRJkSHNkk8=;
 b=KU0a/QnT0OKYDWOrP0us2jCIl0D5ZpqGkSIaD+klPq2IcvVS+ZusyABHvML3b06D9P
 TKKkoN/5Ks/6O4Kiyf3nnawuH20XHlApcpQCpyNh4KNhETmOM+2KX5xfIW/cCU9UNsIS
 CSbSWsjtgwnGCx0MWe6bIrPXHGXNT9clMuPp1YapgTIZxhJGAY0cF9gm5c1EHHm0Xyfd
 uNBjZJGppaK4Gd3jcUxFcKyM5XWSFhGYegphKl3qee5QL3j9FfCr7fq0PyYRr6nYFn0J
 WXXk/1C3B/tOiDkrs+vey4HsbGlrpb+/Zu1oehLbpU1oyTRsi6JkdXRPn6jzh6sEPq/Y
 c4Bw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org, Prahlad Kilambi <prahladk@google.com>,
 Sean Paul <seanpaul@chromium.org>, kraxel@redhat.com,
 Chris Forbes <chrisforbes@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KGNjIGtlcm5lbC10ZWFtQGFuZHJvaWQuY29tKQoKT24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTE6
MDEgQU0gWWl3ZWkgWmhhbmcgPHp6eWl3ZWlAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBIaSBmb2xr
cywKPgo+IFRoaXMgaXMgWWl3ZWkgZnJvbSB0aGUgQW5kcm9pZCBQbGF0Zm9ybSBHcmFwaGljcyB0
ZWFtLiBPbiB0aGUgZG93bnN0cmVhbSBBbmRyb2lkLCB2ZW5kb3JzIHVzZWQgdG8gcmVwb3J0IEdQ
VSBwcml2YXRlIG1lbW9yeSBhbGxvY2F0aW9ucyB3aXRoIGRlYnVnZnMgbm9kZXMgaW4gdGhlaXIg
b3duIGZvcm1hdHMuIEhvd2V2ZXIsIGRlYnVnZnMgbm9kZXMgYXJlIGdldHRpbmcgZGVwcmVjYXRl
ZCBpbiB0aGUgbmV4dCBBbmRyb2lkIHJlbGVhc2UsIHNvIHdlIGFyZSB0YWtpbmcgdGhlIGNoYW5j
ZSB0byB1bmlmeSBhbGwgdGhlIHZlbmRvcnMgdG8gbWlncmF0ZSB0aGVpciBleGlzdGluZyBkZWJ1
Z2ZzIG5vZGVzIGludG8gYSBzdGFuZGFyZGl6ZWQgc3lzZnMgbm9kZSBzdHJ1Y3R1cmUuIFRoZW4g
dGhlIHBsYXRmb3JtIGlzIGFibGUgdG8gZG8gYSBidW5jaCBvZiB1c2VmdWwgdGhpbmdzOiBtZW1v
cnkgcHJvZmlsaW5nLCBzeXN0ZW0gaGVhbHRoIGNvdmVyYWdlLCBmaWVsZCBtZXRyaWNzLCBsb2Nh
bCBzaGVsbCBkdW1wLCBpbi1hcHAgYXBpLCBldGMuCj4KPiBTb21lIHZlbmRvcnMgdGVuZCB0byBk
byBhIGxvdCBvZiB1cHN0cmVhbXMsIHNvIHdlIGFyZSBhbHNvIHNlZWtpbmcgdGhlIHVwc3RyZWFt
IHBvc3NpYmlsaXRpZXMgaGVyZSBpbnN0ZWFkIG9mIG1ha2luZyBpdCBhbiBBbmRyb2lkIG9ubHkg
dGhpbmcuCj4KPiBBdHRhY2hlZCBhcmUgc2NyZWVuc2hvdHMgZm9yIHRoZSBub2RlIHN0cnVjdHVy
ZSB3ZSBkcmFmdGVkIGFuZCBhbiBleGFtcGxlIGZvciB0aGF0Lgo+Cj4gRm9yIHRoZSB0b3AgbGV2
ZWwgcm9vdCwgdmVuZG9ycyBjYW4gY2hvb3NlIHRoZWlyIG93biBuYW1lcyBiYXNlZCBvbiB0aGUg
dmFsdWUgb2Ygcm8uZ2Z4LnN5c2ZzLjAgdGhlIHZlbmRvcnMgc2V0Lgo+Cj4gRm9yIHRoZSBtdWx0
aXBsZSBncHUgZHJpdmVyIGNhc2VzLCB3ZSBjYW4gdXNlIHJvLmdmeC5zeXNmcy4xLCByby5nZngu
c3lzZnMuMiBmb3IgdGhlIDJuZCBhbmQgM3JkIEtNRHMuCj4gSXQncyBhbHNvIGFsbG93ZWQgdG8g
cHV0IHNvbWUgc3ViLWRpciBmb3IgZXhhbXBsZSAia2dzbC9ncHVfbWVtIiBvciAibWFsaTAvZ3B1
X21lbSIgaW4gdGhlIHJvLmdmeC5zeXNmcy48Y2hhbm5lbD4gcHJvcGVydHkgaWYgdGhlIHJvb3Qg
bmFtZSB1bmRlciAvc3lzL2RldmljZXMvIGlzIGFscmVhZHkgY3JlYXRlZCBhbmQgdXNlZCBmb3Ig
b3RoZXIgcHVycG9zZXMuCj4KPgo+IEZvciB0aGUgMm5kIGxldmVsIHBpZHMsIHRoZXJlIGFyZSB1
c3VhbGx5IGp1c3QgYSBjb3VwbGUgb2YgdGhlbSBwZXIgc25hcHNob3QsIHNpbmNlIHdlIG9ubHkg
dGFrZXMgc25hcHNob3QgZm9yIHRoZSBhY3RpdmUgb25lcy4KPgo+IEZvciB0aGUgM3JkIGxldmVs
IHR5cGVzLCB0aGUgdHlwZSBuYW1lIHdpbGwgYmUgb25lIG9mIHRoZSBHUFUgbWVtb3J5IG9iamVj
dCB0eXBlcyBpbiBsb3dlciBjYXNlLCBhbmQgdGhlIHZhbHVlIHdpbGwgYmUgYSBjb21tYSBzZXBh
cmF0ZWQgc2VxdWVuY2Ugb2Ygc2l6ZSB2YWx1ZXMgZm9yIGFsbCB0aGUgYWxsb2NhdGlvbnMgdW5k
ZXIgdGhhdCBzcGVjaWZpYyB0eXBlLgo+Cj4gRm9yIHRoZSBHUFUgbWVtb3J5IG9iamVjdCB0eXBl
cywgd2UgZGVmaW5lZCA5IGRpZmZlcmVudCB0eXBlcyBmb3IgQW5kcm9pZDoKPgo+ICAgICAvLyBu
b3QgYWNjb3VudGVkIGZvciBpbiBhbnkgb3RoZXIgY2F0ZWdvcnkKPiAgICAgVU5LTk9XTiA9IDA7
Cj4gICAgIC8vIHNoYWRlciBiaW5hcmllcwo+ICAgICBTSEFERVIgPSAxOwo+ICAgICAvLyBhbGxv
Y2F0aW9ucyB3aGljaCBoYXZlIGEgbGlmZXRpbWUgc2ltaWxhciB0byBhIFZrQ29tbWFuZEJ1ZmZl
cgo+ICAgICBDT01NQU5EID0gMjsKPiAgICAgLy8gYmFja2luZyBmb3IgVmtEZXZpY2VNZW1vcnkK
PiAgICAgVlVMS0FOID0gMzsKPiAgICAgLy8gR0wgVGV4dHVyZSBhbmQgUmVuZGVyQnVmZmVyCj4g
ICAgIEdMX1RFWFRVUkUgPSA0Owo+ICAgICAvLyBHTCBCdWZmZXIKPiAgICAgR0xfQlVGRkVSID0g
NTsKPiAgICAgLy8gYmFja2luZyBmb3IgcXVlcnkKPiAgICAgUVVFUlkgPSA2Owo+ICAgICAvLyBh
bGxvY2F0aW9ucyB3aGljaCBoYXZlIGEgbGlmZXRpbWUgc2ltaWxhciB0byBhIFZrRGVzY3JpcHRv
clNldAo+ICAgICBERVNDUklQVE9SID0gNzsKPiAgICAgLy8gcmFuZG9tIHRyYW5zaWVudCB0aGlu
Z3MgdGhhdCB0aGUgZHJpdmVyIG5lZWRzCj4gICAgIFRSQU5TSUVOVCA9IDg7Cj4gV2UgYXJlIHdv
bmRlcmluZyBpZiB0aG9zZSB0eXBlIGVudW1lcmF0aW9ucyBtYWtlIHNlbnNlIHRvIHRoZSB1cHN0
cmVhbSBzaWRlIGFzIHdlbGwsIG9yIG1heWJlIHdlIGp1c3QgZGVhbCB3aXRoIG91ciBvd24gZGlm
ZmVyZW50IHR5cGUgc2V0cy4gQ3V6IG9uIHRoZSBBbmRyb2lkIHNpZGUsIHdlJ2xsIGp1c3QgcmVh
ZCB0aG9zZSBub2RlcyBuYW1lZCBhZnRlciB0aGUgdHlwZXMgd2UgZGVmaW5lZCBpbiB0aGUgc3lz
ZnMgbm9kZSBzdHJ1Y3R1cmUuCj4KPiBUaGUgbm9kZSB2YWx1ZSBjYW4gYmU6IDQwOTYsODE5MjAs
Li4uLDQwOTYKPgo+Cj4gTG9va2luZyBmb3J3YXJkIHRvIGFueSBjb25jZXJucy9jb21tZW50cy9z
dWdnZXN0aW9ucyEKPgo+IEJlc3QgcmVnYXJkcywKPiBZaXdlaQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
