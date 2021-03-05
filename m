Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA0632F944
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 11:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173756E4DD;
	Sat,  6 Mar 2021 10:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980726EC80
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 23:02:35 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4Dsjtb56rBzL0;
 Sat,  6 Mar 2021 00:02:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1614985352; bh=SZHwnu6Rhn8QiMnEN2V1F4jUIvqNotWt5soGJPrBegA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oQId8WMfqBoaRrfZPG9CkUf0ZVKeWwczfSPSv0TOjPq4wAk55pdhc9Ew+V+8lPSCH
 wR/HYFeMgFz63iYdebjAfc25Ui8cYBPeLUWgyRarMOH8GPzCx1XcoMeuetALOveUeb
 F/BYmh5JP3VsdTW+4JtEzJAg+X4fmmIL3MyvGXJSOz/EkyQFeJPRWQzaijxbq/3HMy
 mMgXbpOXMYC5J1H003FVZf2IP2WWemzYzbw3vkpKBP3H8RW991gZHSDohXnSlmY/ow
 eDpRzkIREhXZfJ4nyAmM3yj8lvnlij5N35ftdWwCULVuL8DhAy0VCYUPbzkTZshKoc
 B0P2pde08URTw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Sat, 6 Mar 2021 00:02:22 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v13 1/2] drm/tegra: dc: Support memory bandwidth management
Message-ID: <20210305230222.GA28867@qmqm.qmqm.pl>
References: <20210302124445.29444-1-digetx@gmail.com>
 <20210302124445.29444-2-digetx@gmail.com>
 <20210303230827.GA22628@qmqm.qmqm.pl>
 <1b352c7e-cc72-ba08-32ba-08c05cc3aa03@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b352c7e-cc72-ba08-32ba-08c05cc3aa03@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 06 Mar 2021 10:04:47 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMDUsIDIwMjEgYXQgMTI6NDU6NTFBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDA0LjAzLjIwMjEgMDI6MDgsIE1pY2hhxYIgTWlyb3PFgmF3INC/0LjRiNC10YI6
Cj4gPiBPbiBUdWUsIE1hciAwMiwgMjAyMSBhdCAwMzo0NDo0NFBNICswMzAwLCBEbWl0cnkgT3Np
cGVua28gd3JvdGU6Cj4gPj4gRGlzcGxheSBjb250cm9sbGVyIChEQykgcGVyZm9ybXMgaXNvY2hy
b25vdXMgbWVtb3J5IHRyYW5zZmVycywgYW5kIHRodXMsCj4gPj4gaGFzIGEgcmVxdWlyZW1lbnQg
Zm9yIGEgbWluaW11bSBtZW1vcnkgYmFuZHdpZHRoIHRoYXQgc2hhbGwgYmUgZnVsZmlsbGVkLAo+
ID4+IG90aGVyd2lzZSBmcmFtZWJ1ZmZlciBkYXRhIGNhbid0IGJlIGZldGNoZWQgZmFzdCBlbm91
Z2ggYW5kIHRoaXMgcmVzdWx0cwo+ID4+IGluIGEgREMncyBkYXRhLUZJRk8gdW5kZXJmbG93IHRo
YXQgZm9sbG93cyBieSBhIHZpc3VhbCBjb3JydXB0aW9uLgpbLi4uXQo+ID4+ICsJLyoKPiA+PiAr
CSAqIEhvcml6b250YWwgZG93bnNjYWxlIHRha2VzIGV4dHJhIGJhbmR3aWR0aCB3aGljaCByb3Vn
aGx5IGRlcGVuZHMKPiA+PiArCSAqIG9uIHRoZSBzY2FsZWQgd2lkdGguCj4gPj4gKwkgKi8KPiA+
PiArCWlmIChzcmNfdyA+IGRzdF93KQo+ID4+ICsJCW11bCA9IChzcmNfdyAtIGRzdF93KSAqIGJw
cCAvIDIwNDggKyAxOwo+ID4+ICsJZWxzZQo+ID4+ICsJCW11bCA9IDE7Cj4gPiAKPiA+IERvZXMg
aXQgcmVhbGx5IG5lZWQgbW9yZSBiYW5kd2lkdGggdG8gc2NhbGUgZG93bj8gRG9lcyBpdCByZWFk
IHRoZSBzYW1lCj4gPiBkYXRhIG11bHRpcGxlIHRpbWVzIGp1c3QgdG8gdGhyb3cgaXQgYXdheT8K
PiBUaGUgaGFyZHdhcmUgaXNuJ3Qgb3B0aW1pemVkIGZvciBkb3duc2NhbGUsIGl0IGluZGVlZCB0
YWtlcyBtb3JlCj4gYmFuZHdpZHRoLiBZb3UnbGwgd2l0bmVzcyBhIHNldmVyZSB1bmRlcmZsb3cg
b2YgcGxhbmUncyBtZW1vcnkgRklGTwo+IGJ1ZmZlciBvbiB0cnlpbmcgdG8gZG93bnNjYWxlIDEw
ODBwIHBsYW5lIHRvIDUweDUwLgpbLi4uXQoKSW4geW91ciBleGFtcGxlLCBkb2VzIGl0IHJlYWxs
eSBuZWVkIDE2eCB0aGUgYmFuZHdpZHRoIGNvbXBhcmVkIHRvCm5vIHNjYWxpbmcgY2FzZT8gIFRo
ZSBuYWl2ZSB3YXkgdG8gaW1wbGVtZW50IGRvd25zY2FsaW5nIHdvdWxkIGJlIHRvIHJlYWQKYWxs
IHRoZSBwaXhlbHMgYW5kIG9ubHkgdGFrZSBldmVyeSBOLXRoLiAgTWF5YmUgdGhlIHByb2JsZW0g
aXMgdGhhdCBpbgpkb3duc2NhbGluZyBtb2RlIHRoZSBsYXRlbmN5IHJlcXVpcmVtZW50cyBhcmUg
dGlnaHRlcj8gIFdoeSB3b3VsZCBiYW5kd2lkdGgKcmVxdWlyZWQgYmUgcHJvcG9ydGlvbmFsIHRv
IGEgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB3aWR0aHMgKGluc3RlYWQgZS5nLgp0byBzcmMvZHN0
IG9yIGRzdCpjYWNoZWxpbmVfc2l6ZSk/CgpCZXN0IFJlZ2FyZHMKTWljaGHFgiBNaXJvc8WCYXcK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
