Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3825A4FCF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5388929D;
	Mon,  2 Sep 2019 07:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFD26E08A
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 15:54:16 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id v38so5575389edm.7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 08:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AKTao77VaiaPvCbgcc+WiGV1j5w0joNictAVXbGzljc=;
 b=TfviPOTscepRhUn+7Vp9lvzN3WGXStOD/2j8+GoF1ngiku856E2OwjV9fK0zGWc2Dn
 KcFlsxUScY8XHImrZyXqoLRAfQd/Lenwae2IOc1wkvh2/Me8c8L2fPNVNUgHPzNUeojB
 tsSE3q2rQ/miClJ72YHkRce2Skc9nEvadj4+0hxFnxMtHUYNDUxvQdJXa9p8SSammtPI
 hKhUnq4TeYE8/PuVTUrb09xhuOD0akpQhHsWLGGRAhTJNm5U75YBF27l/Vo3AB6ZWDTh
 dhvdxC6aHVUZA7xiLlteVkJ//dmRcmAxoK/0VKCNnlAJcvgeuDF9I9wGnE8ppyhWHvjE
 C7AQ==
X-Gm-Message-State: APjAAAUSI+/y4NMmKKwliopLcvqJ7Ut2jgLgD3FDCFloYzJk1sWFg7o2
 YK3XWVs8bdZ1JnS0HxNEeNs=
X-Google-Smtp-Source: APXvYqyUxiSvMtW/KeHJ5cA0AWsETqOjW7ApTaHBEHBAazWa/5cJ0LHfDHET8v0+ffDbuRqUR6oAiw==
X-Received: by 2002:a05:6402:154e:: with SMTP id
 p14mr21582628edx.101.1567266854794; 
 Sat, 31 Aug 2019 08:54:14 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.gmail.com with ESMTPSA id i19sm1234644ejf.7.2019.08.31.08.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Aug 2019 08:54:14 -0700 (PDT)
Subject: Re: [PATCH v3 01/11] checkpatch: check for nested (un)?likely() calls
To: Markus Elfring <Markus.Elfring@web.de>, Joe Perches <joe@perches.com>
References: <20190829165025.15750-1-efremov@linux.com>
 <0d9345ed-f16a-de0b-6125-1f663765eb46@web.de>
From: Denis Efremov <efremov@linux.com>
Message-ID: <689c8baf-2298-f086-3461-5cd1cdd191c6@linux.com>
Date: Sat, 31 Aug 2019 18:54:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0d9345ed-f16a-de0b-6125-1f663765eb46@web.de>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:25 +0000
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
Cc: dri-devel@lists.freedesktop.org, Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-rdma@vger.kernel.org,
 Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>,
 Saeed Mahameed <saeedm@mellanox.com>, linux-input@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Pismenny <borisp@mellanox.com>,
 linux-arm-msm@vger.kernel.org, linux-wimax@intel.com,
 Enrico Weigelt <lkml@metux.net>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Whitcroft <apw@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sean Paul <sean@poorly.run>,
 Anton Altaparmakov <anton@tuxera.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAzMS4wOC4yMDE5IDEyOjE1LCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPj4gKyMgbmVzdGVk
IGxpa2VseS91bmxpa2VseSBjYWxscwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCRsaW5lID1+IC9c
Yig/Oig/OnVuKT9saWtlbHkpXHMqXChccyohP1xzKihJU19FUlIoPzpfT1JfTlVMTHxfVkFMVUUp
P3xXQVJOKS8pIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgV0FSTigiTElLRUxZX01JU1VT
RSIsCj4gCj4gSG93IGRvIHlvdSB0aGluayBhYm91dCB0byB1c2UgdGhlIHNwZWNpZmljYXRpb24g
4oCcKD86SVNfRVJSKD86Xyg/Ok9SX05VTEx8VkFMVUUpKT98V0FSTinigJ0KPiBpbiB0aGlzIHJl
Z3VsYXIgZXhwcmVzc2lvbj8KCkhtbSwgCig/OiAgIDwtIENhdGNoIGdyb3VwIGlzIHJlcXVpcmVk
IGhlcmUsIHNpbmNlIGl0IGlzIHVzZWQgaW4gZGlhZ25vc3RpYyBtZXNzYWdlLAogICAgICAgICBz
ZWUgJDEKICAgSVNfRVJSCiAgICg/Ol8gPC0gQW5vdGhlciBhdG9taWMgZ3JvdXAganVzdCB0byBz
aG93IHRoYXQgJ18nIGlzIGEgY29tbW9uIHByZWZpeD8KICAgICAgICAgICBJJ20gbm90IHN1cmUg
YWJvdXQgdGhpcy4gVXN1YWxseSwgUGVybCBpbnRlcnByZXRlciBpcyB2ZXJ5IGdvb2QgYXQgb3B0
aW1pemluZyBzdWNoIHRoaW5ncy4KICAgICAgICAgICBZb3UgY291bGQgc2VlIHRoaXMgb3B0aW1p
emF0aW9uIGlmIHlvdSBydW4gcGVybCB3aXRoIC1NcmU9ZGVidWcuCiAgICAgKD86T1JfTlVMTHxW
QUxVRSkpP3xXQVJOKQoKUmVnYXJkcywKRGVuaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
