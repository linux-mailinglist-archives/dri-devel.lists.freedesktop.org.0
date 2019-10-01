Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD6C4838
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A183A6E8BE;
	Wed,  2 Oct 2019 07:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99E26E785
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 12:46:49 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id x134so11069674qkb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 05:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yhYK707SJYezdTmtlm0H5DzhvYDEY+AheUSfJipRwQA=;
 b=JKT5Ih7X+Q3xVvN13vbimC3MsAYb4/DHewzsm6Zh/+eaHN6iZopx49MmYoQ1adNpR4
 VhIbbol0SwR+7NPhi7UQySj9d7pli9gaYAQh4e0Xexjw27KWYmITvCQgmfKN2W3ECRp/
 Eg804QX7EIEZkUaiShyg+Q0OadgLYt2RLivysZU0VtYMfy7RWyGwHWSEiUmUtfRAaF6D
 Zpu1dDcGaCJveflD69ds3s4/MNjYf9VMrcnV8XQ9u47l+3xEXfFrEGHd0DO9DaKLfbV7
 K9eBrz6KxKQk58vpvEuNBpVV+Qx9/4GaF1av3SJg9zTVXpTKv8qNvY7+VHhkHKfljMuZ
 Ut8w==
X-Gm-Message-State: APjAAAU06alLXZE0TwieCvro0vCPvuRJDqLz0TAOBYt4spfYKafWw2AZ
 8MLKsjkUO09/akAWrYmZx6KEyQ==
X-Google-Smtp-Source: APXvYqxfvaAa5fGyRQyIYajobY2F3QEa4iZspmX+Xrdwm3QyJhHVVt0YDLkyzlFTQn8rAQfDdMC0qg==
X-Received: by 2002:a37:a9d1:: with SMTP id s200mr5660408qke.251.1569934008434; 
 Tue, 01 Oct 2019 05:46:48 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id n65sm7669877qkb.19.2019.10.01.05.46.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 05:46:47 -0700 (PDT)
Message-ID: <1569934004.5576.249.camel@lca.pw>
Subject: Re: [PATCH -next] treewide: remove unused argument in lock_release()
From: Qian Cai <cai@lca.pw>
To: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 01 Oct 2019 08:46:44 -0400
In-Reply-To: <20190930072938.GK4553@hirez.programming.kicks-ass.net>
References: <1568909380-32199-1-git-send-email-cai@lca.pw>
 <20190930072938.GK4553@hirez.programming.kicks-ass.net>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yhYK707SJYezdTmtlm0H5DzhvYDEY+AheUSfJipRwQA=;
 b=Ip07l89zJ0jmeRNnjuMLfwUjUW/Co9PU7e0m/xjX5PRGmc7z0AHojhkZabJt8X2Bgg
 g+nON2pSO1jYd3vrOuUPki6rr1yQEu8hEHqD2uxKaL1mXqoQO+mmyIxyk/MqTG+kwh7j
 k8s6vQHeaqcK2Ex9HxDcxmXOxrevnS6yuu8GEXyqlYjEZ0NonLeaC1CRZJXuD0MLzbKz
 KMfG1EI87v8Lxz8Ezrm+M3DQJYYjEG8yK9ND3K1qjmeVssoYCQLFRhdCLXQgMe4P5XGr
 47iPcjETHnPBpfL8Sd3yLzPtHoVT0IEvJrxtCfa4Pu82gMneNTnjOQOCUx8TaPMdQriE
 9BWQ==
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
Cc: juri.lelli@redhat.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 mhocko@kernel.org, alexander.levin@microsoft.com, joseph.qi@linux.alibaba.com,
 netdev@vger.kernel.org, st@kernel.org, will@kernel.org, duyuyang@gmail.com,
 vincent.guittot@linaro.org, daniel@iogearbox.net, mark@fasheh.com,
 mingo@redhat.com, vdavydov.dev@gmail.com, jslaby@suse.com,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org, jack@suse.com,
 mripard@kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk,
 rodrigo.vivi@intel.com, cgroups@vger.kernel.org, sean@poorly.run,
 bpf@vger.kernel.org, tytso@mit.edu, linux-mm@kvack.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, hannes@cmpxchg.org,
 gregkh@linuxfoundation.org, tj@kernel.org, akpm@linux-foundation.org,
 davem@davemloft.net, ocfs2-devel@oss.oracle.com, jlbec@evilplan.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA5LTMwIGF0IDA5OjI5ICswMjAwLCBQZXRlciBaaWpsc3RyYSB3cm90ZToK
PiBPbiBUaHUsIFNlcCAxOSwgMjAxOSBhdCAxMjowOTo0MFBNIC0wNDAwLCBRaWFuIENhaSB3cm90
ZToKPiA+IFNpbmNlIHRoZSBjb21taXQgYjRhZGZlOGUwNWYxICgibG9ja2luZy9sb2NrZGVwOiBS
ZW1vdmUgdW51c2VkIGFyZ3VtZW50Cj4gPiBpbiBfX2xvY2tfcmVsZWFzZSIpLCBAbmVzdGVkIGlz
IG5vIGxvbmdlciB1c2VkIGluIGxvY2tfcmVsZWFzZSgpLCBzbwo+ID4gcmVtb3ZlIGl0IGZyb20g
YWxsIGxvY2tfcmVsZWFzZSgpIGNhbGxzIGFuZCBmcmllbmRzLgo+IAo+IFJpZ2h0OyBJIG5ldmVy
IGRpZCB0aGlzIGNsZWFudXAgZm9yIG5vdCB3YW50aW5nIHRoZSBjaHVybiwgYnV0IGFzIGxvbmcK
PiBhcyBpdCBhcHBsaWVzIEknbGwgdGFrZSBpdC4KCk5vdCBzdXJlIHdoZW4geW91IHdvdWxkIGxp
a2UgdG8gbWVyZ2UgdGhpcy4gQXMgeW91IGtub3csIHRoZSBsb25nZXIgaXQgaXMKcGVuZGluZywg
dGhlIG1vcmUgY2h1cm4gaXQgY291bGQgaGF2ZS4gSWYgeW91IGNvdWxkIGdpdmUgbWUgcm91Z2gg
dGltZWxpbmUKKGkuZS4sIGFpbSBmb3IgdjUuNC1yYzIgb3IgdjUuNSksIEknbGwgZG91YmxlLWNo
ZWNrIGZvciBicmVha2FnZSBhbmQgcmViYXNlIGl0CmlmIG5lY2Vzc2FyeS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
