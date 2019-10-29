Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F516E97E7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5686ECC7;
	Wed, 30 Oct 2019 08:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1763 seconds by postgrey-1.36 at gabe;
 Tue, 29 Oct 2019 19:31:49 UTC
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404736E5D9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 19:31:49 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out02.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1iPWl0-0004EV-T4; Tue, 29 Oct 2019 13:02:18 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1iPWl0-0006xT-3i; Tue, 29 Oct 2019 13:02:18 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20191029182320.GA17569@mwanda>
Date: Tue, 29 Oct 2019 14:02:11 -0500
In-Reply-To: <20191029182320.GA17569@mwanda> (Dan Carpenter's message of "Tue, 
 29 Oct 2019 21:23:20 +0300")
Message-ID: <87zhhjjryk.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1iPWl0-0006xT-3i; ; ; mid=<87zhhjjryk.fsf@x220.int.ebiederm.org>;
 ; ; hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX18PHyqhwTatudH41XJqOC8sC0I5jQ9SR2U=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa02.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 T_TooManySym_02,XMSubLong autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4788] *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa02 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa02 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Dan Carpenter <dan.carpenter@oracle.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 313 ms - load_scoreonly_sql: 0.03 (0.0%),
 signal_user_changed: 2.6 (0.8%), b_tie_ro: 1.79 (0.6%), parse: 0.60
 (0.2%), extract_message_metadata: 2.4 (0.8%), get_uri_detail_list:
 1.04 (0.3%), tests_pri_-1000: 3.2 (1.0%), tests_pri_-950: 0.99 (0.3%),
 tests_pri_-900: 0.84 (0.3%), tests_pri_-90: 25 (8.0%), check_bayes: 24
 (7.6%), b_tokenize: 6 (1.8%), b_tok_get_all: 7 (2.2%), b_comp_prob:
 1.64 (0.5%), b_tok_touch_all: 6 (2.0%), b_finish: 1.73 (0.6%),
 tests_pri_0: 264 (84.5%), check_dkim_signature: 0.37 (0.1%),
 check_dkim_adsp: 2.1 (0.7%), poll_dns_idle: 0.82 (0.3%), tests_pri_10:
 1.74 (0.6%), tests_pri_500: 5 (1.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] fbdev: potential information leak in do_fb_ioctl()
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
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
 Andrea Righi <righi.andrea@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cml0ZXM6Cgo+IFRoZSAi
Zml4IiBzdHJ1Y3QgaGFzIGEgMiBieXRlIGhvbGUgYWZ0ZXIgLT55d3JhcHN0ZXAgYW5kIHRoZQo+
ICJmaXggPSBpbmZvLT5maXg7IiBhc3NpZ25tZW50IGRvZXNuJ3QgbmVjZXNzYXJpbHkgY2xlYXIg
aXQuICBJdCBkZXBlbmRzCj4gb24gdGhlIGNvbXBpbGVyLgo+Cj4gRml4ZXM6IDFmNWUzMWQ3ZTU1
YSAoImZibWVtOiBkb24ndCBjYWxsIGNvcHlfZnJvbS90b191c2VyKCkgd2l0aCBtdXRleCBoZWxk
IikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20+Cj4gLS0tCj4gSSBoYXZlIDEzIG1vcmUgc2ltaWxhciBwbGFjZXMgdG8gcGF0Y2guLi4gIEkn
bSBub3QgdG90YWxseSBzdXJlIEkKPiB1bmRlcnN0YW5kIGFsbCB0aGUgaXNzdWVzIGludm9sdmVk
LgoKV2hhdCBJIGhhdmUgZG9uZSBpbiBhIHNpbWlsYXIgc2l0dWF0aW9uIHdpdGggc3RydWN0IHNp
Z2luZm8sIGlzIHRoYXQKd2hlcmUgdGhlIHN0cnVjdHVyZSBmaXJzdCBhcHBlYXJzIEkgaGF2ZSBp
bml0aWFsaXplZCBpdCB3aXRoIG1lbXNldCwKYW5kIHRoZW4gZmllbGQgYnkgZmllbGQuCgpUaGVu
IHdoZW4gdGhlIHN0cnVjdHVyZSBpcyBjb3BpZWQgSSBjb3B5IHRoZSBzdHJ1Y3R1cmUgd2l0aCBt
ZW1jcHkuCgpUaGF0IGVuc3VyZXMgYWxsIG9mIHRoZSBieXRlcyBpbiB0aGUgb3JpZ2luYWwgc3Ry
dWN0dXJlIGFyZSBpbml0aWFsaXplZAphbmQgdGhhdCBhbGwgb2YgdGhlIGJ5dGVzIGFyZSBjb3Bp
ZWQuCgpUaGUgZ29hbCBpcyB0byBhdm9pZCBtZW1vcnkgdGhhdCBoYXMgdmFsdWVzIG9mIHRoZSBw
cmV2aW91cyB1c2VycyBvZgp0aGF0IG1lbW9yeSByZWdpb24gZnJvbSBsZWFraW5nIHRvIHVzZXJz
cGFjZS4gIFdoaWNoIGRlcGVuZGluZyBvbiB3aG8KdGhlIHByZXZpb3VzIHVzZXIgb2YgdGhhdCBt
ZW1vcnkgcmVnaW9uIGlzIGNvdWxkIHRlbGwgdXNlcnNwYWNlCmluZm9ybWF0aW9uIGFib3V0IHdo
YXQgdGhlIGtlcm5lbCBpcyBkb2luZyB0aGF0IGl0IHNob3VsZCBub3QgYmUgYWxsb3dlZAp0byBm
aW5kIG91dC4KCkkgdHJpZWQgdG8gdHJhY2UgdGhyb3VnaCB3aGVyZSAiaW5mbyIgYW5kIHRodXMg
cHJlc3VtYWJseSAiaW5mby0+Zml4IiBpcwpjb21pbmcgZnJvbSBhbmQgb25seSBtYWRlIGl0IGFz
IGZhciBhcyAgcmVnaXN0ZXJfZnJhbWVidWZmZXIuICBHaXZlbgp0aGF0IEkgc3VzcGVjdCBhIGxv
Y2FsIG1lbXNldCwgYW5kIHRoZW4gYSBmaWVsZCBieSBmaWVsZCBjb3B5IHJpZ2h0CmJlZm9yZSBj
b3B5X3RvX3VzZXIgbWlnaHQgYmUgYSBzb3VuZCBzb2x1dGlvbi4gIEJ1dCBpY2suICBUaGF0IGlz
IGEgbG90Cm9mIGZpZWxkcyB0byBjb3B5LgoKCkVyaWMKCgoKPiAgZHJpdmVycy92aWRlby9mYmRl
di9jb3JlL2ZibWVtLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwo+IGluZGV4IDZmNmZjNzg1YjU0NS4uYjRjZTZhMjhh
ZWQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCj4gKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKPiBAQCAtMTEwOSw2ICsxMTA5LDcg
QEAgc3RhdGljIGxvbmcgZG9fZmJfaW9jdGwoc3RydWN0IGZiX2luZm8gKmluZm8sIHVuc2lnbmVk
IGludCBjbWQsCj4gIAkJCXJldCA9IC1FRkFVTFQ7Cj4gIAkJYnJlYWs7Cj4gIAljYXNlIEZCSU9H
RVRfRlNDUkVFTklORk86Cj4gKwkJbWVtc2V0KCZmaXgsIDAsIHNpemVvZihmaXgpKTsKPiAgCQls
b2NrX2ZiX2luZm8oaW5mbyk7Cj4gIAkJZml4ID0gaW5mby0+Zml4Owo+ICAJCWlmIChpbmZvLT5m
bGFncyAmIEZCSU5GT19ISURFX1NNRU1fU1RBUlQpCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
