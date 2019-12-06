Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5374D114C41
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 07:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E5A6E1E0;
	Fri,  6 Dec 2019 06:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993C96E1E0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 06:02:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BCC37AD10;
 Fri,  6 Dec 2019 06:02:19 +0000 (UTC)
Subject: Re: FAILED - [PATCH v2 3/3] drm/mgag200: Add workaround for HW that
 does not support 'startadd'
To: John Donnelly <john.p.donnelly@oracle.com>, Sasha Levin <sashal@kernel.org>
References: <20191126101529.20356-4-tzimmermann@suse.de>
 <20191128142337.1B32A217F5@mail.kernel.org>
 <53967A49-E729-409B-8FDD-019160FFF675@oracle.com>
 <68E1D255-8E73-4112-B966-AFE851389A34@oracle.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <41deb310-2bd9-a505-c712-a66471c99656@suse.de>
Date: Fri, 6 Dec 2019 07:02:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <68E1D255-8E73-4112-B966-AFE851389A34@oracle.com>
Content-Language: en-US
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, stable@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDA2LjEyLjE5IHVtIDAxOjQ4IHNjaHJpZWIgSm9obiBEb25uZWxseToKPiAKPiAKPj4g
T24gRGVjIDMsIDIwMTksIGF0IDExOjMwIEFNLCBKb2huIERvbm5lbGx5IDxqb2huLnAuZG9ubmVs
bHlAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+IEhlbGxvIFNhc2hhIGFuZCBUaG9tYXMgLAo+
Pgo+Pgo+PiBUaGlzIHBhcnRpY3VsYXIgcGF0Y2ggaGFzIGZhaWxlZCBvbiBvbmUgY2xhc3Mgb2Yg
c2VydmVycyB0aGF0IGhhcyBhIHNsaWdodGx5IGRpZmZlcmVudCBTdW4gVmVuZG9yLiBJRCBmb3Ig
IHRoZSBCTUMgdmlkZW8gZGV2aWNlOiAKPj4KPj4gSSB3aWxsIGZvbGxvdyB1cCB3aXRoIGFkZGl0
aW9uYWwgZGV0YWlscyBpbiAgdGhlIHJldmlldyBjb21tZW50cyBmb3IgdGhlIG9yaWdpbmFsIG1l
c3NhZ2UsLiAKPj4KPj4KPj4KPj4KPj4+IE9uIE5vdiAyOCwgMjAxOSwgYXQgODoyMyBBTSwgU2Fz
aGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPiB3cm90ZToKPj4+Cj4+PiBIaSwKPj4+Cj4+PiBb
VGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCj4+Pgo+Pj4gVGhpcyBjb21taXQgaGFzIGJlZW4g
cHJvY2Vzc2VkIGJlY2F1c2UgaXQgY29udGFpbnMgYSAiRml4ZXM6IiB0YWcsCj4+PiBmaXhpbmcg
Y29tbWl0OiA4MWRhODdmNjNhMWUgKCJkcm06IFJlcGxhY2UgZHJtX2dlbV92cmFtX3B1c2hfdG9f
c3lzdGVtKCkgd2l0aCBrdW5tYXAgKyB1bnBpbiIpLgo+Pj4KPj4+IFRoZSBib3QgaGFzIHRlc3Rl
ZCB0aGUgZm9sbG93aW5nIHRyZWVzOiB2NS4zLjEzLgo+Pj4KPj4+IHY1LjMuMTM6IEJ1aWxkIGZh
aWxlZCEgRXJyb3JzOgo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5j
OjEwNDoxODogZXJyb3I6IOKAmGRybV92cmFtX21tX2RlYnVnZnNfaW5pdOKAmSB1bmRlY2xhcmVk
IGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmGRybV9jbGllbnRfZGVi
dWdmc19pbml04oCZPwo+Pj4KPiAKPiAKPiAgICBJIGhhZCB0aGlzIHNhbWUgaXNzdWUgYW5kIHJl
bW92ZWQgdGhhdCBmcm9tIG15IGxvY2FsIDUuNC4wLXJjOCBidWlsZCAKClRoZSBib3QgdXNlZCB0
aGUgd3JvbmcgdHJlZS4gVGhlIHBhdGNoIGhhcyBiZWVuIHdyaXR0ZW4gYWdhaW5zdCBkcm0tdGlw
LgoKQmVzdCByZWdhcmRzClRob21hcwoKPiAKPiAKPiAKPiAKPj4+Cj4+PiBOT1RFOiBUaGUgcGF0
Y2ggd2lsbCBub3QgYmUgcXVldWVkIHRvIHN0YWJsZSB0cmVlcyB1bnRpbCBpdCBpcyB1cHN0cmVh
bS4KPj4+Cj4+PiBIb3cgc2hvdWxkIHdlIHByb2NlZWQgd2l0aCB0aGlzIHBhdGNoPwo+Pj4KPj4+
IC0tIAo+Pj4gVGhhbmtzLAo+Pj4gU2FzaGEKPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+PiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zw
b2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2xpc3RzLmZyZWVkZXNrdG9wLm9yZ19tYWlsbWFu
X2xpc3RpbmZvX2RyaS0yRGRldmVsJmQ9RHdJR2FRJmM9Um9QMVl1bUNYQ2dhV0h2bFpZUjhQWmg4
QnY3cUlyTVVCNjVlYXBJX0puRSZyPXQyZlBnOUQ4N0Y3RDhqbTBfM0NHOXlvaUlLZFJnNHFjX3Ro
Qnc0YnpNaGMmbT12eE1ET0xWNzdyUmUyZWtkTkZIOUl4TVNCUXJUY2NsdFpkOEExSDZ4WUNjJnM9
ZWZIczJsY19SUVl2ekxDODJjLUQzd2E4TXBYNURDVV9Zc0lvNlhydUFRZyZlPQo+Pgo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAoKLS0g
ClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCkdlc2Now6RmdHNmw7xocmVyOiBGZWxp
eCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
