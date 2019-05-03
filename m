Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4541282F
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B3B896EC;
	Fri,  3 May 2019 06:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7327989230
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 01:45:48 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id e67so2043493pfe.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 18:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZI6V/3n9+pa4S0kSap/rsqYeZseF3YXwwsnTTpOXHxI=;
 b=IOyvJmnVUlSv1TF83O+DLUv91S2XDjOPi4K4VtSGzEneZLnCaFjzVqqZijhj7YaKl7
 ceIzCf5xtt2zCvUeg7+G+wnM1+q8uenQ9gvo20+L213PHBe3BMKZlkOepG0YsiF4EQzL
 PgdoRjU8ZgegUJRNhCFEq4O3mys2zLMuotIVvx9/PAxe1oyBSwh0WHZ4n45NuUk2UJx4
 /bzMkr4yVK+RCxKWbkFDIKrqDJQpcdjzTGutkW213m1a7o8KiZHiJU2GuYNTviDYZTzp
 tHNHrBDiO8NI/9ADsBBo3csVq9hbHPTq+9/iHLhFCveSrK1UGjzIZ3IM+t3p9uH0o6nU
 3lgA==
X-Gm-Message-State: APjAAAVVZz27rz+JFk4yEchEMgV7KANceUi6KsH75e5gjbpwoPmOqhZW
 N/2kFAW2wf5ISy24kemkIzo=
X-Google-Smtp-Source: APXvYqwLxZ+uFuQZMF4YJqc7fAzpwsWGuH9RLKcLO+fHr/MYoaYjH8+9zszylWu8LEhaolJS2L6VrQ==
X-Received: by 2002:a63:5907:: with SMTP id n7mr7320611pgb.416.1556847948068; 
 Thu, 02 May 2019 18:45:48 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net.
 [24.6.192.50])
 by smtp.gmail.com with ESMTPSA id n7sm553500pff.45.2019.05.02.18.45.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 18:45:47 -0700 (PDT)
Subject: Re: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
To: Brendan Higgins <brendanhiggins@google.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
 <20190502110220.GD12416@kroah.com>
 <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
 <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
 <CAFd5g44iWRchQKdJYtjRtPY6e-6e0eXpKXXsx5Ooi6sWE474KA@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <1a5f3c44-9fa9-d423-66bf-45255a90c468@gmail.com>
Date: Thu, 2 May 2019 18:45:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g44iWRchQKdJYtjRtPY6e-6e0eXpKXXsx5Ooi6sWE474KA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZI6V/3n9+pa4S0kSap/rsqYeZseF3YXwwsnTTpOXHxI=;
 b=IzHws9INfv0Wab3PqWryc8nXLCUGl4Ak0ErN4UWGz/oa5Q3bx6Ym7vUbFg2Dqx16VW
 oWE14P70+9bC1kEcyxNogt4I3P4HndkNs5RErp+blOBqwXOoN+sRvrDOyunNPFAxApZ5
 GWxjJ458WsmG94/7XtkxgO5qMOVf/y0XY4UKG2ctayvfs5F5tkmBrAfFfxXWLQNmhozQ
 FgGdqQvM57obG+wUH3nrNRoNeYxwOGWCGFCKwlnl1UPR6OSjdtuSR+1SF1yttamHwiuF
 tHVqZdYB3J/J9HrwSMl4npzfzK/jusV2Hy+t88avqIGeQLvbQa2sXZZ+CQyhzOUMI8Al
 H3bg==
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yLzE5IDQ6NDUgUE0sIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiBPbiBUaHUsIE1heSAy
LCAyMDE5IGF0IDI6MTYgUE0gRnJhbmsgUm93YW5kIDxmcm93YW5kLmxpc3RAZ21haWwuY29tPiB3
cm90ZToKPj4KPj4gT24gNS8yLzE5IDExOjA3IEFNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4+
PiBPbiBUaHUsIE1heSAyLCAyMDE5IGF0IDQ6MDIgQU0gR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDQ6
MDE6MjFQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+Pj4+PiBGcm9tOiBGZWxpeCBH
dW8gPGZlbGl4Z3VveGl1cGluZ0BnbWFpbC5jb20+Cj4+Pj4+Cj4+Pj4+IFRoZSB1bHRpbWF0ZSBn
b2FsIGlzIHRvIGNyZWF0ZSBtaW5pbWFsIGlzb2xhdGVkIHRlc3QgYmluYXJpZXM7IGluIHRoZQo+
Pj4+PiBtZWFudGltZSB3ZSBhcmUgdXNpbmcgVU1MIHRvIHByb3ZpZGUgdGhlIGluZnJhc3RydWN0
dXJlIHRvIHJ1biB0ZXN0cywgc28KPj4+Pj4gZGVmaW5lIGFuIGFic3RyYWN0IHdheSB0byBjb25m
aWd1cmUgYW5kIHJ1biB0ZXN0cyB0aGF0IGFsbG93IHVzIHRvCj4+Pj4+IGNoYW5nZSB0aGUgY29u
dGV4dCBpbiB3aGljaCB0ZXN0cyBhcmUgYnVpbHQgd2l0aG91dCBhZmZlY3RpbmcgdGhlIHVzZXIu
Cj4+Pj4+IFRoaXMgYWxzbyBtYWtlcyBwcmV0dHkgYW5kIGR5bmFtaWMgZXJyb3IgcmVwb3J0aW5n
LCBhbmQgYSBsb3Qgb2Ygb3RoZXIKPj4+Pj4gbmljZSBmZWF0dXJlcyBlYXNpZXIuCj4+Pj4+Cj4+
Pj4+IGt1bml0X2NvbmZpZy5weToKPj4+Pj4gICAtIHBhcnNlIC5jb25maWcgYW5kIEtjb25maWcg
ZmlsZXMuCj4+Pj4+Cj4+Pj4+IGt1bml0X2tlcm5lbC5weTogcHJvdmlkZXMgaGVscGVyIGZ1bmN0
aW9ucyB0bzoKPj4+Pj4gICAtIGNvbmZpZ3VyZSB0aGUga2VybmVsIHVzaW5nIGt1bml0Y29uZmln
Lgo+Pj4+PiAgIC0gYnVpbGQgdGhlIGtlcm5lbCB3aXRoIHRoZSBhcHByb3ByaWF0ZSBjb25maWd1
cmF0aW9uLgo+Pj4+PiAgIC0gcHJvdmlkZSBmdW5jdGlvbiB0byBpbnZva2UgdGhlIGtlcm5lbCBh
bmQgc3RyZWFtIHRoZSBvdXRwdXQgYmFjay4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVs
aXggR3VvIDxmZWxpeGd1b3hpdXBpbmdAZ21haWwuY29tPgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBC
cmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4+Pj4KPj4+PiBBaCwg
aGVyZSdzIHByb2JhYmx5IG15IGFuc3dlciB0byBteSBwcmV2aW91cyBsb2dnaW5nIGZvcm1hdCBx
dWVzdGlvbiwKPj4+PiByaWdodD8gIFdoYXQncyB0aGUgY2hhbmNlIHRoYXQgdGhlc2Ugd3JhcHBl
cnMgb3V0cHV0IHN0dWZmIGluIGEgc3RhbmRhcmQKPj4+PiBmb3JtYXQgdGhhdCB0ZXN0LWZyYW1l
d29yay10b29scyBjYW4gYWxyZWFkeSBwYXJzZT8gIDopCj4gCj4gVG8gYmUgY2xlYXIsIHRoZSB0
ZXN0LWZyYW1ld29yay10b29scyBmb3JtYXQgd2UgYXJlIHRhbGtpbmcgYWJvdXQgaXMKPiBUQVAx
M1sxXSwgY29ycmVjdD8KCkknbSBub3Qgc3VyZSB3aGF0IHRoZSB0ZXN0IGNvbW11bml0eSBwcmVm
ZXJzIGZvciBhIGZvcm1hdC4gIEknbGwgbGV0IHRoZW0KanVtcCBpbiBhbmQgZGViYXRlIHRoYXQg
cXVlc3Rpb24uCgoKPiAKPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXMgd2hhdCBrc2VsZnRl
c3QgaXMgYmVpbmcgY29udmVydGVkIHRvIHVzZS4KPiAKPj4+Cj4+PiBJdCBzaG91bGQgYmUgcHJl
dHR5IGVhc3kgdG8gZG8uIEkgaGFkIHNvbWUgcGF0Y2hlcyB0aGF0IHBhY2sgdXAgdGhlCj4+PiBy
ZXN1bHRzIGludG8gYSBzZXJpYWxpemVkIGZvcm1hdCBmb3IgYSBwcmVzdWJtaXQgc2VydmljZTsg
aXQgc2hvdWxkIGJlCj4+PiBwcmV0dHkgc3RyYWlnaHRmb3J3YXJkIHRvIHRha2UgdGhlIHNhbWUg
bG9naWMgYW5kIGp1c3QgY2hhbmdlIHRoZQo+Pj4gb3V0cHV0IGZvcm1hdC4KPj4KPj4gV2hlbiBl
eGFtaW5pbmcgYW5kIHRyeWluZyBvdXQgdGhlIHByZXZpb3VzIHZlcnNpb25zIG9mIHRoZSBwYXRj
aCBJIGZvdW5kCj4+IHRoZSB3cmFwcGVycyB1c2VmdWwgdG8gcHJvdmlkZSBpbmZvcm1hdGlvbiBh
Ym91dCBob3cgdG8gY29udHJvbCBhbmQgdXNlCj4+IHRoZSB0ZXN0cywgYnV0IEkgaGFkIG5vIGlu
dGVyZXN0IGluIHVzaW5nIHRoZSBzY3JpcHRzIGFzIHRoZXkgZG8gbm90Cj4+IGZpdCBpbiB3aXRo
IG15IHBlcnNvbmFsIGVudmlyb25tZW50IGFuZCB3b3JrZmxvdy4KPj4KPj4gSW4gdGhlIHByZXZp
b3VzIHZlcnNpb25zIG9mIHRoZSBwYXRjaCwgdGhlc2UgaGVscGVyIHNjcmlwdHMgYXJlIG9wdGlv
bmFsLAo+PiB3aGljaCBpcyBnb29kIGZvciBteSB1c2UgY2FzZS4gIElmIHRoZSBoZWxwZXIgc2Ny
aXB0cyBhcmUgcmVxdWlyZWQgdG8KPiAKPiBUaGV5IGFyZSBzdGlsbCBvcHRpb25hbC4KPiAKPj4g
Z2V0IHRoZSBkYXRhIGludG8gdGhlIHByb3BlciBmb3JtYXQgdGhlbiB0aGUgc2NyaXB0cyBhcmUg
bm90IHF1aXRlIHNvCj4+IG9wdGlvbmFsLCB0aGV5IGJlY29tZSB0aGUgZXhwZWN0ZWQgZW52aXJv
bm1lbnQuICBJIHRoaW5rIHRoZSBwcm9wZXIKPj4gZm9ybWF0IHNob3VsZCBleGlzdCB3aXRob3V0
IHRoZSBoZWxwZXIgc2NyaXB0cy4KPiAKPiBUaGF0J3MgYSBnb29kIHBvaW50LiBBIGNvdXBsZSB0
aGluZ3MsCj4gCj4gRmlyc3Qgb2ZmLCBzdXBwb3J0aW5nIFRBUDEzLCBlaXRoZXIgaW4gdGhlIGtl
cm5lbCBvciB0aGUgd3JhcHBlcgo+IHNjcmlwdCBpcyBub3QgaGFyZCwgYnV0IEkgZG9uJ3QgdGhp
bmsgdGhhdCBpcyB0aGUgcmVhbCBpc3N1ZSB0aGF0IHlvdQo+IHJhaXNlLgo+IAo+IElmIHlvdXIg
b25seSBjb25jZXJuIGlzIHRoYXQgeW91IHdpbGwgYWx3YXlzIGJlIGFibGUgdG8gaGF2ZSBodW1h
bgo+IHJlYWRhYmxlIEtVbml0IHJlc3VsdHMgcHJpbnRlZCB0byB0aGUga2VybmVsIGxvZywgdGhh
dCBpcyBhIGd1YXJhbnRlZQo+IEkgZmVlbCBjb21mb3J0YWJsZSBtYWtpbmcuIEJleW9uZCB0aGF0
LCBJIHRoaW5rIGl0IGlzIGdvaW5nIHRvIHRha2UgYQo+IGxvbmcgd2hpbGUgYmVmb3JlIEkgd291
bGQgZmVlbCBjb21mb3J0YWJsZSBndWFyYW50ZWVpbmcgYW55dGhpbmcgYWJvdXQKPiBob3cgd2ls
bCBLVW5pdCB3b3JrLCB3aGF0IGtpbmQgb2YgZGF0YSBpdCB3aWxsIHdhbnQgdG8gZXhwb3NlLCBh
bmQgaG93Cj4gaXQgd2lsbCBiZSBvcmdhbml6ZWQuIEkgdGhpbmsgdGhlIHdyYXBwZXIgc2NyaXB0
IHByb3ZpZGVzIGEgbmljZQo+IGZhY2FkZSB0aGF0IEkgY2FuIG1haW50YWluLCBjYW4gbWVkaWF0
ZSBiZXR3ZWVuIHRoZSBpbXBsZW1lbnRhdGlvbgo+IGRldGFpbHMgYW5kIHRoZSB1c2VyLCBhbmQg
Y2FuIG1lZGlhdGUgYmV0d2VlbiB0aGUgaW1wbGVtZW50YXRpb24KPiBkZXRhaWxzIGFuZCBvdGhl
ciBwaWVjZXMgb2Ygc29mdHdhcmUgdGhhdCBtaWdodCB3YW50IHRvIGNvbnN1bWUKPiByZXN1bHRz
Lgo+IAo+IFsxXSBodHRwczovL3Rlc3Rhbnl0aGluZy5vcmcvdGFwLXZlcnNpb24tMTMtc3BlY2lm
aWNhdGlvbi5odG1sCgpNeSBjb25jZXJuIGlzIGJhc2VkIG9uIGEgZm9jdXMgb24gbXkgbGl0dGxl
IHBhcnQgb2YgdGhlIHdvcmxkCih3aGljaCBpbiBfcHJldmlvdXNfIHZlcnNpb25zIG9mIHRoZSBw
YXRjaCBzZXJpZXMgd2FzIHRoZSBkZXZpY2V0cmVlCnVuaXR0ZXN0LmMgdGVzdHMgYmVpbmcgY29u
dmVydGVkIHRvIHVzZSB0aGUga3VuaXQgaW5mcmFzdHJ1Y3R1cmUpLgpJZiBJIHN0ZXAgYmFjayBh
bmQgdGhpbmsgb2YgdGhlIGVudGlyZSBrZXJuZWwgZ2xvYmFsbHkgSSBtYXkgZW5kCnVwIHdpdGgg
YSBkaWZmZXJlbnQgY29uY2x1c2lvbiAtIGJ1dCBJJ20gZ29pbmcgdG8gcmVtYWluIG15b3BpYwpm
b3IgdGhpcyBlbWFpbC4KCkkgd2FudCB0aGUgdGVzdCByZXN1bHRzIHRvIGJlIHVzYWJsZSBieSBt
ZSBhbmQgbXkgZmVsbG93CmRldmVsb3BlcnMuICBJIHByZWZlciB0aGF0IHRoZSB0ZXN0IHJlc3Vs
dHMgYmUgZWFzaWx5IGFjY2Vzc2libGUKKGN1cnJlbnQgcHJpbnRrKCkgaW1wbGVtZW50YXRpb24g
bWVhbnMgdGhhdCBrdW5pdCBtZXNzYWdlcyBhcmUKanVzdCBhcyBhY2Nlc3NpYmxlIGFzIHRoZSBj
dXJyZW50IHVuaXR0ZXN0LmMgcHJpbnRrKCkgb3V0cHV0KS4KSWYgdGhlIHByaW50aygpIG91dHB1
dCBuZWVkcyB0byBiZSBmaWx0ZXJlZCB0aHJvdWdoIGEgc2NyaXB0CnRvIGdlbmVyYXRlIHRoZSBh
Y3R1YWwgdGVzdCByZXN1bHRzIHRoZW4gdGhhdCBpcyBzdWItb3B0aW1hbAp0byBtZS4gIEl0IGlz
IG9uZSBtb3JlIHN0ZXAgYWRkZWQgdG8gbXkgd29ya2Zsb3cuICBBbmQKcG90ZW50aWFsbHkgd2l0
aCBhbiBlbWJlZGRlZCB0YXJnZXQgYSBtYWpvciBwYWluIHRvIGdldCBhCmRhdGEgZmlsZSAodGhl
IGtlcm5lbCBsb2cgZmlsZSkgdHJhbnNmZXJyZWQgZnJvbSBhIHRhcmdldAp0byBteSBkZXZlbG9w
bWVudCBob3N0LgoKSSB3YW50IGEgcmVwb3J0ZWQgdGVzdCBmYWlsdXJlIHRvIGJlIGVhc3kgdG8g
dHJhY2UgYmFjayB0byB0aGUKcG9pbnQgaW4gdGhlIHNvdXJjZSB3aGVyZSB0aGUgZmFpbHVyZSBp
cyByZXBvcnRlZC4gIFdpdGggcHJpbnRrKCkKdGhlIHNlYXJjaCBpcyBhIHNpbXBsZSBncmVwIGZv
ciB0aGUgZmFpbHVyZSBtZXNzYWdlLiAgSWYgdGhlCmZhaWx1cmUgbWVzc2FnZSBoYXMgYmVlbiBw
cm9jZXNzZWQgYnkgYSBzY3JpcHQsIGFuZCB0aGVuIHRoZQpmYWlsdXJlIHJlcG9ydGVkIHRvIG1l
IGluIGFuIGVtYWlsLCB0aGVuIEkgbWF5IGhhdmUgdG8gbG9vawphdCB0aGUgc2NyaXB0IHRvIHJl
dmVyc2UgZW5naW5lZXIgaG93IHRoZSBvcmlnaW5hbCBmYWlsdXJlCm1lc3NhZ2Ugd2FzIHRyYW5z
Zm9ybWVkIGludG8gdGhlIG1lc3NhZ2UgdGhhdCB3YXMgcmVwb3J0ZWQKdG8gbWUgaW4gdGhlIGVt
YWlsLiAgVGhlbiBJIHNlYXJjaCBmb3IgdGhlIHBvaW50IGluIHRoZQpzb3VyY2Ugd2hlcmUgdGhl
IGZhaWx1cmUgaXMgcmVwb3J0ZWQuICBTbyBhIGJhc2ljIHRhc2sgaGFzCmp1c3QgYmVjb21lIG1v
cmUgZGlmZmljdWx0IGFuZCB0aW1lIGNvbnN1bWluZy4KCi1GcmFuawpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
