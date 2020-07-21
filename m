Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B311122829D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 16:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED366E59F;
	Tue, 21 Jul 2020 14:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EF66E5A9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 14:47:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g10so2359743wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fNGxz0EZnvsEYVO1d5B3FCu46i18q7LLNyU2Zb0GsXw=;
 b=FZlxfbBzMv/Mv99bS4q6XH2M9JQIzudAk8C+E9ynRtLRrlX+FFqRTkY6dUUJTYVsx9
 MbwQz4rp3eDGY+uDX/JEllnSNunccztui3HhWwSzWhUtXNWe6A578ErRwy6TFgtQbIY6
 wyNiTkrJ9rzJmvTWpye+mu3S49o+qB5+w/hvsS/+u6kdFvsS5aRuDajMVSEkwV+Kk7Sq
 qqLf+fmbamozD6zTBYAHp4OlhWXRl9EO/4rW2H//ctPY7jHXtp0c0q3u6WZzWFqCR06A
 Ns7hAnG9p0XM18hzRwptDvr/Y70R9is31f9lNp2/uqwTiPM9h2XP2U7EWC4/rZObBP1B
 go0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fNGxz0EZnvsEYVO1d5B3FCu46i18q7LLNyU2Zb0GsXw=;
 b=hysX7Bxx3h+VkH2iCECfNbBK61nuB/eQlTS9iDOIteYzdW9Nd69NgukOHHqgP61Wiv
 yOpEz4H98Nf9aWFNIx0fwi6Lwqg9+/lXwWyMaU/WAbDCnUnT5nGf0eemIYTYAV2Rsa2B
 KRkdn7RCIqjMTYc+s5j2OkAOfO85372EHdEMcXV/ikJo35lex3u/jr41eYtjjySCcnLi
 OmgAaNSSRnS40BLtyXYUpLVmX7phEvBHD7o1o3XXuFNlu7wg1mytqAS3eQ45cqa/z91c
 p/semeqZJAltSjk5QE1fBa0eFM6VRXlP78u3aGxkaXdUb0oCGnuO4SlAYLbmIrTSHDsH
 9nSA==
X-Gm-Message-State: AOAM531Jcu/vbvpzvfALgTiaXsFPeQ3hGf5Wa7xhPu4fuhcWS07/vgJr
 N6SiTt84jEZwQe7yQX777anK7Q==
X-Google-Smtp-Source: ABdhPJxElqrmQU4NxdvdqG6pNVbw5C9a920GKqPa8jgL90mmqhRnnOi+UUmFOIFCOVpkQwnSzyvuXg==
X-Received: by 2002:a1c:59c2:: with SMTP id n185mr4607804wmb.104.1595342835775; 
 Tue, 21 Jul 2020 07:47:15 -0700 (PDT)
Received: from dell ([2.27.167.94])
 by smtp.gmail.com with ESMTPSA id y17sm21855229wrh.63.2020.07.21.07.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 07:47:15 -0700 (PDT)
Date: Tue, 21 Jul 2020 15:47:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] backlight: cr_bllcd: Remove unused variable
 'intensity'
Message-ID: <20200721144711.GF621928@dell>
References: <20200721134841.33893-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721134841.33893-1-weiyongjun1@huawei.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hulk Robot <hulkci@huawei.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMSBKdWwgMjAyMCwgV2VpIFlvbmdqdW4gd3JvdGU6Cgo+IEdjYyByZXBvcnQgdW51
c2VkLXZhcmlhYmxlIHdhcm5pbmcgYXMgZm9sbG93czoKPiAKPiBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9jcl9ibGxjZC5jOjYyOjY6IHdhcm5pbmc6Cj4gIHVudXNlZCB2YXJpYWJsZSAnaW50ZW5z
aXR5JyBbLVd1bnVzZWQtdmFyaWFibGVdCj4gICAgNjIgfCAgaW50IGludGVuc2l0eSA9IGJkLT5w
cm9wcy5icmlnaHRuZXNzOwo+ICAgICAgIHwgICAgICBefn5+fn5+fn4KPiAKPiBBZnRlciBjb21t
aXQgMjRkMzQ2MTdjMjRmICgiYmFja2xpZ2h0OiBjcl9ibGxjZDogSW50cm9kdWNlCj4gZ3Bpby1i
YWNrbGlnaHQgc2VtYW50aWNzIiksIHRoaXMgdmFyaWFibGUgaXMgbmV2ZXIgdXNlZCwgdGhpcwo+
IGNvbW1pdCByZW1vdmluZyBpdC4KPiAKPiBGaXhlczogMjRkMzQ2MTdjMjRmICgiYmFja2xpZ2h0
OiBjcl9ibGxjZDogSW50cm9kdWNlIGdwaW8tYmFja2xpZ2h0IHNlbWFudGljcyIpCj4gUmVwb3J0
ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdl
aSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9jcl9ibGxjZC5jIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pCgpUaGFua3MgZm9yIHRoZSBwYXRjaCwgYnV0IHRoaXMgaGFzIGFscmVhZHkgYmVlbiBmaXhl
ZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2NyX2JsbGNkLmMgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9jcl9ibGxjZC5jCj4gaW5kZXggYTI0ZDQyZTFlYTNjLi40
YWQwYTcyNTMxZmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvY3JfYmxs
Y2QuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2NyX2JsbGNkLmMKPiBAQCAtNTks
NyArNTksNiBAQCBzdHJ1Y3QgY3JfcGFuZWwgewo+ICAKPiAgc3RhdGljIGludCBjcl9iYWNrbGln
aHRfc2V0X2ludGVuc2l0eShzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmQpCj4gIHsKPiAtCWlu
dCBpbnRlbnNpdHkgPSBiZC0+cHJvcHMuYnJpZ2h0bmVzczsKPiAgCXUzMiBhZGRyID0gZ3Bpb19i
YXIgKyBDUlZNTF9QQU5FTF9QT1JUOwo+ICAJdTMyIGN1ciA9IGlubChhZGRyKTsKPiAgCj4gCgot
LSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3Bl
ciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNv
Q3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
