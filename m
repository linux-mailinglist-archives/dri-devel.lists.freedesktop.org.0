Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF796888
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 20:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87418984C;
	Tue, 20 Aug 2019 18:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27BE8984C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 18:24:57 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n4so3704924pgv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 11:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=54TsZDfDW3TriN1nqx27Ow/a4BBsLJIgLp0TtrQghOk=;
 b=PMasMMwaU4N73Z+Q/5bu7apnlemZ/wbANvdc1GpMCYdsFyeGr4WanIj6w96OjB+AIE
 hanjYfT20TUIhUVE0Dp+ArNCbO+4iMeqkPN5fDYYx7Nav4NXpoNlED6jt51CF2Kp6Aqg
 HufAydimmB379JuKZXA2aISOWw1aqGnwqb9eCzefyxohTPSQ7jH8slnc6AnHO/O/RbQm
 k1X+n82jIhHs0PYTvuWynUBBZV5NTONXg6zRsHrzpLZg19O3c0LUJx2raTKM4XPfNI4Q
 4aYC7p6u6GL3Msfk3XKUf6EXYf47tjurH9SibU5kbk7XezlzhH18jMJA47+0rEocTNTj
 ylPw==
X-Gm-Message-State: APjAAAVsG5op8SfmsYQEXVZ0hhmqcgqKPoWxXXp69lz9/OrdtXaqe5iG
 KXf3gTKBI5uog6ClWjd97dJQdw==
X-Google-Smtp-Source: APXvYqz6e4UEkK1ofDpL52W0zxkSIj5ZMAzgsILYeZML13HEn/+04ibT+w1ZAtBgHDGP+VY3TZZ4jA==
X-Received: by 2002:a17:90a:3aaf:: with SMTP id
 b44mr1312628pjc.87.1566325496873; 
 Tue, 20 Aug 2019 11:24:56 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
 by smtp.gmail.com with ESMTPSA id u16sm20305376pgm.83.2019.08.20.11.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 11:24:55 -0700 (PDT)
Date: Tue, 20 Aug 2019 11:24:50 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: shuah <shuah@kernel.org>
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190820182450.GA38078@google.com>
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <5b880f49-0213-1a6e-9c9f-153e6ab91eeb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b880f49-0213-1a6e-9c9f-153e6ab91eeb@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=54TsZDfDW3TriN1nqx27Ow/a4BBsLJIgLp0TtrQghOk=;
 b=ETn6ov6vEQVZ6Z8d+QOJIR5ZdOHT4ZDivDB2VkpQ0qnDIs9MQrQ638udwnr/9nsV39
 Q9CE1bjJjQqBou8vTO6RAPzU8X9Tiq1MLFyQK2/DJWm5diN99WuwayJaLt2azZswGQO6
 PgJRFVxL4YQGtCWP5gy6mT//u52PocvwVbmI1tMnbwHSew1qhj9G4kLkgm0cfOXOG/+z
 KBuOacguM7Ku15bvGQe9U+2RVhwBdPlfoBEveO5qY2aaNvMSGTBP0IPNRwdL5M9uwBLI
 rRbk5djqLbCbCvoJbmUcAx9Gb5ONtUGkfOKYOiRtBndtwfw3IyR9R3OQOevfv1X/iVGx
 ii2w==
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 amir73il@gmail.com, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, yamada.masahiro@socionext.com,
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, frowand.list@gmail.com,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 jpoimboe@redhat.com, Bjorn Helgaas <bhelgaas@google.com>,
 kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at, sboyd@kernel.org,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTE6MjQ6NDVBTSAtMDYwMCwgc2h1YWggd3JvdGU6Cj4g
T24gOC8xMy8xOSAxMTo1MCBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4gIyMgVEw7RFIK
PiA+IAo+ID4gVGhpcyByZXZpc2lvbiBhZGRyZXNzZXMgY29tbWVudHMgZnJvbSBTdGVwaGVuIGFu
ZCBCam9ybiBIZWxnYWFzLiBNb3N0Cj4gPiBjaGFuZ2VzIGFyZSBwcmV0dHkgbWlub3Igc3R1ZmYg
dGhhdCBkb2Vzbid0IGFmZmVjdCB0aGUgQVBJIGluIGFueXdheS4KPiA+IE9uZSBzaWduaWZpY2Fu
dCBjaGFuZ2UsIGhvd2V2ZXIsIGlzIHRoYXQgSSBhZGRlZCBzdXBwb3J0IGZvciBmcmVlaW5nCj4g
PiBrdW5pdF9yZXNvdXJjZSBtYW5hZ2VkIHJlc291cmNlcyBiZWZvcmUgdGhlIHRlc3QgY2FzZSBp
cyBmaW5pc2hlZCB2aWEKPiA+IGt1bml0X3Jlc291cmNlX2Rlc3Ryb3koKS4gQWRkaXRpb25hbGx5
LCBCam9ybiBwb2ludGVkIG91dCB0aGF0IEkgYnJva2UKPiA+IEtVbml0IG9uIGNlcnRhaW4gY29u
ZmlndXJhdGlvbnMgKGxpa2UgdGhlIGRlZmF1bHQgb25lIGZvciB4ODYsIHdob29wcykuCj4gPiAK
PiA+IEJhc2VkIG9uIFN0ZXBoZW4ncyBmZWVkYmFjayBvbiB0aGUgcHJldmlvdXMgY2hhbmdlLCBJ
IHRoaW5rIHdlIGFyZQo+ID4gcHJldHR5IGNsb3NlLiBJIGFtIG5vdCBleHBlY3RpbmcgYW55IHNp
Z25pZmljYW50IGNoYW5nZXMgZnJvbSBoZXJlIG9uCj4gPiBvdXQuCj4gPiAKPiAKPiBIaSBCcmVu
ZGFuLAo+IAo+IEkgZm91bmQgY2hlY2twYXRjaCBlcnJvcnMgaW4gb25lIG9yIHR3byBwYXRjaGVz
LiBDYW4geW91IGZpeCB0aG9zZSBhbmQKPiBzZW5kIHYxNC4KCkhpIFNodWFoLAoKQXJlIHlvdSBy
ZWZlcmluZyB0byB0aGUgZm9sbG93aW5nIGVycm9ycz8KCkVSUk9SOiBNYWNyb3Mgd2l0aCBjb21w
bGV4IHZhbHVlcyBzaG91bGQgYmUgZW5jbG9zZWQgaW4gcGFyZW50aGVzZXMKIzE0NDogRklMRTog
aW5jbHVkZS9rdW5pdC90ZXN0Lmg6NDU2OgorI2RlZmluZSBLVU5JVF9CSU5BUllfQ0xBU1MgXAor
ICAgICAgIGt1bml0X2JpbmFyeV9hc3NlcnQsIEtVTklUX0lOSVRfQklOQVJZX0FTU0VSVF9TVFJV
Q1QKCkVSUk9SOiBNYWNyb3Mgd2l0aCBjb21wbGV4IHZhbHVlcyBzaG91bGQgYmUgZW5jbG9zZWQg
aW4gcGFyZW50aGVzZXMKIzE0NjogRklMRTogaW5jbHVkZS9rdW5pdC90ZXN0Lmg6NDU4OgorI2Rl
ZmluZSBLVU5JVF9CSU5BUllfUFRSX0NMQVNTIFwKKyAgICAgICBrdW5pdF9iaW5hcnlfcHRyX2Fz
c2VydCwgS1VOSVRfSU5JVF9CSU5BUllfUFRSX0FTU0VSVF9TVFJVQ1QKClRoZXNlIHZhbHVlcyBz
aG91bGQgKm5vdCogYmUgaW4gcGFyZW50aGVzZXMuIEkgYW0gZ3Vlc3NpbmcgY2hlY2twYXRjaCBp
cwpnZXR0aW5nIGNvbmZ1c2VkIGFuZCB0aGlua3MgdGhhdCB0aGVzZSBhcmUgY29tcGxleCBleHBy
ZXNzaW9ucywgd2hlbgp0aGV5IGFyZSBub3QuCgpJIGlnbm9yZWQgdGhlIGVycm9ycyBzaW5jZSBJ
IGZpZ3VyZWQgY2hlY2twYXRjaCB3YXMgY29tcGxhaW5pbmcKZXJyb25lb3VzbHkuCgpJIGNvdWxk
IHJlZmFjdG9yIHRoZSBjb2RlIHRvIHJlbW92ZSB0aGVzZSBtYWNyb3MgZW50aXJlbHksIGJ1dCBJ
IHRoaW5rCnRoZSBjb2RlIGlzIGNsZWFuZXIgd2l0aCB0aGVtLgoKV2hhdCB3b3VsZCB5b3UgcHJl
ZmVyIEkgZG8/CgpOQjogVGhlc2UgbWFjcm9zIGFyZSBpbnRyb2R1Y2VkIGluOiAiW1BBVENIIHYx
MyAwNS8xOF0ga3VuaXQ6IHRlc3Q6IGFkZAp0aGUgY29uY2VwdCBvZiBleHBlY3RhdGlvbnMiCgpU
aGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
