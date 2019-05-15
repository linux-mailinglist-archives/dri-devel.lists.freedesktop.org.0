Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F6C1F610
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 15:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692A189291;
	Wed, 15 May 2019 13:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9BD89291
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 13:55:27 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4FDs8C1122182;
 Wed, 15 May 2019 13:55:25 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2sdnttvybk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 May 2019 13:55:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4FDsDEW122019;
 Wed, 15 May 2019 13:55:24 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2sgkx3g589-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 May 2019 13:55:24 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4FDtNF0030256;
 Wed, 15 May 2019 13:55:23 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 15 May 2019 06:55:22 -0700
Date: Wed, 15 May 2019 16:55:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/fb-helper: Fix drm_fb_helper_hotplug_event() NULL
 ptr argument
Message-ID: <20190515135516.GF19380@kadam>
References: <20190515132925.48867-1-noralf@tronnes.org>
 <20190515134014.GJ17751@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515134014.GJ17751@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905150087
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905150087
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
 bh=8Tr4yX+pqO3uY+Tnjk1O93/LfFYjRJpjea1GGWbuFmc=;
 b=q1qdfqltRXcg9IKb1aCZ61h3hMYWriEMMkUIHj2CbWpRMCzvCMEM2EYIGUdQ4NjTQplc
 98cN7zp38cWvGVFPeHz8NlGbmIm27COsmbYWdFpUpFZENuN8ublwUFMpOu53kiPaSQxH
 mhKgWKtpjQSjnA83AS0iBcTnC6IcguffbXM2PKIBwxtg9yGajyIxxYpqKuGGlmodh6wn
 hGFoYAZXhlCmllYN/hej89xrygJKoncDx+3R3eqFE+J+YyrhUYv4t79JC4n5mBRnlTT6
 9trfxjXgZ/qh9DHtMhUpUYeIVzjYXHyGQoNn3JVMY4aIryskft3RHoCG4seNNspF4XAe mg== 
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
Cc: kbuild test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDM6NDA6MTRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAwMzoyOToyNVBNICswMjAwLCBOb3JhbGYg
VHLDuG5uZXMgd3JvdGU6Cj4gPiBkcm1fZmJfaGVscGVyX2hvdHBsdWdfZXZlbnQoKSBzaG91bGQg
dG9sZXJhdGUgdGhlIGZiX2hlbHBlciBhcmd1bWVudCBiZWluZwo+ID4gTlVMTC4gQ29tbWl0IDAz
YTk2MDZlN2ZlZSAoImRybS9mYi1oZWxwZXI6IEF2b2lkIHJhY2Ugd2l0aCBEUk0gdXNlcnNwYWNl
IikKPiA+IGludHJvZHVjZWQgYSBmYl9oZWxwZXIgZGVyZWZlcmVuY2UgYmVmb3JlIHRoZSBOVUxM
IGNoZWNrLgo+ID4gRml4dXAgYnkgbW92aW5nIHRoZSBkZXJlZmVyZW5jZSBhZnRlciB0aGUgTlVM
TCBjaGVjay4KPiA+IAo+ID4gRml4ZXM6IDAzYTk2MDZlN2ZlZSAoImRybS9mYi1oZWxwZXI6IEF2
b2lkIHJhY2Ugd2l0aCBEUk0gdXNlcnNwYWNlIikKPiA+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVz
dCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5u
ZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiAKPiBBaCB0aGUgY2xhc3NpYyAiSSBzcG90dGVkIGEg
ZGVyZWYgYmVmb3JlIHlvdXIgTlVMTCBjaGVjaywgSSdtIGdvaW5nIHRvCj4gb3B0aW1pemUgdGhp
cyBhbGwgYXdheSBiZWNhdXNlIHlvdSBnb3QgaXQgd3JvbmciIG5vbnNlbnNlIGZyb20gZ2NjLiBJ
Cj4gdGhvdWdodCB0aGUga2VybmVsIHVzZXMgYSBzcGVjaWFsIGNvbXBpbGUgZmxhZyB0byBhdm9p
ZCB0aGlzIG9wdGltaXphdGlvbgo+IC4uLgoKVGhpcyBpcyBqdXN0IGEgbm9ybWFsIE5VTEwgZGVy
ZWZlcmVuY2UgYnVnLgoKWW91J3JlIHRoaW5raW5nIG9mIHRoZSBvbGQgdHVuLmMgdnVsbmVyYWJp
bGl0eS4gIFRoYXQgd2FzIGJhY2sgaW4gdGhlCmRheSBiZWZvcmUgd2Ugc3RhcnRlZCB1c2luZyAt
Zm5vLWRlbGV0ZS1udWxsLXBvaW50ZXItY2hlY2tzLiAgV2hhdApoYXBwZW5lZCB0aGVyZSB3YXMg
dGhlIGNvZGUgc2hvdWxkIGhhdmUgTlVMTCBkZXJlZmVyZW5jZWQgYW5kIE9vcHNlZCBidXQKR0ND
IG9wdGltaXplZCBpdCBhd2F5IGFuZCBpdCBlbmRlZCB1cCBiZWluZyBhIHByaXZpbGVnZSBlc2Nh
bGF0aW9uIGJ1ZwppbnN0ZWFkLgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
