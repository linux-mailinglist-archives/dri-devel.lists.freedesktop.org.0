Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E57D1E57C
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 01:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0CD8935B;
	Tue, 14 May 2019 23:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF5989359
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 23:19:09 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id f12so332518plt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 16:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=65cWsglVoepzFlykZ42+abk0YI6VmpB8isURvrndfio=;
 b=f3ZM1bE3CIKpD3BZr8ClKQpraBSeY5RGknCw1Ora93k3w14i5rvEPBJojPbmnKrW7f
 j3XeLuhF1ozNr38v1xb7FntEMUNIh3ebtlQVI4hEIsFX/CiykEvfAuJ+Gv/64FOIzWO4
 8Bv46yRfWugQcfXDrqUIRzBLD2JvXI9KBcM8lOhWsecAGDsAs4WDBxpFf3Me0muGfT1d
 VZPoJGuSZCCqncZZQq6yHdYg6lZHfeRceAzkFWl5+kKszw2LEUGZFZJJmK8/aSVf9y+G
 sKmUS+EHa+lE70xu728HDAAi8yLaoyttzfK3GbaQkfp0p+Bv+iTnU5YjrrIYrotxacsk
 FM9w==
X-Gm-Message-State: APjAAAXaZr0A2l6wOY3jmo34t5PIbRIcwVJY/GqRxbz73HjUdergI2Oh
 a8lwzodXmozioPHvtCMDAPf74w==
X-Google-Smtp-Source: APXvYqwRc6VN5ebH7uglXTpSRZvZHWA1IEE/QiHsPmobJB2SKK6EBwf8uUbYe/O8Vc0yLOYiPNp2/w==
X-Received: by 2002:a17:902:5998:: with SMTP id
 p24mr23416476pli.9.1557875948193; 
 Tue, 14 May 2019 16:19:08 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:2:d714:29b4:a56b:b23b])
 by smtp.gmail.com with ESMTPSA id p64sm253565pfp.72.2019.05.14.16.19.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 14 May 2019 16:19:07 -0700 (PDT)
Date: Tue, 14 May 2019 16:19:02 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 15/18] Documentation: kunit: add documentation for KUnit
Message-ID: <20190514231902.GA12893@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-16-brendanhiggins@google.com>
 <20190514073422.4287267c@lwn.net>
 <20190514180810.GA109557@google.com>
 <20190514121623.0314bf07@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514121623.0314bf07@lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=65cWsglVoepzFlykZ42+abk0YI6VmpB8isURvrndfio=;
 b=Bg39hYCrdxq9ZvR+2i/HlXSRaq6orpc1oOB8WF33oCVFV3rNh0CexWyS1Z8QPqlm8F
 634lbyY40ksqDjssWKmNVtGI+1F3APRXwSAL0XqoS1nJrYkqeYOkCUNp8JWFWm6ZNg2N
 3YnG2RckdXyh7Hd/JvDkJlfyEQP3VpBJF0SPvweC+YvdIQjG/OVFu00sC5S5PmUtedb0
 57OXt1xXLQFMEhV58WldO2KsTL77idwyKmIM1odUUjPKE4+37YyS67kBXQTSZPy0lER0
 iehTg4wcOiUIvCRTLfByhOie4AbWZpgc/tuXOmP4dOA/iaDvGuiNcBG7UtbS06g67YaV
 pQVw==
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 yamada.masahiro@socionext.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-nvdimm@lists.01.org,
 frowand.list@gmail.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 dan.j.williams@intel.com, kunit-dev@googlegroups.com, tytso@mit.edu,
 richard@nod.at, sboyd@kernel.org, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org, logang@deltatee.com,
 khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTI6MTY6MjNQTSAtMDYwMCwgSm9uYXRoYW4gQ29yYmV0
IHdyb3RlOgo+IE9uIFR1ZSwgMTQgTWF5IDIwMTkgMTE6MDg6MTAgLTA3MDAKPiBCcmVuZGFuIEhp
Z2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+IAo+ID4gPiBOYXR1cmFs
bHksIHRob3VnaCwgSSBoYXZlIG9uZSByZXF1ZXN0OiBJJ2QgcmF0aGVyIG5vdCBzZWUgdGhpcyBh
dCB0aGUgdG9wCj4gPiA+IGxldmVsLCB3aGljaCBpcyBtb3JlIHRoYW4gY3Jvd2RlZCBlbm91Z2gg
YXMgaXQgaXMuICBDYW4gdGhpcyBtYXRlcmlhbAo+ID4gPiBwbGVhc2UgZ28gaW50byB0aGUgZGV2
ZWxvcG1lbnQgdG9vbHMgYm9vaywgYWxvbmdzaWRlIHRoZSBrc2VsZnRlc3QKPiA+ID4gZG9jdW1l
bnRhdGlvbj8KCkhtbW0uLi5wcm9iYWJseSBwcmVtYXR1cmUgdG8gYnJpbmcgdGhpcyB1cCwgYnV0
IERvY3VtZW50YXRpb24vZGV2LXRvb2xzLwppcyBraW5kIG9mIHRocm93biB0b2dldGhlci4KCkl0
IHdvdWxkIGJlIG5pY2UgdG8gcHJvdmlkZSBhIGNvaGVyZW50IG92ZXJ2aWV3LCBtYXliZSBwcm92
aWRlIHNvbWUKYmFzaWMgZ3JvdXBpbmcgYXMgd2VsbC4KCkl0IHdvdWxkIGJlIG5pY2UgaWYgdGhl
cmUgd2FzIGtpbmQgb2YgYSBnZW50bGUgaW50cm9kdWN0aW9uIHRvIHRoZQp0b29scywgd2hpY2gg
b25lcyB5b3Ugc2hvdWxkIGJlIGxvb2tpbmcgYXQsIHdoZW4sIHdoeSwgZXRjLgoKPiA+IE9oIHll
YWgsIHRoYXQgc2VlbXMgbGlrZSB0aGUgb2J2aW91cyBob21lIGZvciB0aGlzIGluIGhpbmRzaWdo
dC4gU29ycnkKPiA+IGFib3V0IHRoYXQuIFdpbGwgZml4IGluIG5leHQgcmV2aXNpb24hCj4gCj4g
Tm8gbmVlZCB0byBhcG9sb2dpemUgLSBJIGhhdmUgdG8gc2F5IHRoZSBzYW1lIHRoaW5nIHRvIGV2
ZXJ5Ym9keSA6KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
