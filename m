Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E102B3B13
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F9E89E32;
	Mon, 16 Nov 2020 01:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640F06E98E
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 16:29:52 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r9so21357031lfn.11
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iC9NSUeuoXzI+DJbqq71H2Zz0PQEqB1OwlXCJ9ZyVwE=;
 b=N7DU2s8hAlj9xxkzQ2I8PyHCG7D4tPHsZrBs/ZFTlGrlirNJ+FBBIUJ4LHFrjKqWVr
 +tHu5pFQ1UAsCz/st6d7bfBh/LEXy197nXKpgcLGFYW+Ak4Qv6V5arl0k+F2HQpie5bl
 28dTS7uRV3HinpiMSG5Lg77AcaJhJh7zdmtFET43lJ976UdhLpqz0pJg02ntLGKwDMqG
 v6xDQCBvQwNcgz9eAKwbDlodqN7Pz9vYe6lJDZp3pyzKA0aXPLlIJzDHhAgbCk3BJy+Z
 BOdAQN6CMDBtaaILm6TDc1MDsszvkY4ZxTyCMuB6VC+H+tTrMb5FJcfFF6rA7vBMVoBI
 JEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iC9NSUeuoXzI+DJbqq71H2Zz0PQEqB1OwlXCJ9ZyVwE=;
 b=dMcHjP76IC5lYNnxVfyRh8ORo0oVLc5NOk5GB65fFMXyPvqBW8ZJagQJSbBmSfjo8e
 nqrqK2nl9OEnj52OU8XYRMiDBhXDnjT8Nnq/ZlWsMEy97VXiLXTSRG4nYFlf9bwM90li
 KcUe6Rkir6i0z9oI6+9LK7crIuC8KniGSRNsvh/1iS93afMjOBrkG3YxiiRrIh/oY8bU
 yZozL932V41XBoeQSqFbzKQxFDV46+taos3AKMRM0+GSSn2sRNcH3KITvb4Rl/dMtPeh
 zEdKaUn7R318k2M8xcYRWqwmiW2AbWBZelcGYY3NhVo1NPply5wyr39KmZNRi2OUV8Ci
 tvOA==
X-Gm-Message-State: AOAM533XFP/QDkQzc8BRZv7D6iJU/LA00I1PIH+kZPP1RSn+02PYbmWi
 lR+Alid2YynIKxW8msoQvY8=
X-Google-Smtp-Source: ABdhPJyKAFx5NAC66gNXmBbXVldpY/Bu7QhCg9tdHj3K5FHem1m7FQns7xPp+/vK1tkSo2/TIWesZQ==
X-Received: by 2002:ac2:44d2:: with SMTP id d18mr4229194lfm.103.1605457790581; 
 Sun, 15 Nov 2020 08:29:50 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id i19sm2371286lfj.212.2020.11.15.08.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Nov 2020 08:29:49 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To: Thierry Reding <thierry.reding@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <cd147ab0-1304-a491-7a56-ee6199c02d32@gmail.com>
 <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
 <CAPDyKFqUMsH9dCZ=OYqfdLt==+-8NjK9n=S5jGGNXZu6Y9q=2w@mail.gmail.com>
 <1f7e90c4-6134-2e2b-4869-5afbda18ead3@gmail.com>
 <20201112204358.GA1027187@ulmo>
 <25942da9-b527-c0aa-5403-53c9cc34ad93@gmail.com>
 <20201113163552.GE1408970@ulmo>
Message-ID: <a89211b7-13c4-41dd-df42-d0f01a880566@gmail.com>
Date: Sun, 15 Nov 2020 19:29:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201113163552.GE1408970@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 DTML <devicetree@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driverdevel <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTMuMTEuMjAyMCAxOTozNSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBGcmksIE5v
diAxMywgMjAyMCBhdCAwMToxNDo0NUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDEyLjExLjIwMjAgMjM6NDMsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+Pj4gVGhlIGRp
ZmZlcmVuY2UgaW4gY29tcGFyaXNvbiB0byB1c2luZyB2b2x0YWdlIHJlZ3VsYXRvciBkaXJlY3Rs
eSBpcwo+Pj4+IG1pbmltYWwsIGJhc2ljYWxseSB0aGUgY29yZS1zdXBwbHkgcGhhbmRsZSBpcyBy
ZXBsYWNlZCBpcyByZXBsYWNlZCB3aXRoCj4+Pj4gYSBwb3dlci1kb21haW4gcGhhbmRsZSBpbiBh
IGRldmljZSB0cmVlLgo+Pj4gVGhlc2UgbmV3IHBvd2VyLWRvbWFpbiBoYW5kbGVzIHdvdWxkIGhh
dmUgdG8gYmUgYWRkZWQgdG8gZGV2aWNlcyB0aGF0Cj4+PiBwb3RlbnRpYWxseSBhbHJlYWR5IGhh
dmUgYSBwb3dlci1kb21haW4gaGFuZGxlLCByaWdodD8gSXNuJ3QgdGhhdCBnb2luZwo+Pj4gdG8g
Y2F1c2UgaXNzdWVzPyBJIHZhZ3VlbHkgcmVjYWxsIHRoYXQgd2UgYWxyZWFkeSBoYXZlIG11bHRp
cGxlIHBvd2VyCj4+PiBkb21haW5zIGZvciB0aGUgWFVTQiBjb250cm9sbGVyIGFuZCB3ZSBoYXZl
IHRvIGp1bXAgdGhyb3VnaCBleHRyYSBob29wcwo+Pj4gdG8gbWFrZSB0aGF0IHdvcmsuCj4+Cj4+
IEkgbW9kZWxlZCB0aGUgY29yZSBQRCBhcyBhIHBhcmVudCBvZiB0aGUgUE1DIHN1Yi1kb21haW5z
LCB3aGljaAo+PiBwcmVzdW1hYmx5IGlzIGEgY29ycmVjdCB3YXkgdG8gcmVwcmVzZW50IHRoZSBk
b21haW5zIHRvcG9sb2d5Lgo+Pgo+PiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9kaWdldHgvZGZk
OTJjN2Y3ZTBhYTZjZWYyMDQwM2M0Mjk4MDg4ZDcKPj4KPj4+PiBUaGUgb25seSB0aGluZyB3aGlj
aCBtYWtlcyBtZSBmZWVsIGEgYml0IHVuY29tZm9ydGFibGUgaXMgdGhhdCB0aGVyZSBpcwo+Pj4+
IG5vIHJlYWwgaGFyZHdhcmUgbm9kZSBmb3IgdGhlIHBvd2VyIGRvbWFpbiBub2RlIGluIGEgZGV2
aWNlLXRyZWUuCj4+PiBDb3VsZCB3ZSBhbmNob3IgdGhlIG5ldyBwb3dlciBkb21haW4gYXQgdGhl
IFBNQyBmb3IgZXhhbXBsZT8gVGhhdCB3b3VsZAo+Pj4gYWxsb3cgdXMgdG8gYXZvaWQgdGhlICJ2
aXJ0dWFsIiBub2RlLgo+Pgo+PiBJIGhhZCBhIHRob3VnaHQgYWJvdXQgdXNpbmcgUE1DIGZvciB0
aGUgY29yZSBkb21haW4sIGJ1dCBub3Qgc3VyZQo+PiB3aGV0aGVyIGl0IHdpbGwgYmUgYW4gZW50
aXJlbHkgY29ycmVjdCBoYXJkd2FyZSBkZXNjcmlwdGlvbi4gQWx0aG91Z2gsCj4+IGl0IHdpbGwg
YmUgbmljZSB0byBoYXZlIGl0IHRoaXMgd2F5Lgo+Pgo+PiBUaGlzIGlzIHdoYXQgVGVncmEgVFJN
IHNheXMgYWJvdXQgUE1DOgo+Pgo+PiAiVGhlIFBvd2VyIE1hbmFnZW1lbnQgQ29udHJvbGxlciAo
UE1DKSBibG9jayBpbnRlcmFjdHMgd2l0aCBhbiBleHRlcm5hbAo+PiBvciBQb3dlciBNYW5hZ2Vy
IFVuaXQgKFBNVSkuIFRoZSBQTUMgbW9zdGx5IGNvbnRyb2xzIHRoZSBlbnRyeSBhbmQgZXhpdAo+
PiBvZiB0aGUgc3lzdGVtIGZyb20gZGlmZmVyZW50IHNsZWVwIG1vZGVzLiBJdCBwcm92aWRlcyBw
b3dlci1nYXRpbmcKPj4gY29udHJvbGxlcnMgZm9yIFNPQyBhbmQgQ1BVIHBvd2VyLWlzbGFuZHMg
YW5kIGFsc28gcHJvdmlkZXMgc2NyYXRjaAo+PiBzdG9yYWdlIHRvIHNhdmUgc29tZSBvZiB0aGUg
Y29udGV4dCBkdXJpbmcgc2xlZXAgbW9kZXMgKHdoZW4gQ1BVIGFuZC9vcgo+PiBTT0MgcG93ZXIg
cmFpbHMgYXJlIG9mZikuIEFkZGl0aW9uYWxseSwgUE1DIGludGVyYWN0cyB3aXRoIHRoZSBleHRl
cm5hbAo+PiBQb3dlciBNYW5hZ2VyIFVuaXQgKFBNVSkuIgo+Pgo+PiBUaGUgY29yZSB2b2x0YWdl
IHJlZ3VsYXRvciBpcyBhIHBhcnQgb2YgdGhlIFBNVS4KPj4KPj4gTm90IGFsbCBjb3JlIFNvQyBk
ZXZpY2VzIGFyZSBiZWhpbmQgUE1DLCBJSVVDLgo+IAo+IFRoZXJlIGFyZSB1c3VhbGx5IHNvbWUg
U29DIGRldmljZXMgdGhhdCBhcmUgYWx3YXlzLW9uLiBUaGluZ3MgbGlrZSB0aGUKPiBSVEMgZm9y
IGV4YW1wbGUsIGNhbiBuZXZlciBiZSBwb3dlci1nYXRlZCwgYXMgZmFyIGFzIEkgcmVjYWxsLiBP
biBuZXdlcgo+IGNoaXBzIHRoZXJlIGFyZSB1c3VhbGx5IG1hbnkgbW9yZSBibG9ja3MgdGhhdCBj
YW4ndCBiZSBwb3dlcmdhdGVkIGF0Cj4gYWxsLgoKVGhlIFJUQyBpcyBhY3R1YWxseSBhIHNwZWNp
YWwgcG93ZXIgZG9tYWluIG9uIFRlZ3JhLCBpdCdzIG5vdCBhIHBhcnQgb2YKdGhlIENPUkUgZG9t
YWluLCB0aGV5IGFyZSBzZXBhcmF0ZSBmcm9tIGVhY2ggb3RoZXIuCgpXZSBuZWVkIHRvIGtub3cg
d2hhdCBibG9ja3MgYmVsb25nIHRvIGEgcG93ZXIgZG9tYWluIGFuZCB3aGF0J3MgdGhlCnBvd2Vy
IHRvcG9sb2d5IG9mIHRoZXNlIGJsb2Nrcy4gSSB0aGluayB3ZSBhbHJlYWR5IGhhdmUgdGhpcyBr
bm93bGVkZ2UsCnNvIGl0IHNob3VsZG4ndCBiZSBhIHByb2JsZW0uCgo+Pj4gT24gdGhlIG90aGVy
IGhhbmQsIGlmIHdlIHdlcmUgdG8KPj4+IHVzZSBhIHJlZ3VsYXRvciwgd2UnZCBiZSBhZGRpbmcg
YSBub2RlIGZvciB0aGF0LCByaWdodD8gU28gaXNuJ3QgdGhpcwo+Pj4gZWZmZWN0aXZlbHkgZ29p
bmcgdG8gYmUgdGhlIHNhbWUgbm9kZSBpZiB3ZSB1c2UgYSBwb3dlciBkb21haW4/IEJvdGgKPj4+
IHNvZnR3YXJlIGNvbnN0cnVjdHMgYXJlIHVzaW5nIHRoZSBzYW1lIHZvbHRhZ2UgcmVndWxhdG9y
LCBzbyB0aGV5IHNob3VsZAo+Pj4gYmUgYWJsZSB0byBiZSBkZXNjcmliZWQgYnkgdGhlIHNhbWUg
ZGV2aWNlIHRyZWUgbm9kZSwgc2hvdWxkbid0IHRoZXk/Cj4+Cj4+IEknbSBub3QgZXhhY3RseSBz
dXJlIHdoYXQgeW91J3JlIG1lYW5pbmcgYnkgInVzZSBhIHJlZ3VsYXRvciIgYW5kICJ3ZSdkCj4+
IGJlIGFkZGluZyBhIG5vZGUgZm9yIHRoYXQiLCBjb3VsZCB5b3UgcGxlYXNlIGNsYXJpZnk/IFRo
aXMgdjEgYXBwcm9hY2gKPj4gdXNlcyBhIGNvcmUtc3VwcGx5IHBoYW5kbGUgKGkuZS4gcmVndWxh
dG9yIGlzIHVzZWQpLCBpdCBkb2Vzbid0IHJlcXVpcmUKPj4gZXh0cmEgbm9kZXMuCj4gCj4gV2hh
dCBJIG1lYW50IHRvIHNheSB3YXMgdGhhdCB0aGUgYWN0dWFsIHN1cHBseSB2b2x0YWdlIGlzIGdl
bmVyYXRlZCBieQo+IHNvbWUgZGV2aWNlICh0eXBpY2FsbHkgb25lIG9mIHRoZSBTRCBvdXRwdXRz
IG9mIHRoZSBQTUlDKS4gV2hldGhlciB3ZQo+IG1vZGVsIHRoaXMgYXMgYSBwb3dlciBkb21haW4g
b3IgYSByZWd1bGF0b3IgZG9lc24ndCByZWFsbHkgbWF0dGVyLAo+IHJpZ2h0PyBTbyBJJ20gd29u
ZGVyaW5nIGlmIHRoZSBkZXZpY2UgdGhhdCBnZW5lcmF0ZXMgdGhlIHZvbHRhZ2Ugc2hvdWxkCj4g
YmUgdGhlIHBvd2VyIGRvbWFpbiBwcm92aWRlciwganVzdCBsaWtlIGl0IGlzIHRoZSBwcm92aWRl
ciBvZiB0aGUKPiByZWd1bGF0b3IgaWYgdGhpcyB3YXMgbW9kZWxsZWQgYXMgYSByZWd1bGF0b3Iu
CgpUZWNobmljYWxseSB0aGlzIGNvdWxkIGJlIGRvbmUgYW5kIGl0IHNob3VsZG4ndCBiZSBkaWZm
aWN1bHQgdG8gYWRkCkdFTlBEIHN1cHBvcnQgdG8gdGhlIHJlZ3VsYXRvciBmcmFtZXdvcmssIGJ1
dCBJIHRoaW5rIHRoaXMgaXMgYW4KaW5hY2N1cmF0ZSBoYXJkd2FyZSBkZXNjcmlwdGlvbi4KCkl0
IHNob3VsZG4ndCBiZSBjb3JyZWN0IHRvIGRlc2NyaWJlIGludGVybmFsIFNvQyBwYXJ0cyBhcwpk
aXJlY3RseS1jb25uZWN0ZWQgdG8gYW4gZXh0ZXJuYWwgdm9sdGFnZSByZWd1bGF0b3IuIFRoZSBj
b3JlIHZvbHRhZ2UKcmVndWxhdG9yIGlzIGNvbm5lY3RlZCB0byBhIG9uZSBvZiBzZXZlcmFsIHBv
d2VyIHJhaWxzIG9mIHRoZSBUZWdyYQpjaGlwLiBUaGVyZSBpcyBubyBnb29kIHdheSB0byBkZXNj
cmliZSBoYXJkd2FyZSBpbiB0ZXJtcyBvZiB2b2x0YWdlCnJlZ3VsYXRvcnMsIGhlbmNlIHRoYXQn
cyB3aHkgdGhpcyB2MSBzZXJpZXMgYWRkZWQgYSBjb3JlLXN1cHBseSB0byBlYWNoClNvQyBjb21w
b25lbnQgb2YgZWFjaCBib2FyZCdzIERUIGluZGl2aWR1YWxseS4KCkl0J3MgYWN0dWFsbHkgb25l
IG9mIHRoZSBiZW5lZml0cyBvZiB1c2luZyBhIHNlcGFyYXRlIERUIG5vZGUgZm9yIHRoZQpwb3dl
ci1kb21haW4sIHdoaWNoIGRlc2NyaWJlcyB0aGUgIlRlZ3JhIENvcmUiIHBhcnQgb2YgdGhlIFRl
Z3JhIFNvQywKYW5kIHRodXMsIGl0IGFsbCBzdGF5cyB3aXRoaW4gdGVncmEuZHRzaS4gVGhpcyBt
ZWFucyB0aGF0IFBEIGV4cGxpY2l0bHkKYmVsb25ncyB0byB0aGUgU29DIGludGVybmFscyBpbiBv
cHBvc2UgdG8gZGVzY3JpYmluZyBQRCBsaWtlIGl0J3MgYW4KZXh0ZXJuYWwvb2ZmLWNoaXAgY29t
cG9uZW50LgoKSW5pdGlhbGx5IEkgZGlkbid0IGxpa2UgbXVjaCB0aGF0IHRoZXJlIGlzIG5vIGhh
cmR3YXJlIGFkZHJlc3MgdG8gYmFjawp1cCB0aGUgcG93ZXIgZG9tYWluIG5vZGUgaW4gYSBEVCwg
YnV0IGFjdHVhbGx5IHRoZXJlIGlzIG5vIGFkZHJlc3MgZm9yCnRoZSBwb3dlciByYWlsLiBIZW5j
ZSBpdCBzaG91bGQgYmUgYmV0dGVyIHRvIGRlc2NyaWJlIGhhcmR3YXJlIGJ5CmtlZXBpbmcgUEQg
aW50ZXJuYWxseSB0byB0aGUgU29DLiBOb3RlIHRoYXQgcG90ZW50aWFsbHkgUEQgbWF5IHJlcXVp
cmUKa25vd2xlZGdlIGFib3V0IHNwZWNpZmljcyBvZiBhIHBhcnRpY3VsYXIgU29DLCB3aGlsZSBl
eHRlcm5hbCByZWd1bGF0b3IKZG9lc24ndCBiZWxvbmcgdG8gYSBTb0MuIEFsc28sIEkgZ3Vlc3Mg
dGVjaG5pY2FsbHkgdGhlcmUgY291bGQgYmUKbXVsdGlwbGUgZXh0ZXJuYWwgcmVndWxhdG9ycyB3
aGljaCBwb3dlciBhIHNpbmdsZSBTb0MgcmFpbC4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
