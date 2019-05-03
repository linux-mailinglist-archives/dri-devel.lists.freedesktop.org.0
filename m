Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6880414538
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2B089349;
	Mon,  6 May 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC9189179
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:33:52 +0000 (UTC)
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134]
 helo=[172.20.29.49])
 by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <logang@deltatee.com>)
 id 1hMXNQ-0007dH-Hy; Fri, 03 May 2019 06:33:22 -0600
To: Brendan Higgins <brendanhiggins@google.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-9-brendanhiggins@google.com>
 <0a605543-477a-1854-eb35-6e586606889b@deltatee.com>
 <CAFd5g47hxAd=+72xbPJbWPdZCXRXmtLpsGhUh=zc7MSwfcaGJQ@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <b2379db6-634a-001e-6f67-37427d8a2666@deltatee.com>
Date: Fri, 3 May 2019 06:33:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g47hxAd=+72xbPJbWPdZCXRXmtLpsGhUh=zc7MSwfcaGJQ@mail.gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 173.228.226.134
X-SA-Exim-Rcpt-To: wfg@linux.intel.com, rostedt@goodmis.org,
 rientjes@google.com, richard@nod.at, pmladek@suse.com, mpe@ellerman.id.au,
 knut.omang@oracle.com, khilman@baylibre.com, julia.lawall@lip6.fr,
 joel@jms.id.au, jdike@addtoit.com, daniel@ffwll.ch, dan.j.williams@intel.com,
 dan.carpenter@oracle.com, amir73il@gmail.com, Tim.Bird@sony.com,
 Alexander.Levin@microsoft.com, linux-um@lists.infradead.org,
 linux-nvdimm@lists.01.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, shuah@kernel.org, sboyd@kernel.org,
 robh@kernel.org, mcgrof@kernel.org, kieran.bingham@ideasonboard.com,
 keescook@google.com, gregkh@linuxfoundation.org, frowand.list@gmail.com,
 brendanhiggins@google.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 08/17] kunit: test: add support for test abort
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
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
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
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
 linux-fsdevel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LTA1LTAzIDEyOjQ4IGEubS4sIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiBPbiBU
aHUsIE1heSAyLCAyMDE5IGF0IDg6MTUgUE0gTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0
ZWUuY29tPiB3cm90ZToKPj4gT24gMjAxOS0wNS0wMSA1OjAxIHAubS4sIEJyZW5kYW4gSGlnZ2lu
cyB3cm90ZToKPj4+ICsvKgo+Pj4gKyAqIHN0cnVjdCBrdW5pdF90cnlfY2F0Y2ggLSBwcm92aWRl
cyBhIGdlbmVyaWMgd2F5IHRvIHJ1biBjb2RlIHdoaWNoIG1pZ2h0IGZhaWwuCj4+PiArICogQGNv
bnRleHQ6IHVzZWQgdG8gcGFzcyB1c2VyIGRhdGEgdG8gdGhlIHRyeSBhbmQgY2F0Y2ggZnVuY3Rp
b25zLgo+Pj4gKyAqCj4+PiArICoga3VuaXRfdHJ5X2NhdGNoIHByb3ZpZGVzIGEgZ2VuZXJpYywg
YXJjaGl0ZWN0dXJlIGluZGVwZW5kZW50IHdheSB0byBleGVjdXRlCj4+PiArICogYW4gYXJiaXRy
YXJ5IGZ1bmN0aW9uIG9mIHR5cGUga3VuaXRfdHJ5X2NhdGNoX2Z1bmNfdCB3aGljaCBtYXkgYmFp
bCBvdXQgYnkKPj4+ICsgKiBjYWxsaW5nIGt1bml0X3RyeV9jYXRjaF90aHJvdygpLiBJZiBrdW5p
dF90cnlfY2F0Y2hfdGhyb3coKSBpcyBjYWxsZWQsIEB0cnkKPj4+ICsgKiBpcyBzdG9wcGVkIGF0
IHRoZSBzaXRlIG9mIGludm9jYXRpb24gYW5kIEBjYXRjaCBpcyBjYXRjaCBpcyBjYWxsZWQuCj4+
Cj4+IEkgZm91bmQgc29tZSBvZiB0aGUgQysrIGNvbXBhcmlzb25zIGluIHRoaXMgc2VyaWVzIGEg
Yml0IGRpc3Rhc3RlZnVsIGJ1dAo+PiB3YXNuJ3QgZ29pbmcgdG8gc2F5IGFueXRoaW5nIHVudGls
IEkgc2F3IHRoZSB0cnkgY2F0Y2guLi4uIEJ1dCBsb29raW5nCj4+IGludG8gdGhlIGltcGxlbWVu
dGF0aW9uIGl0J3MganVzdCBhIHRocmVhZCB0aGF0IGNhbiBleGl0IGVhcmx5IHdoaWNoCj4+IHNl
ZW1zIGZpbmUgdG8gbWUuIEp1c3QgYSBwb29yIGNob2ljZSBvZiBuYW1lIEkgZ3Vlc3MuLi4KPiAK
PiBHdWlsdHkgYXMgY2hhcmdlZCAoSSBoYXZlIGEgbG9uZyBoaXN0b3J5IHdpdGggQysrLCBzb3Jy
eSkuIFdvdWxkIHlvdQo+IHByZWZlciBJIGNoYW5nZWQgdGhlIG5hbWU/IEkganVzdCBmaWd1cmVk
IHRoYXQgdHJ5LWNhdGNoIGlzIGEgY29tbW9ubHkKPiB1bmRlcnN0b29kIHBhdHRlcm4gdGhhdCBk
ZXNjcmliZXMgZXhhY3RseSB3aGF0IEkgYW0gZG9pbmcuCgpJdCBpcyBhIGNvbW1vbmx5IHVuZGVy
c3Rvb2QgcGF0dGVybiwgYnV0IEkgZG9uJ3QgdGhpbmsgaXQncyB3aGF0IHRoZQpjb2RlIGlzIGRv
aW5nLiBUcnktY2F0Y2ggY2xlYW5zIHVwIGFuIGVudGlyZSBzdGFjayBhbmQgYWxsb3dzIGVhY2gg
bGV2ZWwKb2YgdGhlIHN0YWNrIHRvIGFwcGx5IGxvY2FsIGNsZWFudXAuIFRoaXMgaW1wbGVtZW50
YXRpb24gc2ltcGx5IGV4aXRzIGEKdGhyZWFkIGFuZCBoYXMgbm9uZSBvZiB0aGF0IGNvbXBsZXhp
dHkuIFRvIG1lLCBpdCBzZWVtcyBsaWtlIGFuIG9kZAphYnN0cmFjdGlvbiBoZXJlIGFzIGl0J3Mg
cmVhbGx5IGp1c3QgYSB0ZXN0IHJ1bm5lciB0aGF0IGNhbiBleGl0IGVhcmx5Cih0aG91Z2ggSSBo
YXZlbid0IHNlZW4gdGhlIGZvbGxvdy11cCBVTUwgaW1wbGVtZW50YXRpb24pLgoKSSB3b3VsZCBw
cmVmZXIgdG8gc2VlIHRoaXMgY2xlYW5lZCB1cCBzdWNoIHRoYXQgdGhlIGFic3RyYWN0aW9uIG1h
dGNoZXMKbW9yZSB3aGF0J3MgZ29pbmcgb24gYnV0IEkgZG9uJ3QgZmVlbCB0aGF0IHN0cm9uZ2x5
IGFib3V0IGl0IHNvIEknbGwKbGVhdmUgaXQgdXAgdG8geW91IHRvIGZpZ3VyZSBvdXQgd2hhdCdz
IGJlc3QgdW5sZXNzIG90aGVyIHJldmlld2VycyBoYXZlCnN0cm9uZ2VyIG9waW5pb25zLgoKPj4K
Pj4gW3NuaXBdCj4+Cj4+PiArc3RhdGljIHZvaWQgX19ub3JldHVybiBrdW5pdF9hYm9ydChzdHJ1
Y3Qga3VuaXQgKnRlc3QpCj4+PiArewo+Pj4gKyAgICAga3VuaXRfc2V0X2RlYXRoX3Rlc3QodGVz
dCwgdHJ1ZSk7Cj4+PiArCj4+PiArICAgICBrdW5pdF90cnlfY2F0Y2hfdGhyb3coJnRlc3QtPnRy
eV9jYXRjaCk7Cj4+PiArCj4+PiArICAgICAvKgo+Pj4gKyAgICAgICogVGhyb3cgY291bGQgbm90
IGFib3J0IGZyb20gdGVzdC4KPj4+ICsgICAgICAqCj4+PiArICAgICAgKiBYWFg6IHdlIHNob3Vs
ZCBuZXZlciByZWFjaCB0aGlzIGxpbmUhIEFzIGt1bml0X3RyeV9jYXRjaF90aHJvdyBpcwo+Pj4g
KyAgICAgICogbWFya2VkIF9fbm9yZXR1cm4uCj4+PiArICAgICAgKi8KPj4+ICsgICAgIFdBUk5f
T05DRSh0cnVlLCAiVGhyb3cgY291bGQgbm90IGFib3J0IGZyb20gdGVzdCFcbiIpOwo+Pj4gK30K
Pj4+ICsKPj4+ICBpbnQga3VuaXRfaW5pdF90ZXN0KHN0cnVjdCBrdW5pdCAqdGVzdCwgY29uc3Qg
Y2hhciAqbmFtZSkKPj4+ICB7Cj4+PiAgICAgICBzcGluX2xvY2tfaW5pdCgmdGVzdC0+bG9jayk7
Cj4+PiBAQCAtNzcsNiArMTAzLDcgQEAgaW50IGt1bml0X2luaXRfdGVzdChzdHJ1Y3Qga3VuaXQg
KnRlc3QsIGNvbnN0IGNoYXIgKm5hbWUpCj4+PiAgICAgICB0ZXN0LT5uYW1lID0gbmFtZTsKPj4+
ICAgICAgIHRlc3QtPnZwcmludGsgPSBrdW5pdF92cHJpbnRrOwo+Pj4gICAgICAgdGVzdC0+ZmFp
bCA9IGt1bml0X2ZhaWw7Cj4+PiArICAgICB0ZXN0LT5hYm9ydCA9IGt1bml0X2Fib3J0Owo+Pgo+
PiBUaGVyZSBhcmUgYSBudW1iZXIgb2YgdGhlc2UgZnVuY3Rpb24gcG9pbnRlcnMgd2hpY2ggc2Vl
bSB0byBiZSBwb2ludGxlc3MKPj4gdG8gbWUgYXMgeW91IG9ubHkgZXZlciBzZXQgdGhlbSB0byBv
bmUgZnVuY3Rpb24uIEp1c3QgY2FsbCB0aGUgZnVuY3Rpb24KPj4gZGlyZWN0bHkuIEFzIGl0IGlz
LCBpdCBpcyBhbiB1bm5lY2Vzc2FyeSBpbmRpcmVjdGlvbiBmb3Igc29tZW9uZSByZWFkaW5nCj4+
IHRoZSBjb2RlLiBJZiBhbmQgd2hlbiB5b3UgaGF2ZSBtdWx0aXBsZSBpbXBsZW1lbnRhdGlvbnMg
b2YgdGhlIGZ1bmN0aW9uCj4+IHRoZW4gYWRkIHRoZSBwb2ludGVyLiBEb24ndCBhc3N1bWUgeW91
J3JlIGdvaW5nIHRvIG5lZWQgaXQgbGF0ZXIgb24gYW5kCj4+IGFkZCBhbGwgdGhpcyBtYWludGVu
YW5jZSBidXJkZW4gaWYgeW91IG5ldmVyIHVzZSBpdC4uCj4gCj4gQWgsIHllcywgRnJhbmsgKGFu
ZCBwcm9iYWJseSBvdGhlcnMpIHByZXZpb3VzbHkgYXNrZWQgbWUgdG8gcmVtb3ZlCj4gdW5uZWNl
c3NhcnkgbWV0aG9kIHBvaW50ZXJzOyBJIHJlbW92ZWQgYWxsIHRoZSB0b3RhbGx5IHVudXNlZCBv
bmVzLiBBcwo+IGZvciB0aGVzZSwgSSBkb24ndCB1c2UgdGhlbSBpbiB0aGlzIHBhdGNoc2V0LCBi
dXQgSSB1c2UgdGhlbSBpbiBteQo+IHBhdGNoc2V0cyB0aGF0IHdpbGwgZm9sbG93IHVwIHRoaXMg
b25lLiBUaGVzZSBpbiBwYXJ0aWN1bGFyIGFyZQo+IHByZXNlbnQgc28gdGhhdCB0aGV5IGNhbiBi
ZSBtb2NrZWQgb3V0IGZvciB0ZXN0aW5nLgoKQWRkaW5nIGluZGlyZWN0aW9uIGFuZCBmdW5jdGlv
biBwb2ludGVycyBzb2xlbHkgZm9yIHRoZSBwdXJwb3NlIG9mCm1vY2tpbmcgb3V0IHdoaWxlIHRl
c3RpbmcgZG9lc24ndCBzaXQgd2VsbCB3aXRoIG1lIGFuZCBJIGRvbid0IHRoaW5rIGl0CnNob3Vs
ZCBiZSBhIHBhdHRlcm4gdGhhdCdzIGVuY291cmFnZWQuIEFkZGluZyBleHRyYSBjb21wbGV4aXR5
IGxpa2UgdGhpcwp0byBhIGRlc2lnbiB0byBtYWtlIGl0IHVuaXQtdGVzdGFibGUgZG9lc24ndCBz
ZWVtIGxpa2Ugc29tZXRoaW5nIHRoYXQKbWFrZXMgc2Vuc2UgaW4ga2VybmVsIGNvZGUuIEVzcGVj
aWFsbHkgZ2l2ZW4gdGhhdCBpbmRpcmVjdCBjYWxscyBhcmUKbW9yZSBleHBlbnNpdmUgaW4gdGhl
IGFnZSBvZiBzcGVjdHJlLgoKQWxzbywgbW9ja2luZyB0aGVzZSBwYXJ0aWN1bGFyIGZ1bmN0aW9u
cyBzZWVtcyBsaWtlIGl0J3MgYW4gYXJ0aWZhY3Qgb2YKaG93IHlvdSd2ZSBkZXNpZ25lZCB0aGUg
dHJ5L2NhdGNoIGFic3RyYWN0aW9uLiBJZiB0aGUgYWJzdHJhY3Rpb24gd2FzCm1vcmUgYXJvdW5k
IGFuIGFib3J0LWFibGUgdGVzdCBydW5uZXIgdGhlbiBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8g
bmVlZAp0byBtb2NrIG91dCB0aGUgYWJvcnQvZmFpbCBmdW5jdGlvbnMgYXMgeW91IHdpbGwgYmUg
dGVzdGluZyBvdmVybHkKZ2VuZXJpYyBmZWF0dXJlcyBvZiBzb21ldGhpbmcgdGhhdCBkb24ndCBz
ZWVtIG5lY2Vzc2FyeSB0byB0aGUKaW1wbGVtZW50YXRpb24uCgo+Pgo+PiBbc25pcF0KPj4KPj4+
ICt2b2lkIGt1bml0X2dlbmVyaWNfdHJ5X2NhdGNoX2luaXQoc3RydWN0IGt1bml0X3RyeV9jYXRj
aCAqdHJ5X2NhdGNoKQo+Pj4gK3sKPj4+ICsgICAgIHRyeV9jYXRjaC0+cnVuID0ga3VuaXRfZ2Vu
ZXJpY19ydW5fdHJ5X2NhdGNoOwo+Pj4gKyAgICAgdHJ5X2NhdGNoLT50aHJvdyA9IGt1bml0X2dl
bmVyaWNfdGhyb3c7Cj4+PiArfQo+Pgo+PiBTYW1lIGhlcmUuIFRoZXJlJ3Mgb25seSBvbmUgaW1w
bGVtZW50YXRpb24gb2YgdHJ5X2NhdGNoIGFuZCBJIGNhbid0Cj4+IHJlYWxseSBzZWUgYW55IHNl
bnNpYmxlIGp1c3RpZmljYXRpb24gZm9yIGFub3RoZXIgaW1wbGVtZW50YXRpb24uIEV2ZW4KPj4g
aWYgdGhlcmUgaXMsIGFkZCB0aGUgaW5kaXJlY3Rpb24gd2hlbiB0aGUgc2Vjb25kIGltcGxlbWVu
dGF0aW9uIGlzCj4+IGFkZGVkLiBUaGlzIGlzbid0IEMrKyBhbmQgd2UgZG9uJ3QgbmVlZCB0byBt
YWtlIGV2ZXJ5dGhpbmcgYSAibWV0aG9kIi4KPiAKPiBUaGVzZSBtZXRob2RzIGFyZSBmb3IgYSBV
TUwgc3BlY2lmaWMgaW1wbGVtZW50YXRpb24gaW4gYSBmb2xsb3cgdXAKPiBwYXRjaHNldCwgd2hp
Y2ggaXMgbmVlZGVkIGZvciBzb21lIGZlYXR1cmVzIGxpa2UgY3Jhc2ggcmVjb3ZlcnksIGRlYXRo
Cj4gdGVzdHMsIGFuZCByZW1vdmVzIGRlcGVuZGVuY2Ugb24ga3RocmVhZHMuCj4gCj4gSSBrbm93
IHRoaXMgcHJvYmFibHkgc291bmRzIGxpa2UgcHJlbWF0dXJlIGNvbXBsZXhpdHkuIEFyZ3VhYmx5
IGl0IGlzCj4gaW4gaGluZHNpZ2h0LCBidXQgSSB3cm90ZSB0aG9zZSBmZWF0dXJlcyBiZWZvcmUg
SSBwdWxsZWQgb3V0IHRoZXNlCj4gaW50ZXJmYWNlcyAodGhleSB3ZXJlIGFjdHVhbGx5IGJvdGgg
b3JpZ2luYWxseSBpbiB0aGlzIHBhdGNoc2V0LCBidXQgSQo+IGRyb3BwZWQgdGhlbSB0byBtYWtl
IHRoaXMgcGF0Y2hzZXQgZWFzaWVyIHRvIHJldmlldykuIEkgY2FuIHJlbW92ZQo+IHRoZXNlIG1l
dGhvZHMgYW5kIGFkZCB0aGVtIGJhY2sgaW4gd2hlbiBJIGFjdHVhbGx5IHVzZSB0aGVtIGluIHRo
ZQo+IGZvbGxvdyB1cCBwYXRjaHNldHMgaWYgeW91IHByZWZlci4KClllcywgcmVtb3ZlIHRoZW0g
bm93IGFuZCBhZGQgdGhlbSBiYWNrIHdoZW4geW91IHVzZSB0aGVtIGluIGZvbGxvdy11cApwYXRj
aGVzLiBJZiByZXZpZXdlcnMgZmluZCBwcm9ibGVtcyB3aXRoIHRoZSBmb2xsb3ctdXAgcGF0Y2hl
cyBvciBoYXZlIGEKYmV0dGVyIHN1Z2dlc3Rpb24gb24gaG93IHRvIGRvIHdoYXQgZXZlciBpdCBp
cyB5b3UgYXJlIGRvaW5nLCB0aGVuIHlvdQpqdXN0IGhhdmUgdGhpcyB1bm5lY2Vzc2FyeSBjb2Rl
IGFuZCB0aGVyZSdzIHdhc3RlZCBkZXZlbG9wZXIgdGltZSBhbmQKcmV2aWV3IGJhbmR3aWR0aCB0
aGF0IHdpbGwgbmVlZCB0byBiZSBzcGVudCBjbGVhbmluZyBpdCB1cC4KClRoYW5rcywKCkxvZ2Fu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
