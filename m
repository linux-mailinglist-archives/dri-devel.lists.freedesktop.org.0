Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B4A14526
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878218926F;
	Mon,  6 May 2019 07:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8912189209
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 16:46:21 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id q185so8588865ywe.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2019 09:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x0ZvxGqKqkQis3eWKYukVDy0+4WkHGdposYeRQupFOw=;
 b=nI6q1blSMm3PTsF4N55zvCDVGUHl2D6kEKg/1dVtL+c2qD/CKPe9hXPGaq6SzKX8qI
 1RgXAo4aQKRcJkjvBW2JrY95acQ1UPEejy9D+CQjcKLUTh/mkGZsQuEYYiNFf9STcOeO
 qla2TmJXxhFCWJchB6i3vW+tHamIwsqcFfPJotYk8bz84wYYUnRtJu0UoAen8KV92Fot
 LaeUWwpDa4yghN0rC3iq+NsSkN7DCnTg+JbvjvKhF3UvaouK/+Mb6h/ekhASC9rE3xVa
 n0t+7HIUeBtda6Ehf1uY4WrrCopXFjtM8uHfMjWvrD6CMQx0esVBiX1W/AImftZmCAr0
 zjug==
X-Gm-Message-State: APjAAAVAEOSB29QG5WvQl83o4pntL76dHMQShntk2xsa8V2Gc6RxgFPl
 feWOUt9cKXzxv6jRZ1IKzxCTKw==
X-Google-Smtp-Source: APXvYqybXNSwDNcFaB8gd59q1/W0RHGbNpaxJftPOFeS7R/uocxtpki3475mBso+BoU9TxvSbEqMCw==
X-Received: by 2002:a81:9286:: with SMTP id j128mr13469693ywg.97.1557074780306; 
 Sun, 05 May 2019 09:46:20 -0700 (PDT)
Received: from localhost (adsl-173-228-226-134.prtc.net. [173.228.226.134])
 by smtp.gmail.com with ESMTPSA id 202sm2517705ywt.72.2019.05.05.09.46.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 05 May 2019 09:46:19 -0700 (PDT)
Date: Sun, 5 May 2019 12:46:19 -0400
From: Chris Down <chris@chrisdown.name>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [RFC PATCH 0/5] cgroup support for GPU devices
Message-ID: <20190505164619.GA59027@chrisdown.name>
References: <20190501140438.9506-1-brian.welty@intel.com>
 <20190502083433.GP7676@mtr-leonro.mtl.com>
 <CAOWid-cYknxeTQvP9vQf3-i3Cpux+bs7uBs7_o-YMFjVCo19bg@mail.gmail.com>
 <bb001de0-e4e5-6b3f-7ced-9d0fb329635b@intel.com>
 <20190505071436.GD6938@mtr-leonro.mtl.com>
 <CAOWid-di8kcC2bYKq1KJo+rWfVjwQ13mcVRjaBjhFRzTO=c16Q@mail.gmail.com>
 <20190505160506.GF6938@mtr-leonro.mtl.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190505160506.GF6938@mtr-leonro.mtl.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chrisdown.name; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=x0ZvxGqKqkQis3eWKYukVDy0+4WkHGdposYeRQupFOw=;
 b=xIVhJ3MLZE2ilPDUpTWGrclOXQUa5GWlZDrc3RalvMuJns3oV1XuBnemj2jSVzsB2i
 IaXaj4WAhc/5W6lLfkAlZkIfICx/0C64E6q7DFSEEu5gwNm2t493J415QXaJS/WXqqkg
 HAFVU39KEipINsnsZ4SWXyE9WgOKjVs2tnwVw=
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
Cc: Parav Pandit <parav@mellanox.com>, David Airlie <airlied@linux.ie>,
 kenny.ho@amd.com, intel-gfx@lists.freedesktop.org, "Welty,
 Brian" <brian.welty@intel.com>, Harish.Kasiviswanathan@amd.com,
 cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, J??r??me Glisse <jglisse@redhat.com>,
 Li Zefan <lizefan@huawei.com>, Kenny Ho <y2kenny@gmail.com>,
 Vladimir Davydov <vdavydov.dev@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tejun Heo <tj@kernel.org>,
 Christian K??nig <christian.koenig@amd.com>,
 RDMA mailing list <linux-rdma@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGVvbiBSb21hbm92c2t5IHdyaXRlczoKPkZpcnN0IGdyb3VwIChwcm9ncmFtbWVycykgaXMgdXNp
bmcgc3BlY2lhbCBBUEkgWzFdIHRocm91Z2ggbGliaWJ2ZXJicyBbMl0KPndpdGhvdXQgYW55IG5v
dGlvbiBvZiBjZ3JvdXBzIG9yIGFueSBsaW1pdGF0aW9ucy4gU2Vjb25kIGdyb3VwIChzeXNhZG1p
bnMpCj5pcyBsZXNzIGludGVyZXN0ZWQgaW4gYXBwbGljYXRpb24gc3BlY2lmaWNzIGFuZCBmb3Ig
dGhlbSAiZGV2aWNlIG1lbW9yeSIgbWVhbnMKPiJtZW1vcnkiIGFuZCBub3QgInJkbWEsIG5pYyBz
cGVjaWZpYywgaW50ZXJuYWwgbWVtb3J5Ii4KCkknZCBzdWdnZXN0IG90aGVyd2lzZSwgYmFzZWQg
b24gaGlzdG9yaWMgcHJlY2VkZW50IC0tIHN5c2FkbWlucyBhcmUgdHlwaWNhbGx5IAp2ZXJ5IG9w
aW5pb25hdGVkIGFib3V0IG9wZXJhdGlvbiBvZiB0aGUgbWVtb3J5IHN1YnN5c3RlbSAoaGVuY2Ug
dGhlIGVuZGxlc3MgCmRpc2N1c3Npb25zIGFib3V0IHN3YXAsIGNhY2hpbmcgYmVoYXZpb3VyLCBl
dGMpLgoKRXNwZWNpYWxseSBpbiB0aGlzIGNhc2UsIHRoZXNlIHR5cGVzIG9mIG1lbW9yeSBvcGVy
YXRlIGZ1bmRhbWVudGFsbHkgCmRpZmZlcmVudGx5IGFuZCBoYXZlIHNpZ25pZmljYW50bHkgZGlm
ZmVyZW50IHBlcmZvcm1hbmNlIGFuZCBhdmFpbGFiaWxpdHkgCmNoYXJhY3RlcmlzdGljcy4gVGhh
dCdzIG5vdCBzb21ldGhpbmcgdGhhdCBjYW4gYmUgdHJpdmlhbGx5IGFic3RyYWN0ZWQgb3ZlciAK
d2l0aG91dCBub24tdHJpdmlhbCBkcmF3YmFja3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
