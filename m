Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB8FEAC44
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2932A6EDF2;
	Thu, 31 Oct 2019 09:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC916ED35
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 19:26:36 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51])
 by out02.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1iPtby-000758-Jv; Wed, 30 Oct 2019 13:26:30 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in01.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1iPtbx-0007ls-C9; Wed, 30 Oct 2019 13:26:30 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Andrea Righi <andrea.righi@canonical.com>
References: <20191029182320.GA17569@mwanda>
 <87zhhjjryk.fsf@x220.int.ebiederm.org> <20191030074321.GD2656@xps-13>
Date: Wed, 30 Oct 2019 14:26:21 -0500
In-Reply-To: <20191030074321.GD2656@xps-13> (Andrea Righi's message of "Wed,
 30 Oct 2019 08:43:21 +0100")
Message-ID: <87r22ujaqq.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1iPtbx-0007ls-C9; ; ; mid=<87r22ujaqq.fsf@x220.int.ebiederm.org>;
 ; ; hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX19FbjDNGFR7y0rdUnCUnTTvGuw2gDijzYQ=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 T_TooManySym_02,XMSubLong autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4389] *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Andrea Righi <andrea.righi@canonical.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 731 ms - load_scoreonly_sql: 0.06 (0.0%),
 signal_user_changed: 3.1 (0.4%), b_tie_ro: 2.1 (0.3%), parse: 1.60
 (0.2%), extract_message_metadata: 14 (1.9%), get_uri_detail_list: 1.61
 (0.2%), tests_pri_-1000: 6 (0.8%), tests_pri_-950: 1.42 (0.2%),
 tests_pri_-900: 1.16 (0.2%), tests_pri_-90: 26 (3.6%), check_bayes: 25
 (3.4%), b_tokenize: 8 (1.1%), b_tok_get_all: 8 (1.1%), b_comp_prob:
 2.6 (0.4%), b_tok_touch_all: 3.1 (0.4%), b_finish: 0.69 (0.1%),
 tests_pri_0: 659 (90.2%), check_dkim_signature: 0.58 (0.1%),
 check_dkim_adsp: 10 (1.3%), poll_dns_idle: 0.44 (0.1%), tests_pri_10:
 2.3 (0.3%), tests_pri_500: 12 (1.6%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] fbdev: potential information leak in do_fb_ioctl()
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
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
Cc: linux-fbdev@vger.kernel.org, security@kernel.org,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Julia Lawall <Julia.Lawall@lip6.fr>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kcmVhIFJpZ2hpIDxhbmRyZWEucmlnaGlAY2Fub25pY2FsLmNvbT4gd3JpdGVzOgoKPiBPbiBU
dWUsIE9jdCAyOSwgMjAxOSBhdCAwMjowMjoxMVBNIC0wNTAwLCBFcmljIFcuIEJpZWRlcm1hbiB3
cm90ZToKPj4gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cml0ZXM6
Cj4+IAo+PiA+IFRoZSAiZml4IiBzdHJ1Y3QgaGFzIGEgMiBieXRlIGhvbGUgYWZ0ZXIgLT55d3Jh
cHN0ZXAgYW5kIHRoZQo+PiA+ICJmaXggPSBpbmZvLT5maXg7IiBhc3NpZ25tZW50IGRvZXNuJ3Qg
bmVjZXNzYXJpbHkgY2xlYXIgaXQuICBJdCBkZXBlbmRzCj4+ID4gb24gdGhlIGNvbXBpbGVyLgo+
PiA+Cj4+ID4gRml4ZXM6IDFmNWUzMWQ3ZTU1YSAoImZibWVtOiBkb24ndCBjYWxsIGNvcHlfZnJv
bS90b191c2VyKCkgd2l0aCBtdXRleCBoZWxkIikKPj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2Fy
cGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4+ID4gLS0tCj4+ID4gSSBoYXZlIDEz
IG1vcmUgc2ltaWxhciBwbGFjZXMgdG8gcGF0Y2guLi4gIEknbSBub3QgdG90YWxseSBzdXJlIEkK
Pj4gPiB1bmRlcnN0YW5kIGFsbCB0aGUgaXNzdWVzIGludm9sdmVkLgo+PiAKPj4gV2hhdCBJIGhh
dmUgZG9uZSBpbiBhIHNpbWlsYXIgc2l0dWF0aW9uIHdpdGggc3RydWN0IHNpZ2luZm8sIGlzIHRo
YXQKPj4gd2hlcmUgdGhlIHN0cnVjdHVyZSBmaXJzdCBhcHBlYXJzIEkgaGF2ZSBpbml0aWFsaXpl
ZCBpdCB3aXRoIG1lbXNldCwKPj4gYW5kIHRoZW4gZmllbGQgYnkgZmllbGQuCj4+IAo+PiBUaGVu
IHdoZW4gdGhlIHN0cnVjdHVyZSBpcyBjb3BpZWQgSSBjb3B5IHRoZSBzdHJ1Y3R1cmUgd2l0aCBt
ZW1jcHkuCj4+IAo+PiBUaGF0IGVuc3VyZXMgYWxsIG9mIHRoZSBieXRlcyBpbiB0aGUgb3JpZ2lu
YWwgc3RydWN0dXJlIGFyZSBpbml0aWFsaXplZAo+PiBhbmQgdGhhdCBhbGwgb2YgdGhlIGJ5dGVz
IGFyZSBjb3BpZWQuCj4+IAo+PiBUaGUgZ29hbCBpcyB0byBhdm9pZCBtZW1vcnkgdGhhdCBoYXMg
dmFsdWVzIG9mIHRoZSBwcmV2aW91cyB1c2VycyBvZgo+PiB0aGF0IG1lbW9yeSByZWdpb24gZnJv
bSBsZWFraW5nIHRvIHVzZXJzcGFjZS4gIFdoaWNoIGRlcGVuZGluZyBvbiB3aG8KPj4gdGhlIHBy
ZXZpb3VzIHVzZXIgb2YgdGhhdCBtZW1vcnkgcmVnaW9uIGlzIGNvdWxkIHRlbGwgdXNlcnNwYWNl
Cj4+IGluZm9ybWF0aW9uIGFib3V0IHdoYXQgdGhlIGtlcm5lbCBpcyBkb2luZyB0aGF0IGl0IHNo
b3VsZCBub3QgYmUgYWxsb3dlZAo+PiB0byBmaW5kIG91dC4KPj4gCj4+IEkgdHJpZWQgdG8gdHJh
Y2UgdGhyb3VnaCB3aGVyZSAiaW5mbyIgYW5kIHRodXMgcHJlc3VtYWJseSAiaW5mby0+Zml4IiBp
cwo+PiBjb21pbmcgZnJvbSBhbmQgb25seSBtYWRlIGl0IGFzIGZhciBhcyAgcmVnaXN0ZXJfZnJh
bWVidWZmZXIuICBHaXZlbgo+PiB0aGF0IEkgc3VzcGVjdCBhIGxvY2FsIG1lbXNldCwgYW5kIHRo
ZW4gYSBmaWVsZCBieSBmaWVsZCBjb3B5IHJpZ2h0Cj4+IGJlZm9yZSBjb3B5X3RvX3VzZXIgbWln
aHQgYmUgYSBzb3VuZCBzb2x1dGlvbi4gIEJ1dCBpY2suICBUaGF0IGlzIGEgbG90Cj4+IG9mIGZp
ZWxkcyB0byBjb3B5Lgo+Cj4gSSBrbm93IGl0IG1pZ2h0IHNvdW5kIHF1aXRlIGluZWZmaWNpZW50
LCBidXQgd2hhdCBhYm91dCBtYWtpbmcgc3RydWN0Cj4gZmJfZml4X3NjcmVlbmluZm8gX19wYWNr
ZWQ/Cj4KPiBUaGlzIGRvZXNuJ3Qgc29sdmUgb3RoZXIgcG90ZW50aWFsIHNpbWlsYXIgaXNzdWVz
LCBidXQgZm9yIHRoaXMKPiBwYXJ0aWN1bGFyIGNhc2UgaXQgY291bGQgYmUgYSByZWFzb25hYmxl
IGFuZCBzaW1wbGUgZml4LgoKSXQgaXMgcGFydCBvZiB0aGUgdXNlciBzcGFjZSBBQkkuICBBcyBz
dWNoIHlvdSBjYW4ndCBtb3ZlIHRoZSBmaWVsZHMuCgpFcmljCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
