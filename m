Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E079587B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498DD6E5FE;
	Tue, 20 Aug 2019 07:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [194.109.24.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33716E194;
 Mon, 19 Aug 2019 14:55:39 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud9.xs4all.net with ESMTPA
 id zj4ChI5vQzaKOzj4Ghs6MN; Mon, 19 Aug 2019 16:55:38 +0200
Subject: Re: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier
 API
To: Neil Armstrong <narmstrong@baylibre.com>,
 Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
 <ad2a4af0-aeff-a81e-7885-7e9fc3c5cf90@baylibre.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6ef361f6-2f56-32ea-c7da-52799990cac7@xs4all.nl>
Date: Mon, 19 Aug 2019 16:55:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ad2a4af0-aeff-a81e-7885-7e9fc3c5cf90@baylibre.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfAcnCVFj1krAOhrj/mufKqBlxMbOSgzSeUXEOKbpJLud4IZ5fiLiUug6x1ZqKp7+UUxICVYS1sbyuUUnrOXFLal39KYAgJkS9hQGkukxRIwMWkn3VN+i
 TlIwZ9a/czbewfmvQ/bnqr12/uQglwwExPpRSW6UMiqBkKAEZ3+DdBaUMvj8+8oTfBbl7cNbeCPaQ07xeSeBmmq9MFl2lBxz2akLHWAcE7Qk0Ss4uoR6i2NR
 bIZQxb0ej6/tz5Q4RNVa88cAFcoQeKuIG1L7ROnGnOk633i1oN6lF74PD6BSXHG2/v+JXzT25/5ho9Gv6QTKd80O8s0W9bBT8qRyMRRr3fb9r5vxyRVK5psz
 QgciIFY6Ft/w4rXomKAWfE+jVIg1RTAj/P6SxJ7tKA/RvXpkRv9OF8NxB0Y4tvM8bqSNrLXcWNdXUiRQpWUXIX3sV7kh/yy7O2Dl3guC3WrQ2eS1Mws603np
 +P2tiKWBOuBBwI5YWD8OHDz+8b6MhUlCVr1e6tdwL6DIbldlhQuHFmP+UH3+rm2WmTeLTpeGAHfztQu9vI93M6utuOjz/VahKjVfz+Lqg538SjRiGtoHqsFR
 I2+hPiEJhKuIQxvwKJzHENZwtWiV0aFJpNSjffCk4PI7JpOVcYdtwz87NhCyDh1IHFor1V/TlLnSKVlEX87VNX4B2BZerHERC/UVJG6C/lnwJm2AnrFDJwUD
 55goQlcE+9rgN0iwsSLIcag0pwppehYQ+WBOceth4A627FakEjluXWxFW7/IZSlip89wUR1/bZWTqFrGQ/C0jN7vZb1/ptOaFiVlq+A1Iut+c0ToEbym6nWn
 5kSgZ5ATlC0J+sZIfgadUMTL7f5Qf3MYq16CbpwGESfmn8nxPGWpje1Ao/0c53GJQO/x/TpBelbj3iKHxLI/DBblHxm2FxSXXkpM5bpZ6C4ntCFQviRLyeNK
 YQAH4MHXARJXkpiv5eljDCxzpu7QWBc/DiQUNptcYFz8QJ+qfdCYOG8LoEMIw3toCPfIYHYznluRBxHziZbQ/Amuj2Rfk0a0fBam4oMd8CjaKVMPzwz1xAU7
 5zZ1he1OHjKi+nkZZ/4OLpRZ0ga07ac06gcEs+9jMgbr2oy2fIFLmBGsEx5DEIzsYxTtvq4krxsv1zkiryvF9fLE+ifV48fBarS4e+Lh32XHR0snf212eITy
 WP3Ye6Hoymy6XM8YVT2LOAElK+2+sYGN3KxJqlP9ZNqCS2x5ZC3yswQytMIufJyPzfpT/tWwGKLQCjUZg85bqs6XxhAb4FbR1jOuaFCBw7fs8c1QDdz18gig
 U2JQcgaTIA5RkOjbnD47o6ev230hQziueyxOqBVuDLyQPhe3I/g+N/1grCxgU4TT7V7AATItgXxaHD0I40r/DpdwGlw9jZpV2oxsvrXsdsBJm43L93Sx6cRv
 x4k81GGwO7UKT7bV
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>,
 "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Russell King <rmk+kernel@armlinux.org.uk>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Thomas Lim <Thomas.Lim@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Enrico Weigelt <info@metux.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xOS8xOSA0OjQ4IFBNLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBIaSBEYXJpdXN6LCBI
YW5zLAo+IAo+IEkgY2FuIGFwcGx5IHRoZSBkdy1oZG1pIHBhdGNoZXMgaWYgbmVjZXNzYXJ5LgoK
SSdkIGFwcHJlY2lhdGUgaXQgaWYgeW91IGNhbiBkbyB0aGF0LgoKVGhhbmtzLAoKCUhhbnMKCj4g
Cj4gTmVpbAo+IAo+IE9uIDE5LzA4LzIwMTkgMTE6MzgsIEhhbnMgVmVya3VpbCB3cm90ZToKPj4g
SGkgYWxsLAo+Pgo+PiBUaGUgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBjYW4gYmUgYXBwbGllZCBp
bmRlcGVuZGVudGx5IGZyb20gZWFjaCBvdGhlci4KPj4KPj4gSWYgeW91IG1haW50YWluIG9uZSBv
ZiB0aGVzZSBkcml2ZXJzIGFuZCB5b3Ugd2FudCB0byBtZXJnZSBpdCBmb3IgdjUuNAo+PiB5b3Vy
c2VsZiwgdGhlbiBwbGVhc2UgZG8gc28gYW5kIGxldCBtZSBrbm93LiBJZiB5b3UgcHJlZmVyIEkg
Y29tbWl0IGl0Cj4+IHRvIGRybS1taXNjLCB0aGVuIHBsZWFzZSByZXZpZXcgYW5kIChob3BlZnVs
bHkpIEFjayB0aGUgcGF0Y2guCj4+Cj4+IEkgd291bGQgcmVhbGx5IGxpa2UgdG8gZ2V0IHRoaXMg
aW4gZm9yIHY1LjQgc28gSSBjYW4gZ2V0IHRoZSB1c2Vyc3BhY2UKPj4gYml0cyBpbiBmb3IgdjUu
NCBhcyB3ZWxsIHRocm91Z2ggdGhlIG1lZGlhIHN1YnN5c3RlbS4KPj4KPj4gRGFyaXVzeiwgY2Fu
IHlvdSBwb3N0IGEgdjcuMSBmb3IgcGF0Y2ggNS85IGZpeGluZyB0aGUgdHlwbz8KPj4KPj4gVGhh
bmtzIQo+Pgo+PiAJSGFucwo+Pgo+PiBPbiA4LzE0LzE5IDEyOjQ0IFBNLCBEYXJpdXN6IE1hcmNp
bmtpZXdpY3ogd3JvdGU6Cj4+PiBUaGlzIHNlcmllcyB1cGRhdGVzIERSTSBkcml2ZXJzIHRvIHVz
ZSBuZXcgQ0VDIG5vdGlmaWVyIEFQSS4KPj4+Cj4+PiBDaGFuZ2VzIHNpbmNlIHY2Ogo+Pj4gCU1h
ZGUgQ0VDIG5vdGlmaWVycycgcmVnaXN0cmF0aW9uIGFuZCBkZS1yZWdpc3RyYXRpb24gc3ltbWV0
cmljCj4+PiAJaW4gdGRhOTk4eCBhbmQgZHctaGRtaSBkcml2ZXJzLiBBbHNvLCBhY2NpZGVudGFs
bHkgZHJvcHBlZCBvbmUKPj4+IAlwYXRjaCBpbiB2NiAoY2hhbmdlIHRvIGRybV9kcF9jZWMpLCBi
cm91Z2h0IGl0IGJhY2sgbm93Lgo+Pj4gQ2hhbmdlcyBzaW5jZSB2NToKPj4+ICAgICAgICAgRml4
ZWQgYSB3YXJuaW5nIGFib3V0IGEgbWlzc2luZyBjb21tZW50IGZvciBhIG5ldyBtZW1iZXIgb2YK
Pj4+IAlkcm1fZHBfYXV4X2NlYyBzdHJ1Y3QuIFNlbmRpbmcgdG8gYSB3aWRlciBhdWRpZW5jZSwK
Pj4+IAlpbmNsdWRpbmcgbWFpbnRhaW5lcnMgb2YgcmVzcGVjdGl2ZSBkcml2ZXJzLgo+Pj4gQ2hh
bmdlcyBzaW5jZSB2NDoKPj4+IAlBZGRyZXNzaW5nIHJldmlldyBjb21tZW50cy4KPj4+IENoYW5n
ZXMgc2luY2UgdjM6Cj4+PiAgICAgICAgIFVwZGF0ZWQgYWRhcHRlciBmbGFncyBpbiBkdy1oZG1p
LWNlYy4KPj4+IENoYW5nZXMgc2luY2UgdjI6Cj4+PiAJSW5jbHVkZSBhbGwgRFJNIHBhdGNoZXMg
ZnJvbSAiY2VjOiBpbXByb3ZlIG5vdGlmaWVyIHN1cHBvcnQsCj4+PiAJYWRkIGNvbm5lY3RvciBp
bmZvIGNvbm5lY3RvciBpbmZvIiBzZXJpZXMuCj4+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+Pj4gCVRo
b3NlIHBhdGNoZXMgZGVsYXkgY3JlYXRpb24gb2Ygbm90aWZpZXJzIHVudGlsIHJlc3BlY3RpdmUK
Pj4+IAljb25uZWN0b3JzIGFyZSBjb25zdHJ1Y3RlZC4gSXQgc2VlbXMgdGhhdCB0aG9zZSBwYXRj
aGVzLCBmb3IgYQo+Pj4gCWNvdXBsZSBvZiBkcml2ZXJzLCBieSBhZGRpbmcgdGhlIGRlbGF5LCBp
bnRyb2R1Y2UgYSByYWNlIGJldHdlZW4KPj4+IAlub3RpZmllcnMnIGNyZWF0aW9uIGFuZCB0aGUg
SVJRcyBoYW5kbGluZyB0aHJlYWRzIC0gYXQgbGVhc3QgSQo+Pj4gCWRvbid0IHNlZSBhbnl0aGlu
ZyBvYnZpb3VzIGluIHRoZXJlIHRoYXQgd291bGQgZXhwbGljaXRseSBmb3JiaWQKPj4+IAlzdWNo
IHJhY2VzIHRvIG9jY3VyLiB2MiBhZGRzIGEgd3JpdGUgYmFycmllciB0byBtYWtlIHN1cmUgSVJR
Cj4+PiAJdGhyZWFkcyBzZWUgdGhlIG5vdGlmaWVyIG9uY2UgaXQgaXMgY3JlYXRlZCAocmVwbGFj
aW5nIHRoZQo+Pj4gCVdSSVRFX09OQ0UgSSBwdXQgaW4gdjEpLiBUaGUgYmVzdCB0aGluZyB0byBk
byBoZXJlLCBJIGJlbGlldmUsCj4+PiAJd291bGQgYmUgbm90IHRvIGhhdmUgYW55IHN5bmNocm9u
aXphdGlvbiBhbmQgbWFrZSBzdXJlIHRoYXQgYW4gSVJRCj4+PiAJb25seSBnZXRzIGVuYWJsZWQg
YWZ0ZXIgdGhlIG5vdGlmaWVyIGlzIGNyZWF0ZWQuCj4+PiBEYXJpdXN6IE1hcmNpbmtpZXdpY3og
KDkpOgo+Pj4gICBkcm1fZHBfY2VjOiBhZGQgY29ubmVjdG9yIGluZm8gc3VwcG9ydC4KPj4+ICAg
ZHJtL2k5MTUvaW50ZWxfaGRtaTogdXNlIGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3Rlcgo+
Pj4gICBkdy1oZG1pLWNlYzogdXNlIGNlY19ub3RpZmllcl9jZWNfYWRhcF8odW4pcmVnaXN0ZXIK
Pj4+ICAgdGRhOTk1MDogdXNlIGNlY19ub3RpZmllcl9jZWNfYWRhcF8odW4pcmVnaXN0ZXIKPj4+
ICAgZHJtOiB0ZGE5OTh4OiB1c2UgY2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lzdGVyCj4+PiAg
IGRybTogc3RpOiB1c2UgY2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lzdGVyCj4+PiAgIGRybTog
dGVncmE6IHVzZSBjZWNfbm90aWZpZXJfY29ubl8odW4pcmVnaXN0ZXIKPj4+ICAgZHJtOiBkdy1o
ZG1pOiB1c2UgY2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lzdGVyCj4+PiAgIGRybTogZXh5bm9z
OiBleHlub3NfaGRtaTogdXNlIGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3Rlcgo+Pj4KPj4+
ICAuLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jICAgfCAgMiArLQo+
Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1jZWMuYyB8IDEzICsr
Ky0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jICAgICB8
IDQ2ICsrKysrKysrKysrKystLS0tLS0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2NlYy5j
ICAgICAgICAgICAgICAgICAgfCAyNSArKysrKystLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfaGRtaS5jICAgICAgICAgIHwgMzEgKysrKysrKy0tLS0tLQo+Pj4gIGRyaXZl
cnMvZ3B1L2RybS9pMmMvdGRhOTk1MC5jICAgICAgICAgICAgICAgICB8IDEyICsrLS0tCj4+PiAg
ZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jICAgICAgICAgICAgIHwgMzYgKysrKysr
KysrKy0tLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAg
ICAgIHwgIDQgKy0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWku
YyAgICAgfCAxMyArKysrLS0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nv
bm5lY3Rvci5jICAgfCAgMyArLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYyAg
ICAgICAgICAgICAgICB8IDE5ICsrKysrLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291
dHB1dC5jICAgICAgICAgICAgICAgIHwgMjggKysrKysrKystLS0KPj4+ICBpbmNsdWRlL2RybS9k
cm1fZHBfaGVscGVyLmggICAgICAgICAgICAgICAgICAgfCAxNyArKysrLS0tCj4+PiAgMTMgZmls
ZXMgY2hhbmdlZCwgMTU1IGluc2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQo+Pj4KPj4KPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
