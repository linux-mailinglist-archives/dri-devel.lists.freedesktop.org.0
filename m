Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA3314744C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 00:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EB46FE98;
	Thu, 23 Jan 2020 23:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8B46FE98
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 23:06:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1579820769; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hgQq6Cm2C8WFWwe4zjX8Nmm79ZjwTRrTKn+plFJyrz8=;
 b=UJ85+P2fqnKbMEID6Do5hwwOYujm8jHarNTlPBh9ePCw6TAysi3CLj7baX7zuu24RyoBN+aj
 H6WQlGGkgewLohnPI9U54u+ThJfwT0dBQe9Xd4f+KEu+BhXGSTBWE5vhdNE6ir0qskDl89iO
 eXoK9Zuhz9B3h45OrXhEC3izpCA=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2a26dd.7f93eb5e9f80-smtp-out-n03;
 Thu, 23 Jan 2020 23:06:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 78051C4479F; Thu, 23 Jan 2020 23:06:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ADB32C43383;
 Thu, 23 Jan 2020 23:06:03 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 23 Jan 2020 15:06:03 -0800
From: abhinavk@codeaurora.org
To: =?UTF-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: Re: [EXT] Re: [PATCH] drm: fix HDR static metadata type field
 numbering
In-Reply-To: <20191128111418.GP1208@intel.com>
References: <1574865719-24490-1-git-send-email-laurentiu.palcu@nxp.com>
 <20191127151703.GJ1208@intel.com> <20191128083940.GC10251@fsr-ub1664-121>
 <20191128111418.GP1208@intel.com>
Message-ID: <b9631ab9b7329e8307a3dccb00807972@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: adelva@google.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org,
 dl-linux-imx <linux-imx@nxp.com>, aravindh@codeaurora.org,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUgYW5kIExhdXJlbnRpdQoKT24gMjAxOS0xMS0yOCAwMzoxNCwgVmlsbGUgU3lyasOk
bMOkIHdyb3RlOgo+IE9uIFRodSwgTm92IDI4LCAyMDE5IGF0IDA4OjM5OjQxQU0gKzAwMDAsIExh
dXJlbnRpdSBQYWxjdSB3cm90ZToKPj4gT24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDU6MTc6MDNQ
TSArMDIwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+PiA+IENhdXRpb246IEVYVCBFbWFpbAo+
PiA+Cj4+ID4gT24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDI6NDI6MzVQTSArMDAwMCwgTGF1cmVu
dGl1IFBhbGN1IHdyb3RlOgo+PiA+ID4gQWNjb3JkaW5nIHRvIENUQS04NjEgc3BlY2lmaWNhdGlv
biwgSERSIHN0YXRpYyBtZXRhZGF0YSBkYXRhIGJsb2NrIGFsbG93cyBhCj4+ID4gPiBzaW5rIHRv
IGluZGljYXRlIHdoaWNoIEhEUiBtZXRhZGF0YSB0eXBlcyBpdCBzdXBwb3J0cyBieSBzZXR0aW5n
IHRoZSBTTV8wIHRvCj4+ID4gPiBTTV83IGJpdHMuIEN1cnJlbnRseSwgb25seSBTdGF0aWMgTWV0
YWRhdGEgVHlwZSAxIGlzIHN1cHBvcnRlZCBhbmQgdGhpcyBpcwo+PiA+ID4gaW5kaWNhdGVkIGJ5
IHNldHRpbmcgdGhlIFNNXzAgYml0IHRvIDEuCj4+ID4gPgo+PiA+ID4gSG93ZXZlciwgdGhlIGNv
bm5lY3Rvci0+aGRyX3NpbmtfbWV0YWRhdGEuaGRtaV90eXBlMS5tZXRhZGF0YV90eXBlIGlzIGFs
d2F5cwo+PiA+ID4gMCwgYmVjYXVzZSBoZHJfbWV0YWRhdGFfdHlwZSgpIGluIGRybV9lZGlkLmMg
Y2hlY2tzIHRoZSB3cm9uZyBiaXQuCj4+ID4gPgo+PiA+ID4gVGhpcyBwYXRjaCBjb3JyZWN0cyB0
aGUgSERNSV9TVEFUSUNfTUVUQURBVEFfVFlQRTEgYml0IHBvc2l0aW9uLgo+PiA+Cj4+ID4gV2Fz
IGNvbmZ1c2VkIGZvciBhIHdoaWxlIHdoeSB0aGlzIGhhcyBldmVuIGJlZW4gd29ya25pbmcsIGJ1
dCBJIGd1ZXNzCj4+ID4gdGhhdCdzIGR1ZSB0byB1c2Vyc3BhY2UgcG9wdWxhdGluZyB0aGUgbWV0
YWRhdGEgaW5mb2ZyYW1lIGJsb2IgY29ycmVjdGx5Cj4+ID4gZXZlbiBpZiB3ZSBtaXNyZXBvcnRl
ZCB0aGUgbWV0YWRhdGEgdHlwZXMgaW4gdGhlIHBhcnNlZCBFRElEIG1ldGFkYXRhCj4+ID4gYmxv
Yi4KPj4gPgo+PiA+IEhtbS4gQWN0dWFsbHkgb24gZnVydGhlciBpbnNwZWN0aW9uIHRoaXMgYWxs
IHNlZW1zIHRvIGJlIGRlYWQgY29kZS4gVGhlCj4+ID4gb25seSB0aGluZyB3ZSBzZWVtIHRvIHVz
ZSBmcm9tIHRoZSBwYXJzZWQgRURJRCBtZXRhZGF0YSBzdHVmZiBpcwo+PiA+IGVvdGYgYml0bWFz
ay4gV2UgY2hlY2sgdGhhdCBpbiBkcm1faGRtaV9pbmZvZnJhbWVfc2V0X2hkcl9tZXRhZGF0YSgp
Cj4+ID4gYnV0IHdlIGRvbid0IGNoZWNrIHRoZSBtZXRhZGF0YSB0eXBlLgo+PiA+Cj4+ID4gTWF5
YmUgd2Ugc2hvdWxkIGp1c3QgbnVrZSB0aGlzIEVESUQgcGFyc2luZyBzdHVmZiBlbnRpcmVseT8g
U2VlbXMKPj4gPiBwcmV0dHkgbXVjaCBwb2ludGxlc3MuCj4+IAo+PiBJJ3ZlIGJlZW4gdGhpbmtp
bmcgYWJvdXQgdGhhdCBidXQgd2UgbWF5IG5lZWQgdGhlIHJlc3Qgb2YgdGhlIGZpZWxkcyAKPj4g
YXMKPj4gd2VsbCwgZXZlbiB0aG91Z2ggdGhleSdyZSBub3QgY3VycmVudGx5IHVzZWQuIEknbSBy
ZWZlcnJpbmcgdG8gc2luaydzCj4+IG1pbi9tYXggbHVtaW5hbmNlIGRhdGEuIFNob3VsZG4ndCB3
ZSBhbHNvIGNoZWNrIG1pbi9tYXggY2xsLCBiZXNpZGVzCj4+IGVvdGYsIHRvIG1ha2Ugc3VyZSB0
aGUgc291cmNlIGRvZXMgbm90IHBhc3MgaGlnaGVyL2xvd2VyIGx1bWluYW5jZQo+PiB2YWx1ZXMs
IHRoYW4gdGhlIHNpbmsgc3VwcG9ydHMsIGZvciBvcHRpbWFsIGNvbnRlbnQgcmVuZGVyaW5nPwo+
PiAKPj4gSG93ZXZlciwgQ1RBLTg2MSBpcyBub3QgdmVyeSBjbGVhciBvbiBob3cgYSBzaW5rIHNo
b3VsZCBiZWhhdmUgaWYKPj4gdGhlIENMTCB2YWx1ZXMgZXhjZWVkIHRoZSBhbGxvd2VkIHJhbmdl
Li4uIDovIEFsc28sIGlmIHRoZSBDTEwgcmFuZ2UgCj4+IG9yCj4+IHRoZSBGQUxMIHZhbHVlcyBw
YXNzZWQgaW4gdGhlIERSTSBpbmZvZnJhbWUgZXhjZWVkIHRoZSBzaW5rJ3MgCj4+IGFkdmVydGlz
ZWQKPj4gbWluL21heCB2YWx1ZXMsIEkgZ3Vlc3MgdGhlIHNpbmsgY2Fubm90IGdvIGxvd2VyL2hp
Z2hlciB0aGFuIGl0IGNhbgo+PiBhbnl3YXkuIEluIHdoaWNoIGNhc2UsIHdlIGRvbid0IHJlYWxs
eSBuZWVkIHRoZSByZXN0IG9mIHRoZSBIRFIgc3RhdGljCj4+IG1ldGFkYXRhIGJsb2NrIGFuZCBu
dWtpbmcgdGhhdCBwYXJ0IHNob3VsZCBiZSBvay4KPiAKPiBJJ20gdGhpbmtpbmcgd2Ugc2hvdWxk
IGp1c3QgY29uY2x1ZGUgdGhhdCBzdWNoIHVzZXJzcGFjZSBpcyBhCj4gYnVnZ3kgbWVzcyBhbmQg
ZGVzZXJ2ZXMgd2hhdGV2ZXIgaXQgZ2V0cy4KCltBYmhpbmF2XSBUaGUgZGlzcGxheSBkcml2ZXIg
Zm9yIE1TTSBjaGlwc2V0cyByZWxpZXMgb24gdGhlIGRybV9lZGlkLmMgCnBhcnNpbmcgZm9yIHRo
ZSBDRUEgZXh0ZW5zaW9uIGJsb2Nrcy4gVGhlIHBhcnRzIHdoaWNoIHVzZSB0aGlzIHNoYWxsIGJl
IApwb3N0ZWQgbGF0ZXIgd2hlbiB3ZSBwb3N0IG91ciBjaGFuZ2VzIGZvciBIRFIgc3VwcG9ydCBm
b3IgdGhlIGRpc3BsYXkgCmRyaXZlciBmb3IgTVNNIGNoaXBzZXQuIE1lYW53aGlsZSwgaWYgdGhl
cmUgYXJlIG5vIGZ1cnRoZXIgY29uY2VybnMgb24gCnRoaXMsIHdlIHdvdWxkIGxpa2UgdG8gZ28g
YWhlYWQgd2l0aCB0aGlzIGNoYW5nZSBhbmQgZ2V0IGl0IG1lcmdlZCBhcyAKaXRzIGFuIGltcG9y
dGFudCBidWcgZml4LiBUaGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
