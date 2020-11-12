Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2862B1763
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDA16E480;
	Fri, 13 Nov 2020 08:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D4A6E12B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 22:14:49 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j205so10843902lfj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 14:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6I7BUpsnPeFRDPSie+hImwdRFU/lPQPc9b4Pu6iDC2E=;
 b=rTk36LmZQcm5DdyOg9CK1Elk91TFk0T8lyUlO9RxBsp5ITaOWlFWcg3AV0rTW9G7Fl
 B6TACsnPLGb34KzxDAUE5JNpA8rKCiIYmwnsooKuQ5CJPenNHaDkySPSIz0N4dA2mLC2
 ceGHtL+0omSK/rfvc/iBFGMPW7YFmDKVdtwAqouRvCKmxOe0YX6rh655e/OEj8aNiO7i
 2TnSG5M0WfSwHXJLwfwFsxeQVYZO/NoD6krHxrPimFlpUvEHQ0Flcj2/UVNE7RA8OKWv
 F5nTBOfRpIsNskD3f1jdTo1Fs37JxPEI37HHCcMNOqLF/lrAhV14qvEdFLt3uc4uef0i
 siZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6I7BUpsnPeFRDPSie+hImwdRFU/lPQPc9b4Pu6iDC2E=;
 b=KFAFYMUXdTppZxqur16Vk8jNauoqe5vKDPN2nUzJzV9TUgsk2N4Hnrxj9T+1iMHqxO
 yQ8mDLF5rHb8gZbZjmc9YTt0LQz22ehi+eWVT4MmN85ZZEYJJm0w+VN6dtVrboQ3rsiC
 zHOEFUExgwgpR78OIgmyLqkEYSCP6m0/jKSu44J7Yw0PVKP6fj3Q7W2vd+ak4EfB4qNO
 fwQeTj+z01xxGtgi8bEuNAGO7w2cua1SaoNO0pvWxXb1mcKwS41xGhkN2bHyldVKdxls
 vKJ6xLgbIrRIdwEFVKt1pj4aiKeFSh6pODqsaiCYw9WOb0hAB0h80DsJ2ABzEqTiitA5
 9I6w==
X-Gm-Message-State: AOAM533Aawi/XMg1X/BZlW5mDHCYisgP2XMPFKXPRrNutaiJXMgFoWkL
 +xHeEGQgbahGriF+mblr+ps=
X-Google-Smtp-Source: ABdhPJyBaFcKp4/EPF+acP6+aR+EtI8BnydIDUm/bvPzHQQAYMYoVmfy0wH61huOt4WJ1kuffSiKGA==
X-Received: by 2002:a19:7108:: with SMTP id m8mr661367lfc.246.1605219287612;
 Thu, 12 Nov 2020 14:14:47 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id z200sm968935lfc.189.2020.11.12.14.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 14:14:46 -0800 (PST)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <25942da9-b527-c0aa-5403-53c9cc34ad93@gmail.com>
Date: Fri, 13 Nov 2020 01:14:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201112204358.GA1027187@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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

MTIuMTEuMjAyMCAyMzo0MywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4gVGhlIGRpZmZl
cmVuY2UgaW4gY29tcGFyaXNvbiB0byB1c2luZyB2b2x0YWdlIHJlZ3VsYXRvciBkaXJlY3RseSBp
cwo+PiBtaW5pbWFsLCBiYXNpY2FsbHkgdGhlIGNvcmUtc3VwcGx5IHBoYW5kbGUgaXMgcmVwbGFj
ZWQgaXMgcmVwbGFjZWQgd2l0aAo+PiBhIHBvd2VyLWRvbWFpbiBwaGFuZGxlIGluIGEgZGV2aWNl
IHRyZWUuCj4gVGhlc2UgbmV3IHBvd2VyLWRvbWFpbiBoYW5kbGVzIHdvdWxkIGhhdmUgdG8gYmUg
YWRkZWQgdG8gZGV2aWNlcyB0aGF0Cj4gcG90ZW50aWFsbHkgYWxyZWFkeSBoYXZlIGEgcG93ZXIt
ZG9tYWluIGhhbmRsZSwgcmlnaHQ/IElzbid0IHRoYXQgZ29pbmcKPiB0byBjYXVzZSBpc3N1ZXM/
IEkgdmFndWVseSByZWNhbGwgdGhhdCB3ZSBhbHJlYWR5IGhhdmUgbXVsdGlwbGUgcG93ZXIKPiBk
b21haW5zIGZvciB0aGUgWFVTQiBjb250cm9sbGVyIGFuZCB3ZSBoYXZlIHRvIGp1bXAgdGhyb3Vn
aCBleHRyYSBob29wcwo+IHRvIG1ha2UgdGhhdCB3b3JrLgoKSSBtb2RlbGVkIHRoZSBjb3JlIFBE
IGFzIGEgcGFyZW50IG9mIHRoZSBQTUMgc3ViLWRvbWFpbnMsIHdoaWNoCnByZXN1bWFibHkgaXMg
YSBjb3JyZWN0IHdheSB0byByZXByZXNlbnQgdGhlIGRvbWFpbnMgdG9wb2xvZ3kuCgpodHRwczov
L2dpc3QuZ2l0aHViLmNvbS9kaWdldHgvZGZkOTJjN2Y3ZTBhYTZjZWYyMDQwM2M0Mjk4MDg4ZDcK
Cj4+IFRoZSBvbmx5IHRoaW5nIHdoaWNoIG1ha2VzIG1lIGZlZWwgYSBiaXQgdW5jb21mb3J0YWJs
ZSBpcyB0aGF0IHRoZXJlIGlzCj4+IG5vIHJlYWwgaGFyZHdhcmUgbm9kZSBmb3IgdGhlIHBvd2Vy
IGRvbWFpbiBub2RlIGluIGEgZGV2aWNlLXRyZWUuCj4gQ291bGQgd2UgYW5jaG9yIHRoZSBuZXcg
cG93ZXIgZG9tYWluIGF0IHRoZSBQTUMgZm9yIGV4YW1wbGU/IFRoYXQgd291bGQKPiBhbGxvdyB1
cyB0byBhdm9pZCB0aGUgInZpcnR1YWwiIG5vZGUuCgpJIGhhZCBhIHRob3VnaHQgYWJvdXQgdXNp
bmcgUE1DIGZvciB0aGUgY29yZSBkb21haW4sIGJ1dCBub3Qgc3VyZQp3aGV0aGVyIGl0IHdpbGwg
YmUgYW4gZW50aXJlbHkgY29ycmVjdCBoYXJkd2FyZSBkZXNjcmlwdGlvbi4gQWx0aG91Z2gsCml0
IHdpbGwgYmUgbmljZSB0byBoYXZlIGl0IHRoaXMgd2F5LgoKVGhpcyBpcyB3aGF0IFRlZ3JhIFRS
TSBzYXlzIGFib3V0IFBNQzoKCiJUaGUgUG93ZXIgTWFuYWdlbWVudCBDb250cm9sbGVyIChQTUMp
IGJsb2NrIGludGVyYWN0cyB3aXRoIGFuIGV4dGVybmFsCm9yIFBvd2VyIE1hbmFnZXIgVW5pdCAo
UE1VKS4gVGhlIFBNQyBtb3N0bHkgY29udHJvbHMgdGhlIGVudHJ5IGFuZCBleGl0Cm9mIHRoZSBz
eXN0ZW0gZnJvbSBkaWZmZXJlbnQgc2xlZXAgbW9kZXMuIEl0IHByb3ZpZGVzIHBvd2VyLWdhdGlu
Zwpjb250cm9sbGVycyBmb3IgU09DIGFuZCBDUFUgcG93ZXItaXNsYW5kcyBhbmQgYWxzbyBwcm92
aWRlcyBzY3JhdGNoCnN0b3JhZ2UgdG8gc2F2ZSBzb21lIG9mIHRoZSBjb250ZXh0IGR1cmluZyBz
bGVlcCBtb2RlcyAod2hlbiBDUFUgYW5kL29yClNPQyBwb3dlciByYWlscyBhcmUgb2ZmKS4gQWRk
aXRpb25hbGx5LCBQTUMgaW50ZXJhY3RzIHdpdGggdGhlIGV4dGVybmFsClBvd2VyIE1hbmFnZXIg
VW5pdCAoUE1VKS4iCgpUaGUgY29yZSB2b2x0YWdlIHJlZ3VsYXRvciBpcyBhIHBhcnQgb2YgdGhl
IFBNVS4KCk5vdCBhbGwgY29yZSBTb0MgZGV2aWNlcyBhcmUgYmVoaW5kIFBNQywgSUlVQy4KCj4g
T24gdGhlIG90aGVyIGhhbmQsIGlmIHdlIHdlcmUgdG8KPiB1c2UgYSByZWd1bGF0b3IsIHdlJ2Qg
YmUgYWRkaW5nIGEgbm9kZSBmb3IgdGhhdCwgcmlnaHQ/IFNvIGlzbid0IHRoaXMKPiBlZmZlY3Rp
dmVseSBnb2luZyB0byBiZSB0aGUgc2FtZSBub2RlIGlmIHdlIHVzZSBhIHBvd2VyIGRvbWFpbj8g
Qm90aAo+IHNvZnR3YXJlIGNvbnN0cnVjdHMgYXJlIHVzaW5nIHRoZSBzYW1lIHZvbHRhZ2UgcmVn
dWxhdG9yLCBzbyB0aGV5IHNob3VsZAo+IGJlIGFibGUgdG8gYmUgZGVzY3JpYmVkIGJ5IHRoZSBz
YW1lIGRldmljZSB0cmVlIG5vZGUsIHNob3VsZG4ndCB0aGV5PwoKSSdtIG5vdCBleGFjdGx5IHN1
cmUgd2hhdCB5b3UncmUgbWVhbmluZyBieSAidXNlIGEgcmVndWxhdG9yIiBhbmQgIndlJ2QKYmUg
YWRkaW5nIGEgbm9kZSBmb3IgdGhhdCIsIGNvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeT8gVGhpcyB2
MSBhcHByb2FjaAp1c2VzIGEgY29yZS1zdXBwbHkgcGhhbmRsZSAoaS5lLiByZWd1bGF0b3IgaXMg
dXNlZCksIGl0IGRvZXNuJ3QgcmVxdWlyZQpleHRyYSBub2Rlcy4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
