Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5281E944
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5FF892F1;
	Wed, 15 May 2019 07:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A64892F1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 07:41:47 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e24so2761372edq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 00:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=2zskjbN09R5wendyqZQRHX/H4SiND0VyVsc8hHlWH90=;
 b=t2ZGerdlA7rywhqem9G0jJts8Nl75PsUbH2LUlgvf/QoT1bCTk7UmYgQGGnWoXrTse
 L8r0pF2iGFW6RdLgQiO1kPgXYI3hMgIOMWNrcUaMEencdF17ejajwSH+fbLrxBkMDa1L
 GGqY3B7NXqHTWtwvANmJVBJ80bS4FmcSx/HA0lTeMjNlFVIJSUqLLq/bjbBHNil7bi5S
 57IOZeh7zghCqbx0rI6GirZ0yMxp3Oq1IEms/GEXVQfmdTc4jrD2FeU7GR3WLGlv6HUN
 XwtK5yiyOfwo6ZlOOPELesMrD28uH0z3nmDKzp9xFsThCQIot5oro6vKXTBvItnDdJuw
 309g==
X-Gm-Message-State: APjAAAVV38EE1siKwMbkGTOTMhpHL4MCgV1B1M5CRH+g81qKuHHDLnXd
 JRbrkmCzCdKNwwta9pnn6Ov4ig==
X-Google-Smtp-Source: APXvYqxlVorrQMT/bjOZ2bxd9Tq8NFaUM6+xiZePbw/NWhiH17BnzbbypQzqxmDX8X/b0giy2e7tHQ==
X-Received: by 2002:a50:8dcd:: with SMTP id s13mr40466209edh.247.1557906106265; 
 Wed, 15 May 2019 00:41:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b48sm515288edb.28.2019.05.15.00.41.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 00:41:45 -0700 (PDT)
Date: Wed, 15 May 2019 09:41:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190515074141.GY17751@phenom.ffwll.local>
Mail-Followup-To: Brendan Higgins <brendanhiggins@google.com>,
 Theodore Ts'o <tytso@mit.edu>,
 Frank Rowand <frowand.list@gmail.com>, Tim.Bird@sony.com,
 Knut Omang <knut.omang@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Kees Cook <keescook@google.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>,
 Rob Herring <robh@kernel.org>, sboyd@kernel.org,
 Shuah Khan <shuah@kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 kunit-dev@googlegroups.com,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Amir Goldstein <amir73il@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, jdike@addtoit.com,
 Joel Stanley <joel@jms.id.au>, Julia Lawall <julia.lawall@lip6.fr>,
 Kevin Hilman <khilman@baylibre.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Petr Mladek <pmladek@suse.com>, Richard Weinberger <richard@nod.at>,
 David Rientjes <rientjes@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com
References: <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
 <20190511173344.GA8507@mit.edu>
 <20190513144451.GQ17751@phenom.ffwll.local>
 <20190514060433.GA181462@google.com>
 <CAKMK7uHqtSF_sazJTbFL+xmQJRk4iwukCKZHoDHhsKkLXk=ECQ@mail.gmail.com>
 <20190514183618.GC109557@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514183618.GC109557@google.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=2zskjbN09R5wendyqZQRHX/H4SiND0VyVsc8hHlWH90=;
 b=JZJQkfh5WJgpd9RQilQ/pHLDXquURzd9PP7da/2TJy+L6MibswSPsSTQCbNlnr0bG1
 H1IOgDxbiga6cG2caK4SV6oMYSjkhxEj+JDTxsL4iMvHGMPynSqbwQ1+W1ZidZdyDUfp
 A4O6d8SaTe4aarn+lAeSUMg2L9dS5IRK1y5uA=
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
Cc: Petr Mladek <pmladek@suse.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-nvdimm@lists.01.org,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 jdike@addtoit.com, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org,
 Tim.Bird@sony.com, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 sboyd@kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTE6MzY6MThBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDAyOjA1OjA1UE0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSAxNCwgMjAxOSBhdCA4OjA0IEFNIEJyZW5k
YW4gSGlnZ2lucwo+ID4gPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwNDo0NDo1MVBNICswMjAwLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+ID4gPiA+IE9uIFNhdCwgTWF5IDExLCAyMDE5IGF0IDAxOjMzOjQ0UE0gLTA0
MDAsIFRoZW9kb3JlIFRzJ28gd3JvdGU6Cj4gPiA+ID4gPiBPbiBGcmksIE1heSAxMCwgMjAxOSBh
dCAwMjoxMjo0MFBNIC0wNzAwLCBGcmFuayBSb3dhbmQgd3JvdGU6Cj4gPiA+ID4gPiA+IEhvd2V2
ZXIsIHRoZSByZXBseSBpcyBpbmNvcnJlY3QuICBLc2VsZnRlc3QgaW4ta2VybmVsIHRlc3RzICh3
aGljaAo+ID4gPiA+ID4gPiBpcyB0aGUgY29udGV4dCBoZXJlKSBjYW4gYmUgY29uZmlndXJlZCBh
cyBidWlsdCBpbiBpbnN0ZWFkIG9mIGFzCj4gPiA+ID4gPiA+IGEgbW9kdWxlLCBhbmQgYnVpbHQg
aW4gYSBVTUwga2VybmVsLiAgVGhlIFVNTCBrZXJuZWwgY2FuIGJvb3QsCj4gPiA+ID4gPiA+IHJ1
bm5pbmcgdGhlIGluLWtlcm5lbCB0ZXN0cyBiZWZvcmUgVU1MIGF0dGVtcHRzIHRvIGludm9rZSB0
aGUKPiA+ID4gPiA+ID4gaW5pdCBwcm9jZXNzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFVtLCBDaXRh
dGlvbiBuZWVkZWQ/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBkb24ndCBzZWUgYW55IGV2aWRlbmNl
IGZvciB0aGlzIGluIHRoZSBrc2VsZnRlc3QgZG9jdW1lbnRhdGlvbiwgbm9yCj4gPiA+ID4gPiBk
byBJIHNlZSBhbnkgZXZpZGVuY2Ugb2YgdGhpcyBpbiB0aGUga3NlbGZ0ZXN0IE1ha2VmaWxlcy4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGVyZSBleGlzdHMgdGVzdCBtb2R1bGVzIGluIHRoZSBrZXJu
ZWwgdGhhdCBydW4gYmVmb3JlIHRoZSBpbml0Cj4gPiA+ID4gPiBzY3JpcHRzIHJ1biAtLS0gYnV0
IHRoYXQncyBub3Qgc3RyaWN0bHkgc3BlYWtpbmcgcGFydCBvZiBrc2VsZnRlc3RzLAo+ID4gPiA+
ID4gYW5kIGRvIG5vdCBoYXZlIGFueSBraW5kIG9mIGluZnJhc3RydWN0dXJlLiAgQXMgbm90ZWQs
IHRoZQo+ID4gPiA+ID4ga3NlbGZ0ZXN0c19oYXJuZXNzIGhlYWRlciBmaWxlIGZ1bmRhbWVudGFs
bHkgYXNzdW1lcyB0aGF0IHlvdSBhcmUKPiA+ID4gPiA+IHJ1bm5pbmcgdGVzdCBjb2RlIGluIHVz
ZXJzcGFjZS4KPiA+ID4gPgo+ID4gPiA+IFllYWggSSByZWFsbHkgbGlrZSB0aGUgIm5vIHVzZXJz
cGFjZSByZXF1aXJlZCBhdCBhbGwiIGRlc2lnbiBvZiBrdW5pdCwKPiA+ID4gPiB3aGlsZSBzdGls
bCBjb2xsZWN0aW5nIHJlc3VsdHMgaW4gYSB3ZWxsLWRlZmluZWQgd2F5ICh1bmxlc3MgdGhlIGN1
cnJlbnQKPiA+ID4gPiBzZWxmLXRlc3QgdGhhdCBqdXN0IHJ1biB3aGVuIHlvdSBsb2FkIHRoZSBt
b2R1bGUsIHdpdGggbWF5YmUgc29tZQo+ID4gPiA+IGtzZWxmdGVzdCBhZC1ob2Mgd3JhcHBlciBh
cm91bmQgdG8gY29sbGVjdCB0aGUgcmVzdWx0cykuCj4gPiA+ID4KPiA+ID4gPiBXaGF0IEkgd2Fu
dCB0byBkbyBsb25nLXRlcm0gaXMgdG8gcnVuIHRoZXNlIGtlcm5lbCB1bml0IHRlc3RzIGFzIHBh
cnQgb2YKPiA+ID4gPiB0aGUgYnVpbGQtdGVzdGluZywgbW9zdCBsaWtlbHkgaW4gZ2l0bGFiIChz
b29uZXIgb3IgbGF0ZXIsIGZvciBkcm0uZ2l0Cj4gPiA+Cj4gPiA+IFRvdGFsbHkhIFRoaXMgaXMg
cGFydCBvZiB0aGUgcmVhc29uIEkgaGF2ZSBiZWVuIGluc2lzdGluZyBvbiBhIG1pbmltdW0KPiA+
ID4gb2YgVU1MIGNvbXBhdGliaWxpdHkgZm9yIGFsbCB1bml0IHRlc3RzLiBJZiB5b3UgY2FuIHN1
ZmZpZW50bHkgY29uc3RyYWluCj4gPiA+IHRoZSBlbnZpcm9ubWVudCB0aGF0IGlzIHJlcXVpcmVk
IGZvciB0ZXN0cyB0byBydW4gaW4sIGl0IG1ha2VzIGl0IG11Y2gKPiA+ID4gZWFzaWVyIG5vdCBv
bmx5IGZvciBhIGh1bWFuIHRvIHJ1biB5b3VyIHRlc3RzLCBidXQgaXQgYWxzbyBtYWtlcyBpdCBh
Cj4gPiA+IGxvdCBlYXNpZXIgZm9yIGFuIGF1dG9tYXRlZCBzZXJ2aWNlIHRvIGJlIGFibGUgdG8g
cnVuIHlvdXIgdGVzdHMuCj4gPiA+Cj4gPiA+IEkgYWN0dWFsbHkgaGF2ZSBhIHByb3RvdHlwZSBw
cmVzdWJtaXQgYWxyZWFkeSB3b3JraW5nIG9uIG15Cj4gPiA+ICJzdGFibGUvbm9uLXVwc3RyZWFt
IiBicmFuY2guIFlvdSBjYW4gY2hlY2tvdXQgd2hhdCBwcmVzdWJtaXQgcmVzdWx0cwo+ID4gPiBs
b29rIGxpa2UgaGVyZVsxXVsyXS4KPiA+IAo+ID4gdWcgZ2Vycml0IDotKQo+IAo+IFllYWgsIHll
YWgsIEkga25vdywgYnV0IGl0IGlzIGEgbG90IGVhc2llciBmb3IgbWUgdG8gZ2V0IGEgcHJvamVj
dCBzZXQKPiB1cCBoZXJlIHVzaW5nIEdlcnJpdCwgd2hlbiB3ZSBhbHJlYWR5IHVzZSB0aGF0IGZv
ciBhIGxvdCBvZiBvdGhlcgo+IHByb2plY3RzLgo+IAo+IEFsc28sIEdlcnJpdCBoYXMgZ290dGVu
IGEgbG90IGJldHRlciBvdmVyIHRoZSBsYXN0IHR3byB5ZWFycyBvciBzby4gVHdvCj4geWVhcnMg
YWdvLCBJIHdvdWxkbid0IHRvdWNoIGl0IHdpdGggYSB0ZW4gZm9vdCBwb2xlLiBJdCdzIG5vdCBz
byBiYWQKPiBhbnltb3JlLCBhdCBsZWFzdCBpZiB5b3UgYXJlIHVzZWQgdG8gdXNpbmcgYSB3ZWIg
VUkgdG8gcmV2aWV3IGNvZGUuCgpJIHdhcyBzb21ld2hhdCBqb2tpbmcsIEknbSBqdXN0IG5vdCB1
c2VkIHRvIGdlcnJpdCAuLi4gQW5kIHNlZW1zIHRvIGluZGVlZApiZSBhIGxvdCBtb3JlIHBvbGlz
aGVkIHRoYW4gbGFzdCB0aW1lIEkgbG9va2VkIGF0IGl0IHNlcmlvdXNseS4KCj4gPiA+ID4gb25s
eSBvZmMpLiBTbyB0aGF0IHBlb3BsZSBnZXQgdGhlaXIgcHVsbCByZXF1ZXN0cyAoYW5kIHBhdGNo
IHNlcmllcywgd2UKPiA+ID4gPiBoYXZlIHNvbWUgaWRlYXMgdG8gdGllIHRoaXMgaW50byBwYXRj
aHdvcmspIGF1dG9tYXRpY2FsbHkgdGVzdGVkIGZvciB0aGlzCj4gPiA+Cj4gPiA+IE1pZ2h0IHRo
YXQgYmUgU25vd3BhdGNoWzNdPyBJIHRhbGtlZCB0byBSdXNzZWxsLCB0aGUgY3JlYXRvciBvZiBT
bm93cGF0Y2gsCj4gPiA+IGFuZCBoZSBzZWVtZWQgcHJldHR5IG9wZW4gdG8gY29sbGFib3JhdGlv
bi4KPiA+ID4KPiA+ID4gQmVmb3JlIEkgaGVhcmQgYWJvdXQgU25vd3BhdGNoLCBJIGhhZCBhbiBp
bnRlcm4gd3JpdGUgYSB0cmFuc2xhdGlvbgo+ID4gPiBsYXllciB0aGF0IG1hZGUgUHJvdyAodGhl
IHByZXN1Ym1pdCBzZXJ2aWNlIHRoYXQgSSB1c2VkIGluIHRoZSBwcm90b3R5cGUKPiA+ID4gYWJv
dmUpIHdvcmsgd2l0aCBMS01MWzRdLgo+ID4gCj4gPiBUaGVyZSdzIGFib3V0IDMtNCBmb3Jrcy9j
bG9uZXMgb2YgcGF0Y2h3b3JrLiBzbm93cGF0Y2ggaXMgb25lLCB3ZSBoYXZlCj4gPiBhIGRpZmZl
cmVudCBvbmUgb24gZnJlZWRlc2t0b3Aub3JnLiBJdCdzIGEgYml0IGEgbWVzcyA6LS8KPiAKPiBP
aCwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0LiBJIGZvdW5kIHlvdXIgcGF0Y2h3b3JrIGluc3RhbmNl
IGhlcmVbNV0sIGJ1dAo+IGRvIHlvdSBoYXZlIGEgcGxhY2Ugd2hlcmUgSSBjYW4gc2VlIHRoZSBj
aGFuZ2VzIHlvdSBoYXZlIGFkZGVkIHRvCj4gc3VwcG9ydCBwcmVzdWJtaXQ/CgpPayBoZXJlJ3Mg
YSBmZXcgbGlua3MuIEFzaWRlIGZyb20gdGhlIHVzdWFsIHBhdGNoIHZpZXcgd2UndmUgYWxzbyBh
ZGRlZCBhCnNlcmllcyB2aWV3OgoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3By
b2plY3QvaW50ZWwtZ2Z4L3Nlcmllcy8/b3JkZXJpbmc9LWxhc3RfdXBkYXRlZAoKVGhpcyB0aWVz
IHRoZSBwYXRjaGVzICsgY292ZXIgbGV0dGVyIHRvZ2V0aGVyLCBhbmQgaXQgZXZlbiAodHJpZXMg
dG8gYXQKbGVhc3QpIHRyYWNrIHJldmlzaW9ucy4gSGVyZSdzIGFuIGV4YW1wbGUgd2hpY2ggaXMg
Y3VycmVudGx5IGF0IHJldmlzaW9uCjk6CgpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvc2VyaWVzLzU3MjMyLwoKQmVsb3cgdGhlIHBhdGNoIGxpc3QgZm9yIGVhY2ggcmV2aXNpb24g
d2UgYWxzbyBoYXZlIHRoZSB0ZXN0IHJlc3VsdCBsaXN0LgpJZiB5b3UgY2xpY2sgb24gdGhlIGdy
ZXkgYmFyIGl0J2xsIGV4cGFuZCB3aXRoIHRoZSBzdW1tYXJ5IGZyb20gQ0ksIHRoZQoiU2VlIGZ1
bGwgbG9ncyIgaXMgbGluayB0byB0aGUgZnVsbCByZXN1bHRzIGZyb20gb3VyIENJLiBUaGlzIGlz
IGRyaXZlbgp3aXRoIHNvbWUgUkVTVCBhcGkgZnJvbSBvdXIgamVua2lucy4KClBhdGNod29yayBh
bHNvIHNlbmRzIG91dCBtYWlscyBmb3IgdGhlc2UgcmVzdWx0cy4KClNvdXJjZSBpcyBvbiBnaXRs
YWI6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9wYXRjaHdvcmstZmRvCiAKPiA+ID4g
SSBhbSBub3QgbWFycmllZCB0byBlaXRoZXIgYXBwcm9hY2gsIGJ1dCBJIHRoaW5rIGJldHdlZW4g
dGhlIHR3byBvZgo+ID4gPiB0aGVtLCBtb3N0IG9mIHRoZSBpbml0aWFsIGxlZ3dvcmsgaGFzIGJl
ZW4gZG9uZSB0byBtYWtlIHByZXN1Ym1pdCBvbgo+ID4gPiBMS01MIGEgcmVhbGl0eS4KPiA+IAo+
ID4gV2UgZG8gaGF2ZSBwcmVzdWJtaXQgQ0kgd29ya2luZyBhbHJlYWR5IHdpdGggb3VyIGZyZWVk
ZXNrdG9wLm9yZwo+ID4gcGF0Y2h3b3JrLiBUaGUgbWlzc2luZyBnbHVlIGlzIGp1c3QgdHlpbmcg
dGhhdCBpbnRvIGdpdGxhYiBDSSBzb21laG93Cj4gPiAoc2luY2Ugd2Ugd2FudCB0byB1bmlmeSBi
dWlsZCB0ZXN0aW5nIG1vcmUgYW5kIG1ha2UgaXQgZWFzaWVyIGZvcgo+ID4gY29udHJpYnV0b3Jz
IHRvIGFkanVzdCB0aGluZ3MpLgo+IAo+IEkgY2hlY2tlZCBvdXQgYSBjb3VwbGUgb2YgeW91ciBw
cm9qZWN0cyBvbiB5b3VyIHBhdGNod29yayBpbnN0YW5jZTogQU1ECj4gWC5PcmcgZHJpdmVycywg
RFJJIGRldmVsLCBhbmQgV2F5bGFuZC4gSSBzYXcgdGhlIHRhYiB5b3UgYWRkZWQgZm9yCj4gdGVz
dHMsIGJ1dCBub25lIG9mIHRoZW0gYWN0dWFsbHkgaGFkIGFueSB0ZXN0IHJlc3VsdHMuIENhbiB5
b3UgcG9pbnQgbWUKPiBhdCBvbmUgdGhhdCBkb2VzPwoKQXRtIHdlIHVzZSB0aGUgQ0kgc3R1ZmYg
b25seSBvbiBpbnRlbC1nZngsIHdpdGggdGhlIG91ciBncHUgQ0kgZmFybSwgc2VlCmxpbmtzIGFi
b3ZlLgoKQ2hlZXJzLCBEYW5pZWwKCj4gCj4gQ2hlZXJzIQo+IAo+IFs1XSBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvCj4gCj4gPiA+ID4gc3VwZXIgYmFzaWMgc3R1ZmYuCj4gPiA+
Cj4gPiA+IEkgYW0gcmVhbGx5IGV4Y2l0ZWQgdG8gaGVhciBiYWNrIG9uIHdoYXQgeW91IHRoaW5r
IQo+ID4gPgo+ID4gPiBDaGVlcnMhCj4gPiA+Cj4gPiA+IFsxXSBodHRwczovL2t1bml0LXJldmll
dy5nb29nbGVzb3VyY2UuY29tL2MvbGludXgvKy8xNTA5LzEwI21lc3NhZ2UtN2JmYTQwZWZiMTMy
ZTE1YzgzODg3NTVjMjczODM3NTU5OTExNDI1Ywo+ID4gPiBbMl0gaHR0cHM6Ly9rdW5pdC1yZXZp
ZXcuZ29vZ2xlc291cmNlLmNvbS9jL2xpbnV4LysvMTUwOS8xMCNtZXNzYWdlLWE2Nzg0NDk2ZWFm
ZmY0NDJhYzk4ZmIwNjhiZjFhMGYzNmVlNzM1MDkKPiA+ID4gWzNdIGh0dHBzOi8vZGV2ZWxvcGVy
LmlibS5jb20vb3Blbi9wcm9qZWN0cy9zbm93cGF0Y2gvCj4gPiA+IFs0XSBodHRwczovL2t1bml0
Lmdvb2dsZXNvdXJjZS5jb20vcHJvdy1sa21sLwo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
PiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
