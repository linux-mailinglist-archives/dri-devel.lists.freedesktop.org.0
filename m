Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0618118614
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F6289BC2;
	Thu,  9 May 2019 07:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA594899C7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 02:14:02 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y11so415576pfm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 19:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m2h4qfOyf/vTBN3ksTZ+p+B5Uh42DjnmBaKteMIQJDg=;
 b=AwpgxEGlvemPc6E4la0TfV0Kv77bTRB1oeJG5gbi04zjiQhPdGWYnUjClH4uqJc3U+
 dSiiqtuQW4T31bPFBmqi0BlSg6ALRvkwtO8kppbMFyTQ89UWA0q9xLoAsmi+PuK/cYdF
 3+S0eTty4yz7sSukZk2UrTZblMb/8xTat0wDLhrasXxbWQzq63jAR4rFzu66B/ZUUgm7
 5bmt9cN4jg8GHp6jWoa6XecXQ6oxHwsaxaWkIh1sbHnKzczc4uSpCGl/Xhjz6qPWOrd1
 bcSe0t1FJJKZE9hcbsMIKANm6+J4MzqU2yz0aLbKCshoOKGDxX08MqS9s6MkEZBJNNeb
 WPyA==
X-Gm-Message-State: APjAAAVHpeitxGKqjWByjSv8Vc86QIPkoptITrKxmRnAVNMUFfPY+oUW
 XkwvuwTXsOF2ZcVt8INNiVE=
X-Google-Smtp-Source: APXvYqzL/TN1nN9Ct8HQ4wtcFHZZcQhp0SvsSuj3cK4ro/YW06pExZSQlXbu2Pcfe+Xz4ExfmkwqHw==
X-Received: by 2002:a63:b64:: with SMTP id a36mr2188141pgl.58.1557368042377;
 Wed, 08 May 2019 19:14:02 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net.
 [24.6.192.50])
 by smtp.gmail.com with ESMTPSA id a17sm668823pff.82.2019.05.08.19.13.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 19:14:01 -0700 (PDT)
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
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
Date: Wed, 8 May 2019 19:13:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509015856.GB7031@mit.edu>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=m2h4qfOyf/vTBN3ksTZ+p+B5Uh42DjnmBaKteMIQJDg=;
 b=d6Fl21d6H9hguqCIk66KfQTbpzIqdRCUj3hyqEHsDnZWMFK8wQPsR7wgx3oa+G2kjG
 1seT91f0+lIwQZd84COg8BT3K9ELnhDM30SHEOrlnvKeE7/5VX5u1W/8fgPsbHGyE+tg
 N1mbck/bnevbonwY9JDeI4wL+fVc6yDfWWKPjYGMVo+t1urDbbw17h12P2lsuAick9RL
 +tTl21ycCYmhS8aq1IQN4QtpicNviaYVVDhPWJWCkKNQi57gYY8h3oQc9YLQvbqDRawh
 S+/psk+LuYFrjp041aE4v+E+1oI4xE/yaxSeWSVYuo1fFT8XcryTFla0UCjHS8CZoXbN
 /oeQ==
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

T24gNS84LzE5IDY6NTggUE0sIFRoZW9kb3JlIFRzJ28gd3JvdGU6Cj4gT24gV2VkLCBNYXkgMDgs
IDIwMTkgYXQgMDU6NDM6MzVQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdyb3RlOgo+PiBrc2VsZnRl
c3QgcHJvdmlkZXMgYSBtZWNoYW5pc20gZm9yIGluLWtlcm5lbCB0ZXN0cyB2aWEgbW9kdWxlcy4g
IEZvcgo+PiBleGFtcGxlLCBzZWU6Cj4+Cj4+ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0v
cnVuX3ZtdGVzdHMgaW52b2tlczoKPj4gICAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL3Rl
c3Rfdm1hbGxvYy5zaAo+PiAgICAgICBsb2FkcyBtb2R1bGU6Cj4+ICAgICAgICAgdGVzdF92bWFs
bG9jCj4+ICAgICAgICAgKHdoaWNoIGlzIGJ1aWx0IGZyb20gbGliL3Rlc3Rfdm1hbGxvYy5jIGlm
IENPTkZJR19URVNUX1ZNQUxMT0MpCj4gCj4gVGhlIG1ham9yaXR5IG9mIHRoZSBrc2VsZnRlc3Rz
IGFyZSBpbXBsZW1lbnRlZCBhcyB1c2Vyc3BhY2UgcHJvZ3JhbXMuCgpOb24tYXJndW1lbnQuCgoK
PiBZb3UgKmNhbiogcnVuIGluLWtlcm5lbCB0ZXN0IHVzaW5nIG1vZHVsZXM7IGJ1dCB0aGVyZSBp
cyBubyBmcmFtZXdvcmsKPiBmb3IgdGhlIGluLWtlcm5lbCBjb2RlIGZvdW5kIGluIHRoZSB0ZXN0
IG1vZHVsZXMsIHdoaWNoIG1lYW5zIGVhY2ggb2YKPiB0aGUgaW4ta2VybmVsIGNvZGUgaGFzIHRv
IGNyZWF0ZSB0aGVpciBvd24gaW4ta2VybmVsIHRlc3QKPiBpbmZyYXN0cnVjdHVyZS4KCldoeSBj
cmVhdGUgYW4gZW50aXJlIG5ldyBzdWJzeXN0ZW0gKEtVbml0KSB3aGVuIHlvdSBjYW4gYWRkIGEg
aGVhZGVyCmZpbGUgKGFuZCAuYyBjb2RlIGFzIGFwcHJvcHJpYXRlKSB0aGF0IG91dHB1dHMgdGhl
IHByb3BlciBUQVAgZm9ybWF0dGVkCnJlc3VsdHMgZnJvbSBrc2VsZnRlc3Qga2VybmVsIHRlc3Qg
bW9kdWxlcz8KClRoZXJlIGFyZSBhbHJlYWR5IGEgbXVsdGl0dWRlIG9mIGluIGtlcm5lbCB0ZXN0
IG1vZHVsZXMgdXNlZCBieQprc2VsZnRlc3QuICBJdCB3b3VsZCBiZSBnb29kIGlmIHRoZXkgYWxs
IHVzZWQgYSBjb21tb24gVEFQIGNvbXBsaWFudAptZWNoYW5pc20gdG8gcmVwb3J0IHJlc3VsdHMu
CgogCj4gVGhhdCdzIG11Y2ggbGlrZSBzYXlpbmcgeW91IGNhbiB1c2UgdmljZSBncmlwcyB0byB0
dXJuIGEgbnV0IG9yCj4gYm9sdC1oZWFkLiAgWW91ICpjYW4qLCBidXQgaXQgbWlnaHQgYmUgdGhh
dCB1c2luZyBhIG1vbmtleSB3cmVuY2gKPiB3b3VsZCBiZSBhIG11Y2ggYmV0dGVyIHRvb2wgdGhh
dCBpcyBtdWNoIGVhc2llci4KPiAKPiBXaGF0IHdvdWxkIHlvdSBzYXkgdG8gYSB3b29kIHdvcmtl
ciBvYmplY3RpbmcgdGhhdCBhIHRvb2xib3ggc2hvdWxkCj4gY29udGFpbiBhIG1vbmtleSB3cmVu
Y2ggYmVjYXVzZSBoZSBhbHJlYWR5IGtub3dzIGhvdyB0byB1c2UgdmlzZQo+IGdyaXBzLCBhbmQg
aGlzIHRpbnkgYnJhaW4gc2hvdWxkbid0IGJlIGZvcmNlZCB0byBsZWFybiBob3cgdG8gdXNlIGEK
PiB3cmVuY2ggd2hlbiBoZSBrbm93cyBob3cgdG8gdXNlIGEgdmlzZSBncmlwLCB3aGljaCBpcyBh
IHBlcmZlY3RseSBnb29kCj4gdG9vbD8KPiAKPiBJZiB5b3Ugd2FudCB0byB1c2UgdmljZSBncmlw
cyBhcyBhIGhhbW1lciwgc2NyZXdkcml2ZXIsIG1vbmtleSB3cmVuY2gsCj4gZXRjLiAgdGhlcmUn
cyBub3RoaW5nIHN0b3BwaW5nIHlvdSBmcm9tIGRvaW5nIHRoYXQuICBCdXQgaXQncyBub3QgZmFp
cgo+IHRvIG9iamVjdCB0byBvdGhlciBwZW9wbGUgd2hvIG1pZ2h0IHdhbnQgdG8gdXNlIGJldHRl
ciB0b29scy4KPiAKPiBUaGUgcmVhbGl0eSBpcyB0aGF0IHdlIGhhdmUgYSBsb3Qgb2YgdGVzdGlu
ZyB0b29scy4gIEl0J3Mgbm90IGp1c3QKPiBrc2VsZnRlc3RzLiAgVGhlcmUgaXMgeGZzdGVzdHMg
Zm9yIGZpbGUgc3lzdGVtIGNvZGUsIGJsa3Rlc3RzIGZvcgo+IGJsb2NrIGxheWVyIHRlc3RzLCBl
dGMuICAgV2UgdXNlIHRoZSByaWdodCB0b29sIGZvciB0aGUgcmlnaHQgam9iLgoKTW9yZSBzcGVj
aW91cyBhcmd1bWVudHMuCgotRnJhbmsKCj4gCj4gCQkJCQkJLSBUZWQKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
