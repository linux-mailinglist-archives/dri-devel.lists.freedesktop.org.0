Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ABE4B971
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 15:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0A3891A0;
	Wed, 19 Jun 2019 13:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360756E3C4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:10:33 +0000 (UTC)
Received: from 177.133.86.196.dynamic.adsl.gvt.net.br ([177.133.86.196]
 helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hdaKu-0003lN-SJ; Wed, 19 Jun 2019 13:09:13 +0000
Date: Wed, 19 Jun 2019 10:07:55 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1 12/22] docs: driver-api: add .rst files from the main
 dir
Message-ID: <20190619075843.3c2464ac@coco.lan>
In-Reply-To: <20190619104239.GM3419@hirez.programming.kicks-ass.net>
References: <cover.1560890771.git.mchehab+samsung@kernel.org>
 <b0d24e805d5368719cc64e8104d64ee9b5b89dd0.1560890772.git.mchehab+samsung@kernel.org>
 <CAKMK7uGM1aZz9yg1kYM8w2gw_cS6Eaynmar-uVurXjK5t6WouQ@mail.gmail.com>
 <20190619072218.4437f891@coco.lan>
 <20190619104239.GM3419@hirez.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kUis8RlFnZIYQf8+xYspbsUmtFv2CDpdqgxk8Iwezmw=; b=oYF2y7J++7EHsOgMjz4JWm+r3
 EuOm0pUiQxdbAxLc7j9HTZhJldolyFKOBFp7F4PndkRdjuWOpU/S7uSkkXzeAQHpLm8g9Q+j7tjAC
 XAxEm/3JR6uEUSpLsNDpFFx+cJZLH5JoAoXhzAL+pZogkf8306GZfSFyoadtjs7R/h4iEt7Jsx7ow
 I4LDLr+5UvssAjqxSyuWVen7ynH90p3t155tRcxQx3ByAnxH1QZspAXyhGWd24VxaIGfI8BtQBxY6
 OLAW1t5T4H4OfBhS08Ya83/PUuz5nyDqjODRMOT1DXA6vqcdDM+b91y7vMxvEd7V1DITXR2oN1VHM
 uHrahA7OQ==;
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Farhan Ali <alifm@linux.ibm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Jerry Hoemann <jerry.hoemann@hpe.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Linux MM <linux-mm@kvack.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, netdev <netdev@vger.kernel.org>,
 Alex Shi <alex.shi@linux.alibaba.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Guan Xuetao <gxt@pku.edu.cn>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Halil Pasic <pasic@linux.ibm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Jiri Slaby <jslaby@suse.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-crypto@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 Eric Farman <farman@linux.ibm.com>, linux-watchdog@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, linux-remoteproc@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-gpio <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 openipmi-developer@lists.sourceforge.net,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Johannes Thumshirn <morbidrsa@gmail.com>,
 linux-pwm <linux-pwm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Harry Wei <harryxiyou@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andreas =?UTF-8?B?RsOkcmJl?= =?UTF-8?B?cg==?= <afaerber@suse.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gV2VkLCAxOSBKdW4gMjAxOSAxMjo0MjozOSArMDIwMApQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6
QGluZnJhZGVhZC5vcmc+IGVzY3JldmV1OgoKPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAwNzoy
MjoxOEFNIC0wMzAwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4gPiBIaSBEYW5pZWws
Cj4gPiAKPiA+IEVtIFdlZCwgMTkgSnVuIDIwMTkgMTE6MDU6NTcgKzAyMDAKPiA+IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gZXNjcmV2ZXU6Cj4gPiAgIAo+ID4gPiBPbiBUdWUsIEp1
biAxOCwgMjAxOSBhdCAxMDo1NSBQTSBNYXVybyBDYXJ2YWxobyBDaGVoYWIKPiA+ID4gPG1jaGVo
YWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZTogIAo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLW1tLnJzdAo+
ID4gPiA+IGluZGV4IGZhMzBkZmNmYzNjOC4uYjBmOTQ4ZDg3MzNiIDEwMDY0NAo+ID4gPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS1tbS5yc3QKPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2dwdS9kcm0tbW0ucnN0Cj4gPiA+ID4gQEAgLTMyMCw3ICszMjAsNyBAQCBzdHJ1Y3QgOmM6
dHlwZTpgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyA8ZmlsZV9vcGVyYXRpb25zPmAgZ2V0X3VubWFw
cGVkX2FyZWEKPiA+ID4gPiAgZmllbGQgd2l0aCBhIHBvaW50ZXIgb24gOmM6ZnVuYzpgZHJtX2dl
bV9jbWFfZ2V0X3VubWFwcGVkX2FyZWFgLgo+ID4gPiA+Cj4gPiA+ID4gIE1vcmUgZGV0YWlsZWQg
aW5mb3JtYXRpb24gYWJvdXQgZ2V0X3VubWFwcGVkX2FyZWEgY2FuIGJlIGZvdW5kIGluCj4gPiA+
ID4gLURvY3VtZW50YXRpb24vbm9tbXUtbW1hcC5yc3QKPiA+ID4gPiArRG9jdW1lbnRhdGlvbi9k
cml2ZXItYXBpL25vbW11LW1tYXAucnN0ICAgIAo+ID4gPiAKPiA+ID4gUmFuZG9tIGRyaXZlLWJ5
IGNvbW1lbnQ6IENvdWxkIHdlIGNvbnZlcnQgdGhlc2UgaW50byBoeXBlcmxpbmtzIHdpdGhpbgo+
ID4gPiBzcGhpbnggc29tZWhvdywgd2l0aG91dCBtYWtpbmcgdGhlbSBsZXNzIHVzZWZ1bCBhcyBy
YXcgZmlsZSByZWZlcmVuY2VzCj4gPiA+ICh3aXRoIHZpbSBJIGNhbiBqdXN0IHR5cGUgJ2dmJyBh
bmQgaXQgd29ya3MsIGVtYWNzIHByb2JhYmx5IHRoZSBzYW1lKS4KPiA+ID4gLURhbmllbCAgCj4g
PiAKPiA+IFNob3J0IGFuc3dlcjogSSBkb24ndCBrbm93IGhvdyB2aW0vZW1hY3Mgd291bGQgcmVj
b2duaXplIFNwaGlueCB0YWdzLiAgCj4gCj4gTm8sIHRoZSBvdGhlciB3YXkgYXJvdW5kLCBTcGhp
bnggY2FuIHJlY29nbml6ZSBsb2NhbCBmaWxlcyBhbmQgdHJlYXQKPiB0aGVtIHNwZWNpYWwuIFRo
YXQgd2F5IHdlIGtlZXAgdGhlIHRleHQgcmVhZGFibGUuCj4gCj4gU2FtZSB3aXRoIHRoYXQgOmM6
ZnVuYzonZm9vJyBjcmFwLCB0aGF0IG5lZWRzIHRvIGRpZSwgYW5kIFNwaGlueCBuZWVkcwo+IHRv
IGJlIHRhdWdodCBhYm91dCBmb28oKS4KCkp1c3QgZGlkIGEgdGVzdCB0b2RheSBhdCBKb24ncyBl
eHRlbnNpb24gKHdpdGggaXMgY3VycmVudGx5IG9uIGEKc2VwYXJhdGUgYnJhbmNoKS4gQXQgbGVh
c3QgdGhlIHZlcnNpb24gdGhhdCBpdCBpcyB0aGVyZSBhdCBoaXMgYXV0b21hcmt1cApicmFuY2gg
c3RpbGwgbmVlZHMgc29tZSB3b3JrLCBhcyBpdCBjdXJyZW50bHkgYnJlYWtzIHRpdGxlcyBhbmQg
dGFibGVzOgoKCTYuNCA6YzpmdW5jOmByZXN5bmNfc3RhcnQoKWAsIDpjOmZ1bmM6YHJlc3luY19m
aW5pc2goKWAKCS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgkvZGV2ZWwvdjRs
L2RvY3MvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL21kL21kLWNsdXN0ZXIucnN0OjMyMzogV0FS
TklORzogVGl0bGUgdW5kZXJsaW5lIHRvbyBzaG9ydC4KCgoJL2RldmVsL3Y0bC9kb2NzL0RvY3Vt
ZW50YXRpb24vZHJpdmVyLWFwaS9zZXJpYWwvdHR5LnJzdDo3NDogV0FSTklORzogTWFsZm9ybWVk
IHRhYmxlLgoJVGV4dCBpbiBjb2x1bW4gbWFyZ2luIGluIHRhYmxlIGxpbmUgMzQuCgoJPT09PT09
PT09PT09PT09PT09PT09PT0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQoJOmM6ZnVuYzpgb3BlbigpYCAgICAgICAgICAgICAgICAgICAgICAg
IENhbGxlZCB3aGVuIHRoZSBsaW5lIGRpc2NpcGxpbmUgaXMgYXR0YWNoZWQgdG8KCi0KClRoYXQn
cyBzYWlkLCBvbmNlIGl0IGdldHMgZml4ZWQgdG8gYWRkcmVzcyB0aG9zZSBjb21wbGV4IGNhc2Vz
LCBhCnJlZ2V4IGxpa2U6CgoJXGJEb2N1bWVudGF0aW9uLyhbXHdcZFwtXF9cL10rKVwucnN0XGIK
CmNvdWxkIGJlIGNvbnZlcnRlZCB0byA6ZG9jOiB0YWcuIEl0IHNob3VsZCBiZSBzbWFydCBlbm91
Z2ggdG8gY29udmVydAp0aGUgcmVsYXRpdmUgcGF0aHMsIGFzIHdlIHJlZmVyIHRvIHRoZSBmaWxl
cyBmcm9tIHRoZSBnaXQgcm9vdCBkaXJlY3RvcnkKKHdpdGggbWFrZXMgYSBsb3Qgc2Vuc2UgdG8g
bWUpLCB3aGlsZSBTcGhpbnggOmRvYzogdXNlIHJlbGF0aXZlIHBhdGNoZXMKZnJvbSB0aGUgbG9j
YXRpb24gd2hlcmUgdGhlIHBhcnNlZCBmaWxlIGlzLgoKU29tZXRoaW5nIGxpa2UgdGhlIGVuY2xv
c2VkIHBhdGNoLgoKVGhhbmtzLApNYXVybwoKW1BBVENIXSBhdXRvbWFya3VwLnB5OiBjb252ZXJ0
IERvY3VtZW50YXRpb24vKiB0byBoeXBlcmxpbmtzCgpBdXRvLWNyZWF0ZSBoeXBlcmxpbmtzIHdo
ZW4gaXQgZmluZHMgYSBEb2N1bWVudGF0aW9uLy4uIG9jY3VycmVuY2UuCgpTaWduZWQtb2ZmLWJ5
OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vc3BoaW54L2F1dG9tYXJrdXAucHkgYi9Eb2N1bWVudGF0
aW9uL3NwaGlueC9hdXRvbWFya3VwLnB5CmluZGV4IDM5YzhmNGQ1YWY4Mi4uOWQ2OTI2YjYxMjQx
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3NwaGlueC9hdXRvbWFya3VwLnB5CisrKyBiL0Rv
Y3VtZW50YXRpb24vc3BoaW54L2F1dG9tYXJrdXAucHkKQEAgLTksNiArOSw3IEBACiBmcm9tIF9f
ZnV0dXJlX18gaW1wb3J0IHByaW50X2Z1bmN0aW9uCiBpbXBvcnQgcmUKIGltcG9ydCBzcGhpbngK
KyNpbXBvcnQgc3lzCQkjIEp1c3QgZm9yIGRlYnVnCiAKICMKICMgUmVnZXggbmFzdGluZXNzLiAg
T2YgY291cnNlLgpAQCAtMzEsMTAgKzMyLDI2IEBAIFJFX2xpdGVyYWwgPSByZS5jb21waWxlKHIn
XihccyopKC4qOjpccyp8XC5cLlxzK2NvZGUtYmxvY2s6Oi4qKSQnKQogIwogUkVfd2hpdGVzcCA9
IHJlLmNvbXBpbGUocideKFxzKiknKQogCisjCisjIEdldCBhIGRvY3VtZW50YXRpb24gcmVmZXJl
bmNlCisjCitSRV9kb2NfbGlua3MgPSByZS5jb21waWxlKHInXGJEb2N1bWVudGF0aW9uLyhbXHdc
ZFwtXF9cL10rKVwucnN0XGInKQorCisjCisjIERvYyBsaW5rIGZhbHNlLXBvc2l0aXZlcworIwor
UkVfZmFsc2VfZG9jX2xpbmtzID0gcmUuY29tcGlsZShyJzpyZWY6YFxzKkRvY3VtZW50YXRpb24v
W1x3XGRcLVxfXC9dK1wucnN0JykKKwogZGVmIE1hbmdsZUZpbGUoYXBwLCBkb2NuYW1lLCB0ZXh0
KToKICAgICByZXQgPSBbIF0KICAgICBwcmV2aW91cyA9ICcnCiAgICAgbGl0ZXJhbCA9IEZhbHNl
CisKKyAgICByZWxfZGlyID0gJycKKworICAgIGZvciBkZXB0aCBpbiByYW5nZSgwLCBkb2NuYW1l
LmNvdW50KCcvJykpOgorICAgICAgICByZWxfZGlyICs9ICIuLi8iCisKICAgICBmb3IgbGluZSBp
biB0ZXh0WzBdLnNwbGl0KCdcbicpOgogICAgICAgICAjCiAgICAgICAgICMgU2VlIGlmIHdlIG1p
Z2h0IGJlIGVuZGluZyBhIGxpdGVyYWwgYmxvY2ssIGFzIGRlbm90ZWQgYnkKQEAgLTYzLDcgKzgw
LDE3IEBAIGRlZiBNYW5nbGVGaWxlKGFwcCwgZG9jbmFtZSwgdGV4dCk6CiAgICAgICAgICMgTm9y
bWFsIGxpbmUgLSBwZXJmb3JtIHN1YnN0aXR1dGlvbnMuCiAgICAgICAgICMKICAgICAgICAgZWxz
ZToKLSAgICAgICAgICAgIHJldC5hcHBlbmQoUkVfZnVuY3Rpb24uc3ViKHInXDE6YzpmdW5jOmBc
MmBcMycsIGxpbmUpKQorICAgICAgICAgICAgbmV3X2xpbmUgPSBSRV9mdW5jdGlvbi5zdWIocidc
MTpjOmZ1bmM6YFwyYFwzJywgbGluZSkKKworICAgICAgICAgICAgaWYgbm90IFJFX2ZhbHNlX2Rv
Y19saW5rcy5zZWFyY2gobmV3X2xpbmUpOgorICAgICAgICAgICAgICAgIG5ld19saW5lID0gUkVf
ZG9jX2xpbmtzLnN1YihyJzpkb2M6YCcgKyByZWxfZGlyICsgcidcMWAnLCBuZXdfbGluZSkKKwor
ICMgICAgICAgICAgICMgSnVzdCBmb3IgZGVidWcgLSBzaG91bGQgYmUgcmVtb3ZlZCBvbiBwcm9k
dWN0aW9uCisgIyAgICAgICAgICAgaWYgbmV3X2xpbmUgIT0gbGluZToKKyAjICAgICAgICAgICAg
ICAgcHJpbnQgKCI9PT0+IiArIG5ld19saW5lLCBmaWxlPXN5cy5zdGRlcnIpCisKKyAgICAgICAg
ICAgIHJldC5hcHBlbmQobmV3X2xpbmUpCisKICAgICAgICAgIwogICAgICAgICAjIE1pZ2h0IHdl
IGJlIHN0YXJ0aW5nIGEgbGl0ZXJhbCBibG9jaz8gIElmIHNvIG1ha2Ugbm90ZSBvZgogICAgICAg
ICAjIHRoZSBmYWN0LgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
