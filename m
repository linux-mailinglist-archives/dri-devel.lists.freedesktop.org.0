Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50371E8EC
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42268961E;
	Wed, 15 May 2019 07:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BB78935A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 00:26:51 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id n19so378199pfa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 17:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ypDVsaFFOykr6yuKVx2k2XaJyOr+u5tERYjVpiOjyiw=;
 b=LCG4BW4opL11Il/sblTm99PoSUO2hK2l9qqZsWAxUTEMrBj4CgZA7YxegT+YUgOemz
 V/fr9D+lhg8j99YQPAZ7iAoHpReVERWcWrIzmNPbfmkG+VGMlqxnogtvlRxYH/8JDKmc
 Ny+lSE+cyuaaCg4lOrYO8sNr8aXJtsFZuTDvPUZjqVY0OpM3zAhR41LTnCiZB2zvDFbW
 Cgz5MLXwRS0rkSc7fi2C/Uqt+eRUTtYxzR0evWEWOibJZNWBC93LRYF5NgKa/v4PEY8l
 n95NgMOarMSqkCV2BJ6SM3R59pSOCaENMghFi9eVlad8AtAV168NwQWtt3EYw8NVxJPS
 Vzwg==
X-Gm-Message-State: APjAAAWQo+W788+y34RcVtZLMejmXL5vqCpwAb0zX2jt3B+RGJnuxG9O
 LDSIyEoXiM/aeh75RXYR8kI=
X-Google-Smtp-Source: APXvYqzd3JNtsP3FkyXRtoQpQjmSxi6gP+3fyLytxrHZq7D+o9iT6N45YBj70jF10Gduz840x4f9ig==
X-Received: by 2002:a63:1c4:: with SMTP id 187mr13725679pgb.317.1557880010775; 
 Tue, 14 May 2019 17:26:50 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net.
 [24.6.192.50])
 by smtp.gmail.com with ESMTPSA id 204sm272559pgh.50.2019.05.14.17.26.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 17:26:50 -0700 (PDT)
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Theodore Ts'o <tytso@mit.edu>, Tim.Bird@sony.com, knut.omang@oracle.com,
 gregkh@linuxfoundation.org, brendanhiggins@google.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org, shuah@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-um@lists.infradead.org, Alexander.Levin@microsoft.com,
 amir73il@gmail.com, dan.carpenter@oracle.com, dan.j.williams@intel.com,
 daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
 khilman@baylibre.com, logang@deltatee.com, mpe@ellerman.id.au,
 pmladek@suse.com, richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
 wfg@linux.intel.com
References: <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
 <20190511173344.GA8507@mit.edu>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <a305c732-9953-8724-b4a4-25aa50c89365@gmail.com>
Date: Tue, 14 May 2019 17:26:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190511173344.GA8507@mit.edu>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ypDVsaFFOykr6yuKVx2k2XaJyOr+u5tERYjVpiOjyiw=;
 b=IuVZ2l4O+MIDyXpYgUM5qQQYoX7Y/sJsvGPvmvehKAC4lwwIGDudhzngFBjnRWN5ci
 k8JCzwMxo0FPATgnUf4u2R2YAGB3ucoMe6dvaUUgS8cW7nlEYr0d+QFwmikIyWdOae9X
 BS5/vwSRCViiC8xY3hAHYh4bpV2zhvnq0blTNTPWsFb+XmhdfxM+Bo2jZReJurV/GrST
 8fIBxa0ZCqTTyE7l8H4cMfsveUZmMSCHTxDv7jz/q6pmMaZ1VAUfFLnS/1mPPZOC7zye
 iSrgkJ/pxklMI6fKQALs4Yf/9f1VNfTv8Na0CM/+Hu116UCn5U7KYQb+xYIHEY5zeGUw
 h+Gw==
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

T24gNS8xMS8xOSAxMDozMyBBTSwgVGhlb2RvcmUgVHMnbyB3cm90ZToKPiBPbiBGcmksIE1heSAx
MCwgMjAxOSBhdCAwMjoxMjo0MFBNIC0wNzAwLCBGcmFuayBSb3dhbmQgd3JvdGU6Cj4+IEhvd2V2
ZXIsIHRoZSByZXBseSBpcyBpbmNvcnJlY3QuICBLc2VsZnRlc3QgaW4ta2VybmVsIHRlc3RzICh3
aGljaAo+PiBpcyB0aGUgY29udGV4dCBoZXJlKSBjYW4gYmUgY29uZmlndXJlZCBhcyBidWlsdCBp
biBpbnN0ZWFkIG9mIGFzCj4+IGEgbW9kdWxlLCBhbmQgYnVpbHQgaW4gYSBVTUwga2VybmVsLiAg
VGhlIFVNTCBrZXJuZWwgY2FuIGJvb3QsCj4+IHJ1bm5pbmcgdGhlIGluLWtlcm5lbCB0ZXN0cyBi
ZWZvcmUgVU1MIGF0dGVtcHRzIHRvIGludm9rZSB0aGUKPj4gaW5pdCBwcm9jZXNzLgo+IAo+IFVt
LCBDaXRhdGlvbiBuZWVkZWQ/CgpUaGUgcGFyYWdyYXBoIHRoYXQgeW91IHF1b3RlZCB0ZWxscyB5
b3UgZXhhY3RseSBob3cgdG8gcnVuIGEga3NlbGZ0ZXN0CmluLWtlcm5lbCB0ZXN0IGluIGEgVU1M
IGtlcm5lbC4gIEp1c3QgdG8gd2hhdCB0aGF0IHBhcmFncmFwaCBzYXlzLgoKCj4gCj4gSSBkb24n
dCBzZWUgYW55IGV2aWRlbmNlIGZvciB0aGlzIGluIHRoZSBrc2VsZnRlc3QgZG9jdW1lbnRhdGlv
biwgbm9yCj4gZG8gSSBzZWUgYW55IGV2aWRlbmNlIG9mIHRoaXMgaW4gdGhlIGtzZWxmdGVzdCBN
YWtlZmlsZXMuCj4gCj4gVGhlcmUgZXhpc3RzIHRlc3QgbW9kdWxlcyBpbiB0aGUga2VybmVsIHRo
YXQgcnVuIGJlZm9yZSB0aGUgaW5pdAo+IHNjcmlwdHMgcnVuIC0tLSBidXQgdGhhdCdzIG5vdCBz
dHJpY3RseSBzcGVha2luZyBwYXJ0IG9mIGtzZWxmdGVzdHMsCj4gYW5kIGRvIG5vdCBoYXZlIGFu
eSBraW5kIG9mIGluZnJhc3RydWN0dXJlLiAgQXMgbm90ZWQsIHRoZQo+IGtzZWxmdGVzdHNfaGFy
bmVzcyBoZWFkZXIgZmlsZSBmdW5kYW1lbnRhbGx5IGFzc3VtZXMgdGhhdCB5b3UgYXJlCj4gcnVu
bmluZyB0ZXN0IGNvZGUgaW4gdXNlcnNwYWNlLgoKWW91IGFyZSBpZ25vcmluZyB0aGUga3NlbGZ0
ZXN0IGluLWtlcm5lbCB0ZXN0cy4KCldlIGFyZSB0YWxraW5nIGluIGNpcmNsZXMuICBJJ20gZG9u
ZSB3aXRoIHRoaXMgdGhyZWFkLgoKLUZyYW5rCgo+IAo+IAkJCQktIFRlZAo+IC4KPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
