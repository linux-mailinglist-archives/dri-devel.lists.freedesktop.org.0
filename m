Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07AC295924
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6536F51B;
	Thu, 22 Oct 2020 07:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580096E17B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 04:20:51 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id v6so461034lfa.13
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 21:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bHoZT/Fr9uAigMoBzLNCfLcCJhHkAk9QlkwBKzVc6sU=;
 b=JcGsnzpG4cmLKqGoh+N5JKm4CoANnz8x2hANg5VK15vgE2wyhYhmCX5p34ujEWGo6L
 lDJsZgl8whwW72iGwUUf9uH7C7lcT+QpEf3Dw95PGkovSjbYMpM8MHDUDwR8Yrson+/U
 jUTgvn+xmj9GuAs8q6kmxA2WyejrM5XYLGcmxEIbyCIBTjRPGzuuQdXus4RxIZf6OpDU
 1DYFDXwPiB9YFP4/Te503421p9Vfhc0ZDE2dCQgFUR4TG+n82N7GuAGZh3cYcnNAcAcN
 869MmrFBHLRTQOe8J1Fov4OUjdkRIMQXahKOwbiRlrx6imqpJr9EVg0riVsJPG0/Y6e+
 7fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bHoZT/Fr9uAigMoBzLNCfLcCJhHkAk9QlkwBKzVc6sU=;
 b=UIlY6ennkpZj5DnaKb7rUTbSRnvud/cT+QIygj7UKrLq+0QKqq1aRKqWQzMWl5UYNM
 1deAN/zGRxrO2rSeU542dAxHzuUZlirfaMjQCjqADG1MyJrnrAHSdjpDPIP+UOa8foRm
 V+QYQGqDRvKQ/qZjvQJoQLdh0knnSte3nG6YNw72I4fnHVGjb257tjIofE9OV/3labOf
 hFKTvtfEly05+vdVlWBh7XlToggPxEmZMW6BWjy00DpOniooCxJrm34vfFwutqdTdTnl
 U5CMdzdirvWiXBY1gWX+zKPQ4Pq28HVevr7JqDGfB5KhFe98ToJlv5+Gs6a/CW/wex2H
 hWOg==
X-Gm-Message-State: AOAM531Dsr5wVitqbdLk5zWquOYNmY6bUe7uvw+vhEW0VCUDgY06Bbjr
 9Jjj6sAu+eVtWTXlSbztJc4=
X-Google-Smtp-Source: ABdhPJxcRk3r72EvW5bHItYyzrdcIYOyYwLLZoWJW2nYBOTOUUajal7hm4xXuJnEcof9Pvja15gWXw==
X-Received: by 2002:a19:7009:: with SMTP id h9mr200749lfc.201.1603340449722;
 Wed, 21 Oct 2020 21:20:49 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id t80sm60273lff.72.2020.10.21.21.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 21:20:48 -0700 (PDT)
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
 <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <48f5bbac-3955-c227-dbe1-d987b4ec5bd0@gmail.com>
Date: Thu, 22 Oct 2020 07:20:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAuMTAuMjAyMCAxMjoxOCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IEknbSBhc2tp
bmcgdGhpcyBxdWVzdGlvbiBiZWNhdXNlIHJpZ2h0IG5vdyB0aGVyZSBpcyBvbmx5IG9uZSBwb3Rl
bnRpYWwKPj4gY2xpZW50IGZvciB0aGlzIElPQ1RMLCB0aGUgVklDLiBJZiBvdGhlciBjbGllbnRz
IGFyZW4ndCBzdXBwb3NlZCB0byBiZSBhCj4+IHBhcnQgb2YgdGhlIERSTSBkcml2ZXIsIGxpa2Ug
Zm9yIGV4YW1wbGUgTlZERUMgd2hpY2ggcHJvYmFibHkgc2hvdWxkIGJlCj4+IGEgVjRMIGRyaXZl
ciwgdGhlbiBEUk0gZHJpdmVyIHdpbGwgaGF2ZSBvbmx5IGEgc2luZ2xlIFZJQyBhbmQgaW4gdGhp
cwo+PiBjYXNlIHdlIHNob3VsZG4ndCBuZWVkIHRoaXMgSU9DVEwgYmVjYXVzZSBEUk0gYW5kIFY0
TCBzaG91bGQgdXNlIGdlbmVyaWMKPj4gZG1hYnVmIEFQSSBmb3IgaW1wb3J0aW5nIGFuZCBleHBv
cnRpbmcgYnVmZmVycy4KPiAKPiBUaGlzIElPQ1RMIGlzIHJlcXVpcmVkIGZvciBHUjJEL0dSM0Qg
dG9vLCBhcyB0aGV5IG5lZWQgdG8gYWNjZXNzIG1lbW9yeQo+IGFzIHdlbGwuIFRoaXMgaXMgYSBk
aWZmZXJlbnQgc3RlcCBmcm9tIGltcG9ydC9leHBvcnQgLS0gZmlyc3QgeW91IGltcG9ydAo+IG9y
IGFsbG9jYXRlIHlvdXIgbWVtb3J5IHNvIHlvdSBoYXZlIGEgR0VNIGhhbmRsZSwgdGhlbiB5b3Ug
bWFwIGl0IHRvIHRoZQo+IGNoYW5uZWwsIHdoaWNoIGRvZXMgdGhlIElPTU1VIG1hcHBpbmcgKGlm
IHRoZXJlIGlzIGFuIElPTU1VKS4KPiAKClRoaXMgZG9lc24ndCBhbnN3ZXIgbXkgcXVlc3Rpb24u
IEkgZG9uJ3QgaGF2ZSBhIGZ1bGwgcGljdHVyZSBhbmQgZm9yIG5vdwp3aWxsIHJlbWFpbiBkdWJp
b3VzIGFib3V0IHRoaXMgSU9DVEwsIGJ1dCBpdCBzaG91bGQgYmUgZmluZSB0byBoYXZlIGl0Cmlu
IGEgZm9ybSBvZiBXSVAgcGF0Y2hlcyAobWF5YmUgc3RhZ2luZyBmZWF0dXJlKSB1bnRpbCB1c2Vy
c3BhY2UgY29kZQphbmQgaGFyZHdhcmUgc3BlY3Mgd2lsbCBiZWNvbWUgYXZhaWxhYmxlLgoKU29t
ZSBtb3JlIGNvbW1lbnRzOgoKMS4gT2xkZXIgVGVncmEgU29DcyBkbyBub3QgaGF2ZSByZXN0cmlj
dGlvbnMgd2hpY2ggZG8gbm90IGFsbG93IHRvIGdyb3VwCklPTU1VIGFzIHdpc2hlZCBieSBrZXJu
ZWwgZHJpdmVyLiBJdCdzIGZpbmUgdG8gaGF2ZSBvbmUgc3RhdGljIG1hcHBpbmcKcGVyLUdFTSB0
aGF0IGNhbiBiZSBhY2Nlc3NlZCBieSBhbGwgRFJNIGRldmljZXMsIHRoYXQncyB3aHkgQ0hBTk5F
TF9NQVAKaXMgcXVlc3Rpb25hYmxlLgoKMi4gSUlVQywgdGhlIG1hcHBpbmdzIG5lZWQgdG8gYmUg
ZG9uZSBwZXItZGV2aWNlIGdyb3VwL3N0cmVhbSBhbmQgbm90CnBlci1jaGFubmVsX2N0eC4gSXQg
bG9va3MgbGlrZSBub3RoaW5nIHN0b3BzIGNoYW5uZWwgY29udGV4dHMgdG8gZ3Vlc3MKbWFwcGlu
ZyBhZGRyZXNzZXMgb2YgdGhlIG90aGVyIGNvbnRleHQsIGlzbid0IGl0PwoKSSdtIHN1Z2dlc3Rp
bmcgdGhhdCBlYWNoIEdFTSBzaG91bGQgaGF2ZSBhIHBlci1kZXZpY2UgbWFwcGluZyBhbmQgdGhl
Cm5ldyBJT0NUTCBzaG91bGQgY3JlYXRlIHRoZXNlIEdFTS1tYXBwaW5ncywgaW5zdGVhZCBvZiB0
aGUgY2hhbm5lbF9jdHgKbWFwcGluZ3MuCgozLiBXZSBzaG91bGRuJ3QgbmVlZCBjaGFubmVsIGNv
bnRleHRzIGF0IGFsbCwgYSBzaW5nbGUgIkRSTSBmaWxlIgpjb250ZXh0IHNob3VsZCBiZSBlbm91
Z2ggdG8gaGF2ZS4KCjQuIFRoZSBuZXcgVUFQSSBuZWVkIHRvIGJlIHNlcGFyYXRlZCBpbnRvIHNl
dmVyYWwgcGFydHMgaW4gdGhlIG5leHQKcmV2aXNpb24sIG9uZSBwYXRjaCBmb3IgZWFjaCBuZXcg
ZmVhdHVyZS4KClRoZSBmaXJzdCBwYXRjaGVzIHNob3VsZCBiZSB0aGUgb25lcyB0aGF0IGFyZSBy
ZWxldmFudCB0byB0aGUgZXhpc3RpbmcKdXNlcnNwYWNlIGNvZGUsIGxpa2Ugc3VwcG9ydCBmb3Ig
dGhlIHdhaXRzLgoKUGFydGlhbCBtYXBwaW5ncyBzaG91bGQgYmUgYSBzZXBhcmF0ZSBmZWF0dXJl
IGJlY2F1c2UgaXQncyBhCnF1ZXN0aW9uYWJsZSBmZWF0dXJlIHRoYXQgbmVlZHMgdG8gYmUgcHJv
dmVkIGJ5IGEgcmVhbCB1c2Vyc3BhY2UgZmlyc3QuCk1heWJlIGl0IHdvdWxkIGJlIGV2ZW4gYmV0
dGVyIHRvIGRyb3AgaXQgZm9yIHRoZSBzdGFydGVyLCB0byBlYXNlIHJldmlld2luZy4KCldhaXRp
bmcgZm9yIGZlbmNlcyBvbiBob3N0MXggc2hvdWxkIGJlIGEgc2VwYXJhdGUgZmVhdHVyZS4KClRo
ZSBzeW5jZmlsZSBzdXBwb3J0IG5lZWRzIHRvIGJlIGEgc2VwYXJhdGUgZmVhdHVyZSBhcyB3ZWxs
IGJlY2F1c2UgSQpkb24ndCBzZWUgYSB1c2UtY2FzZSBmb3IgaXQgcmlnaHQgbm93LgoKSSdkIGxp
a2UgdG8gc2VlIHRoZSBEUk1fU0NIRUQgYW5kIHN5bmNvYmogc3VwcG9ydC4gSSBjYW4gaGVscCB5
b3Ugd2l0aAppdCBpZiBpdCdzIG91dCBvZiB5b3VycyBzY29wZSBmb3Igbm93LgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
