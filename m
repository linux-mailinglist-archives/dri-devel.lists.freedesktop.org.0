Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C8E2B16
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 09:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D974E6E109;
	Thu, 24 Oct 2019 07:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378D16EB18
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:41:02 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id e10so12361751pgd.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 08:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TI9rW32nt+i6GyURUSN10bGjthP0EG+xScjnb+pkqac=;
 b=YhpcSHWkORFEdxTNEwhh7x5qqUVft2PLQizo13if05gURS1uKeH1/NGHKT3a3losPa
 hN5PtiZckXNmfd1hnXG2NQmMX6hvmMd5vSHERPjs0fTJnWmiYAjJT5klKbOWUzxOAnuH
 ewFvb65F/QX7yPaYx0rUfkG8I8Ei6cUprx+0c+RTo5vx9/QGzwW8YTqWliAGJZ2pQwJO
 ceVr8JrlXfYBNuYo4lXT494Yo0XfYKrcfY5gg8aEUtYXudfSluHyLsQV/CFDxRbsURy1
 1WmBxYkwahIldEdFzg3ffl+WUFd4MX/CCu7UGaKO6/RJPm8KJYdsNh8XTSrXzxSctO9M
 49fw==
X-Gm-Message-State: APjAAAXdKp9CgiMCsKA0f7nxJCEX8n60Syh95hzh1RF/U35NQdGjOQeE
 hPXJL0ZsALlh8W7xKhCS4Cx5jw==
X-Google-Smtp-Source: APXvYqxpUg0BJf6IgZEek+Avbtx6SaPZVRb4CoPCBRhASaoQxSh7v/tZYoAbFxDTBg5wYPAauGUeIw==
X-Received: by 2002:a17:90a:e987:: with SMTP id v7mr765373pjy.86.1571845261541; 
 Wed, 23 Oct 2019 08:41:01 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.googlemail.com with ESMTPSA id r18sm28682272pfc.3.2019.10.23.08.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 08:41:01 -0700 (PDT)
Subject: Re: [PATCH] Cleanup: replace prefered with preferred
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
References: <20191022214208.211448-1-salyzyn@android.com>
 <20191023115637.GA23733@linux.intel.com>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <fa12cb96-7a93-bf85-214d-a7bfaf8b8b0a@android.com>
Date: Wed, 23 Oct 2019 08:40:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023115637.GA23733@linux.intel.com>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 24 Oct 2019 07:27:37 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TI9rW32nt+i6GyURUSN10bGjthP0EG+xScjnb+pkqac=;
 b=KBoKx5yOJdWGZz7I1M810keaJ1ZlEuvnt+HTZJAS0UmK0LTUpPmdFTkklfgcGdi73r
 feMTzV569J5UceysOEInvWeJdRd/ZzonW6Aa3VYlqczCqXy+PY9ipoJvzLD+NWbnZ5rP
 mW2vwJLR0Vq7sY9XP/QBVZSb/GxJx9fS5CE5Yo07sdXhMNQdYvScXxROVKhe4Esy5Cvd
 e50H85g6521yumbQVB+PGX8SW/L7QzMUvgyanXK1Toe52me2wt2CIUN9qyd4f938PFQ7
 rthEsivMBKI4ftQ33yVLiM1NHSBLjKlHtZVEVP38OG7iyjy4z/skVUexYga7/45kjz+T
 6+ug==
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
Cc: Alexander Aring <alex.aring@gmail.com>, linux-efi@vger.kernel.org,
 =?UTF-8?Q?Linus_L=c3=bcssing?= <linus.luessing@c0d3.blue>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Feng Tang <feng.tang@intel.com>,
 dri-devel@lists.freedesktop.org, Roman Li <Roman.Li@amd.com>,
 "David S. Miller" <davem@davemloft.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, netdev@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Rafael Aquini <aquini@redhat.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Jonathan Corbet <corbet@lwn.net>,
 Francesco Ruggeri <fruggeri@arista.com>,
 Matthew Garrett <matthewgarrett@google.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, kernel-team@android.com,
 linux-media@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Hans de Goede <hdegoede@redhat.com>, hersen wu <hersenxs.wu@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Maxim Martynov <maxim@arista.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-bluetooth@vger.kernel.org,
 David Ahern <dsahern@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wpan@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMjMvMTkgNDo1NiBBTSwgSmFya2tvIFNha2tpbmVuIHdyb3RlOgo+IE9uIFR1ZSwgT2N0
IDIyLCAyMDE5IGF0IDAyOjQxOjQ1UE0gLTA3MDAsIE1hcmsgU2FseXp5biB3cm90ZToKPj4gUmVw
bGFjZSBhbGwgb2NjdXJyZW5jZXMgb2YgcHJlZmVyZWQgd2l0aCBwcmVmZXJyZWQgdG8gbWFrZSBm
dXR1cmUKPj4gY2hlY2twYXRjaC5wbCdzIGhhcHB5LiAgQSBmZXcgcGxhY2VzIHRoZSBpbmNvcnJl
Y3Qgc3BlbGxpbmcgaXMKPj4gbWF0Y2hlZCB3aXRoIHRoZSBjb3JyZWN0IHNwZWxsaW5nIHRvIHBy
ZXNlcnZlIGV4aXN0aW5nIHVzZXIgc3BhY2UgQVBJLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJr
IFNhbHl6eW4gPHNhbHl6eW5AYW5kcm9pZC5jb20+Cj4gSSdkIGZpeCBzdWNoIHRoaW5ncyB3aGVu
IHRoZSBjb2RlIGlzIG90aGVyd2lzZSBjaGFuZ2UgYW5kIHNjb3BlIHRoaXMKPiBwYXRjaCBvbmx5
IHRvIERvY3VtZW50YXRpb24vLiBUaGVyZSBpcyBubyBwcmFnbWF0aWMgYmVuZWZpdCBvZiBkb2lu
Zwo+IHRoaXMgZm9yIHRoZSBjb2RlLgo+Cj4gL0phcmtrbwoKVGhlIHByYWdtYXRpYyBiZW5lZml0
IGNvbWVzIHdpdGggdGhlIHVzZSBvZiBhbiBBQkkvQVBJIGNoZWNrZXIgKHdoaWNoIGlzIAphICdk
aXN0cm8nIHRoaW5nLCBub3QgYSB0b3Agb2YgdHJlZSBrZXJuZWwgdGhpbmcpIHByb2R1Y2VzIGl0
cyBtYXAgd2hpY2ggCmlzIHR5cGljYWxseSByZXF1aXJlZCB0byBiZSBjby1sb2NhdGVkIGluIHRo
ZSBzYW1lIHRyZWUgYXMgdGhlIGtlcm5lbCAKcmVwb3NpdG9yeS4gUXVpdGUgYSBmZXcgQUJJL0FQ
SSB1cGRhdGUgY2hlY2tpbnMgcmVzdWx0IGluIGEgCmNoZWNrcGF0Y2gucGwgY29tcGxhaW50IGFi
b3V0IHRoZSBtaXNzcGVsbGVkIGVsZW1lbnRzIGJlaW5nIAoocmUtKXJlY29yZGVkIGR1ZSB0byBw
cm94aW1pdHkuIFdlIGhhdmUgYSBzZXBhcmF0ZSB0YXNrIHRvIGltcHJvdmUgaG93IAppdCBpcyB0
cmFja2VkIGluIEFuZHJvaWQgdG8gcmVkdWNlIG1pbGVwb3N0IG1hcmtlciBjaGFuZ2VzIHRoYXQg
cmVzdWx0IAppbiBzd2VlcGluZyBjaGFuZ2VzIHRvIHRoZSBkYXRhYmFzZSB3aGljaCB3b3VsZCBy
ZWR1Y2UgdGhlIG9jY3VycmVuY2VzLgoKSSB3aWxsIHNwbGl0IHRoaXMgYmV0d2VlbiBwdXJlIGFu
ZCBpbmVydCBkb2N1bWVudGF0aW9uL2NvbW1lbnRzIGZvciBub3csIAp3aXRoIGEgZm9sbG93dXAg
bGF0ZXIgZm9yIHRoZSBjb2RlIHBvcnRpb24gd2hpY2ggdW5kZXJzdGFuZGFibHkgaXMgbW9yZSAK
Y29udHJvdmVyc2lhbC4KCkNsZWFudXAgaXMgdGhlIGxlYXN0IGFwcHJlY2lhdGVkIHBhcnQgb2Yg
a2VybmVsIG1haW50ZW5hbmNlIDstfS4KClNpbmNlcmVseSAtLSBNYXJrIFNhbHl6eW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
