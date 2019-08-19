Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2439285C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744896E1D3;
	Mon, 19 Aug 2019 15:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Mon, 19 Aug 2019 15:30:45 UTC
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [194.109.24.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8CF6E1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 15:30:45 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud9.xs4all.net with ESMTPA
 id zjVLhIEPszaKOzjVPhsB2z; Mon, 19 Aug 2019 17:23:35 +0200
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: omap4: how to obtain drm_connector in hdmi4_cec.c for
 cec_s_conn_info()?
Message-ID: <ceac551b-6871-2039-e6c5-2b93d09874f9@xs4all.nl>
Date: Mon, 19 Aug 2019 17:23:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4wfATdTQ/Pa/qcroA+qi4jWdEOjLxeLZ3KkMzRgpnAZrxSOm0IqJ1zBY2C5LrOmmccXzYtp4ltk4RX8Ix6yGnut6eqNJ4wLdwvNLnEDuP6HkYO+yVYMsLB
 DwGkt7KES2bxDmIs4/hKmSI4O5FcWqkoGAQXr5/Nm4NN5Mt0lzXj8droT8j+2WO+reQTGHoOuWOKVarKdl8KsRcupAar9LBPRPF4XwKBPZp4r86NJvluPMSD
 0UzXiieYqHsxfZfrT1SGSLw6jIHqdTsHT2mhs95Vuq3pEtf9WVySxchCyCJ+BADN
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
Cc: Dariusz Marcinkiewicz <darekm@google.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwgTGF1cmVudCwKCkZvciB0aGUgQ0VDIGZyYW1ld29yayB3ZSAoRGFyaXVzeiBhbmQg
bXlzZWxmKSBhcmUgd29ya2luZyBvbiBjb2RlIHRvIGFzc29jaWF0ZQphIGRybV9jb25uZWN0b3Ig
d2l0aCBhIENFQyBhZGFwdGVyLCBtYWtpbmcgaXQgZWFzaWVyIGZvciB1c2Vyc3BhY2UgdG8gbGlu
ayB0aGUKdHdvLgoKSW4gb3JkZXIgdG8gZG8gdGhhdCBJIG5lZWQgdGhlIGRybV9jb25uZWN0b3Ig
c3RydWN0dXJlIHdoZW4gY3JlYXRpbmcgdGhlCkNFQyBhZGFwdGVyIGluIGhkbWk0X2NlYy5jLiBU
aGF0J3MgZWFzeSBlbm91Z2ggaW4gdGhlIEdQVSBkcml2ZXJzLCBleGNlcHQgZm9yCnRoZSBvbWFw
LgoKSSBuZWVkIHRoZSBkcm1fY29ubmVjdG9yIGluIGhkbWk0X2NlY19pbml0KCkuIEFueSBpZGVh
IGhvdyB0byBvYnRhaW4gaXQKdGhyb3VnaCB0aGUgc2VlbWluZ2x5IGVuZGxlc3MgbGF5ZXJzIG9m
IGRhdGEgc3RydWN0dXJlcz8KClRoZSBjb2RlIGl0c2VsZiB0aGF0IG5lZWRzIHRvIGJlIGFkZGVk
IHRvIGhkbWk0X2NlY19pbml0KCkgaXMgZWFzeSBlbm91Z2g6CgoJc3RydWN0IGNlY19jb25uZWN0
b3JfaW5mbyBjb25uX2luZm87CgoJY2VjX2ZpbGxfY29ubl9pbmZvX2Zyb21fZHJtKCZjb25uX2lu
Zm8sIGNvbm5lY3Rvcik7CgljZWNfc19jb25uX2luZm8oY29yZS0+YWRhcCwgJmNvbm5faW5mbyk7
CgpidXQgZ2V0dGluZyB0aGUgZHJtX2Nvbm5lY3RvciBpcyB0aGUgaGFyZCBiaXQuCgpBcyBhbiBh
c2lkZTogSSBmaW5hbGx5IGZvdW5kIHNvbWUgdGltZSB0byBmaW5pc2ggbXkgd29yayBvbiB0aGUg
b21hcDUgQ0VDIHN1cHBvcnQuCkV4cGVjdCBwYXRjaGVzIGZvciB0aGlzIHNvb24uCgpSZWdhcmRz
LAoKCUhhbnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
