Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A360218615
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE2E89BF6;
	Thu,  9 May 2019 07:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F759899D5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 02:18:35 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id w7so339762plz.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 19:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=67cKgHpKn5BasI4H9G5b29AFH8V2LHpBqBhNNX7AepI=;
 b=c8uTyZzRrClCR7lGQ82eshkHvvFsI8WXQHBrQkpKKz2+MYt9EAVIpzabyrdBohAvN6
 o/fBhsVlXYtV+EiSNBlCmOi18M3GZTFEqJsKEbgxYP1Gj+07g/5sSq3Gb9hFky68Fg8r
 2S4ehwzvIIbfWNUxploPDQnfQ/cl17XVQ0dn2Ihul+OTfZwy065b2/H6bmGcnis9jr97
 9cz/EgLl0u6e7GVFI/AQ7wGOD+QPVE88DgpgoIS1cM+fyDAqVFawdo4t1FNcocrXVzd4
 Ngm7gPC4keez8OG6lq6hzL0SQXMUGUm0LLCxmEI5gCK+ckJCxXd4jZnbOlDpdM5+udoJ
 9zcA==
X-Gm-Message-State: APjAAAWPqvrx+5ch7enyGBvk6VB3JL0WCN87ETn0BIO9O2Ra7eOHlwVd
 n01C1TKjMXl6/Nw3Srz1uFo=
X-Google-Smtp-Source: APXvYqxKONkqpvysOzcXsSL0stE2Fx1k07GjyXCU+F00vWxsMMPMatYsdoa5bWbRlxy93rTIbJhz0w==
X-Received: by 2002:a17:902:8f82:: with SMTP id
 z2mr1716364plo.51.1557368314774; 
 Wed, 08 May 2019 19:18:34 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net.
 [24.6.192.50])
 by smtp.gmail.com with ESMTPSA id r138sm777868pfr.2.2019.05.08.19.18.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 19:18:33 -0700 (PDT)
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Theodore Ts'o <tytso@mit.edu>, Greg KH <gregkh@linuxfoundation.org>,
 Brendan Higgins <brendanhiggins@google.com>, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org, shuah@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-um@lists.infradead.org, Alexander.Levin@microsoft.com,
 Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com,
 dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
 joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
 knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au,
 pmladek@suse.com, richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
 wfg@linux.intel.com
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com> <20190507172256.GB5900@mit.edu>
 <4d963cdc-1cbb-35a3-292c-552f865ed1f7@gmail.com>
 <20190509014407.GA7031@mit.edu>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <458dcb03-8dee-a005-97e1-7296a9e5bbfd@gmail.com>
Date: Wed, 8 May 2019 19:18:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509014407.GA7031@mit.edu>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=67cKgHpKn5BasI4H9G5b29AFH8V2LHpBqBhNNX7AepI=;
 b=IdWnqVyky2mloPBWQLjQqC3RNWwopYAaMClPvfqRz+kOE5FYbiQV2HYTeaz5LcNXRc
 7wOeWEeAayPUpVKD8GVgH5tlHGjOMXoHfdDjtYENRb51HqJzXvqoIVPN/c8gSgI1A8Bd
 27sn+YVD+VXjElLK8ki7xOEob0TJCp6WvbCU+Rl8BL3/htDMfD8jdKzGUvRX6k4w7lc7
 Pf0CP6YbTC4sS274CsPgsIalQHztO9A4EhBK4Z9Lb7TnlcPn29QL3JvNlnhzeK+xhVUQ
 HL6MkDTHh/MTo81DfiP0Voc8IagpScTcOZUNMy2+isvaJF7gRho5CMGYBOrvWGSA9sL6
 4Tqw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS84LzE5IDY6NDQgUE0sIFRoZW9kb3JlIFRzJ28gd3JvdGU6Cj4gT24gV2VkLCBNYXkgMDgs
IDIwMTkgYXQgMDU6NTg6NDlQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdyb3RlOgo+Pgo+PiBJZiBL
VW5pdCBpcyBhZGRlZCB0byB0aGUga2VybmVsLCBhbmQgYSBzdWJzeXN0ZW0gdGhhdCBJIGFtIHN1
Ym1pdHRpbmcKPj4gY29kZSBmb3IgaGFzIGNob3NlbiB0byB1c2UgS1VuaXQgaW5zdGVhZCBvZiBr
c2VsZnRlc3QsIHRoZW4geWVzLCBJIGRvCj4+ICpoYXZlKiB0byB1c2UgS1VuaXQgaWYgbXkgc3Vi
bWlzc2lvbiBuZWVkcyB0byBjb250YWluIGEgdGVzdCBmb3IgdGhlCj4+IGNvZGUgdW5sZXNzIEkg
d2FudCB0byBjb252aW5jZSB0aGUgbWFpbnRhaW5lciB0aGF0IHNvbWVob3cgbXkgY2FzZQo+PiBp
cyBzcGVjaWFsIGFuZCBJIHByZWZlciB0byB1c2Uga3NlbGZ0ZXN0IGluc3RlYWQgb2YgS1VuaXR0
ZXN0Lgo+IAo+IFRoYXQncyBnb2luZyB0byBiZSBiZXR3ZWVuIHlvdSBhbmQgdGhlIG1haW50YWlu
ZXIuICBUb2RheSwgaWYgeW91IHdhbnQKPiB0byBzdWJtaXQgYSBzdWJzdGFudGl2ZSBjaGFuZ2Ug
dG8geGZzIG9yIGV4dDQsIHlvdSdyZSBnb2luZyB0byBiZQo+IGFza2VkIHRvIGNyZWF0ZSB0ZXN0
IGZvciB0aGF0IG5ldyBmZWF0dXJlIHVzaW5nIHhmc3Rlc3RzLiAgSXQgZG9lc24ndAo+IG1hdHRl
ciB0aGF0IHhmc3Rlc3RzIGlzbid0IGluIHRoZSBrZXJuZWwgLS0tIGlmIHRoYXQncyB3aGF0IGlz
Cj4gcmVxdWlyZWQgYnkgdGhlIG1haW50YWluZXIuCgpZZXMsIHRoYXQgaXMgZXhhY3RseSB3aGF0
IEkgd2FzIHNheWluZy4KClBsZWFzZSBkbyBub3QgY3V0IHRoZSBwZXJ0aW5lbnQgcGFydHMgb2Yg
Y29udGV4dCB0aGF0IEkgYW0gcmVwbHlpbmcgdG8uCgoKPj4+IHN1cHBvc2VkIHRvIGJlIGEgc2lt
cGxlIHdheSB0byBydW4gYSBsYXJnZSBudW1iZXIgb2Ygc21hbGwgdGVzdHMgdGhhdAo+Pj4gZm9y
IHNwZWNpZmljIHNtYWxsIGNvbXBvbmVudHMgaW4gYSBzeXN0ZW0uCj4+Cj4+IGtzZWxmdGVzdCBh
bHNvIHN1cHBvcnRzIHJ1bm5pbmcgYSBzdWJzZXQgb2YgdGVzdHMuICBUaGF0IHN1YnNldCBvZiB0
ZXN0cwo+PiBjYW4gYWxzbyBiZSBhIGxhcmdlIG51bWJlciBvZiBzbWFsbCB0ZXN0cy4gIFRoZXJl
IGlzIG5vdGhpbmcgaW5oZXJlbnQKPj4gaW4gS1VuaXQgdnMga3NlbGZ0ZXN0IGluIHRoaXMgcmVn
YXJkLCBhcyBmYXIgYXMgSSBhbSBhd2FyZS4KCgo+IFRoZSBiaWcgZGlmZmVyZW5jZSBpcyB0aGF0
IGtzZWxmdGVzdHMgYXJlIGRyaXZlbiBieSBhIEMgcHJvZ3JhbSB0aGF0Cj4gcnVucyBpbiB1c2Vy
c3BhY2UuICBUYWtlIGEgbG9vayBhdCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9maWxlc3lzdGVt
L2Rub3RpZnlfdGVzdC5jCj4gaXQgaGFzIGEgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndikgZnVu
Y3Rpb24uCj4gCj4gSW4gY29udHJhc3QsIEtVbml0IGFyZSBmcmFnbWVudHMgb2YgQyBjb2RlIHdo
aWNoIHJ1biBpbiB0aGUga2VybmVsOwo+IG5vdCBpbiB1c2Vyc3BhY2UuICBUaGlzIGFsbG93cyB1
cyB0byB0ZXN0IGludGVybmFsIGZ1bmN0aW9ucyBpbnNpZGUKPiBjb21wbGV4IGZpbGUgc3lzdGVt
IChzdWNoIGFzIHRoZSBibG9jayBhbGxvY2F0b3IgaW4gZXh0NCkgZGlyZWN0bHkuCj4gVGhpcyBt
YWtlcyBpdCAqZnVuZGFtZW50YWxseSogZGlmZmVyZW50IGZyb20ga3NlbGZ0ZXN0LgoKTm8sIHRv
dGFsbHkgaW5jb3JyZWN0LiAga3NlbGZ0ZXN0cyBhbHNvIHN1cHBvcnRzIGluIGtlcm5lbCBtb2R1
bGVzIGFzCkkgbWVudGlvbiBpbiBhbm90aGVyIHJlcGx5IHRvIHRoaXMgcGF0Y2guCgpUaGlzIGlz
IHRhbGtpbmcgcGFzdCBlYWNoIG90aGVyIGEgbGl0dGxlIGJpdCwgYmVjYXVzZSB5b3VyIG5leHQg
cmVwbHkKaXMgYSByZXBseSB0byBteSBlbWFpbCBhYm91dCBtb2R1bGVzLgoKLUZyYW5rCgo+IAo+
IENoZWVycywKPiAKPiAJCQkJCQktIFRlZAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
