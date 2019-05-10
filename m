Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC0719C24
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 13:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A77894EB;
	Fri, 10 May 2019 11:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3183 seconds by postgrey-1.36 at gabe;
 Fri, 10 May 2019 11:05:01 UTC
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B46B894EB;
 Fri, 10 May 2019 11:05:01 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4AAx1NB144244;
 Fri, 10 May 2019 11:03:44 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2s94bggas0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 11:03:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4AB16kE183844;
 Fri, 10 May 2019 11:01:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2scpy66rqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 11:01:43 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4AB1WHN021937;
 Fri, 10 May 2019 11:01:32 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 10 May 2019 04:01:31 -0700
Date: Fri, 10 May 2019 14:01:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Subject: Re: [PATCH 09/16] mmc: sdhci-xenon: use new match_string()
 helper/macro
Message-ID: <20190510110116.GB18105@kadam>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
 <20190508112842.11654-11-alexandru.ardelean@analog.com>
 <20190508122010.GC21059@kadam>
 <2ec6812d6bf2f33860c7c816c641167a31eb2ed6.camel@analog.com>
 <31be52eb1a1abbc99a24729f5c65619235cb201f.camel@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31be52eb1a1abbc99a24729f5c65619235cb201f.camel@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9252
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=764
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905100078
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9252
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=796 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905100078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=CfM0QyoiD2lceMf/MJC3mMjfCfXAd2/bfEOAWv0cJ2Q=;
 b=D51Bv0We8QTowc99zvTCIJuTCbSCXoc9B56Z8ExvQIyI9tdem+W93bgyBgMXVwunZ8pv
 4kxXOENcN94heTpPe2HdMrlJB2T3qCmEYwsZdQFLCZzVl7iwnIcB0+tOsj8a33pcDZ2b
 apaVZ8tiLXNzMfnoXrAtpjl+jnRLf4c9KQWuZg+PnEEgt/vdDBqRhVHpu/5TuzfI6BfK
 fi+8tUJU/aJFGtgdSqiKUrW3X2rQyYClgjiNr0e4R6bCAQx6tWNkz5Uq/nnWCSvgOzQY
 +Vw2Uu/Wf73/Oj/IUlLw1hBGhDnT3dAWjKij3V31FPg//vP2lgc79WQPCO9s4WRRuFde AQ== 
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDk6MTM6MjZBTSArMDAwMCwgQXJkZWxlYW4sIEFsZXhh
bmRydSB3cm90ZToKPiBPbiBXZWQsIDIwMTktMDUtMDggYXQgMTY6MjYgKzAzMDAsIEFsZXhhbmRy
dSBBcmRlbGVhbiB3cm90ZToKPiA+IE9uIFdlZCwgMjAxOS0wNS0wOCBhdCAxNToyMCArMDMwMCwg
RGFuIENhcnBlbnRlciB3cm90ZToKPiA+ID4gCj4gPiA+IAo+ID4gPiBPbiBXZWQsIE1heSAwOCwg
MjAxOSBhdCAwMjoyODozNVBNICswMzAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3JvdGU6Cj4gPiA+
ID4gLXN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgcGh5X3R5cGVzW10gPSB7Cj4gPiA+ID4gLSAg
ICAgImVtbWMgNS4wIHBoeSIsCj4gPiA+ID4gLSAgICAgImVtbWMgNS4xIHBoeSIKPiA+ID4gPiAt
fTsKPiA+ID4gPiAtCj4gPiA+ID4gIGVudW0geGVub25fcGh5X3R5cGVfZW51bSB7Cj4gPiA+ID4g
ICAgICAgRU1NQ181XzBfUEhZLAo+ID4gPiA+ICAgICAgIEVNTUNfNV8xX1BIWSwKPiA+ID4gPiAg
ICAgICBOUl9QSFlfVFlQRVMKPiA+ID4gCj4gPiA+IFRoZXJlIGlzIG5vIG5lZWQgZm9yIE5SX1BI
WV9UWVBFUyBub3cgc28geW91IGNvdWxkIHJlbW92ZSB0aGF0IGFzIHdlbGwuCj4gPiA+IAo+ID4g
Cj4gPiBJIHRob3VnaHQgdGhlIHNhbWUuCj4gPiBUaGUgb25seSByZWFzb24gdG8ga2VlcCBOUl9Q
SFlfVFlQRVMsIGlzIGZvciBwb3RlbnRpYWwgZnV0dXJlIHBhdGNoZXMsCj4gPiB3aGVyZSBpdCB3
b3VsZCBiZSBqdXN0IDEgYWRkaXRpb24KPiA+IAo+ID4gIGVudW0geGVub25fcGh5X3R5cGVfZW51
bSB7Cj4gPiAgICAgICBFTU1DXzVfMF9QSFksCj4gPiAgICAgICBFTU1DXzVfMV9QSFksCj4gPiAr
ICAgICAgRU1NQ181XzJfUEhZLAo+ID4gICAgICAgTlJfUEhZX1RZUEVTCj4gPiAgIH0KPiA+IAo+
ID4gRGVwZW5kaW5nIG9uIHN0eWxlL3ByZWZlcmVuY2Ugb2YgaG93IHRvIGRvIGVudW1zIChhbGxv
dyBjb21tYSBvbiBsYXN0Cj4gPiBlbnVtCj4gPiBvciBub3QgYWxsb3cgY29tbWEgb24gbGFzdCBl
bnVtIHZhbHVlKSwgYWRkaW5nIG5ldyBlbnVtIHZhbHVlcyB3b3VkbCBiZSAyCj4gPiBhZGRpdGlv
bnMgKyAxIGRlbGV0aW9uIGxpbmVzLgo+ID4gCj4gPiAgZW51bSB4ZW5vbl9waHlfdHlwZV9lbnVt
IHsKPiA+ICAgICAgIEVNTUNfNV8wX1BIWSwKPiA+IC0gICAgICBFTU1DXzVfMV9QSFkKPiA+ICsg
ICAgICBFTU0KPiA+IENfNV8xX1BIWSwKPiA+ICsgICAgICBFTU1DXzVfMl9QSFkKPiA+ICB9Cj4g
PiAKPiA+IEVpdGhlciB3YXkgKGxlYXZlIE5SX1BIWV9UWVBFUyBvciByZW1vdmUgTlJfUEhZX1RZ
UEVTKSBpcyBmaW5lIGZyb20gbXkKPiA+IHNpZGUuCj4gPiAKPiAKPiBQcmVmZXJlbmNlIG9uIHRo
aXMgPwo+IElmIG5vIG9iamVjdGlvbiBbbm9ib2R5IGluc2lzdHNdIEkgd291bGQga2VlcC4KPiAK
PiBJIGRvbid0IGZlZWwgc3Ryb25nbHkgYWJvdXQgaXQgW2Ryb3BwaW5nIE5SX1BIWV9UWVBFUyBv
ciBub3RdLgoKSWYgeW91IGVuZCB1cCByZXNlbmRpbmcgdGhlIHNlcmllcyBjb3VsZCB5b3UgcmVt
b3ZlIGl0LCBidXQgaWYgbm90IHRoZW4KaXQncyBub3Qgd29ydGggaXQuCgpyZWdhcmRzLApkYW4g
Y2FycGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
