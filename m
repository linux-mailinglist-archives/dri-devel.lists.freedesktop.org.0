Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A7891191
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12C96EB39;
	Sat, 17 Aug 2019 15:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0EC6E372
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 00:20:50 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n4so3727517pgv.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 17:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D0kbC6F7vVOkq6Rzvvsj1BprmGjj2NrtMTriJSxu1QI=;
 b=oR6eEVpGCHEh7S5SfAanKE9MRiFx8ilmyMgeX3TbVliiIKKdM94lBsle4A/NQrBPdC
 UvELrwVk88rJCa7XdmNecomCh5yMzbXWs5sBT408e7nRtXZm0Cf2RfOMz5DGdOhcINKk
 auYKU5TovKl37BTkpn9PSTpV5qaZTf9LdeBSgqLj/wDxiNM8DvDdNxq9/SrXyuYTL3wW
 mQPmm7BycAcBQOt+sbZQ3k8MtSvUEZiY5BQKZFmFXQVKjcEiEJ+2MzjXK9KCbofWiAFu
 d2tDkZXA5YYkOWB2xWtSLkg9noiABkIFkECyAQeFNLSPdIYjPLDK+Ozz3Vx8NnQozgOs
 k/5w==
X-Gm-Message-State: APjAAAXZ9IekVd35qMO/U6cR5jzxQ97I4F1HhINRKWU2MI0yntyn1IZu
 LFugtIBs9/hP/iVxFiYWCUc=
X-Google-Smtp-Source: APXvYqyCvPvn4Gs6NL8NdNRw0/8JH9Y8L8dex7TJJ8Xal2ZqZGu6YPzosZc3+zwG7oULya9WwUeUHw==
X-Received: by 2002:a62:f208:: with SMTP id m8mr12957531pfh.108.1566001249601; 
 Fri, 16 Aug 2019 17:20:49 -0700 (PDT)
Received: from [10.1.192.154] ([66.170.99.95])
 by smtp.gmail.com with ESMTPSA id a189sm8407228pfa.60.2019.08.16.17.20.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 17:20:48 -0700 (PDT)
Subject: Re: [Bug 204407] New: Bad page state in process Xorg
To: Vlastimil Babka <vbabka@suse.cz>
References: <bug-204407-27@https.bugzilla.kernel.org/>
 <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
 <20190802203344.GD5597@bombadil.infradead.org>
 <1564780650.11067.50.camel@lca.pw>
 <20190802225939.GE5597@bombadil.infradead.org>
 <CA+i2_Dc-VrOUk8EVThwAE5HZ1-zFqONuW8Gojv+16UPsAqoM1Q@mail.gmail.com>
 <45258da8-2ce7-68c2-1ba0-84f6c0e634b1@suse.cz>
 <0287aace-fec1-d2d1-370f-657e80477717@vandrovec.name>
 <6a45a9b1-81ad-72c4-8f06-5d2cd87278ef@suse.cz>
From: Petr Vandrovec <petr@vandrovec.name>
Message-ID: <83927e78-4882-5c14-58f6-cf6933024645@vandrovec.name>
Date: Fri, 16 Aug 2019 17:20:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 PostboxApp/7.0.0b7
MIME-Version: 1.0
In-Reply-To: <6a45a9b1-81ad-72c4-8f06-5d2cd87278ef@suse.cz>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D0kbC6F7vVOkq6Rzvvsj1BprmGjj2NrtMTriJSxu1QI=;
 b=e1rJtASL2RfhvynkwFe3EUPTZ3xDFZKU4ML86Q66iNgVKOFbtYOAsasJ2QAzhML6DO
 WXokfFk55wzrwNe5uViKMzAgxnfYewhrFryHdb6t74xGe3LckJWCnnrP+sXRAGkT8ErL
 +yaJf71XO+lAIu5Kg8K1rjbeFPHDTMze5WI2H0JitwK+gytxpSslgHEq3poIgBm75q7K
 30ER5HF9mLSkmgobumI4+j9ygzex+JqkT9doGJMaFM72YWg3K9DiUj/9K12GU0fXXmxl
 7lpJRsdajS+pfg+lFzR8ZFRD2wohdtJKf/x7CNaw00+QhB+ZJW0iILBMQ1KdKmMFu7Hd
 Pprw==
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
Cc: Joerg Roedel <jroedel@suse.de>, David Airlie <airlied@linux.ie>,
 bugzilla-daemon@bugzilla.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>, Qian Cai <cai@lca.pw>,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vmxhc3RpbWlsIEJhYmthIHdyb3RlIG9uIDgvMTYvMjAxOSA1OjQ3IEFNOgo+IE9uIDgvMTUvMTkg
OToxMyBQTSwgUGV0ciBWYW5kcm92ZWMgd3JvdGU6Cj4+IFdpdGggaW9tbXU9b2ZmIGRpc2tzIGFy
ZSB2aXNpYmxlLCBidXQgVVNCIGtleWJvYXJkIChhbmQgb3RoZXIgVVNCCj4+IGRldmljZXMpwqBk
b2VzwqBub3TCoHdvcms6Cj4gCj4gSSd2ZSBiZWVuIHRvbGQgaW9tbXU9c29mdCBtaWdodCBoZWxw
LgoKVGhhbmtzLiAgSSd2ZSByZWJ1aWx0IGtlcm5lbCB3aXRob3V0IElPTU1VLgoKVW5mb3J0dW5h
dGVseSBJIHdhcyBub3QgYWJsZSB0byByZXByb2R1Y2Ugb3JpZ2luYWwgcHJvYmxlbSB3aXRoIGxh
dGVzdCAKa2VybmVsIC0gbmVpdGhlciB3aXRoIENNQSBub3Igd2l0aG91dCBDTUEuICBTeXN0ZW0g
c2VlbXMgc3RhYmxlIGFzIGEgcm9jay4KClRoaXMgaXMgdGhlIGNoYW5nZSBvbiB3aGljaCBJJ3Zl
IHRyaWVkIHRvIHJlcHJvZHVjZSBpdCB3aXRoIHlvdXIgCmRlYnVnZ2luZyBwYXRjaGVzOgoKY29t
bWl0IDQxZGU1OTYzNDA0NmIxOWNkNTNhMTk4MzU5NGE5NTEzNWM2NTY5OTcgKEhFQUQgLT4gbWFz
dGVyLCAKb3JpZ2luL21hc3Rlciwgb3JpZ2luL0hFQUQpCk1lcmdlOiBlMjJhOTdhMmE4NWQgMWVl
MTExOWQxODRiCkF1dGhvcjogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRp
b24ub3JnPgpEYXRlOiAgIFdlZCBBdWcgMTQgMTU6Mjk6NTMgMjAxOSAtMDcwMAoKICAgICBNZXJn
ZSB0YWcgJ1dpbXBsaWNpdC1mYWxsdGhyb3VnaC01LjMtcmM1JyBvZiAKZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2d1c3Rhdm9hcnMvbGludXgKCgkJCQkJCVBl
dHIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
