Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5BB1AD68F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9866E373;
	Fri, 17 Apr 2020 06:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9966E0E8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 23:03:32 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q19so167091ljp.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 16:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z8uoOXp4twM9P9CL3wU74kwZNLbCUFRTsmV6ladVv10=;
 b=vgzVO6BB7c3OiUt+kzDq772Qp/Lnqd1TScfYm9t/pCh5T1n/iF8jepLsBtpRY227pF
 vCJ6HSZcjxe/hlnWWEU2H+8rkH+gp+IiaXd8xyvWrTP6hPROy+88zw3i2kDOKNuhsH3D
 PaBqJeVqNmt2xxJwLhGmqnE121Vv1HyV3U3tMV7lLejOqkHiWLiIJZDDDC93Ld3rn0Bb
 IltAalp9w37ura37IyuYr73eRh9XnqjbUa7jRVKoXGLDhBA6pi+T+nlm49z8zCMVe3Nt
 F7hrq7Y/bAl5FsxmNTZ4rvbJTRiKl6VmzTh7I53LHDRP/defhKpqORj4TVC0R3cxkSkP
 w3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z8uoOXp4twM9P9CL3wU74kwZNLbCUFRTsmV6ladVv10=;
 b=c8kBBZkrArNtCmHpjrtw1J0WJZX7X98M8hT81a24xxZPysedhx6AdTMlgWtFwO+SvD
 DqaPFx0nP8h/3xtQhgAG5y2R8+hO+mivk1VVYlm45veLQfV7eWE8dVAqsXhR7ZD/vHs1
 RHK5AWswldt4Fg6JLzdQBe+q+9frBpoC/erPhdXYbNXnyntvVjYh3pL2BS4haeV+JqaN
 l52Q9ehLz7VMp7GtxoBIs/S4kKcGWGEWs5PEJ6dpbdYSHKE6KSdCoK7JQZ2IjxdiqJyR
 M5Y/DVoI6kgUEx1XzZtWIuln8VylitRgP8wQg9IWmXgUICYfjz1rMnE8xayQ87Xacee9
 UU9Q==
X-Gm-Message-State: AGi0PuZiX1Gv+bt4iwMxhRr9IzGb91Uzy2C0FpEO1unhaIWY/2o34BYA
 FyuXfbIzdNCRZD3hfoB8dmc=
X-Google-Smtp-Source: APiQypK8WnUVD8hasXWixMVEp3FXnqD+7VdEf8+IsRlUpiO6lZKJ8z3vonz33E14poQGWj1nvc6+rw==
X-Received: by 2002:a2e:854e:: with SMTP id u14mr248556ljj.95.1587078211071;
 Thu, 16 Apr 2020 16:03:31 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id d3sm14000341lfq.63.2020.04.16.16.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 16:03:30 -0700 (PDT)
Subject: Re: [PATCH v10 0/2] Panel rotation patches
To: "dbasehore ." <dbasehore@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200306002112.255361-1-dbasehore@chromium.org>
 <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com>
 <CAGAzgsqpjZxh7PEL_Dy7HrFeFGm7+=F6cL3QG9KmK9CHvDWZ9g@mail.gmail.com>
 <6dc9ef16-9671-6ce8-27e6-aa1f4c009ee2@gmail.com>
 <CAGAzgsrNrq+S+-5KEFVnJn6S5DRn1fKkToD5=KR911T9AOAF-w@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <736ad1d2-4a28-87e8-62f7-28a5582c9fcf@gmail.com>
Date: Fri, 17 Apr 2020 02:03:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAGAzgsrNrq+S+-5KEFVnJn6S5DRn1fKkToD5=KR911T9AOAF-w@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTUuMDQuMjAyMCAwMDozMiwgZGJhc2Vob3JlIC4g0L/QuNGI0LXRgjoKPiBPbiBUdWUsIEFwciAx
NCwgMjAyMCBhdCAyOjE4IFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+Cj4+IDE0LjA0LjIwMjAgMjI6MzIsIGRiYXNlaG9yZSAuINC/0LjRiNC10YI6Cj4+PiBI
aSBEbWl0cnksIHNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KPj4+Cj4+PiBPbiBTdW4sIE1hciA4
LCAyMDIwIGF0IDEyOjI1IFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+Pj4KPj4+PiAwNi4wMy4yMDIwIDAzOjIxLCBEZXJlayBCYXNlaG9yZSDQv9C40YjQtdGC
Ogo+Pj4+PiBUaGlzIGFkZHMgdGhlIHBsdW1iaW5nIGZvciByZWFkaW5nIHBhbmVsIHJvdGF0aW9u
IGZyb20gdGhlIGRldmljZXRyZWUKPj4+Pj4gYW5kIHNldHMgdXAgYWRkaW5nIGEgcGFuZWwgcHJv
cGVydHkgZm9yIHRoZSBwYW5lbCBvcmllbnRhdGlvbiBvbgo+Pj4+PiBNZWRpYXRlayBTb0NzIHdo
ZW4gYSByb3RhdGlvbiBpcyBwcmVzZW50Lgo+Pj4+Cj4+Pj4gSGVsbG8gRGVyZWsgYW5kIGV2ZXJ5
b25lLAo+Pj4+Cj4+Pj4gSSdtIGxvb2tpbmcgYXQgYWRkaW5nIGRpc3BsYXkgcm90YXRpb24gc3Vw
cG9ydCB0byBOVklESUEgVGVncmEgRFJNCj4+Pj4gZHJpdmVyIGJlY2F1c2Ugc29tZSBkZXZpY2Vz
IGhhdmUgZGlzcGxheSBwYW5lbCBwaHlzaWNhbGx5IG1vdW50ZWQKPj4+PiB1cHNpZGUtZG93biwg
YW5kIHRodXMsIGRpc3BsYXkgY29udHJvbGxlcidzIHNjYW4tb3V0IG5lZWRzIHRvIGJlIHJvdGF0
ZWQKPj4+PiBieSAxODDCsCBpbiB0aGlzIGNhc2UuCj4+Pj4KPj4+PiBEZXJlaywgeW91cnMgcGFu
ZWwtcm90YXRpb24gcGF0Y2hlcyBhZGQgc3VwcG9ydCBmb3IgYXNzaWduaW5nIHBhbmVsJ3MKPj4+
PiBvcmllbnRhdGlvbiB0byB0aGUgY29ubmVjdG9yLCBidXQgdGhlbiBvbmx5IHByaW1hcnkgZGlz
cGxheSBwbGFuZQo+Pj4+IHJlY2VpdmVzIHJvdGF0aW9uIHZhbHVlIGluIFsxXSwgd2hpbGUgcm90
YXRpb24gbmVlZHMgdG8gYmUgYXBwbGllZCB0bwo+Pj4+IGFsbCBhdmFpbGFibGUgb3ZlcmxheS9j
dXJzb3IgcGxhbmVzIGFuZCB0aGlzIHNob3VsZCBoYXBwZW4gaW4gb3RoZXIKPj4+PiBwbGFjZXMg
dGhhbiBbMV0gYXMgd2VsbC4KPj4+Cj4+PiBUaGlzIGlzIGludGVuZGVkLiBXZSBkb24ndCBjb3Jy
ZWN0IHRoZSBvdXRwdXQgaW4gdGhlIGtlcm5lbC4gV2UKPj4+IGluc3RlYWQgcmVseSBvbiBub3Rp
ZnlpbmcgdXNlcnNwYWNlIHRoYXQgdGhlIHBhbmVsIGlzIHJvdGF0ZWQsIHRoZW4gd2UKPj4+IGhh
bmRsZSBpdCB0aGVyZS4KPj4+Cj4+Pj4KPj4+PiBbMV0gZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1p
dF9hdG9taWMoKQo+Pj4+Cj4+Pj4gUGxlYXNlIGFsc28gbm90ZSB0aGF0IGluIGEgY2FzZSBvZiB0
aGUgc2Nhbi1vdXQgcm90YXRpb24sIHBsYW5lJ3MKPj4+PiBjb29yZGluYXRlcyBuZWVkIHRvIGJl
IGNoYW5nZWQgaW4gYWNjb3JkYW5jZSB0byB0aGUgZGlzcGxheSdzIHJvdGF0aW9uLgo+Pj4+Cj4+
Pj4gSSBsb29rZWQgYnJpZWZseSB0aHJvdWdoIHRoZSBEUk0gY29kZSBhbmQgbXkgdW5kZXJzdGFu
ZGluZyB0aGF0IHRoZSBEUk0KPj4+PiBjb3JlIGN1cnJlbnRseSBkb2Vzbid0IHN1cHBvcnQgdXNl
LWNhc2Ugd2hlcmUgc2Nhbi1vdXQgbmVlZHMgdG8gcm90YXRlZAo+Pj4+IGJhc2VkIG9uIGEgcGFu
ZWwncyBvcmllbnRhdGlvbiwgY29ycmVjdD8gSXMgaXQgdGhlIHVzZS1jYXNlIHlvdSdyZQo+Pj4+
IHdvcmtpbmcgb24gZm9yIHRoZSBNZWRpYXRlayBkcml2ZXI/Cj4+Pgo+Pj4gWWVzLCB3ZSByZWx5
IG9uIHVzZXJzcGFjZSB0byByb3RhdGUgdGhlIG91dHB1dC4gVGhlIG1ham9yIHJlYXNvbiBmb3IK
Pj4+IHRoaXMgaXMgYmVjYXVzZSB0aGVyZSBtYXkgbm90IGJlIGEgImZyZWUiIGhhcmR3YXJlIHJv
dGF0aW9uIHRoYXQgY2FuCj4+PiBiZSBhcHBsaWVkIHRvIHRoZSBvdmVybGF5LiBTZWFuIFBhdWwg
YW5kIG90aGVycyBhbHNvIHByZWZlcnJlZCB0aGF0Cj4+PiB1c2Vyc3BhY2UgY29udHJvbCB3aGF0
IGlzIG91dHB1dCB0byB0aGUgc2NyZWVuIGluc3RlYWQgb2YgdGhlIGtlcm5lbAo+Pj4gdGFraW5n
IGNhcmUgb2YgaXQuIFRoaXMgY29kZSBqdXN0IGFkZHMgdGhlIGRybSBwcm9wZXJ0eSB0byB0aGUg
cGFuZWwuCj4+Pgo+Pgo+PiBDb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4gd2hhdCB0aGF0IHVzZXJz
cGFjZSBpcz8KPiAKPiBUaGlzIHdhcyBhZGRlZCBmb3IgQ2hyb21lIE9TLCB3aGljaCB1c2VzIGl0
cyBvd24gZ3JhcGhpY3Mgc3RhY2ssCj4gT3pvbmUsIGluc3RlYWQgb2YgWG9yZy4KPiAKClRoYW5r
IHlvdSB2ZXJ5IG11Y2ggZm9yIHRoZSBjbGFyaWZpY2F0aW9uLgoKSXQncyBwcm9iYWJseSBub3Qg
YSBiaWcgcHJvYmxlbSBmb3Igc29tZXRoaW5nIG1vbm9saXRoaWMgYW5kIGN1c3RvbWl6ZWQKbGlr
ZSBDaHJvbWVPUyB0byBpc3N1ZSBhIHNvZnR3YXJlIHVwZGF0ZSBpbiBvcmRlciB0byB0YWtlIGlu
dG8gYWNjb3VudAphbGwgc3BlY2lmaWNzIG9mIGEgcGFydGljdWxhciBkZXZpY2UsIGJ1dCB0aGlz
IGRvZXNuJ3Qgd29yayBuaWNlbHkgZm9yIGEKZ2VuZXJpYyBzb2Z0d2FyZSwgbGlrZSBhIHVzdWFs
IExpbnV4IGRpc3Ryby4KCj4+IEFGQUlLLCB0aGluZ3MgbGlrZSBYb3JnIG1vZGVzZXR0aW5nIGRv
bid0IHN1cHBvcnQgdGhhdCBvcmllbnRhdGlvbiBwcm9wZXJ0eS4KCkluIG15IGNhc2UgaXQncyBu
b3Qgb25seSB0aGUgZGlzcGxheSBwYW5lbCB3aGljaCBpcyB1cHNpZGUtZG93biwgYnV0CmFsc28g
dGhlIHRvdWNoc2NyZWVuLiBIZW5jZSBib3RoIGRpc3BsYXkgb3V0cHV0IGFuZCB0b3VjaHNjcmVl
biBpbnB1dApuZWVkIHRvIGJlIHJvdGF0ZWQgYXQgb25jZSwgb3RoZXJ3aXNlIHlvdSdsbCBlbmQg
dXAgd2l0aCBlaXRoZXIgZGlzcGxheQpvciBpbnB1dCBiZWluZyB1cHNpZGUtZG93bi4KClRoZSAx
ODDCsCByb3RhdGlvbiBzaG91bGQgYmUgZnJlZSBvbiBOVklESUEgVGVncmEuIFRoZXJlIGFyZSBu
byBrbm93bgpsaW1pdGF0aW9ucyBmb3IgdGhlIHBsYW5lcyBhbmQgQlNQIGtlcm5lbCB2aWRlbyBk
cml2ZXIgaGFuZGxlcyB0aGUKcGxhbmUncyBjb29yZGluYXRlcy9mcmFtZWJ1ZmZlciByb3RhdGlv
biB3aXRoaW4gdGhlIGRyaXZlci4KClRoZSBrZXJuZWwncyBpbnB1dCBzdWJzeXN0ZW0gYWxsb3dz
IHVzIHRvIHRyYW5zcGFyZW50bHkgKGZvciB1c2Vyc3BhY2UpCnJlbWFwIHRoZSB0b3VjaHNjcmVl
biBpbnB1dCAoYnkgc3BlY2lmeWluZyBnZW5lcmljIHRvdWNoc2NyZWVuCmRldmljZS10cmVlIHBy
b3BlcnRpZXMpLCB3aGlsZSB0aGlzIGlzIG5vdCB0aGUgY2FzZSBmb3IgdGhlIERSTSBzdWJzeXN0
ZW0uCgpAVGhpZXJyeSwgQFNlYW4sIEBEYW5pZWwsIGNvdWxkIHlvdSBwbGVhc2UgaGVscCBtZSB0
byB1bmRlcnN0YW5kIGhvdyBhCmNvb3JkaW5hdGVkIGRpc3BsYXkgLyBpbnB1dCByb3RhdGlvbiBj
b3VsZCBiZSBpbXBsZW1lbnRlZCwgbWFraW5nIHRoZQpyb3RhdGlvbiB0cmFuc3BhcmVudCB0byB0
aGUgdXNlciAoaS5lLiBhdm9pZGluZyB4b3JnLmNvbmYgaGFja2luZyBhbmQKZXRjKT8gSXQgc2hv
dWxkIGJlIG5pY2UgaWYgZGlzcGxheSdzIG91dHB1dCBjb3VsZCBiZSBmbGlwcGVkIHdpdGhpbiB0
aGUKRFJNIGRyaXZlciwgaGlkaW5nIHRoaXMgZmFjdCBmcm9tIHVzZXJzcGFjZS4KCldpbGwgaXQg
YmUgb2theSBpZiB3ZSdsbCBhZGQgYSB0cmFuc3BhcmVudC1yb3RhdGlvbiBzdXBwb3J0IHNwZWNp
ZmljYWxseQp0byB0aGUgVGVncmEgRFJNIGRyaXZlcj8gRm9yIGV4YW1wbGUgaWYgZGV2aWNlLXRy
ZWUgY29udGFpbnMKbnZpZGlhLGRpc3BsYXktZmxpcC15IHByb3BlcnR5LCB0aGVuIHRoZSBUZWdy
YSBEUk0gZHJpdmVyIHdpbGwgdGFrZSBjYXJlCm9mIHJvdGF0aW5nIGNvb3JkaW5hdGVzL2ZyYW1l
YnVmZmVyIG9mIHRoZSBkaXNwbGF5IHBsYW5lcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
