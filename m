Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24E8D7BE5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71916E388;
	Tue, 15 Oct 2019 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 554 seconds by postgrey-1.36 at gabe;
 Tue, 15 Oct 2019 12:33:40 UTC
Received: from welho-filter4.welho.com (welho-filter4.welho.com [83.102.41.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB696E7E6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 12:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by welho-filter4.welho.com (Postfix) with ESMTP id 7C5874FB75;
 Tue, 15 Oct 2019 15:24:23 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp1.welho.com ([IPv6:::ffff:83.102.41.84])
 by localhost (welho-filter4.welho.com [::ffff:83.102.41.26]) (amavisd-new,
 port 10024)
 with ESMTP id DJdlGMKQ4NVu; Tue, 15 Oct 2019 15:24:22 +0300 (EEST)
Received: from mail.korsu.shacknet.nu (89-27-55-156.bb.dnainternet.fi
 [89.27.55.156])
 by welho-smtp1.welho.com (Postfix) with ESMTP id 9E6FE2A0;
 Tue, 15 Oct 2019 15:24:03 +0300 (EEST)
Received: from galatea (galatea.korsu.shacknet.nu [192.168.2.117])
 by mail.korsu.shacknet.nu (Postfix) with SMTP id AB7CD868;
 Tue, 15 Oct 2019 14:48:43 +0300 (EEST)
Received: by galatea (sSMTP sendmail emulation);
 Tue, 15 Oct 2019 14:48:43 +0300
Date: Tue, 15 Oct 2019 14:48:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <syrjala@sci.fi>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 14/15] staging/mgakms: Import matroxfb driver source
 code
Message-ID: <20191015114843.GB4104@sci.fi>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, b.zolnierkie@samsung.com,
 ajax@redhat.com, ville.syrjala@linux.intel.com, malat@debian.org,
 michel@daenzer.net, corbet@lwn.net, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-15-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014140416.28517-15-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, airlied@linux.ie,
 gregkh@linuxfoundation.org, michel@daenzer.net, corbet@lwn.net,
 malat@debian.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDQ6MDQ6MTVQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gT25seSBjb2RlIGlzIGJlaW5nIGNvcGllZCwgbm8gZnVuY3Rpb25hbCBjaGFu
Z2VzIGFyZSBtYWRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvbWdha21zL2c0NTBfcGxs
LmMgICAgICAgICB8ICA1MzkgKysrKythCgouLi4KClBlcnNvbmFsbHkgSSB3b3VsZCBzdGFydCBm
cm9tIHNjcmF0Y2guIEluIGZhY3Qgc29tZSB5ZWFycyAoKmNvdWdoKgpkZWNhZGUpIGFnbyBJIGRp
ZCBqdXN0IHRoYXQgYW5kIHN0YXJ0ZWQgd3JpdGluZyBhIG5ldyBkcml2ZXIgZm9yCm1hdHJveCBz
dHVmZi4gVW5mb3J0dW5hdGVseSBJIHJhbiBvdXQgb2Ygc3RlYW0gYWZ0ZXIgZmlndXJpbmcgb3V0
Cm1vc3Qgb2YgdGhlIGludGVyZXN0aW5nIGhhcmR3YXJlIHF1aXJrcyBhbmQgd2hhdG5vdCwgc28g
SSBuZXZlcgpmaW5pc2hlZCBpdC4gVGhlIGVuZCByZXN1bHQgaXMgdGhhdCBpdCBzdGlsbCBydW5z
IGluIHVzZXJzcGFjZQpidXQga2luZGEgbG9va3MgbGlrZSBhIGtlcm5lbCBkcml2ZXIgaWYgeW91
IHNxdWludCBhIGJpdC4KCkFueXdheXMsIEkganVzdCBzbGFwcGVkIGEgTUlUIGxpY2Vuc2Ugb24g
aXQgIGR1bXBlZCB0aGUgd2hvbGUKdGhpbmcgaGVyZToKaHR0cHM6Ly9naXRsYWIuY29tL3N5cmph
bGEvbWdhClRoZSBkZXZlbG9wbWVudCBoaXN0b3J5IHdhcywgc2hhbGwgd2Ugc2F5LCBub3QgcmVh
bGx5IHVzZWZ1bApzbyBJIGp1c3Qgc3F1YXNoZWQgaXQuCgpZb3UsIG9yIHNvbWVvbmUgZWxzZSwg
bWlnaHQgZmluZCBpdCBpbnRlcmVzdGluZy4gSSB0aGluayBpbgp0ZXJtcyBvZiBoYXJkd2FyZSBz
dXBwb3J0IGl0J3MgYSBzdXBlcnNldCBvZiBhbnkgb3RoZXIgZHJpdmVyLAphcGFydCBmcm9tIHRo
ZSBibG9iLgoKLS0gClZpbGxlIFN5cmrDpGzDpApzeXJqYWxhQHNjaS5maQpodHRwOi8vd3d3LnNj
aS5maS9+c3lyamFsYS8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
