Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335CCF80E1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 21:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78406E20C;
	Mon, 11 Nov 2019 20:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1500 seconds by postgrey-1.36 at gabe;
 Mon, 11 Nov 2019 20:15:47 UTC
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com
 [192.185.148.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACC46E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 20:15:47 +0000 (UTC)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 695F417AA1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 13:26:55 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id UFKxi7cLSqNtvUFKxiwgMU; Mon, 11 Nov 2019 13:26:55 -0600
X-Authority-Reason: nr=8
Received: from [187.192.2.30] (port=53146 helo=[192.168.43.131])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1iUFKw-002JG6-Nv; Mon, 11 Nov 2019 13:26:54 -0600
Subject: Re: [PATCH] drm/amd/display: Fix unsigned variable compared to less
 than zero
To: Mikita Lipski <mlipski@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mikita Lipski <mikita.lipski@amd.com>, Lyude Paul <lyude@redhat.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20191111172543.GA31748@embeddedor>
 <b5b41653-3536-b0f0-2f49-2c010370ec99@amd.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <cf7d4cfe-be29-39d8-8a5e-bac217475597@embeddedor.com>
Date: Mon, 11 Nov 2019 13:27:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b5b41653-3536-b0f0-2f49-2c010370ec99@amd.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.2.30
X-Source-L: No
X-Exim-ID: 1iUFKw-002JG6-Nv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [187.192.2.30]:53146
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 13
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j1lNzFsR5TFCQCYcMtUUHZaoihv3vYBTqK2f04Mcvn4=; b=C7bAEHOFjc6fl+7zJKVNDKwe6h
 yDhwXQ1JmZrVgP8z9BN8/cZCrCq+sQWl0q4MPaV64jdl0tDfE7mCMl7Ao5j/OfsWpiHfkFZ0xV5kh
 BUac57ZYnJNqyJ8ze3Xzm/KkoxZAVu/KSoPszzEsQnetd8SCKnwFD7wWsoxKmPHtlS7q/BaNiAQY6
 +TSEZYr+TF8jcpcLo5yWhwI13h2TfDy+UAoAxayLoaXVqS+aqe7VEh1qE+/XWRQAmHqYg2HJdpKVR
 Id9DK8eihYsgvJaFShmR70/6I9q3Zo1vshDW3m3yIu6HtHevpGrauBQH0yC38P9cQ0Oz683eVHgLF
 jdOxSZcQ==;
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxMS8xMS8xOSAxMTo0NiwgTWlraXRhIExpcHNraSB3cm90ZToKPiAKPiBUaGFua3MgZm9y
IGNhdGNoaW5nIGl0IQo+IAoKR2xhZCB0byBoZWxwIG91dC4gOikKCj4gUmV2aWV3ZWQtYnk6IE1p
a2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KPiAKClRoYW5rcwotLQpHdXN0YXZv
Cgo+IAo+IE9uIDExLjExLjIwMTkgMTI6MjUsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4+
IEN1cnJlbmx5LCB0aGUgZXJyb3IgY2hlY2sgYmVsb3cgb24gdmFyaWFibGUqdmNwaV9zbG90cyrC
oCBpcyBhbHdheXMKPj4gZmFsc2UgYmVjYXVzZSBpdCBpcyBhIHVpbnQ2NF90IHR5cGUgdmFyaWFi
bGUsIGhlbmNlLCB0aGUgdmFsdWVzCj4+IHRoaXMgdmFyaWFibGUgY2FuIGhvbGQgYXJlIG5ldmVy
IGxlc3MgdGhhbiB6ZXJvOgo+Pgo+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jOgo+PiA0ODcwwqDCoMKgwqDCoMKgwqDCoCBpZiAoZG1fbmV3X2Nvbm5l
Y3Rvcl9zdGF0ZS0+dmNwaV9zbG90cyA8IDApIHsKPj4gNDg3McKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIERSTV9ERUJVR19BVE9NSUMoImZhaWxlZCBmaW5kaW5nIHZjcGkgc2xvdHM6
ICVkXG4iLCAoaW50KWRtX25ld19jb25uZWN0b3Jfc3RhdMKgwqDCoMKgIGUtPnZjcGlfc2xvdHMp
Owo+PiA0ODcywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRtX25ld19j
b25uZWN0b3Jfc3RhdGUtPnZjcGlfc2xvdHM7Cj4+IDQ4NzPCoMKgwqDCoMKgwqDCoMKgIH0KPj4K
Pj4gRml4IHRoaXMgYnkgbWFraW5nKnZjcGlfc2xvdHMqwqAgb2YgaW50IHR5cGUKPj4KPj4gQWRk
cmVzc2VzLUNvdmVyaXR5OiAxNDg3ODM4ICgiVW5zaWduZWQgY29tcGFyZWQgYWdhaW5zdCAwIikK
Pj4gRml4ZXM6IGI0YzU3OGYwODM3OCAoImRybS9hbWQvZGlzcGxheTogQWRkIE1TVCBhdG9taWMg
cm91dGluZXMiKQo+PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhPGd1c3Rhdm9A
ZW1iZWRkZWRvci5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5oIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oCj4+IGluZGV4IDZkYjA3ZTllMzNhYi4uYThm
YzkwYTkyN2Q2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5oCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmgKPj4gQEAgLTQwMyw3ICs0MDMsNyBAQCBzdHJ1Y3QgZG1fY29u
bmVjdG9yX3N0YXRlIHsKPj4gwqDCoMKgwqDCoCBib29sIHVuZGVyc2Nhbl9lbmFibGU7Cj4+IMKg
wqDCoMKgwqAgYm9vbCBmcmVlc3luY19jYXBhYmxlOwo+PiDCoMKgwqDCoMKgIHVpbnQ4X3QgYWJt
X2xldmVsOwo+PiAtwqDCoMKgIHVpbnQ2NF90IHZjcGlfc2xvdHM7Cj4+ICvCoMKgwqAgaW50IHZj
cGlfc2xvdHM7Cj4+IMKgwqDCoMKgwqAgdWludDY0X3QgcGJuOwo+PiDCoCB9Owo+PiDCoCAtLSAy
LjIzLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
