Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578D263E81
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80C06E203;
	Thu, 10 Sep 2020 07:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F5F6EB22
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 09:07:49 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w5so2064269wrp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 02:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/jpvCnRB/HY9hnqXXH+ktB0xBbVQklIkg8Ire344+nU=;
 b=c2tPwYEYDjUGLEkoxbELD4SOFyNJ1uMDf3DaMpmr5L23YBmeDVB1C5npwyTPw1WK06
 K1d4QKR4qlTQliBvduKLq2Da7+mSkgWOgS4PyzzE8aiJU+xsaU+eiqtgoaR6avtzKoRD
 LiNJsbWUf9QqrxJn508NGBUukWU9ClLaHdVgooXs7kVn2unNnN49foc5nZ8fr2Ismgdg
 SlJerKYGYASYXzTNWxpZ3vT7CvRVs78SuZu7bwcQNWpA1PbEYpkgUUi/5ybXsnsRVkrh
 fZGE/PXHTi5frPG3Fy5g/ACszH2OmOmCKMNKwxhh4cPjColZrnT2aZwXvzMn1qEkeV29
 HDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/jpvCnRB/HY9hnqXXH+ktB0xBbVQklIkg8Ire344+nU=;
 b=RlMYR26BBjdpS+5orAosQkBgOKETZZEVEi0DMXoCDu1faXmqkl9NrAYXBe5Dc+51fd
 +icA84Q4gcn7qj+jFVzA33XI5QrmrdlnNiKj08EXTkL0UIvhnajniTOz4O2AyecivJs8
 ULjXwOVd47SaHUeXvI5XIpc7C2fVaMnSoi0iGjiO1bJ96er452l1SqgPw5oxFCJJlvNN
 3S5N1L7wKPHLqdzvs/Aa/uCE5Qr+tINk1PLvOm15aUe3baMuSM10f8D3YsjZx3dH1Lts
 1nKg+Iv7sGvkgmEuOeC4gXbXBiYuTuaCrOutT2hnDZP6BUme4iZZGd0y7BxIUq8UELrq
 /S1A==
X-Gm-Message-State: AOAM533y44sJPxzoJi3HrtkGt7lxtkynS9JWaH17wn9g63ecdif09msN
 AAXWUj7Tf9PDywKnFi286hAO8AN7CWYUNw==
X-Google-Smtp-Source: ABdhPJwdL1SulUvOGytNTBBIIfnQR9CTiQxJ7ytzerFaEVPi8TWrlKtJMKE9CkIsFMUJ4V/0NIyKaQ==
X-Received: by 2002:adf:f24d:: with SMTP id b13mr2750980wrp.316.1599642468243; 
 Wed, 09 Sep 2020 02:07:48 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id b11sm3196985wrt.38.2020.09.09.02.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 02:07:47 -0700 (PDT)
Subject: Re: [PATCH RFC v6 1/6] dt-bindings: exynos-bus: Add documentation for
 interconnect properties
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh@kernel.org>
References: <20200702163724.2218-1-s.nawrocki@samsung.com>
 <CGME20200702163748eucas1p2cf7eab70bc072dea9a95183018b38ad3@eucas1p2.samsung.com>
 <20200702163724.2218-2-s.nawrocki@samsung.com>
 <20200709210448.GA876103@bogus>
 <65af1a5c-8f8a-ef65-07f8-e0b3d04c336c@samsung.com>
 <35d9d396-b553-a815-1f3b-1af4dc37a2ca@samsung.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 xsFNBFjTuRcBEACyAOVzghvyN19Sa/Nit4LPBWkICi5W20p6bwiZvdjhtuh50H5q4ktyxJtp
 1+s8dMSa/j58hAWhrc2SNL3fttOCo+MM1bQWwe8uMBQJP4swgXf5ZUYkSssQlXxGKqBSbWLB
 uFHOOBTzaQBaNgsdXo+mQ1h8UCgM0zQOmbs2ort8aHnH2i65oLs5/Xgv/Qivde/FcFtvEFaL
 0TZ7odM67u+M32VetH5nBVPESmnEDjRBPw/DOPhFBPXtal53ZFiiRr6Bm1qKVu3dOEYXHHDt
 nF13gB+vBZ6x5pjl02NUEucSHQiuCc2Aaavo6xnuBc3lnd4z/xk6GLBqFP3P/eJ56eJv4d0B
 0LLgQ7c1T3fU4/5NDRRCnyk6HJ5+HSxD4KVuluj0jnXW4CKzFkKaTxOp7jE6ZD/9Sh74DM8v
 etN8uwDjtYsM07I3Szlh/I+iThxe/4zVtUQsvgXjwuoOOBWWc4m4KKg+W4zm8bSCqrd1DUgL
 f67WiEZgvN7tPXEzi84zT1PiUOM98dOnmREIamSpKOKFereIrKX2IcnZn8jyycE12zMkk+Sc
 ASMfXhfywB0tXRNmzsywdxQFcJ6jblPNxscnGMh2VlY2rezmqJdcK4G4Lprkc0jOHotV/6oJ
 mj9h95Ouvbq5TDHx+ERn8uytPygDBR67kNHs18LkvrEex/Z1cQARAQABzShHZW9yZ2kgRGph
 a292IDxnZW9yZ2kuZGpha292QGxpbmFyby5vcmc+wsF+BBMBAgAoBQJY07kXAhsDBQkHhM4A
 BgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyi/eZcnWWUuvsD/4miikUeAO6fU2Xy3fT
 l7RUCeb2Uuh1/nxYoE1vtXcow6SyAvIVTD32kHXucJJfYy2zFzptWpvD6Sa0Sc58qe4iLY4j
 M54ugOYK7XeRKkQHFqqR2T3g/toVG1BOLS2atooXEU+8OFbpLkBXbIdItqJ1M1SEw8YgKmmr
 JlLAaKMq3hMb5bDQx9erq7PqEKOB/Va0nNu17IL58q+Q5Om7S1x54Oj6LiG/9kNOxQTklOQZ
 t61oW1Ewjbl325fW0/Lk0QzmfLCrmGXXiedFEMRLCJbVImXVKdIt/Ubk6SAAUrA5dFVNBzm2
 L8r+HxJcfDeEpdOZJzuwRyFnH96u1Xz+7X2V26zMU6Wl2+lhvr2Tj7spxjppR+nuFiybQq7k
 MIwyEF0mb75RLhW33sdGStCZ/nBsXIGAUS7OBj+a5fm47vQKv6ekg60oRTHWysFSJm1mlRyq
 exhI6GwUo5GM/vE36rIPSJFRRgkt6nynoba/1c4VXxfhok2rkP0x3CApJ5RimbvITTnINY0o
 CU6f1ng1I0A1UTi2YcLjFq/gmCdOHExT4huywfu1DDf0p1xDyPA1FJaii/gJ32bBP3zK53hM
 dj5S7miqN7F6ZpvGSGXgahQzkGyYpBR5pda0m0k8drV2IQn+0W8Qwh4XZ6/YdfI81+xyFlXc
 CJjljqsMCJW6PdgEH87BTQRY07kXARAAvupGd4Jdd8zRRiF+jMpv6ZGz8L55Di1fl1YRth6m
 lIxYTLwGf0/p0oDLIRldKswena3fbWh5bbTMkJmRiOQ/hffhPSNSyyh+WQeLY2kzl6geiHxD
 zbw37e2hd3rWAEfVFEXOLnmenaUeJFyhA3Wd8OLdRMuoV+RaLhNfeHctiEn1YGy2gLCq4VNb
 4Wj5hEzABGO7+LZ14hdw3hJIEGKtQC65Jh/vTayGD+qdwedhINnIqslk9tCQ33a+jPrCjXLW
 X29rcgqigzsLHH7iVHWA9R5Aq7pCy5hSFsl4NBn1uV6UHlyOBUuiHBDVwTIAUnZ4S8EQiwgv
 WQxEkXEWLM850V+G6R593yZndTr3yydPgYv0xEDACd6GcNLR/x8mawmHKzNmnRJoOh6Rkfw2
 fSiVGesGo83+iYq0NZASrXHAjWgtZXO1YwjW9gCQ2jYu9RGuQM8zIPY1VDpQ6wJtjO/KaOLm
 NehSR2R6tgBJK7XD9it79LdbPKDKoFSqxaAvXwWgXBj0Oz+Y0BqfClnAbxx3kYlSwfPHDFYc
 R/ppSgnbR5j0Rjz/N6Lua3S42MDhQGoTlVkgAi1btbdV3qpFE6jglJsJUDlqnEnwf03EgjdJ
 6KEh0z57lyVcy5F/EUKfTAMZweBnkPo+BF2LBYn3Qd+CS6haZAWaG7vzVJu4W/mPQzsAEQEA
 AcLBZQQYAQIADwUCWNO5FwIbDAUJB4TOAAAKCRCyi/eZcnWWUhlHD/0VE/2x6lKh2FGP+QHH
 UTKmiiwtMurYKJsSJlQx0T+j/1f+zYkY3MDX+gXa0d0xb4eFv8WNlEjkcpSPFr+pQ7CiAI33
 99kAVMQEip/MwoTYvM9NXSMTpyRJ/asnLeqa0WU6l6Z9mQ41lLzPFBAJ21/ddT4xeBDv0dxM
 GqaH2C6bSnJkhSfSja9OxBe+F6LIAZgCFzlogbmSWmUdLBg+sh3K6aiBDAdZPUMvGHzHK3fj
 gHK4GqGCFK76bFrHQYgiBOrcR4GDklj4Gk9osIfdXIAkBvRGw8zg1zzUYwMYk+A6v40gBn00
 OOB13qJe9zyKpReWMAhg7BYPBKIm/qSr82aIQc4+FlDX2Ot6T/4tGUDr9MAHaBKFtVyIqXBO
 xOf0vQEokkUGRKWBE0uA3zFVRfLiT6NUjDQ0vdphTnsdA7h01MliZLQ2lLL2Mt5lsqU+6sup
 Tfql1omgEpjnFsPsyFebzcKGbdEr6vySGa3Cof+miX06hQXKe99a5+eHNhtZJcMAIO89wZmj
 7ayYJIXFqjl/X0KBcCbiAl4vbdBw1bqFnO4zd1lMXKVoa29UHqby4MPbQhjWNVv9kqp8A39+
 E9xw890l1xdERkjVKX6IEJu2hf7X3MMl9tOjBK6MvdOUxvh1bNNmXh7OlBL1MpJYY/ydIm3B
 KEmKjLDvB0pePJkdTw==
Message-ID: <b711257d-c34b-b609-3ada-312871967b98@linaro.org>
Date: Wed, 9 Sep 2020 12:07:46 +0300
MIME-Version: 1.0
In-Reply-To: <35d9d396-b553-a815-1f3b-1af4dc37a2ca@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, krzk@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3lsd2VzdGVyLAoKT24gOC8yOC8yMCAxNzo0OSwgU3lsd2VzdGVyIE5hd3JvY2tpIHdyb3Rl
Ogo+IE9uIDMwLjA3LjIwMjAgMTQ6MjgsIFN5bHdlc3RlciBOYXdyb2NraSB3cm90ZToKPj4gT24g
MDkuMDcuMjAyMCAyMzowNCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+PiBPbiBUaHUsIEp1bCAwMiwg
MjAyMCBhdCAwNjozNzoxOVBNICswMjAwLCBTeWx3ZXN0ZXIgTmF3cm9ja2kgd3JvdGU6Cj4+Pj4g
QWRkIGRvY3VtZW50YXRpb24gZm9yIG5ldyBvcHRpb25hbCBwcm9wZXJ0aWVzIGluIHRoZSBleHlu
b3MgYnVzIG5vZGVzOgo+Pj4+IHNhbXN1bmcsaW50ZXJjb25uZWN0LXBhcmVudCwgI2ludGVyY29u
bmVjdC1jZWxscywgYnVzLXdpZHRoLgo+Pj4+IFRoZXNlIHByb3BlcnRpZXMgYWxsb3cgdG8gc3Bl
Y2lmeSB0aGUgU29DIGludGVyY29ubmVjdCBzdHJ1Y3R1cmUgd2hpY2gKPj4+PiB0aGVuIGFsbG93
cyB0aGUgaW50ZXJjb25uZWN0IGNvbnN1bWVyIGRldmljZXMgdG8gcmVxdWVzdCBzcGVjaWZpYwo+
Pj4+IGJhbmR3aWR0aCByZXF1aXJlbWVudHMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBcnR1
ciDFmndpZ2/FhCA8YS5zd2lnb25Ac2Ftc3VuZy5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogU3ls
d2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgo+IAo+Pj4+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kZXZmcmVxL2V4eW5vcy1idXMudHh0Cj4+
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RldmZyZXEvZXh5bm9z
LWJ1cy50eHQKPj4+PiBAQCAtNTEsNiArNTEsMTMgQEAgT3B0aW9uYWwgcHJvcGVydGllcyBvbmx5
IGZvciBwYXJlbnQgYnVzIGRldmljZToKPj4+PiAgLSBleHlub3Msc2F0dXJhdGlvbi1yYXRpbzog
dGhlIHBlcmNlbnRhZ2UgdmFsdWUgd2hpY2ggaXMgdXNlZCB0byBjYWxpYnJhdGUKPj4+PiAgCQkJ
dGhlIHBlcmZvcm1hbmNlIGNvdW50IGFnYWluc3QgdG90YWwgY3ljbGUgY291bnQuCj4+Pj4gIAo+
Pj4+ICtPcHRpb25hbCBwcm9wZXJ0aWVzIGZvciBpbnRlcmNvbm5lY3QgZnVuY3Rpb25hbGl0eSAo
UW9TIGZyZXF1ZW5jeSBjb25zdHJhaW50cyk6Cj4+Pj4gKy0gc2Ftc3VuZyxpbnRlcmNvbm5lY3Qt
cGFyZW50OiBwaGFuZGxlIHRvIHRoZSBwYXJlbnQgaW50ZXJjb25uZWN0IG5vZGU7IGZvcgo+Pj4+
ICsgIHBhc3NpdmUgZGV2aWNlcyBzaG91bGQgcG9pbnQgdG8gc2FtZSBub2RlIGFzIHRoZSBleHlu
b3MscGFyZW50LWJ1cyBwcm9wZXJ0eS4KPiAKPj4+IEFkZGluZyB2ZW5kb3Igc3BlY2lmaWMgcHJv
cGVydGllcyBmb3IgYSBjb21tb24gYmluZGluZyBkZWZlYXRzIHRoZSAKPj4+IHBvaW50Lgo+IAo+
IEFjdHVhbGx5IHdlIGNvdWxkIGRvIHdpdGhvdXQgYW55IG5ldyBwcm9wZXJ0eSBpZiB3ZSB1c2Vk
IGV4aXN0aW5nIGludGVyY29ubmVjdAo+IGNvbnN1bWVycyBiaW5kaW5nIHRvIHNwZWNpZnkgbGlu
a2luZyBiZXR3ZWVuIHRoZSBwcm92aWRlciBub2Rlcy4gSSB0aGluayB0aG9zZQo+IGV4eW5vcy1i
dXMgbm9kZXMgY291bGQgd2VsbCBiZSBjb25zaWRlcmVkIGJvdGggdGhlIGludGVyY29ubmVjdCBw
cm92aWRlcnMgCj4gYW5kIGNvbnN1bWVycy4gVGhlIGV4YW1wbGUgd291bGQgdGhlbiBiZSBzb21l
dGhpbmcgYWxvbmcgdGhlIGxpbmVzIAo+ICh5ZXMsIEkga25vdyB0aGUgYnVzIG5vZGUgbmFtaW5n
IG5lZWRzIHRvIGJlIGZpeGVkKToKPiAKPiAJc29jIHsKPiAJCWJ1c19kbWM6IGJ1c19kbWMgewo+
IAkJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3MtYnVzIjsKPiAJCQkvKiAuLi4gKi8KPiAJ
CQlzYW1zdW5nLGRhdGEtY2xvY2stcmF0aW8gPSA8ND47Cj4gCQkJI2ludGVyY29ubmVjdC1jZWxs
cyA9IDwwPjsKPiAJCX07Cj4gCj4gCQlidXNfbGVmdGJ1czogYnVzX2xlZnRidXMgewo+IAkJCWNv
bXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3MtYnVzIjsKPiAJCQkvKiAuLi4gKi8KPiAJCQlpbnRl
cmNvbm5lY3RzID0gPCZidXNfbGVmdGJ1cyAmYnVzX2RtYz47Cj4gCQkJI2ludGVyY29ubmVjdC1j
ZWxscyA9IDwwPjsKPiAJCX07Cj4gCj4gCQlidXNfZGlzcGxheTogYnVzX2Rpc3BsYXkgewo+IAkJ
CWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3MtYnVzIjsKPiAJCQkvKiAuLi4gKi8KPiAJCQlp
bnRlcmNvbm5lY3RzID0gPCZidXNfZGlzcGxheSAmYnVzX2xlZnRidXM+OwoKSG1tLCBidXNfZGlz
cGxheSBiZWluZyBhIGNvbnN1bWVyIG9mIGl0c2VsZiBpcyBhIGJpdCBvZGQ/IERpZCB5b3UgbWVh
bjoKIAkJCWludGVyY29ubmVjdHMgPSA8JmJ1c19kbWMgJmJ1c19sZWZ0YnVzPjsKCj4gCQkJI2lu
dGVyY29ubmVjdC1jZWxscyA9IDwwPjsKPiAJCX07Cj4gCj4gCj4gCQkmbWl4ZXIgewo+IAkJCWNv
bXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M0MjEyLW1peGVyIjsKPiAJCQlpbnRlcmNvbm5lY3Rz
ID0gPCZidXNfZGlzcGxheSAmYnVzX2RtYz47Cj4gCQkJLyogLi4uICovCj4gCQl9Owo+IAl9Owo+
IAo+IFdoYXQgZG8geW91IHRoaW5rLCBHZW9yZ2ksIFJvYj8KCkkgY2FuJ3QgdW5kZXJzdGFuZCB0
aGUgYWJvdmUgZXhhbXBsZSB3aXRoIGJ1c19kaXNwbGF5IGJlaW5nIGl0J3Mgb3duIGNvbnN1bWVy
LgpUaGlzIHNlZW1zIHN0cmFuZ2UgdG8gbWUuIENvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSBpdD8K
Ck90aGVyd2lzZSB0aGUgaW50ZXJjb25uZWN0IGNvbnN1bWVyIERUIGJpbmRpbmdzIGFyZSBhbHJl
YWR5IHdlbGwgZXN0YWJsaXNoZWQKYW5kIGkgZG9uJ3Qgc2VlIGFueXRoaW5nIHByZXZlbnRpbmcg
YSBub2RlIHRvIGJlIGJvdGggY29uc3VtZXIgYW5kIHByb3ZpZGVyLgpTbyB0aGlzIHNob3VsZCBi
ZSBva2F5IGluIGdlbmVyYWwuCgpUaGFua3MsCkdlb3JnaQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
