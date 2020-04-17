Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A221AEB4F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA82C6EC7D;
	Sat, 18 Apr 2020 09:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB8E6E418
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 20:11:09 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q19so3316717ljp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RVG2bKmbZ4y9wY5cq2XdNLer07BD29fUHuKQ45NDSP0=;
 b=S/zofisQw2cmUFHpL7bYDOmobITWYxKGamznmFa0uubA0LcW/U6BVDwgaVzg9yrt6y
 y3nUTBHDb0qYn8Gk9DxPea1JKpgsQ9vU8j1Owx8MFLSpjhAA2JO0GNZw1JmkTlB+vcN+
 GhL+sdBO02q4u1r8kOoFPG6PM0BLNG0PK2gONOe92zN3Y8MZKw2CEz/GHSmoYWEXX1Tv
 H2rcyV4Sf6QKx+P8cqJfeVNfc6RPL/J8Jo1uazsuchCAwWyJyXnycANw2+Kv11BjaobM
 Vt1HnIkRz0s/+8YV/BXigazViRgOHwbVmCqb1oDckvEmi3vMtdiGYDRlvYDdMOo04AB9
 LPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RVG2bKmbZ4y9wY5cq2XdNLer07BD29fUHuKQ45NDSP0=;
 b=o3hKV1ZKVteGROX7MMGFj9HSM92BImqpsnq8PKKnGDZRk0oQPQVgHWyHKZuumVXILx
 SXgkRhfmkmYiD6lvcYSKQ7Wa9RLH9iuLXZpOAfJfP2olFIzCSLPzqYQopUzfWFmePvQg
 caEqSr4yJ5DtrhTlYhjh5q7m2HkEOi5yvpLFo8K3odfxcwIE9XODJ6UG4IqA7w++UZhN
 rnUUUeuUS7TnceauqqiY7qKFOKUPYA73RJlEtpN6WTZNV1pCx9T6pVF3h/FV0+XP1Nr9
 eq06MJbDuYEsK8QTsn5GCzAP23xJs9i7z31GIT44YG8IapTwp1SfV9dkpgjSsHOsoMU0
 DNyQ==
X-Gm-Message-State: AGi0PuayUFJ4DJmNB99hOEmj0UtxdCwl6YY3aTqs2xyFMl67DqLvb/IE
 OjYdbzaUA44DmboXzShfFog=
X-Google-Smtp-Source: APiQypL4LNbI4XRYGODAnuFJGu0VoHlcf0AIln/JkBVq4xUbETkYhCEa4zCxa6ssSicKvX1V1GpZLw==
X-Received: by 2002:a05:651c:39b:: with SMTP id
 e27mr3323167ljp.45.1587154268305; 
 Fri, 17 Apr 2020 13:11:08 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id z15sm15881502ljk.99.2020.04.17.13.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 13:11:07 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] drm/tegra: output: rgb: Support LVDS encoder bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-4-digetx@gmail.com>
 <20200417192453.GH5861@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <598c81ef-ba22-a832-0822-e08023f3dff6@gmail.com>
Date: Fri, 17 Apr 2020 23:11:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417192453.GH5861@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: linux-tegra@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMDQuMjAyMCAyMjoyNCwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgouLi4KPiBBcyBJ
IHRyaWVkIHRvIGV4cGxhaW4gYmVmb3JlLCBpZiB5b3Ugd3JhcCB0aGUgcGFuZWwgaW4gYSBicmlk
Z2Ugd2l0aAo+IGRybV9wYW5lbF9icmlkZ2VfYWRkKCkgKG9yIHRoZSBkZXZtXyB2YXJpYW50KSwg
eW91IHdpbGwgYWx3YXlzIGhhdmUgYQo+IGJyaWRnZSBhc3NvY2lhdGVkIHdpdGggdGhlIG91dHB1
dCwgYW5kIHdpbGwgYmUgYWJsZSB0byByZW1vdmUgeW91cgo+IGN1c3RvbSBjb25uZWN0b3IgaW1w
bGVtZW50YXRpb24uIEkgdGh1cyByZWNvbW1lbmQgY29udmVydGluZyB0bwo+IGRybV9wYW5lbF9i
cmlkZ2VfYWRkKCkgZWl0aGVyIGFzIHBhcnQgb2YgdGhpcyBwYXRjaCBzZXJpZXMsIG9yIGp1c3QK
PiBhZnRlciBpdCwgdG8gZ2V0IGZ1bGwgYmVuZWZpdHMuCj4gCj4gV2l0aCB0aGUgYXNzdW1wdGlv
biB0aGF0IHRoaXMgd2lsbCBiZSBoYW5kbGVkLAo+IAo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgpUaGFua3MgeW91IHZl
cnkgbXVjaCEKClllcywgSSBnb3QgeW91cnMgcG9pbnQgYWJvdXQgd3JhcHBpbmcgcGFuZWwgaW50
byB0aGUgYnJpZGdlLiBCdXQgSSBkb24ndAp0aGluayB0aGF0IGl0J3Mgd29ydGggdGhlIGVmZm9y
dCByaWdodCBub3cgYmVjYXVzZSBlYWNoIFRlZ3JhIG91dHB1dCBoYXMKaXQncyBvd24gaW1wbGFu
dGF0aW9uIG9mIHRoZSBjb25uZWN0b3IgYW5kIGl0IHNob3VsZCBiZSBjbGVhbmVyIG5vdCB0bwp0
b3VjaCB0aGF0IGNvZGUuCgpTZWNvbmRseSwgSSBkb24ndCBoYXZlIGhhcmR3YXJlIHRvIHRlc3Qg
YWxsIGF2YWlsYWJsZSBwYW5lbCBvdXRwdXQgdHlwZXMKb24gVGVncmEgYW5kIHRoZSBiZW5lZml0
cyBvZiBtZXNzaW5nIHdpdGggYWxsIHRoYXQgY29kZSBhcmUgYSBiaXQgZGltIHRvIG1lLgoKSSBj
YW4gbWFrZSBhIHBhdGNoIHRvIHdyYXAgdGhlIFJHQiBwYW5lbCBpbnRvIGEgYnJpZGdlLCBidXQg
dGhpcyBzaG91bGQKbWFrZSBjb2RlIGEgYml0IGluY29uc2lzdGVudCBpbiByZWdhcmRzIHRvIG5v
dCBoYXZpbmcgYSBjb21tb24gY29kZSBwYXRoCmZvciB0aGUgImxlZ2FjeSIgbnZpZGlhLHBhbmVs
LiBTbyBwZXJoYXBzIGl0J3MgYmV0dGVyIHRvIGxlYXZlIGl0IGFsbAphcy1pcyBmb3Igbm93Lgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
