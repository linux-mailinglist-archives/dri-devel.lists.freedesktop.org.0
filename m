Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05367D60F5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 13:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243AF6E26C;
	Mon, 14 Oct 2019 11:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0296E26C;
 Mon, 14 Oct 2019 11:09:30 +0000 (UTC)
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 912D420650;
 Mon, 14 Oct 2019 11:09:20 +0000 (UTC)
Date: Mon, 14 Oct 2019 19:09:12 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 07/11] dts: arm64: layerscape: add dma-ranges property to
 qoric-mc node
Message-ID: <20191014110911.GL12262@dragon>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <20190924181244.7159-8-nsaenzjulienne@suse.de>
 <20191014082847.GH12262@dragon>
 <f6262e61f858c6f50164416f4ea816e203c0704f.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6262e61f858c6f50164416f4ea816e203c0704f.camel@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571051370;
 bh=IGUjFKwdFvBuHDUBTTMUkHOqWN+qrspmIFd3EP+r5D0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u6lV4BvTYW8QqsNve4UmSk9Z5IRL6ls+Ne+fUJeDqE/2kdCy6p2B3zszdb8a3CGfJ
 zIUWNfhvJGX46ZQKGt0ADXS2mmtAPaMYHIMnAOQtJjH2drVoNnJIyH6+M8bbZA9fir
 CCH+HHdvDRmqPLE15mDMW7UZttO+u5rVp++pF3JE=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 mbrugger@suse.com, robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
 f.fainelli@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-tegra@vger.kernel.org, robh+dt@kernel.org,
 wahrenst@gmx.net, james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org,
 Li Yang <leoyang.li@nxp.com>, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTI6MDA6MjVQTSArMDIwMCwgTmljb2xhcyBTYWVueiBK
dWxpZW5uZSB3cm90ZToKPiBPbiBNb24sIDIwMTktMTAtMTQgYXQgMTY6MjggKzA4MDAsIFNoYXdu
IEd1byB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDA4OjEyOjM4UE0gKzAyMDAs
IE5pY29sYXMgU2FlbnogSnVsaWVubmUgd3JvdGU6Cj4gPiA+IHFvcmlxLW1jJ3MgZHBtYWNzIERN
QSBjb25maWd1cmF0aW9uIGlzIGluaGVyaXRlZCBmcm9tIHRoZWlyIHBhcmVudCBub2RlLAo+ID4g
PiB3aGljaCBhY3RzIGEgYnVzIGluIHRoaXMgcmVnYXJkLiBTbyBmYXIgaXQgbWFrZWQgYWxsIGRl
dmljZXMgYXMKPiA+ID4gZG1hLWNvaGVyZW50IGJ1dCBubyBkbWEtcmFuZ2VzIHJlY29tbWVuZGF0
aW9uIGlzIG1hZGUuCj4gPiA+IAo+ID4gPiBUaGUgdHJ1dGggaXMgdGhhdCB0aGUgdW5kZXJseWlu
ZyBpbnRlcmNvbm5lY3QgaGFzIERNQSBjb25zdHJhaW50cywgc28KPiA+ID4gYWRkIGFuIGVtcHR5
IGRtYS1yYW5nZXMgaW4gcW9yaXEtbWMncyBub2RlIGluIG9yZGVyIGZvciBEVCdzIERNQQo+ID4g
PiBjb25maWd1cmF0aW9uIGNvZGUgdG8gZ2V0IHRoZSBETUEgY29uc3RyYWludHMgZnJvbSBpdC4K
PiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5pY29sYXMgU2FlbnogSnVsaWVubmUgPG5zYWVu
emp1bGllbm5lQHN1c2UuZGU+Cj4gPiAKPiA+IFVwZGF0ZWQgc3ViamVjdCBwcmVmaXggYXMgJ2Fy
bTY0OiBkdHM6IC4uLicsIGFuZCBhcHBsaWVkIHRoZSBwYXRjaC4KPiAKPiBIaSBTaGF3biwKPiB0
aGVzZSB0d28gcGF0Y2hlcyBhcmUgbm8gbG9uZ2VyIG5lZWRlZC4gVGhpcyBzZXJpZXMgaGFzIGJl
ZW4gc3VwZXJzZWRlZCBieSB0aGlzCj4gcGF0Y2hbMV0gOTUxZDQ4ODU1ZCAoJ29mOiBNYWtlIG9m
X2RtYV9nZXRfcmFuZ2UoKSB3b3JrIG9uIGJ1cyBub2RlcycsIGF2YWlsYWJsZQo+IGluIGxpbnV4
LW5leHQpIHdoaWNoIGZpeGVkIHRoZSBpc3N1ZSBkaXJlY3RseSBpbiBPRiBjb2RlLgo+IAo+IFNv
cnJ5IGZvciB0aGUgbm9pc2UuCgpPa2F5LCB0aGFua3MgZm9yIGxldHRpbmcgbWUga25vdy4gIERy
b3BwZWQgdGhlbS4KClNoYXduCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
